package app.template.patches.skillshare.trackers

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.SKILLSHARE_COMPATIBILITY
import app.template.patches.shared.returnEarly
import app.template.patches.shared.returnVoid
import app.template.patches.shared.requireProgress
import app.template.patches.skillshare.appEventSink
import app.template.patches.skillshare.crashlyticsUserKeys
import app.template.patches.skillshare.sentryInit
import app.template.patches.skillshare.singularInit

/**
 * Removes Skillshare's crash-reporting, install-attribution and app-owned analytics.
 *
 * The build has **no ad SDK** at all (zero ad-network classes; the 537
 * `com.facebook.stetho` classes are a debug inspector, and the 15 registered
 * plugins are all UI/peripheral), so there is no ads patch to write.
 * The telemetry that does exist is four init/sink choke points, each verified
 * against the 5.4.81 build:
 *
 *  1. **Sentry** — `Skillshare.onCreate()` calls the single R8-renamed static
 *     `SentryAndroid.b(Context, AndroidLogger, OptionsConfiguration)V`. The
 *     manifest also declares `SentryInitProvider` + `SentryPerformanceProvider`,
 *     so this is the real init path (not a stray provider).
 *  2. **Singular** (install attribution) — one `Singular.init(Context,
 *     SingularConfig)Z` call from the same `onCreate`, config keys
 *     `skillshare_518a9fdc` / `1e406bb6b13688b03362cdad39634dfa`.
 *  3. **App-owned events** — every analytics call site funnels through the
 *     static `MixpanelTracker.a(MixpanelEvent)V`. ("Mixpanel" is a naming
 *     convention; no Mixpanel SDK ships. The sink POSTs to the app's own
 *     `POST /events/track`.)
 *  4. **Crashlytics custom keys** — `FirebaseUserUpdater.a(AppUser)V` sets
 *     `Boolean.toString(user.isMember())` and `String.valueOf(user.username)` as
 *     Crashlytics custom keys. This is the one sink that *interacts badly* with the
 *     premium patch: because `AppUser.isMember()` is forced to `true`, skipping this
 *     sink would advertise the patched membership state (and the username) on every
 *     crash report. Dropping the custom keys does not disable crash reporting itself.
 *
 * All three are neutralised at their entry point, so the SDKs never start and no
 * event is ever sent, for every caller. Firebase Messaging (push) and
 * FirebaseInstallations are deliberately **not** touched: they back push
 * delivery and the Blueshift token resync, and disabling them breaks
 * notifications. See [skillshareDisableBlueshiftPatch] for the engagement SDK.
 */
@Suppress("unused")
val skillshareDisableTrackersPatch = bytecodePatch(
    name = "Disable trackers",
    description = "No-ops the crash-reporting (Sentry), attribution (Singular), the " +
        "app-owned analytics event sink and the Crashlytics user-identity custom keys, " +
        "so no crash report, install-attribution or usage event is sent and no username " +
        "or membership flag is attached to crash reports. Firebase push and install-ID " +
        "are left intact.",
    default = true,
) {
    compatibleWith(SKILLSHARE_COMPATIBILITY)

    execute {
        var changed = 0

        // Sentry: never initialise.
        sentryInit.method.returnVoid()
        changed++

        // Singular: init returns false without contacting the backend.
        singularInit.method.returnEarly(false)
        changed++

        // App-owned event sink: drop every tracked event.
        appEventSink.method.returnVoid()
        changed++

        // Crashlytics custom keys: drop the user identity + membership attributes.
        crashlyticsUserKeys.method.returnVoid()
        changed++

        requireProgress(changed, changed, "Skillshare Sentry/Singular/app-event sink")
    }
}