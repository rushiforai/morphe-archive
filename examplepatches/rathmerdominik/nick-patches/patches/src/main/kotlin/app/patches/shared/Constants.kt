package app.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_DIFFUSE = Compatibility(
        name = "Diffuse",
        packageName = "com.depthware.lwp.diffuse.v2",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x7B61FF,
        targets = listOf(
            AppTarget(
                version = "1.1.0.0 (3433)-PUB",
                minSdk = 24,
            ),
        ),
    )
}
