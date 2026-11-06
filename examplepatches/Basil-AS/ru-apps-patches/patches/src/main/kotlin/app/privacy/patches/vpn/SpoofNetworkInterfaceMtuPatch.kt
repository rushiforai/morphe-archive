// New patch (not ported) — written for this repo, 2026-10-07.
// Design input: research/notes/06_rknhardering.md §1.2 check #14 (MTU anomaly) — VPN/
// tunnel interfaces commonly report a reduced MTU (typically 1280-1499, below the
// standard Ethernet 1500) to leave headroom for tunnel-protocol overhead, so an app can
// flag "this interface's MTU is in the 1..1499 range" as a VPN signal independent of the
// interface's name.
//
// Gated the same way as the other structural heuristics in this file family: only
// touches NetworkInterface.getMtu() call sites that sit in a method already showing a
// VPN-signal context (a vpn/tun-ish string literal, or one of the other VPN-detection
// API calls SpoofVpnStatusPatch.kt already recognizes) — not every MTU read in the app,
// since MTU is also legitimately read for unrelated path-MTU-discovery/performance
// tuning that has nothing to do with VPN detection.
//
// Verification status: not yet confirmed present in any of the 101 apps we've
// decompiled (our batch/manual investigations didn't check for this specific pattern).
// The editing technique (override a move-result with a fixed "normal" constant) is the
// same proven-safe primitive used throughout this file family.
package app.privacy.patches.vpn

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.shared.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val NETWORK_INTERFACE = "Ljava/net/NetworkInterface;"
private const val STANDARD_ETHERNET_MTU = 1500

private fun MethodReference.isNetworkInterfaceGetMtu() = definingClass == NETWORK_INTERFACE &&
    name == "getMtu" &&
    parameterTypes.isEmpty() &&
    returnType == "I"

private fun List<Instruction>.hasVpnSignalStringNearby(index: Int): Boolean {
    val from = maxOf(0, index - 16)
    val to = minOf(size - 1, index + 16)
    for (candidateIndex in from..to) {
        val string = this[candidateIndex].stringReferenceOrNull()?.lowercase() ?: continue
        if (listOf("vpn", "tun", "wg", "ppp", "ipsec", "utun", "mtu").any { it in string }) return true
    }
    return false
}

private fun Method.hasMtuTarget(): Boolean {
    val instructions = instructionsOrNull?.toList() ?: return false
    return instructions.withIndex().any { (index, instruction) ->
        val reference = instruction.methodReferenceOrNull() ?: return@any false
        reference.isNetworkInterfaceGetMtu() && instructions.hasVpnSignalStringNearby(index)
    }
}

@Suppress("unused")
val spoofNetworkInterfaceMtuPatch = bytecodePatch(
    name = "Spoof network interface MTU",
    description = "Forces NetworkInterface.getMtu() to report the standard Ethernet MTU " +
        "(1500) instead of a reduced tunnel-typical value, when the call site shows a " +
        "VPN-detection context.",
    default = false,
) {
    execute {
        var patchedCalls = 0

        classDefForEach { classDef ->
            if (classDef.methods.none { it.hasMtuTarget() }) return@classDefForEach

            mutableClassDefBy(classDef).methods.forEach { method ->
                if (!method.hasMtuTarget()) return@forEach

                val instructions = method.instructionsOrNull?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val reference = instruction.methodReferenceOrNull() ?: return@forEachIndexed
                    if (!reference.isNetworkInterfaceGetMtu() || !instructions.hasVpnSignalStringNearby(index)) {
                        return@forEachIndexed
                    }

                    val moveResult = instructions.getOrNull(index + 1) as? OneRegisterInstruction
                        ?: return@forEachIndexed
                    if (moveResult.opcode != Opcode.MOVE_RESULT) return@forEachIndexed

                    method.replaceInstruction(
                        index + 1,
                        "const/16 v${moveResult.registerA}, 0x${STANDARD_ETHERNET_MTU.toString(16)}",
                    )
                    patchedCalls++
                }
            }
        }

        if (patchedCalls == 0) {
            println("Spoof network interface MTU: no local getMtu() call sites were found.")
            return@execute
        }

        println("Spoof network interface MTU: patched $patchedCalls getMtu() calls.")
    }
}
