package app.tada.patches.music.misc.extension

import app.tada.patches.music.misc.extension.hooks.youTubeMusicApplicationInitHook
import app.tada.patches.music.misc.extension.hooks.youTubeMusicApplicationInitOnCreateHook
import app.morphe.patches.all.misc.extension.sharedExtensionPatch

val sharedExtensionPatch = sharedExtensionPatch(
    listOf("music", "shared-youtube"),
    youTubeMusicApplicationInitHook,
    youTubeMusicApplicationInitOnCreateHook
)
