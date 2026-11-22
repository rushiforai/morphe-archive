package app.tiktoktv.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import app.tiktoktv.patches.shared.Constants.COMPATIBILITY_TIKTOK_TV
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val FEED_API_CLASS = "Lcom/ss/android/ugc/aweme/tv/feed/api/FeedApi;"
private const val RETROFIT_GET_ANNOTATION = "Lcom/bytedance/retrofit2/c/h;"
private const val TV_FEED_PATH = "/aweme/v1/tv/feed/"
private const val MOBILE_FEED_PATH = "/aweme/v1/feed/"

/**
 * Lite's own For You endpoint. Lite picks between this and the mobile feed on the AB int
 * `feed_fyp_path_switch` (vid 31744, default 1).
 */
private const val LITE_FYP_PATH = "/lite/v2/feed/fyp/"

/** `AppContextImpl.kt`: the only implementation of the applog app context interface. */
private const val APP_CONTEXT_IMPL_CLASS = "Lcom/bytedance/ies/ugc/statisticlogger/config/a;"

/** `I18nLancet.java`: computes the legacy applog version code from a hardcoded dotted version. */
private const val LEGACY_VERSION_CLASS = "Lcom/tiktok/tv/legacy/b/c;"

private const val LITE_PACKAGE_NAME = "com.zhiliaoapp.musically.go"
private const val LITE_VERSION_CODE = 430265
private const val LITE_VERSION_NAME = "43.2.65"

/** Points the TV feed at TikTok Lite's content endpoints. */
@Suppress("unused")
val showTikTokLiteContentPatch = bytecodePatch(
    name = "Show TikTok Lite content",
    description = "Reports the TikTok Lite app id on the wire and targets the live feed endpoint, so the server serves TikTok content instead of the retired TV feed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK_TV)

    val aid by intOption(
        key = "aid",
        default = 1340,
        values = mapOf(
            "TikTok Lite" to 1340,
            "TikTok" to 1233,
            "TikTok TV" to 4082,
        ),
        title = "Wire app id",
        description = "The app id sent in the signed common parameters. TikTok Lite is 1340.",
    )

    val appName by stringOption(
        key = "appName",
        default = "musically_go",
        values = mapOf(
            "TikTok Lite" to "musically_go",
            "TikTok TV" to "tiktok_tv",
        ),
        title = "Wire app name",
        description = "The app name sent in the signed common parameters. TikTok Lite is musically_go.",
    )

    val feedPath by stringOption(
        key = "feedPath",
        default = LITE_FYP_PATH,
        values = mapOf(
            "TikTok Lite personalized FYP" to LITE_FYP_PATH,
            "TikTok mobile feed" to MOBILE_FEED_PATH,
        ),
        title = "Feed endpoint",
        description = "The live endpoint the retired TV feed path is rewritten to. Lite's personalized For You feed is /lite/v2/feed/fyp/; /aweme/v1/feed/ is the mobile fallback.",
    )

    execute {
        val wireAid = aid ?: 1340
        val wireAppName = appName ?: "musically_go"
        val wireFeedPath = feedPath ?: LITE_FYP_PATH

        CommonParamsAppIdFingerprint.let { fingerprint ->
            val valueRegister = fingerprint.instructionMatches[3]
                .getInstruction<OneRegisterInstruction>().registerA
            val aidKeyIndex = fingerprint.instructionMatches.last().index

            // Runs immediately before the `aid` key is read; the value register still
            // holds the app context app id, which is replaced with the wire app id.
            fingerprint.method.addInstruction(
                aidKeyIndex,
                "const-string v$valueRegister, \"$wireAid\"",
            )
        }

        CommonParamsAppNameFingerprint.let { fingerprint ->
            val valueRegister = fingerprint.instructionMatches[1]
                .getInstruction<OneRegisterInstruction>().registerA
            val appNameKeyIndex = fingerprint.instructionMatches.last().index

            // Same trick for `app_name`: the register holding the app context name is
            // overwritten right before the key is put into the common parameters map.
            fingerprint.method.addInstruction(
                appNameKeyIndex,
                "const-string v$valueRegister, \"$wireAppName\"",
            )
        }

        CommonParamsBuildNumberFingerprint.let { fingerprint ->
            val valueRegister = fingerprint.instructionMatches[1]
                .getInstruction<OneRegisterInstruction>().registerA
            val buildNumberKeyIndex = fingerprint.instructionMatches.last().index

            fingerprint.method.addInstruction(
                buildNumberKeyIndex,
                "const-string v$valueRegister, \"$LITE_VERSION_NAME\"",
            )
        }

        OkHttpUserAgentFingerprint.let { fingerprint ->
            val versionResultMatch = fingerprint.instructionMatches[7]
            val versionRegister = versionResultMatch
                .getInstruction<OneRegisterInstruction>().registerA
            fingerprint.method.addInstruction(
                versionResultMatch.index + 1,
                "const v$versionRegister, $LITE_VERSION_CODE",
            )

            val packageResultMatch = fingerprint.instructionMatches[1]
            val packageRegister = packageResultMatch
                .getInstruction<OneRegisterInstruction>().registerA
            fingerprint.method.addInstruction(
                packageResultMatch.index + 1,
                "const-string v$packageRegister, \"$LITE_PACKAGE_NAME\"",
            )
        }

        // The applog app context reports the app version to every wire consumer. The
        // getters are replaced wholesale so version_code, version_name, ab_version,
        // manifest_version_code and update_version_code all read as the Lite build.
        mutableClassDefBy(APP_CONTEXT_IMPL_CLASS).methods.forEach { method ->
            when (method.name) {
                "e", "g" -> {
                    method.addInstruction(0, "const-string v0, \"$LITE_VERSION_NAME\"")
                    method.addInstruction(1, "return-object v0")
                }

                "d", "f", "i" -> {
                    method.addInstruction(0, "const v0, $LITE_VERSION_CODE")
                    method.addInstruction(1, "return v0")
                }
            }
        }

        mutableClassDefBy(LEGACY_VERSION_CLASS).methods
            .first { it.name == "a" && it.parameterTypes.isEmpty() && it.returnType == "I" }
            .apply {
                addInstruction(0, "const v0, $LITE_VERSION_CODE")
                addInstruction(1, "return v0")
            }

        mutableClassDefBy(FEED_API_CLASS).methods.forEach { method ->
            method.annotations
                .filter { it.type == RETROFIT_GET_ANNOTATION }
                .flatMap { it.elements }
                .mapNotNull { it.value as? MutableStringEncodedValue }
                .filter { it.value == TV_FEED_PATH }
                .forEach { it.setValue(wireFeedPath) }
        }
    }
}
