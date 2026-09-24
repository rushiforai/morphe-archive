package app.morphe.patches.bongobdandroidtv.extension

import app.morphe.patches.all.misc.extension.sharedExtensionPatch
import app.morphe.patches.bongobdandroidtv.extension.hooks.bongobdandroidtvActivityOnCreateHook
import app.morphe.patches.bongobdandroidtv.extension.hooks.bongobdandroidtvApplicationOnCreateHook

val sharedExtensionPatch = sharedExtensionPatch(
    listOf("bongo"),
    bongobdandroidtvActivityOnCreateHook,
    bongobdandroidtvApplicationOnCreateHook
)