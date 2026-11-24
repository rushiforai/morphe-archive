package patches.angrybirdsfriends

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import patches.shared.originalInput

internal val angryBirdsFriends = Compatibility(
    name = "Angry Birds Friends", packageName = "com.rovio.angrybirdsfriends",
    apkFileType = ApkFileType.APKS,
    signatures = setOf("3bf281705398004c6f8e4ba8426c3ba2490385c3aeaf6b05b6440396c6a1a50d"),
    targets = listOf(AppTarget(version = "14.9.0", versionCode = 423911, minSdk = 29)),
)

internal val originalInput = originalInput(angryBirdsFriends)
