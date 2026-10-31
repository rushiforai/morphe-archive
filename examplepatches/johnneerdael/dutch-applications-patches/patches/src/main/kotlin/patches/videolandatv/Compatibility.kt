package patches.videolandatv

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

internal val videolandTv = Compatibility(
    name = "Videoland Android TV", packageName = "nl.rtl.videoland.v2", apkFileType = ApkFileType.APKS,
    description = "Stable controls for the tested Videoland TV build, validated with Premium and free accounts. Hide ads, disable tracking and hide subscription-required catalogue content without changing account rights. The paid ad-supported plan has not been separately validated.",
    formFactor = FormFactor.TV,
    signatures = setOf("6c7782ca5cabbaaf0546c31b63b7a5ed112ef6a00a5422fa263c2516dee2c141"),
    targets = listOf(AppTarget(version = "1.117.0", versionCode = 1622, minSdk = 24)),
)
internal val originalInput = patches.shared.originalInput(videolandTv)
