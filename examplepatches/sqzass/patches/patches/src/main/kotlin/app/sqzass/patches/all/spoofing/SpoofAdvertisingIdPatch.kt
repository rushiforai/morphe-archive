package app.sqzass.patches.all.spoofing

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.sqzass.patches.shared.constStringLoad
import app.sqzass.patches.shared.findConstArgInvokes
import app.sqzass.patches.shared.forceInvokeResult
import app.sqzass.patches.shared.methodReferenceOf
import app.sqzass.patches.shared.patchMatchingMethods
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import java.util.logging.Logger
import java.util.UUID

private val logger = Logger.getLogger("SpoofAdvertisingIdPatch")

private const val ADVERTISING_ID_INFO = "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$AdvertisingIdInfo;"
private const val SETTINGS_SECURE = "Landroid/provider/Settings$Secure;"

private const val ANDROID_ID_KEY = "android_id"

private val RANDOM_AD_ID = UUID.randomUUID().toString()

@Suppress("unused")
val spoofAdvertisingIdPatch = bytecodePatch(
    name = "Spoof advertising ID",
    description = "Forces the Google Advertising ID (AdvertisingIdClient) and Settings.Secure ANDROID_ID to report a fixed random value, and disables limit-ad-tracking reads.",
    default = false,
) {
    category("Spoofing")

    val adIdOption = stringOption(
        key = "advertisingId",
        default = RANDOM_AD_ID,
        title = "Advertising ID",
        description = "Value reported by AdvertisingIdClient.getId(). Leave blank to generate a random ID.",
        validator = { value -> value.isNullOrBlank() || Regex("^[0-9a-fA-F-]{36}$").matches(value) },
    )
    val spoofLatOption = booleanOption(
        key = "spoofLimitAdTracking",
        default = true,
        title = "Disable Limit Ad Tracking",
        description = "Force AdvertisingIdInfo.isLimitAdTrackingEnabled to return false.",
    )
    val spoofAndroidIdOption = booleanOption(
        key = "spoofAndroidId",
        default = true,
        title = "Spoof ANDROID_ID",
        description = "Also force Settings.Secure.getString(..., \"android_id\") to report the same value.",
    )

    execute {
        val adId = adIdOption.value?.takeIf { it.isNotBlank() } ?: RANDOM_AD_ID
        val spoofLat = spoofLatOption.value == true
        val spoofAndroidId = spoofAndroidIdOption.value == true

        if (!spoofLat && !spoofAndroidId) {
            logger.info("All spoofing options disabled.")
            return@execute
        }

        var patched = 0

        patched += patchMatchingMethods(
            isCandidate = { method ->
                method.implementation?.instructions?.any {
                    isAdInfoGetter(it, setOf("getId"))
                } == true
            },
        ) { instructions ->
            var count = 0
            for (index in instructions.indices.reversed()) {
                val instruction = instructions.getOrNull(index) ?: continue
                if (isAdInfoGetter(instruction, setOf("getId")) &&
                    forceInvokeResult(instructions, index) { register -> "const-string v$register, \"$adId\"" }
                ) {
                    count++
                }
            }
            count
        }

        if (spoofLat) {
            patched += patchMatchingMethods(
                isCandidate = { method ->
                    method.implementation?.instructions?.any {
                        isAdInfoGetter(it, setOf("isLimitAdTrackingEnabled"))
                    } == true
                },
            ) { instructions ->
                var count = 0
                for (index in instructions.indices.reversed()) {
                    val instruction = instructions.getOrNull(index) ?: continue
                    if (isAdInfoGetter(instruction, setOf("isLimitAdTrackingEnabled")) &&
                        forceInvokeResult(instructions, index) { register -> "const/4 v$register, 0x0" }
                    ) {
                        count++
                    }
                }
                count
            }
        }

        if (spoofAndroidId) {
            patched += patchMatchingMethods(
                isCandidate = { method ->
                    method.implementation?.instructions?.let { raw ->
                        val instructions = raw.toList()
                        findConstArgInvokes(
                            instructions,
                            { constStringLoad(it) == ANDROID_ID_KEY },
                            ::isSettingsSecureGet,
                        ).isNotEmpty()
                    } == true
                },
            ) { instructions ->
                var count = 0
                for (index in findConstArgInvokes(
                    instructions,
                    { constStringLoad(it) == ANDROID_ID_KEY },
                    ::isSettingsSecureGet,
                ).sortedDescending()) {
                    if (forceInvokeResult(instructions, index) { register ->
                        "const-string v$register, \"$adId\""
                    }) {
                        count++
                    }
                }
                count
            }
        }

        logger.info("Applied $patched advertising ID / ANDROID_ID spoof replacements (id=$adId).")
    }
}

private fun isAdInfoGetter(instruction: Instruction, keys: Set<String>): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass == ADVERTISING_ID_INFO &&
        reference.name in keys &&
        reference.returnType in setOf("Ljava/lang/String;", "Z")
}

private fun isSettingsSecureGet(instruction: Instruction): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass == SETTINGS_SECURE &&
        reference.name == "getString" &&
        reference.returnType == "Ljava/lang/String;"
}

