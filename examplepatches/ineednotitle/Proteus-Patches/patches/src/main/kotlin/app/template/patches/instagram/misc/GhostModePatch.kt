/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * Adapted from https://github.com/crimera/piko (GPL-3.0).
 * See META-INF/PROTEUS-NOTICE.txt for GPLv3 §7(b) terms.
 */

package app.template.patches.instagram.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.instagram.shared.instagramBlockUrlBasePatch
import app.template.patches.instagram.shared.overrideInstagramMobileConfigBooleanFlag
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY
import app.template.patches.shared.getFreeRegisterProvider
import com.android.tools.smali.dexlib2.AccessFlags

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/template/extension/extension/InstagramGhostMode;"

/**
 * Sends the "thread seen" mutation. Matches piko's stable string anchor.
 */
private object DmSeenFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    strings = listOf("mark_thread_seen-"),
)

@Suppress("unused")
val instagramGhostModePatch = bytecodePatch(
    name = "Ghost mode",
    description = "Hides typing indicators, prevents DM read receipts, and best-effort blocks " +
        "story view receipts. Controlled at runtime from the Proteus settings button.",
    default = false,
) {
    dependsOn(
        instagramSettingsPatch,
        instagramBlockUrlBasePatch,
        // Direct typing indicators. Ghost Mode's runtime override turns these
        // back on when the master switch (or the typing sub-switch) is off.
        overrideInstagramMobileConfigBooleanFlag(override = "85450::68" to false),
        overrideInstagramMobileConfigBooleanFlag(override = "85450::69" to false),
        overrideInstagramMobileConfigBooleanFlag(override = "115516::0" to false),
        overrideInstagramMobileConfigBooleanFlag(override = "115516::1" to false),
        overrideInstagramMobileConfigBooleanFlag(override = "99511::0" to false),
    )

    compatibleWith(INSTAGRAM_COMPATIBILITY)

    execute {
        DmSeenFingerprint.method.apply {
            val register = getFreeRegisterProvider(0, 1).getFreeRegister()
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, $EXTENSION_CLASS_DESCRIPTOR->shouldHideDmSeen()Z
                    move-result v$register
                    if-eqz v$register, :proteus_continue
                    return-void
                """.trimIndent(),
                ExternalLabel("proteus_continue", getInstruction(0)),
            )
        }
    }
}
