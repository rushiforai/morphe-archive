package app.sqzass.patches.all.spoofing

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.sqzass.patches.shared.forceInvokeResult
import app.sqzass.patches.shared.methodReferenceOf
import app.sqzass.patches.shared.patchMatchingMethods
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import java.util.logging.Logger

private val logger = Logger.getLogger("SpoofMacAddressPatch")

private const val WIFI_INFO = "Landroid/net/wifi/WifiInfo;"

private val RANDOM_MAC = "02:%02X:%02X:%02X:%02X:%02X".format(
    (0..255).random(), (0..255).random(), (0..255).random(), (0..255).random(), (0..255).random()
)

@Suppress("unused")
val spoofMacAddressPatch = bytecodePatch(
    name = "Spoof MAC address",
    description = "Forces WifiInfo.getMacAddress() to report a fixed locally-administered MAC address instead of the real hardware MAC.",
    default = false,
) {
    category("Spoofing")

    val macOption = stringOption(
        key = "macAddress",
        default = RANDOM_MAC,
        title = "MAC Address",
        description = "Locally-administered MAC (e.g. 02:1A:2B:3C:4D:5E). Leave blank to generate a random one.",
        validator = { value ->
            value.isNullOrBlank() || Regex("^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$").matches(value)
        },
    )

    execute {
        val mac = macOption.value?.takeIf { it.isNotBlank() } ?: RANDOM_MAC

        val patched = patchMatchingMethods(
            isCandidate = { method ->
                method.implementation?.instructions?.any { isMacAddressGetter(it) } == true
            },
        ) { instructions ->
            var count = 0
            for (index in instructions.indices.reversed()) {
                val instruction = instructions.getOrNull(index) ?: continue
                if (isMacAddressGetter(instruction) &&
                    forceInvokeResult(instructions, index) { register -> "const-string v$register, \"$mac\"" }
                ) {
                    count++
                }
            }
            count
        }

        logger.info("Applied $patched MAC address spoof replacements (mac=$mac).")
    }
}

private fun isMacAddressGetter(instruction: Instruction): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass == WIFI_INFO &&
        reference.name == "getMacAddress" &&
        reference.returnType == "Ljava/lang/String;"
}