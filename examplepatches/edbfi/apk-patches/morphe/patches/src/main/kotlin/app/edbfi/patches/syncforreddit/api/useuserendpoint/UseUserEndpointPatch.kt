// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.api.useuserendpoint

import app.edbfi.patches.shared.rewriteStrings
import app.edbfi.patches.syncforreddit.SYNC_FOR_REDDIT
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch

private const val EXPECTED_REWRITES = 6
private val USER_PREFIXES =
    mapOf(
        "u/" to "user/",
        "https://oauth.reddit.com/u/" to "https://oauth.reddit.com/user/",
    )

@Suppress("unused")
val useUserEndpointPatch =
    patch(
        name = "Use /user/ endpoint",
        description =
        "Requests user profiles from /user/ instead of /u/. Not needed today: Reddit redirects /u/ to /user/, " +
            "and the app follows the redirect.",
        default = false,
    ) {
        compatibleWith(SYNC_FOR_REDDIT)

        execute {
            // The count of rewrites, not of methods, is what must hold.
            val edits = UserAboutFingerprint.matchAllOrNull().orEmpty().map { match -> match.method.rewriteStrings { USER_PREFIXES[it] } }
            val found = edits.sumOf { it.count }
            if (found != EXPECTED_REWRITES) throw PatchException("Expected $EXPECTED_REWRITES /u/ URLs, found $found")
            edits.forEach { it.apply() }
        }
    }
