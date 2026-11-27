// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.media.imgur

import app.edbfi.extension.shared.imgur.bindings.Imgur
import app.edbfi.extension.syncforreddit.imgur.bindings.AlbumRequests
import app.edbfi.patches.syncforreddit.SyncPatchStrings
import app.edbfi.patches.syncforreddit.layout.glideImageRequestUrl
import app.edbfi.patches.syncforreddit.layout.thumbnails.postThumbnail
import app.edbfi.patches.syncforreddit.syncForReddit
import app.reseam.patch.Type
import app.reseam.patch.after
import app.reseam.patch.before
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.dex.Opcode
import app.reseam.patch.dex.invokeRegisters
import app.reseam.patch.dex.opcode
import app.reseam.patch.dex.regA
import app.reseam.patch.dex.stringValue
import app.reseam.patch.field
import app.reseam.patch.klass
import app.reseam.patch.method
import app.reseam.patch.patch
import app.reseam.patch.points
import app.reseam.patch.replace
import app.reseam.patch.reserveLocal

private const val UPLOAD_PROXY = "https://imgur-apiv3.p.rapidapi.com/3/image"
private const val COVER_PROXY = "https://ap.syncforreddit.com/image?url=imgur-album-"
private const val STRING_BUILDER = "java.lang.StringBuilder"

private val album = klass("Imgur album request") {
    extends("com.android.volley.Request")
    sourceFile("ImgurGalleryRequest.java")
}
private val image = klass("Imgur image request") {
    extends("com.android.volley.Request")
    sourceFile("ImgurSingleImageRequest.java")
}
private val upload = klass("Imgur upload request") {
    extends("com.android.volley.Request")
    sourceFile("UploadImgurRequest.java")
}

private val albumUrl = method("Imgur album URL builder") {
    inClass(album)
    flags(AccessFlags.STATIC)
    params(Type.String)
    returns(Type.String)
}

private val imageUrl = method("Imgur single image URL builder") {
    inClass(image)
    flags(AccessFlags.STATIC)
    params(Type.String)
    returns(Type.String)
}

private val uploadConstructor = method("Imgur upload proxy request constructor") {
    inClass(upload)
    name("<init>")
    strings(UPLOAD_PROXY)
}

private const val REQUEST = "com.android.volley.Request"
private const val QUEUE = "com.android.volley.RequestQueue"
private const val ERROR = "com.android.volley.VolleyError"
private const val RESPONSE = "com.android.volley.NetworkResponse"

private val parseAlbumError = album.method("parseNetworkError") {
    params(ERROR)
    returns(ERROR)
    strings("Unable to find an album with the id")
}
private val performRequest = klass("com.android.volley.toolbox.BasicNetwork").method("performRequest") {
    params(REQUEST)
    returns(RESPONSE)
}
private val createCall = performRequest.points("Create the cancellable Volley HTTP call") {
    invokeVirtual { owner("okhttp3.OkHttpClient"); name("newCall"); params("okhttp3.Request"); returns("okhttp3.Call") }
}.single().captureArgumentAs("client", 0)

private val uploadManager = klass("Imgur upload dispatcher") { sourceFile("UploadManager.java") }
private val dispatchUpload = method("Queue the editor attachment for upload") {
    inClass(uploadManager)
    flags(AccessFlags.STATIC)
    params("android.content.Context", "android.net.Uri", "com.android.volley.Response\$Listener",
        "com.android.volley.Response\$ErrorListener")
    returns(Type.Void)
    calls(uploadConstructor)
    calls { owner(QUEUE); name("add"); params(REQUEST); returns(REQUEST) }
}
private val uploadQueue = dispatchUpload.field("Sync request queue") { type("Lcom/android/volley/RequestQueue;") }
private val setShouldCache = klass(REQUEST).method("setShouldCache") { params(Type.Boolean); returns(REQUEST) }
private val enqueue = klass(QUEUE).method("add") { params(REQUEST); returns(REQUEST) }

private val commentPreview = method("Imgur comment cover model") {
    strings(COVER_PROXY, "EfficientImageSpan")
    returns(Type.Void)
}

private val imgurHelper = klass("Stock Imgur link helper") {
    sourceFile("ImgurImageHelper.java")
}

private val cleanLink = method("Stock Imgur link cleanup") {
    inClass(imgurHelper)
    flags(AccessFlags.STATIC)
    params(Type.String)
    returns(Type.String)
    strings(".mp4", ".webm", ".gifv", "Imgur.com", "Imgur.io")
}

private val extractAlbumId = method("Stock Imgur album ID extractor") {
    inClass(imgurHelper)
    flags(AccessFlags.STATIC)
    params(Type.String)
    returns(Type.String)
    strings("new", "horizontal", "layout", "blog", "noscript", "embed", "all")
}

private val commentCleanup = commentPreview.points("Clean the Imgur comment link") {
    opcode(Opcode.INVOKE_STATIC)
    calls(cleanLink)
}.single()

