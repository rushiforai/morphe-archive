package app.aidan.patches.canvas.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

const val CANVAS_PACKAGE_NAME = "com.instructure.candroid"

val COMPATIBILITY_CANVAS = Compatibility(
    name = "Canvas Student",
    packageName = CANVAS_PACKAGE_NAME,
    apkFileType = ApkFileType.APKM,
    appIconColor = 0xE62725,
    signatures = setOf(
        "abfe1362d84c5234c174c2c03d405a480405e361162f7b28dad6bec825ba02b3"
    ),
    targets = listOf(
        AppTarget(version = "8.10.0", minSdk = 28)
    )
)
