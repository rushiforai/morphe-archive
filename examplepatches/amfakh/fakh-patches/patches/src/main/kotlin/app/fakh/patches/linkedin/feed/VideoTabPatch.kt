/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.linkedin.feed

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.Constants.VIDEO_TAB_AUTO_SCROLL
import app.fakh.patches.linkedin.shared.Constants.VIDEO_TAB_TIME
import app.fakh.patches.linkedin.shared.sduiComponentFilterPatch
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

/**
 * SimpleMediaPlayer.setPlayWhenReady(reason, playWhenReady, userInitiated). The Video tab prepares the next videos
 * ahead and plays only the one on screen, so the last player told to play is that video's.
 */
private object SetPlayWhenReadyFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/media/player/simpleplayer/SimpleMediaPlayer;",
    name = "setPlayWhenReady",
    returnType = "V",
    parameters = listOf("I", "Z", "Z"),
)

/** Tells the extension which player plays, which both the video time and the Video tab's auto-scroll follow. */
private val playerHookPatch = patch {
    // The tab's posts are remembered in the SDUI component hook, and its screen is seen by the SduiFragment hooks.
    dependsOn(sduiComponentFilterPatch)

    execute {
        // At method entry every local register is free; the p registers can be above v15.
        SetPlayWhenReadyFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                move/from16 v1, p2
                invoke-static { v0, v1 }, $EXTENSION_PACKAGE/VideoTab;->onPlayWhenReady(Ljava/lang/Object;Z)V
            """
        )
    }
}

@Suppress("unused")
val videoTimePatch = patch(
    name = "Show video time",
    description = "Shows the video's time above the seek bar, in the Video tab and the full screen video viewer.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Video & viewers")
    dependsOn(playerHookPatch)
    execute { register(VIDEO_TAB_TIME) }
}

@Suppress("unused")
val videoTabPatch = patch(
    name = "Auto-scroll videos",
    description = "Goes to the next video of the Video tab when one ends.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Video & viewers")
    dependsOn(playerHookPatch)
    execute { register(VIDEO_TAB_AUTO_SCROLL) }
}
