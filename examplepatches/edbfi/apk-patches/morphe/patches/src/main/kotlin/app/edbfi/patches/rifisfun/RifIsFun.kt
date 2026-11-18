// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal const val RIF_PACKAGE = "com.andrewshu.android.reddit"

/** The manifest versionName every rif is fun patch was tested on. */
internal const val RIF_VERSION = "5.6.22"

internal val RIF_IS_FUN =
    Compatibility(
        name = "rif is fun",
        packageName = RIF_PACKAGE,
        targets = listOf(AppTarget(RIF_VERSION)),
    )

/** The app's Application class. R8 kept its name: the manifest names it. */
internal const val APPLICATION = "Lcom/andrewshu/android/reddit/RedditIsFunApplication;"
