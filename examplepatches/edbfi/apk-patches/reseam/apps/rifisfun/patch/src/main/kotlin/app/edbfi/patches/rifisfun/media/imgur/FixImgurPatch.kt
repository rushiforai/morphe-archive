// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.rifisfun.media.imgur

import app.edbfi.extension.shared.imgur.bindings.Imgur
import app.edbfi.patches.rifisfun.RifPatchStrings
import app.edbfi.patches.rifisfun.misc.medialinks.openLink
import app.edbfi.patches.rifisfun.rifIsFun
import app.reseam.patch.Type
import app.reseam.patch.before
import app.reseam.patch.classTarget
import app.reseam.patch.dex.stringValue
import app.reseam.patch.method
import app.reseam.patch.patch
import app.reseam.patch.replace

private const val IMGUR_URI = "android.net.Uri"
private const val CLIENT_ID_PREFIX = "Client-ID "
private val validClientId = Regex("[A-Za-z0-9]{1,64}")
private const val BUILDER = "okhttp3.c0\$a"

private val albumUrl = method("Imgur album URI builder") {
    strings("imgur", "gallery", "album")
    params(Type.String, Type.Boolean)
    returns(IMGUR_URI)
}

private val albumResponse = method("Parse Imgur album response") {
    params("java.io.InputStream")
    calls { owner("com.bluelinelabs.logansquare.LoganSquare"); name("parse") }
    calls { owner("com.andrewshu.android.reddit.imgur.ImgurV3AlbumResponse") }
}

private val albumLoader = classTarget("Imgur album loader") {
    albumResponse.method.classDef
}

private val albumHeaders = method("Configure Imgur album request") {
    inClass(albumLoader)
    // The application's bundled OkHttp request builder and settings types are obfuscated.
    params("k4.v", BUILDER, Type.String, IMGUR_URI)
    returns(Type.Void)
    calls {
        owner(BUILDER)
        name("n")
        params(Type.String, Type.String)
    }
}

private val albumCover = method("Imgur album cover URI") {
    params(IMGUR_URI)
    returns(Type.String)
    strings("cover", "album")
    calls { owner("com.andrewshu.android.reddit.imgur.ImgurV3AlbumResponse") }
}

private val galleryCover = method("Imgur gallery cover URI") {
    params(IMGUR_URI)
    returns(Type.String)
    strings("cover", "gallery", "album")
    calls { owner("com.andrewshu.android.reddit.imgur.ImgurV3GalleryAlbumResponse") }
}

val fixImgur = patch(RifPatchStrings.fixImgur) {
    description(RifPatchStrings.fixImgurDescription)
    compatibleWith(rifIsFun)
    val clientId = stringOption(
        "imgurClientId",
        RifPatchStrings.imgurClientId,
        RifPatchStrings.imgurClientIdDescription,
    )

    execute {
        val override = options.getOrNull(clientId)?.trim()?.takeIf { it.isNotEmpty() }
        albumUrl.method
        albumHeaders.method
        val coverMethods = listOf(albumCover.method, galleryCover.method)
        openLink.method
        val id = override ?: coverMethods.map { method ->
            // Keep this package's existing Imgur authorization in the same album and cover feature.
            method.instructions.mapNotNull { it.stringValue }
                .single { it.startsWith(CLIENT_ID_PREFIX) }.removePrefix(CLIENT_ID_PREFIX)
        }.distinct().single()
        require(validClientId.matches(id)) { "Enter an authorized Imgur client ID." }

        albumUrl.replace { returnValue(Imgur.albumUri(param(0), param(1))) }
        albumHeaders.replace {
            // The URI here is the actual URI already set on the request builder.
            whenTrue(Imgur.isApiUrl(param(3).callVirtual(IMGUR_URI, "toString", "()Ljava/lang/String;"))) {
                param(1).callVirtual(
                    BUILDER,
                    "n",
                    "(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/c0\$a;",
                    string("Authorization"),
                    string(CLIENT_ID_PREFIX + id),
                )
            }
            returnVoid()
        }
        albumCover.replace { returnValue(Imgur.coverUrl(param(0), bool(false), string(id))) }
        galleryCover.replace { returnValue(Imgur.coverUrl(param(0), bool(true), string(id))) }
        openLink.before { param(0).assign(Imgur.normalizeAlbumLink(param(0))) }
    }
}
