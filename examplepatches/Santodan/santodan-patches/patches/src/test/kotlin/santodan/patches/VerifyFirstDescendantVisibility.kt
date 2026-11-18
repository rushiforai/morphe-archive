package santodan.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import java.io.File
import java.util.zip.ZipFile
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.xpath.XPathConstants
import javax.xml.xpath.XPathFactory
import org.w3c.dom.Document
import org.w3c.dom.Element
import kotlinx.coroutines.runBlocking

/** Real-manifest mutation checks plus packaged resource compilation/reload. */
fun main(args: Array<String>) = runBlocking {
    val output = File(args[2]).apply { mkdirs() }
    val base = File(output, "original-base.apk")
    ZipFile(args[0]).use { zip ->
        zip.getInputStream(zip.getEntry("base.apk")).use { input -> base.outputStream().use { input.copyTo(it) } }
    }
    val workspace = File(args[3])
    fun printManifest(apk: File): String {
        val process = ProcessBuilder(
            File(workspace, "jdk-21.0.2/bin/java.exe").absolutePath,
            "-Dcom.android.sdklib.toolsdir=${File(workspace, "SDK/cmdline-tools/latest").absolutePath}",
            "-classpath", File(workspace, ".android-sdk/cmdline-tools/lib/apkanalyzer-classpath.jar").absolutePath,
            "com.android.tools.apk.analyzer.ApkAnalyzerCli", "manifest", "print", apk.absolutePath
        ).redirectError(File(output, "manifest-tool-errors.log")).start()
        val text = process.inputStream.bufferedReader().use { it.readText() }
        check(process.waitFor() == 0) { "Failed to decode compiled manifest" }
        return text
    }
    fun parse(text: String): Document = DocumentBuilderFactory.newInstance().apply {
        isNamespaceAware = true
        setFeature("http://apache.org/xml/features/disallow-doctype-decl", true)
    }.newDocumentBuilder().parse(text.byteInputStream())
    fun signature(element: Element): String {
        val attributes = (0 until element.attributes.length).map { element.attributes.item(it) }
            .map { "${it.nodeName}=${it.nodeValue}" }.sorted().joinToString("|")
        val children = (0 until element.childNodes.length).mapNotNull { element.childNodes.item(it) as? Element }
        return "${element.tagName}[$attributes]{${children.joinToString("") { signature(it) }}}"
    }
    val originalText = printManifest(base)
    File(output, "original-manifest.xml").writeText(originalText)
    val expected = parse(originalText)
    val xpath = XPathFactory.newInstance().newXPath()
    // Independent structural expectation: remove exactly the two unconstrained
    // intent queries; all other XML structure/attributes must survive unchanged.
    val nodes = xpath.evaluate("/manifest/queries/intent[count(*)=1 and action]", expected,
        XPathConstants.NODESET) as org.w3c.dom.NodeList
    val removed = (0 until nodes.length).map { nodes.item(it) as Element }.filter {
        it.getElementsByTagName("action").item(0).attributes.getNamedItem("android:name").nodeValue in
            setOf("android.intent.action.MAIN", "android.intent.action.VIEW")
    }
    check(removed.size == 2)
    removed.forEach { it.parentNode.removeChild(it) }
    val fixture = parse(originalText)
    restrictFirstDescendantVisibility(fixture, experimental = args.getOrNull(4) == "experimental")
    check(signature(fixture.documentElement) == signature(expected.documentElement))
    fun reject(document: Document) {
        val before = signature(document.documentElement)
        var rejected = false
        try { restrictFirstDescendantVisibility(document, experimental = args.getOrNull(4) == "experimental") } catch (_: IllegalStateException) { rejected = true }
        check(rejected)
        check(signature(document.documentElement) == before) { "Invalid input was partially mutated" }
    }
    reject(fixture)
    val changed = parse(originalText)
    changed.documentElement.setAttribute("package", "com.nexon.tfdc.morphe")
    reject(changed)
    val ambiguous = parse(originalText)
    val queries = ambiguous.getElementsByTagName("queries").item(0)
    val main = (0 until queries.childNodes.length).mapNotNull { queries.childNodes.item(it) as? Element }
        .first { it.tagName == "intent" && signature(it).contains("android.intent.action.MAIN") }
    queries.appendChild(main.cloneNode(true))
    reject(ambiguous)
    val changedVersion = parse(originalText)
    changedVersion.documentElement.setAttributeNS("http://schemas.android.com/apk/res/android", "android:versionName", "99.0.0")
    if (args.getOrNull(4) == "experimental") restrictFirstDescendantVisibility(changedVersion, true)
    else reject(changedVersion)
    val bypass = parse(originalText)
    val permission = bypass.createElement("uses-permission")
    permission.setAttributeNS("http://schemas.android.com/apk/res/android", "android:name", "android.permission.QUERY_ALL_PACKAGES")
    bypass.documentElement.appendChild(permission)
    reject(bypass)
    val selected = loadPatchesFromJar(setOf(File(args[1]))).filter { it.name == if (args.getOrNull(4) == "experimental") TFD_VISIBILITY_EXPERIMENTAL_NAME else TFD_VISIBILITY_NAME }.toSet()
    check(selected.size == 1)
    val experimental = args.getOrNull(4) == "experimental"
    val compatibility = selected.single().compatibility!!.single()
    check(compatibility.packageName == FirstDescendantCompatibility.PACKAGE)
    if (experimental) check(compatibility.targets.single().version == null)
    else check(compatibility.targets.map { it.version }.toSet() == setOf("1.1.5", "1.1.6"))
    check(compatibility.targets.all { it.isExperimental == experimental })
    Patcher(PatcherConfig(apkFile = base, temporaryFilesPath = File(output, "work-${System.nanoTime()}"))).use { patcher ->
        patcher += selected
        patcher().collect { it.exception?.let { error -> throw error } }
        val result = patcher.get()
        check(result.dexFiles.isEmpty()) { "Visibility patch unexpectedly changed DEX" }
        val resourceApk = requireNotNull(requireNotNull(result.resources).resourcesApk)
        val compiledText = printManifest(resourceApk)
        File(output, "patched-manifest.xml").writeText(compiledText)
        val compiled = parse(compiledText)
        for (tag in listOf("queries", "application")) {
            check(signature(compiled.getElementsByTagName(tag).item(0) as Element) ==
                signature(expected.getElementsByTagName(tag).item(0) as Element)) {
                "Compiled manifest changed unexpected $tag structure"
            }
        }
        check(compiled.documentElement.getAttribute("package") == FirstDescendantCompatibility.PACKAGE)
        check(result.resources!!.deleteResources.isEmpty())
    }
    println("PASS: original ${parse(originalText).documentElement.getAttributeNS("http://schemas.android.com/apk/res/android", "versionName")} manifest; exactly two broad queries removed; package/integrations retained; invalid inputs rejected; packaged manifest compiled/reloaded; no DEX edits")
}
