package app.template.patches.maps.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * Fingerprint matching the navigation media provider resolution method (xzt.ux()).
 * Matches based on the hardcoded YouTube Music package and MediaBrowserService intent strings.
 */
object NavigationMediaProvidersFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("com.google.android.apps.youtube.music"),
        string("android.media.browse.MediaBrowserService")
    )
)

/**
 * Fingerprint matching the media controller class (apww in classes6.dex).
 * Matches method h returning String containing "com.spotify.music".
 * Allows accessing method l() on this classDef to force the media feature flag to true.
 */
object MediaControllerFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    filters = listOf(
        string("com.spotify.music")
    )
)

/**
 * Fingerprint matching bsma.a() - the trusted media app allowlist in classes2.dex.
 * This method checks if a connecting app is in a hardcoded list of trusted Google apps.
 * com.google.android.apps.youtube.music is in this list at string index 19.
 */
object BsmaTrustedAppsFingerprint : Fingerprint(
    filters = listOf(
        string("com.google.android.apps.youtube.music"),
        string("com.google.android.apps.youtube.mango"),
        string("com.google.android.apps.youtube.unplugged")
    )
)
