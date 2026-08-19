package io.github.liongalahad.nuviotv.extension.settings

import org.junit.Assert.assertEquals
import org.junit.Assert.assertSame
import org.junit.Test

class MorpheSettingsPageContentTest {
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
}
