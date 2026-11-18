// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/** The manifest versionName every Sync patch was tested on. */
internal const val SYNC_VERSION = "v23.06.30-13:39"

internal val SYNC_FOR_REDDIT =
    Compatibility(
        name = "Sync for Reddit",
        packageName = "com.laurencedawson.reddit_sync",
        targets = listOf(AppTarget(SYNC_VERSION)),
    )
