package app.tada.patches.youtube.misc.announcements

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.shared.YouTubeActivityOnCreateFingerprint

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/announcements/AnnouncementsPatch;"

val announcementsPatch = bytecodePatch(
    // FIXME: Change this to an "Update is available" patch
    //name = "Announcements",
    description = "Adds an option to show announcements from TADa on app startup.",
) {
    dependsOn(
        settingsPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        PreferenceScreen.MISC.addPreferences(
            SwitchPreference("tada_announcements"),
        )

        YouTubeActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->showAnnouncement(Landroid/app/Activity;)V",
        )
    }
}
