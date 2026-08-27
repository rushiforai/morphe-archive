package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    /**
     * Expand (Monroe Institute) — package + version from the APK you are patching.
     * Confirm these against decompiled Expand BuildConfig / manifest.json.
     */
    val COMPATIBILITY_EXPAND = Compatibility(
        name = "Expand",
        packageName = "org.monroeinstitute.expand",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2C2C31,
        targets = listOf(
            AppTarget(version = "2.1.1")
        )
    )

    /**
     * Lumenate — package + version from APKPure XAPK manifest.json (7.1.1 / 388).
     * Split XAPK: base + config.arm64_v8a + config.xxxhdpi; patch against merged APK.
     */
    val COMPATIBILITY_LUMENATE = Compatibility(
        name = "Lumenate",
        packageName = "com.lumenate.lumenateaa",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1AABB8,
        targets = listOf(
            AppTarget(version = "7.1.1")
        )
    )
}
