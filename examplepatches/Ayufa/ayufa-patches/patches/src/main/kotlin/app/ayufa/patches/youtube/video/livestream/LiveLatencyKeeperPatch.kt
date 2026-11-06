package app.ayufa.patches.youtube.video.livestream

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.resourcePatch
import app.ayufa.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE_ANDROID_8
import app.ayufa.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE_MODERN
import app.ayufa.patches.youtube.shared.declareAyufaSettingsSwitches
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableIntEncodedValue

private const val EXTENSION_CLASS = "Lapp/ayufa/extension/youtube/LiveLatencyKeeper;"

// Key of the Morphe settings switch that enables/disables the keeper at
// runtime. The extension reads the same key from "morphe_prefs".
private const val KEY_KEEP_LIVE_AT_EDGE = "ayufa_keep_live_at_edge"

/**
 * Declares the keeper's on/off switch on the dedicated "Ayufa patch
 * settings" screen in Morphe settings. See [declareAyufaSettingsSwitches].
 */
private val liveLatencyKeeperSettingsPatch = resourcePatch {
    execute {
        declareAyufaSettingsSwitches(
            keys = listOf(KEY_KEEP_LIVE_AT_EDGE),
            enStrings = mapOf(
                "${KEY_KEEP_LIVE_AT_EDGE}_title" to "Keep live streams at the live edge",
                "${KEY_KEEP_LIVE_AT_EDGE}_summary" to
                    "Periodically checks live playback and seeks to the live edge " +
                    "when it has fallen behind. Takes effect immediately."
            ),
            jaStrings = mapOf(
                "${KEY_KEEP_LIVE_AT_EDGE}_title" to "ライブ配信を最新の状態に保つ",
                "${KEY_KEEP_LIVE_AT_EDGE}_summary" to
                    "ライブ再生が遅れてきたら、自動で最新の位置（ライブの先端）へ進めます。" +
                    "その場で反映されます。"
            )
        )
    }
}

// Defaults declared in the extension class <clinit>.
// The patch rewrites these literals when the user changes the options.
private const val DEFAULT_CHECK_INTERVAL_SECONDS = 45
private const val DEFAULT_THRESHOLD_SECONDS = 15
private const val DEFAULT_SAFETY_SECONDS = 2

private val checkIntervalOption = intOption(
    key = "liveLatencyCheckIntervalSeconds",
    default = DEFAULT_CHECK_INTERVAL_SECONDS,
    values = mapOf(
        "15 seconds" to 15,
        "30 seconds" to 30,
        "45 seconds" to 45,
        "60 seconds" to 60,
        "120 seconds" to 120
    ),
    title = "Check interval",
    description = "How often to check how far live playback is behind the live edge.",
    required = true
)

private val thresholdOption = intOption(
    key = "liveLatencyThresholdSeconds",
    default = DEFAULT_THRESHOLD_SECONDS,
    values = mapOf(
        "10 seconds" to 10,
        "15 seconds" to 15,
        "30 seconds" to 30,
        "60 seconds" to 60
    ),
    title = "Catch-up threshold",
    description = "Seek to the live edge when playback is behind it by more than this.",
    required = true
)

private val safetyOption = intOption(
    key = "liveLatencySafetySeconds",
    default = DEFAULT_SAFETY_SECONDS,
    values = mapOf(
        "0 seconds" to 0,
        "2 seconds" to 2,
        "5 seconds" to 5
    ),
    title = "Live edge safety margin",
    description = "Seek to this many seconds before the live edge, to avoid rebuffering at the very edge.",
    required = true
)

@Suppress("unused")
val liveLatencyKeeperPatch = bytecodePatch(
    name = "Live latency keeper",
    description = "Periodically checks live stream playback and automatically seeks to the " +
        "live edge when playback has fallen behind. Can be toggled in Morphe settings " +
        "(Ayufa patch settings) without re-patching. For YouTube 20.26.46 (Android 8.0) " +
        "and 21.30.216. Requires the official Morphe patches to be applied as well.",
    default = false
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_ANDROID_8, COMPATIBILITY_YOUTUBE_MODERN)

    dependsOn(liveLatencyKeeperSettingsPatch)

    extendWith("extensions/youtube.mpe")

    checkIntervalOption()
    thresholdOption()
    safetyOption()

    execute {
        val checkIntervalSeconds by checkIntervalOption
        val thresholdSeconds by thresholdOption
        val safetySeconds by safetyOption

        // Write the option values into the extension class by replacing the
        // static initial values of its config fields. (The extension is
        // compiled so the defaults live in the fields' encoded initial
        // values, not in <clinit> code.) If the extension class cannot be
        // found or edited, the defaults stay in effect and nothing fails.
        try {
            if (classDefByOrNull(EXTENSION_CLASS) != null) {
                val extensionClass = mutableClassDefBy(EXTENSION_CLASS)
                setFieldInitialValue(extensionClass, "checkIntervalSeconds", checkIntervalSeconds)
                setFieldInitialValue(extensionClass, "thresholdSeconds", thresholdSeconds)
                setFieldInitialValue(extensionClass, "safetySeconds", safetySeconds)
            }
        } catch (ex: Exception) {
            // Keep the extension defaults.
        }

        // Hook the media progress callback: its called constructor receives
        // the current playback time as the first parameter (p1, p2).
        // Index 2 is right after the super constructor call, the same
        // insertion point the official Morphe video time hook uses.
        MediaProgressFingerprint.instructionMatches.first().getMethodCalled().addInstruction(
            2,
            "invoke-static { p1, p2 }, $EXTENSION_CLASS->videoTimeChanged(J)V"
        )
    }
}

/**
 * Sets the static initial value of an int field of the extension class.
 * Does nothing if the field is missing or the value is null.
 */
private fun setFieldInitialValue(
    extensionClass: app.morphe.patcher.util.proxy.mutableTypes.MutableClass,
    fieldName: String,
    newValue: Int?
) {
    if (newValue == null) {
        return
    }
    val field = extensionClass.fields.firstOrNull { it.name == fieldName } ?: return
    (field.initialValue as? MutableIntEncodedValue)?.value = newValue
}
