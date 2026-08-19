package io.github.liongalahad.nuviotv.extension.settings

import android.content.Intent
import io.github.liongalahad.nuviotv.extension.BuildConfig
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [35])
class MorpheAboutSettingsTest {
    @Test fun `repository action opens the Morphe project page`() {
        val intent = MorpheOpenRepositoryAction.repositoryIntent()
        assertEquals(Intent.ACTION_VIEW, intent.action)
        assertEquals(MorpheBuildInfo.repositoryUrl(), intent.dataString)
    }

    @Test fun `compiled project version is exposed in display form`() {
        assertEquals(
            MorpheBuildInfo.displayVersion(BuildConfig.MORPHE_PATCH_VERSION),
            MorpheBuildInfo.version()
        )
    }
}
