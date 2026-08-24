package dev.jason.gboardpatches.patches.gboard.features.about

import dev.jason.gboardpatches.patches.gboard.shared.ANDROID_NS
import dev.jason.gboardpatches.patches.gboard.shared.childElements
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_PATCH_AUTHOR
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_PATCH_AUTHOR_URL
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_PATCH_REPOSITORY_URL
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_PATCH_VERSION
import java.io.ByteArrayInputStream
import java.nio.charset.StandardCharsets
import java.security.MessageDigest
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Test
import org.w3c.dom.Document
import org.w3c.dom.Element

class GboardAboutPageResourcePatchTest {
    @Test
    fun `official 1803 about page inserts author and patch version after version row`() {
        val fixture = readFixture()
        assertEquals(FIXTURE_SHA256, sha256(normalizeLineEndings(fixture)))
        val document = parse(fixture)
        val stockChildren = document.documentElement.childElements().toList()

        assertEquals(4, stockChildren.size)
        assertEquals(ABOUT_PREFERENCE_CLASS, stockChildren.last().tagName)
        assertEquals(ABOUT_VERSION_KEY_REF, androidAttribute(stockChildren.last(), "key"))

        applyGboardAboutPagePatch(document)

        val children = document.documentElement.childElements().toList()
        assertEquals(6, children.size)
        assertEquals(ABOUT_VERSION_KEY_REF, androidAttribute(children[3], "key"))
        assertAboutRow(
            element = children[4],
            key = "gboard_about_author",
            title = "Author",
            summary = GBOARD_PATCH_AUTHOR,
            intentUrl = GBOARD_PATCH_AUTHOR_URL,
        )
        assertAboutRow(
            element = children[5],
            key = "gboard_about_patch_version",
            title = "Patch Version",
            summary = GBOARD_PATCH_VERSION,
            intentUrl = GBOARD_PATCH_REPOSITORY_URL,
        )
    }

    @Test
    fun `official 1803 about page transformation is idempotent`() {
        val document = parse(readFixture())

        applyGboardAboutPagePatch(document)
        applyGboardAboutPagePatch(document)

        val children = document.documentElement.childElements().toList()
        assertEquals(6, children.size)
        assertEquals(1, children.count {
            androidAttribute(it, "key") == "gboard_about_author"
        })
        assertEquals(1, children.count {
            androidAttribute(it, "key") == "gboard_about_patch_version"
        })
        assertEquals(
            listOf(
                ABOUT_VERSION_KEY_REF,
                "gboard_about_author",
                "gboard_about_patch_version",
            ),
            children.takeLast(3).map { androidAttribute(it, "key") },
        )
    }

    @Test
    fun `morphe sanitized 1803 version key remains the exact insertion anchor`() {
        val sanitized = String(readFixture(), StandardCharsets.UTF_8)
            .replace(ABOUT_VERSION_KEY_REF, ABOUT_VERSION_SANITIZED_KEY_REF)
        val document = parse(sanitized.toByteArray(StandardCharsets.UTF_8))

        applyGboardAboutPagePatch(document)

        val children = document.documentElement.childElements().toList()
        assertEquals(6, children.size)
        assertEquals(ABOUT_VERSION_SANITIZED_KEY_REF, androidAttribute(children[3], "key"))
        assertEquals("gboard_about_author", androidAttribute(children[4], "key"))
        assertEquals("gboard_about_patch_version", androidAttribute(children[5], "key"))
    }

    private fun assertAboutRow(
        element: Element,
        key: String,
        title: String,
        summary: String,
        intentUrl: String,
    ) {
        assertEquals(ABOUT_PREFERENCE_CLASS, element.tagName)
        assertEquals(key, androidAttribute(element, "key"))
        assertEquals(title, androidAttribute(element, "title"))
        assertEquals(summary, androidAttribute(element, "summary"))
        assertEquals("false", androidAttribute(element, "persistent"))
        assertEquals("false", androidAttribute(element, "focusable"))
        assertEquals("true", androidAttribute(element, "selectable"))
        assertEquals("100", androidAttribute(element, "maxLines"))

        val intents = element.childElements("intent").toList()
        assertEquals(1, intents.size)
        assertEquals("android.intent.action.VIEW", androidAttribute(intents.single(), "action"))
        assertEquals(intentUrl, androidAttribute(intents.single(), "data"))
    }

    private fun parse(bytes: ByteArray): Document =
        DocumentBuilderFactory.newInstance().apply {
            isNamespaceAware = true
        }.newDocumentBuilder().parse(ByteArrayInputStream(bytes))

    private fun readFixture(): ByteArray =
        checkNotNull(javaClass.getResourceAsStream(FIXTURE)) {
            "Missing official Gboard 18.0.3 About fixture $FIXTURE"
        }.use { it.readBytes() }

    private fun androidAttribute(element: Element, localName: String): String? =
        element.getAttributeNS(ANDROID_NS, localName).takeIf { it.isNotBlank() }
            ?: element.getAttribute("android:$localName").takeIf { it.isNotBlank() }

    private fun sha256(bytes: ByteArray): String =
        MessageDigest.getInstance("SHA-256")
            .digest(bytes)
            .joinToString(separator = "") { byte -> "%02X".format(byte) }

    private fun normalizeLineEndings(bytes: ByteArray): ByteArray =
        String(bytes, StandardCharsets.UTF_8)
            .replace("\r\n", "\n")
            .toByteArray(StandardCharsets.UTF_8)

    private companion object {
        const val FIXTURE = "/gboard/18.0.3/about/setting_about.xml"
        const val FIXTURE_SHA256 =
            "11C2E56818575A4B0D28D5FBBE25FCA66549AFA678AA112F27239257A655BBFB"
        const val ABOUT_VERSION_KEY_REF = "@string/APKTOOL_RENAMED_0x7f140c23"
        const val ABOUT_VERSION_SANITIZED_KEY_REF = "@string/string_0x7f140c23"
        const val ABOUT_PREFERENCE_CLASS =
            "com.google.android.libraries.inputmethod.settings.widget.ExtendedPreference"
    }
}
