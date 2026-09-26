/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.permission

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val MAP_PREF = "Lapp/morphe/ather/MapPref;"

/** Compose slot table key of the permission dialog. Appears once in `d.smali`. */
private const val DIALOG_SLOT_KEY = 0x357e090aL // keywatch:ignore

/** Closes the Compose group that the permission dialog opens. */
private const val DIALOG_GROUP_END = "Landroidx/compose/runtime/i0;->Y()V"

private const val CHECK_SELF_PERMISSION = "checkSelfPermission"

private const val READ_CONTACTS = "android.permission.READ_CONTACTS"
private const val SEND_SMS = "android.permission.SEND_SMS"

/**
 * Matches the composable that shows the permission request dialog.
 *
 * ```
 * public static final f(List, a, k, l, int)
 * ```
 *
 * The composable takes the list of permissions to request and walks it to build one row
 * per permission. It is the only place that renders a permission dialog, so filtering the
 * list here covers every request the app makes.
 *
 * The names are obfuscated in 13.5.0, so the fingerprint pins the defining class, the
 * signature and the slot key the composable opens its Compose group with.
 */
internal object PermissionDialogFingerprint : Fingerprint(
    definingClass = "Lcom/ather/designsystem/components/utils/d;",
    name = "f",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Ljava/util/List;",
        "Lkotlin/jvm/functions/a;",
        "Lkotlin/jvm/functions/k;",
        "Landroidx/compose/runtime/l;",
        "I",
    ),
)

/**
 * Matches the probe that decides whether the scooter capabilities are usable.
 *
 * ```
 * public final a(): boolean
 * ```
 *
 * The probe returns true only when contacts, Nearby device, call and SMS access are all
 * granted. It gates the optional dashboard features that read caller names and send canned
 * replies.
 */
internal object PairingCapabilityFingerprint : Fingerprint(
    definingClass = "Lcom/ather/btcore/utils/e;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf(READ_CONTACTS),
)

/**
 * Drops permissions the scooter does not need from the request list.
 *
 * Ather asks for phone location, call log, contacts and SMS to back optional dashboard
 * features. The scooter carries its own location, and the other features only mirror the
 * phone's call and message state onto the dashboard. Every request goes through one
 * composable, so the patch filters the list there and skips the dialog when nothing is
 * left to ask for. Nothing is faked: the app never requests the permissions, and the
 * features that need them stay switched off.
 *
 * The pairing probe is patched to match, so pairing a scooter no longer waits for contact
 * and SMS access.
 *
 * Equivalent smali (verified against 13.5.0, versionCode 321):
 * ```
 * invoke-static {v1}, Lapp/morphe/ather/MapPref;->dropLocationRequests(Ljava/util/List;)Ljava/util/List;
 * move-result-object v1
 * invoke-interface {v1}, Ljava/util/List;->isEmpty()Z
 * move-result v0
 * if-nez v0, :cond_35
 * ```
 *
 * The jump targets the epilogue of the composable, which reloads the composer and closes
 * the Compose group before returning. Returning straight from the method would leave the
 * slot table open and crash the next recomposition.
 */
@Suppress("unused")
val permissionFilterPatch = bytecodePatch(
    name = "Permission filter",
    description = "Drops phone location, call log, contact and SMS permissions from the " +
        "request list, so the app asks only for the permissions its features use.",
) {
    compatibleWith("com.athermobileapp")

    extendWith("extensions/ather.mpe")

    execute {
        PermissionDialogFingerprint.method.apply {
            val body = implementation ?: throw IllegalStateException(
                "Permission dialog has no body to patch.",
            )

            val slotKeyIndex = body.instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.CONST &&
                    (instruction as? WideLiteralInstruction)?.wideLiteral == DIALOG_SLOT_KEY
            }
            if (slotKeyIndex < 0) {
                throw IllegalStateException("Permission dialog slot key was not found.")
            }

            val groupEndIndex = body.instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    (instruction as? ReferenceInstruction)?.reference?.toString() == DIALOG_GROUP_END
            }
            if (groupEndIndex < 0) {
                throw IllegalStateException("Permission dialog group end was not found.")
            }

            addInstructionsWithLabels(
                // After the slot key and its `g0(key)` call, before the dialog body.
                slotKeyIndex + 2,
                """
                    invoke-static {v1}, $MAP_PREF->dropLocationRequests(Ljava/util/List;)Ljava/util/List;
                    move-result-object v1
                    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z
                    move-result v0
                    if-nez v0, :skip_dialog
                """.trimIndent(),
                // Reloads the composer, then closes the Compose group.
                ExternalLabel("skip_dialog", getInstruction(groupEndIndex - 1)),
            )
        }

        PairingCapabilityFingerprint.method.apply {
            removePermissionCheck(READ_CONTACTS)
            removePermissionCheck(SEND_SMS)
        }
    }
}

/**
 * Removes the `checkSelfPermission` guard for [permission] from this method.
 *
 * The compiler emits a guard as four instructions:
 * ```
 * const-string vX, "android.permission.NAME"
 * invoke-virtual {vY, vX}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I
 * move-result vX
 * if-nez vX, :label
 * ```
 *
 * The `iget-object` that loads the context can sit between the `const-string` and the
 * call, so the lookup scans forward for the call instead of assuming a fixed offset.
 */
private fun MutableMethod.removePermissionCheck(permission: String) {
    val body = implementation ?: throw IllegalStateException(
        "Permission check for $permission has no body to patch.",
    )
    val instructions = body.instructions

    val stringIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.CONST_STRING &&
            (instruction as? ReferenceInstruction)?.reference
                ?.let { (it as? StringReference)?.string } == permission
    }
    if (stringIndex < 0) {
        throw IllegalStateException("Permission check for $permission was not found.")
    }

    val callIndex = (stringIndex + 1..stringIndex + 3).firstOrNull { index ->
        val instruction = instructions.elementAtOrNull(index)
        instruction?.opcode == Opcode.INVOKE_VIRTUAL &&
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                ?.name == CHECK_SELF_PERMISSION
    }
    if (callIndex == null) {
        throw IllegalStateException("Permission check for $permission does not call checkSelfPermission.")
    }

    if (instructions.elementAtOrNull(callIndex + 1)?.opcode != Opcode.MOVE_RESULT ||
        instructions.elementAtOrNull(callIndex + 2)?.opcode != Opcode.IF_NEZ
    ) {
        throw IllegalStateException("Permission check for $permission does not end in move-result / if-nez.")
    }

    // Remove the tail first so the index of the `const-string` stays valid.
    removeInstructions(callIndex, 3)
    removeInstruction(stringIndex)
}
