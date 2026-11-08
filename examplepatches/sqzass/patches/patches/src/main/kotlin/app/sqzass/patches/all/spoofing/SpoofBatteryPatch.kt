package app.sqzass.patches.all.spoofing

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.sqzass.patches.shared.findConstArgInvokes
import app.sqzass.patches.shared.forceInvokeResult
import app.sqzass.patches.shared.methodReferenceOf
import app.sqzass.patches.shared.narrowConstLoad
import app.sqzass.patches.shared.patchMatchingMethods
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import java.util.logging.Logger

private val logger = Logger.getLogger("SpoofBatteryPatch")

private const val BATTERY_MANAGER = "Landroid/os/BatteryManager;"

@Suppress("unused")
val spoofBatteryPatch = bytecodePatch(
    name = "Spoof battery level",
    description = "Forces BatteryManager capacity/level reads to report a fixed percentage.",
    default = false,
) {
    category("Spoofing")

    val levelOption = stringOption(
        key = "batteryLevel",
        default = "100",
        title = "Battery Level (%)",
        description = "Reported battery capacity/level, 0-100.",
        validator = { value ->
            value.isNullOrBlank() || value.toIntOrNull()?.let { it in 0..100 } == true
        },
    )

    execute {
        val level = levelOption.value?.toIntOrNull() ?: 100

        var patched = patchMatchingMethods(
            isCandidate = { method ->
                method.implementation?.instructions?.any { isBatteryPropertyRead(it) } == true
            },
        ) { instructions ->
            var count = 0
            for (index in instructions.indices.reversed()) {
                val instruction = instructions.getOrNull(index) ?: continue
                if (isBatteryPropertyRead(instruction) &&
                    forceInvokeResult(instructions, index) { reg -> "const/16 v$reg, 0x${Integer.toHexString(level)}" }
                ) {
                    count++
                }
            }
            count
        }

        patched += patchMatchingMethods(
            isCandidate = { method ->
                method.implementation?.instructions?.let { raw ->
                    val instructions = raw.toList()
                    findConstArgInvokes(
                        instructions,
                        { narrowConstLoad(it) == 4 },
                        ::isGetIntProperty,
                    ).isNotEmpty()
                } == true
            },
        ) { instructions ->
            var count = 0
            for (index in findConstArgInvokes(
                instructions,
                { narrowConstLoad(it) == 4 },
                ::isGetIntProperty,
            ).sortedDescending()) {
                if (forceInvokeResult(instructions, index) { reg -> "const/16 v$reg, 0x${Integer.toHexString(level)}" }) {
                    count++
                }
            }
            count
        }

        logger.info("Applied $patched battery spoof replacements (level=$level%).")
    }
}

private fun isBatteryPropertyRead(instruction: Instruction): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass == BATTERY_MANAGER &&
        reference.name == "getIntProperty" &&
        reference.returnType == "I"
}

private fun isGetIntProperty(instruction: Instruction): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass == BATTERY_MANAGER &&
        reference.name == "getIntProperty" &&
        reference.returnType == "I"
}