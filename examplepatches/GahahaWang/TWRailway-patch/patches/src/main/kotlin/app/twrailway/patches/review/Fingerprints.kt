package app.twrailway.patches.review

import app.morphe.patcher.Fingerprint

/**
 * `SharedPreferencesAsyncApi.Companion.setUp(BinaryMessenger, SharedPreferencesAsyncApi, String)`
 * of the shared_preferences_android Flutter plugin. Its second parameter is the obfuscated
 * `SharedPreferencesAsyncApi` interface.
 */
internal object SharedPreferencesAsyncApiSetUpFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf(
        "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getBool",
    ),
    custom = { method, _ -> method.parameterTypes.size == 3 },
)
