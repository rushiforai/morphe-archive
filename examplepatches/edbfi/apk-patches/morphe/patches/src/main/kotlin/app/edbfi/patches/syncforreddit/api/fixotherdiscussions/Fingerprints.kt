// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.api.fixotherdiscussions

import app.edbfi.patches.shared.hasFlags
import app.edbfi.patches.syncforreddit.declaredIn
import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `OAuthPostsRequest` builds the URL of every post listing from its key, given twice (second and third parameters).
 * "Other discussions" is the key `seen###<URL-encoded link>`, which becomes `submit.json?url=`; a search key,
 * `search###<subreddit>###<query>`, becomes `search.json?q=`.
 */
internal object PostsUrlFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    // The fourth parameter is the obfuscated paging state.
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;", "L", "Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf("submit.json?url=", "search.json?q="),
    custom = declaredIn("OAuthPostsRequest.java") { it.hasFlags(AccessFlags.PUBLIC, AccessFlags.STATIC) },
)
