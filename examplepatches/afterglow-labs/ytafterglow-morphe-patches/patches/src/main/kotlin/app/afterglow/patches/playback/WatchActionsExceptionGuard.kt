package app.afterglow.patches.playback

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** Inline smali supplies instructions; catch tables must be attached explicitly. */
internal fun MutableMethod.guardWatchActionsMonitor() {
    val body = implementation ?: error("Watch actions bridge has no implementation")
    val code = body.instructions
    val parameterWords = 1 + parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
    val receiver = body.registerCount - parameterWords
    fun register(index: Int) = (code[index] as? OneRegisterInstruction)?.registerA
    val exits = code.withIndex().filter { it.value.opcode == Opcode.MONITOR_EXIT }.map { it.index }
    require(code.first().opcode == Opcode.MONITOR_ENTER && register(0) == receiver
            && exits.size == 2 && exits.all { register(it) == receiver }
            && body.tryBlocks.isEmpty()) { "Watch actions monitor structure changed" }
    val end = exits[0]
    val handler = end + 2
    require(end > 1 && code[end + 1].opcode == if (returnType == "V") Opcode.RETURN_VOID else Opcode.RETURN)
    require(handler + 3 == code.size && code[handler].opcode == Opcode.MOVE_EXCEPTION
            && register(handler) == 0 && exits[1] == handler + 1
            && code[handler + 2].opcode == Opcode.THROW && register(handler + 2) == 0) {
        "Watch actions monitor release handler changed"
    }
    body.addCatch(body.newLabelForIndex(1), body.newLabelForIndex(end), body.newLabelForIndex(handler))
}
