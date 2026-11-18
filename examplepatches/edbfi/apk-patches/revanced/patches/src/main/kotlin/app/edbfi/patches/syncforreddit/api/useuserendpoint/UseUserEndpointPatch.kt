// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.api.useuserendpoint

import app.edbfi.patches.shared.rewriteStrings
import app.edbfi.patches.syncforreddit.SYNC_PACKAGE
import app.edbfi.patches.syncforreddit.SYNC_VERSION
import app.revanced.patcher.firstMethod
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch

// The requests that build a user's /u/<name>/about.json URL, and the cache keys the friend requests clear.
private val USER_REQUESTS =
    setOf(
        "OAuthUserIdRequest.java",
        "OAuthUserInfoRequest.java",
        "OAuthSubredditInfoRequest.java",
        "OAuthFriendRequest.java",
        "OAuthUnfriendRequest.java",
    )
private const val EXPECTED_REWRITES = 6
private val USER_PREFIXES =
    mapOf(
        "u/" to "user/",
        "https://oauth.reddit.com/u/" to "https://oauth.reddit.com/user/",
    )

@Suppress("unused")
val useUserEndpointPatch =
    bytecodePatch(
        name = "Use /user/ endpoint",
        description =
        "Requests user profiles from /user/ instead of /u/. Not needed today: Reddit redirects /u/ to /user/, " +
            "and the app follows the redirect.",
        use = false,
    ) {
        compatibleWith(SYNC_PACKAGE(SYNC_VERSION))

        apply {
            val methods =
                classDefs.methodsByString["/about.json"].orEmpty().filter {
                    classDefs[it.definingClass]?.sourceFile in USER_REQUESTS
                }
            val edits = methods.map { method -> firstMethod(method).rewriteStrings { USER_PREFIXES[it] } }
            val found = edits.sumOf { it.count }
            if (found != EXPECTED_REWRITES) throw PatchException("Expected $EXPECTED_REWRITES /u/ URLs, found $found")
            edits.forEach { it.apply() }
        }
    }
