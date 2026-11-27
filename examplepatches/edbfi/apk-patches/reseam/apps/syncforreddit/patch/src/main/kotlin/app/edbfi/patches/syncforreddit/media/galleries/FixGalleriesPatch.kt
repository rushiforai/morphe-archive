// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.media.galleries

import app.edbfi.extension.shared.redditgallery.bindings.GalleryRequests
import app.edbfi.patches.syncforreddit.SyncPatchStrings
import app.edbfi.patches.syncforreddit.syncForReddit
import app.reseam.patch.Type
import app.reseam.patch.after
import app.reseam.patch.method
import app.reseam.patch.patch

private val galleryUrl = method("Sync Reddit gallery lookup") {
    params(Type.String)
    returns(Type.String)
    strings("https://oauth.reddit.com/api/info.json?id=t3_", "?is_gallery=true")
}

val fixGalleries = patch(SyncPatchStrings.fixGalleries) {
    description(SyncPatchStrings.fixGalleriesDescription)
    compatibleWith(syncForReddit)

    execute {
        galleryUrl.after { result.assign(GalleryRequests.byIdUrl(result)) }
    }
}
