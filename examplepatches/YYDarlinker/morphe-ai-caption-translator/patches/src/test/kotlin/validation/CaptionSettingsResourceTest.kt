package validation

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.*
import kotlinx.coroutines.runBlocking
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.io.File
import java.util.zip.ZipFile
import javax.xml.parsers.DocumentBuilderFactory

/** Real decode -> bundled resource patch -> compile -> decode contracts, without a YouTube fixture. */
object CaptionSettingsResourceTest {
    private const val NETWORK = "android:networkSecurityConfig"
    private const val SCREEN = "morphe_vot_screen__ai_captions"

    private fun canonical(node: Node): String = when (node.nodeType) {
        Node.ELEMENT_NODE -> {
            val attrs = node.attributes
            val attributes = (0 until attrs.length).map { attrs.item(it) }
                .sortedBy { it.nodeName }.joinToString { "${it.nodeName}=${it.nodeValue}" }
            "<${node.nodeName} $attributes>" + (0 until node.childNodes.length)
                .joinToString("") { canonical(node.childNodes.item(it)) } + "</${node.nodeName}>"
        }
        Node.TEXT_NODE -> node.textContent.trim()
        else -> ""
    }

    private fun bindings(screen: Element): Map<String, Pair<String, String>> {
        val nodes = screen.getElementsByTagName("*")
        val rows = (0 until nodes.length).map { nodes.item(it) as Element }
        val byKey = rows.associate {
            val key = it.getAttribute("android:key")
            check(key.isNotEmpty()) { "Missing preference key: ${it.tagName}" }
            key to (it.tagName to it.getAttribute("android:title"))
        }
        check(rows.size == byKey.size) { "Duplicate settings keys" }
        return byKey
    }

    private val inflatedFixture by lazy {
        val file = File("extensions/extension/src/test/res/xml/caption_settings_fixture.xml")
        val doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(file)
        bindings(doc.documentElement)
    }

    private data class Snapshot(val manifest: String, val network: String?, val reference: String, val rows: Int,
                                val hostPages: Map<String, String>)

    private fun snapshot(output: File): Snapshot {
        output.mkdirs()
        var reference = ""
        val manifest = document("AndroidManifest.xml").use { doc ->
            reference = (doc.getElementsByTagName("application").item(0) as Element).getAttribute(NETWORK)
            canonical(doc.documentElement)
        }
        resourceFile("AndroidManifest.xml").copyTo(output.resolve("AndroidManifest.xml"))
        val network = if (reference.startsWith("@xml/")) {
            val path = "res/xml/${reference.removePrefix("@xml/")}.xml"
            val content = document(path).use { canonical(it.documentElement) }
            resourceFile(path).copyTo(output.resolve("network-security.xml"))
            content
        } else null
        var rows = 0
        val hostPages = mutableMapOf<String, String>()
        val pages = listDecodableFiles("res/xml/*").filter {
            File(it).nameWithoutExtension in listOf("settings_fragment", "settings_fragment_cairo",
                "morphe_prefs", "morphe_prefs_icons", "morphe_prefs_icons_bold")
        }
        check(pages.isNotEmpty())
        for (path in pages) {
            document(path).use { doc ->
                val nodes = doc.getElementsByTagName("*")
                val elements = (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }
                val screens = elements.filter { it.getAttribute("android:key") == SCREEN }
                if (screens.isNotEmpty()) {
                    check(screens.size == 1)
                    val screen = screens.single()
                    check(screen.getAttribute("android:title") == "@string/cap_ai_title")
                    check(screen.getAttribute("android:summary") == "@string/cap_ai_summary")
                    check(screen.getAttribute("android:singleLineTitle") == "false")
                    (0 until screen.childNodes.length).mapNotNull { screen.childNodes.item(it) as? Element }
                        .forEach { check(it.getAttribute("android:iconSpaceReserved") == "false") }
                    val keys = elements.map { it.getAttribute("android:key") }
                    check(keys.count { it == "ai_caption_enabled" } == 1)
                    check(keys.containsAll(listOf("ai_caption_profiles", "ai_caption_api_key",
                        "ai_caption_text_size", "ai_caption_diagnostics", "ai_caption_shorts_flyout_menu")))
                    if (path.contains("morphe_prefs")) {
                        check((screen.parentNode as Element).getAttribute("android:key").startsWith("morphe_settings_screen_12_video"))
                        var previous = screen.previousSibling
                        while (previous != null && previous !is Element) previous = previous.previousSibling
                        check((previous as Element).getAttribute("android:key") == "morphe_vot_screen")
                    }
                    val actual = bindings(screen)
                    check(actual == inflatedFixture) {
                        "Patched XML differs from the JVM inflation fixture: ${(actual.entries - inflatedFixture.entries)} / ${(inflatedFixture.entries - actual.entries)}"
                    }
                    rows++
                }
                val host = doc.documentElement.cloneNode(true) as Element
                val cloned = host.getElementsByTagName("*")
                val additions = (0 until cloned.length).mapNotNull { cloned.item(it) as? Element }
                    .filter { it.getAttribute("android:key") == SCREEN }
                additions.forEach { it.parentNode.removeChild(it) }
                hostPages[path] = canonical(host)
            }
            resourceFile(path).copyTo(output.resolve(File(path).name))
        }
        return Snapshot(manifest, network, reference, rows, hostPages)
    }

