package app.aapam.patches.coloringlearn.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_COLORING_LEARN = Compatibility(
        name = "Coloring and Learn",
        packageName = "com.orange.coloring.learn.kids",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF6B35,
        targets = listOf(
            AppTarget(
                version = "2.28",
                minSdk = 23,
            ),
        ),
    )
}
