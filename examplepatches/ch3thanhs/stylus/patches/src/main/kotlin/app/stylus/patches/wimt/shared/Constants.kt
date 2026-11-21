package app.stylus.patches.wimt.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WIMT = Compatibility(
        name = "Where is my Train",
        packageName = "com.whereismytrain.android",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0x0277BD,
        signatures = setOf(
            "5432fe5862e21082eb8e6cdffebdd3b04a27d358c04f46be46f6f26b7f71c296"
        ),
        targets = listOf(
            AppTarget(
                version = "7.1.5.1012928357",
                minSdk = 24,
            ),
        ),
    )
}
