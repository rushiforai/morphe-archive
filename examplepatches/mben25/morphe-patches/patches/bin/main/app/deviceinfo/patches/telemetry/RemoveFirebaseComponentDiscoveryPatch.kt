package app.deviceinfo.patches.telemetry

import app.deviceinfo.patches.shared.Constants.COMPATIBILITY_DEVICEINFO
import app.deviceinfo.patches.shared.resource.androidManifest
import app.deviceinfo.patches.shared.resource.removeService
import app.morphe.patcher.patch.resourcePatch

/**
 * Unlike masareef, DeviceInfo's manifest lists every Firebase registrar as a single `<meta-data>`
 * child of one shared `com.google.firebase.components.ComponentDiscoveryService`, rather than as
 * separate per-feature `<service>` elements. `FirebaseApp` reads this service's manifest
 * metadata via `PackageManager` at startup purely to discover which `ComponentRegistrar`s exist
 * (the service itself is never actually bound/started) - so removing the whole `<service>`
 * element removes every registrar it lists in one step:
 *  - FirebaseCrashlyticsKtxRegistrar / CrashlyticsRegistrar (Crashlytics)
 *  - AnalyticsConnectorRegistrar (Analytics)
 *  - FirebaseSessionsRegistrar (Sessions)
 *  - FirebaseInstallationsKtxRegistrar / FirebaseInstallationsRegistrar (Installations)
 *  - FirebaseCommonKtxRegistrar, TransportRegistrar
 *
 * `FirebaseInitProvider` (the ContentProvider that calls `FirebaseApp.initializeApp()` on
 * process start) is left in place: with no registrars left to discover, that call becomes an
 * inert no-op instead of something that needs its own removal.
 */
@Suppress("unused")
val removeFirebaseComponentDiscoveryPatch = resourcePatch(
    name = "Remove Firebase Component Discovery",
    description = "Removes the Firebase ComponentDiscoveryService, which is how Analytics, " +
        "Crashlytics, Sessions, Installations, and Transport auto-register themselves on " +
        "startup.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DEVICEINFO)

    execute {
        androidManifest {
            removeService("""com\.google\.firebase\.components\.ComponentDiscoveryService""")
        }
    }
}
