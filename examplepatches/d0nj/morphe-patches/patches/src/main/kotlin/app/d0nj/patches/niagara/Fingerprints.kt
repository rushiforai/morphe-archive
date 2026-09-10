package app.d0nj.patches.niagara

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object EntitlementConstructorFingerprint : Fingerprint(
    definingClass = "Lb/sLaEsTxcR6YA4wmGL2iX1gH3Cgh;",
    name = "<init>",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("Z", "Z", "Z"),
)

internal const val WORKER_METHOD_NAME = "Wi7PASgBlVe5z"
internal const val WORKER_METHOD_RETURN_TYPE = "Ljava/lang/Object;"
internal const val WORKER_CONTINUATION_PARAM = "Lb/dWSFTr4KZHXoCfi7Q;"

object UsageReportUploadWorkerFingerprint : Fingerprint(
    definingClass = "Lbitpit/launcher/usage/report/UsageReportUploadWorker;",
    name = WORKER_METHOD_NAME,
    returnType = WORKER_METHOD_RETURN_TYPE,
    parameters = listOf(WORKER_CONTINUATION_PARAM),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)

object RetentionEventsWorkerFingerprint : Fingerprint(
    definingClass = "Lbitpit/launcher/analytics/RetentionEventsWorker;",
    name = WORKER_METHOD_NAME,
    returnType = WORKER_METHOD_RETURN_TYPE,
    parameters = listOf(WORKER_CONTINUATION_PARAM),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)

object GdprConsentSyncWorkerFingerprint : Fingerprint(
    definingClass = "Lbitpit/launcher/analytics/consent/GdprConsentSyncWorker;",
    name = WORKER_METHOD_NAME,
    returnType = WORKER_METHOD_RETURN_TYPE,
    parameters = listOf(WORKER_CONTINUATION_PARAM),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)

object SingularFirstSessionReportWorkerFingerprint : Fingerprint(
    definingClass = "Lbitpit/launcher/analytics/singular/SingularFirstSessionReportWorker;",
    name = WORKER_METHOD_NAME,
    returnType = WORKER_METHOD_RETURN_TYPE,
    parameters = listOf(WORKER_CONTINUATION_PARAM),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)

object SingularSessionReportWorkerFingerprint : Fingerprint(
    definingClass = "Lbitpit/launcher/analytics/singular/SingularSessionReportWorker;",
    name = WORKER_METHOD_NAME,
    returnType = WORKER_METHOD_RETURN_TYPE,
    parameters = listOf(WORKER_CONTINUATION_PARAM),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)

object AttributionPostFingerprint : Fingerprint(
    definingClass = "Lb/jsTKWw8aOJh1Mhtu1dB;",
    name = "I7nIhTYv0owlWRTC6ZCUH5Aw",
    returnType = WORKER_METHOD_RETURN_TYPE,
    parameters = listOf(
        "Ljava/lang/String;",
        "Lb/vi8jGSYyFZ9;",
        "Lkotlinx/serialization/KSerializer;",
        WORKER_CONTINUATION_PARAM,
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)

object FirebaseCollectionToggleFingerprint : Fingerprint(
    definingClass = "Lb/Ai2wA3EaTRelF3tpfrtxJPV6aOl7Z;",
    name = "LlilrjZop286RU6Rrht2",
    returnType = "V",
    parameters = listOf("Z"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)
