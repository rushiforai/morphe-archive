package app.abeja.patches.ztevideoplayer.fixpermissions

import app.abeja.patches.shared.Constants.ZTE_VIDEO_PLAYER
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val MANAGE_EXTERNAL_STORAGE = "android.permission.MANAGE_EXTERNAL_STORAGE"

/**
 * ACCESS_NETWORK_STATE is a normal permission that is granted at install time, so it can be
 * used as a placeholder for MANAGE_EXTERNAL_STORAGE, which cannot be granted on this firmware.
 */
private const val ACCESS_NETWORK_STATE = "android.permission.ACCESS_NETWORK_STATE"

/**
 * Replaces the MANAGE_EXTERNAL_STORAGE permission string with an always-granted normal
 * permission while keeping the register used by the original instruction.
 */
private fun MutableMethod.replaceManageExternalStorage() {
    var replaced = false

    instructions.forEachIndexed { index, instruction ->
        if (instruction.opcode != Opcode.CONST_STRING) return@forEachIndexed

        val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference
            ?: return@forEachIndexed
        if (reference.string != MANAGE_EXTERNAL_STORAGE) return@forEachIndexed

        val register = (instruction as? OneRegisterInstruction)?.registerA
            ?: throw PatchException("Could not read the register of the permission string")

        replaceInstruction(index, "const-string v$register, \"$ACCESS_NETWORK_STATE\"")
        replaced = true
    }

    if (!replaced) {
        throw PatchException("Could not find $MANAGE_EXTERNAL_STORAGE")
    }
}

@Suppress("unused")
val FixPermissionsPatch = bytecodePatch(
    name = "Fix storage permission",
    description = "Patch to fix the storage permission.",
    default = true
) {
    compatibleWith(ZTE_VIDEO_PLAYER)

    extendWith("extensions/extension.mpe")

    execute {
        // MANAGE_EXTERNAL_STORAGE can never be granted on this firmware, so every permission
        // check that includes it always fails and blocks the video browser and player.
        // Replacing it with an always-granted normal permission keeps the check meaningful for
        // READ_MEDIA_* while removing the ungrantable entry.
        PermissionUtilInitFingerprint.method.replaceManageExternalStorage()
        PermissionUtilCheckPermissionFingerprint.method.replaceManageExternalStorage()
    }
}
