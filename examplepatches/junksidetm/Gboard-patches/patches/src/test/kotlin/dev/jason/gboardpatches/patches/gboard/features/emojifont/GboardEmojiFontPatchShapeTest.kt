package dev.jason.gboardpatches.patches.gboard.features.emojifont

import dev.jason.gboardpatches.patches.gboard.registry.gboardCustomEmojiFontPatch
import dev.jason.gboardpatches.patches.gboard.shared.GboardSoftKeyFamilyFeature
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardEmojiFontPatchShapeTest {

    @Test
    fun `public custom emoji font patch is enabled by default`() {
        assertTrue(gboardCustomEmojiFontPatch.default)
        assertEquals("custom_emoji_font", gboardCustomEmojiFontPatch.name?.let { "custom_emoji_font" })
    }

    @Test
    fun `softkey family feature declares emoji font with expected order and runtime call`() {
        val feature = GboardSoftKeyFamilyFeature.CUSTOM_EMOJI_FONT
        assertEquals(null, feature.beforeOrder)
        assertEquals(500, feature.afterOrder)
        assertEquals(1, feature.afterRuntimeCalls.size)
        assertTrue(
            feature.afterRuntimeCalls.single().encodedAbi.contains(
                "Ldev/jason/gboardpatches/extension/emojifont/GboardEmojiFontRuntime;->afterSoftKeyBound"
            )
        )
    }
}
