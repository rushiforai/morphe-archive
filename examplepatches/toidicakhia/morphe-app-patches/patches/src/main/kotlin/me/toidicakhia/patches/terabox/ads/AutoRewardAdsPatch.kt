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
 * The ad is not faked: it plays, the SDK grants the reward through
 * `OnRewardShowListener.___` and only then the extension finishes the ad
 * activity, which would otherwise wait for the user to dismiss the end card.
 */
@Suppress("unused")
val autoRewardAdsPatch = bytecodePatch(
    name = "Auto reward ads",
    description = "Lets rewarded videos play normally and closes the ad right after the reward is " +
        "earned, so ad completion stays server-valid while the end card does not need to be " +
        "dismissed by hand. Only the ad activity that is on top is finished. The full-screen " +
        "native ad the app shows afterwards is dismissed too, otherwise the Benefits page never " +
        "receives its reward callback.",
    default = true
) {
    compatibleWith(Constants.TERABOX_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // `___()` is the "user earned reward" callback. The activity is resolved
        // *before* the callback is forwarded: the Benefits listener starts an
        // extra native-ad activity from that callback, which would otherwise be
        // the top activity. The extension keeps a reference to the ad activity
        // and finishes it after a short delay, so the app's own reward handling
        // (privilege unlock, H5 `isSuccess` callback) still runs first.
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
