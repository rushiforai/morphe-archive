package app.morphe.patches.cellsurvivor

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CELL_SURVIVOR =
        Compatibility(
            name = "Cell Survivor",
            packageName = "defense.roguelike.cell.shoot.survivor",
            apkFileType = ApkFileType.APK,
            targets =
                listOf(
                    AppTarget(
                        version = "2.23",
                    ),
                    AppTarget(
                        version = "2.20",
                    ),
                    AppTarget(
                        version = "2.15",
                    ),
                ),
        )
}
