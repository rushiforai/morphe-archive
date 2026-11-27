// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.rifisfun.media.galleries

import app.edbfi.extension.shared.redditgallery.bindings.GalleryRequests
import app.edbfi.patches.rifisfun.RifPatchStrings
import app.edbfi.patches.rifisfun.rifIsFun
import app.reseam.patch.Type
import app.reseam.patch.after
import app.reseam.patch.before
import app.reseam.patch.klass
import app.reseam.patch.method
import app.reseam.patch.patch
import app.reseam.patch.points

private const val URI = "android.net.Uri"

private val galleryLoader = klass("rif Reddit gallery loader") {
    strings("com.andrewshu.android.reddit.KEY_GALLERY_ID", "Missing gallery ID")
}

private val galleryUrl = method("rif gallery lookup") {
    inClass(galleryLoader)
    params(Type.String)
    returns(URI)
    strings("t3", "id")
}

private val videoUrl = method("rif inline Reddit video lookup") {
    params(URI)
    returns(URI)
    strings("link", "video", "api", "info.json", "id", "t3")
}

private val galleryBody = method("Parse Reddit gallery listing") {
    params("java.io.InputStream")
    returns("com.andrewshu.android.reddit.browser.redditgallery.GalleryThreadThing")
    calls { owner("com.andrewshu.android.reddit.browser.redditgallery.GalleryInfoApiListingWrapper") }
}.points("Gallery listing body") {
    invokeStatic {
        owner("com.bluelinelabs.logansquare.LoganSquare")
        name("parse")
        params("java.io.InputStream", "java.lang.Class")
    }
}.single().captureArgumentAs("body", 0)

val fixGalleries = patch(RifPatchStrings.fixGalleries) {
    description(RifPatchStrings.fixGalleriesDescription)
    compatibleWith(rifIsFun)

    execute {
        galleryUrl.method
        videoUrl.method
        galleryBody.index

        galleryUrl.after { result.assign(GalleryRequests.byIdUri(result)) }
        videoUrl.after { result.assign(GalleryRequests.byIdUri(result)) }
        galleryBody.before {
            capture("body").assign(GalleryRequests.normalizeGalleryResponse(capture("body")))
        }
    }
}
