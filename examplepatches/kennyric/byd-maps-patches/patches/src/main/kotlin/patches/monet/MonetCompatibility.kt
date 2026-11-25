package patches.monet

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

internal val monet = Compatibility(
    name = "Monet Android TV", packageName = "com.klevico.monet", apkFileType = ApkFileType.APK,
    formFactor = FormFactor.TV,
    signatures = setOf("4bec386a6baae56f0694d3be54f67e0625b973109e0dbb947df2a5d0254975e0"),
    targets = listOf(AppTarget(version = "1.1.1", versionCode = 135, minSdk = 26)),
)
internal val monetOriginalInput = patches.shared.originalInput(monet)
