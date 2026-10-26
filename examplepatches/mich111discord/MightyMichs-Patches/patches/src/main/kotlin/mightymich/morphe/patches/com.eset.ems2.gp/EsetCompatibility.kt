package mightymich.morphe.patches.com.eset.ems2.gp

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object EsetCompatibility {
    val EMS = Compatibility(
        name = "ESET Mobile Security",
        packageName = "com.eset.ems2.gp",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0094A0,
        targets = listOf(
            AppTarget(version = "12.0.17.0")
        )
    )
}
