package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * A story page's completion. A photo's timer, a finished video and a card that failed to load all end in it: it logs
 * story_playback_finished, then hands the page to the viewer's callback, which moves to the next card, the next
 * person's stories, or out of the viewer after the last one. Taps and swipes move the viewer without it.
 */
internal const val STORY_HOLD = "story_hold"

internal const val STORY_FINISHED = "story_playback_finished"

internal const val MONTAGE_VIEWER = "Lcom/facebook/messaging/montage/viewer/MontageViewerFragment;"

private fun storyHoldChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the story completion changed ($detail)")

private fun Method.strings() =
    implementation?.instructions?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }.orEmpty()

/** Where the completion hands its page on, and a local register the guard can write there. */
internal class StoryAdvance(val index: Int, val callback: MethodReference, val scratch: Int)

/**
 * The completion's hand-off: its one instance call of a (page)V method on an object it has just null-checked, with
 * `this` as the page, followed by its return. Nothing may jump straight to that call, so the guard placed before it
 * runs on every way in. Null when the method isn't a completion of that shape or has no local register to spare.
 */
internal fun Method.storyAdvance(): StoryAdvance? {
    if (!AccessFlags.PUBLIC.isSet(accessFlags) || AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.isNotEmpty() || returnType != "V") return null
    val code = implementation?.instructions?.toList() ?: return null
    if (STORY_FINISHED !in strings()) return null
    val page = implementation!!.registerCount - 1
    val calls = code.indices.filter { i ->
        val call = code[i] as? FiveRegisterInstruction ?: return@filter false
        val target = (call as ReferenceInstruction).reference as? MethodReference ?: return@filter false
        (call.opcode == Opcode.INVOKE_VIRTUAL || call.opcode == Opcode.INVOKE_INTERFACE) && call.registerCount == 2 && call.registerD == page &&
            target.parameterTypes.size == 1 && target.returnType == "V" && code.getOrNull(i + 1)?.opcode == Opcode.RETURN_VOID &&
            code.getOrNull(i - 1)?.let { it.opcode == Opcode.IF_EQZ && (it as OneRegisterInstruction).registerA == call.registerC } == true
    }
    val at = calls.singleOrNull() ?: return null
    if (at in jumpTargets()) return null
    val call = code[at] as FiveRegisterInstruction
    val scratch = (0 until page).firstOrNull { it != call.registerC } ?: return null
    return StoryAdvance(at, (call as ReferenceInstruction).reference as MethodReference, scratch)
}

/** A callback that hands the viewer an Integer reason to move on: it calls a static (viewer, Integer)V on the viewer. */
internal fun Method.isStoryAdvanceCallback() = implementation?.instructions?.toList().orEmpty().any { instruction ->
    val target = (instruction as? ReferenceInstruction)?.reference as? MethodReference
    instruction.opcode == Opcode.INVOKE_STATIC && target != null && target.definingClass == MONTAGE_VIEWER && target.returnType == "V" &&
        target.parameterTypes.map { it.toString() } == listOf(MONTAGE_VIEWER, "Ljava/lang/Integer;")
}

/**
 * The app's only story_playback_finished logger, taken when its hand-off calls a callback that moves the viewer on.
 * Any second logger, or a hand-off that goes elsewhere, leaves the switch unapplied.
 */
internal val storyFinishedLoggers = MethodCheck(loadsString(STORY_FINISHED))

internal fun findStoryHold(classes: Iterable<ClassDef>): List<Method> {
    val all = classes.toList()
    val loggers = storyFinishedLoggers.methods(classes)
    val completion = loggers.singleOrNull() ?: return emptyList()
    val advance = completion.storyAdvance() ?: return emptyList()
    val callback = all.firstOrNull { it.type == advance.callback.definingClass }?.methods?.singleOrNull {
        it.name == advance.callback.name && it.parameterTypes.map { type -> type.toString() } == advance.callback.parameterTypes.map { type -> type.toString() } &&
            it.returnType == advance.callback.returnType
    } ?: return emptyList()
    return if (callback.isStoryAdvanceCallback()) listOf(completion) else emptyList()
}

internal fun MutableMethod.validateStoryHold(): StoryAdvance = storyAdvance() ?: storyHoldChanged("no hand-off to hold in ${hookId()}")

/**
 * While the switch is on the completion returns before handing the page on, so the card stays on screen after its
 * timer or video ends. Its log, and the replay Messenger starts when you were just scrolling reactions, still run. A
 * tap or swipe moves the viewer the usual way, and pausing and resuming a held card holds it again. Off, Pause and
 * safe mode run Messenger's own code.
 */
internal fun MutableMethod.injectStoryHold() {
    val advance = validateStoryHold()
    addInstructionsWithLabels(advance.index, """
        invoke-static {}, $SETTINGS->holdStoryAtEnd()Z
        move-result v${advance.scratch}
        if-eqz v${advance.scratch}, :story_advance
        return-void
    """.trimIndent(), ExternalLabel("story_advance", getInstruction(advance.index)))
}
