package app.aimal.patches.viki

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Rakuten Viki, the phone/tablet build.
 *
 * Like the other targets in this bundle the app is a Jetpack Compose + Hilt
 * app on androidx.media3, and APKMirror ships it as a split bundle.
 */
val VIKI = Compatibility(
    name = "Viki",
    packageName = "com.viki.android",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x0C9CFF,
    targets = listOf(
        // Developed and verified against this build (versionCode 78800).
        AppTarget(version = "26.5.0"),
        // Every fingerprint matches on structure or on Viki's own unobfuscated
        // bean names, not on a version, so newer builds are expected to work.
        AppTarget(version = null, isExperimental = true),
    )
)

/**
 * `com.viki.library.beans.Features` - the entitlement enum. It is a
 * kotlinx.serialization bean whose constants are matched against the names the
 * API returns, so neither the class nor its `noads` / `hd` / `download`
 * constants can be renamed by R8.
 */
internal const val VIKI_FEATURES = "Lcom/viki/library/beans/Features;"
