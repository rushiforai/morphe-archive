package app.morphe.patches.hoichoi.content

import app.morphe.patches.hoichoi.extension.sharedExtensionPatch
import app.morphe.patches.hoichoi.extension.sharedExtensionPatchTv
import app.morphe.patches.hoichoi.shared.Constants.COMPATIBILITY_HOICHOI
import app.morphe.patches.hoichoi.shared.Constants.COMPATIBILITY_HOICHOITV

@Suppress("unused")
val accessContent = accessContentPatch("Access content", COMPATIBILITY_HOICHOI, sharedExtensionPatch)

@Suppress("unused")
val accessContentTv = accessContentPatch("Access content (TV)", COMPATIBILITY_HOICHOITV, sharedExtensionPatchTv)
