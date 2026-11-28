package app.template.patches.skillshare

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for Skillshare 5.4.81 (versionCode 7706).
 *
 * This build keeps its application package names intact (unlike the Pluralsight
 * build, whose primary implementation classes are R8-renamed), so the model
 * classes below are stable anchors. Both entitlement predicates are plain
 * virtual methods on the API models, each with a single overload:
 *
 *   AppUser.isMember()Z        → `subscription != null`
 *   VideoMetadata.isLocked()Z  → `videoHashedID == null`
 *
 * Their bodies are 8 instructions over one local register each, which is what
 * makes a constant-return rewrite verifier-safe without growing `.locals`.
 */

/** AppUser.isMember()Z — reads `subscription` field, returns 1 if non-null. */
val isMemberBoolean = Fingerprint(
    definingClass = "Lcom/skillshare/skillshareapi/api/models/user/AppUser;",
    name = "isMember",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * VideoMetadata.isLocked()Z — reads `videoHashedID` field, returns 1 if null.
 *
 * This is the per-lesson lock flag the lesson list and the lesson-tap gate both
 * read; it is derived server-side (the API omits `video_hashed_id` for lessons
 * the account may not watch).
 */
val isLockedBoolean = Fingerprint(
    definingClass = "Lcom/skillshare/skillshareapi/api/models/VideoMetadata;",
    name = "isLocked",
    returnType = "Z",
    parameters = emptyList(),
)

// ── Telemetry ────────────────────────────────────────────────────────────────

/**
 * Sentry's real init entry point. The public `init(...)` overloads all funnel into
 * this single R8-renamed static method, called once from
 * `Skillshare.onCreate()` (`SentryAndroid.b(context, AndroidLogger, OptionsConfiguration)V`).
 * The manifest declares both `SentryInitProvider` and `SentryPerformanceProvider`,
 * so the SDK is driven from code, not pure auto-init.
 */
val sentryInit = Fingerprint(
    definingClass = "Lio/sentry/android/core/SentryAndroid;",
    name = "b",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lio/sentry/android/core/AndroidLogger;",
        "Lio/sentry/Sentry\$OptionsConfiguration;",
    ),
)

/**
 * Singular's SDK init, called once from `Skillshare.onCreate()`. Config keys in the
 * analyzed build: `skillshare_518a9fdc` / API key `1e406bb6b13688b03362cdad39634dfa`.
 */
val singularInit = Fingerprint(
    definingClass = "Lcom/singular/sdk/Singular;",
    name = "init",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Lcom/singular/sdk/SingularConfig;"),
)

/**
 * Blueshift's SDK init — called once from `Skillshare.onCreate()` with a
 * `Configuration` built for the notification channel. Blueshift ALSO serves
 * rich-push / in-app-message delivery, so neutralising it is a separate,
 * off-by-default patch rather than part of the default tracker pass.
 */
val blueshiftInitialize = Fingerprint(
    definingClass = "Lcom/blueshift/Blueshift;",
    name = "initialize",
    returnType = "V",
    parameters = listOf("Lcom/blueshift/model/Configuration;"),
)

/** Blueshift's app-open event, posted right after [blueshiftInitialize]. */
val blueshiftTrackAppOpen = Fingerprint(
    definingClass = "Lcom/blueshift/Blueshift;",
    name = "trackAppOpen",
    returnType = "V",
    parameters = listOf("Z"),
)

/**
 * The app's own analytics entry point — every analytics call site funnels through
 * this single static `MixpanelEvent` sink (named "Mixpanel" by convention; no
 * Mixpanel SDK ships). It serialises the event and posts it to the app's own
 * `POST /events/track` endpoint via `SkillshareEventTracker` / `EventsTrackService`.
 */
val appEventSink = Fingerprint(
    definingClass = "Lcom/skillshare/Skillshare/util/analytics/mixpanel/MixpanelTracker;",
    name = "a",
    returnType = "V",
    parameters = listOf("Lcom/skillshare/Skillshare/util/analytics/mixpanel/MixpanelEvent;"),
)

/**
 * `FirebaseUserUpdater.a(AppUser)V` — assigns two Crashlytics *custom keys* from the
 * account: `Boolean.toString(user.isMember())` and `String.valueOf(user.username)`.
 *
 * Two reasons to neutralise it:
 *  1. it attaches user identity (username) and entitlement to every crash report;
 *  2. it reads `AppUser.isMember()`, which the skillshare premium patch forces to
 *     `true` — so that patch would otherwise advertise the patched membership state to
 *     Crashlytics.
 *
 * No-op'ing it does **not** disable crash reporting itself; only the custom keys are
 * dropped.
 */
val crashlyticsUserKeys = Fingerprint(
    definingClass = "Lcom/skillshare/Skillshare/application/FirebaseUserUpdater;",
    name = "a",
    returnType = "V",
    parameters = listOf("Lcom/skillshare/skillshareapi/api/models/user/AppUser;"),
)