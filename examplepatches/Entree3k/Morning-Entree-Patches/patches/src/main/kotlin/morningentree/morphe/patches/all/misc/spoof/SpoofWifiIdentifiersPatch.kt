package morningentree.morphe.patches.all.misc.spoof

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val WIFI_INFO = "Landroid/net/wifi/WifiInfo;"

private fun String.escapeSmali() = replace("\\", "\\\\").replace("\"", "\\\"")

// Based on Rushi's patch

@Suppress("unused")
val spoofWifiIdentifiersPatch = bytecodePatch(
    name = "Spoof Wi-Fi identifiers",
    description = "Spoofs Wi-Fi SSID, BSSID, and MAC address reads.",
    default = false,
) {
    val ssid by stringOption(
        key = "universalWifiSsid",
        default = "Pixel_WiFi",
        title = "SSID",
        description = "Value returned for WifiInfo.getSSID.",
        required = true,
    )
    val bssid by stringOption(
        key = "universalWifiBssid",
        default = "02:00:00:12:34:56",
        title = "BSSID",
        description = "Value returned for WifiInfo.getBSSID.",
        required = true,
    )
    val mac by stringOption(
        key = "universalWifiMac",
        default = "02:00:00:65:43:21",
        title = "MAC address",
        description = "Value returned for WifiInfo.getMacAddress.",
        required = true,
    )

    execute {
        val values = mapOf(
            "getSSID" to (ssid ?: "Pixel_WiFi"),
            "getBSSID" to (bssid ?: "02:00:00:12:34:56"),
            "getMacAddress" to (mac ?: "02:00:00:65:43:21"),
        )

        classDefForEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.instructionsOrNull?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@forEachIndexed
                    if (reference.definingClass != WIFI_INFO ||
                        reference.returnType != "Ljava/lang/String;"
                    ) return@forEachIndexed
                    val value = values[reference.name] ?: return@forEachIndexed
                    val moveResult = instructions.getOrNull(index + 1) as? OneRegisterInstruction
                        ?: return@forEachIndexed
                    if (moveResult.opcode != Opcode.MOVE_RESULT_OBJECT) return@forEachIndexed
                    method.replaceInstruction(
                        index + 1,
                        "const-string v${moveResult.registerA}, \"${value.escapeSmali()}\"",
                    )
                }
            }
        }
    }
}
