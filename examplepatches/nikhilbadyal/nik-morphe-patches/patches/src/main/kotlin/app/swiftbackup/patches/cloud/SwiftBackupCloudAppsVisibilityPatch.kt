package app.swiftbackup.patches.cloud

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.swiftbackup.patches.shared.Constants.COMPATIBILITY_SWIFTBACKUP
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Swift Backup filters cloud-synced apps against local blacklist ("Hide") and system-app
 * visibility rules in ua1.q. If a backed-up app is blacklisted or a system app when
 * show_system_apps is disabled, ua1.q drops it. This causes the Cloud Sync screen to show
 * "Apps (N)" on the tag summary card but "0 apps / No backups synced in cloud" when opened.
 *
 * This patch bypasses the blacklist/system filter in ua1.q so that all apps with valid
 * cloud backups under the tag are visible and restorable from the Cloud Synced Apps list,
 * while leaving local app filtering (kz4) completely intact.
 */
@Suppress("unused")
val swiftBackupCloudAppsVisibilityPatch = bytecodePatch(
    name = "Swift Backup Cloud Apps Visibility",
    description = "Displays all backups present in the cloud tag without dropping blacklisted or system apps.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SWIFTBACKUP)

    execute {
        val method = CloudAppsFilterFingerprint.method

        // Find the invoke-static call to g00.A(g00, packageName)
        val invokeIndex = method.indexOfFirstInstructionOrThrow {
            opcode == Opcode.INVOKE_STATIC
        }

        // The move-result follows invoke-static, capturing the boolean filter outcome
        val moveResultIndex = invokeIndex + 1
        val moveResult = method.getInstruction<OneRegisterInstruction>(moveResultIndex)
        val resultRegister = moveResult.registerA

        // Locate where ji.Companion.fromCloudBackups returned the app model.
        val fromCloudBackupsIndex = method.indexOfFirstInstructionOrThrow {
            opcode == Opcode.INVOKE_VIRTUAL && (this as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                ?.reference?.let { (it as? MethodReference)?.name == "fromCloudBackups" } == true
        }

        // Replace g00.A and the intermediate getter setup with NOPs to avoid executing
        // unnecessary checks, then force the boolean filter register to 1 (true) so the
        // method always returns the deserialized ji model.
        val setupStartIndex = fromCloudBackupsIndex + 2
        for (i in setupStartIndex..invokeIndex) {
            method.replaceInstruction(i, "nop")
        }
        method.replaceInstruction(moveResultIndex, "const/4 v$resultRegister, 0x1")

        println("SwiftBackup: Cloud apps visibility filter bypassed (all cloud-synced backups remain visible)")
    }
}
