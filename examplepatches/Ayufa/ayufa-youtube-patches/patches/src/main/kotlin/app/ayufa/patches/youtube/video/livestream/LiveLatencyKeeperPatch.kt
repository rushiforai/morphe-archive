package app.ayufa.patches.youtube.video.livestream

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.resourcePatch
import app.ayufa.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE_ANDROID_8
import app.ayufa.patches.youtube.shared.declareAyufaSettingsEditTextPreference
import app.ayufa.patches.youtube.shared.declareAyufaSettingsSwitches
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableIntEncodedValue

private const val EXTENSION_CLASS = "Lapp/ayufa/extension/youtube/LiveLatencyKeeper;"

// Key of the Morphe settings switch that enables/disables the keeper at
// runtime. The extension reads the same key from "morphe_prefs".
private const val KEY_KEEP_LIVE_AT_EDGE = "ayufa_keep_live_at_edge"

// Key of the Morphe settings text field that sets the re-sync interval
// (in minutes) at runtime. The user types the value in directly; the
// extension reads the same key from "morphe_prefs", parses it and
// clamps it to 0..120 (0 turns the automatic re-sync off).
private const val KEY_SYNC_INTERVAL_MINUTES = "ayufa_live_sync_interval_minutes"

private const val DEFAULT_SYNC_INTERVAL_MINUTES = "10"

/**
 * Declares the keeper's on/off switch and the re-sync interval text
 * field on the dedicated "Ayufa patch settings" screen in Morphe
 * settings. See [declareAyufaSettingsSwitches] and
 * [declareAyufaSettingsEditTextPreference].
 */
private val liveLatencyKeeperSettingsPatch = resourcePatch {
    execute {
        declareAyufaSettingsSwitches(
            keys = listOf(KEY_KEEP_LIVE_AT_EDGE),
            enStrings = mapOf(
                "${KEY_KEEP_LIVE_AT_EDGE}_title" to "Keep live streams at the live edge",
                "${KEY_KEEP_LIVE_AT_EDGE}_summary" to
                    "At a fixed interval, momentarily pauses and resumes live playback " +
                    "to snap it back to the newest position. Takes effect immediately."
            ),
            jaStrings = mapOf(
                "${KEY_KEEP_LIVE_AT_EDGE}_title" to "ライブ配信を最新の状態に保つ",
                "${KEY_KEEP_LIVE_AT_EDGE}_summary" to
                    "一定の間隔で、ライブ再生を瞬間的に停止→再生して最新の位置に合わせ直します。" +
                    "その場で反映されます。"
            )
        )
        declareAyufaSettingsEditTextPreference(
            key = KEY_SYNC_INTERVAL_MINUTES,
            defaultValue = DEFAULT_SYNC_INTERVAL_MINUTES,
            enStrings = mapOf(
                "${KEY_SYNC_INTERVAL_MINUTES}_title" to "Live sync interval (minutes)",
                "${KEY_SYNC_INTERVAL_MINUTES}_summary" to
                    "Type in how often (0-120 minutes) live playback is snapped back " +
                    "to the newest position with a momentary pause and resume. " +
                    "0 turns the automatic re-sync off. Takes effect immediately."
            ),
            jaStrings = mapOf(
                "${KEY_SYNC_INTERVAL_MINUTES}_title" to "先端に合わせる間隔（分）",
                "${KEY_SYNC_INTERVAL_MINUTES}_summary" to
                    "ライブ再生を停止→再生で最新に合わせ直す間隔を、0〜120分で入力します。" +
                    "0分では自動更新しません。その場で反映されます。"
            )
        )
    }
}

// Defaults declared in the extension class <clinit>.
// The patch rewrites these literals when the user changes the options.
private const val DEFAULT_CHECK_INTERVAL_MINUTES = 10

private val checkIntervalOption = intOption(
    key = "liveLatencySyncIntervalMinutes",
    default = DEFAULT_CHECK_INTERVAL_MINUTES,
    values = mapOf(
        "Off (0 minutes)" to 0,
        "1 minute" to 1,
        "2 minutes" to 2,
        "3 minutes" to 3,
        "5 minutes" to 5,
        "10 minutes" to 10,
        "15 minutes" to 15,
        "20 minutes" to 20,
        "30 minutes" to 30,
        "45 minutes" to 45,
        "60 minutes" to 60,
        "90 minutes" to 90,
        "120 minutes" to 120
    ),
    title = "Default sync interval (minutes)",
    description = "How often live playback is snapped back to the newest position " +
        "with a momentary pause and resume. " +
        "Used until the interval is changed in Morphe settings (Ayufa patch settings), " +
        "where any value from 0 to 120 minutes can be typed in.",
    required = true
)

@Suppress("unused")
val liveLatencyKeeperPatch = bytecodePatch(
    name = "Live latency keeper",
    description = "At a fixed interval, momentarily pauses and resumes live stream playback " +
        "so it snaps back to the live edge (the newest position), no matter how far behind " +
        "it has fallen. The interval (any value from 0 to 120 minutes, typed in directly) " +
        "and the on/off switch can be changed in " +
        "Morphe settings (Ayufa patch settings) without re-patching. For YouTube 20.26.46 " +
        "(Android 8.0) only. Requires the official Morphe patches to be applied as well.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_ANDROID_8)

    dependsOn(liveLatencyKeeperSettingsPatch)

    extendWith("extensions/youtube.mpe")

    checkIntervalOption()

    execute {
        val checkIntervalMinutes by checkIntervalOption

        // Write the option values into the extension class by replacing the
        // static initial values of its config fields. (The extension is
        // compiled so the defaults live in the fields' encoded initial
        // values, not in <clinit> code.) If the extension class cannot be
        // found or edited, the defaults stay in effect and nothing fails.
        try {
            if (classDefByOrNull(EXTENSION_CLASS) != null) {
                val extensionClass = mutableClassDefBy(EXTENSION_CLASS)
                setFieldInitialValue(extensionClass, "checkIntervalMinutes", checkIntervalMinutes)
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
