// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.api.fixmorecomments

import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.accessFlags
import app.revanced.patcher.custom
import app.revanced.patcher.extensions.string
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.returnType
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val THREAD = "Lcom/andrewshu/android/reddit/things/objects/ThreadThing;"
private const val RESPONSE = "Lcom/andrewshu/android/reddit/comments/more/MoreCommentsResponse;"

/**
 * Fails unless the app still loads more comments the way the extension answers: one loader, R8-renamed, that posts
 * the form `link_id`, `id`, `api_type`, `children` and `sort` to `api/morechildren.json` and parses the reply as
 * `MoreCommentsResponse` (a kept JSON model).
 */
internal fun BytecodePatchContext.checkMoreCommentsRequest() {
    val form =
        uniqueMethod("the more-comments form", "link_id", "id", "api_type", "children", "sort") {
            accessFlags(AccessFlags.STATIC)
            returnType("Ljava/util/ArrayList;")
            custom { parameterTypes.firstOrNull()?.toString() == THREAD }
        }
    val loader = classDefs[form.definingClass] ?: throw PatchException("No class ${form.definingClass}")
    val methods = loader.methods.mapNotNull { it.implementation?.instructions }
    if (methods.none { method -> method.any { it.string == "morechildren.json" } }) {
        throw PatchException("${loader.type} doesn't post to morechildren.json")
    }
    val parses =
        methods.any { method ->
            method.any { it.opcode == Opcode.CONST_CLASS && ((it as ReferenceInstruction).reference as TypeReference).type == RESPONSE }
        }
    if (!parses) throw PatchException("${loader.type} doesn't parse its reply as MoreCommentsResponse")
}
