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
