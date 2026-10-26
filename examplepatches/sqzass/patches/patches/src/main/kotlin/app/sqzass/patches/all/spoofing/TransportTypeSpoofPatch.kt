package app.sqzass.patches.all.spoofing

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.sqzass.patches.shared.findConstArgInvokes
import app.sqzass.patches.shared.forceInvokeResult
import app.sqzass.patches.shared.methodReferenceOf
import app.sqzass.patches.shared.narrowConstLoad
import app.sqzass.patches.shared.patchMatchingMethods
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import java.util.logging.Logger

private val logger = Logger.getLogger("TransportTypeSpoofPatch")

private const val TRANSPORT_CELLULAR = 0
private const val TRANSPORT_WIFI = 1
private const val TRANSPORT_VPN = 4

private fun isHasTransport(instruction: Instruction): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass == "Landroid/net/NetworkCapabilities;" &&
        reference.name == "hasTransport" &&
        reference.returnType == "Z"
}

private fun isNetworkInfoType(instruction: Instruction): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass == "Landroid/net/NetworkInfo;" &&
        reference.name == "getType" &&
        reference.returnType == "I"
}

private fun isNetworkInfoTypeName(instruction: Instruction): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass == "Landroid/net/NetworkInfo;" &&
        reference.name == "getTypeName" &&
        reference.returnType == "Ljava/lang/String;"
}

@Suppress("unused")
val transportTypeSpoofPatch = bytecodePatch(
    name = "Spoof network transport type",
    description = "Reports a Wi-Fi connection: forces transport capability flags, hides the VPN transport, and overrides NetworkInfo type readings.",
    default = false,
) {
    category("Spoofing")

    val forceWifiOption = booleanOption(
        key = "forceWifiTransport",
        default = true,
        title = "Force Wi-Fi Transport",
        description = "Report the Wi-Fi transport in hasTransport checks and NetworkInfo type readings.",
    )
    val forceCellularOption = booleanOption(
        key = "forceCellularTransport",
        default = false,
        title = "Force Cellular Transport",
        description = "Additionally report the cellular transport in hasTransport checks.",
    )
    val hideVpnOption = booleanOption(
        key = "hideVpnTransport",
        default = true,
        title = "Hide VPN Transport",
        description = "Force hasTransport(TRANSPORT_VPN) to report false.",
    )

    execute {
        val forceWifi = forceWifiOption.value == true
        val forceCellular = forceCellularOption.value == true
        val hideVpn = hideVpnOption.value == true
        if (!forceWifi && !forceCellular && !hideVpn) {
            logger.info("All options disabled.")
            return@execute
        }

        val patched = patchMatchingMethods(
            isCandidate = { method ->
                method.implementation?.instructions?.let { raw ->
                    val instructions = raw.toList()
                    (forceWifi && (
                        instructions.any(::isNetworkInfoType) ||
                            instructions.any(::isNetworkInfoTypeName) ||
                            findConstArgInvokes(
                                instructions,
                                { narrowConstLoad(it) == TRANSPORT_WIFI },
                                ::isHasTransport,
                            ).isNotEmpty()
                        )) ||
                        (forceCellular && findConstArgInvokes(
                            instructions,
                            { narrowConstLoad(it) == TRANSPORT_CELLULAR },
                            ::isHasTransport,
                        ).isNotEmpty()) ||
                        (hideVpn && findConstArgInvokes(
                            instructions,
                            { narrowConstLoad(it) == TRANSPORT_VPN },
                            ::isHasTransport,
                        ).isNotEmpty())
                } == true
            },
        ) { instructions ->
            var count = 0

            if (forceWifi) {
                for (index in findConstArgInvokes(
                    instructions,
                    { narrowConstLoad(it) == TRANSPORT_WIFI },
                    ::isHasTransport,
                ).sortedDescending()) {
                    if (forceInvokeResult(instructions, index) { register -> "const/4 v$register, 0x1" }) count++
                }
                for (index in instructions.indices.reversed()) {
                    val instruction = instructions.getOrNull(index) ?: continue
                    if (isNetworkInfoType(instruction) &&
                        forceInvokeResult(instructions, index) { register -> "const/16 v$register, 0x1" }
                    ) {
                        count++
                    } else if (isNetworkInfoTypeName(instruction) &&
                        forceInvokeResult(instructions, index) { register -> "const-string v$register, \"WIFI\"" }
                    ) {
                        count++
                    }
                }
            }

            if (forceCellular) {
                for (index in findConstArgInvokes(
                    instructions,
                    { narrowConstLoad(it) == TRANSPORT_CELLULAR },
                    ::isHasTransport,
                ).sortedDescending()) {
                    if (forceInvokeResult(instructions, index) { register -> "const/4 v$register, 0x1" }) count++
                }
            }

            if (hideVpn) {
                for (index in findConstArgInvokes(
                    instructions,
                    { narrowConstLoad(it) == TRANSPORT_VPN },
                    ::isHasTransport,
                ).sortedDescending()) {
                    if (forceInvokeResult(instructions, index) { register -> "const/4 v$register, 0x0" }) count++
                }
            }

            count
        }

        logger.info("Applied $patched transport type spoof replacements.")
    }
}