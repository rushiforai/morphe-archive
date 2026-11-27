// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.layout.tenor

import app.edbfi.extension.syncforreddit.tenor.bindings.TenorPreviews
import app.edbfi.patches.syncforreddit.SyncPatchStrings
import app.edbfi.patches.syncforreddit.layout.glideImageRequestUrl
import app.edbfi.patches.syncforreddit.layout.thumbnails.postThumbnail
import app.edbfi.patches.syncforreddit.syncForReddit
import app.reseam.patch.Type
import app.reseam.patch.after
import app.reseam.patch.before
import app.reseam.patch.method
import app.reseam.patch.patch
import app.reseam.patch.points
import app.reseam.patch.redirectTo

private val previewProxy = method("Sync website preview proxy URL") {
    params(Type.String)
    returns(Type.String)
    strings("https://ap.syncforreddit.com/image?url=", "/amp/s/")
}

private val commentPreview = method("Sync comment preview loader") {
    returns(Type.Void)
    strings("tenor.com", "EfficientImageSpan")
    calls(previewProxy)
}.points("Comment Tenor URL") {
    calls(previewProxy)
}.single()

val fixTenorPreviews = patch(SyncPatchStrings.fixTenorPreviews) {
    description(SyncPatchStrings.fixTenorPreviewsDescription)
    compatibleWith(syncForReddit)

    execute {
        commentPreview.index
        glideImageRequestUrl.index
        postThumbnail.method

        commentPreview.redirectTo(TenorPreviews.commentModel)
        postThumbnail.after { result.assign(TenorPreviews.postModel(param(0), result)) }
        glideImageRequestUrl.before {
            val url = capture("url")
            url.assign(TenorPreviews.imageUrl(url))
        }
    }
}
