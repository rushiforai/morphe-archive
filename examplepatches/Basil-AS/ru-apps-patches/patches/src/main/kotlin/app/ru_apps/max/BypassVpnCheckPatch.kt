package app.ru_apps.max

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.ru_apps.max.Constants.COMPATIBILITY_MAX
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private const val IP_CHECKER = "https://ipv4-internet.yandex.net/api/v0/ip"

/**
 * Ported from RealCyberwash/max-patches (GPLv3), app/template/patches/analytics/vpnchecker/BypassVpnCheckPatch.kt.
 *
 * What it actually does: MAX shuffles a hardcoded list of 6 external IP-lookup
 * endpoints (Yandex IPv4/IPv6, ifconfig.me, ipify, amazonaws, ip.mail.ru — see
 * habr_audit_findings.md A.2) and uses the first one that returns a non-loopback IP.
 * This patch collapses that `filled-new-array/range` down to a single element
 * (the Yandex endpoint), so the redundant 6-provider fallback becomes one single,
 * named, externally blockable endpoint.
 *
 * This is NOT a full VPN-detection bypass by itself — MAX's actual `vpn: 0/1` flag
 * (from `NetworkCapabilities.hasTransport(TRANSPORT_VPN)`, habr_audit_findings.md A.1)
 * is unaffected and is handled by the app-agnostic
 * [app.privacy.patches.vpn.spoofVpnStatusPatch] instead. This patch only removes the
 * redundancy in the separate external-IP/split-tunneling check, so a user who also
 * null-routes `ipv4-internet.yandex.net` locally (hosts file / DNS sinkhole) fully
 * blinds that specific check instead of needing to block 6 different domains.
 */
val bypassVpnCheckPatch = bytecodePatch(
    name = "Bypass VPN check",
    description = "Reduces MAX's external IP-checker fallback list to a single, blockable endpoint.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MAX)
    execute {
        VpnCheckerFingerprint.method.apply {
            val targetIndex = instructions.indexOfFirst { it.opcode == Opcode.FILLED_NEW_ARRAY_RANGE }
            val startReg = getInstruction<RegisterRangeInstruction>(targetIndex).startRegister
            replaceInstruction(targetIndex, "const-string v$startReg, \"$IP_CHECKER\"")
            addInstructions(targetIndex + 1, """filled-new-array/range {v$startReg .. v$startReg}, [Ljava/lang/String;""")
        }
    }
}
