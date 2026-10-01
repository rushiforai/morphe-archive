package app.morphe.patches.deeptoplay.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_DEEPTOPLAY = Compatibility(
        name = "DeeptoPlay",
        packageName = "com.gotipath.deeptotv",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0X070C1C,
        signatures = setOf("538383c8eef7771c7f76cf89e14aa9dab54c548ef62554fc0bbbcec526bd63fc"),
        targets = listOf(
            AppTarget(version = "2.2.10", versionCode = 2230, minSdk = 24),
        )
    )
}
