package patches.stickman3

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import patches.shared.originalInput

internal val stickman3 = Compatibility(
    name = "Draw a Stickman: EPIC 3", packageName = "com.hitcents.drawastickmanepic3",
    apkFileType = ApkFileType.APKS,
    signatures = setOf("25a7ff8640e10732dde4d88f4cdf005b58a5e08d31a3a55a2a0ba771e64c334a"),
    targets = listOf(AppTarget(version = "1.13.19873", versionCode = 19873, minSdk = 23)),
)

internal val originalInput = originalInput(stickman3)
