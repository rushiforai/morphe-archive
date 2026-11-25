package dev.jason.gboardpatches.patches.gboard

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.signaturebypass.gboardSignatureBypassBytecodePatch

/**
 * Gboard checks the APK signer against a built-in whitelist before several features
 * (themes among them) will run, and throws
 * "APK is signed by unrecognized certificates" otherwise. A patched, re-signed APK is
 * never on that list, so this makes the check pass.
 */
@Suppress("unused")
val gboardSignatureBypassPatch = resourcePatch(
    name = "Add Gboard Signature Bypass",
    description = "Bypass Gboard's own APK signature whitelist so a patched, re-signed " +
        "Gboard can use features that verify the signer, such as themes.",
    default = true,
) {
    compatibleWith(gboard)

    dependsOn(gboardSignatureBypassBytecodePatch)
}
