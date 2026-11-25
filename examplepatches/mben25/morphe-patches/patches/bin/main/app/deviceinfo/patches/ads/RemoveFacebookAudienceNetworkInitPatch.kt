package app.deviceinfo.patches.ads

import app.deviceinfo.patches.shared.Constants.COMPATIBILITY_DEVICEINFO
import app.deviceinfo.patches.shared.resource.androidManifest
import app.deviceinfo.patches.shared.resource.removeProvider
import app.morphe.patcher.patch.resourcePatch

/**
 * Unlike the Google Mobile Ads SDK (which only initializes lazily on the first ad request, and
 * is therefore already fully inert once [removeAllAdsPatch] stubs the app's one ad-loading entry
 * point), the bundled Facebook Audience Network mediation SDK auto-initializes itself
 * unconditionally on process start through a manifest-declared `ContentProvider`
 * (`com.facebook.ads.AudienceNetworkContentProvider`, `onCreate()` calls into
 * `AudienceNetworkAds.initialize`), completely independent of whether any ad is ever requested.
 * Removing that provider declaration is the only way to stop it running.
 */
@Suppress("unused")
val removeFacebookAudienceNetworkInitPatch = resourcePatch(
    name = "Remove Facebook Audience Network Initialization",
    description = "Removes the manifest-declared ContentProvider that auto-initializes the " +
        "Facebook Audience Network mediation SDK on every app start.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DEVICEINFO)

    execute {
        androidManifest {
            removeProvider("""com\.facebook\.ads\.AudienceNetworkContentProvider""")
        }
    }
}
