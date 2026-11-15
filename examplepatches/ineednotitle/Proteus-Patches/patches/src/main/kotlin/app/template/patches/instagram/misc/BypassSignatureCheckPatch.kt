/*
 * Adapted from https://github.com/brosssh/instagram-morphe-patches-library
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY
import app.template.patches.shared.getReference
import app.template.patches.shared.indexOfFirstInstruction
import app.template.patches.shared.returnEarly
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private object TrustedProviderClassFingerprint : Fingerprint(
    strings = listOf("The provider for uri '", "' is not trusted: "),
)

private object IsValidSignatureMethodFingerprint : Fingerprint(
    classFingerprint = TrustedProviderClassFingerprint,
    parameters = listOf("L", "Z"),
    returnType = "Z",
    custom = { method, _ ->
        method.indexOfFirstInstruction {
            getReference<MethodReference>()?.name == "keySet"
        } >= 0
    },
)

@Suppress("unused")
val instagramBypassSignatureCheckPatch = bytecodePatch(
    name = "Bypass signature check",
    description = "Bypasses Instagram's internal provider signature verification after patching.",
    default = true,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)

    execute {
        IsValidSignatureMethodFingerprint.method.returnEarly(true)
    }
}
