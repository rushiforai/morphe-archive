package app.template.patches.scores365.controls

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_365SCORES
import app.template.patches.shared.addInstructionsAtControlFlowLabelChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.hevalcontrols.hevalControlsPatch
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val SCORES365_EXTENSION = "extensions/scores365.mpe"
internal const val SCORES365_SETTINGS_ENTRY = "Lapp/template/extension/scores365/SettingsEntry;"

/** Categories of the 365Scores features. */
internal object Scores365ControlsCategory {
    const val SPOILER_FREE = "Spoiler-free"
    const val LEAGUES = "Leagues"
    const val DISPLAY = "Display"
}

/** The dev-only "Change Server" row the Settings page adds last; the new row is built like it. */
private const val DEV_ROW_TITLE = "Change Server"

/** A stable string of the Settings page's list builder, so the "Change Server" match is that page's. */
private const val NOTIFICATIONS_ROW_TITLE = "SETTINGS_CATEGORY_NOTIFICATIONS"

private const val BOLAO_ACTIVITY = "Lcom/scores365/bolao/BolaoWebActivity;"

private const val ROW_TITLE = "Patch settings"

/**
 * The Settings page's list builder (15.0.0: akg.t0): returns the ArrayList of rows, among them the
 * dev-only "Change Server" row built with `new xo7(String, int id, int icon)`.
 */
internal object SettingsListBuilderFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf(),
    strings = listOf(DEV_ROW_TITLE, NOTIFICATIONS_ROW_TITLE),
)

/**
 * The Settings page's row click handler (15.0.0: akg.N0(int)): a click on a row looks the row up
 * and, for the Bolao row, starts [BOLAO_ACTIVITY]; every other row is an item class with an int id
 * that selects the action.
 */
internal object SettingsRowClickFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I"),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it.opcode == Opcode.CONST_CLASS && ((it as ReferenceInstruction).reference as? TypeReference)?.type == BOLAO_ACTIVITY
        } == true
    },
)

private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference
private val MethodReference.smali get() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private val CONST_OPCODES = setOf(Opcode.CONST, Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST_HIGH16)

/**
 * The in-app entry point: a "Patch settings" row at the end of 365Scores' Settings page, and a
 * click hook that opens the screen when that row is tapped (SettingsEntry in extensions/scores365).
 * The row is an instance of the page's own row class, built like the dev-only "Change Server" row
 * (same constructor and icon attribute), with an id no stock row uses; the click handler asks the
 * extension first and skips the stock code for that id. It is part of the "Patch settings" patch,
 * so the screen can always be reached. Every site is found before the first edit.
 */
