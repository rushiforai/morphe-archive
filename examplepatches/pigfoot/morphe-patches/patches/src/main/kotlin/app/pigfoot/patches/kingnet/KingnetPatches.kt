package app.pigfoot.patches.kingnet

import app.morphe.patcher.patch.*
import app.pigfoot.patches.shared.certificate.requireOriginalCertificate

private val target = Compatibility(packageName = KINGNET_PACKAGE, name = "智生活", apkFileType = ApkFileType.APK,
    targets = listOf(AppTarget(KINGNET_VERSION, versionCodes = mapOf(
        SupportedAbi.ARM64_V8A to KINGNET_CODE.toInt(), SupportedAbi.ARMEABI_V7A to KINGNET_CODE.toInt(),
        SupportedAbi.X86_64 to KINGNET_CODE.toInt(), SupportedAbi.X86 to KINGNET_CODE.toInt()), minSdk = 30)))

val kingnetCleanupPatch = rawResourcePatch(
    name = "智生活: Remove ads and marketing messages",
    description = "Hide the in-app ad cards, banners and pop-ups, stop the third-party marketing message service and cancel the automatic come-back reminder in the original 智生活 4.20.8 APK. Parcel, order and community notifications are not changed. You must uninstall the original app and sign in again.",
    default = true
) {
    compatibleWith(target)
    availability { installer, _ -> if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.ENABLED }
    execute {
        requireKingnetTarget(packageMetadata.packageName, packageMetadata.versionName, packageMetadata.versionCode)
        requireOriginalCertificate(packageMetadata.signingCertificates.values.flatten(), KINGNET_SIGNER)
        val file = get(KINGNET_ASSET)
        require(file.isFile) { "Missing Kingnet JavaScript asset" }
        val original = file.readBytes()
        requireKingnetAsset(original)
        // No file write until every original site and the input guard have passed.
        file.writeBytes(patchKingnetJavaScript(original))
    }
}
