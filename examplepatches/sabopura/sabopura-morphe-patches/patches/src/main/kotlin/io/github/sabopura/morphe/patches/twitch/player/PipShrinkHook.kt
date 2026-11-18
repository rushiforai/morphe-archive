package io.github.sabopura.morphe.patches.twitch.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.registerDeadAt
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract
import java.util.logging.Logger

private const val PIP_SHRINK = "Lio/github/sabopura/morphe/extension/twitch/player/PipShrink;"
private const val THEATRE = "Ltv/twitch/android/feature/theatre/TheatreModeFragment;"
private val log: Logger = Logger.getLogger("SabopuraTwitch.Player")

private fun Method.code() = implementation?.instructions?.toList()

private fun Method.locals(): Int = implementation!!.registerCount - (if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1) -
    parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }

private fun MethodReference.parameters() = parameterTypes.map { it.toString() }

/**
 * The player screen's shrink that other screens call: it reads its presenter at [read] into
 * [presenter], then calls [shrink] on it with [source], the BUTTON_TAP constant.
 */
internal class ScreenShrink(val read: Int, val presenter: Int, val source: FieldReference, val shrink: MethodReference)

internal fun screenShrink(method: Method): ScreenShrink? {
    if (method.returnType != "Z" || method.parameterTypes.isNotEmpty() || AccessFlags.STATIC.isSet(method.accessFlags)) return null
    val code = method.code() ?: return null
    fun reference(index: Int) = (code.getOrNull(index) as? ReferenceInstruction)?.reference
    val call = code.indices.singleOrNull { index ->
        val source = reference(index - 1) as? FieldReference
        val target = reference(index) as? MethodReference
        index > 0 && code[index].opcode == Opcode.INVOKE_VIRTUAL && target != null && target.returnType == "Z" &&
            code[index - 1].opcode == Opcode.SGET_OBJECT && source != null && source.name == "BUTTON_TAP" &&
            source.type == source.definingClass && target.parameters() == listOf(source.type) &&
            (code[index] as FiveRegisterInstruction).registerD == (code[index - 1] as OneRegisterInstruction).registerA
    } ?: return null
    val shrink = reference(call) as MethodReference
    val self = method.implementation!!.registerCount - 1
    val read = (0 until call).firstOrNull { index ->
        val field = reference(index) as? FieldReference
        code[index].opcode == Opcode.IGET_OBJECT && field != null && field.definingClass == method.definingClass &&
            field.type == shrink.definingClass && (code[index] as TwoRegisterInstruction).registerB == self
    } ?: return null
    return ScreenShrink(read, (code[read] as TwoRegisterInstruction).registerA, reference(call - 1) as FieldReference, shrink)
}

/** Where a picture-in-picture listener hands the change to the inner player of [presenter]. */
internal fun pipForwardCall(method: Method, presenter: String): Int? {
    val code = method.code() ?: return null
    return code.indices.singleOrNull { index ->
        val target = (code[index] as? ReferenceInstruction)?.reference as? MethodReference
        val loaded = (code.getOrNull(index - 1) as? ReferenceInstruction)?.reference as? FieldReference
        index > 0 && code[index].opcode == Opcode.INVOKE_INTERFACE && target != null &&
            target.name == "onPictureInPictureModeChanged" && target.returnType == "V" && target.parameters() == listOf("Z") &&
            code[index - 1].opcode == Opcode.IGET_OBJECT && loaded != null && loaded.definingClass == presenter &&
            loaded.type == target.definingClass &&
            (code[index] as FiveRegisterInstruction).registerC == (code[index - 1] as TwoRegisterInstruction).registerA &&
            // The hook calls the presenter behind this: a load over the presenter's own register would leave none.
            (code[index - 1] as TwoRegisterInstruction).registerA != (code[index - 1] as TwoRegisterInstruction).registerB
    }
}

/** The hook behind that call: the presenter's register, the picture-in-picture flag's, and a free local. */
internal class PipForward(val after: Int, val presenter: Int, val pip: Int, val scratch: Int)

