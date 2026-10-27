package app.pigfoot.patches.fing

import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

private val fingTarget = Compatibility(packageName = FING_PACKAGE, name = "Fing", apkFileType = ApkFileType.APKM,
    targets = listOf(AppTarget(FING_VERSION, versionCodes = mapOf(
        SupportedAbi.ARM64_V8A to FING_CODE, SupportedAbi.ARMEABI_V7A to FING_CODE
        ), minSdk = 28)))

internal val fingInputPatch = bytecodePatch {
    execute {
        require(packageMetadata.packageName == FING_PACKAGE) { "Unsupported Fing package" }
        requireFingVersion(packageMetadata.versionName, packageMetadata.versionCode)
        require(classDefByOrNull("Lcom/PinkiePie;") == null) { "Unsupported modified Fing input" }
        for ((type, expected) in fingClassPins) {
            val definition = requireNotNull(classDefByOrNull(type)) { "Missing qualified Fing class: $type" }
            require(fingClassHash(definition) == expected) { "Unsupported or already modified Fing class: $type" }
        }
    }
}

private fun BytecodePatchContext.applyPolicy(policies: List<FingMethodPolicy>) {
    val replacements = policies.map { policy ->
        val type = mutableClassDefBy(policy.owner)
        val method = type.methods.single { it.name == policy.name && it.fingDescriptor() == policy.descriptor }
        Triple(type, method, MutableMethod(fingMethodReplacement(method, policy)))
    }
    // Shape-check all selected entries before altering any method.
    for ((type, method, replacement) in replacements) {
        require(type.methods.remove(method))
        require(type.methods.add(replacement))
    }
}

val fingLocalPremiumPatch = bytecodePatch(
    name = "Fing local premium features",
    description = "Change qualified local tier, feature-entry and purchase-status gates while preserving service readiness. Does not create purchases, account entitlements, cloud grants or server authorization. Device functionality still requires verification.",
    default = true
) {
    compatibleWith(fingTarget)
    availability { installer, _ -> if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.ENABLED }
    dependsOn(fingInputPatch)
    execute { applyPolicy(fingPremiumPolicy) }
}

private val fingTelemetryResources = resourcePatch {
    dependsOn(fingInputPatch)
    execute { document("AndroidManifest.xml").use { applyFingManifestPolicy(it) } }
}

val fingTelemetryPatch = bytecodePatch(
    name = "Fing reduce telemetry",
    description = "Disable qualified Google Analytics and automatic Crashlytics collection, opt out of ad identifiers/app-event collection and remove reviewed analytics components. Preserve push, login, Billing and network discovery. Show Crash reporting off and disable its switch while selected. Not a zero-telemetry guarantee.",
    default = true
) {
    compatibleWith(fingTarget)
    availability { installer, _ -> if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.ENABLED }
    dependsOn(fingInputPatch, fingTelemetryResources)
    execute {
        val activity = mutableClassDefBy(FING_PRIVACY_ACTIVITY)
        val onCreate = activity.methods.single { it.name == "onCreate" && it.fingDescriptor() == "(Landroid/os/Bundle;)V" }
        applyFingCrashSwitchPolicy(onCreate)
        applyPolicy(fingTelemetryPolicy)
    }
}
