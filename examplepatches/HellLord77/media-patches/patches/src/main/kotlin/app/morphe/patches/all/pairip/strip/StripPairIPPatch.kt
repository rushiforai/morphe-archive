package app.morphe.patches.all.pairip.strip

import app.morphe.patcher.patch.rawResourcePatch

val stripPairIPPatch =
    rawResourcePatch {
        dependsOn(restoreDexPatch, restoreFieldPatch, stripLibrariesPatch)
    }
