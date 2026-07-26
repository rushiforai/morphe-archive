/*
 * Copyright (C) 2026 anddea
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Original author(s):
 * - Jav1x (https://github.com/Jav1x)
 *
 * Ported to morphe-patches: https://github.com/MorpheApp/morphe-patches
 * Modified by: Jav1x (https://github.com/Jav1x)
 *
 * Licensed under the GNU General Public License v3.0.
 *
 * ------------------------------------------------------------------------
 * GPLv3 Section 7 – Attribution Notice
 * ------------------------------------------------------------------------
 *
 * This file contains substantial original work by the author(s) listed above.
 *
 * In accordance with Section 7 of the GNU General Public License v3.0,
 * the following additional terms apply to this file:
 *
 * 1. Attribution (Section 7(b)): This specific copyright notice and the
 *    list of original authors above must be preserved in any copy or
 *    derivative work. You may add your own copyright notice below it,
 *    but you may not remove the original one.
 *
 * 2. Origin (Section 7(c)): Modified versions must be clearly marked as
 *    such (e.g., by adding a "Modified by" line or a new copyright notice).
 *    They must not be misrepresented as the original work.
 *
 * ------------------------------------------------------------------------
 * Version Control Acknowledgement (Non-binding Request)
 * ------------------------------------------------------------------------
 *
 * While not a legal requirement of the GPLv3, the original author(s)
 * respectfully request that ports or substantial modifications retain
 * historical authorship credit in version control systems (e.g., Git),
 * listing original author(s) appropriately and modifiers as committers
 * or co-authors.
 */

package app.morphe.patches.youtube.video.yandexvot

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.misc.settings.preference.InputType
import app.morphe.patches.shared.misc.settings.preference.ListPreference
import app.morphe.patches.shared.misc.settings.preference.NonInteractivePreference
import app.morphe.patches.shared.misc.settings.preference.PreferenceCategory
import app.morphe.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.morphe.patches.shared.misc.settings.preference.PreferenceScreenPreference.Sorting
import app.morphe.patches.shared.misc.settings.preference.SwitchPreference
import app.morphe.patches.shared.misc.settings.preference.TextPreference
import app.morphe.patches.youtube.layout.player.buttons.addPlayerBottomButton
import app.morphe.patches.youtube.layout.player.buttons.playerOverlayButtonsHookPatch
import app.morphe.patches.youtube.misc.playercontrols.addLegacyBottomControl
import app.morphe.patches.youtube.misc.playercontrols.initializeLegacyBottomControl
import app.morphe.patches.youtube.misc.playercontrols.legacyPlayerControlsPatch
import app.morphe.patches.youtube.misc.settings.PreferenceScreen
import app.morphe.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.video.information.onCreateHook
import app.morphe.patches.youtube.video.information.videoInformationPatch
import app.morphe.patches.youtube.video.information.videoTimeHook
import app.morphe.patches.youtube.video.videoid.hookVideoId
import app.morphe.patches.youtube.video.videoid.videoIdPatch
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_VOT_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/youtube/patches/yandexvot/YandexVoiceOverTranslationPatch;"

private const val EXTENSION_VOT_BUTTON =
    "Lapp/morphe/extension/youtube/videoplayer/YandexVotButton;"

private const val EXTENSION_ORIGINAL_VOLUME_CLASS =
    "Lapp/morphe/extension/youtube/patches/yandexvot/YandexVotOriginalVolumePatch;"

private const val AUDIO_TRACK_CLASS = "Landroid/media/AudioTrack;"

private fun MethodReference.isAudioTrackSetVolume(): Boolean =
    definingClass == AUDIO_TRACK_CLASS &&
        name == "setVolume" &&
        parameterTypes.toList() == listOf("F") &&
        returnType == "I"

private fun getVolumeRegister(i: Instruction): Int? = when (i) {
    is FiveRegisterInstruction -> if (i.registerCount >= 2) i.registerD else null
    is TwoRegisterInstruction -> i.registerB
    is RegisterRangeInstruction -> if (i.registerCount >= 2) i.startRegister + i.registerCount - 1 else null
    else -> null
}

private fun getAudioTrackRegister(i: Instruction): Int? = when (i) {
    is FiveRegisterInstruction -> if (i.registerCount >= 1) i.registerC else null
    is TwoRegisterInstruction -> i.registerA
    is RegisterRangeInstruction -> if (i.registerCount >= 1) i.startRegister else null
    else -> null
}

private object AudioTrackSetVolumeMethodFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(methodCall(
        definingClass = AUDIO_TRACK_CLASS,
        name = "setVolume",
        parameters = listOf("F"),
        returnType = "I"
    ))
)

