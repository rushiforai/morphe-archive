package app.tada.patches.youtube.layout.captions

import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.misc.contexthook.Endpoint
import app.tada.patches.youtube.misc.contexthook.addClientVersionHook
import app.tada.patches.youtube.misc.contexthook.clientContextHookPatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playservice.versionCheckPatch
import app.tada.patches.youtube.misc.settings.settingsPatch

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/TranscriptPatch;"

internal val transcriptPatch = bytecodePatch(
    description = "Add an option to fix an issue where transcript is unavailable due to a precondition check failure.",
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        versionCheckPatch,
        clientContextHookPatch,
    )

    execute {
        settingsMenuCaptionGroup.add(
            SwitchPreference("tada_fix_transcript", summary = true)
        )

        addClientVersionHook(
            Endpoint.TRANSCRIPT,
            "$EXTENSION_CLASS->getTranscriptAppVersionOverride(Ljava/lang/String;)Ljava/lang/String;",
        )
    }
}
