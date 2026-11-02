package app.pigfoot.patches.windy

import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.pigfoot.patches.shared.certificate.requireOriginalCertificate

private val target = Compatibility(packageName = WINDY_PACKAGE, name = "Windy", apkFileType = ApkFileType.APKM,
    targets = listOf(AppTarget(WINDY_VERSION, versionCodes = mapOf(
        SupportedAbi.ARM64_V8A to WINDY_CODE.toInt(), SupportedAbi.ARMEABI_V7A to WINDY_CODE.toInt(),
        SupportedAbi.X86_64 to WINDY_CODE.toInt(), SupportedAbi.X86 to WINDY_CODE.toInt()), minSdk = 32)))

internal val windyInputPatch = bytecodePatch {
    execute {
        requireWindyTarget(packageMetadata.packageName, packageMetadata.versionName, packageMetadata.versionCode)
        requireOriginalCertificate(packageMetadata.signingCertificates.values.flatten(), WINDY_SIGNER)
        val definition = requireNotNull(classDefByOrNull(WINDY_WIDGET_OWNER)) { "Missing qualified Windy widget class" }
        require(windyClassHash(definition) == WINDY_WIDGET_CLASS_HASH) { "Unsupported or already modified Windy widget class" }
    }
}

private val windyResources = rawResourcePatch {
    dependsOn(windyInputPatch)
    execute {
        val directory = get("assets/public/v")
        val candidates = directory.listFiles().orEmpty().filter { it.isDirectory }
            .map { it.resolve("mobile.js") }.filter { it.isFile }
        require(candidates.size == 1) { "Missing or ambiguous Windy JavaScript bundle" }
        val file = candidates.single()
        val original = file.readBytes()
        requireWindyAsset(file.relativeTo(directory).invariantSeparatorsPath, original)
        val replacement = patchWindyJavaScript(original)
        // No file write until every original site and input guard has passed.
        file.writeBytes(replacement)
    }
}

val windyLocalFeaturesPatch = bytecodePatch(
    name = "Windy local premium features",
    description = "Enable Premium features and home-screen widgets in Windy. This does not add a paid subscription to your account; some weather data may still require one.",
    default = true
) {
    compatibleWith(target)
    availability { installer, _ -> if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.ENABLED }
    dependsOn(windyInputPatch, windyResources)
    execute {
        val owner = mutableClassDefBy(WINDY_WIDGET_OWNER)
        val original = owner.methods.single { it.name == "b" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        val replacement = MutableMethod(original)
        enableWindyWidgetPredicate(replacement)
        require(owner.methods.remove(original))
        require(owner.methods.add(replacement))
    }
}
