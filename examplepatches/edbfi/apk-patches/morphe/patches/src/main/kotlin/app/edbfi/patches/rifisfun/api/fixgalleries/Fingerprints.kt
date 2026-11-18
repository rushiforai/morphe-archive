// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.api.fixgalleries

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val GALLERY_PACKAGE = "Lcom/andrewshu/android/reddit/browser/redditgallery"

// R8 renamed the gallery loader, so it is found by its URL's literals; the parser by the JSON model classes R8 kept.

/** The gallery loader's static initializer builds its `/api/info.json?raw_json=1` URL. */
internal object GalleryUrlFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("info.json", "raw_json"),
)

/** The gallery loader names the gallery's post `t3_<id>`. */
internal class GalleryPostNameFingerprint(loader: String) :
    Fingerprint(
        definingClass = loader,
        returnType = "Landroid/net/Uri;",
        parameters = listOf("Ljava/lang/String;"),
        strings = listOf("t3", "id"),
    )

/** The gallery reply parser, in a class nested in the loader's, reads the reply as a listing of the post. */
internal class GalleryParserFingerprint(loader: String) :
    Fingerprint(
        returnType = "$GALLERY_PACKAGE/GalleryThreadThing;",
        parameters = listOf("Ljava/io/InputStream;"),
        custom = { method, _ ->
            method.definingClass.startsWith(loader.removeSuffix(";") + "$") &&
                method.implementation?.instructions?.any { it.getReference<TypeReference>()?.type == "$GALLERY_PACKAGE/GalleryInfoApiListingWrapper;" } == true
        },
    )
