package patches.npostarttv

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

internal val npoTv = Compatibility(
    name = "NPO Start Android TV", packageName = "nl.uitzendinggemist", apkFileType = ApkFileType.APKS,
    description = "Patches for Android TV only; not the phone application.",
    formFactor = FormFactor.TV,
    signatures = setOf("7bfd84443c8e1fefc1b9cd8b5d0fcf18c922a2d4b778e2d109427d2cc418b1f2"),
    targets = listOf(AppTarget(version = "1.48.2-2405", versionCode = 245497937, minSdk = 32)),
)
internal val originalInput = patches.shared.originalInput(npoTv)
