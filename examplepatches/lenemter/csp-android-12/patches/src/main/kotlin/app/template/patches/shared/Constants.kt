package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CLIP_STUDIO = Compatibility(
        name = "Clip Studio Paint",
        packageName = "jp.co.celsys.clipstudiopaint.googleplay",
        apkFileType = ApkFileType.APKS_REQUIRED,
        appIconColor = 0x3F9BF5,
        signatures = setOf(
            "2c7507b2c986a1e3750c0d4876d6b1e8035b873a5d221149c167293b3e5449ca",
        ),
        targets = listOf(
            AppTarget(
                version = "5.1.4",
                versionCode = 260903140,
                minSdk = 31
            ),
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}
