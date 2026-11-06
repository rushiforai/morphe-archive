/*
 * Based on the GmsCore support patch of Morphe Patches, changed for Pepper.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.template.patches.pepper.gms

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_PEPPER
import app.template.patches.shared.Constants.COMPATIBILITY_PEPPER_LEGACY
import app.template.patches.shared.gms.gmsCoreSupportResourcePatch
import app.template.patches.shared.gms.useGmsCore
import app.template.patches.shared.requireExtensionMethods
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * SHA-1 of the certificate the original app is signed with.
 */
private const val ORIGINAL_SIGNATURE = "e72704b9a996f089948d827f1b826d109d7590d6"

private const val ANDROID_13_SDK_INT = 33

private const val EXTENSION_CLASS = "Lapp/template/extension/pepper/GmsCoreSupportPatch;"

@Suppress("unused")
val gmsCoreSupportPatch = bytecodePatch(
    name = "GmsCore support",
    description = "Allows signing in with Google by using MicroG-RE instead of Google Play services.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PEPPER)
    compatibleWith(COMPATIBILITY_PEPPER_LEGACY)

    dependsOn(gmsCoreSupportResourcePatch(COMPATIBILITY_PEPPER.packageName!!, ORIGINAL_SIGNATURE))
    dependsOn(gmsCoreSupportResourcePatch(COMPATIBILITY_PEPPER_LEGACY.packageName!!, ORIGINAL_SIGNATURE))

    extendWith("extensions/extension.mpe")

    execute {
        requireExtensionMethods(EXTENSION_CLASS, "checkGmsCore")

        useGmsCore()

        // Report the provider of the Android framework as unavailable, so Credential Manager
        // signs in with Google through its Google Play services provider, which GmsCore handles.
        FrameworkCredentialProviderAvailabilityFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // Read the response of GmsCore in the format of Android 13, which it answers with.
        HandleGetCredentialResponseFingerprint.let {
            val sdkIntIndex = it.instructionMatches.first().index
            val register = it.method.getInstruction<OneRegisterInstruction>(sdkIntIndex).registerA

            it.method.replaceInstruction(sdkIntIndex, "const/16 v$register, $ANDROID_13_SDK_INT")
        }

        // Ask to install GmsCore if it is missing.
        MainActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->checkGmsCore(Landroid/app/Activity;)V"
        )
    }
}
