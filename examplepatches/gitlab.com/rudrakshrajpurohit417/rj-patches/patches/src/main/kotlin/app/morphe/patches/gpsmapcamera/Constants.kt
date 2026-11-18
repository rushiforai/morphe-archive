package app.morphe.patches.gpsmapcamera

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "com.gpsmapcamera.geotagginglocationonphoto"

    val COMPATIBILITY = Compatibility(
        name = "GPS Map Camera",
        packageName = PACKAGE_NAME,
        apkFileType = ApkFileType.APKM,
        targets = listOf(
            AppTarget(version = "1.9.40")
        )
    )
}
