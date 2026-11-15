/*
 * Ather Morphe patches.
 * Copyright 2026 pixincreate.
 * SPDX-License-Identifier: Apache-2.0
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
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val MAP_PREF = "Lapp/morphe/ather/MapPref;"

/** Package of the Compose runtime. R8 renames the composer class every release. */
private const val COMPOSE_RUNTIME = "Landroidx/compose/runtime/"

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
 * The names are obfuscated, so the fingerprint pins the defining class, the method name
 * and the shape of the parameter list. The composer type is deliberately left open: R8
 * renames it every release (`l` in 13.5.0, `h0` in 13.5.1).
 */
internal object PermissionDialogFingerprint : Fingerprint(
    definingClass = "Lcom/ather/designsystem/components/utils/d;",
    name = "f",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    custom = { method, _ ->
        val parameters = method.parameterTypes.map { it.toString() }
        parameters.size == 5 &&
            parameters[0] == "Ljava/util/List;" &&
            parameters[1] == "Lkotlin/jvm/functions/a;" &&
            parameters[2] == "Lkotlin/jvm/functions/k;" &&
            parameters[3].startsWith(COMPOSE_RUNTIME) &&
            parameters[4] == "I"
    },
)

/**
 * Matches the same composable in Ather 13.6.0, where it moved to `utils.f1`.
 *
 * ```
 * public static final c(List, a, l, compose.runtime.p, int): void
 * ```
 */
internal object PermissionDialog1360Fingerprint : Fingerprint(
    definingClass = "Lcom/ather/designsystem/components/utils/f1;",
    name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    custom = { method, _ ->
        val parameters = method.parameterTypes.map { it.toString() }
        parameters.size == 5 &&
            parameters[0] == "Ljava/util/List;" &&
            parameters[1] == "Lkotlin/jvm/functions/a;" &&
            parameters[2].startsWith("Lkotlin/jvm/functions/") &&
            parameters[3].startsWith(COMPOSE_RUNTIME) &&
            parameters[4] == "I"
    },
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
 * Equivalent smali (verified against 13.5.1, versionCode 324 and 13.6.0, versionCode 327),
 * inserted at index 0:
 * ```
 * move-object/from16 v0, p0
 * invoke-static {v0}, Lapp/morphe/ather/MapPref;->dropLocationRequests(Ljava/util/List;)Ljava/util/List;
 * move-result-object v0
 * move-object/from16 p0, v0
 * invoke-interface {v0}, Ljava/util/List;->isEmpty()Z
 * move-result v1
 * if-nez v1, :morphe_permissions
 * return-void
 * ```
 *
 * No Compose group has opened at index 0, so returning there is safe.
 * The filtered list is written back to the parameter register before the original body runs.
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
        val dialog = PermissionDialog1360Fingerprint.matchOrNull()
            ?: PermissionDialogFingerprint.matchOrNull()
            ?: throw IllegalStateException("Permission dialog was not found.")
        dialog.method.applyPermissionFilter()

        PairingCapabilityFingerprint.matchOrNull()?.method?.apply {
            removePermissionCheck(READ_CONTACTS)
            removePermissionCheck(SEND_SMS)
        }
    }
}

/**
 * Filters the permission list at the composable's entry and skips the dialog when nothing
 * is left. No Compose group has opened at index 0, so returning there is safe.
 */
private fun MutableMethod.applyPermissionFilter() {
    if (implementation == null) {
        throw IllegalStateException("Permission dialog has no body to patch.")
    }

    addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, p0
            invoke-static {v0}, $MAP_PREF->dropLocationRequests(Ljava/util/List;)Ljava/util/List;
            move-result-object v0
            move-object/from16 p0, v0
            invoke-interface {v0}, Ljava/util/List;->isEmpty()Z
            move-result v1
            if-nez v1, :morphe_permissions
            return-void
        """.trimIndent(),
        ExternalLabel("morphe_permissions", getInstruction(0)),
    )
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
