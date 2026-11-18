package app.gboardios.patches.signature

import app.gboardios.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `SignatureUtils.isSignedBy(Context, String)`: compares the SHA-256 digest of the signing
 * certificate of a package with Google's certificates. Gboard checks its own package with it
 * at startup and throws "APK is signed by unrecognized certificates" when it does not match,
 * which is always the case after patching.
 */
internal object SignatureCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    filters = listOf(
        methodCall(definingClass = "Ljava/util/Arrays;", name = "equals"),
    ),
)

/** Lets the re-signed APK pass Gboard's own signature check. Required by every other patch. */
internal val signatureCheckBypassPatch = patch(
    description = "Lets the re-signed Gboard pass its own signature check.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        SignatureCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
