// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.api.useuserendpoint

import app.morphe.patcher.Fingerprint

// The requests that build a user's /u/<name>/about.json URL, and the cache keys the friend requests clear.
private val USER_REQUESTS =
    setOf(
        "OAuthUserIdRequest.java",
        "OAuthUserInfoRequest.java",
        "OAuthSubredditInfoRequest.java",
        "OAuthFriendRequest.java",
        "OAuthUnfriendRequest.java",
    )

/** Every method of the user requests that holds "/about.json". */
internal object UserAboutFingerprint : Fingerprint(
    strings = listOf("/about.json"),
    custom = { _, classDef -> classDef.sourceFile in USER_REQUESTS },
)
