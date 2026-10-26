package id.ikuradachi.patches.carbitlink.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CARBIT_LINK = Compatibility(
        name = "CarbitLink",
        packageName = "net.easyconn.carman.wws",
        apkFileType = ApkFileType.APK,
        targets = listOf(AppTarget(version = "6.5.1", minSdk = 24)),
    )
}
