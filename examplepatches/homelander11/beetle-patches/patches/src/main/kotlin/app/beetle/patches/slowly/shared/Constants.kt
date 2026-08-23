package app.beetle.patches.slowly.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_SLOWLY = Compatibility(
        name = "Slowly",
        packageName = "com.slowlyapp",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5A5F,
        targets = listOf(
            AppTarget(
                version = "9.5.6",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 905062),
            ),
            AppTarget(
                version = "9.5.8",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 905083),
            ),
        ),
    )

    /**
     * Avatar Builder raw Hermes targets were verified in both supported
     * Slowly releases. Keep this compatibility separate from Explore so
     * each raw-resource patch can evolve independently.
     */
    val COMPATIBILITY_SLOWLY_AVATAR = Compatibility(
        name = "Slowly",
        packageName = "com.slowlyapp",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5A5F,
        targets = listOf(
            AppTarget(
                version = "9.5.6",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 905062),
            ),
            AppTarget(
                version = "9.5.8",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 905083),
            ),
        ),
    )

    /**
     * PairIP's public license-check entry point is stable in both releases.
     * Keep this target separate from the raw Hermes patches, whose offsets
     * are independently verified for each supported bundle.
     */
    val COMPATIBILITY_SLOWLY_PAIRIP = Compatibility(
        name = "Slowly",
        packageName = "com.slowlyapp",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5A5F,
        targets = listOf(
            AppTarget(
                version = "9.5.6",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 905062),
            ),
            AppTarget(
                version = "9.5.8",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 905083),
            ),
        ),
    )
}
