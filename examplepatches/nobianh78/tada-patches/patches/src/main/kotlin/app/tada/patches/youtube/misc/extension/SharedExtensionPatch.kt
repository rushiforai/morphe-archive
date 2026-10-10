package app.tada.patches.youtube.misc.extension

import app.morphe.patches.all.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.extension.hooks.applicationInitHook
import app.tada.patches.youtube.misc.extension.hooks.applicationInitOnCreateHook

val sharedExtensionPatch = sharedExtensionPatch(
    listOf("youtube", "shared-youtube"),
    applicationInitHook,
    applicationInitOnCreateHook
)
