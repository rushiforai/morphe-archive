package patches.videoland

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

internal val videolandMobile = Compatibility(
    name = "Videoland Android", packageName = "nl.rtl.videoland.v2", apkFileType = ApkFileType.APKS,
    description = "Advertising and optional tracking controls for the inspected Videoland Android phone/tablet build. Runtime acceptance is recorded separately; subscription rights and catalogue availability are unchanged.",
    formFactor = FormFactor.MOBILE,
    signatures = setOf("6c7782ca5cabbaaf0546c31b63b7a5ed112ef6a00a5422fa263c2516dee2c141"),
    targets = listOf(AppTarget(version = "1.116.4", versionCode = 1627, minSdk = 24)),
)
internal val originalInput = patches.shared.originalInput(videolandMobile)
