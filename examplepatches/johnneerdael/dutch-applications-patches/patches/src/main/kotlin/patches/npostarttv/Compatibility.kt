package patches.npostarttv

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor
import app.morphe.patcher.PackageMetadata

internal val npoTv = Compatibility(
    name = "NPO Start Android TV", packageName = "nl.uitzendinggemist", apkFileType = ApkFileType.APKS,
    description = "Patches for Android TV only; not the phone application.",
    formFactor = FormFactor.TV,
    signatures = setOf("7bfd84443c8e1fefc1b9cd8b5d0fcf18c922a2d4b778e2d109427d2cc418b1f2"),
    targets = listOf(AppTarget(version = "1.48.2-2405", versionCode = 245497937, minSdk = 24)),
)
internal val npoPhone = Compatibility(
    name = "NPO Start", packageName = "nl.uitzendinggemist", apkFileType = ApkFileType.APKS,
    description = "Patches for the Android phone and tablet application.",
    formFactor = FormFactor.MOBILE,
    signatures = npoTv.signatures,
    targets = listOf(AppTarget(version = "1.48.2-2405", versionCode = 240497937, minSdk = 32)),
)
// The publisher ships the same TV version/code with API 24 and API 32 manifests.
// Catalogue minSdk describes the lowest supported device; preflight accepts only these two variants.
internal val originalInput = patches.shared.originalInput(npoTv, additionalMinSdks = setOf(32), variants = listOf(npoPhone))
internal val PackageMetadata.isNpoPhone get() = versionCode == "240497937"
