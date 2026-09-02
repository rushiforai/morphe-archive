package app.extremecardriving.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

// Şablon: Her yeni Unity oyununda sadece name/packageName/version değiştir.
// APKM = APKMirror bundle (base.apk + split_config.arm64_v8a.apk), XAPK/APK diğerleri.
object Constants {
    val COMPATIBILITY_ECD = Compatibility(
        name = "Extreme Car Driving Simulator",
        packageName = "com.aim.racing",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1A237E,
        targets = listOf(
            AppTarget(version = "7.13.1")
        )
    )
}
