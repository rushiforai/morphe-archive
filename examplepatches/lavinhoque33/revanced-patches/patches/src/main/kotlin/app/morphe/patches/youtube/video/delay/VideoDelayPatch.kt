/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3867
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.patches.youtube.video.delay

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.youtube.general.downloads.downloadActionsPatch
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.patch.PatchList.VIDEO_DELAY
import app.morphe.patches.youtube.utils.playercontrols.addTopControl
import app.morphe.patches.youtube.utils.playercontrols.injectControl
import app.morphe.patches.youtube.utils.playercontrols.playerControlsPatch
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources
import app.morphe.util.setExtensionIsPatchIncluded
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/youtube/patches/VideoDelayPatch;"

private const val RECEIVER_CLASS_NAME =
    "app.morphe.extension.youtube.patches.VideoDelayReceiver"

private const val SET_VIDEO_DELAY_ACTION =
    "app.morphe.extension.youtube.SET_VIDEO_DELAY"

private const val EXTENSION_BUTTON =
    "Lapp/morphe/extension/youtube/videoplayer/VideoDelayDialogButton;"

private val videoDelayResourcePatch = resourcePatch {
    dependsOn(
        settingsPatch,
        playerControlsPatch,
    )

    execute {
        copyResources(
            "youtube/videodelaybutton",
            ResourceGroup(
                "drawable",
                "morphe_video_delay_button.xml",
                "morphe_video_delay_button_bold.xml",
            ),
        )

        // Lets automation apps change the delay with a broadcast.
        document("AndroidManifest.xml").use { document ->
            val receiver = document.createElement("receiver").apply {
                setAttribute("android:name", RECEIVER_CLASS_NAME)
                setAttribute("android:exported", "true")
                appendChild(
                    document.createElement("intent-filter").apply {
                        appendChild(
                            document.createElement("action").apply {
                                setAttribute("android:name", SET_VIDEO_DELAY_ACTION)
                            }
                        )
                    }
                )
            }
            document.getElementsByTagName("application").item(0).appendChild(receiver)
        }

        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: VIDEO",
                "PREFERENCE_SCREEN: PLAYER",
                "PREFERENCE_SCREENS: PLAYER_BUTTONS",
                "PREFERENCE_SCREENS: FLYOUT_MENU",
                "SETTINGS: VIDEO_DELAY",
                "SETTINGS: VIDEO_DELAY_OVERLAY_BUTTON",
                "SETTINGS: VIDEO_DELAY_FLYOUT_BUTTON",
            ),
            VIDEO_DELAY,
        )
    }
}

@Suppress("unused")
val videoDelayPatch = bytecodePatch(
    VIDEO_DELAY.title,
    VIDEO_DELAY.summary,
) {
    dependsOn(
        videoDelayResourcePatch,
        sharedExtensionPatch,
        settingsPatch,
        playerControlsPatch,
        downloadActionsPatch,
        bytecodePatch {
            finalize {
                addTopControl(
                    "youtube/videodelaybutton",
                    "@+id/morphe_video_delay_button",
                    "@+id/morphe_video_delay_button",
                )
            }
        },
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        injectControl(EXTENSION_BUTTON)

        setExtensionIsPatchIncluded(EXTENSION_CLASS_DESCRIPTOR)

        // Video frames are released when the audio clock reaches their timestamp,
        // so reporting an earlier audio position holds every frame back by the same amount.
        // Both audio renderers are hooked, as the player uses either depending on the audio codec.
        listOf(
            MediaCodecAudioRendererPositionFingerprint,
            DecoderAudioRendererPositionFingerprint
        ).forEach {
            it.method.apply {
                val returnIndex = it.instructionMatches.last().index
                val register = getInstruction<OneRegisterInstruction>(returnIndex).registerA

                addInstructions(
                    returnIndex,
                    """
                        invoke-static/range { v$register .. v${register + 1} }, $EXTENSION_CLASS_DESCRIPTOR->delayPositionUs(J)J
                        move-result-wide v$register
                    """
                )
            }
        }
    }
}
