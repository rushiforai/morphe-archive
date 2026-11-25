package patches.kijkatv

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

internal val kijkTv = Compatibility(
    name = "KIJK Android TV", packageName = "com.talpa.kijk", apkFileType = ApkFileType.APKS,
    description = "Patches for Android TV only; not the phone application.",
    formFactor = FormFactor.TV,
    signatures = setOf("aaec2a5179225394573dd3b26f485f6b62df701f2e9651b3ce461200568bb9dd"),
    targets = listOf(AppTarget(version = "7.2.7", versionCode = 10003, minSdk = 27)),
)
internal val originalInput = patches.shared.originalInput(kijkTv)
