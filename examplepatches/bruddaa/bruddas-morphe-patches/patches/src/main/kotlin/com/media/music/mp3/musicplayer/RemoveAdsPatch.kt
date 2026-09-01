package com.media.music.mp3.musicplayer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.Compatibility
import util.Constants.MUSIC_PLAYER_COMPATIBILITY
import util.clearBody

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove Ads",
    description = "Forces the ads-removed check to always return true.",
    default = true
) {
    compatibleWith(MUSIC_PLAYER_COMPATIBILITY)

    execute {
        RemoveAdsMethodFingerprint.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent()
            )
        }
    }
}