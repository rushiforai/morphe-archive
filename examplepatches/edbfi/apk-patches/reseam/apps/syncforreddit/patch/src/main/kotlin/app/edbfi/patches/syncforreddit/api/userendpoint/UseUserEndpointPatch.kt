// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.api.userendpoint

import app.edbfi.patches.syncforreddit.SyncPatchStrings
import app.edbfi.patches.syncforreddit.syncForReddit
import app.reseam.patch.methods
import app.reseam.patch.patch

private const val PROFILE_PATH = "u/"
private const val PROFILE_CACHE_PREFIX = "https://oauth.reddit.com/u/"

private val profileRequests = methods("User profile requests") {
    strings(PROFILE_PATH, "/about.json")
}

private val profileCacheInvalidations = methods("User profile cache invalidation") {
    strings(PROFILE_CACHE_PREFIX, "/about.json")
    calls {
        owner("Lcom/android/volley/Cache;")
        name("remove")
    }
}

val useUserEndpoint = patch(SyncPatchStrings.useUserEndpoint) {
    description(SyncPatchStrings.useUserEndpointDescription)
    compatibleWith(syncForReddit)
    enabledByDefault(false)

    execute {
        val requests = profileRequests.all.map { it.method }
        val invalidations = profileCacheInvalidations.all.map { it.method }
        check(requests.size == 4) { "Expected four profile request builders, found ${requests.size}" }
        check(invalidations.size == 2) { "Expected two profile cache invalidations, found ${invalidations.size}" }

        requests.forEach { check(it.replaceAllStrings(PROFILE_PATH, "user/") == 1) }
        invalidations.forEach {
            check(it.replaceAllStrings(PROFILE_CACHE_PREFIX, "https://oauth.reddit.com/user/") == 1)
        }
    }
}
