package app.morphe.patches.iscreen.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ISCREEN = Compatibility(
        name = "IScreen",
        packageName = "com.rockstreamer.iscreen",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0XE50019,
        signatures = setOf("55c2444d7e72a523828866ecf6188b95022f61c40117c52f7fbec00ad509dad6"),
        targets = listOf(
            AppTarget(version = "2.2.51", versionCode = 318, minSdk = 24),
            AppTarget(version = "2.2.41", versionCode = 310, minSdk = 24),
            AppTarget(version = "2.2.31", versionCode = 300, minSdk = 24),
            AppTarget(version = "2.2.15", versionCode = 285, minSdk = 24),
            AppTarget(version = "2.2.7", versionCode = 278, minSdk = 24),
        ),
    )
}
