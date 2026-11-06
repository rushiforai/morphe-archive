package app.morphe.patches.cellsurvivor

import app.morphe.patches.cellsurvivor.Constants.COMPATIBILITY_CELL_SURVIVOR
import app.morphe.patcher.patch.rawResourcePatch

@Suppress("unused")
val dexoptCleanupPatch =
    rawResourcePatch(
        name = "Cleanup Dexopt Profiles",
        description = "Removes baseline.prof to prevent ART installation checksum mismatch warnings.",
    ) {
        compatibleWith(COMPATIBILITY_CELL_SURVIVOR)

        execute {
            try {
                delete("assets/dexopt/baseline.prof", "Remove checksum mismatching baseline profile")
                delete("assets/dexopt/baseline.profm", "Remove checksum mismatching baseline profile metadata")
            } catch (_: Exception) {
            }
        }
    }
