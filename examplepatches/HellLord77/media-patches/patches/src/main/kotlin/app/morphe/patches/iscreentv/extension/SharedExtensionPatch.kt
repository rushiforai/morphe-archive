package app.morphe.patches.iscreentv.extension

import app.morphe.patches.all.misc.extension.sharedExtensionPatch
import app.morphe.patches.iscreentv.extension.hooks.iscreentvActivityOnCreateHook
import app.morphe.patches.iscreentv.extension.hooks.iscreentvApplicationOnCreateHook

val sharedExtensionPatch = sharedExtensionPatch(
    listOf("iscreen"),
    iscreentvActivityOnCreateHook,
    iscreentvApplicationOnCreateHook
)