private val commentAlbumId = commentPreview.points("Extract the Imgur comment album ID") {
    opcode(Opcode.INVOKE_STATIC)
    calls(extractAlbumId)
}.single().captureArgumentAs("cleanedLink", 0)

private val commentCoverModel = commentPreview.points("Build the Imgur comment cover URL") {
    string(COVER_PROXY)
    repeat(2) {
        then {
            invokeVirtual {
                owner(STRING_BUILDER)
                name("append")
                params(Type.String)
                returns(STRING_BUILDER)
            }
        }
    }
    then { invokeVirtual { owner(STRING_BUILDER); name("toString"); params(); returns(Type.String) } }
    then { opcode(Opcode.MOVE_RESULT_OBJECT) }
}.single().captureAs("coverModel")

val fixImgur = patch(SyncPatchStrings.fixImgur) {
    description(SyncPatchStrings.fixImgurDescription)
    compatibleWith(syncForReddit)
    enabledByDefault(false)
    val clientId = stringOption(
        "imgurClientId",
        SyncPatchStrings.imgurClientId,
        SyncPatchStrings.imgurClientIdDescription,
        required = true,
    )

    execute {
        val id = options[clientId].trim()
        require(id.matches(Regex("[A-Za-z0-9]{1,64}"))) { "Enter an authorized Imgur client ID." }

        val headers = listOf(album, image, upload).map { owner ->
            owner.method("getHeaders") {
                params()
                returns("java.util.Map")
            }.also { it.method }
        }
        val uploadMethod = uploadConstructor.method
        createCall.index
        AlbumRequests.forMetadata.target.method
        val albumType = album.descriptor
        val imageType = image.descriptor
        val uploadType = uploadConstructor.owner
        val uploadProto = uploadMethod.proto
        dispatchUpload.method
        uploadQueue.ref
        setShouldCache.method
        enqueue.method
        parseAlbumError.method
        val commentMethod = commentPreview.method
        check(uploadMethod.instructions.count { it.stringValue == UPLOAD_PROXY } == 1)
        check(commentMethod.instructions.count { it.stringValue == COVER_PROXY } == 1)
        albumUrl.method
        imageUrl.method
        postThumbnail.method
        glideImageRequestUrl.index
        val extractor = commentAlbumId.index
        val model = commentCoverModel.index
        val insns = commentMethod.instructions
        check(commentCleanup.index == extractor - 2 && model == extractor + 8 &&
            insns[extractor - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
            insns[extractor - 1].regA == insns[extractor].invokeRegisters?.single() &&
            insns[extractor + 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
            insns[extractor + 4].regA == insns[extractor + 5].invokeRegisters?.get(1) &&
            insns[extractor + 1].regA == insns[extractor + 6].invokeRegisters?.get(1) &&
            insns[extractor + 5].invokeRegisters?.first() == insns[extractor + 7].invokeRegisters?.single() &&
            insns[extractor + 6].invokeRegisters?.first() == insns[extractor + 7].invokeRegisters?.single()
        ) { "Unexpected Imgur comment cover URL construction." }

        val cleanedLink = commentPreview.reserveLocal("imgurCommentLink", Type.String)

        albumUrl.replace { returnValue(Imgur.albumUrl(param(0))) }
        imageUrl.replace { returnValue(Imgur.imageUrl(param(0))) }
        headers.forEach { target ->
            target.after {
                val url = thisObject.callVirtual("com.android.volley.Request", "getUrl", "()Ljava/lang/String;")
                result.assign(Imgur.headers(url, result, string(id)))
            }
        }
        uploadMethod.replaceAllStrings(UPLOAD_PROXY, "https://api.imgur.com/3/image")
        createCall.before {
            val client = capture("client")
            whenInstanceOf(param(0), albumType) { client.assign(AlbumRequests.forMetadata(client)) } otherwise {
                whenInstanceOf(param(0), imageType) { client.assign(AlbumRequests.forMetadata(client)) }
            }
        }
        // The transport has already retried a missing album. Both viewer listeners treat
        // ordinary errors as a failed load and the stock English-text signal as another retry.
        parseAlbumError.replace { returnValue(param(0)) }
        // The retired availability request wraps the real upload. Queue the editor's request directly.
        dispatchUpload.replace {
            val attachment = newInstance(uploadType, uploadProto, param(0), param(1), param(2), param(3))
            attachment.call(setShouldCache, bool(false))
            staticField(uploadQueue).call(enqueue, attachment)
            returnVoid()
        }
        // Keep Sync's stock ID extraction as the fallback for older link shapes.
        commentAlbumId.before { local(cleanedLink).assign(capture("cleanedLink")) }
        commentCoverModel.after {
            val model = capture("coverModel")
            model.assign(Imgur.titledCommentCoverModel(local(cleanedLink), model))
        }
        commentMethod.replaceAllStrings(COVER_PROXY, "https://imgur.com/a/")
        postThumbnail.after { result.assign(Imgur.postCoverModel(param(0), result)) }
        glideImageRequestUrl.before {
            val url = capture("url")
            url.assign(Imgur.resolveCoverModel(url, string(id)))
        }
    }
}
