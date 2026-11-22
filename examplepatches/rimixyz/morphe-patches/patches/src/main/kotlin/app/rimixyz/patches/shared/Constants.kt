package app.rimixyz.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_17TRACK = Compatibility(
        name = "17TRACK",
        packageName = "yqtrack.app",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1878F3,
        targets = listOf(
            // Version analyzed and confirmed by reverse engineering of the APK.
            AppTarget(version = "3.1.6896.1")
        )
    )

    val COMPATIBILITY_WRESTLINGREVOLUTION = Compatibility(
        name = "Wrestling Revolution",
        packageName = "air.WRCareer",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xD32F2F,
        targets = listOf(
            // Version analyzed and confirmed by reverse engineering of the APK.
            AppTarget(version = "2.150.64")
        )
    )

    val COMPATIBILITY_NEWSTARSOCER = Compatibility(
        name = "New Star Soccer",
        packageName = "com.newstargames.newstarsoccer",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x1B5E20,
        signatures = setOf(
            // SHA-256 do certificado do base.apk analisado (v1/v2/v3 e Source Stamp).
            "bec73a9ac3f4e7da49ab4f5ecc56fe3162011fe87d6eba0eb6454bd167dd8086"
        ),
        targets = listOf(
            // APKS analisado: SHA-256 bc76b635a3ac82967e6973273485abb27796b67975653ad7827691211bb796c3.
            AppTarget(version = "4.34", versionCode = 142)
        )
    )

    val COMPATIBILITY_MYTHERAPY = Compatibility(
        name = "MyTherapy",
        packageName = "eu.smartpatient.mytherapy",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x0F9D58,
        signatures = setOf(
            // SHA-256 do certificado do base.apk analisado (v2/v3, Source Stamp à parte).
            "3099a23a0569e918f79d43bc144622c245e18e8928f997a9a8c883c9348ed5f7"
        ),
        targets = listOf(
            // APKS analisado: SHA-256 953265d0c5b12b3cc40ac81765acd3c0123b13369b820940352cc865e8a855a2.
            AppTarget(version = "4.16.2", versionCode = 4016002)
        )
    )
}
