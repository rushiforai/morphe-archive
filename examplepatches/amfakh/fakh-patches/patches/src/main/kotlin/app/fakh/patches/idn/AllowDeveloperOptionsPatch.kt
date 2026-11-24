/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.idn

import app.fakh.patches.idn.shared.Constants.COMPATIBILITY_IDN
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/** The device security check (DeviceSecurityChecker): reports root and Developer options; the short movie player blocks playback on either. */
private object DeviceSecurityCheckFingerprint : Fingerprint(
    parameters = listOf("Z"),
    strings = listOf("development_settings_enabled", "su"),
)

@Suppress("unused")
val allowDeveloperOptionsPatch = patch(
    name = "Allow Developer options",
    description = "Lets short movies play while Developer options are turned on, instead of asking to turn them off.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Feature")

    execute {
        DeviceSecurityCheckFingerprint.method.apply {
            val getInt = instructions.indexOfFirst {
                (it as? ReferenceInstruction)?.reference?.toString() ==
                    "Landroid/provider/Settings\$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I"
            }
            if (getInt < 0) throw PatchException("IDN: the Developer options read was not found.")
            val register = (instructions[getInt + 1] as OneRegisterInstruction).registerA
            // Read the setting as off; the root check next to it is left as is.
            addInstruction(getInt + 2, "const v$register, 0x0")
        }
    }
}
