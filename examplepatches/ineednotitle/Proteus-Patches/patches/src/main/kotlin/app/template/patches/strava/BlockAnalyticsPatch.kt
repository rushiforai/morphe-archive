package app.template.patches.strava

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.STRAVA_COMPATIBILITY

/**
 * Strava's engagement telemetry runs through Braze. At startup the app's
 * initializer builds a BrazeConfig (hard-coded API project key
 * 73802ec4-9ddd-441c-8234-ec7077465732 targeting sdk.iad-07.braze.com, 10 s
 * session timeout, automatic push deep-link handling) and calls
 * Braze.Companion.configure(...). From that point every session open/close and
 * engagement event streams to Braze. This patch returns from that bootstrap
 * method before anything is configured, so the tracker never opens a session
 * and never phones home.
 *
 * The rest of the bundle's known tracker surface in current builds is already
 * inert by default (verified in 486.9): Firebase Analytics collection is
 * manifest-disabled, Facebook auto event logging is manifest-disabled with no
 * explicit AppEvents calls from app code, Sentry is never initialized (its DSN
 * metadata is dead weight), and the Segment analytics builder is never
 * constructed anywhere outside the dormant SDK bundle.
 *
 * Feature impact: none observed or expected. Braze is strictly the
 * engagement/telemetry pipe here; push delivery (Firebase Messaging), GPS,
 * recording, and social features do not depend on it. Matching is
 * fail-open: if Strava renames the bootstrap or moves to another tracker in a
 * future version, the fingerprint simply does not match and the rest of the
 * app is patched normally.
 */
@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics and data collection",
    description = "Stops Strava's Braze telemetry bootstrap (session + engagement tracking, endpoint " +
        "sdk.iad-07.braze.com) before it is configured. Firebase Analytics collection and Facebook " +
        "auto event logging are already off in Strava's own manifest; this removes the one tracker " +
        "pipe that is actually live. Push, GPS, and recording keep working.",
    default = true,
) {
    compatibleWith(STRAVA_COMPATIBILITY)

    execute {
        // Pin on the Braze endpoint literal rather than obfuscated names: the
        // bootstrap method that builds BrazeConfig always carries it.
        Fingerprint(
            name = "initialize",
            returnType = "V",
            strings = listOf("sdk.iad-07.braze.com"),
        ).method.addInstructions(0, "return-void")
    }
}
