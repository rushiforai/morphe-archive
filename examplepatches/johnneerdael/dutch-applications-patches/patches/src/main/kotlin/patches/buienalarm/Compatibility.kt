package patches.buienalarm

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val buienalarm = Compatibility(
    name = "Buienalarm",
    packageName = "org.yoki.android.buienalarm",
    apkFileType = ApkFileType.APKS,
    signatures = setOf(
        "d7e009b89d18f11ac9cdc58b1027e14772de9b429a6f2520cd6459c6b9413ceb",
        "057057399eda86a88f79726f9686cd224aa2ca98761a380deebb7d1df9e462b4",
    ),
    targets = listOf(AppTarget(version = "4.32.0", versionCode = 3723, minSdk = 26)),
)
