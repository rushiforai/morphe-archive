package patches.kijk

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

internal val kijk = Compatibility(
    name = "KIJK Android", packageName = "nl.sbs.kijk", apkFileType = ApkFileType.APK,
    description = "Native Android phone and tablet application.",
    formFactor = FormFactor.MOBILE,
    signatures = setOf("71fc30d57f7440ddb3c91de0594323e017b4b52de817fb0714d7842aec701afe"),
    targets = listOf(AppTarget(version = "9.8.0", versionCode = 2026101500, minSdk = 26)),
)
internal val originalInput = patches.shared.originalInput(kijk)
