package app.template.patches.fotmob.misc.extension

import app.template.patches.shared.misc.extension.activityOnCreateExtensionHook
import app.template.patches.shared.misc.extension.sharedExtensionPatch

val sharedExtensionPatch = sharedExtensionPatch(
    "fotmob",
    activityOnCreateExtensionHook("/MainActivityWrapper;")
)
