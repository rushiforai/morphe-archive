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

    val COMPATIBILITY_HABITNOW = Compatibility(
        name = "HabitNow",
        packageName = "com.habitnow",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x4A90E2,
        signatures = setOf(
            // SHA-256 do certificado do base.apk analisado (v2/v3 + Source Stamp).
            "9ef69083e4d204e7efd51a1f8146fad98680979144e699cafb37a8d246fd5375"
        ),
        targets = listOf(
            // APKS analisado: SHA-256 0FD4E0BC0E6A00331FEE7AE1DAC188A46F07935EE46CEB9A2F7CD43E6B57DE6E.
            AppTarget(version = "2.5.5", versionCode = 229)
        )
    )

    val COMPATIBILITY_NOTISAVE = Compatibility(
        name = "Notisave",
        packageName = "com.tenqube.notisave",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x455A64,
        signatures = setOf(
            // SHA-256 do signer principal confirmada com apksigner --print-certs no base.apk.
            // O Source Stamp (3257d599...) é mantido à parte, como nos demais alvos.
            "792e6242acdb39da3f798e1d841bfb5ad4dfd2eeca17665f3480e402d115c997"
        ),
        targets = listOf(
            // Bundle analisado: SHA-256 DC10DD2CBB23379C25DFE532209F7A5E3F40A9172AC773221C535539F55DD541.
            // base.apk: AD585A8DC99B42D6CAD3C4F1F6A9BACA8CEBC8CBC1ACD44E517400F38A338C10.
            AppTarget(version = "274.1.3.2", versionCode = 316)
        )
    )

    val COMPATIBILITY_AUTOCLICKER = Compatibility(
        name = "Auto Clicker",
        packageName = "com.truedevelopersstudio.automatictap.autoclicker",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2962FF,
        signatures = setOf(
            // SHA-256 do certificado lido de META-INF/GOOGPLAY.RSA com keytool -printcert.
            "3978336c89d5429f50a756f68582160b0dc0332aa82f7056faa52bfc4fed35a2"
        ),
        targets = listOf(
            // APK analisado: SHA-256 2A48AF68982BFF95588B740AAED2DE2994DD1A26A419CD66DB929B13CEBB3975.
            AppTarget(version = "2.3.0", versionCode = 93)
        )
    )

    val COMPATIBILITY_XRECORDER = Compatibility(
        name = "XRecorder",
        packageName = "videoeditor.videorecorder.screenrecorder",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x2962FF,
        signatures = setOf(XRECORDER_CERT_SHA256),
        targets = listOf(
            // Bundle analisado: SHA-256 abc9e0c7166a3d106e918b5884de717b614ad81508ace6bee67e48b7616c2137.
            // base.apk:          SHA-256 bbbefb52804ba7a16d8c5508ef5b99dc2130cfd899f374867eed8ff5e3eef1b7.
            // Gravacao e estado Pro testados em aparelho real.
            AppTarget(version = "2.5.6.1", versionCode = 2561002)
        )
    )

    private const val XRECORDER_CERT_SHA256 =
        "11D5525D76147B28FC6D974ABC56710576CF14A7CE78CF8E75FD8A67E312CEC0"
}
