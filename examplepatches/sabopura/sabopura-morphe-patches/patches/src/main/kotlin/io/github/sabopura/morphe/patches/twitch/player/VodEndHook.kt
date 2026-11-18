package io.github.sabopura.morphe.patches.twitch.player

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.callRegisters
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.classesWithStrings
import io.github.sabopura.morphe.patches.twitch.support.insertBeforeKeepingLabels
import io.github.sabopura.morphe.patches.twitch.support.registerDeadAt
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract
import java.util.logging.Logger

private const val VOD_END = "Lio/github/sabopura/morphe/extension/twitch/player/VodEnd;"
private val log: Logger = Logger.getLogger("SabopuraTwitch.Player")

private fun Instruction.creates(type: String) =
    opcode == Opcode.NEW_INSTANCE && ((this as ReferenceInstruction).reference as TypeReference).type == type

internal fun createsState(method: Method, state: String) =
    method.implementation?.instructions?.any { it.creates(state) } == true

/**
 * Where [method] creates [state] and hands it on: from its new-instance to the first call that
 * takes it. Null unless that stretch runs straight through and every register it writes is dead
 * after it, so a jump from its start to just behind it skips the state and nothing else.
 */
internal fun stateHandOver(method: Method, state: String): IntRange? {
    val code = method.implementation?.instructions?.toList() ?: return null
    val create = code.indices.singleOrNull { code[it].creates(state) } ?: return null
    val register = (code[create] as OneRegisterInstruction).registerA
    val built = (create + 1 until code.size).firstOrNull { index ->
        val call = (code[index] as? ReferenceInstruction)?.reference as? MethodReference
        code[index].opcode == Opcode.INVOKE_DIRECT && call?.definingClass == state && call.name == "<init>" &&
            code[index].callRegisters().firstOrNull() == register
    } ?: return null
    val handOver = (built + 1 until code.size - 1).firstOrNull { register in code[it].callRegisters() } ?: return null
    // A jump from before the call must not land on the instruction that reads its result.
    if (code[handOver + 1].opcode.name.startsWith("move-result")) return null
    val stretch = code.subList(create, handOver + 1)
    if (stretch.any { it is OffsetInstruction || !it.opcode.canContinue() }) return null
    val written = stretch.filter { it.opcode.setsRegister() }.flatMap {
        val target = (it as OneRegisterInstruction).registerA
        if (it.opcode.setsWideRegister()) listOf(target, target + 1) else listOf(target)
    }
    return (create..handOver).takeIf { written.all { registerDeadAt(method, handOver + 1, it) } }
}

/**
 * When a VOD or clip ends, the theatre and the picture-in-picture player ask one presenter to show
 * the next video, and its view then counts down and plays it. That presenter answers by creating
 * the state named "RecommendationShown" in a single place, so asking the extension there covers
 * every way in: skipped, nothing is shown and nothing counts down.
 */
internal val vodEndHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        val state = classesWithStrings("RecommendationShown(recommendation=").uniqueContract("next video state").type
        fun shows(method: Method) = method.name == "invoke" && createsState(method, state)
        val owner = classesMatching { type -> type.methods.any(::shows) }.uniqueContract("next video presenter")
        val method = mutableClassDefBy(owner).methods.filter(::shows).uniqueContract("next video presenter method")
        val stretch = stateHandOver(method, state)
            ?: throw PatchException("Twitch: next video: the state is no longer created and handed on in one straight run")
        val register = method.getInstruction<OneRegisterInstruction>(stretch.first).registerA
        method.insertBeforeKeepingLabels(stretch.first, """
            invoke-static {}, $VOD_END->keepEnded()Z
            move-result v$register
            if-nez v$register, :ended
        """, ExternalLabel("ended", method.getInstruction(stretch.last + 1)))
        log.info("Player: next video check in $owner before ${stretch.first}, past ${stretch.last} when held (v$register)")
    }
}
