package app.morphe.patches.iscreen.extension

import app.morphe.patches.all.misc.extension.sharedExtensionPatch
import app.morphe.patches.iscreen.extension.hooks.iscreenActivityOnCreateHook
import app.morphe.patches.iscreen.extension.hooks.iscreenApplicationOnCreateHook

val sharedExtensionPatch = sharedExtensionPatch(
    listOf("iscreen"),
    iscreenActivityOnCreateHook,
    iscreenApplicationOnCreateHook
)