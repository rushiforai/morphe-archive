package app.paresh.patches.crex.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CREX = Compatibility(
        name = "CREX - Just Cricket",
        packageName = "in.cricketexchange.app.cricketexchange",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xA8805C,
        targets = listOf(
            AppTarget(version = "26.04.05")
        )
    )
}
