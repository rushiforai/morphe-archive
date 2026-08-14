package io.github.liongalahad.nuviotv.extension.settings

import org.junit.Assert.assertSame
import org.junit.Test

class MorpheSettingsPageContentTest {
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
