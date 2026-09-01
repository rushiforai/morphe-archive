package io.github.liongalahad.nuviotv.patches.shared.updates

import io.github.liongalahad.nuviotv.patches.detail.randomepisode.randomepisodePatch
import io.github.liongalahad.nuviotv.patches.identity.sidebysideinstallation.sideBySideInstallationPatch
import io.github.liongalahad.nuviotv.patches.playback.localdownloads.localdownloadsPatch
import io.github.liongalahad.nuviotv.patches.playback.localmedia.localmediaPatch
import io.github.liongalahad.nuviotv.patches.subtitles.localstoragesubtitles.localstoragesubtitlesPatch
import io.github.liongalahad.nuviotv.patches.subtitles.sdh.removeSdhAnnotationsPatch
import io.github.liongalahad.nuviotv.patches.subtitles.sdhmarking.sdhmarkingPatch
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals

class PatchedAppUpdatesPatchTest {
    @Test
    fun `update suppression is an internal dependency of every public patch`() {
        val publicPatches = listOf(
            sideBySideInstallationPatch,
            randomepisodePatch,
            localmediaPatch,
            localdownloadsPatch,
            removeSdhAnnotationsPatch,
            sdhmarkingPatch,
            localstoragesubtitlesPatch
        )

        assertEquals(null, patchedAppUpdatesPatch.name)
        publicPatches.forEach { patch ->
            assertContains(
                patch.dependencies,
                patchedAppUpdatesPatch,
                "${patch.name} must disable Nuvio's in-app updater"
            )
        }
    }
}
