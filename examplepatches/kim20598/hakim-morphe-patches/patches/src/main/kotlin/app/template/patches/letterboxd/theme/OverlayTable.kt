/*
 * The .arsc overlay-encoding technique in buildColorOverlay() is adapted from Piko
 * (https://github.com/crimera/piko), licensed under GPLv3 with additional Section 7 terms.
 * See the included NOTICE file for the credit this project owes under those terms.
 */

package app.template.patches.letterboxd.theme

import com.reandroid.apk.xmlencoder.XMLTableBlockEncoder
import com.reandroid.arsc.base.Block
import java.io.File
import java.nio.file.Files
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.OutputKeys
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import org.w3c.dom.Element

private data class PublicName(val type: String, val name: String)

/** `@color/foo` / `?attr/foo` with no package prefix — framework refs (`@android:...`) are skipped. */
private val LOCAL_REF = Regex("""[@?]([A-Za-z_]\w*)/([A-Za-z0-9_.]+)""")

/**
 * Compiles a standalone runtime resource-overlay `.arsc` that remaps [colors] (name -> ARGB, or a
 * local `@color/...` reference) for [packageName]. The target app's [sourceManifest] and
 * [sourcePublic] are used so the overlay's resource IDs line up with the app's own.
 *
 * Layout mirrors piko's proven encoder input: `resources/<pkg>/res/values-v31|values-night-v31`.
 */
internal fun buildColorOverlay(
    sourceManifest: File,
    sourcePublic: File,
    packageName: String,
    outputFile: File,
    colors: Map<String, String>,
): File {
    require(sourceManifest.isFile) { "overlay: missing AndroidManifest.xml" }
    require(sourcePublic.isFile) { "overlay: missing res/values/public.xml" }
    require(packageName.isNotBlank()) { "overlay: blank package name" }
    require(colors.isNotEmpty()) { "overlay: no colors" }

    val work = Files.createTempDirectory("morphe-overlay").toFile()
    try {
        sourceManifest.copyTo(work.resolve("AndroidManifest.xml"), overwrite = true)

        val packageDir = work.resolve("resources/$packageName")
        val valuesDir = packageDir.resolve("res/values")
        valuesDir.mkdirs()

        writePublicSubset(sourcePublic, valuesDir.resolve("public.xml"), colors)
        writeColorsXml(packageDir.resolve("res/values-v31/colors.xml"), colors)
        writeColorsXml(packageDir.resolve("res/values-night-v31/colors.xml"), colors)

        val encoder = XMLTableBlockEncoder()
        encoder.scanMainDirectory(work)

        outputFile.parentFile.mkdirs()
        val tableBlock: Block = encoder.tableBlock
        outputFile.outputStream().use { tableBlock.writeBytes(it) }
        check(outputFile.isFile && outputFile.length() > 0L) { "overlay: encoder produced no bytes" }
        return outputFile
    } finally {
        work.deleteRecursively()
    }
}

private fun writeColorsXml(output: File, colors: Map<String, String>) {
    output.parentFile.mkdirs()
    val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument()
    val resources = document.createElement("resources")
    document.appendChild(resources)
    colors.forEach { (name, value) ->
        resources.appendChild(
            document.createElement("color").apply {
                setAttribute("name", name)
                textContent = value
            },
        )
    }
    write(document, output)
}

private fun writePublicSubset(source: File, output: File, colors: Map<String, String>) {
    val factory = DocumentBuilderFactory.newInstance()
    val sourceDocument = factory.newDocumentBuilder().parse(source)
    val sourceRoot = sourceDocument.documentElement

    val required = mutableSetOf<PublicName>()
    colors.keys.forEach { required += PublicName("color", it) }
    colors.values.forEach { value ->
        LOCAL_REF.findAll(value).forEach { match ->
            required += PublicName(match.groupValues[1], match.groupValues[2])
        }
    }

    val publicNodes = sourceDocument.getElementsByTagName("public")
    val byName = buildMap {
        for (index in 0 until publicNodes.length) {
            val element = publicNodes.item(index) as Element
            put(PublicName(element.getAttribute("type"), element.getAttribute("name")), element)
        }
    }
    val missing = required - byName.keys
    require(missing.isEmpty()) {
        "overlay: no public resource id for ${missing.sortedBy { "${it.type}/${it.name}" }}"
    }

    val outputDocument = factory.newDocumentBuilder().newDocument()
    val outputRoot = outputDocument.createElement("resources").apply {
        setAttribute("package", sourceRoot.getAttribute("package"))
        setAttribute("id", sourceRoot.getAttribute("id"))
    }
    outputDocument.appendChild(outputRoot)
    required
        .mapNotNull { byName[it] }
        .sortedBy { it.getAttribute("id").removePrefix("0x").toLong(16) }
        .forEach { outputRoot.appendChild(outputDocument.importNode(it, true)) }

    write(outputDocument, output)
}

private fun write(document: org.w3c.dom.Document, output: File) {
    output.parentFile.mkdirs()
    TransformerFactory.newInstance().newTransformer().apply {
        setOutputProperty(OutputKeys.INDENT, "yes")
        transform(DOMSource(document), StreamResult(output))
    }
}
