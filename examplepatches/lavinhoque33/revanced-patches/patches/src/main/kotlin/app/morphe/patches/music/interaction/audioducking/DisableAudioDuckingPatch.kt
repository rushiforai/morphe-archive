/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4618
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-12.
 */

package app.morphe.patches.music.interaction.audioducking

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.addSwitchPreference
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.util.Utils.printWarn
import app.morphe.util.registersUsed

private const val EXTENSION_CLASS = "Lapp/morphe/extension/music/patches/DisableAudioDuckingPatch;"

@Suppress("unused")
val disableAudioDuckingPatch = bytecodePatch(
    name = "Disable audio ducking",
    description = "Adds an option to keep the volume unchanged when another app plays " +
        "a short sound, such as a notification.",
) {
    dependsOn(sharedExtensionPatch, settingsPatch)

    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
        // Resolve both hooks before changing anything. Older focus implementations can safely skip.
        val (request, change) = runCatching {
            AudioFocusRequestFingerprint.match() to AudioFocusChangeFingerprint.match()
        }.getOrElse {
            return@execute printWarn("Disable audio ducking: incompatible audio focus implementation. " +
                "Skipping this Music version: ${it.message}")
        }
        val constructorCall = request.instructionMatches.last()
        val register = constructorCall.instruction.registersUsed.last()

        // Android ducks the app itself, unless the request declares the app pauses when ducked.
        request.method.addInstructions(
            constructorCall.index,
            """
                invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS->willPauseWhenDucked(Z)Z
                move-result v$register
            """
        )

        // The app is then told to duck, and would lower the volume itself.
        change.method.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->ignoreAudioFocusChange(I)Z
                move-result v0
                if-eqz v0, :handle
                return-void
                :handle
                nop
            """
        )

        addSwitchPreference(CategoryType.PLAYER, "morphe_music_disable_audio_ducking", "false")
    }
}