internal fun pipForward(method: Method, presenter: String): PipForward? {
    val call = pipForwardCall(method, presenter) ?: return null
    val code = method.code()!!
    val forward = code[call] as FiveRegisterInstruction
    val player = (code[call - 1] as TwoRegisterInstruction).registerB
    val pip = forward.registerD
    // They all go into plain invokes, which reach the first sixteen registers only.
    if (player > 15 || pip > 15) return null
    val scratch = (listOf(forward.registerC) + (0 until 16)).firstOrNull {
        it != player && it != pip && it < method.locals() && registerDeadAt(method, call + 1, it)
    } ?: return null
    return PipForward(call + 1, player, pip, scratch)
}

/**
 * A screen opened over the player (the channel page of a link) asks the player screen to shrink on
 * the next frame. Twitch's VOD player refuses while it is in picture-in-picture, and a link may
 * arrive before Android reports that picture-in-picture ended, so the VOD came back full size over
 * the channel page and the live stream opened from it never replaced it. The extension remembers a
 * shrink asked for during picture-in-picture, and the screen's picture-in-picture listener makes it
 * with Twitch's own shrink right after the player has left picture-in-picture.
 */
internal val pipShrinkHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        val theatre = classDefByOrNull(THEATRE) ?: throw PatchException("Twitch: the player screen class moved")
        val (screenMethod, shrink) = theatre.methods.mapNotNull { m -> screenShrink(m)?.let { m to it } }
            .uniqueContract("player screen shrink for other screens")
        val presenter = classDefBy(shrink.shrink.definingClass)
        val shrinkMethod = presenter.methods.filter {
            it.name == shrink.shrink.name && it.parameterTypes.map { p -> p.toString() } == shrink.shrink.parameters()
        }.uniqueContract("player screen presenter shrink")
        val source = classDefBy(shrink.source.definingClass).fields.filter { it.name == shrink.source.name }
            .uniqueContract("player screen shrink source")
        if (listOf(presenter.accessFlags, shrinkMethod.accessFlags, source.accessFlags).any { !AccessFlags.PUBLIC.isSet(it) })
            throw PatchException("Twitch: the player screen's shrink is not public")
        if (shrink.presenter > 15) throw PatchException("Twitch: the player screen's shrink reads its presenter beyond v15")

        val listener = classesMatching { c ->
            c.methods.any { it.returnType == "V" && it.parameterTypes.size == 1 && pipForwardCall(it, presenter.type) != null }
        }.uniqueContract("picture-in-picture listener of the player screen")
        val listenerMethod = listener.methods.filter { pipForwardCall(it, presenter.type) != null }
            .uniqueContract("picture-in-picture listener method")
        val forward = pipForward(listenerMethod, presenter.type)
            ?: throw PatchException("Twitch: the picture-in-picture listener has no register for the hook")

        mutableClassDefBy(THEATRE).methods.single { it.name == screenMethod.name && it.parameterTypes.isEmpty() && it.returnType == "Z" }
            .addInstructions(shrink.read + 1, "invoke-static {v${shrink.presenter}}, $PIP_SHRINK->asked(Ljava/lang/Object;)V")
        mutableClassDefBy(listener).methods.single {
            it.name == listenerMethod.name && it.parameterTypes == listenerMethod.parameterTypes && it.returnType == "V"
        }.apply {
            addInstructionsWithLabels(forward.after, """
                invoke-static {v${forward.presenter}, v${forward.pip}}, $PIP_SHRINK->changed(Ljava/lang/Object;Z)Z
                move-result v${forward.scratch}
                if-eqz v${forward.scratch}, :kept
                sget-object v${forward.scratch}, ${shrink.source}
                invoke-virtual {v${forward.presenter}, v${forward.scratch}}, ${shrink.shrink}
            """, ExternalLabel("kept", getInstruction(forward.after)))
        }
        log.info("Player: shrink after picture-in-picture in ${listener.type} at ${forward.after} (v${forward.scratch}), " +
            "asked in ${screenMethod.name} of the player screen")
    }
}
