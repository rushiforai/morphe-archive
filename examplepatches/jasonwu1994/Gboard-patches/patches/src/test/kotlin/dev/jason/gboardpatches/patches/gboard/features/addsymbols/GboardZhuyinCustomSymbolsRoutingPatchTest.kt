package dev.jason.gboardpatches.patches.gboard.features.addsymbols

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardZhuyinCustomSymbolsRoutingPatchTest {
    @Test
    fun `footer tab click consumer shape accepts expected footer lambda`() {
        val shape = FooterTabClickConsumerShape(
            scrollableNavigationFieldCount = 1,
            acceptReadsScrollableNavigationField = true,
            acceptCallsScrollableNavigationView = true
        )

        assertTrue(isValidFooterTabClickConsumerShape(shape))
    }

    @Test
    fun `footer tab click consumer shape rejects consumer without navigation field read`() {
        val shape = FooterTabClickConsumerShape(
            scrollableNavigationFieldCount = 1,
            acceptReadsScrollableNavigationField = false,
            acceptCallsScrollableNavigationView = true
        )

        assertFalse(isValidFooterTabClickConsumerShape(shape))
    }

    @Test
    fun `footer tab click consumer shape rejects drifted class with multiple navigation fields`() {
        val shape = FooterTabClickConsumerShape(
            scrollableNavigationFieldCount = 2,
            acceptReadsScrollableNavigationField = true,
            acceptCallsScrollableNavigationView = true
        )

        assertFalse(isValidFooterTabClickConsumerShape(shape))
    }
}
