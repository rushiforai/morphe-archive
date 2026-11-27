package app.template.patches.redditsync.removetelemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.redditsync.removetelemetry.fingerprints.crashlyticsGateFingerprint
import app.template.patches.redditsync.removetelemetry.fingerprints.deviceRegistrationFingerprint

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39. The
 * developer has abandoned this app; there's no one left for crash reports, usage
 * analytics, or device-registration pings to actually reach or help.
 *
 * Confirmed by hand from real smali (via apktool):
 *
 * - Crashlytics: every call in the app (startup collection toggle, event logging,
 *   exception logging) routes through the single gate Lt7/k;->a()Z. Forcing it to
 *   always return false disables all Crashlytics reporting unconditionally,
 *   regardless of the user-facing "Crashlytics" preference or any stored setting.
 *
 * - Device/account registration: BaseActivity's private p0(String)V builds a
 *   HashMap of the FCM push token, signed-in Reddit account, SIM country, Ultra
 *   purchase token + SKU, app version, and Play Store install-source, then sends it
 *   to a Firebase Cloud Function named "hmmm" with no result handling — this is the
 *   method's entire body, so replacing it with a no-op drops the call cleanly.
 *
 * Both changes are made by prepending an early return before the original method
 * body (matching this project's template pattern), leaving the now-unreachable
 * original instructions in place rather than removing them.
 *
 * Depends on disableAnalyticsCollectionPatch (manifest meta-data flag) so selecting
 * either in Morphe Manager applies both together.
 */
val removeTelemetryPatch = bytecodePatch(
    name = "Remove telemetry",
    description = "Disables Crashlytics crash reporting, Firebase Analytics collection, and a " +
        "device/account registration call to Google's servers in Sync for Reddit. " +
        "Depends on \"Remove telemetry (resources)\" for the Analytics half — that " +
        "patch is also safe to use alone if you only want the Analytics flag disabled.",
    default = true,
) {
    dependsOn(disableAnalyticsCollectionPatch)

    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        crashlyticsGateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        deviceRegistrationFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )
    }
}
