package app.morphe.patches.picsart

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Play signing-certificate MD5 stored in the EXIF Make field of assets/bg_texture.jpg.
 * Picsart compares this against the installed cert's MD5; on mismatch it kills the
 * process after a random 0-15 s delay (System.exit(15)).
 *
 * Version history:
 *   30.9.5 → 62a1b22cd095777b9ae08a1250c2764d
 *   31.2.6 → d4c1d0054754dbbe68fa529bbadeeac1  ← current
 *
 * To update for a new version: open APK as ZIP → assets/bg_texture.jpg → read EXIF "Make".
 */
private const val ORIGINAL_SIGNATURE_MD5 = "d4c1d0054754dbbe68fa529bbadeeac1"

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
