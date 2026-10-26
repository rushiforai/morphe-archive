package app.sqzass.patches.all.spoofing

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.sqzass.patches.shared.forceInvokeResult
import app.sqzass.patches.shared.methodReferenceOf
import app.sqzass.patches.shared.patchMatchingMethods
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import java.util.logging.Logger

private val logger = Logger.getLogger("SpoofGpsPatch")

private const val LOCATION_TYPE = "Landroid/location/Location;"

private fun isLocationGetter(instruction: Instruction, keys: Set<String>): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass == LOCATION_TYPE &&
        reference.name in keys &&
        reference.returnType in setOf("D", "F", "Ljava/lang/String;")
}

private fun smaliForResult(value: Any, register: Int): String = when (value) {
    is Double -> "const-wide v$register, 0x${java.lang.Long.toHexString(java.lang.Double.doubleToRawLongBits(value))}"
    is Float -> "const v$register, 0x${java.lang.Integer.toHexString(java.lang.Float.floatToRawIntBits(value))}"
    else -> "const-string v$register, \"$value\""
}

@Suppress("unused")
val spoofGpsPatch = bytecodePatch(
    name = "Spoof GPS",
    description = "Reports fixed coordinates: forces Location latitude, longitude, and related getter results to the configured position.",
    default = false,
) {
    category("Spoofing")

    val latitudeOption = stringOption(
        key = "latitude",
        default = "51.5074",
        title = "Latitude",
        description = "Decimal degrees, positive north.",
        validator = { value -> value.isNullOrBlank() || value.toDoubleOrNull() != null },
    )
    val longitudeOption = stringOption(
        key = "longitude",
        default = "-0.1278",
        title = "Longitude",
        description = "Decimal degrees, positive east.",
        validator = { value -> value.isNullOrBlank() || value.toDoubleOrNull() != null },
    )
    val spoofAccuracyOption = booleanOption(
        key = "spoofAccuracy",
        default = true,
        title = "Spoof Accuracy",
        description = "Force horizontal and vertical accuracy readings to a fixed value.",
    )
    val accuracyOption = stringOption(
        key = "accuracy",
        default = "10",
        title = "Accuracy (meters)",
        description = "Reported location accuracy in meters.",
        validator = { value -> value.isNullOrBlank() || value.toFloatOrNull() != null },
    )
    val spoofAltitudeOption = booleanOption(
        key = "spoofAltitude",
        default = false,
        title = "Spoof Altitude",
        description = "Force altitude readings to a fixed value.",
    )
    val altitudeOption = stringOption(
        key = "altitude",
        default = "0",
        title = "Altitude (meters)",
        description = "Reported altitude in meters.",
        validator = { value -> value.isNullOrBlank() || value.toDoubleOrNull() != null },
    )
    val spoofProviderOption = booleanOption(
        key = "spoofProvider",
        default = false,
        title = "Spoof Provider Name",
        description = "Force Location.getProvider to report gps.",
    )

    execute {
        val latitude = latitudeOption.value?.toDoubleOrNull()
        val longitude = longitudeOption.value?.toDoubleOrNull()
        if (latitude == null || longitude == null) {
            logger.info("Latitude or longitude missing or invalid.")
            return@execute
        }

        val values = buildMap<String, Any> {
            put("getLatitude", latitude)
            put("getLongitude", longitude)
            if (spoofAccuracyOption.value == true) {
                val accuracy = accuracyOption.value?.toFloatOrNull() ?: 10f
                put("getAccuracy", accuracy)
                put("getVerticalAccuracyMeters", accuracy)
            }
            if (spoofAltitudeOption.value == true) {
                put("getAltitude", altitudeOption.value?.toDoubleOrNull() ?: 0.0)
            }
            if (spoofProviderOption.value == true) {
                put("getProvider", "gps")
            }
        }

        val patched = patchMatchingMethods(
            isCandidate = { method ->
                method.implementation?.instructions?.any { isLocationGetter(it, values.keys) } == true
            },
        ) { instructions ->
            var count = 0
            for (index in instructions.indices.reversed()) {
                val instruction = instructions.getOrNull(index) ?: continue
                val reference = methodReferenceOf(instruction)
                val value = reference?.name?.let { values[it] }
                if (value != null &&
                    isLocationGetter(instruction, values.keys) &&
                    forceInvokeResult(instructions, index) { register -> smaliForResult(value, register) }
                ) {
                    count++
                }
            }
            count
        }

        logger.info("Applied $patched GPS spoof replacements ($latitude, $longitude).")
    }
}