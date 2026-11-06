package id.ikuradachi.patches.crunchyroll.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object SegmentPayloadAdmissionFingerprint : Fingerprint(
    definingClass = "Lcom/segment/analytics/Analytics;",
    name = "enqueue",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Lcom/segment/analytics/integrations/BasePayload;"),
    returnType = "V",
    filters = listOf(
        methodCall(smali = "Lcom/segment/analytics/BooleanPreference;->get()Z"),
        string("Created payload %s."),
        newInstance("Lcom/segment/analytics/MiddlewareChainRunner;"),
    ),
)

object MuxEventAdmissionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L"),
    returnType = "V",
    filters = listOf(
        string("viewstart"),
        string("viewend"),
        string("renditionchange"),
        string("Event not handled, ratelimited: "),
        string("MuxStatsEventQueue"),
    ),
)

object FirebaseAnalyticsCollectionObserverFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/Object;", "L"),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        methodCall(smali = "Ljava/lang/Boolean;->booleanValue()Z"),
        opcode(Opcode.MOVE_RESULT, InstructionLocation.MatchAfterImmediately()),
        string("Updating Firebase Analytics collection enabled = "),
        methodCall(smali = "Lcom/google/firebase/analytics/FirebaseAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;"),
        methodCall(smali = "Lcom/google/firebase/analytics/FirebaseAnalytics;->setAnalyticsCollectionEnabled(Z)V"),
    ),
)

object CrashlyticsAutomaticPermissionFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;",
    name = "isAutomaticDataCollectionEnabled",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.DECLARED_SYNCHRONIZED),
    parameters = emptyList(),
    returnType = "Z",
    filters = listOf(
        methodCall(smali = "Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;->isFirebaseDataCollectionDefaultEnabled()Z"),
        methodCall(smali = "Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;->logDataCollectionState(Z)V"),
    ),
)

object DatadogSetupFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L"),
    returnType = "V",
    filters = listOf(
        string("environmentDomain"),
        opcode(Opcode.IGET_BOOLEAN),
        opcode(Opcode.IF_EQZ, InstructionLocation.MatchAfterWithin(1)),
        string("trackingConsent"),
        string("_dd.sdk_core.default"),
        string("rum-pipeline"),
        string("installation_source"),
        string("Locale Fallback"),
    ),
)
