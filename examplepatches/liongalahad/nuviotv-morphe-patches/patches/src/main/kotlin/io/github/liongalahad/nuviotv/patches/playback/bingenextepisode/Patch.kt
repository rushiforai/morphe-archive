package io.github.liongalahad.nuviotv.patches.playback.bingenextepisode

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import io.github.liongalahad.nuviotv.patches.settings.hub.settingsUiPatch
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY
import org.w3c.dom.Element

private const val RUNTIME =
    "Lio/github/liongalahad/nuviotv/extension/playback/bingenextepisode/Extension;"
private const val CATEGORY_METADATA =
    "io.github.liongalahad.nuviotv.settings.provider.binge_group_manual_fallback"
private const val CATEGORY_PROVIDER =
    "io.github.liongalahad.nuviotv.extension.playback.bingenextepisode.BingeGroupManualFallbackSettingsCategory"

private val playbackCategoryResourcePatch = resourcePatch {
    compatibleWith(NUVIO_COMPATIBILITY)
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            application.appendChild(document.createElement("meta-data").apply {
                setAttribute("android:name", CATEGORY_METADATA)
                setAttribute("android:value", CATEGORY_PROVIDER)
            })
        }
    }
}

@Suppress("unused")
val bingenextepisodePatch = bytecodePatch(
    name = "Binge Group Manual Fallback",
    description = "Adds Morphe > Playback control to open the source picker when no preferred binge-group stream is found.",
    default = false
) {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(settingsUiPatch, playbackCategoryResourcePatch)
    extendWith("extensions/nuviotv.mpe")

    execute {
        NextEpisodeStreamSelectionFingerprint.matchAll(1..1)
        NextEpisodeStreamSelectionFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p8 .. p8 }, $RUNTIME->forceBingeGroupOnly(Z)Z
                move-result p8
            """
        )
    }
}
