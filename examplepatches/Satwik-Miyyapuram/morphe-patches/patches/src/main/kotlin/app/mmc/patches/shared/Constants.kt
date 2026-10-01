package app.mmc.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "com.appsomniacs.mmc"

    /**
     * Mini Militia Classic : DA2 MMC by Appsomniacs LLC.
     *
     * Developed and verified against 0.14.4 (version code 88), the latest release on
     * APKMirror (split APK variants: arm-v7a / arm64-v8a, nodpi). The game's Java layer
     * is NOT obfuscated, so the patch is expected to keep working on future releases,
     * hence the experimental "any version" target.
     */
    val COMPATIBILITY_MMC = Compatibility(
        name = "Mini Militia Classic",
        packageName = PACKAGE_NAME,
        // APKMirror ships a plain .apk for 0.14.4 (plus a bundle variant).
        apkFileType = ApkFileType.APK,
        // Mini Militia Classic icon background (olive / army green).
        appIconColor = 0x5B6B2E,
        targets = listOf(
            AppTarget(version = "0.14.4"),
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
