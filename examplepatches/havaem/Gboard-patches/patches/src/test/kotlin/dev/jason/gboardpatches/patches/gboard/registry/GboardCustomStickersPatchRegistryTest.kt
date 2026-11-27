package dev.jason.gboardpatches.patches.gboard.registry

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardTargetAdmission
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardCustomStickersPatchRegistryTest {
    @Test
    fun customStickersIsAnIndependentDefaultEnabledPublicPatch() {
        assertEquals("Custom Stickers", gboardCustomStickersPatch.name)
        assertTrue(gboardCustomStickersPatch.default)
        assertTrue(
            gboardCustomStickersPatch.description.orEmpty().contains(
                "Create your own sticker packs and use them in Gboard's Stickers tab.",
            ),
        )
        assertEquals(
            setOf("custom_stickers.pack_list"),
            GboardTargetAdmission.admittedContributionIdsByFeature["custom_stickers"],
        )
    }
}
