package app.waze.elevenlabs.maps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

// Google Maps is fully R8-obfuscated and renamed in every build, so nothing here names its
// classes or methods. Targets are found by log strings, preference keys and framework types;
// androidx.preference keeps its class names, so its renamed methods are found by their code.

private const val STRING = "Ljava/lang/String;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
internal const val PREFERENCE = "Landroidx/preference/Preference;"
internal const val PREFERENCE_GROUP = "Landroidx/preference/PreferenceGroup;"

/**
 * The navigation speech queue's run(): takes the next instruction, looks it up in the tts-cache
 * and otherwise has a synthesizer write it to a file.
 */
object SpeechQueueFingerprint : Fingerprint(
    name = "run",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("Interrupted while waiting for an element in the queue."),
)

/** Creates the "tts-cache" directory Maps keeps synthesized instructions in; first parameter is the Application. */
object SpeechCacheFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    strings = listOf("tts-cache"),
    custom = { method, _ -> method.parameterTypes.firstOrNull()?.toString() == "Landroid/app/Application;" },
)

/** Navigation settings' onCreatePreferences: looks up the "Sound & voice" category by key. */
object SoundVoiceSettingsFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;", STRING),
    strings = listOf("sound_voice_settings"),
)

/** Preference.setSummary(CharSequence): the setter that refuses when a SummaryProvider is set. */
object PreferenceSetSummaryFingerprint : Fingerprint(
    definingClass = PREFERENCE,
    returnType = "V",
    parameters = listOf(CHAR_SEQUENCE),
    strings = listOf("Preference already has a SummaryProvider set."),
)

/**
 * Preference.setKey(String): refuses an empty key when the preference requires one. Maps' settings
 * click handler reads every tapped preference's key, so the entry needs one.
 */
object PreferenceSetKeyFingerprint : Fingerprint(
    definingClass = PREFERENCE,
    returnType = "V",
    parameters = listOf(STRING),
    strings = listOf("Preference does not have a key assigned."),
)

/** PreferenceGroup.addPreference(Preference): inserts at the binary-search position. */
object PreferenceGroupAddFingerprint : Fingerprint(
    definingClass = PREFERENCE_GROUP,
    returnType = "V",
    parameters = listOf(PREFERENCE),
    filters = listOf(methodCall(definingClass = "Ljava/util/Collections;", name = "binarySearch")),
)
