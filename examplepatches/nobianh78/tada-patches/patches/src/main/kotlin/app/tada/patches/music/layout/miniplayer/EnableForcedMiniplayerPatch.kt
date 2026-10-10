/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.music.layout.miniplayer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.settings.PreferenceScreen
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/morphe/extension/music/patches/EnableForcedMiniplayerPatch;"

@Suppress("unused")
val enableForcedMiniplayerPatch = bytecodePatch(
    name = "Enable forced miniplayer",
    description = "Adds an option to enable forced miniplayer when switching between music videos, podcasts, or songs."
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch
    )

    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
        PreferenceScreen.PLAYER.addPreferences(
            SwitchPreference("tada_music_enable_forced_miniplayer", summary = true)
        )

        MinimizedPlayerFingerprint.let {
            val method = it.method
            val invokeIndex = method.indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_VIRTUAL &&
                        getReference<MethodReference>()?.name == "booleanValue"
            }

            val moveResultIndex = invokeIndex + 1
            val moveResultInstr = method.getInstruction<OneRegisterInstruction>(moveResultIndex)
            val targetRegister = moveResultInstr.registerA

            method.addInstructions(
                moveResultIndex + 1,
                """
                    invoke-static {v$targetRegister}, $EXTENSION_CLASS->enableForcedMiniplayerPatch(Z)Z
                    move-result v$targetRegister
                """
            )
        }
    }
}