private val scores365ControlsEntryPatch = bytecodePatch(
    description = "Adds a \"Patch settings\" row to 365Scores' Settings screen.",
) {
    compatibleWith(COMPATIBILITY_365SCORES)

    extendWith(SCORES365_EXTENSION)

    execute {
        classDefBy(SCORES365_SETTINGS_ENTRY)

        val builder = SettingsListBuilderFingerprint.method
        val click = SettingsRowClickFingerprint.method
        if (builder.definingClass != click.definingClass) {
            throw PatchException("Settings page: the list builder (${builder.definingClass}) and the click handler (${click.definingClass}) are in different classes")
        }

        // --- The row, built like "Change Server". -------------------------------------------------
        val buildInsns = builder.instructions.toList()
        val titleAt = buildInsns.withIndex().filter { (_, insn) ->
            insn.opcode == Opcode.CONST_STRING && ((insn as ReferenceInstruction).reference as StringReference).string == DEV_ROW_TITLE
        }.map { it.index }.singleOrNull() ?: throw PatchException("Settings page: \"$DEV_ROW_TITLE\" is not loaded exactly once")
        val iconAt = titleAt - 1
        val iconInsn = buildInsns.getOrNull(iconAt)
        if (iconInsn == null || iconInsn.opcode !in CONST_OPCODES) {
            throw PatchException("Settings page: the \"$DEV_ROW_TITLE\" icon is not a constant (${iconInsn?.opcode})")
        }
        val icon = (iconInsn as WideLiteralInstruction).wideLiteral
        val newAt = (titleAt - 1 downTo maxOf(0, titleAt - 6)).firstOrNull { buildInsns[it].opcode == Opcode.NEW_INSTANCE }
            ?: throw PatchException("Settings page: no new-instance before \"$DEV_ROW_TITLE\"")
        val rowType = ((buildInsns[newAt] as ReferenceInstruction).reference as TypeReference).type
        val ctor = (titleAt + 1..minOf(buildInsns.lastIndex, titleAt + 3)).firstNotNullOfOrNull { index ->
            buildInsns[index].methodRef()?.takeIf {
                it.name == "<init>" && it.definingClass == rowType && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I", "I")
            }
        } ?: throw PatchException("Settings page: no ($rowType)(String, int, int) constructor after \"$DEV_ROW_TITLE\"")
        val returns = buildInsns.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        val returnAt = returns.singleOrNull()?.index ?: throw PatchException("Settings page: ${returns.size} return-object in the list builder, expected one")
        val list = (buildInsns[returnAt] as OneRegisterInstruction).registerA
        val locals = builder.implementation!!.registerCount - 1
        if (locals < 8 || list >= 16) throw PatchException("Settings page: the list builder has $locals locals, list in v$list")
        val base = if (list >= 4) 0 else 4

        // --- The click hook. ----------------------------------------------------------------------
        val clickInsns = click.instructions.toList()
        val instanceOfAt = clickInsns.withIndex().filter { (_, insn) ->
            insn.opcode == Opcode.INSTANCE_OF && ((insn as ReferenceInstruction).reference as? TypeReference)?.type == rowType
        }.map { it.index }.singleOrNull() ?: throw PatchException("Settings page click handler: no single instance-of $rowType")
        val idGetAt = (instanceOfAt + 1 until minOf(clickInsns.size, instanceOfAt + 8)).filter { index ->
            val field = clickInsns[index].fieldRef()
            clickInsns[index].opcode == Opcode.IGET && field?.definingClass == rowType && field.type == "I"
        }.singleOrNull() ?: throw PatchException("Settings page click handler: no single int id read from $rowType")
        val id = (clickInsns[idGetAt] as OneRegisterInstruction).registerA
        val valuesAt = idGetAt + 1
        val values = clickInsns.getOrNull(valuesAt)?.methodRef()
        if (clickInsns[valuesAt].opcode != Opcode.INVOKE_STATIC || values?.name != "values" || clickInsns.getOrNull(valuesAt + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) {
            throw PatchException("Settings page click handler: the id read is not followed by values()")
        }
        // The array register of values() is written right after our check and dead before it.
        val scratch = (clickInsns[valuesAt + 1] as OneRegisterInstruction).registerA
        // The hook gets its Context from the fragment (p0.requireContext()), so it needs p0 intact.
        val thisReg = click.implementation!!.registerCount - 2
        // Only code before the hook matters: later writes happen after p0 was read.
        for ((index, insn) in clickInsns.withIndex().take(valuesAt)) {
            if (insn.opcode.setsRegister() && (insn as? OneRegisterInstruction)?.registerA == thisReg) {
                throw PatchException("Settings page click handler: p0 (v$thisReg) is overwritten at $index")
            }
        }
        if (thisReg >= 16 || id >= 16 || scratch >= 16) {
            throw PatchException("Settings page click handler: registers v$thisReg/v$id/v$scratch are out of 4-bit range")
        }
        click.requireNoBranchTargetAt(valuesAt, "Patch settings click")

        // Edit: the click hook first (indexes of the builder are untouched by it: another method).
        click.addInstructionsWithLabelsChecked(
            valuesAt,
            """
                invoke-virtual/range { v$thisReg .. v$thisReg }, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;
                move-result-object v$scratch
                invoke-static { v$scratch, v$id }, $SCORES365_SETTINGS_ENTRY->handles(Landroid/content/Context;I)Z
                move-result v$scratch
                if-eqz v$scratch, :patch_settings_stock
                return-void
            """,
            ExternalLabel("patch_settings_stock", click.getInstruction(valuesAt)),
        )

        builder.addInstructionsAtControlFlowLabelChecked(
            returnAt,
            """
                new-instance v$base, $rowType
                const-string v${base + 1}, "$ROW_TITLE"
                const v${base + 2}, 0x5EE7
                const v${base + 3}, $icon
                invoke-direct/range { v$base .. v${base + 3} }, ${ctor.smali}
                invoke-virtual { v$list, v$base }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            """,
        )
    }
}

/** The 365Scores Patch settings host; the switchable 365Scores patches are its feature patches. */
internal val scores365Controls = hevalControlsPatch(
    COMPATIBILITY_365SCORES,
    dependencies = setOf(scores365ControlsEntryPatch),
)

// Expose the host patch, so Manager lists "Patch settings".
@Suppress("unused")
val scores365HevalControlsPatch = scores365Controls.patch
