// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.rifisfun.media.redgifs

import app.edbfi.extension.shared.redgifs.bindings.Redgifs
import app.edbfi.patches.rifisfun.RifPatchStrings
import app.edbfi.patches.rifisfun.rifIsFun
import app.reseam.patch.Type
import app.reseam.patch.after
import app.reseam.patch.before
import app.reseam.patch.dex.Opcode
import app.reseam.patch.method
import app.reseam.patch.patch
import app.reseam.patch.points

private const val URI = "android.net.Uri"

private val browser = method("rif browser fragment factory") {
    strings("com.andrewshu.android.reddit.KEY_MODIFIED_URI", "com.andrewshu.android.reddit.ARG_ALBUM_ID")
    param(0, URI)
}

private val modifiedUri = browser.points("normalize the browser URI") {
    invokeStatic { params(URI); returns(URI) }
}.single().callee()

private val redgifsId = method("extract RedGIFs video ID") {
    params(URI)
    returns(Type.String)
    strings("watch", "ifr", "gifdeliverynetwork.com", "api.redgifs.com")
}

private val redgifsVideo = method("rif RedGIFs video predicate") {
    params(URI)
    returns(Type.Boolean)
    calls(redgifsId)
    calls { owner("android.text.TextUtils"); name("isEmpty") }
}

private val supportedVideo = method("rif supported video hosts") {
    params(URI)
    returns(Type.Boolean)
    calls(redgifsVideo)
    custom { owner == redgifsVideo.owner }
}

private val browserVideo = method("rif browser native video eligibility") {
    params(URI)
    returns(Type.Boolean)
    calls(supportedVideo)
    custom { owner == browser.owner }
}

private val nativePlayer = method("choose the native video fragment") {
    calledBy(browser)
    calls(browserVideo)
    params(URI)
    returns(Type.Boolean)
}

private val classify = method("classify modified URI for browser actions") {
    params()
    returns(Type.Void)
    calls(modifiedUri)
    calls(redgifsVideo)
}

private val metadataCheck = classify.points("check for RedGIFs metadata actions") {
    calls(redgifsVideo)
}.single()
private val metadataUri = metadataCheck.writer(0).field()
private val metadataResult = metadataCheck.next { resultOf(Type.Boolean) }.captureAs("metadata", Type.Boolean)
private val storeModifiedUri = classify.points("store the normalized browser URI") {
    calls(modifiedUri)
    then { resultOf(URI) }
    then { opcode(Opcode.IPUT_OBJECT); field { owner(browser.owner); type(URI) } }
}.single().field()

val fixRedgifs = patch(RifPatchStrings.fixRedgifs) {
    description(RifPatchStrings.fixRedgifsDescription)
    compatibleWith(rifIsFun)

    execute {
        modifiedUri.method
        nativePlayer.method
        check(metadataUri.ref == storeModifiedUri.ref) { "Expected the RedGIFs action check to read the normalized URI." }
        metadataResult.instruction

        // rif keeps the original URI for sharing and uses this URI to select and load its browser.
        modifiedUri.before {
            whenNotNull(param(0)) {
                val embed = Redgifs.pageEmbedUrl(param(0).callVirtual(URI, "toString", "()Ljava/lang/String;"))
                whenNotNull(embed) { returnValue(callStatic(URI, "parse", "(Ljava/lang/String;)Landroid/net/Uri;", embed)) }
            }
        }
        browserVideo.before {
            whenNotNull(param(0)) {
                whenNotNull(Redgifs.pageEmbedUrl(param(0).callVirtual(URI, "toString", "()Ljava/lang/String;"))) {
                    returnFalse()
                }
            }
        }
        // The WebView would otherwise run the old API lookup for its native save menu as well.
        metadataResult.after {
            whenTrue(capture("metadata")) {
                val url = thisObject.field(metadataUri).callVirtual(URI, "toString", "()Ljava/lang/String;")
                whenNotNull(Redgifs.pageEmbedUrl(url)) { capture("metadata").assign(bool(false)) }
            }
        }
    }
}
