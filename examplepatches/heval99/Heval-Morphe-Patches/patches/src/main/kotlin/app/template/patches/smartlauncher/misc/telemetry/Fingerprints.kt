package app.template.patches.smartlauncher.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal const val FIREBASE_ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"

// The app's analytics switch. App.onCreate and the preference listener call this no-arg boolean
// method; it reads the user's choice, hands it to Firebase as setAnalyticsCollectionEnabled (R8
// inlined it into a Boolean.valueOf plus a zzez task) and returns the same value. Found by the
// library field it dereferences, so the obfuscated names do not matter.
internal object AnalyticsSwitchFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(definingClass = FIREBASE_ANALYTICS, opcode = Opcode.IGET_OBJECT),
        methodCall(definingClass = "Ljava/lang/Boolean;", name = "valueOf"),
    ),
)

// FirebaseAnalytics.logEvent. The class is a kept library class; R8 renamed the method but it
// is still the only (String, Bundle) void in it (setCurrentScreen takes three parameters).
internal object FirebaseAnalyticsLogEventFingerprint : Fingerprint(
    definingClass = FIREBASE_ANALYTICS,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;"),
)

// Crashlytics' renamed setCrashlyticsCollectionEnabled(boolean): the writer that stores the
// choice under the documented preference key. The reader of the same key takes no boolean.
internal object CrashlyticsCollectionSetterFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    strings = listOf("firebase_crashlytics_collection_enabled"),
    filters = listOf(
        methodCall(definingClass = "Landroid/content/SharedPreferences\$Editor;", name = "putBoolean"),
    ),
)
