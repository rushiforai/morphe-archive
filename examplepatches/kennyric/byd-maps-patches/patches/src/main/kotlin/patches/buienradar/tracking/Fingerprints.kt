package patches.buienradar.tracking

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Creates both Snowplow trackers: RTL (`nl-rtl-prod1.collector.snplow.net`, with the
 * Kantar `nmortlendpoint.2cnt.net` plugin) and DPG Media (`c.dpgmedia.net`).
 * Every caller null-checks the resulting trackers.
 */
internal object SnowplowInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("SnowPlow tracker is INITIALIZED")
)

/**
 * The app's analytics dispatcher: `track(event, screen)` fans out to Firebase Analytics,
 * Snowplow and Usabilla events.
 */
internal object AnalyticsDispatchFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "L"),
    strings = listOf("SNOWPLOW failed to get page name", "Failed to send Usabilla event: ")
)

/** Shared coroutine class whose branch 28 sends `videoPlay` pings to Smartocto. */
internal object SmartoctoRequestFingerprint : Fingerprint(
    strings = listOf("https://ingestion.smartocto.com/")
)

/** Video player state listener that launches the Smartocto ping on first playback. */
internal fun smartoctoListenerFingerprint(requestType: String) = Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        newInstance(requestType),
        literal(0x1c),
        methodCall(definingClass = requestType, name = "<init>")
    )
)

internal object BitmovinPlayerAnalyticsFingerprint : Fingerprint(
    definingClass = "Lcom/bitmovin/player/analytics/internal/AnalyticsConfiguratorKt;",
    name = "configureAnalytics",
    returnType = "Lcom/bitmovin/player/api/Player;",
    parameters = listOf(
        "Lcom/bitmovin/player/api/Player;",
        "Landroid/content/Context;",
        "Lcom/bitmovin/player/api/analytics/AnalyticsPlayerConfig;"
    )
)

internal object BitmovinSourceAnalyticsFingerprint : Fingerprint(
    definingClass = "Lcom/bitmovin/player/analytics/internal/AnalyticsConfiguratorKt;",
    name = "configureAnalytics",
    returnType = "Lcom/bitmovin/player/api/source/Source;",
    parameters = listOf(
        "Lcom/bitmovin/player/api/source/Source;",
        "Lcom/bitmovin/player/api/analytics/AnalyticsSourceConfig;"
    )
)

/** `UbTelemetryRecorder(level, payload, submitter)`: level 0 records and submits nothing. */
internal object UsabillaTelemetryRecorderFingerprint : Fingerprint(
    definingClass = "Lcom/usabilla/sdk/ubform/telemetry/UbTelemetryRecorder;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("I", "Lorg/json/JSONObject;", "L")
)

/** Event-triggered Usabilla campaigns. The user-initiated feedback form is separate. */
internal object UsabillaSendEventFingerprint : Fingerprint(
    definingClass = "Lcom/usabilla/sdk/ubform/Usabilla;",
    name = "sendEvent",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;")
)

/** Crashlytics `DataCollectionArbiter` constructor (persisted override, then manifest flag). */
internal object CrashlyticsArbiterFingerprint : Fingerprint(
    strings = listOf("Could not read data collection permission from manifest")
)

/** `DataCollectionArbiter.isAutomaticDataCollectionEnabled()`. */
internal fun crashlyticsCollectionEnabledFingerprint(arbiterType: String) = Fingerprint(
    definingClass = arbiterType,
    returnType = "Z",
    parameters = listOf(),
    custom = { method, _ -> AccessFlags.DECLARED_SYNCHRONIZED.isSet(method.accessFlags) }
)

internal const val BACKGROUND_LOCATION_ENTITY =
    "Lnl/rtl/buienradar/data/components/li/BackgroundLocationEntity;"

internal object SwrveModelBlacklistFingerprint : Fingerprint(
    definingClass = "Lnl/rtl/buienradar/app/App;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
    strings = listOf("Current device is part of the model blacklist")
)
