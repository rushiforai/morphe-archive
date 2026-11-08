package app.template.patches.picsart

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Original (Play) signing-certificate MD5 of Picsart 30.9.5. It is the same value
 * stored in the EXIF Make field of assets/bg_texture.jpg (Model holds a second hash).
 * If a future version stops working, re-read both EXIF values and the cert MD5.
 */
private const val ORIGINAL_SIGNATURE_MD5 = "62a1b22cd095777b9ae08a1250c2764d"

@Suppress("unused")
val picsartBypassSignatureCheckPatch = bytecodePatch(
    name = "Bypass signature check",
    description = "Prevents the app from closing automatically after being patched.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PICSART)

    execute {
        val helperClass = mutableClassDefBy(AppSignatureHashHelperFingerprint.classDef)

        // static String a(Context): returns the MD5 of the installed signing cert.
        val getter = helperClass.methods.first { method ->
            method.returnType == "Ljava/lang/String;" &&
                method.parameterTypes.map { it.toString() } == listOf("Landroid/content/Context;")
        }

        getter.addInstructions(
            0,
            """
                const-string v0, "$ORIGINAL_SIGNATURE_MD5"
                return-object v0
            """
        )
    }
}
