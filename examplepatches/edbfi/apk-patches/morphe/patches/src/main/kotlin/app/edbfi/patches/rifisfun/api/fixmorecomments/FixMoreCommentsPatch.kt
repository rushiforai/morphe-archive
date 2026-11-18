// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.api.fixmorecomments

import app.edbfi.patches.rifisfun.RIF_IS_FUN
import app.edbfi.patches.rifisfun.misc.extension.extensionSwitch
import app.edbfi.patches.rifisfun.misc.requesthook.requestHookPatch
import app.edbfi.patches.shared.string
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.matchSingle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val RESPONSE = "Lcom/andrewshu/android/reddit/comments/more/MoreCommentsResponse;"

@Suppress("unused")
val fixMoreCommentsPatch =
    patch(
        name = "Fix load more comments",
        description = "Fixes \"load more comments\" not loading further comments.",
        default = true,
    ) {
        compatibleWith(RIF_IS_FUN)
        dependsOn(requestHookPatch)

        execute {
            checkMoreCommentsRequest()
            extensionSwitch("MoreComments").apply()
        }
    }

/**
 * Fails unless the app still loads more comments the way the extension answers: one loader, R8-renamed, that posts
 * the form `link_id`, `id`, `api_type`, `children` and `sort` to `api/morechildren.json` and parses the reply as
 * `MoreCommentsResponse` (a kept JSON model).
 */
private fun checkMoreCommentsRequest() {
    val form = MoreCommentsFormFingerprint.matchSingle().originalMethod
    val loader = classDefByOrNull(form.definingClass) ?: throw PatchException("No class ${form.definingClass}")
    val methods = loader.methods.mapNotNull { it.implementation?.instructions }
    if (methods.none { method -> method.any { it.string == "morechildren.json" } }) {
        throw PatchException("${loader.type} doesn't post to morechildren.json")
    }
    val parses =
        methods.any { method ->
            method.any { it.opcode == Opcode.CONST_CLASS && it.getReference<TypeReference>()?.type == RESPONSE }
        }
    if (!parses) throw PatchException("${loader.type} doesn't parse its reply as MoreCommentsResponse")
}
