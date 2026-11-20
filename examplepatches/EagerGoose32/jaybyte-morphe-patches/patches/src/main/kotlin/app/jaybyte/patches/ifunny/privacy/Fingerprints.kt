package app.jaybyte.patches.ifunny.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/** iFunny's in-house analytics: queues an event for upload. Returns false when not sent. */
internal object AnalyticsSenderSendFingerprint : Fingerprint(
    definingClass = "Lmobi/ifunny/analytics/AnalyticsSender;",
    returnType = "Z",
    parameters = listOf("Ljava/lang/Object;", "Z", "Lmobi/ifunny/analytics/AnalyticsSender\$SendEventsSettings;"),
)

/** Uploads ad / attribution IDs to iFunny's `app/tracking_ids` endpoint. */
internal object PutAttributionIdsFingerprint : Fingerprint(
    definingClass = "Lmobi/ifunny/analytics/attributionids/AttributionIdsRepositoryImpl;",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Lkotlin/coroutines/Continuation;"),
    filters = listOf(methodCall(name = "putAttributionIds")),
)

/** Starts the periodic background location upload. */
internal object GeoSenderStartFingerprint : Fingerprint(
    definingClass = "Lmobi/ifunny/map/GeoSender;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(methodCall(definingClass = "Lmobi/ifunny/map/GeoCriterion;")),
)

/** Sends a single location fix to iFunny. */
internal object GeoSenderSendFingerprint : Fingerprint(
    definingClass = "Lmobi/ifunny/map/GeoSender;",
    returnType = "V",
    parameters = listOf("Landroid/location/Location;"),
    isStatic = false,
)

/** HUMAN (WhiteOps) fraud/fingerprinting SDK init: Draco.init(Activity, String, InitListener). */
internal object HumanInitFingerprint : Fingerprint(
    definingClass = "Lcom/whiteops/sdk/Draco;",
    returnType = "V",
    isStatic = true,
    parameters = listOf("Landroid/app/Activity;", "Ljava/lang/String;", "Lcom/whiteops/sdk/InitListener;"),
)