    private fun read(apk: File, output: File): Snapshot {
        var result: Snapshot? = null
        val probe = patch { execute { result = snapshot(output.resolve("decoded")) } }
        Patcher(PatcherConfig(apkFile = apk, temporaryFilesPath = output.resolve("session"))).use { patcher ->
            patcher += setOf(probe)
            runBlocking { patcher().collect { check(it.exception == null) { it.exception.toString() } } }
        }
        return checkNotNull(result)
    }

    @JvmStatic fun main(args: Array<String>) {
        val values = args.toList().chunked(2).associate { it[0].removePrefix("--") to it[1] }
        val input = File(values.getValue("input")).canonicalFile
        val addon = File(values.getValue("addon")).canonicalFile
        val output = File(values.getValue("output")).canonicalFile
        check(!output.exists()) { "Preserve prior evidence" }; output.mkdirs()
        val before = read(input, output.resolve("before"))
        if (values.getValue("expect") == "snapshot") {
            output.resolve("result.txt").writeText("SNAPSHOT\nnetwork=${before.reference}\nsettings_pages=${before.rows}\n")
            println("CAPTION_RESOURCE_SNAPSHOT ${input.name} network=${before.reference} pages=${before.rows}")
            return
        }
        val patches = loadPatchesFromJar(setOf(addon)).byPatchesFile.getValue(addon)
        val all = patches.toMutableSet()
        val pending = ArrayDeque(patches)
        while (pending.isNotEmpty()) {
            pending.removeFirst().dependencies.forEach { if (all.add(it)) pending.add(it) }
        }
        val settings = all.single { it.description == "Adds the AI caption screen to the settings of Morphe." }
        val patched = output.resolve("patched-unsigned.apk")
        Patcher(PatcherConfig(apkFile = input, temporaryFilesPath = output.resolve("patch-session"))).use { patcher ->
            patcher += setOf(settings)
            runBlocking { patcher().collect { check(it.exception == null) { it.exception.toString() } } }
            patcher.writeApk(patched)
        }
        val after = read(patched, output.resolve("after"))
        check(before.rows == 0 && after.rows > 0) { "Settings screen not added" }
        check(before.hostPages == after.hostPages) { "Existing settings rows changed" }
        ZipFile(input).use { original -> ZipFile(patched).use { result ->
            original.entries().asSequence().filter { it.name.startsWith("res/raw/") }.forEach { entry ->
                check(original.getInputStream(entry).readBytes().contentEquals(
                    result.getInputStream(checkNotNull(result.getEntry(entry.name))).readBytes())) { "Certificate bytes changed" }
            }
        } }
        if (values.getValue("expect") == "preserved") {
            check(before.manifest == after.manifest) { "Host manifest policy changed" }
            check(before.network == after.network) { "Host network policy changed" }
            ZipFile(patched).use { zip -> check(zip.getEntry("res/xml/ai_caption_network_security.xml") == null) }
        } else {
            check(values.getValue("expect") == "legacy")
            check(after.network?.contains("127.0.0.1") == true)
            check(before.network != after.network) { "Legacy positive control did not mutate policy" }
        }
        output.resolve("result.txt").writeText("PASS\nnetwork_before=${before.reference}\nnetwork_after=${after.reference}\nsettings_pages=${after.rows}\nexpect=${values.getValue("expect")}\n")
        println("CAPTION_SETTINGS_RESOURCE_PASS ${input.name} ${values.getValue("expect")} pages=${after.rows}")
    }
}
