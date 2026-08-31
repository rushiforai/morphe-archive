package io.github.liongalahad.nuviotv.extension.settings

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test

class MorpheSettingsPageContentTest {
    private class BooleanState(var value: Any?)

    @Test fun `development version is formatted without the separator before its build number`() {
        assertEquals("1.0.0-dev20", MorpheBuildInfo.displayVersion("1.0.0-dev.20"))
    }

    @Test fun `stable version is not changed`() {
        assertEquals("1.0.0", MorpheBuildInfo.displayVersion("1.0.0"))
    }

    @Test fun `missing version has an explicit fallback`() {
        assertEquals("unknown", MorpheBuildInfo.displayVersion("  "))
    }

    @Test fun `native detail focus requester targets the first Morphe section`() {
        val nativeRequester = Any()
        val rememberedRequester = Any()

        assertSame(
            nativeRequester,
            MorpheSettingsPageContent.focusRequesterForSection(
                nativeRequester,
                rememberedRequester,
                0
            )
        )
    }

    @Test fun `later sections retain their remembered focus requesters`() {
        val nativeRequester = Any()
        val rememberedRequester = Any()

        assertSame(
            rememberedRequester,
            MorpheSettingsPageContent.focusRequesterForSection(
                nativeRequester,
                rememberedRequester,
                1
            )
        )
    }

    @Test fun `first section retains its remembered requester without native autofocus`() {
        val rememberedRequester = Any()

        assertSame(
            rememberedRequester,
            MorpheSettingsPageContent.focusRequesterForSection(
                null,
                rememberedRequester,
                0
            )
        )
    }

    @Test fun `opening one top level section closes every other section`() {
        val detail = BooleanState(true)
        val playback = BooleanState(true)
        val subtitles = BooleanState(false)
        val about = BooleanState(true)

        MorpheSettingsPageContent.exclusiveToggle(
            subtitles,
            listOf(detail, playback, subtitles, about)
        ).invoke()

        assertFalse(detail.value as Boolean)
        assertFalse(playback.value as Boolean)
        assertTrue(subtitles.value as Boolean)
        assertFalse(about.value as Boolean)
    }

    @Test fun `closing the open top level section leaves every section closed`() {
        val playback = BooleanState(true)
        val subtitles = BooleanState(false)

        MorpheSettingsPageContent.exclusiveToggle(
            playback,
            listOf(playback, subtitles)
        ).invoke()

        assertFalse(playback.value as Boolean)
        assertFalse(subtitles.value as Boolean)
    }
}
