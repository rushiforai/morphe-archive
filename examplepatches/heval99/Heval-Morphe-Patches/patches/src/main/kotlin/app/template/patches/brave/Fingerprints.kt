package app.template.patches.brave

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// Brave keeps P3A and the usage ping switches in Chromium's native "local state" prefs. Java
// reaches them through two real (JNI-kept, never renamed) classes; only their method names are
// R8-obfuscated, so these fingerprints anchor on the class plus the method shape.
internal const val LOCAL_STATE_PREFS_CLASS = "Lorg/chromium/chrome/browser/prefs/LocalStatePrefs;"
internal const val PREF_SERVICE_CLASS = "Lorg/chromium/components/prefs/PrefService;"

internal const val P3A_ENABLED_PREF = "brave.p3a.enabled"
internal const val STATS_REPORTING_ENABLED_PREF = "brave.stats.reporting_enabled"

// The "Web discovery project" switch's native pref. Profile-scoped (the Search engines screen's
// own "send_web_discovery" switch writes it too), unlike the local-state P3A / usage ping prefs.
internal const val WEB_DISCOVERY_ENABLED_PREF = "brave.web_discovery_enabled"
internal const val BROWSER_CONTEXT_HANDLE = "Lorg/chromium/content_public/browser/BrowserContextHandle;"
internal const val PROFILE = "Lorg/chromium/chrome/browser/profiles/Profile;"

internal const val ORIGIN_PREFERENCES_CLASS =
    "Lorg/chromium/chrome/browser/settings/BraveOriginPreferences;"

// The policy-write callback (xk2.a(Z)V in 1.98.60): logs "Failed to set policy value for ..." on
// failure, then shows the Origin restart snackbar. The snackbar method is p5()V up to 1.97 and
// R4(II)V since 1.98 (title and message string ids loaded by `const` right before the call); the
// patch accepts both shapes and checks there is exactly one Origin preferences void call.
internal object OriginRestartPromptFingerprint : Fingerprint(
    strings = listOf(string("Failed to set policy value for ", StringComparisonType.CONTAINS)),
    filters = listOf(
        methodCall(
            definingClass = ORIGIN_PREFERENCES_CLASS,
            returnType = "V",
        ),
    ),
)

// LocalStatePrefs.a(): the local state PrefService, or null until native prefs are loaded.
internal object LocalStatePrefsGetterFingerprint : Fingerprint(
    definingClass = LOCAL_STATE_PREFS_CLASS,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = PREF_SERVICE_CLASS,
    parameters = emptyList(),
)

// PrefService.f(String, boolean): setBoolean. The only (String, Z)V method on the class.
internal object PrefServiceSetBooleanFingerprint : Fingerprint(
    definingClass = PREF_SERVICE_CLASS,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Z"),
)

// LocalStatePrefs.setNativePrefsLoaded(): @CalledByNative on every startup as soon as local
// state is loaded, before the stats updater or the P3A uploader run.
internal object LocalStatePrefsLoadedFingerprint : Fingerprint(
    definingClass = LOCAL_STATE_PREFS_CLASS,
    name = "setNativePrefsLoaded",
    returnType = "V",
    parameters = emptyList(),
)
