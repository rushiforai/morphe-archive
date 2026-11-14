package app.morphe.patches.all.vpn

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private fun argRegisters(ins: Instruction): List<Int>? = when (ins) {
    is FiveRegisterInstruction -> listOf(ins.registerC, ins.registerD, ins.registerE, ins.registerF, ins.registerG).take(ins.registerCount)
    is RegisterRangeInstruction -> (ins.startRegister until ins.startRegister + ins.registerCount).toList()
    else -> null
}

private fun constValue(method: MutableMethod, invokeIndex: Int, reg: Int): Int? {
    for (j in invokeIndex - 1 downTo 0) {
        val ins = method.getInstruction(j)
        val op = ins.opcode
        if (ins is NarrowLiteralInstruction && ins is OneRegisterInstruction && ins.registerA == reg) return ins.narrowLiteral
        if (op == Opcode.GOTO ||
            op == Opcode.GOTO_16 ||
            op == Opcode.GOTO_32 ||
            op == Opcode.PACKED_SWITCH ||
            op == Opcode.SPARSE_SWITCH ||
            op.name.startsWith("if-") ||
            op.name.startsWith("return")
        ) {
            return null
        }
        if (ins is OneRegisterInstruction && ins.registerA == reg) return null
    }
    return null
}

private fun forceResult(method: MutableMethod, invokeIndex: Int, value: Boolean) {
    val ri = invokeIndex + 1
    if (ri >= method.instructions.size) return
    val ins = method.getInstruction(ri)
    if (ins.opcode != Opcode.MOVE_RESULT) return
    val reg = (ins as OneRegisterInstruction).registerA
    method.replaceInstruction(ri, "const/4 v$reg, ${if (value) "0x1" else "0x0"}")
}

private val VPN_NAMES = setOf("tun", "tun0", "tunl0", "ppp", "ppp0", "tap", "tap0", "wg", "wg0", "utun")

private fun Instruction.isNICall(): Boolean {
    val m = getReference<MethodReference>() ?: return false
    return m.definingClass == "Ljava/net/NetworkInterface;" && (m.name == "getName" || m.name == "getNetworkInterfaces")
}

private fun Instruction.isVpnNameString(): Boolean {
    if (opcode != Opcode.CONST_STRING && opcode != Opcode.CONST_STRING_JUMBO) return false
    return getReference<StringReference>()?.string in VPN_NAMES
}

@Suppress("unused")
val stripVpnChecksPatch = bytecodePatch(
    name = "Strip VPN checks",
    description = "Hides an active VPN from the app by neutralizing NetworkCapabilities " +
        "transport/capability checks and (optionally) network-interface name checks.",
    default = false,
) {
    val stripInterfaceChecks by booleanOption(
        key = "stripInterfaceChecks",
        default = true,
        title = "Also strip interface-name checks",
        description = "Defeat tun/ppp/tap interface-name comparisons in NetworkInterface-using methods.",
    )

    execute {
        methodCall("Landroid/net/NetworkCapabilities;->hasTransport(I)Z")
            .matchAllMethodIndicesForEach(requireMatches = false) { index ->
                val regs = argRegisters(getInstruction(index)) ?: return@matchAllMethodIndicesForEach
                if (regs.size >= 2 && constValue(this, index, regs[1]) == 4) forceResult(this, index, false)
            }
        methodCall("Landroid/net/NetworkCapabilities;->hasCapability(I)Z")
            .matchAllMethodIndicesForEach(requireMatches = false) { index ->
                val regs = argRegisters(getInstruction(index)) ?: return@matchAllMethodIndicesForEach
                if (regs.size >= 2 && constValue(this, index, regs[1]) == 15) forceResult(this, index, true)
            }

        if (stripInterfaceChecks == true) {
            classDefForEach { classDef ->
                val mc by lazy { mutableClassDefBy(classDef) }
                classDef.methods.forEach { method ->
                    val impl = method.implementation ?: return@forEach
                    if (impl.instructions.none { it.isNICall() }) return@forEach
                    val mm = mc.findMutableMethodOf(method)
                    val idxs = mm.instructions.withIndex().filter { it.value.isVpnNameString() }.map { it.index }
                    for (i in idxs) {
                        val reg = (mm.getInstruction(i) as OneRegisterInstruction).registerA
                        mm.replaceInstruction(i, "const-string v$reg, \"zzz\"")
                    }
                }
            }
        }
    }
}
