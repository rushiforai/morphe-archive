package app.template.patches.saphelink.misc.telemetry

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SAPHELINK
import app.morphe.util.returnEarly

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables Braze custom event tracking. Firebase Analytics/Crashlytics " +
        "are covered by the universal \"Disable Firebase Analytics & Crashlytics\" patch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SAPHELINK)

    execute {
        // Braze logCustomEvent (both overloads share the same name: one takes
        // just the event name, the other also takes a BrazeProperties map).
        // returnEarly() with no value returns void, which is correct for both.
        BrazeLogCustomEventFingerprint.methodOrNull?.returnEarly()
    }
}