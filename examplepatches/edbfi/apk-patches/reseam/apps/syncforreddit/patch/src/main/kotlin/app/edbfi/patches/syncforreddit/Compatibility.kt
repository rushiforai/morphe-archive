// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit

import app.reseam.patch.CompatiblePackage

internal val syncForReddit = CompatiblePackage(
    "com.laurencedawson.reddit_sync",
    versions = listOf("v23.06.30-13:39"),
    versionCodes = listOf(23033),
)
