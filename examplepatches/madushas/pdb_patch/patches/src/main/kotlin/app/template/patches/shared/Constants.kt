// Multi-app Compatibility declarations for the merged patch bundle.
package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {

    val PDB_COMPATIBILITY = Compatibility(
        name = "Pdb",
        packageName = "pdb.app",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x6C5CE7,
        targets = listOf(AppTarget(version = "2.135.1", versionCode = 2709))
    )

    val MYDIALOG_COMPATIBILITY = Compatibility(
        name = "MyDialog",
        packageName = "net.omobio.dialogsc",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xF26522,
        targets = listOf(AppTarget(version = "18.6.5", versionCode = 1130100213))
    )

    val HUTCH_COMPATIBILITY = Compatibility(
        name = "Hutch",
        packageName = "com.omobio.etisalatone",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xEE1C25,
        // CN=EtISaLaToMoBiO — R8-shrunk RN build by Omobio, universal APK (4 ABIs).
        signatures = setOf("76700e2a20bf441efba368d36e1cfc186c2ef30053e1c5ecb3fec6e32233459d"),
        targets = listOf(
            AppTarget(version = "4.4.1", versionCode = 400426001, minSdk = 24)
        )
    )

    val MATERIAL_CAPSULE_COMPATIBILITY = Compatibility(
        name = "Material Capsule",
        packageName = "com.pryshedko.mtisland",
        // Split-APK XAPK: base + config.arm64_v8a/xxhdpi/en.
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x6750A4,
        // Play-signing certificate of the base APK ("CN=Android, O=Google Inc.").
        signatures = setOf("63e05db5ac02a4147a134b5209edca396cce8c46a9edb09b3173d3d5c821341e"),
        targets = listOf(
            AppTarget(
                version = "17.3",
                // The XAPK ships only config.arm64_v8a native code.
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 173),
                minSdk = 32,
            )
        )
    )

    val TEXTNOW_COMPATIBILITY = Compatibility(
        name = "TextNow",
        packageName = "com.enflick.android.TextNow",
        // Split bundle: base.apk + split_config.arm64_v8a + density splits (.apks).
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x00A8E1,
        signatures = setOf("1428a295a31d63d9e9361cf6c7b71a76b71bf5ff254f7549c7e6d9341e476354"),
        targets = listOf(
            // Replaces the earlier 6.1.0.1 target, which was a wrong (very old) download.
            AppTarget(version = "26.45.0.0", versionCode = 15780, minSdk = 29)
        )
    )

    val ADIDAS_RUNNING_COMPATIBILITY = Compatibility(
        name = "adidas Running",
        packageName = "com.runtastic.android",
        // Split-APK APKM bundle: base + config.arm64_v8a/xxxhdpi/xxhdpi + language splits.
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x000000,
        signatures = setOf("08c2c1b48f633287e72f1f29f0fe664348b3fce4c12ddc8cafa66494268d9427"),
        targets = listOf(
            AppTarget(
                version = "14.12.1",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 2026110512),
                minSdk = 29,
            ),
            AppTarget(
                version = "14.4.0",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 2026011603),
                minSdk = 28,
            ),
        )
    )

    val NIKE_RUN_CLUB_COMPATIBILITY = Compatibility(
        name = "Nike Run Club",
        packageName = "com.nike.plusgps",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x111111,
        // Universal APK (arm64-v8a + armeabi-v7a + x86 + x86_64).
        signatures = setOf("25512576dacc619bd925d1ea05a3e140311d31b0b853183abe1d9da8fd3f240f"),
        targets = listOf(
            AppTarget(version = "4.80.0", versionCode = 1717895889, minSdk = 29),
            AppTarget(version = "4.80.1", versionCode = 1717921629, minSdk = 29)
        )
    )

    val FITBIT_COMPATIBILITY = Compatibility(
        name = "Fitbit",
        packageName = "com.fitbit.FitbitMobile",
        // Split-APK APKM bundle: base + config.arm64_v8a/xxhdpi + 20 language splits.
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x00B0B9,
        // Play-signing certificate of the base APK ("CN=Android, O=Google Inc.").
        signatures = setOf("2cc914da5a849426c1b591e12f0a8adb042fa2feade3a4762845ce6bfadcf313"),
        targets = listOf(
            AppTarget(
                version = "5.11.1.health-mobile-1104134730-1009077909",
                // The bundle ships only config.arm64_v8a native code.
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 1104134730),
                minSdk = 30,
            )
        )
    )

    val TEAMS_COMPATIBILITY = Compatibility(
        name = "Microsoft Teams",
        packageName = "com.microsoft.teams",
        // XAPK bundle: base + config.arm64_v8a / mdpi / en splits.
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x5059C9,
        signatures = setOf("d49b848e0580370b89c4da712b8da7296782e866bcbfb58ccd873fd954725985"),
        targets = listOf(
            AppTarget(version = "1416/1.0.0.2026202302", versionCode = 2026202325, minSdk = 30)
        )
    )

    val JOOBLE_COMPATIBILITY = Compatibility(
        name = "Jooble",
        packageName = "jooble.org",
        // XAPK bundle: base + config.arm64_v8a / mdpi / en splits (Flutter AOT in the abi split).
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x00A0DC,
        signatures = setOf("b04f1f3ee9399ec2a19a4d5dfe2d9bfe708726d1a0ad20ab3dd8464d0d66fd5f"),
        targets = listOf(
            AppTarget(version = "1.47.0", versionCode = 247611, minSdk = 24)
        )
    )

    val GLASSDOOR_COMPATIBILITY = Compatibility(
        name = "Glassdoor",
        packageName = "com.glassdoor.app",
        // XAPK bundle: base + config.arm64_v8a / mdpi / en splits.
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x0CAA41,
        signatures = setOf("417fbc259ee23a858641efaed3229cdca31cd9b514086c91fbe041b5c15fa952"),
        targets = listOf(
            AppTarget(version = "13.15.1", versionCode = 125125, minSdk = 32)
        )
    )

    val SHIMA_COMPATIBILITY = Compatibility(
        name = "Shima+ Dynamic Island",
        packageName = "com.piyush.island",
        // XAPK bundle: base + config.mdpi (no ABI splits — no native libs at all).
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x000000,
        signatures = setOf("eebb863d29141f9157d3c50b47d05d1eb8a734d0c46781b9e3d015b71b751d1d"),
        targets = listOf(
            AppTarget(version = "0.5.1", versionCode = 9, minSdk = 32)
        )
    )

    // Proton VPN was removed from the bundle (2026-11-13): hxReborn's community patch is
    // a better implementation, so shipping a second, narrower unlock would only confuse
    // users. The git history keeps our version (three patches with toggles) if it is ever
    // wanted back.

    val STRAVA_COMPATIBILITY = Compatibility(
        name = "Strava",
        packageName = "com.strava",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0xFC4C02,
        targets = listOf(
            AppTarget(version = "480.15", versionCode = 12399564),
            AppTarget(version = "485.12", versionCode = 12400090),
            AppTarget(version = "486.9", versionCode = 12400193),
            AppTarget(version = "486.11", versionCode = 12400195)
        )
    )
}
