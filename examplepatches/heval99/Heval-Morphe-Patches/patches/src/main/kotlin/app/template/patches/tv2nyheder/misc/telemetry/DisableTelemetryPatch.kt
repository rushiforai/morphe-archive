package app.template.patches.tv2nyheder.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_TV2NYHEDER
import app.template.patches.shared.misc.telemetry.disableBugsnagStartup

/**
 * TV 2 Nyheder reports usage to Chartbeat and crashes to Bugsnag. Chartbeat is stopped at its
 * Tracker.setupTracker entry (both overloads), so the ping service, the foreground tracker and the
 * engagement timer never start. Bugsnag starts from its ContentProvider during application startup;
 * the shared helper drops that start call, so the provider still loads cleanly but the SDK never
 * initialises. TV 2's own backend calls and the ad stack are untouched.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_TV2NYHEDER)

    execute {
        // 1. Chartbeat: both setupTracker overloads return at once.
        val tracker = mutableClassDefBy(CHARTBEAT_TRACKER)
        val setups = tracker.methods.filter {
            it.name == "setupTracker" && it.returnType == "V" && it.implementation != null
        }
        if (setups.isEmpty()) throw PatchException("Disable telemetry: no Chartbeat Tracker.setupTracker")
        setups.forEach { it.returnEarly() }

        // 2. Bugsnag: drop the provider's single start call.
        disableBugsnagStartup()
    }
}
