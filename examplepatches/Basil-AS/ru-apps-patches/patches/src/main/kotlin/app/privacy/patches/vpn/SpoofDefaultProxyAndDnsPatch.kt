// New patch (not ported) — written for this repo, 2026-10-07.
// Design input: research/notes/06_rknhardering.md §1.1 check #6 (ConnectivityManager.
// getDefaultProxy(), not covered by SpoofVpnStatusPatch's LinkProperties.getHttpProxy()
// coverage — that only patches the per-network proxy, not the system-default one) and
// §1.2 checks #17/18 (DNS loopback/private-address detection via
// LinkProperties.getDnsServers() — comparing active-network DNS against known public
// resolvers and loopback ranges to infer a local VPN-provided DNS server).
//
// Same editing idiom as the sibling LinkProperties/NetworkCapabilities calls already
// patched in SpoofVpnStatusPatch.kt (not duplicated into that file to keep its diff
// against the xob0t original clean — this is new, separately-authored coverage).
//
// Honesty about verification: unlike SpoofProxyDetectionPatch (confirmed against real
// decompiles of Yandex Go/Maps/VK the same day this was written), this patch's two
// targets have not yet been confirmed present in any app we've actually decompiled —
// they come from RKNHardering's documented methodology, not from our own live
// evidence. The editing technique itself (null out a getter's move-result) is the same
// proven-safe primitive used throughout this file family, so the risk is confined to
// "this may currently be a no-op patch" rather than "this may corrupt bytecode."
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

private const val CONNECTIVITY_MANAGER = "Landroid/net/ConnectivityManager;"
private const val LINK_PROPERTIES = "Landroid/net/LinkProperties;"

private fun MethodReference.isConnectivityManagerGetDefaultProxy() = definingClass == CONNECTIVITY_MANAGER &&
    name == "getDefaultProxy" &&
    parameterTypes.isEmpty() &&
    returnType == "Landroid/net/ProxyInfo;"

private fun MethodReference.isLinkPropertiesGetDnsServers() = definingClass == LINK_PROPERTIES &&
    name == "getDnsServers" &&
    parameterTypes.isEmpty() &&
    returnType == "Ljava/util/List;"

private fun Method.hasTarget(): Boolean {
    val instructions = instructionsOrNull?.toList() ?: return false
    return instructions.any { instruction ->
        val reference = instruction.methodReferenceOrNull() ?: return@any false
        reference.isConnectivityManagerGetDefaultProxy() || reference.isLinkPropertiesGetDnsServers()
    }
}

@Suppress("unused")
val spoofDefaultProxyAndDnsPatch = bytecodePatch(
    name = "Spoof default proxy and DNS servers",
    description = "Makes ConnectivityManager.getDefaultProxy() return null and " +
        "LinkProperties.getDnsServers() return an empty list, closing two detection " +
        "checks not covered by Spoof VPN status (the system-default proxy, and " +
        "loopback/private DNS server comparison).",
    default = false,
) {
    execute {
        var patchedDefaultProxyCalls = 0
        var patchedDnsServerCalls = 0

        classDefForEach { classDef ->
            if (classDef.methods.none { it.hasTarget() }) return@classDefForEach

            mutableClassDefBy(classDef).methods.forEach { method ->
                if (!method.hasTarget()) return@forEach

                val instructions = method.instructionsOrNull?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val reference = instruction.methodReferenceOrNull() ?: return@forEachIndexed

                    when {
                        reference.isConnectivityManagerGetDefaultProxy() -> {
                            val moveResult = instructions.getOrNull(index + 1) as? OneRegisterInstruction
                                ?: return@forEachIndexed
                            if (moveResult.opcode != Opcode.MOVE_RESULT_OBJECT) return@forEachIndexed

                            method.replaceInstruction(index + 1, "const/4 v${moveResult.registerA}, 0x0")
                            patchedDefaultProxyCalls++
                        }

                        reference.isLinkPropertiesGetDnsServers() -> {
                            method.replaceInstruction(
                                index,
                                "invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;",
                            )
                            patchedDnsServerCalls++
                        }
                    }
                }
            }
        }

        if (patchedDefaultProxyCalls == 0 && patchedDnsServerCalls == 0) {
            println("Spoof default proxy and DNS servers: no local call sites were found.")
            return@execute
        }

        println(
            "Spoof default proxy and DNS servers: patched $patchedDefaultProxyCalls " +
                "getDefaultProxy() calls and $patchedDnsServerCalls getDnsServers() calls.",
        )
    }
}
