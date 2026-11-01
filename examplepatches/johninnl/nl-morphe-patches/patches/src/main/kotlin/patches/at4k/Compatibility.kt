package patches.at4k

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

internal val at4k = Compatibility(
    name = "AT4K Launcher",
    packageName = "com.overdevs.at4k",
    apkFileType = ApkFileType.APK,
    formFactor = FormFactor.TV,
    signatures = setOf("bfc84ab1296c72653ebca20a2f4cd293bc342a67dd4c61df931edfbad5271685"),
    targets = listOf(AppTarget(version = "1.2", versionCode = 19, minSdk = 27)),
)
