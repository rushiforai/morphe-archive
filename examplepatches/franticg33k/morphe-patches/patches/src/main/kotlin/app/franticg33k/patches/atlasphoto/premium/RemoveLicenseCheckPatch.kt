package app.franticg33k.patches.atlasphoto.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.franticg33k.patches.atlasphoto.shared.Constants.COMPATIBILITY_ATLASPHOTO

@Suppress("unused")
val removeAtlasPhotoLicenseCheckPatch = bytecodePatch(
    name = "Remove License Check",
    description = "Bypasses the PairIP Google Play Licensing check so Atlas Photo runs " +
        "without a valid Play Store license.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ATLASPHOTO)

    execute {
        PairipCheckLicenseFingerprint.method.addInstructions(0, "return-void")
    }
}
