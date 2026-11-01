package patches.weeronline

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal const val APP = "Lcom/xs2theworld/weeronline"

internal val weeronline = Compatibility(
    name = "Weeronline",
    packageName = "com.xs2theworld.weeronline",
    apkFileType = ApkFileType.APKS,
    signatures = setOf("b8670a2dbb3bbe91833449d75730b5fc87bb6f0f6961c49340b9eb2ecdff9394"),
    targets = listOf(AppTarget(version = "3.61.0", versionCode = 2030006811, minSdk = 26)),
)
