package app.tada.patches.youtube.interaction.downloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.tada.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.tada.patches.shared.misc.settings.preference.PreferenceScreenPreference.Sorting
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.shared.misc.settings.preference.TextPreference
import app.tada.patches.youtube.layout.player.icons.copyPlayerButtonIcons
import app.tada.patches.youtube.misc.playercontrols.addTopControl
import app.tada.patches.youtube.misc.playercontrols.initializeTopControl
import app.tada.patches.youtube.misc.playercontrols.legacyPlayerControlsPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.video.information.videoInformationPatch

private val downloadsResourcePatch = resourcePatch {
    dependsOn(
        legacyPlayerControlsPatch,
        settingsPatch
    )

    execute {
        PreferenceScreen.PLAYER.addPreferences(
            PreferenceScreenPreference(
                key = "tada_external_downloader_screen",
                sorting = Sorting.UNSORTED,
                preferences = setOf(
                    SwitchPreference("tada_external_downloader", summary = true),
                    SwitchPreference("tada_external_downloader_action_button", summary = true),
                    TextPreference(
                        "tada_external_downloader_name",
                        tag = "app.morphe.extension.shared.settings.preference.ExternalDownloaderPreference",
                    )
                )
            )
        )

        copyPlayerButtonIcons("downloads", "tada_yt_download_button")
    }

    finalize {
        addTopControl("downloads",
            "@+id/tada_external_download_button",
            "@+id/tada_external_download_button")
    }
}

private const val EXTENSION_CLASS = "Lapp/morphe/extension/youtube/patches/DownloadsPatch;"

private const val EXTENSION_BUTTON = "Lapp/morphe/extension/youtube/videoplayer/ExternalDownloadButton;"

@Suppress("unused")
val downloadsPatch = bytecodePatch(
    name = "Downloads",
    description = "Adds support to download videos with an external downloader app " +
        "using the in-app download button or a video player action button.",
) {
    dependsOn(
        downloadsResourcePatch,
        videoInformationPatch,
        legacyPlayerControlsPatch
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        initializeTopControl(EXTENSION_BUTTON)

        OfflineVideoEndpointFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p3 .. p3 }, $EXTENSION_CLASS->inAppDownloadButtonOnClick(Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :show_native_downloader
                    return-void
                    :show_native_downloader
                    nop
                """
            )
        }
    }
}
