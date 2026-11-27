package app.syncit.patches.sync.profile

import app.morphe.patcher.Fingerprint

/**
 * The requests that still ask for the deprecated `/u/` profile path.
 *
 * Matched by the source file Sync compiled them from, because the class and method names are
 * obfuscated.
 */
internal val profileEndpointFingerprints = listOf(
    Fingerprint(
        strings = listOf("https://oauth.reddit.com/u/"),
        custom = { _, classDef ->
            classDef.sourceFile in setOf(
                "OAuthFriendRequest.java",
                "OAuthUnfriendRequest.java",
            )
        }
    ),
    Fingerprint(
        strings = listOf("u/"),
        custom = { _, classDef ->
            classDef.sourceFile in setOf(
                "OAuthUserInfoRequest.java",
                "OAuthUserIdRequest.java",
                "OAuthSubredditInfoRequest.java",
            )
        }
    )
)
