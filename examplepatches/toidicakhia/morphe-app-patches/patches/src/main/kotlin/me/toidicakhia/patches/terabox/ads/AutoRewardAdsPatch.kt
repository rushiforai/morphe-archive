/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package me.toidicakhia.patches.terabox.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.matchSingle
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import me.toidicakhia.patches.shared.Constants

private const val REWARD_SHOW_LISTENER =
    "Lcom/mars/united/international/ads/adsource/reward/OnRewardShowListener;"

private const val AD_CLOSER = "Lme/toidicakhia/extension/terabox/TeraboxAdCloser;"

/**
 * The ad plays normally and the SDK grants the reward through
 * `OnRewardShowListener.___`; the extension is notified first so it can close
 * the ad activity (and the native ad that follows) once the reward is given.
 */
@Suppress("unused")
val autoRewardAdsPatch = bytecodePatch(
    name = "Auto reward ads",
    description = "Closes a rewarded video as soon as the reward is granted, plus the native ad " +
        "that follows, so completion stays server-valid and the Benefits page gets its callback.",
    default = true
) {
    compatibleWith(Constants.TERABOX_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // `___()` is "user earned reward". `close()` records the reward and
        // schedules the cleanup; the callback itself still runs, so the app
        // unlocks the privilege and answers the H5 before the ad disappears.
        val method = RewardEarnedFingerprint.matchSingle().method
        val callbackIndex = method.indexOfFirstInstructionOrThrow {
            opcode == Opcode.INVOKE_INTERFACE &&
                getReference<MethodReference>()?.let { reference ->
                    reference.definingClass == REWARD_SHOW_LISTENER && reference.name == "___"
                } == true
        }

        method.addInstruction(
            callbackIndex,
            "invoke-static {}, $AD_CLOSER->close()V"
        )
    }
}
