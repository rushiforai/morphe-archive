package dev.jason.gboardpatches.patches.gboard.registry

import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardMultipleSmartSuggestionsCategoryFilterPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardMultipleSmartSuggestionsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardMultipleSmartSuggestionsFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardMultipleSmartSuggestionsPatchContractTest {
    @Test
    fun patchIsDefaultEnabledAndUsesTheSharedFeatureFlagPath() {
        val patch = gboardMultipleSmartSuggestionsPatch

        assertEquals("Multiple Smart Suggestions", patch.name)
        assertTrue(patch.default)
        assertEquals(
            setOf(
                gboardPatchesExtensionCarrierPatch,
                gboardMultipleSmartSuggestionsFlagValuePatch,
                gboardMultipleSmartSuggestionsFeatureMarkerPatch,
                gboardMultipleSmartSuggestionsCategoryFilterPatch,
            ),
            patch.dependencies.toSet(),
        )
    }

    @Test
    fun runtimeFlagAndMarkerNamesStayExact() {
        val root = generateSequence(java.nio.file.Path.of("").toAbsolutePath()) { it.parent }
            .first { java.nio.file.Files.isRegularFile(it.resolve("settings.gradle.kts")) }
        val runtimeSource = java.nio.file.Files.readString(
            root.resolve("extensions/extension/src/main/java/dev/jason/gboardpatches/extension/featureflags/GboardFeatureFlagsRuntime.java"),
        )
        val availabilitySource = java.nio.file.Files.readString(
            root.resolve("extensions/extension/src/main/java/dev/jason/gboardpatches/extension/settings/GboardPatchesFeatureAvailability.java"),
        )
        val markerSource = java.nio.file.Files.readString(
            root.resolve("patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/featureflags/GboardMultipleSmartSuggestionsFeatureMarkerPatch.kt"),
        )

        assertTrue(runtimeSource.contains("\"show_multiple_categories\""))
        assertTrue(runtimeSource.contains("FEATURE_MULTIPLE_SMART_SUGGESTIONS"))
        assertTrue(availabilitySource.contains("dev.jason.gboardpatches.feature.multiple_smart_suggestions"))
        assertTrue(markerSource.contains("dev.jason.gboardpatches.feature.multiple_smart_suggestions"))
    }
}
