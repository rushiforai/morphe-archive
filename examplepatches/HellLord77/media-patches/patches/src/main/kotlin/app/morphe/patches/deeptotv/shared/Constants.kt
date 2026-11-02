package app.morphe.patches.deeptotv.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY_DEEPTOTV =
        Compatibility(
            name = "DeeptoTV",
            packageName = "com.gotipath.deeptotvapp",
            apkFileType = ApkFileType.XAPK,
            appIconColor = 0x235FD9,
            signatures = setOf("760266fd701ea7e4b5b7997c857bef48a395c34deb7211d3d2149465e90fd534"),
            targets = listOf(AppTarget(version = "2.0.4", versionCode = 204, minSdk = 24)),
            formFactor = FormFactor.TV,
        )
}
