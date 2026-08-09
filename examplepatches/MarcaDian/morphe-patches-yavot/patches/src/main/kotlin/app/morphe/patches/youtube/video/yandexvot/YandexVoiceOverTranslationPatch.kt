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
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
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

/**
 * Registration method of this add-on, called by the add-on manager of Morphe Patches.
 */
private const val EXTENSION_ADD_ON_REGISTER_METHOD =
    "Lapp/morphe/extension/youtube/patches/yandexvot/YandexVotAddOn;->register()V"

private const val EXTENSION_ORIGINAL_VOLUME_CLASS =
    "Lapp/morphe/extension/youtube/patches/yandexvot/YandexVotOriginalVolumePatch;"

/**
 * Key of the built in voice over translation preference of Morphe Patches.
 * This add-on is shown right next to it.
 */
private const val VOICE_OVER_TRANSLATION_SCREEN_KEY = "morphe_vot_screen"

/**
 * Key of the preference of this add-on. Morphe settings screens sort their preferences by key,
 * so the key has to sort right after the built in one to stay next to it.
 */
private const val YANDEX_SCREEN_KEY = "${VOICE_OVER_TRANSLATION_SCREEN_KEY}_yandex"

/**
 * Screen the preference is added to if the built in voice over translation patch is not applied.
 */
private const val VIDEO_SCREEN_KEY = "morphe_settings_screen_12_video"

/**
 * No app targets are declared, since the supported versions are whatever
 * the Morphe Patches bundle this add-on is used with supports.
 */
private val COMPATIBILITY_YOUTUBE = Compatibility(
    packageName = "com.google.android.youtube",
    name = "YouTube",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0xFF0033,
    signatures = setOf(
        // Android 13+
        "5aad2bee6db95d17e05a08d7d1e64c10a1511879154483916b6ae6c7fd9cb0c6",
        // Android 7+
        "3d7a1223019aa39d9ea0e3436ab7c0896bfb4fb679f4de5fe7c23f326c8f994a"
    )
)

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
    extendWith("extensions/youtube.mpe")

    execute {
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

    finalize {
        // The player button and video hooks are subscribed to at runtime.
        // Run in finalize, since the extension of Morphe Patches is merged while its patches execute.
        registerAddOn(EXTENSION_ADD_ON_REGISTER_METHOD)
    }
}

private val yandexVoiceOverTranslationResourcePatch = resourcePatch {
    execute {
        copyResources("yandexvotbutton",
            ResourceGroup(resourceDirectoryName = "drawable",
                "morphe_yt_yandex_vot.xml", "morphe_yt_yandex_vot_bold.xml"))

        addBundledResources()

        addAddOnPreferences(
            preferenceScreen(
                key = YANDEX_SCREEN_KEY,
                titleKey = "morphe_yandex_vot_screen_title",
                sorting = Sorting.UNSORTED,
                preferences = listOf(
                    noTitlePreferenceCategory(
                        key = "morphe_yandex_vot_general_category",
                        preferences = listOf(
                            switchPreference("morphe_yandex_vot_enabled", summary = true),
                            listPreference("morphe_yandex_vot_source_language"),
                            listPreference("morphe_yandex_vot_target_language"),
                            switchPreference("morphe_yandex_vot_use_live_voices", summary = true),
                            seekBarPreference("morphe_yandex_vot_translation_volume"),
                            seekBarPreference("morphe_yandex_vot_original_audio_volume"),
                            nonInteractivePreference(
                                key = "morphe_yandex_vot_oauth_token",
                                tag = "app.morphe.extension.youtube.settings.preference.YandexVotOAuthPreference",
                                selectable = true,
                            ),
                        )
                    ),
                    noTitlePreferenceCategory(
                        key = "morphe_yandex_vot_button_category",
                        preferences = listOf(
                            listPreference("morphe_yandex_vot_timer_position"),
                            switchPreference(
                                key = "morphe_yandex_vot_progress_ring_enabled",
                                summary = true,
                            ),
                            colorPickerPreference("morphe_yandex_vot_progress_ring_color"),
                            seekBarPreference("morphe_yandex_vot_progress_ring_thickness"),
                        )
                    ),
                    noTitlePreferenceCategory(
                        key = "morphe_yandex_vot_proxy_category",
                        preferences = listOf(
                            switchPreference(
                                key = "morphe_yandex_vot_audio_proxy_enabled",
                                titleKey = "morphe_yandex_vot_audio_proxy_title",
                                summary = true,
                            ),
                            textPreference("morphe_yandex_vot_proxy_url"),
                        )
                    )
                )
            ),
            afterKey = VOICE_OVER_TRANSLATION_SCREEN_KEY,
            screenKey = VIDEO_SCREEN_KEY,
        )
    }
}

@Suppress("unused")
val yandexVoiceOverTranslationPatch = bytecodePatch(
    name = "Voice Over Translation (Yandex)",
    description = "Adds an option to enable Yandex voice-over translation of video audio tracks. " +
            "Requires a Morphe Patches version with add-on support.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(yandexVoiceOverTranslationResourcePatch, yandexVoiceOverTranslationBytecodePatch)
    execute { }
}
