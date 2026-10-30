package app.fakh.patches.smartlife

import app.fakh.patches.shared.gms.gmsCoreSupportResourcePatch
import app.fakh.patches.shared.gms.redirectToGmsCore
import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_BARDI
import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_SMARTLIFE
import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_TUYA_SMART
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** SHA-1 of each app's signing certificate, which GmsCore presents to Google in place of the patched app's. */
private val SIGNATURES = mapOf(
    "com.tuya.smartlife" to "94dbfb934543ca1477b440add47566d757fd25ef",
    "com.tuya.smart" to "7ef97f90295755b6bde1566394a3f64b00b72324",
    "com.bardi.smart.home" to "980bfb73de90519784a20630720d4716ae90884a",
)

/**
 * androidx.credentials' CredentialProviderFrameworkImpl.isAvailableOnDevice (Android 14+): the Android Credential
 * Manager routes the Google sign-in to Google's own Play services, which a GmsCore redirect cannot reach. R8 renames
 * the class, so it is found as the no-argument `isAvailableOnDevice` that compares the SDK level with 34.
 */
private object FrameworkCredentialProviderFingerprint : Fingerprint(
    name = "isAvailableOnDevice",
    returnType = "Z",
    parameters = emptyList(),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it.opcode == Opcode.CONST_16 && (it as NarrowLiteralInstruction).narrowLiteral == 34
        } == true &&
            method.implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name == "SDK_INT"
            } == true
    },
)

@Suppress("unused")
val gmsCoreSupportPatch = bytecodePatch(
    name = "GmsCore support",
    description = "Makes \"Sign in with Google\" work. Signs in through microG RE (GmsCore) instead of Google " +
        "Play services, so it needs microG RE installed and signed in to a Google account.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE, COMPATIBILITY_TUYA_SMART, COMPATIBILITY_BARDI)
    category("Feature")
    dependsOn(signatureSpoofPatch, gmsCoreSupportResourcePatch(SIGNATURES))

    execute {
        redirectToGmsCore()

        // Without the framework provider, Credential Manager falls back to its Play services one, which
        // redirectToGmsCore already points at GmsCore.
        FrameworkCredentialProviderFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
