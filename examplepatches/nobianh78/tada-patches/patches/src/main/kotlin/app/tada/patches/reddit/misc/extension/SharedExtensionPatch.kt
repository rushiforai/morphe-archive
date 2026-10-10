/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.reddit.misc.extension

import app.tada.patches.reddit.misc.extension.hooks.redditActivityOnCreateHook
import app.tada.patches.reddit.misc.extension.hooks.redditApplicationOnCreateHook
import app.morphe.patches.all.misc.extension.sharedExtensionPatch

val sharedExtensionPatch = sharedExtensionPatch(
    listOf("reddit"),
    redditActivityOnCreateHook,
    redditApplicationOnCreateHook
)
