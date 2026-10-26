package id.ikuradachi.patches.bstation.tracking

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object NeuronDispatchFingerprint : Fingerprint(
    definingClass = "Llt/e;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/util/List;"),
    returnType = "V",
    filters = listOf(
        fieldAccess(smali = "Llt/e;->b:Ldu/a;"),
        fieldAccess(smali = "Llt/e;->j:Lp61/l;"),
        methodCall(
            definingClass = "Ldu/a;",
            name = "c",
            parameters = listOf("Ljava/util/List;", "Lp61/l;"),
            returnType = "V",
        ),
    ),
)

object ApmHasakiInitFingerprint : Fingerprint(
    definingClass = "Lcom/bilibili/apm/Hasaki;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(
        "Landroid/app/Application;",
        "Ljava/util/List;",
        "Lcom/bilibili/apm/a;",
        "Lp61/l;",
    ),
    returnType = "V",
    filters = listOf(
        fieldAccess(smali = "Lcom/bilibili/apm/Hasaki;->b:Lb9/a;"),
    ),
)

object FirebaseAnalyticsLogFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Landroid/os/Bundle;"),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
            name = "getInstance",
        ),
        methodCall(
            definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
            name = "logEvent",
        ),
    ),
)

object CrashlyticsInitFingerprint : Fingerprint(
    definingClass = "Lel0/b;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/Thread\$UncaughtExceptionHandler;"),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/firebase/FirebaseApp;",
            name = "getApps",
        ),
        methodCall(
            definingClass = "Lel0/b;",
            name = "c",
        ),
    ),
)

object TradPlusInitFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(
        "Landroid/app/Application;",
        "Ljava/lang/String;",
        "Lcom/tradplus/ads/open/TradPlusSdk\$TradPlusInitListener;",
    ),
    returnType = "Z",
    filters = listOf(
        methodCall(smali = "Lcom/tradplus/ads/open/TradPlusSdk;->getIsInit()Z"),
        string("TradPlusLog"),
    ),
)

object FacebookAppEventsLogFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/appevents/AppEventsLogger;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;"),
    returnType = "V",
    filters = listOf(
        fieldAccess(smali = "Lcom/facebook/appevents/AppEventsLogger;->a:Lcom/facebook/appevents/o;"),
        methodCall(
            definingClass = "Lcom/facebook/appevents/o;",
            name = "l",
            parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;"),
            returnType = "V",
        ),
    ),
)
