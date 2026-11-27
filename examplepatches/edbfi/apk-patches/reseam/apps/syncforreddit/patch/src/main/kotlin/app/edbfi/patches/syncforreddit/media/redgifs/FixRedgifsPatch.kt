// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.media.redgifs

import app.edbfi.extension.shared.redgifs.bindings.Redgifs
import app.edbfi.patches.syncforreddit.SyncPatchStrings
import app.edbfi.patches.syncforreddit.syncForReddit
import app.reseam.patch.Type
import app.reseam.patch.after
import app.reseam.patch.before
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.field
import app.reseam.patch.klass
import app.reseam.patch.method
import app.reseam.patch.patch
import app.reseam.patch.points
import app.reseam.patch.reserveLocal

private const val CONTEXT = "Landroid/content/Context;"
private const val SETTINGS = "Lcom/laurencedawson/reddit_sync/singleton/SettingsSingleton\$Settings;"
private const val RETIRED_PREVIEW = "https://ap.syncforreddit.com/image?url=redgifs-"
private const val PLAYER = "Lcom/google/android/exoplayer2/Player;"
private const val LISTENER = "Lcom/google/android/exoplayer2/Player\$Listener;"

private val openBrowser = method("Sync configured browser") {
    params(CONTEXT, Type.String)
    returns(Type.Void)
    flags(AccessFlags.STATIC)
    accesses { owner(SETTINGS); name("defaultBrowser"); type(Type.Int) }
}

private val openImage = method("Sync image viewer router") {
    strings("Opening image link: ", "card_preview")
    flags(AccessFlags.STATIC)
    calls(openBrowser)
    returns(Type.Void)
}

private val openRedgifs = method("Sync RedGIFs link preference") {
    strings("Opening RedGifs link internally: ", "Opening RedGifs link externally: ")
    calls(openImage)
    calls(openBrowser)
    accesses { owner(SETTINGS); name("redgifs"); type(Type.Boolean) }
    returns(Type.Void)
}

private val openInternal = openRedgifs.points("Open RedGIFs in the image viewer") {
    calls(openImage)
}.single().captureArgumentAs("context", 0, CONTEXT).captureArgumentAs("url", 3, Type.String)

private val inlinePlayer = klass("Sync inline video player") {
    sourceFile("SimpleExoPlayerTextureView.java")
    extends("Landroid/widget/FrameLayout;")
}
private val chooseVideo = method("Sync Enhanced autoplay video selection") {
    inClass(inlinePlayer)
    strings(RETIRED_PREVIEW, "https://ap.syncforreddit.com/image?url=gfycat-")
    paramCount(3)
    param(1, Type.Boolean)
    param(2, Type.Boolean)
    returns(Type.Void)
}
private val playVideo = method("Play selected inline video") {
    inClass(inlinePlayer)
    params(Type.String, Type.Boolean, Type.Boolean)
    returns(Type.Void)
    strings("Player starting")
    calledBy(chooseVideo)
}
private val detachPlayer = method("Detach inline video player") {
    inClass(inlinePlayer)
    params()
    returns(Type.Void)
    calls { owner("Landroid/view/ViewGroup;"); name("removeView"); params("Landroid/view/View;"); returns(Type.Void) }
}
private val stopPlayer = method("Stop inline video playback") {
    inClass(inlinePlayer)
    params()
    returns(Type.Void)
    strings("Player stopped")
    calledBy(detachPlayer)
    calls { owner(PLAYER); name("clearMediaItems"); params(); returns(Type.Void) }
    calls { owner(PLAYER); name("removeListener"); params(LISTENER); returns(Type.Void) }
}
private val player = stopPlayer.field("Inline ExoPlayer") { type("Lcom/google/android/exoplayer2/ExoPlayer;") }
private val listener = stopPlayer.field("Inline playback listener") { type(LISTENER) }
private val previewGetter = method("Swipe video autoplay eligibility") {
    inClass(klass("com.laurencedawson.reddit_sync.ui.views.posts.simple_swipe.SimpleSwipeVideoContainer"))
    params()
    returns(Type.Boolean)
    accesses { owner(SETTINGS); name("autoplay"); type(Type.Int) }
}.points("Check the post's video preview") {
    invokeVirtual { params(); returns(Type.String) }
    then { resultOf(Type.String) }
    then {
        invokeStatic {
            owner("Lorg/apache/commons/lang3/StringUtils;")
            name("isNotEmpty")
            params("Ljava/lang/CharSequence;")
            returns(Type.Boolean)
        }
    }
}.single().previous { invokeVirtual { params(); returns(Type.String) } }.callee("Post video preview getter")
private val readEnhanced = chooseVideo.points("Read Enhanced autoplay preference") {
    calls(previewGetter)
    then { resultOf(Type.String) }
    then { invokeStatic { params(); returns(SETTINGS) } }
    then { resultOf(SETTINGS) }
    then { field { owner(SETTINGS); name("enhancedAutoPlay"); type(Type.Boolean) } }
}.single()
private val stockPreview = readEnhanced.previous { resultOf(Type.String) }.captureAs("preview", Type.String)
private val checkRedgifs = chooseVideo.points("Check the post URL for RedGIFs autoplay") {
    invokeStatic {
        owner("Lorg/apache/commons/lang3/StringUtils;")
        name("contains")
        params("Ljava/lang/CharSequence;", "Ljava/lang/CharSequence;")
        returns(Type.Boolean)
    }
    argument(1) { string("redgifs.com") }
}.single().captureArgumentAs("postUrl", 0, Type.String)

val fixRedgifs = patch(SyncPatchStrings.fixRedgifs) {
    description(SyncPatchStrings.fixRedgifsDescription)
    compatibleWith(syncForReddit)

    execute {
        openInternal.index
        openBrowser.method
        playVideo.method
        detachPlayer.method
        player.ref
        listener.ref
        check(stockPreview.index == 1 && readEnhanced.index < checkRedgifs.index) {
            "Expected the original video preview before the Enhanced autoplay override."
        }
        val preview = chooseVideo.reserveLocal("redditVideoPreview", Type.String)

        openInternal.before {
            val embed = Redgifs.embedUrl(capture("url"))
            whenNotNull(embed) {
                call(openBrowser, capture("context"), embed)
                returnVoid()
            }
        }
        stockPreview.after { local(preview).assign(capture("preview")) }
        checkRedgifs.before {
            whenNotNull(Redgifs.embedUrl(capture("postUrl"))) {
                val empty = callStatic("android.text.TextUtils", "isEmpty", "(Ljava/lang/CharSequence;)Z", local(preview))
                whenTrue(empty) {
                    // Stock detach only clears a playing item. A previous card can still be buffering.
                    val exo = thisObject.field(player)
                    exo.callInterface(PLAYER, "removeListener", "($LISTENER)V", thisObject.field(listener))
                    exo.callInterface(PLAYER, "setPlayWhenReady", "(Z)V", bool(false))
                    exo.callInterface(PLAYER, "clearMediaItems", "()V")
                    thisObject.call(detachPlayer)
                } otherwise {
                    thisObject.call(playVideo, local(preview), param(1), param(2))
                }
                returnVoid()
            }
        }
    }
}
