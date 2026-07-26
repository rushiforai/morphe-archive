package dev.jason.gboardpatches.patches.gboard.registry

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardDeveloperOptionsPatchContractSourceTest {
    private val repositoryRoot = findRepositoryRoot()

    @Test
    fun publicPatchIsStagedWhileMarkerImplementationRemainsAvailable() {
        val registry = readSource(REGISTRY_PATH)
        val activeRegistry = registry.replace(Regex("(?s)/\\*.*?\\*/"), "")

        assertTrue(registry.contains("val gboardDeveloperOptionsPatch = resourcePatch("))
        assertFalse(activeRegistry.contains("val gboardDeveloperOptionsPatch = resourcePatch("))
        assertEquals(1, registry.countOccurrences("name = \"Developer options\""))
        assertTrue(registry.contains("gboardPatchesSettingsPatch"))
        assertTrue(registry.contains("gboardDeveloperOptionsFeatureMarkerPatch"))

        val markerPath = repositoryRoot.resolve(MARKER_PATH)
        assertTrue("Developer options feature marker source missing", Files.isRegularFile(markerPath))
        val marker = readSource(MARKER_PATH)
        assertTrue(marker.contains("gboardDeveloperOptionsFeatureMarkerPatch"))
        assertTrue(marker.contains("applyFeatureMarker(DEVELOPER_OPTIONS_FEATURE_MARKER_NAME)"))
        assertTrue(marker.contains("dev.jason.gboardpatches.feature.developer_options"))
        assertTrue(marker.contains("ensurePackageQueries()"))
        SUPPORTED_PACKAGES.forEach { packageName ->
            assertTrue("Marker must query $packageName", marker.contains("\"$packageName\""))
        }

        val sharedSettingsPatch = readSource(SETTINGS_PATCH_PATH)
        SUPPORTED_PACKAGES.forEach { packageName ->
            assertFalse(
                "Package visibility must not be globally injected by the shared settings patch",
                sharedSettingsPatch.contains(packageName),
            )
        }
    }

    @Test
    fun extensionRegistersMarkerGatedDirectRootAction() {
        val availability = readSource(AVAILABILITY_PATH)
        val featureRegistry = readSource(FEATURE_REGISTRY_PATH)
        val featurePath = repositoryRoot.resolve(FEATURE_PATH)
        val contract = readSource(CONTRACT_PATH)
        val activity = readSource(ACTIVITY_PATH)

        assertTrue(availability.contains("FEATURE_DEVELOPER_OPTIONS"))
        assertTrue(availability.contains("dev.jason.gboardpatches.feature.developer_options"))
        assertTrue(featureRegistry.contains("new GboardDeveloperOptionsSettingsFeature("))
        assertTrue("Developer options settings feature missing", Files.isRegularFile(featurePath))

        val feature = readSource(FEATURE_PATH)
        assertTrue(feature.contains("FEATURE_DEVELOPER_OPTIONS"))
        assertTrue(feature.contains("public void openRootEntry("))
        assertTrue(feature.contains("host.openTargetSettingsHeader("))
        assertTrue(feature.contains("0x7f140abe"))
        assertFalse(feature.contains("DeveloperSettingsFragment"))
        assertFalse(feature.contains(":android:show_fragment"))

        assertTrue(contract.contains("default void openRootEntry(Host host)"))
        assertTrue(contract.contains("host.openFeature(this);"))
        assertTrue(contract.contains("default void openTargetSettingsHeader(int headerKeyResourceId)"))
        assertTrue(activity.contains("() -> feature.openRootEntry(host)"))
        assertFalse(activity.contains("() -> host.openFeature(feature)"))
    }

    @Test
    fun activityUsesOnlyExact1777HeaderNavigationAndFailsClosed() {
        val activity = readSource(ACTIVITY_PATH)

        assertTrue(activity.contains("ENTER_PREF_HEADER"))
        assertTrue(activity.contains("17.7.7.932364120-release-arm64-v8a"))
        assertTrue(activity.contains("targetPackageVersionName(packageName)"))
        assertTrue(activity.contains("SUPPORTED_DEVELOPER_OPTIONS_TARGET_VERSION.equals("))
        assertTrue(activity.contains("intent.putExtra(ENTER_PREF_HEADER_EXTRA, headerKeyResourceId)"))
        assertTrue(activity.contains("getPackageInfo(packageName, 0)"))
        SUPPORTED_PACKAGES.forEach { packageName ->
            assertTrue("Activity must support $packageName", activity.contains("\"$packageName\""))
        }

        assertFalse(activity.contains(":android:show_fragment"))
        assertFalse(activity.contains("DeveloperSettingsFragment"))
        assertFalse(activity.contains("TARGET_VERSION_1777_PREFIX"))
        assertFalse(activity.contains("versionName.startsWith("))
        assertFalse(activity.contains("17.0.10"))
        assertFalse(activity.contains("fallbackFragment"))
    }

    @Test
    fun localizedStringsUseConciseDeveloperOptionsAndFlagEditorCopy() {
        val english = readSource(ENGLISH_STRINGS_PATH)
        val traditionalChinese = readSource(TRADITIONAL_CHINESE_STRINGS_PATH)

        assertTrue(english.contains(
            "<string name=\"gboard_patches_developer_options_title\">Developer options</string>",
        ))
        assertTrue(english.contains(
            "<string name=\"gboard_patches_developer_options_summary\">Open Developer options and the Flag Editor.</string>",
        ))
        assertTrue(traditionalChinese.contains(
            "<string name=\"gboard_patches_developer_options_title\">開發人員選項</string>",
        ))
        assertTrue(traditionalChinese.contains(
            "<string name=\"gboard_patches_developer_options_summary\">開啟 開發人員選項 與 Flag 編輯器。</string>",
        ))
    }

    private fun readSource(relativePath: String): String = String(
        Files.readAllBytes(repositoryRoot.resolve(relativePath)),
        StandardCharsets.UTF_8,
    )

    private fun findRepositoryRoot(): Path {
        val workingDirectory = Path.of("").toAbsolutePath().normalize()
        return generateSequence(workingDirectory) { it.parent }
            .firstOrNull { candidate ->
                Files.isRegularFile(candidate.resolve("README.md")) &&
                    Files.isRegularFile(candidate.resolve(REGISTRY_PATH))
            }
            ?: error("Could not locate repository root from $workingDirectory")
    }

    private fun String.countOccurrences(value: String): Int =
        windowed(value.length, 1).count { it == value }

    private companion object {
        const val REGISTRY_PATH =
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                "GboardPatchRegistry.kt"
        const val MARKER_PATH =
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                "developeroptions/GboardDeveloperOptionsFeatureMarkerPatch.kt"
        const val SETTINGS_PATCH_PATH =
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/" +
                "GboardPatchesSettingsPatch.kt"
        const val AVAILABILITY_PATH =
            "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/settings/" +
                "GboardPatchesFeatureAvailability.java"
        const val FEATURE_REGISTRY_PATH =
            "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/settings/" +
                "GboardPatchesSettingsFeatureRegistry.java"
        const val FEATURE_PATH =
            "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/" +
                "developeroptions/GboardDeveloperOptionsSettingsFeature.java"
        const val CONTRACT_PATH =
            "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/settings/" +
                "GboardPatchesSettingsContract.java"
        const val ACTIVITY_PATH =
            "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/settings/" +
                "GboardPatchesSettingsActivity.java"
        const val ENGLISH_STRINGS_PATH =
            "extensions/extension/src/main/res/values/gboard_settings_strings.xml"
        const val TRADITIONAL_CHINESE_STRINGS_PATH =
            "extensions/extension/src/main/res/values-b+zh+Hant/gboard_settings_strings.xml"
        val SUPPORTED_PACKAGES = listOf(
            "com.google.android.inputmethod.latin",
            "com.google.android.inputmethod.latin.jason.dev",
            "dev.jason.com.google.android.inputmethod.latin",
        )
    }
}
