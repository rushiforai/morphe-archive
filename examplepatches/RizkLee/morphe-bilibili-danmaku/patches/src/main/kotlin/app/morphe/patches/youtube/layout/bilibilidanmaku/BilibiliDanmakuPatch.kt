package app.morphe.patches.youtube.layout.bilibilidanmaku

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.misc.settings.preference.SwitchPreference
import app.morphe.patches.youtube.layout.buttons.overlay.addPlayerOverlayPreferences
import app.morphe.patches.youtube.layout.buttons.overlay.playerOverlayButtonsSettingsPatch
import app.morphe.patches.youtube.layout.player.buttons.addPlayerBottomButton
import app.morphe.patches.youtube.layout.player.buttons.playerOverlayButtonsHookPatch
import app.morphe.patches.youtube.layout.player.icons.copyPlayerButtonIcons
import app.morphe.patches.youtube.layout.sponsorblock.ControlsOverlayFingerprint
import app.morphe.patches.youtube.misc.extension.sharedExtensionPatch
import app.morphe.patches.youtube.misc.playercontrols.addLegacyBottomControl
import app.morphe.patches.youtube.misc.playercontrols.initializeLegacyBottomControl
import app.morphe.patches.youtube.misc.playercontrols.legacyPlayerControlsPatch
import app.morphe.patches.youtube.misc.playertype.playerTypeHookPatch
import app.morphe.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.video.information.videoInformationPatch
import app.morphe.patches.youtube.video.information.videoTimeHook
import app.morphe.patches.youtube.video.videoid.hookVideoId
import app.morphe.patches.youtube.video.videoid.videoIdPatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val CONTROLLER = "Lapp/morphe/extension/youtube/bilibilidanmaku/BilibiliDanmakuController;"
private const val BUTTON = "Lapp/morphe/extension/youtube/bilibilidanmaku/BilibiliDanmakuToggleButton;"

private val bilibiliDanmakuResourcePatch = resourcePatch {
    dependsOn(legacyPlayerControlsPatch)
    execute {
        copyPlayerButtonIcons("bilibilidanmakubutton", "morphe_bilibili_danmaku_button_on", "morphe_bilibili_danmaku_button_off")
        addLegacyBottomControl("bilibilidanmakubutton")
        // The picker owns the Android document callback; the host YouTube Activity is unchanged.
        document("AndroidManifest.xml").use { document ->
            val activity = document.createElement("activity").apply {
                setAttribute("android:name", "app.morphe.extension.youtube.bilibilidanmaku.BilibiliXmlPickerActivity")
                setAttribute("android:exported", "false")
                setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
            }
            document.getElementsByTagName("application").item(0).appendChild(activity)
        }
    }
}

@Suppress("unused")
val bilibiliDanmakuPatch = bytecodePatch(
    name = "Bilibili danmaku",
    description = "Shows Bilibili danmaku on YouTube with an in-player menu, matching, XML import and sync controls."
) {
    dependsOn(
        sharedExtensionPatch,
        playerTypeHookPatch,
        videoIdPatch,
        videoInformationPatch,
        playerOverlayButtonsSettingsPatch,
        playerOverlayButtonsHookPatch,
        legacyPlayerControlsPatch,
        bilibiliDanmakuResourcePatch,
    )
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        addPlayerOverlayPreferences(SwitchPreference("morphe_bilibili_danmaku_overlay_button", summary = true))
        addPlayerBottomButton(BUTTON)
        initializeLegacyBottomControl(BUTTON)
        hookVideoId("$CONTROLLER->newVideoLoaded(Ljava/lang/String;)V")
        videoTimeHook(CONTROLLER, "setVideoTime")

        // Same overlay root used by SponsorBlock and the Niconico comments patch.
        ControlsOverlayFingerprint.let {
            it.clearMatch()
            it.method.apply {
                val index = it.instructionMatches.last().index
                val rootRegister = getInstruction<OneRegisterInstruction>(index).registerA
                addInstruction(index + 1,
                    "invoke-static { v$rootRegister }, $CONTROLLER->initialize(Landroid/view/ViewGroup;)V")
            }
        }
    }
}
