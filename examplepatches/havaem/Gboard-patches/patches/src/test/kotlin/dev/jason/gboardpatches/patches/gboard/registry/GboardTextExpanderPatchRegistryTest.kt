package dev.jason.gboardpatches.patches.gboard.registry

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardTargetAdmission
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardTextExpanderPatchRegistryTest {
    @Test
    fun textExpanderIsAnIndependentDefaultEnabledPublicPatch() {
        assertEquals("Text Expander", gboardTextExpanderPatch.name)
        assertTrue(gboardTextExpanderPatch.default)
        assertTrue(
            gboardTextExpanderPatch.description.orEmpty().contains(
                "Type a shortcut and press Space to replace it with longer text you set up.",
            ),
        )
        assertEquals(
            setOf("text_expander.input"),
            GboardTargetAdmission.admittedContributionIdsByFeature["text_expander"],
        )
    }
}
