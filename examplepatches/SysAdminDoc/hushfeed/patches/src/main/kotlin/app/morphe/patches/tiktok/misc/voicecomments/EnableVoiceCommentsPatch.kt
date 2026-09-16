/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/0e4a6e1d
 */
package app.morphe.patches.tiktok.misc.voicecomments

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.returnEarly

/**
 * A gate flip with no settings switch of its own, so selecting the patch is the switch. It ships
 * off by default because nobody here has seen what the entry points do on a real account: whether
 * a voice comment records, publishes and plays back is a device check.
 */
@Suppress("unused")
val enableVoiceCommentsPatch = bytecodePatch(
    name = "Enable voice comments",
    description = "Turns on TikTok's own voice comment recording and publishing entry points for " +
        "accounts that do not have them.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4623())

    execute {
        // The answer returns at once, so nothing after it reads v0 and a parameter may be
        // written over. returnEarly makes the same two instructions, and carries both checks the
        // hand-written smali needed: that the gate answers Z, and that its frame has a register
        // to write into.
        resolveVoiceCommentPublishGate().returnEarly(true)
    }
}
