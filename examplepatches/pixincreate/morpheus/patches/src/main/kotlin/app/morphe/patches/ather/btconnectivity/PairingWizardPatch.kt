/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.btconnectivity

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val PERMISSION_TYPE = "Lcom/ather/btconnectivity/ui/permission/u0;"
private const val PERMISSION_TYPE_ARRAY = "[$PERMISSION_TYPE"

/**
 * Matches the constructor that builds the pairing wizard's permission list.
 *
 * ```
 * public z0(Application, SessionManager, e, l)
 * ```
 *
 * The constructor builds a five-element `u0[]` with `filled-new-array`:
 * call logs, manage calls, contacts, SMS and Nearby device. The wizard then walks
 * that array and asks for each entry.
 *
 * Both names are obfuscated in 13.5.0, so the fingerprint pins the defining class and
 * the array type the constructor fills.
 */
internal object PairingWizardPermissionFingerprint : Fingerprint(
    definingClass = "Lcom/ather/btconnectivity/ui/permission/z0;",
    name = "<init>",
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction.opcode == Opcode.FILLED_NEW_ARRAY &&
                (instruction as? ReferenceInstruction)?.reference?.toString() == PERMISSION_TYPE_ARRAY
        } == true
    },
)

/**
 * Narrows the pairing wizard to the permission it actually needs.
 *
 * The wizard asks for call logs, manage calls, contacts, SMS and Nearby device in one
 * pass. Only Nearby device access is required to pair a scooter; the rest back optional
 * dashboard features. The build shrinks the array to the Nearby device entry, so the
 * wizard stops asking for permissions that have no use on a de-Googled or work phone.
 * Nothing is faked: the app simply never requests the other permissions.
 *
 * Equivalent smali (verified against 13.5.0, versionCode 321):
 * ```
 * filled-new-array {v1}, [Lcom/ather/btconnectivity/ui/permission/u0;
 * ```
 *
 * `v1` holds the Nearby device entry (`PermissionType.NEARBY_DEVICE`).
 */
@Suppress("unused")
val pairingWizardPatch = bytecodePatch(
    name = "Pairing wizard",
    description = "Makes the setup wizard ask only for Nearby device access, so scooter " +
        "pairing completes without call log, contact or SMS permissions.",
) {
    compatibleWith("com.athermobileapp")

    execute {
        PairingWizardPermissionFingerprint.method.apply {
            val body = implementation ?: throw IllegalStateException(
                "Pairing wizard permission list has no body to patch.",
            )

            val index = body.instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.FILLED_NEW_ARRAY &&
                    (instruction as? ReferenceInstruction)?.reference?.toString() == PERMISSION_TYPE_ARRAY
            }
            if (index < 0) {
                throw IllegalStateException("Pairing wizard permission array was not found.")
            }

            replaceInstruction(index, "filled-new-array {v1}, $PERMISSION_TYPE_ARRAY")
        }
    }
}
