package app.mtcapsule.patches.mtisland.telemetry

import app.morphe.patcher.patch.resourcePatch
import app.mtcapsule.patches.shared.Constants.COMPATIBILITY_MT_CAPSULE
import app.mtcapsule.patches.shared.resource.androidManifest
import app.mtcapsule.patches.shared.resource.removeReceiver
import app.mtcapsule.patches.shared.resource.removeService

/**
 * Removes the runtime components that actually ship analytics off the device, which the Firebase
 * discovery removal leaves declared in the manifest (checked against 17.3):
 *  - `com.google.android.gms.measurement.AppMeasurementService / AppMeasurementJobService /
 *    AppMeasurementReceiver` - the GMS Measurement sink that Firebase Analytics logs into.
 *  - `com.google.android.datatransport.runtime.*` - the CCT (Google Cloud Telemetry) transport
 *    pipeline: `TransportBackendDiscovery`, `JobInfoSchedulerService` and the
 *    `AlarmManagerSchedulerBroadcastReceiver` that flushes queued events.
 *
 * With the registrars gone nothing enqueues into these, but removing the components stops any
 * leftover scheduled job or alarm from waking the process to attempt an upload.
 */
@Suppress("unused")
val removeAnalyticsServicesPatch = resourcePatch(
    name = "Remove Analytics Services",
    description = "Removes the Google Measurement and DataTransport services and receivers that " +
        "upload analytics events, so no scheduled job or alarm can wake the app to send telemetry.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MT_CAPSULE)

    execute {
        androidManifest {
            removeService(
                """com\.google\.android\.gms\.measurement\.AppMeasurementService""",
                """com\.google\.android\.gms\.measurement\.AppMeasurementJobService""",
                """com\.google\.android\.datatransport\.runtime\.backends\.TransportBackendDiscovery""",
                """com\.google\.android\.datatransport\.runtime\.scheduling\.jobscheduling\.JobInfoSchedulerService""",
            )
            removeReceiver(
                """com\.google\.android\.gms\.measurement\.AppMeasurementReceiver""",
                """com\.google\.android\.datatransport\.runtime\.scheduling\.jobscheduling\.AlarmManagerSchedulerBroadcastReceiver""",
            )
        }
    }
}
