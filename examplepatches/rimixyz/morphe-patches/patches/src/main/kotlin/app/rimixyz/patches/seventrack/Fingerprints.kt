package app.rimixyz.patches.seventrack

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Fingerprints for the Flutter `shared_preferences` plugin inside 17TRACK.
 *
 * The VIP/"Deals" flags are read by the Dart code through Pigeon:
 *   dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getBool/getString
 *
 * Both calls end up in [SharedPreferencesBackend] below, which is plain DEX code.
 * Hooking these two methods lets a patch override the locally cached flags
 * without touching the AOT-compiled Dart snapshot in libapp.so.
 */
object SharedPreferencesGetBoolFingerprint : Fingerprint(
    definingClass = "Lio/flutter/plugins/sharedpreferences/SharedPreferencesBackend;",
    name = "getBool",
    returnType = "Ljava/lang/Boolean;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions;",
    ),
    filters = listOf(
        string("key"),
        string("options"),
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "getBoolean",
        ),
    ),
)

object SharedPreferencesSetStringFingerprint : Fingerprint(
    definingClass = "Lio/flutter/plugins/sharedpreferences/SharedPreferencesBackend;",
    name = "setString",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions;",
    ),
    filters = listOf(
        string("key"),
        string("value"),
        string("options"),
        methodCall(
            definingClass = "Landroid/content/SharedPreferences\$Editor;",
            name = "putString",
        ),
    ),
)

object SharedPreferencesGetStringFingerprint : Fingerprint(
    definingClass = "Lio/flutter/plugins/sharedpreferences/SharedPreferencesBackend;",
    name = "getString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions;",
    ),
    filters = listOf(
        string("key"),
        string("options"),
    ),
)
