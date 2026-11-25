package patches.magicearth

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val magicEarth = Compatibility(
    name = "Magic Earth",
    packageName = "com.generalmagic.magicearth",
    apkFileType = ApkFileType.APKM,
    signatures = setOf("fa91bd3a8bfa2b03bda48422b238d584f23921154a5279e721f2f90a74d38806"),
    targets = listOf(AppTarget(version = "7.1.26.38.B4684D03.6207A61BA", versionCode = 2026141716, minSdk = 28)),
)

internal val originalInput = patches.shared.originalInput(magicEarth)
