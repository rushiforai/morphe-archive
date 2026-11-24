package patches.gboard

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import patches.gboard.features.featureflags.gboardDeviceIntelligenceFeatureMarkerPatch
import patches.gboard.features.featureflags.gboardDeviceIntelligenceFlagValuePatch
import patches.gboard.features.featureflags.gboardInlineSuggestionsFeatureMarkerPatch
import patches.gboard.features.featureflags.gboardInlineSuggestionsFlagValuePatch
import patches.gboard.registry.gboardInlineAutofillSuggestionsPatch
import patches.gboard.registry.gboardSmartComposePatch
import patches.gboard.shared.gboardPatchesExtensionCarrierPatch

class InlineSuggestionsPatchesTest {
    @Test
    fun autofillAndComposeAreSeparateDefaultSelectionsForTheSupportedTargets() {
        val autofill = gboardInlineAutofillSuggestionsPatch
        val compose = gboardSmartComposePatch
        assertEquals("Enable Inline Autofill Suggestions", autofill.name)
        assertEquals("Smart Compose", compose.name)
        for (patch in listOf(autofill, compose)) {
            assertTrue(patch.default)
            assertEquals(3, patch.dependencies.size)
            assertEquals(listOf(Constants.COMPATIBILITY_GBOARD), patch.compatibility)
            assertTrue(patch.dependencies.contains(gboardPatchesExtensionCarrierPatch))
        }
        assertEquals(setOf(
            gboardPatchesExtensionCarrierPatch,
            gboardDeviceIntelligenceFlagValuePatch,
            gboardDeviceIntelligenceFeatureMarkerPatch,
        ), autofill.dependencies.toSet())
        assertEquals(setOf(
            gboardPatchesExtensionCarrierPatch,
            gboardInlineSuggestionsFlagValuePatch,
            gboardInlineSuggestionsFeatureMarkerPatch,
        ), compose.dependencies.toSet())
        assertFalse(autofill.dependencies.contains(compose))
        assertFalse(compose.dependencies.contains(autofill))
    }
}
