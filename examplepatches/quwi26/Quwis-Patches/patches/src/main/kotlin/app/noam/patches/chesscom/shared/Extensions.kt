package app.noam.patches.chesscom.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal fun Method.instructionList(): List<Instruction> =
    implementation?.instructions?.toList()
        ?: throw PatchException("$name has no implementation")

internal fun Method.indexOfFirst(startIndex: Int = 0, predicate: (Instruction) -> Boolean): Int {
    val instructions = instructionList()
    for (index in startIndex until instructions.size) {
        if (predicate(instructions[index])) return index
    }
    return -1
}

internal fun Method.indexOfFirstOrThrow(
    startIndex: Int = 0,
    description: String,
    predicate: (Instruction) -> Boolean,
): Int = indexOfFirst(startIndex, predicate).also {
    if (it < 0) throw PatchException("Could not find $description in $name")
}

internal fun Method.indexOfLast(endIndex: Int, predicate: (Instruction) -> Boolean): Int {
    val instructions = instructionList()
    for (index in (endIndex - 1) downTo 0) {
        if (predicate(instructions[index])) return index
    }
    return -1
}

internal fun MutableMethod.returnString(value: String) {
    replaceInstruction(0, "const-string v0, \"$value\"")
}

/**
 * A data class's getter for the field its toString() prints after the label (", mode=" and the
 * like), so obfuscated getter names need not be known. Kotlin reads every field into a register
 * first and appends them later, so the label's value register is traced back to its field.
 */
internal fun MutableClass.getterForLabel(label: String): MutableMethod {
    val code = methods.single { it.name == "toString" }.instructionList()
    val at = code.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == label }
    // label, append(label), append(value)
    val value = (code.getOrNull(at + 2) as? FiveRegisterInstruction)?.registerD?.takeIf { at >= 0 }
        ?: throw PatchException("$type has no $label")
    val field = code.take(at).lastOrNull { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        reference?.definingClass == type && (instruction as? TwoRegisterInstruction)?.registerA == value
    }?.let { (it as ReferenceInstruction).reference as FieldReference }
        ?: throw PatchException("$type's $label is not a field")
    return methods.firstOrNull { method ->
        method.parameterTypes.isEmpty() && method.returnType == field.type && !method.name.startsWith("component") &&
            method.implementation?.instructions?.toList()?.let { body ->
                body.size == 2 && ((body[0] as? ReferenceInstruction)?.reference as? FieldReference)?.name == field.name
            } == true
    } ?: throw PatchException("$type has no getter for $label")
}

/** chess.com's Compose bottom bar button: (row, icon, label, modifier, enabled, colour, flag, onHold, onClick, composer, changed, defaults). */
internal val COMPOSE_BOTTOM_BUTTON = listOf(
    "Lcom/google/android/u16;", "I", "Ljava/lang/String;", "Landroidx/compose/ui/b;", "Z",
    "Lcom/google/android/xl0;", "Z", "Lkotlin/jvm/functions/Function1;",
    "Lkotlin/jvm/functions/Function0;", "Landroidx/compose/runtime/a;", "I", "I",
)

/** The app's own bar button call in a Compose bar method, if there is one. */
internal fun Method.composeBarButton(): MethodReference? = implementation?.instructions?.asSequence()
    ?.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
    ?.lastOrNull { reference ->
        reference.parameterTypes.map(CharSequence::toString) == COMPOSE_BOTTOM_BUTTON
    }

/**
 * Adds Arrows and Clear to a bar built from chess.com's own Compose buttons, after the last one it
 * draws. [show] is the extension's gate ("show" for games, "reviewsShow" for reviews).
 */
context(context: BytecodePatchContext)
internal fun MutableMethod.addArrowsBarButtons(show: String) {
    val code = instructionList()
    val last = code.indexOfLast { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference != null && reference.parameterTypes.map(CharSequence::toString) == COMPOSE_BOTTOM_BUTTON
    }
    if (last < 0) throw PatchException("The Compose bar buttons were not found in $name")
    val base = (code[last] as? RegisterRangeInstruction)?.startRegister
        ?: throw PatchException("The Compose bar button is not an invoke/range in $name")
    val button = (code[last] as ReferenceInstruction).reference as MethodReference
    val call = "${button.definingClass}->${button.name}(${button.parameterTypes.joinToString("")})V"
    val row = "v$base"
    val icon = "v${base + 1}"
    val label = "v${base + 2}"
    val onClick = "v${base + 8}"
    val changed = "v${base + 10}"
    val mask = "v${base + 11}"
    val arrows = """
        move-result $icon
        invoke-static { }, ${Constants.EXTENSION_PACKAGE}/arrows/ArrowsBar;->arrowsLabel()Ljava/lang/String;
        move-result-object $label
        invoke-static { }, ${Constants.EXTENSION_PACKAGE}/arrows/ArrowsBar;->onArrows()Lkotlin/jvm/functions/Function0;
        move-result-object $onClick
        const/4 $changed, 0x0
        const/16 $mask, 0x7c
        invoke-static/range { $row .. v${base + 11} }, $call
    """
    val clear = """
        move-result $icon
        invoke-static { }, ${Constants.EXTENSION_PACKAGE}/arrows/ArrowsBar;->clearLabel()Ljava/lang/String;
        move-result-object $label
        invoke-static { }, ${Constants.EXTENSION_PACKAGE}/arrows/ArrowsBar;->onClear()Lkotlin/jvm/functions/Function0;
        move-result-object $onClick
        const/4 $changed, 0x0
        const/16 $mask, 0x7c
        invoke-static/range { $row .. v${base + 11} }, $call
    """
    val after = code.getOrNull(last + 1)
    if (after == null) {
        addInstructions(
            last + 1,
            """
                invoke-static { }, ${Constants.EXTENSION_PACKAGE}/arrows/ArrowsBar;->arrowsIcon()I
                $arrows
                invoke-static { }, ${Constants.EXTENSION_PACKAGE}/arrows/ArrowsBar;->clearIcon()I
                $clear
            """,
        )
        return
    }
    addInstructionsWithLabels(
        last + 1,
        """
            invoke-static { }, ${Constants.EXTENSION_PACKAGE}/arrows/ArrowsBar;->$show()Z
            move-result v0
            if-eqz v0, :morphe_arrows_bar

            invoke-static { }, ${Constants.EXTENSION_PACKAGE}/arrows/ArrowsBar;->arrowsIcon()I
            $arrows
            invoke-static { }, ${Constants.EXTENSION_PACKAGE}/arrows/ArrowsBar;->clearIcon()I
            $clear
        """,
        ExternalLabel("morphe_arrows_bar", after),
    )
}
