package app.morphe.patches.bongobd.extension

import app.morphe.patches.all.misc.extension.sharedExtensionPatch
import app.morphe.patches.bongobd.extension.hooks.bongobdActivityOnCreateHook
import app.morphe.patches.bongobd.extension.hooks.bongobdApplicationOnCreateHook

val sharedExtensionPatch = sharedExtensionPatch(
    listOf("bongo"),
    bongobdActivityOnCreateHook,
    bongobdApplicationOnCreateHook
)