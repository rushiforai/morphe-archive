package app.stayfree.patches.telemetry

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Amplitude (legacy `AmplitudeClient`, R8-renamed to `Lgl;` in 20.14.1) routes every public API
 * (logEvent, identify, setUserId, uploadEvents, enableForegroundTracking, …) through
 * `contextAndApiKeySet(String caller)`. Making it return false turns the whole client into a
 * no-op that only logs, without touching `AmplitudeInitializer`, whose `create()` also runs the
 * shared usage-SDK bootstrap (`f87.B(b20, oc8)`) and so must keep executing.
 */
object AmplitudeContextAndApiKeySetFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf(
        "apiKey cannot be null or empty, set apiKey with initialize() before calling ",
        "context cannot be null, set context with initialize() before calling ",
    ),
)

/**
 * Crashlytics `DataCollectionArbiter.logDataCollectionState(boolean)`. Only used as an anchor:
 * R8 merged the arbiter into a large shared class (`Lll2;`), and the method we actually patch,
 * `isAutomaticDataCollectionEnabled()`, has no strings of its own.
 */
object CrashlyticsLogDataCollectionStateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    strings = listOf(
        "Crashlytics automatic data collection ",
        "firebase_crashlytics_collection_enabled manifest flag",
    ),
)

/**
 * `isAutomaticDataCollectionEnabled()` — scoped to the arbiter's class. It is the only
 * `synchronized ()Z` method there. Every Crashlytics report send (including the Flutter
 * plugin's `sendUnsentReports` path) is gated on it, and it also overrides whatever Dart passes
 * to `setCrashlyticsCollectionEnabled(true)`, which the manifest flag alone would not.
 */
object CrashlyticsIsAutomaticDataCollectionEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.DECLARED_SYNCHRONIZED),
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * SensorTower usage SDK preferences (`Lflb;`, backed by the `usage-sdk-preferences` file).
 * Two `()Z` getters read `usage-sdk-opt-out`:
 *  - `isOptedOut()` — checked by every uploader (`jt0`, `rgb`, `hc`, …) before sending
 *    app/web usage, accessibility-scraped browsing, shopping, IAP, brand mentions and ChatGPT
 *    prompt data to `api.stayfreeapps.com/v1/analytics/...`.
 *  - `hasMadeConsentChoice()` — `optedOut || has-accepted-terms`; returning true here keeps the
 *    "required data consent" bottom sheet from nagging once opt-out is forced.
 * The fingerprint matches both; the patch forces every match to return true.
 */
object UsageSdkOptOutFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("usage-sdk-opt-out"),
)
