package app.template.patches.maps.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
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
 * Fingerprint matching the MediaBrowser connection callback in bog.n().
 * Matches the method calling MediaBrowser.getRoot() returning void.
 * Allows guarding against empty parentId before calling MediaBrowserCompat.subscribe().
 */
object MediaBrowserSubscribeFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/media/browse/MediaBrowser;",
            name = "getRoot"
        )
    )
)

/**
 * Fingerprint matching the candidate media provider verifier (ampe.a(apxs) in classes6.dex).
 * Matches class containing amph and AtomicBoolean fields with method a taking 1 parameter returning void.
 * Allows bypassing the asynchronous MediaBrowser test connection that silently drops third-party media apps.
 */
object MediaProviderVerifyFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.interfaces.contains("Lamrb;") &&
            classDef.fields.any { it.type == "Lamph;" } &&
            classDef.fields.any { it.type == "Ljava/util/concurrent/atomic/AtomicBoolean;" } &&
            method.name == "a" && method.parameters.size == 1
    }
)

