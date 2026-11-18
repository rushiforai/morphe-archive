package app.ckzorigins.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    const val PACKAGE_NAME = "com.glu.ckzombies2"

    val COMPATIBILITY = Compatibility(
        name = "CKZ Origins",
        packageName = PACKAGE_NAME,
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x4A5C12,
        targets = listOf(
            AppTarget(version = "2.0.1"),
        ),
    )
}
