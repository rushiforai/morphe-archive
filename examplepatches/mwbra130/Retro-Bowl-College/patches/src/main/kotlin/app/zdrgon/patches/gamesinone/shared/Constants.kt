package app.zdrgon.patches.gamesinone.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_GAMES_IN_ONE = Compatibility(
        name = "Games In One - Watch Games",
        packageName = "com.MustBeFun.GamesInOneWatchGames",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x42A5F5,
        targets = listOf(
            AppTarget(version = "0.4.5")
        )
    )
}
