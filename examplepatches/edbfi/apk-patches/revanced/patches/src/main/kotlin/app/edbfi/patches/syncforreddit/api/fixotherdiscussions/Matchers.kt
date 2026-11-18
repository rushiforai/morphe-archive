// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.api.fixotherdiscussions

import app.edbfi.patches.shared.isDeclaredIn
import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.accessFlags
import app.revanced.patcher.custom
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.returnType
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `OAuthPostsRequest` builds the URL of every post listing from its key, given twice (second and third parameters).
 * "Other discussions" is the key `seen###<URL-encoded link>`, which becomes `submit.json?url=`; a search key,
 * `search###<subreddit>###<query>`, becomes `search.json?q=`.
 */
internal fun BytecodePatchContext.postsUrlMethod() = uniqueMethod("the posts URL builder", "submit.json?url=", "search.json?q=") {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.STATIC)
    returnType("Ljava/lang/String;")
    // The fourth parameter is the obfuscated paging state.
    parameterTypes("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;", "L", "Ljava/lang/String;", "Ljava/lang/String;")
    custom { isDeclaredIn(this, "OAuthPostsRequest.java") }
}
