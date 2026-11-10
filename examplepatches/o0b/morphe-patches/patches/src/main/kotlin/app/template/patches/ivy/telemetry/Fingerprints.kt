// recon 2026-11-09
package app.template.patches.ivy.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

internal object FabricWithFingerprint : Fingerprint(
 name = "with",
 definingClass = "Lio/fabric/sdk/android/Fabric;",
 returnType = "Lio/fabric/sdk/android/Fabric;",
 accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.VARARGS),
 parameters = listOf("Landroid/content/Context;", "[Lio/fabric/sdk/android/Kit;"),
 filters = listOf(
  methodCall(definingClass = "Lio/fabric/sdk/android/Fabric\$Builder;", name = "build"),
 ),
)

internal object CrashlyticsLogFingerprint : Fingerprint(
 name = "log",
 definingClass = "Lcom/crashlytics/android/Crashlytics;",
 returnType = "V",
 accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
 parameters = listOf("I", "Ljava/lang/String;", "Ljava/lang/String;"),
 filters = listOf(
  methodCall(definingClass = "Lcom/crashlytics/android/core/CrashlyticsCore;", name = "log"),
 ),
)

internal object CrashlyticsLogExceptionFingerprint : Fingerprint(
 name = "logException",
 definingClass = "Lcom/crashlytics/android/Crashlytics;",
 returnType = "V",
 accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
 parameters = listOf("Ljava/lang/Throwable;"),
 filters = listOf(
  methodCall(definingClass = "Lcom/crashlytics/android/core/CrashlyticsCore;", name = "logException"),
 ),
)

internal object AnswersGetInstanceFingerprint : Fingerprint(
 name = "getInstance",
 definingClass = "Lcom/crashlytics/android/answers/Answers;",
 returnType = "Lcom/crashlytics/android/answers/Answers;",
 accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
 parameters = listOf(),
 filters = listOf(
  methodCall(definingClass = "Lio/fabric/sdk/android/Fabric;", name = "getKit"),
 ),
)

internal object AnalyticsControllerIsEnabledFingerprint : Fingerprint(
 name = "isEnabled",
 definingClass = "Lcom/stinger/ivy/utils/AnalyticsController;",
 returnType = "Z",
 accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
 parameters = listOf(),
 filters = listOf(
  methodCall(definingClass = "Lcom/stinger/ivy/utils/AnalyticsController;", name = "getInstance"),
 ),
)
