package patches.angrybirds2

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import patches.shared.originalInput

internal val angryBirds2 = Compatibility(
    name = "Angry Birds 2", packageName = "com.rovio.baba",
    apkFileType = ApkFileType.APKS,
    signatures = setOf("3bf281705398004c6f8e4ba8426c3ba2490385c3aeaf6b05b6440396c6a1a50d"),
    targets = listOf(AppTarget(version = "26.7.3", versionCode = 50305634, minSdk = 29)),
)

internal val originalInput = originalInput(angryBirds2)
