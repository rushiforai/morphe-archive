package app.pigfoot.patches.bitwarden

import app.morphe.patcher.patch.*
import app.pigfoot.patches.shared.certificate.requireOriginalCertificate

private val bitwardenTarget = Compatibility(packageName = BITWARDEN_PACKAGE, name = "Bitwarden", apkFileType = ApkFileType.APK,
    targets = listOf(AppTarget(BITWARDEN_VERSION, versionCodes = mapOf(
        SupportedAbi.ARM64_V8A to BITWARDEN_CODE.toInt(), SupportedAbi.ARMEABI_V7A to BITWARDEN_CODE.toInt(),
        SupportedAbi.X86_64 to BITWARDEN_CODE.toInt(), SupportedAbi.X86 to BITWARDEN_CODE.toInt()), minSdk = 29)))

internal val bitwardenInputPatch = bytecodePatch {
    execute {
        requireBitwardenTarget(packageMetadata.packageName, packageMetadata.versionName, packageMetadata.versionCode)
        requireOriginalCertificate(packageMetadata.signingCertificates.values.flatten(), BITWARDEN_SIGNER)
        for ((type, expected) in bitwardenClassPins) {
            val definition = requireNotNull(classDefByOrNull(type)) { "Missing qualified Bitwarden class: $type" }
            require(bitwardenClassHash(definition) == expected) { "Unsupported or already modified Bitwarden class: $type" }
        }
    }
}

val bitwardenTrustBrowsersPatch = bytecodePatch(
    name = "Bitwarden: Trust re-signed browsers for passkeys",
    description = "Lets you trust a browser that was patched and re-signed. Bitwarden normally rejects it with \"signature does not match\" and offers no choice; this shows the standard \"trust this browser?\" prompt instead. Browsers whose signature already matches are not affected.",
    default = true
) {
    compatibleWith(bitwardenTarget)
    availability { installer, _ -> if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.ENABLED }
    dependsOn(bitwardenInputPatch)
    execute {
        val owner = mutableClassDefBy(BITWARDEN_VALIDATOR)
        val method = owner.methods.single { it.name == "f" && it.returnType == "Lmya;" && it.parameterTypes.size == 4 }
        fun field(type: String) = classDefBy(type).staticFields.singleOrNull { it.type == type }
            ?: throw PatchException("Missing singleton instance in $type")
        trustResignedBrowser(method, field(BITWARDEN_NOT_ALLOWED), field(BITWARDEN_SIGNATURE_NOT_FOUND))
    }
}
