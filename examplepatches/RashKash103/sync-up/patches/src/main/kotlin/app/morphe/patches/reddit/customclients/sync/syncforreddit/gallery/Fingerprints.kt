package app.morphe.patches.reddit.customclients.sync.syncforreddit.gallery

import app.morphe.patcher.Fingerprint

/**
 * Where Sync turns a gallery response into the model its viewer draws from.
 *
 * <p>`OAuthGalleryRequest.parseNetworkResponse`, matched on the names it reads out of the
 * response and on what it says when it cannot: all four are whole strings of the method, and
 * none of them appears in any other. The class name is the minifier's and the method's own is
 * Volley's, so neither is enough on its own — every request class in the app overrides it.
 */
internal val galleryResponseFingerprint = Fingerprint(
    name = "parseNetworkResponse",
    strings = listOf(
        "media_metadata",
        "gallery_data",
        "media_id",
        "Could not load gallery",
    ),
)
