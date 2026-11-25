package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * #199: the note box stops at 60 characters. The limit lives in two places, and both have to move together. The note
 * screen's state method loads 60 and stores it in the composer, where it drives the counter and the Share button, and
 * the composer also gets a text filter built with its own copy of 60, which is what stops the typing.
 *
 * The hook sits right before the composer's number is stored, with the filter already in its register, so the extension
 * can raise the filter's copy and hand back the number for the composer. The class and field names change per build, so
 * the site is read from the shape: an int field of the composer, loaded from that constant, followed by the composer's
 * InputFilter field, in one straight run of code.
 */
internal const val LONGER_NOTES = "longer_notes"
internal const val LONGER_NOTES_CALL = "Lapp/hushmessenger/extension/NoteLimit;->raise(Landroid/text/InputFilter;I)I"

private const val NOTE_SCREEN = "Lcom/facebook/presence/note/ui/creation/NotesCreationFragment;"
private const val NOTE_INPUT_FILTER = "Landroid/text/InputFilter;"
private const val NOTE_STOCK_LIMIT = 60

/** Where the composer's number is stored, and the registers holding that number and the text filter. */
internal class NoteLimitSite(val at: Int, val limit: Int, val filter: Int)

private fun Instruction.noteField() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.noteWrites(register: Int): Boolean {
    if (!opcode.setsRegister() || this !is OneRegisterInstruction) return false
    return registerA == register || (opcode.setsWideRegister() && registerA + 1 == register)
}

private fun Method.noteLimitAt(code: List<Instruction>, storeAt: Int): NoteLimitSite? {
    val store = code[storeAt]
    if (store.opcode != Opcode.IPUT_OBJECT) return null
    val filterField = store.noteField() ?: return null
    if (filterField.type != NOTE_INPUT_FILTER) return null
    store as TwoRegisterInstruction
    val filter = store.registerA
    val composer = store.registerB

    var at = storeAt - 1
    while (at >= 0) {
        val instruction = code[at]
        val field = instruction.noteField()
        if (instruction.opcode == Opcode.IPUT && field?.definingClass == filterField.definingClass && field.type == "I" &&
            (instruction as TwoRegisterInstruction).registerB == composer
        ) break
        if (instruction.noteWrites(filter) || instruction.noteWrites(composer)) return null
        at--
    }
    if (at < 0) return null

    val limit = (code[at] as TwoRegisterInstruction).registerA
    val loadAt = (at - 1 downTo 0).firstOrNull { code[it].noteWrites(limit) } ?: return null
    val load = code[loadAt]
    if (load.opcode != Opcode.CONST_16 || (load as NarrowLiteralInstruction).narrowLiteral != NOTE_STOCK_LIMIT) return null

    val targets = jumpTargets()
    if ((loadAt + 1..storeAt).any { it in targets || code[it] is OffsetInstruction }) return null
    return NoteLimitSite(at, limit, filter)
}

/** The one place this method hands the note limit to the composer, or null when it isn't the note screen's. */
internal fun Method.noteLimitSite(): NoteLimitSite? {
    if (definingClass != NOTE_SCREEN) return null
    val code = implementation?.instructions?.toList() ?: return null
    return code.indices.mapNotNull { noteLimitAt(code, it) }.singleOrNull()
}

internal val noteLimitMethods = methodCheck { _, method -> method.noteLimitSite() != null }

/** The note screen's state method, taken only while exactly one method has the shape. */
internal fun findLongerNotes(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(noteLimitMethods.methods(classes).singleOrNull())

private fun noteScreenChanged(method: Method): Nothing =
    throw PatchException("Messenger controls: the note screen's ${method.hookId()} no longer matches the tested build")

internal fun Method.validateLongerNotes() {
    noteLimitSite() ?: noteScreenChanged(this)
}

/** Both registers come from two-register field writes, so they always fit the call's four-bit form. */
internal fun MutableMethod.injectLongerNotes() {
    val site = noteLimitSite() ?: noteScreenChanged(this)
    addInstructions(
        site.at,
        """
            invoke-static {v${site.filter}, v${site.limit}}, $LONGER_NOTES_CALL
            move-result v${site.limit}
        """,
    )
}
