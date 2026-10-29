/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.apppatches.patches.terabox.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.smali.ExternalLabel
import app.apppatches.patches.shared.Constants
import app.apppatches.patches.terabox.misc.fix.signature.spoofSignaturePatch

private const val BENEFITS_STATE_CLASS = "Lapp/apppatches/extension/terabox/TeraboxBenefitsState;"

private const val PRIVILEGE_AD_FREE = 4

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Blocks feed, banner, interstitial, app-open and video player ads on every page " +
        "except Benefits, where rewarded ads stay available.",
) {
    compatibleWith(Constants.TERABOX_COMPATIBILITY)
    dependsOn(spoofSignaturePatch)

    execute {
        AdSdkInitFingerprint.matchSingle().method.apply {
            val register = getFreeRegisterProvider(0, 1).getFreeRegister4Bit()

            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $BENEFITS_STATE_CLASS->isActive()Z
                    move-result v$register
                    if-nez v$register, :run
                    return-void
                """,
                ExternalLabel("run", getInstruction(0)),
            )
        }

        BenefitsResumeFingerprint.matchSingle().method.addInstructions(
            0,
            "invoke-static { p0 }, $BENEFITS_STATE_CLASS->onResume(Landroid/app/Activity;)V",
        )

        BenefitsDestroyFingerprint.matchSingle().method.addInstructions(
            0,
            "invoke-static { p0 }, $BENEFITS_STATE_CLASS->onDestroy(Landroid/app/Activity;)V",
        )

        ToggleAdsFingerprint.matchSingle().method.apply {
            val register = getFreeRegisterProvider(0, 1).getFreeRegister4Bit()

            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $BENEFITS_STATE_CLASS->isActive()Z
                    move-result v$register
                    if-eqz v$register, :check
                    const/4 p1, 0x1
                """,
                ExternalLabel("check", getInstruction(0)),
            )
        }

        HasPrivilegeFingerprint.matchSingle().method.apply {
            val register = getFreeRegisterProvider(0, 1).getFreeRegister4Bit()

            addInstructionsWithLabels(
                0,
                """
                    const/4 v$register, $PRIVILEGE_AD_FREE
                    if-ne p0, v$register, :check
                    invoke-static { }, $BENEFITS_STATE_CLASS->isActive()Z
                    move-result v$register
                    xor-int/lit8 v$register, v$register, 0x1
                    return v$register
                """,
                ExternalLabel("check", getInstruction(0)),
            )
        }
    }
}
