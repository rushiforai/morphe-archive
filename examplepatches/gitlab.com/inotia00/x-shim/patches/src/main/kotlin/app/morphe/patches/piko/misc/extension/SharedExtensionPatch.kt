package app.morphe.patches.piko.misc.extension

import app.morphe.patcher.patch.bytecodePatch

val sharedExtensionPatch = bytecodePatch {
    extendWith("extensions/piko.mpe")
}
