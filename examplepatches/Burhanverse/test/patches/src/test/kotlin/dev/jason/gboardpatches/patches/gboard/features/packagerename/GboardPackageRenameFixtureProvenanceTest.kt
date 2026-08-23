package dev.jason.gboardpatches.patches.gboard.features.packagerename

import com.google.gson.JsonParser
import java.io.ByteArrayInputStream
import java.nio.charset.StandardCharsets
import java.security.MessageDigest
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Element

class GboardPackageRenameFixtureProvenanceTest {
    @Test
    fun `fixture pins exact apk decoded manifest and normalization hashes`() {
        val provenance = JsonParser.parseString(readText(PROVENANCE_FIXTURE)).asJsonObject

        assertEquals(SOURCE_PACKAGE, provenance.get("targetPackage").asString)
        assertEquals(TARGET_VERSION, provenance.get("targetVersion").asString)
        assertEquals(TARGET_APK_SHA256, provenance.get("targetApkSha256").asString)
        assertEquals(DECODED_MANIFEST_SHA256, provenance.get("decodedManifestSha256").asString)
        assertEquals(MANIFEST_FIXTURE_SHA256, provenance.get("manifestFixtureSha256").asString)
        assertEquals(15, provenance.get("selectedManifestAttributeCount").asInt)
        assertEquals(
            "UTF-8 without BOM; CRLF normalized to LF; XML content otherwise verbatim",
            provenance.get("manifestFixtureNormalization").asString,
        )
        assertEquals(
            MANIFEST_FIXTURE_SHA256,
            sha256(normalizeLineEndings(readBytes(MANIFEST_FIXTURE))),
        )
    }

    @Test
    fun `normalized target manifest independently contains exactly fifteen stock package attributes`() {
        val manifestBytes = readBytes(MANIFEST_FIXTURE)
        assertFalse(
            manifestBytes.size >= 3 &&
                manifestBytes[0] == 0xEF.toByte() &&
                manifestBytes[1] == 0xBB.toByte() &&
                manifestBytes[2] == 0xBF.toByte(),
        )
        val manifest = DocumentBuilderFactory.newInstance().apply {
            isNamespaceAware = true
        }.newDocumentBuilder().parse(ByteArrayInputStream(manifestBytes))
        val selected = manifest.getElementsByTagName("*").asList()
            .filterIsInstance<Element>()
            .flatMap { element -> element.attributes.asList().map { element to it } }
            .filter { (_, attribute) -> attribute.nodeValue.contains(SOURCE_PACKAGE) }

        assertEquals(15, selected.size)
        assertEquals(SOURCE_PACKAGE, manifest.documentElement.getAttribute("package"))
        assertTrue(selected.any { (element, attribute) ->
            element.tagName == "manifest" &&
                attribute.nodeName == "package" &&
                attribute.nodeValue == SOURCE_PACKAGE
        })
    }

    @Test
    fun `retained literal evidence pins all three decoded resource sources`() {
        val provenance = JsonParser.parseString(readText(PROVENANCE_FIXTURE)).asJsonObject
        val resources = provenance.getAsJsonArray("resourceSources").map { it.asJsonObject }
            .associate { resource ->
                resource.get("path").asString to resource.get("sha256").asString
            }

        assertEquals(
            mapOf(
                "res/values/arrays.xml" to
                    "6FF58A0069D315CC1CD926A7216B25ABC68AD97442DCE8546A8AC54CD848A14E",
                "res/values/strings.xml" to
                    "449FB31BB55270812E2EA5FCD00AC0D93BDC632948D4F09AA69322A1D69BEF38",
                "res/xml/APKTOOL_RENAMED_0x7f170033.xml" to
                    "6637D8037933B4BBDA35719F72DAF1181F0B5BB5BCD5F2AAD33B670CF3FA0CB0",
            ),
            resources,
        )
        val literals = readText(RETAINED_LITERALS_FIXTURE)
        assertEquals(4, Regex(Regex.escape(SOURCE_PACKAGE)).findAll(literals).count())
        assertTrue(literals.contains("market://details?id=$SOURCE_PACKAGE"))
        assertTrue(literals.contains("http://play.google.com/store/apps/details?id=$SOURCE_PACKAGE"))
        assertTrue(literals.contains("phenotype-configuration-package"))
    }

    private fun readText(path: String): String =
        String(readBytes(path), StandardCharsets.UTF_8)

    private fun readBytes(path: String): ByteArray =
        checkNotNull(javaClass.getResourceAsStream(path)) {
            "Missing fixture $path"
        }.use { it.readBytes() }

    private fun sha256(bytes: ByteArray): String =
        MessageDigest.getInstance("SHA-256")
            .digest(bytes)
            .joinToString(separator = "") { byte -> "%02X".format(byte) }

    private fun normalizeLineEndings(bytes: ByteArray): ByteArray =
        String(bytes, StandardCharsets.UTF_8)
            .replace("\r\n", "\n")
            .toByteArray(StandardCharsets.UTF_8)

    private fun org.w3c.dom.NamedNodeMap.asList(): List<org.w3c.dom.Node> =
        (0 until length).map(::item)

    private fun org.w3c.dom.NodeList.asList(): List<org.w3c.dom.Node> =
        (0 until length).map(::item)

    private companion object {
        const val SOURCE_PACKAGE = "com.google.android.inputmethod.latin"
        const val TARGET_VERSION = "17.7.7.932364120-release-arm64-v8a"
        const val TARGET_APK_SHA256 =
            "549680C31A0ADCDC324FA7B8AB2EEACC108A312E9F2FEF1D956F5FC2D56C3FF9"
        const val DECODED_MANIFEST_SHA256 =
            "C5F279BA3B46A101E72AF7725983013023282B1C196F2BF193174097B3A2BB1E"
        const val MANIFEST_FIXTURE_SHA256 =
            "F9288448C6035764BBB0BE3C279AA725DB7551CF2124F43EB3D0B9E97B84CC1E"
        const val PROVENANCE_FIXTURE =
            "/gboard/17.7.7/package-rename/provenance.json"
        const val MANIFEST_FIXTURE =
            "/gboard/17.7.7/package-rename/AndroidManifest.normalized.xml"
        const val RETAINED_LITERALS_FIXTURE =
            "/gboard/17.7.7/package-rename/retained-resource-literals.xml"
    }
}
