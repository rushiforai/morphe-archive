package patches.zoom

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

internal val zoom = Compatibility(
    name = "Zoom Workplace", packageName = "us.zoom.videomeetings", apkFileType = ApkFileType.APKS,
    signatures = setOf("60b75724b34686e52bde944969de120f16bd6d959788d54384494caedd4e445d"),
    targets = listOf(AppTarget(version = "7.2.1.43844", minSdk = 28,
        versionCodes = mapOf(SupportedAbi.ARM64_V8A to 6702010))),
)

internal val originalInput = patches.shared.originalInput(zoom)
