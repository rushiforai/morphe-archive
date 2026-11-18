// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.fiximgur

import app.edbfi.patches.rifisfun.misc.extension.EXTENSION
import app.edbfi.patches.shared.uniqueMethod
import app.revanced.com.android.tools.smali.dexlib2.mutable.MutableMethod
import app.revanced.patcher.custom
import app.revanced.patcher.definingClass
import app.revanced.patcher.extensions.instructions
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.extensions.string
import app.revanced.patcher.firstMethod
import app.revanced.patcher.name
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.returnType
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val ALBUM_RESPONSE = "Lcom/andrewshu/android/reddit/imgur/ImgurV3AlbumResponse;"

// R8 renamed the album viewer, its request engine and the thumbnail loader, but kept the Imgur JSON models' names.

/**
 * The album viewer's parser, in its request task: it reads an `ImgurV3AlbumResponse` and links each image as
 * `https://i.imgur.com/<id>.jpg`, or `.gifv` when animated.
 */
internal fun BytecodePatchContext.albumParserMethod() = uniqueMethod("the Imgur album parser", "https://i.imgur.com/", ".gifv") {
    parameterTypes("Ljava/io/InputStream;")
    custom { returnType != "Ljava/lang/Object;" && references(ALBUM_RESPONSE) }
}

/**
 * The album viewer's URL, on its developer's proxy: `https://<proxy>/api/imgur/3/(gallery/)album/<id>`, the host
 * scrambled. The extension reads the ID from this path.
 */
internal fun BytecodePatchContext.proxyAlbumUrlMethod() = uniqueMethod("the album viewer's proxy URL", "api", "imgur", "3", "gallery", "album") {
    returnType("Landroid/net/Uri;")
    parameterTypes("Ljava/lang/String;", "Z")
    custom { AccessFlags.STATIC.isSet(accessFlags) }
}

/** The request engine's background method, which every request task runs: it calls the engine's send method. */
internal fun BytecodePatchContext.backgroundMethod(
    engine: String,
    send: MutableMethod,
) = uniqueMethod("the request engine's background method") {
    definingClass(engine)
    returnType("Ljava/lang/Object;")
    parameterTypes("[Ljava/lang/Void;")
    custom {
        AccessFlags.VARARGS.isSet(accessFlags) && !AccessFlags.STATIC.isSet(accessFlags) &&
            implementation?.instructions?.any { it.methodReference?.let { ref -> ref.definingClass == engine && ref.name == send.name && ref.parameterTypes.isEmpty() } == true } == true
    }
}

/** The engine's getter of the task's request URL, the one final method returning a Uri. */
internal fun BytecodePatchContext.requestUriMethod(engine: String) = uniqueMethod("the request engine's URL getter") {
    definingClass(engine)
    returnType("Landroid/net/Uri;")
    parameterTypes()
    custom { AccessFlags.FINAL.isSet(accessFlags) && !AccessFlags.STATIC.isSet(accessFlags) }
}

/** The engine's abstract parser, which each task implements and the engine calls with a reply's body. */
internal fun BytecodePatchContext.engineParserMethod(engine: String) = uniqueMethod("the request engine's parser") {
    definingClass(engine)
    returnType("Ljava/lang/Object;")
    parameterTypes("Ljava/io/InputStream;")
    custom { AccessFlags.ABSTRACT.isSet(accessFlags) }
}

/**
 * The album thumbnail loader's two lookups of an album's cover on the proxy, for `/a/` links and for gallery links:
 * each takes the link and returns the cover's thumbnail URL, or null.
 */
internal fun BytecodePatchContext.coverMethods(): List<MutableMethod> {
    val found =
        classDefs.methodsByString["Could not parse Imgur album JSON"].orEmpty().filter { method ->
            method.returnType == "Ljava/lang/String;" && method.parameterTypes.map { it.toString() } == listOf("Landroid/net/Uri;") &&
                !AccessFlags.STATIC.isSet(method.accessFlags) && method.holds("cover")
        }
    val gallery = found.filter { it.holds("gallery") }
    if (found.size != 2 || gallery.size != 1 || found.map { it.definingClass }.distinct().size != 1) {
        throw PatchException("Expected the album and gallery cover lookups in one class, found ${found.map { "${it.definingClass}->${it.name}" }}")
    }
    return found.map { firstMethod(it) }
}

/** The extension method the "Imgur client ID" option goes in. */
internal fun BytecodePatchContext.clientIdMethod() = uniqueMethod("Imgur.clientId in the extension") {
    definingClass("$EXTENSION/Imgur;")
    name("clientId")
    returnType("Ljava/lang/String;")
}

private fun Method.holds(literal: String) = implementation?.instructions?.any { it.string == literal } == true

private fun Method.references(type: String) = implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type == type } == true
