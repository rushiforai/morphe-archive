package app.afterglow.patches.menus

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.smali
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.getFreeRegisterProvider
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val MENU_ROWS_CLASS = "$EXTENSION_PACKAGE/menus/MenuRows;"
private const val TEXT_MISSING = "Text missing for BottomSheetMenuItem."
private const val J_OPTIONAL = "Lj\$/util/Optional;"

/** Number of menu row builders in 21.43.523. */
private const val MENU_ROW_BUILDERS = 2

/**
 * Builds one row of a video menu (the "⋮" bottom sheet) from its menu item renderer: reads the
 * row's icon and text, and returns nothing when the text is missing.
 *
 * 21.43.523: `Larow;->x(Lauvr;)Lj$/util/Optional;` (classes2.dex) and
 * `Lauvp;->aV(Lbjdz;)Laytk;` (classes6.dex). Both read the icon with `Lajoz;->aC(Lbjdz;)Lbgdg;`
 * and its type from `Lbgdg;->c:I` (YouTube's IconType number, enum `Lbgdf;`).
 */
internal object MenuRowBuilderFingerprint : Fingerprint(
    filters = listOf(string(TEXT_MISSING)),
)

/**
 * Leaves menu rows out by their icon type, which does not depend on the language: right after a
 * builder reads the row's icon, `MenuRows.hideRow(iconType)` decides, and a hidden row is
 * returned as the builder's own "no row" value (what it returns when the text is missing).
 * The rows are Views, not Litho components, so the Litho filter cannot see them.
 */
internal val menuRowsHookPatch = bytecodePatch(
    description = "Lets Afterglow leave rows out of YouTube's video menus.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)

    execute {
        val builders = MenuRowBuilderFingerprint.matchAll()
        if (builders.size != MENU_ROW_BUILDERS) {
            throw PatchException("Expected $MENU_ROW_BUILDERS menu row builders, found ${builders.size}")
        }

        builders.forEach { match ->
            val method = match.method
            val instructions = method.implementation!!.instructions

            // The icon type field: read right before YouTube converts the number to its IconType.
            val iconTypeRead = instructions.indices.firstOrNull { index ->
                val read = instructions[index]
                val next = instructions.getOrNull(index + 1)
                read.opcode == Opcode.IGET &&
                    ((read as ReferenceInstruction).reference as FieldReference).type == "I" &&
                    next?.opcode == Opcode.INVOKE_STATIC &&
                    ((next as ReferenceInstruction).reference as MethodReference).parameterTypes.map { it.toString() } == listOf("I")
            } ?: throw PatchException("No icon type read in $method")
            val iconTypeField = (instructions[iconTypeRead] as ReferenceInstruction).reference as FieldReference

            // The call that returns the row's icon, and the register its result lands in.
            val iconCall = instructions.indices.firstOrNull { index ->
                val call = instructions[index]
                call.opcode == Opcode.INVOKE_STATIC &&
                    ((call as ReferenceInstruction).reference as MethodReference).returnType == iconTypeField.definingClass &&
                    instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
            } ?: throw PatchException("No icon read in $method")
            val insertIndex = iconCall + 2
            val iconRegister = (instructions[iconCall + 1] as OneRegisterInstruction).registerA
            if (iconRegister > 15) throw PatchException("Icon register v$iconRegister is too high in $method")

            // What the builder returns for "no row".
            val noRow = if (method.returnType == J_OPTIONAL) {
                null
            } else {
                val textMissing = instructions.indexOfFirst { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == TEXT_MISSING
                }
                val absent = (textMissing + 1 until instructions.size).firstOrNull { index ->
                    instructions[index].opcode == Opcode.SGET_OBJECT
                } ?: throw PatchException("No empty row value in $method")
                (instructions[absent] as ReferenceInstruction).reference as FieldReference
            }

            val free = method.getFreeRegisterProvider(insertIndex, 1, iconRegister).getFreeRegister4Bit()
            val returnNoRow = if (noRow == null) {
                """
                    invoke-static { }, $J_OPTIONAL->empty()$J_OPTIONAL
                    move-result-object v$free
                """
            } else {
                "sget-object v$free, ${noRow.smali}"
            }

            method.addInstructionsWithLabels(
                insertIndex,
                """
                    if-eqz v$iconRegister, :afterglow_keep_menu_row
                    iget v$free, v$iconRegister, ${iconTypeField.smali}
                    invoke-static { v$free }, $MENU_ROWS_CLASS->hideRow(I)Z
                    move-result v$free
                    if-eqz v$free, :afterglow_keep_menu_row
                    $returnNoRow
                    return-object v$free
                    :afterglow_keep_menu_row
                    nop
                """,
            )
        }
    }
}
