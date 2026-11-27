// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.rifisfun

import app.reseam.patch.CompatiblePackage

internal val rifIsFun = CompatiblePackage(
    "com.andrewshu.android.reddit",
    versions = listOf("5.6.22"),
    versionCodes = listOf(4622),
)