private val yandexVoiceOverTranslationBytecodePatch = bytecodePatch {
    dependsOn(
        videoInformationPatch,
        videoIdPatch,
        playerOverlayButtonsHookPatch,
        legacyPlayerControlsPatch,
    )

    execute {
        videoTimeHook(EXTENSION_VOT_CLASS_DESCRIPTOR, "setVideoTime")
        onCreateHook(EXTENSION_VOT_CLASS_DESCRIPTOR, "initialize")
        hookVideoId("$EXTENSION_VOT_CLASS_DESCRIPTOR->onVideoIdChanged(Ljava/lang/String;)V")
        addPlayerBottomButton(EXTENSION_VOT_BUTTON)
        initializeLegacyBottomControl(EXTENSION_VOT_BUTTON)

        // Duck original audio: route every AudioTrack.setVolume through the extension multiplier.
        val method = AudioTrackSetVolumeMethodFingerprint.method
        val index = method.indexOfFirstInstructionOrThrow {
            (opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
                (getReference<MethodReference>()?.isAudioTrackSetVolume() == true)
        }
        val instruction = method.implementation!!.instructions.elementAt(index)
        val audioTrackReg = getAudioTrackRegister(instruction)
            ?: throw PatchException("YandexVoT: cannot get AudioTrack register")
        val volReg = getVolumeRegister(instruction)
            ?: throw PatchException("YandexVoT: cannot get volume register")
        method.addInstructions(index, """
            invoke-static { v$audioTrackReg, v$volReg }, $EXTENSION_ORIGINAL_VOLUME_CLASS->applyVolumeMultiplier(Landroid/media/AudioTrack;F)F
            move-result v$volReg
            """.trimIndent()
        )
    }
}

private val yandexVoiceOverTranslationResourcePatch = resourcePatch {
    dependsOn(legacyPlayerControlsPatch)

    execute {
        copyResources("yandexvotbutton",
            ResourceGroup(resourceDirectoryName = "drawable",
                "morphe_yt_yandex_vot.xml", "morphe_yt_yandex_vot_activated.xml"))
        addLegacyBottomControl("yandexvotbutton")

        PreferenceScreen.VIDEO.addPreferences(
            PreferenceScreenPreference(
                key = "morphe_yandex_vot_screen",
                sorting = Sorting.UNSORTED,
                preferences = setOf(
                    PreferenceCategory(
                        key = "morphe_yandex_vot_general_category",
                        titleKey = null,
                        tag = "app.morphe.extension.shared.settings.preference.NoTitlePreferenceCategory",
                        sorting = Sorting.UNSORTED,
                        preferences = setOf(
                            SwitchPreference("morphe_yandex_vot_enabled"),
                            ListPreference(
                                key = "morphe_yandex_vot_source_language",
                                entriesKey = "morphe_yandex_vot_source_language_entries",
                                entryValuesKey = "morphe_yandex_vot_source_language_entry_values",
                            ),
                            ListPreference(
                                key = "morphe_yandex_vot_target_language",
                                entriesKey = "morphe_yandex_vot_target_language_entries",
                                entryValuesKey = "morphe_yandex_vot_target_language_entry_values",
                            ),
                            SwitchPreference("morphe_yandex_vot_use_live_voices"),
                            NonInteractivePreference(
                                key = "morphe_yandex_vot_oauth_token",
                                tag = "app.morphe.extension.youtube.settings.preference.YandexVotOAuthPreference",
                                selectable = true,
                            ),
                        )
                    ),
                    PreferenceCategory(
                        key = "morphe_yandex_vot_proxy_category",
                        titleKey = null,
                        tag = "app.morphe.extension.shared.settings.preference.NoTitlePreferenceCategory",
                        sorting = Sorting.UNSORTED,
                        preferences = setOf(
                            SwitchPreference(
                                key = "morphe_yandex_vot_audio_proxy_enabled",
                                titleKey = "morphe_yandex_vot_audio_proxy_title",
                                summary = true,
                            ),
                            TextPreference(
                                key = "morphe_yandex_vot_proxy_url",
                                inputType = InputType.TEXT,
                            ),
                        )
                    )
                )
            )
        )
    }
}

@Suppress("unused")
val yandexVoiceOverTranslationPatch = bytecodePatch(
    name = "Voice Over Translation (Yandex)",
    description = "Adds an option to enable Yandex voice-over translation of video audio tracks.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(yandexVoiceOverTranslationResourcePatch, yandexVoiceOverTranslationBytecodePatch)
    execute { }
}
