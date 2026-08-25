package app.aimal.patches.streaming

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * HBO Max, the phone/tablet build. `com.wbd.hbomax` is the Android TV build
 * and is a different app.
 */
val HBO_MAX = Compatibility(
    name = "HBO Max",
    packageName = "com.wbd.stream",
    // Distributed as a split bundle; Manager and Desktop merge it.
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x2C0B4E,
    targets = listOf(
        // Developed and verified against this build.
        AppTarget(version = "7.9.0.84"),
        // Only the context hook matches on an app-specific name, so newer
        // builds are expected to work.
        AppTarget(version = null, isExperimental = true),
    )
)

val DISNEY_PLUS = Compatibility(
    name = "Disney+",
    packageName = "com.disney.disneyplus",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x0C204A,
    targets = listOf(
        AppTarget(version = "26.14.1+rc2-2026.08.20"),
        AppTarget(version = null, isExperimental = true),
    )
)

internal const val EXTENSION_STREAMING = "Lapp/aimal/extension/streaming"
