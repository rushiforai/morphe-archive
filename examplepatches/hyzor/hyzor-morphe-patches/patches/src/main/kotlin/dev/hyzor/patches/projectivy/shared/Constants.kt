package dev.hyzor.patches.projectivy.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // Projectivy 4.73 exists as two separately compiled builds with the same
    // versionName/versionCode:
    //
    //  - the APKMirror APKM (base.apk + arm64-v8a/xhdpi splits), and
    //  - the universal APK published on GitHub (spocky/miproja1,
    //    ProjectivyLauncher-4.73-c98-xda-release.apk, all four ABIs).
    //
    // They carry the same code but different R8 mappings (the APKM's premium flow is
    // `Lze4;`, the GitHub build's is `Llf4;`), so the fingerprints only anchor on
    // build-independent structure. Both are declared because `ApkFileType` is part of
    // `Compatibility`; one declaration cannot cover both file types.
    private val TARGET_4_73 = AppTarget(version = "4.73", versionCode = 98)

    val PROJECTIVY = Compatibility(
        name = "Projectivy Launcher",
        packageName = "com.spocky.projengmenu",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xF08029,
        targets = listOf(TARGET_4_73),
    )

    /** The GitHub release: a single universal APK instead of an APKM bundle. */
    val PROJECTIVY_APK = Compatibility(
        name = "Projectivy Launcher",
        packageName = "com.spocky.projengmenu",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xF08029,
        targets = listOf(TARGET_4_73),
    )
}
