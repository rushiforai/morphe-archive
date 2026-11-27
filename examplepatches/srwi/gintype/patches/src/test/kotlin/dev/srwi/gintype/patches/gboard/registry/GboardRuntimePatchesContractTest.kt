package dev.srwi.gintype.patches.gboard.registry

import dev.srwi.gintype.patches.gboard.features.customholdpopups.gboardCustomHoldPopupsBytecodePatch
import dev.srwi.gintype.patches.gboard.features.customholdpopups.gboardCustomHoldPopupsFeatureMarkerPatch
import dev.srwi.gintype.patches.gboard.features.thicctopbar.gboardThiccTopBarBytecodePatch
import dev.srwi.gintype.patches.gboard.features.thicctopbar.gboardThiccTopBarFeatureMarkerPatch
import dev.srwi.gintype.patches.gboard.features.multiglide.gboardMultiGlideBytecodePatch
import dev.srwi.gintype.patches.gboard.features.multiglide.gboardMultiGlideFeatureMarkerPatch
import dev.srwi.gintype.patches.gboard.features.typingeffects.gboardTypingEffectsBytecodePatch
import dev.srwi.gintype.patches.gboard.features.typingeffects.gboardTypingEffectsFeatureMarkerPatch
import org.junit.Assert.assertEquals
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardRuntimePatchesContractTest {
    @Test
    fun `remaining features are independently published and enabled by default`() {
        val registrations = GboardPublishedPatchCatalog.morpheRegistrations
        val matrix = registrations.single { patch ->
            patch.name == "Thicc Top Bar"
        }
        val multiglide = registrations.single { patch -> patch.name == "MultiGlide" }
        val typingEffects = registrations.single { patch -> patch.name == "Typing Effects" }
        val customHoldPopups = registrations.single { patch -> patch.name == "Custom Hold Popups" }

        assertSame(gboardThiccTopBarPatch, matrix)
        assertSame(gboardMultiGlidePatch, multiglide)
        assertSame(gboardTypingEffectsPatch, typingEffects)
        assertSame(gboardCustomHoldPopupsPatch, customHoldPopups)

        val generated = generatedPublishedPatches().associateBy { patch ->
            patch["name"].asString
        }
        assertTrue(generated.getValue(matrix.name!!)["use"].asBoolean)
        assertTrue(generated.getValue(multiglide.name!!)["use"].asBoolean)
        assertTrue(generated.getValue(typingEffects.name!!)["use"].asBoolean)
        assertTrue(generated.getValue(customHoldPopups.name!!)["use"].asBoolean)
    }

    @Test
    fun `each public patch owns only its feature marker and runtime contributions`() {
        assertTrue(gboardThiccTopBarPatch.dependencies.any { dependency ->
            dependency === gboardThiccTopBarFeatureMarkerPatch
        })
        assertTrue(gboardThiccTopBarPatch.dependencies.any { dependency ->
            dependency === gboardThiccTopBarBytecodePatch
        })

        assertTrue(gboardMultiGlidePatch.dependencies.any { dependency ->
            dependency === gboardMultiGlideFeatureMarkerPatch
        })
        assertTrue(gboardMultiGlidePatch.dependencies.any { dependency ->
            dependency === gboardMultiGlideBytecodePatch
        })

        assertTrue(gboardTypingEffectsPatch.dependencies.any { dependency ->
            dependency === gboardTypingEffectsFeatureMarkerPatch
        })
        assertTrue(gboardTypingEffectsPatch.dependencies.any { dependency ->
            dependency === gboardTypingEffectsBytecodePatch
        })

        assertTrue(gboardCustomHoldPopupsPatch.dependencies.any { dependency ->
            dependency === gboardCustomHoldPopupsFeatureMarkerPatch
        })
        assertTrue(gboardCustomHoldPopupsPatch.dependencies.any { dependency ->
            dependency === gboardCustomHoldPopupsBytecodePatch
        })
    }

    @Test
    fun `public descriptions match the requested bilingual product copy`() {
        assertEquals(
            "Vertical word suggestions with up/down swipe and 2D sentence matrix.",
            gboardThiccTopBarPatch.description,
        )
        assertEquals(
            "Two-finger swipe and tap+swipe chorded gesture typing powered by the Kinetica algorithm and Gboard dictionary.",
            gboardMultiGlidePatch.description,
        )
    }
}
