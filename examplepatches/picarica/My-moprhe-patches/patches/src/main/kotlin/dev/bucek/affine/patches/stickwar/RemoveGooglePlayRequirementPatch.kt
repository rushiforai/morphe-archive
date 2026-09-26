package dev.bucek.affine.patches.stickwar

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.bucek.affine.patches.shared.Constants.COMPATIBILITY_STICK_WAR
import dev.bucek.affine.patches.shared.Constants.STICK_WAR_VERSION_CODE

private const val PAIRIP_SIGNATURE_CHECK = "Lcom/pairip/SignatureCheck;->verifyIntegrity"
private const val PAIRIP_LICENSE_CHECK = "Lcom/pairip/licensecheck/LicenseClient;->checkLicense"
private const val PAIRIP_VM_INVOKE = "Lcom/pairip/VMRunner;->invoke"

private val removePlayLicenseManifestEntriesPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_STICK_WAR)

    execute {
        val metadata = packageMetadata
        if (metadata.versionCode != STICK_WAR_VERSION_CODE.toString()) {
            throw PatchException(
                "Expected Stick War: Legacy version code $STICK_WAR_VERSION_CODE, found ${metadata.versionCode}",
            )
        }

        document("AndroidManifest.xml").use { ManifestTransformer.transform(it) }
    }
}

@Suppress("unused")
val removeGooglePlayRequirementPatch = bytecodePatch(
    name = "Remove Google Play requirement",
    description = "Disables Stick War: Legacy's mandatory PairIP startup, signature, and Google Play license " +
        "gates while preserving its instrumented runtime, Unity asset packs, and optional integrations.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STICK_WAR)
    dependsOn(removePlayLicenseManifestEntriesPatch)

    execute {
        // PairIP injects calls to this launcher into static initializers for both its
        // Application wrapper and AndroidX's AppComponentFactory. Those initializers
        // run before attachBaseContext(), so neutralizing only the checks below still
        // leaves the encrypted anti-tamper startup program in the app's launch path.
        // Keep VMRunner itself for the small number of later instrumented callbacks,
        // but prevent this mandatory pre-context program from executing.
        PairIpStartupLauncherFingerprint.method.apply {
            uniqueMethodCallIndex(PAIRIP_VM_INVOKE)
            addInstruction(0, "return-void")
        }

        PairIpApplicationAttachFingerprint.method.apply {
            val signatureCheckIndex = uniqueMethodCallIndex(PAIRIP_SIGNATURE_CHECK)
            val licenseCheckIndex = uniqueMethodCallIndex(PAIRIP_LICENSE_CHECK)
            val setContextIndex = uniqueMethodCallIndex("Lcom/pairip/VMRunner;->setContext")

            if (!(setContextIndex < signatureCheckIndex && signatureCheckIndex < licenseCheckIndex)) {
                throw PatchException("Unexpected PairIP application startup order")
            }

            // Keep VMRunner.setContext() and the wrapper itself: this release has PairIP-instrumented
            // Java code which still depends on libpairipcore.so. The mandatory startup, signature,
            // and Play licensing launch gates are neutralized.
            replaceInstruction(signatureCheckIndex, "nop")
            replaceInstruction(licenseCheckIndex, "nop")
        }
    }
}

private fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.uniqueMethodCallIndex(
    descriptorPrefix: String,
): Int {
    val matches = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        index.takeIf { reference?.toString()?.startsWith(descriptorPrefix) == true }
    }
    if (matches.size != 1) {
        throw PatchException("Expected one call to $descriptorPrefix, found ${matches.size}")
    }
    return matches.single()
}