/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.maps

import app.morphe.Fixtures
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import com.reandroid.apk.ApkModule
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node
import org.xmlpull.v1.XmlPullParserFactory
import java.io.File
import java.io.StringWriter
import javax.xml.parsers.DocumentBuilderFactory

/** Runs the actual optional resource patch and holds every other manifest attribute to the original. */
class UseRegisteredMapsApiKeyFixtureTest {
    @Rule
    @JvmField
    val temporary = TemporaryFolder()

    @Test
    fun `Maps key patch and its input are optional`() {
        assertFalse(useRegisteredMapsApiKeyPatch.default)
        assertEquals(setOf("apiKey"), useRegisteredMapsApiKeyPatch.options.keys)
        assertFalse(useRegisteredMapsApiKeyPatch.options["apiKey"].required)
        assertNull(useRegisteredMapsApiKeyPatch.options["apiKey"].default)
    }

    @Test
    fun `every declared fixture changes only the installed SDK key literal`() {
        for (build in Fixtures.declaredBuilds()) withManifest(fixtureManifest(build)) { context, file ->
            val original = parse(file)
            val stock = resolveMapsApiKey(original)
            assertEquals("com.google.android.maps.v2.API_KEY", stock.getAttribute("android:name"))
            val before = state(original.documentElement, stock)
            withOption(KEY) { useRegisteredMapsApiKeyPatch.execute(context) }
            val result = parse(file)
            val key = resolveMapsApiKey(result)
            assertEquals(KEY, key.getAttribute("android:value"))
            assertEquals("${build.name}: all other attributes and elements survive", before, state(result.documentElement, key))
        }
    }

    @Test
    fun `unset option leaves fixture manifest bytes untouched`() {
        for (build in Fixtures.declaredBuilds()) withManifest(fixtureManifest(build)) { context, file ->
            val before = file.readBytes()
            withOption(null) { useRegisteredMapsApiKeyPatch.execute(context) }
            assertArrayEquals(before, file.readBytes())
        }
        withManifest(null) { context, file ->
            assertFalse(file.exists())
            withOption(null) { useRegisteredMapsApiKeyPatch.execute(context) }
            assertFalse(file.exists())
        }
    }

    @Test
    fun `both documented SDK metadata names accept exactly one direct literal`() {
        for (name in MAPS_KEY_NAMES) withManifest(manifest(metadata(name))) { context, file ->
            withOption(KEY) { useRegisteredMapsApiKeyPatch.execute(context) }
            val target = resolveMapsApiKey(parse(file))
            assertEquals(name, target.getAttribute("android:name"))
            assertEquals(KEY, target.getAttribute("android:value"))
        }
    }

    @Test
    fun `invalid options refuse before opening resources and never echo key inputs`() {
        for (key in listOf("", "secret", KEY.dropLast(1), KEY + "x", "AIzax" + "?".repeat(34))) {
            withManifest(null) { context, file ->
                withOption(key) {
                    try {
                        useRegisteredMapsApiKeyPatch.execute(context)
                        fail("invalid key option accepted")
                    } catch (expected: PatchException) {
                        assertTrue(expected.message.orEmpty().contains("apiKey"))
                        if (key.isNotEmpty()) assertFalse(expected.message.orEmpty().contains(key))
                    }
                }
                assertFalse(file.exists())
            }
        }
    }

    @Test
    fun `missing duplicate and mixed metadata refuse without changing manifest bytes`() {
        for (body in listOf("", metadata() + metadata(), metadata() + metadata("com.google.android.geo.API_KEY")))
            refusal(manifest(body))
    }

    @Test
    fun `resource references malformed keys and wrong metadata owners refuse without file edits`() {
        refusal(manifest(metadata(value = "@string/google_maps_key")))
        refusal(manifest(metadata(value = "invalid")))
        refusal(manifest(metadata(extra = "android:resource=\"@string/key\"")))
        refusal(manifest("<activity android:name=\"example\">${metadata()}</activity>"))
        refusal("<manifest xmlns:android=\"$ANDROID_NAMESPACE\">${metadata()}<application /></manifest>")
    }

    @Test
    fun `wrong namespace and ambiguous applications refuse without file edits`() {
        refusal(manifest(metadata()).replace(ANDROID_NAMESPACE, "https://example.invalid/android"))
        refusal(manifest(metadata()).replace("</manifest>", "<application /></manifest>"))
        refusal("<manifest xmlns:android=\"$ANDROID_NAMESPACE\">${metadata()}</manifest>")
    }

    private fun refusal(xml: String) = withManifest(xml) { context, file ->
        val before = file.readBytes()
        withOption(KEY) {
            try {
                useRegisteredMapsApiKeyPatch.execute(context)
                fail("incompatible Maps metadata accepted")
            } catch (expected: PatchException) {
                assertFalse(expected.message.orEmpty().contains(KEY))
            }
        }
        assertArrayEquals("refusal does not even rewrite manifest formatting", before, file.readBytes())
    }

    private fun fixtureManifest(build: File): String = ApkModule.loadApkFile(build).use { module ->
        module.tableBlock // Attach the resource package required by the manifest decoder.
        val xml = StringWriter()
        val serializer = XmlPullParserFactory.newInstance().newSerializer().apply { setOutput(xml) }
        module.androidManifest.serialize(serializer)
        xml.toString()
    }

    private fun withManifest(xml: String?, action: (ResourcePatchContext, File) -> Unit) {
        val work = temporary.newFolder()
        val apk = File(work, "input.apk")
        ApkModule().use { module ->
            module.setManifest(AndroidManifestBlock.empty().apply {
                setPackageName("org.telegram.messenger.web")
                setVersionName("12.10.6")
                setVersionCode(71129)
            })
            module.writeApk(apk)
        }
        val config = PatcherConfig(apkFile = apk, temporaryFilesPath = File(work, "patcher"))
        ResourcePatchContext::class.java.getConstructor(PatcherConfig::class.java).newInstance(config).use { context ->
            val file = context["AndroidManifest.xml"]
            if (xml != null) {
                file.parentFile.mkdirs()
                file.writeText(xml)
            }
            action(context, file)
        }
    }
    private fun withOption(key: String?, action: () -> Unit) {
        useRegisteredMapsApiKeyPatch.options["apiKey"] = key
        try { action() } finally { useRegisteredMapsApiKeyPatch.options.values.forEach { it.reset() } }
    }
    private fun parse(file: File): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(file)
    private fun manifest(body: String) = "<manifest xmlns:android=\"$ANDROID_NAMESPACE\" package=\"org.telegram.messenger.web\">" +
        "<uses-sdk android:minSdkVersion=\"28\" /><application android:label=\"Telegram\">$body</application></manifest>"
    private fun metadata(name: String = "com.google.android.maps.v2.API_KEY", value: String = STOCK, extra: String = "") =
        "<meta-data android:name=\"$name\" android:value=\"$value\" $extra />"
    private fun state(node: Node, key: Element): List<Any?> {
        val attributes = (0 until (node.attributes?.length ?: 0)).map { node.attributes.item(it) }
            .map { it.nodeName to if (node === key && it.nodeName == "android:value") "<maps-key>" else it.nodeValue.hashCode() }
            .sortedBy { it.first }
        val children = (0 until node.childNodes.length).map { node.childNodes.item(it) }.filter { it.nodeType == Node.ELEMENT_NODE }
        return listOf(node.nodeName, attributes, children.map { state(it, key) })
    }
    private companion object {
        val KEY = "AIza" + "0".repeat(35)
        val STOCK = "AIza" + "1".repeat(35)
    }
}
