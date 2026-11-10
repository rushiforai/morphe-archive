package app.morphe.patches.addatimes.extension

import app.morphe.patches.addatimes.extension.hooks.addatimesActivityOnCreateHook
import app.morphe.patches.addatimes.extension.hooks.addatimesApplicationOnCreateHook
import app.morphe.patches.addatimes.extension.hooks.addatimesTvActivityOnCreateHook
import app.morphe.patches.addatimes.extension.hooks.addatimesTvApplicationOnCreateHook
import app.morphe.patches.all.misc.extension.sharedExtensionPatch

val sharedExtensionPatch =
    sharedExtensionPatch(
        listOf("addatimes"),
        addatimesActivityOnCreateHook,
        addatimesApplicationOnCreateHook,
    )

val sharedExtensionPatchTv =
    sharedExtensionPatch(
        listOf("addatimes"),
        addatimesTvActivityOnCreateHook,
        addatimesTvApplicationOnCreateHook,
    )
