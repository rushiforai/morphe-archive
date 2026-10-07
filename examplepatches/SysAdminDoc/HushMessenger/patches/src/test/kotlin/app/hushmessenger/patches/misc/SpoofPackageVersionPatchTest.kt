package app.hushmessenger.patches.misc

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Document
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFails
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class SpoofPackageVersionPatchTest {
    private fun manifest(code: String = "346213494", major: String? = null): Document {
        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument()
        val root = document.createElement("manifest")
        root.setAttribute("package", "com.facebook.orca")
        root.setAttribute("android:versionCode", code)
        root.setAttribute("android:versionName", "581.0.0.49.91")
        if (major != null) root.setAttribute("android:versionCodeMajor", major)
        document.appendChild(root)
        return document
    }

    private val Document.code get() = documentElement.getAttribute("android:versionCode")

    @Test
    fun raisesTheManifestCodeToTheChosenNumber() {
        val document = manifest()
        document.spoofVersionCode("346213494", HIGHEST_VERSION_CODE)
        assertEquals("2147483647", document.code)
        assertEquals("581.0.0.49.91", document.documentElement.getAttribute("android:versionName"))

        val lowest = manifest("346013440")
        lowest.spoofVersionCode("346013440", 1)
        assertEquals("1", lowest.code)
    }

    @Test
    fun refusesAManifestThatDisagreesWithThePatcherBeforeChangingIt() {
        val document = manifest("346213494")
        val failure = assertFailsWith<PatchException> { document.spoofVersionCode("346013440", HIGHEST_VERSION_CODE) }
        assertContains(failure.message.orEmpty(), "not 346013440")
        assertContains(failure.message.orEmpty(), "Use an unmodified arm64 Messenger")
        assertEquals("346213494", document.code)

        val blank = manifest("")
        assertFailsWith<PatchException> { blank.spoofVersionCode("", HIGHEST_VERSION_CODE) }
        assertEquals("", blank.code)
    }

    @Test
    fun refusesAVersionCodeMajorBeforeChangingIt() {
        val document = manifest(major = "1")
        val failure = assertFailsWith<PatchException> { document.spoofVersionCode("346213494", HIGHEST_VERSION_CODE) }
        assertContains(failure.message.orEmpty(), "versionCodeMajor")
        assertEquals("346213494", document.code)
    }

    @Test
    fun refusesCodesBelowOneBeforeChangingIt() {
        for (code in listOf(0, -1, Int.MIN_VALUE)) {
            val document = manifest()
            assertFailsWith<PatchException> { document.spoofVersionCode("346213494", code) }
            assertEquals("346213494", document.code)
        }
        assertFalse(validSpoofedVersionCode(null))
        assertTrue(validSpoofedVersionCode(1))
        assertTrue(validSpoofedVersionCode(Int.MAX_VALUE))
    }

    @Test
    fun startsUnselectedWithARequiredOptionAtTheHighestCode() {
        assertEquals(SPOOF_VERSION_PATCH, spoofPackageVersionPatch.name)
        assertFalse(spoofPackageVersionPatch.default)
        assertEquals("Updates", spoofPackageVersionPatch.category)
        assertEquals(setOf(SPOOF_VERSION_KEY), spoofPackageVersionPatch.options.keys)
        val option = spoofPackageVersionPatch.options.getValue(SPOOF_VERSION_KEY)
        assertEquals(HIGHEST_VERSION_CODE, option.default)
        assertTrue(option.required)
        try {
            assertFails { spoofPackageVersionPatch.options.set(SPOOF_VERSION_KEY, 0) }
            assertFails { spoofPackageVersionPatch.options.set(SPOOF_VERSION_KEY, -5) }
            spoofPackageVersionPatch.options.set(SPOOF_VERSION_KEY, 400000000)
            assertEquals(400000000, option.value)
        } finally {
            option.reset()
        }
        assertEquals(HIGHEST_VERSION_CODE, option.value)
    }

    @Test
    fun descriptionStatesTheLimits() {
        val description = spoofPackageVersionPatch.description.orEmpty()
        assertContains(description, "Play Store")
        assertContains(description, "may report this number to Meta")
        assertContains(description, "uninstalling first")
        assertFalse(description.contains('—') || description.contains('–'))
    }
}
