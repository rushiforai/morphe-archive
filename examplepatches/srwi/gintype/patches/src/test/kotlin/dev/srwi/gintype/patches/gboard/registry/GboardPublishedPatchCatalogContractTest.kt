package dev.srwi.gintype.patches.gboard.registry

import com.google.gson.JsonParser
import dev.srwi.gintype.patches.gboard.shared.generated.GboardTargetAdmission
import org.junit.Assert.assertEquals
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardPublishedPatchCatalogContractTest {
    @Test
    fun catalogExposesEachPublishedMorpheRegistrationExactlyOnce() {
        val registrations = GboardPublishedPatchCatalog.morpheRegistrations

        assertTrue(registrations.isNotEmpty())
        assertEquals(registrations.size, registrations.map { patch -> patch.name }.distinct().size)
        assertSame(
            gboardThiccTopBarPatch,
            registrations.single { patch -> patch.name == "Thicc Top Bar" },
        )
        assertSame(
            gboardMultiGlidePatch,
            registrations.single { patch -> patch.name == "MultiGlide" },
        )
        assertSame(
            gboardTypingEffectsPatch,
            registrations.single { patch -> patch.name == "Typing Effects" },
        )
        assertSame(
            gboardCustomHoldPopupsPatch,
            registrations.single { patch -> patch.name == "Custom Hold Popups" },
        )
    }

    @Test
    fun catalogRendersThePublishedInventoryFromItsMorpheRegistrations() {
        val inventory = JsonParser.parseString(
            GboardPublishedPatchCatalog.publishedInventory("test-version"),
        ).asJsonObject
        val patches = inventory.getAsJsonArray("patches").map { element -> element.asJsonObject }

        assertEquals("test-version", inventory.get("version").asString)
        assertEquals(
            patches.map { patch -> patch.get("name").asString }.sorted(),
            patches.map { patch -> patch.get("name").asString },
        )

        val matrixSuggestions = patches.single { patch ->
            patch.get("name").asString == "Thicc Top Bar"
        }
        assertTrue(matrixSuggestions.get("use").asBoolean)
        assertEquals(
            GboardTargetAdmission.versionNames,
            matrixSuggestions.getAsJsonObject("compatiblePackages")
                .getAsJsonArray("com.google.android.inputmethod.latin")
                .map { version -> version.asString },
        )
        assertTrue(matrixSuggestions.getAsJsonArray("options").isEmpty)
    }

    @Test
    fun catalogUsesOnlyTheGeneratedTargetAdmission() {
        val patches = generatedPublishedPatches()

        assertMatchesPublishedRegistrationCount(patches.size)
        assertEquals(
            setOf(GboardTargetAdmission.packageName),
            patches.flatMap { patch ->
                patch.getAsJsonObject("compatiblePackages").keySet()
            }.toSet(),
        )
        assertEquals(
            GboardTargetAdmission.versionNames.toSet(),
            patches.flatMap { patch ->
                patch.getAsJsonObject("compatiblePackages")
                    .getAsJsonArray(GboardTargetAdmission.packageName)
                    .map { version -> version.asString }
            }.toSet(),
        )
    }
}
