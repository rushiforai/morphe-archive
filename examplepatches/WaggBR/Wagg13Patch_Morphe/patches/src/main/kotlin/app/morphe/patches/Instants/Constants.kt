package app.morphe.patches.instants

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

internal val INSTANTS_COMPATIBILITY = Compatibility(
    name = "Instagram Instants",
    packageName = "com.instagram.moonshot",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xE1306C,
    targets = listOf(
        AppTarget(
            version = "444.0.0.45.108",
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 44501396),
        ),
    ),
)

internal const val GALLERY_HELPER =
    "Lapp/morphe/extension/instants/InstantsGalleryHelper;"

internal const val MOD_MARK_HELPER =
    "Lapp/morphe/extension/instants/InstantsModMark;"
