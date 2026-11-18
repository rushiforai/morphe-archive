// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.api.fixgalleries

import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.custom
import app.revanced.patcher.definingClass
import app.revanced.patcher.name
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.returnType
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val GALLERY_PACKAGE = "Lcom/andrewshu/android/reddit/browser/redditgallery"

/**
 * Fails unless the app's gallery loader still asks `/api/info.json` for the gallery's post by its `t3_` name and parses
 * the reply as a listing of that post, the request and reply the extension's Galleries handler replaces. R8 renamed the
 * loader, so it is found by its URL's literals; the parser by the JSON model classes R8 kept.
 */
internal fun BytecodePatchContext.checkGalleryRequest() {
    val url =
        uniqueMethod("the gallery loader's URL", "info.json", "raw_json") {
            name("<clinit>")
        }
    uniqueMethod("the gallery loader's post name", "t3", "id") {
        definingClass(url.definingClass)
        returnType("Landroid/net/Uri;")
        parameterTypes("Ljava/lang/String;")
    }
    uniqueMethod("the gallery reply parser") {
        returnType("$GALLERY_PACKAGE/GalleryThreadThing;")
        parameterTypes("Ljava/io/InputStream;")
        custom {
            definingClass.startsWith(url.definingClass.removeSuffix(";") + "$") &&
                implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type == "$GALLERY_PACKAGE/GalleryInfoApiListingWrapper;" } == true
        }
    }
}
