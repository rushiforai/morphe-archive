// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.fiximgur

import app.edbfi.patches.rifisfun.misc.extension.EXTENSION
import app.edbfi.patches.shared.hasFlags
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val ALBUM_RESPONSE = "Lcom/andrewshu/android/reddit/imgur/ImgurV3AlbumResponse;"

// R8 renamed the album viewer, its request engine and the thumbnail loader, but kept the Imgur JSON models' names.

/**
 * The album viewer's parser, in its request task: it reads an `ImgurV3AlbumResponse` and links each image as
 * `https://i.imgur.com/<id>.jpg`, or `.gifv` when animated.
 */
internal object AlbumParserFingerprint : Fingerprint(
    parameters = listOf("Ljava/io/InputStream;"),
    strings = listOf("https://i.imgur.com/", ".gifv"),
    custom = { method, _ ->
        method.returnType != "Ljava/lang/Object;" &&
            method.implementation?.instructions?.any { it.getReference<TypeReference>()?.type == ALBUM_RESPONSE } == true
    },
)

/**
 * The album viewer's URL, on its developer's proxy: `https://<proxy>/api/imgur/3/(gallery/)album/<id>`, the host
 * scrambled. The extension reads the ID from this path.
 */
internal object ProxyAlbumUrlFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Landroid/net/Uri;",
    parameters = listOf("Ljava/lang/String;", "Z"),
    strings = listOf("api", "imgur", "3", "gallery", "album"),
)

/** The request engine's background method, which every request task runs: it calls the engine's send method. */
internal class BackgroundFingerprint(
    engine: String,
    send: String,
) : Fingerprint(
    definingClass = engine,
    isStatic = false,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("[Ljava/lang/Void;"),
    filters = listOf(methodCall(definingClass = engine, name = send, parameters = listOf())),
    custom = { method, _ -> method.hasFlags(AccessFlags.VARARGS) },
)

/** The engine's getter of the task's request URL, the one final method returning a Uri. */
internal class RequestUriFingerprint(engine: String) :
    Fingerprint(
        definingClass = engine,
        isStatic = false,
        returnType = "Landroid/net/Uri;",
        parameters = listOf(),
        custom = { method, _ -> method.hasFlags(AccessFlags.FINAL) },
    )

/** The engine's abstract parser, which each task implements and the engine calls with a reply's body. */
internal class EngineParserFingerprint(engine: String) :
    Fingerprint(
        definingClass = engine,
        returnType = "Ljava/lang/Object;",
        parameters = listOf("Ljava/io/InputStream;"),
        custom = { method, _ -> method.hasFlags(AccessFlags.ABSTRACT) },
    )

/**
 * The album thumbnail loader's two lookups of an album's cover on the proxy, for `/a/` links and for gallery links:
 * each takes the link and returns the cover's thumbnail URL, or null.
 */
internal object CoverFingerprint : Fingerprint(
    isStatic = false,
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/net/Uri;"),
    strings = listOf("Could not parse Imgur album JSON", "cover"),
)

/** The extension method the "Imgur client ID" option goes in. */
internal object ClientIdOptionFingerprint : Fingerprint(
    definingClass = "$EXTENSION/Imgur;",
    name = "clientId",
    returnType = "Ljava/lang/String;",
)
