package patches.gamesnacks

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import patches.shared.originalInput

internal val gameSnacks = Compatibility(
    name = "GameSnacks", packageName = "com.google.android.apps.automotive.gamesnacks",
    apkFileType = ApkFileType.APK,
    signatures = setOf("d2fd490eb3ee61e4a129d8f6d948935e79e299a1d8290aa5e965e3c1329faab5"),
    targets = listOf(AppTarget(version = "1.40.827663177", versionCode = 40, minSdk = 29)),
)

internal val originalInput = originalInput(gameSnacks)
