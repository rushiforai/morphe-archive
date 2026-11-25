package app.mtcapsule.patches.mtisland.telemetry

import app.morphe.patcher.patch.resourcePatch
import app.mtcapsule.patches.shared.Constants.COMPATIBILITY_MT_CAPSULE
import app.mtcapsule.patches.shared.resource.androidManifest
import app.mtcapsule.patches.shared.resource.removeProvider
import app.mtcapsule.patches.shared.resource.removeService

/**
 * MT Capsule's manifest lists every Firebase registrar as a `<meta-data>` child of one shared
 * `com.google.firebase.components.ComponentDiscoveryService` (checked against 17.3):
 *  - FirebaseAnalyticsLegacyRegistrar / AnalyticsConnectorRegistrar (Analytics)
 *  - FirebaseCommonLegacyRegistrar / FirebaseCommonKtxRegistrar
 *  - FirebaseInstallationsRegistrar / FirebaseInstallationsKtxRegistrar (Installations - the
 *    per-install device identifier generator)
 *
 * `FirebaseApp` reads this service's manifest metadata via `PackageManager` at startup purely to
 * discover which `ComponentRegistrar`s exist (the service is never bound/started), so removing the
 * whole `<service>` element removes every registrar it lists in one step. There is no Crashlytics
 * or Sessions registrar in MT Capsule.
 *
 * `FirebaseInitProvider` (the ContentProvider that calls `FirebaseApp.initializeApp()` on process
 * start) is removed too: with no registrars to discover it would be an inert no-op, but dropping it
 * stops MT Capsule from ever constructing the default FirebaseApp instance at all.
 */
@Suppress("unused")
val removeFirebaseComponentDiscoveryPatch = resourcePatch(
    name = "Remove Firebase Component Discovery",
    description = "Removes the Firebase ComponentDiscoveryService and FirebaseInitProvider, which " +
        "is how Analytics and Installations auto-register themselves on startup.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MT_CAPSULE)

    execute {
        androidManifest {
            removeService("""com\.google\.firebase\.components\.ComponentDiscoveryService""")
            removeProvider("""com\.google\.firebase\.provider\.FirebaseInitProvider""")
        }
    }
}
