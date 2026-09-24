/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.instagram.misc.extension

import app.morphe.patches.all.misc.extension.sharedExtensionPatch
import app.morphe.patches.instagram.misc.extension.hooks.instagramInitHook

val sharedExtensionPatch = sharedExtensionPatch(
    listOf("instagram"),
    instagramInitHook,
)
