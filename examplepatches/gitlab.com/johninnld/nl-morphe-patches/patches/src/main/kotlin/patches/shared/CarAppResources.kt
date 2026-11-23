package patches.shared

import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.io.ByteArrayInputStream
import java.util.zip.ZipInputStream
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult

internal const val CAR_APP_ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val CAR_API_RESOURCE = "car-app-api.level"

/** Destination of an extension resource inside the target APK, namespaced with [prefix]. */
internal fun carResourceDestination(prefix: String, path: String): String {
    require(path.startsWith("res/") && ".." !in path)
    val folder = path.substringAfter("res/").substringBefore('/')
    val filename = path.substringAfterLast('/')
    // The encoder accepts singular typed names too. Keep imported declarations separate
    // so decoding/re-encoding the app's plural files cannot narrow ANY masks or alter text.
    val typedFile = if (filename.endsWith("s.xml") && filename != "plurals.xml")
        filename.removeSuffix("s.xml") + ".xml" else filename
    return if (folder.startsWith("values")) "res/$folder/$typedFile"
        else "res/$folder/$prefix$filename"
}

/** Apktool writes `format`; Morphe's resource encoder requires `formats` to create
 * an attribute bag. Without it scalar attributes silently become empty strings. */
internal fun carPrepareAttribute(label: String, node: Element, names: Map<Pair<String, String>, String>) {
    require(node.tagName == "attr")
    if (node.hasAttribute("format")) {
        val formats = node.getAttribute("format")
        check(!node.hasAttribute("formats") ||
            node.getAttribute("formats").split('|').map(String::trim).toSet() ==
            formats.split('|').map(String::trim).toSet()) { "Conflicting $label attribute formats" }
        node.setAttribute("formats", formats.split('|').joinToString("|") {
            if (it.trim() == "boolean") "bool" else it.trim()
        })
        node.removeAttribute("format")
    }
    for (index in 0 until node.childNodes.length) {
        val member = node.childNodes.item(index) as? Element ?: continue
        if (member.tagName == "enum" || member.tagName == "flag") {
            // Enum/flag member names are ID resources, not attribute resources.
            names["id" to member.getAttribute("name")]?.let { member.setAttribute("name", it) }
        }
    }
}

internal fun carRewriteReferences(text: String, names: Map<Pair<String, String>, String>): String {
    // Apktool allows ?android:name and ?name; the native encoder otherwise treats
    // those shorthand theme references as strings instead of typed attributes.
    val expanded = Regex("\\?(android:)?([A-Za-z_][A-Za-z0-9_]*)(?![A-Za-z0-9_:/])")
        .replace(text) { "?${it.groupValues[1]}attr/${it.groupValues[2]}" }
    return Regex("([@?]\\+?)([A-Za-z0-9_]+/[A-Za-z0-9_.]+)").replace(expanded) { match ->
        val (type, name) = match.groupValues[2].split('/', limit = 2)
        names[type to name]?.let { "${match.groupValues[1]}$type/$it" } ?: match.value
    }
}

internal fun carRewriteDocumentReferences(node: Node, names: Map<Pair<String, String>, String>) {
    // Rewrite parsed values only; processing instructions/declarations are never values.
    if (node is Element) {
        for (index in 0 until node.attributes.length) {
            val attribute = node.attributes.item(index)
            if (attribute.namespaceURI != "http://www.w3.org/2000/xmlns/") {
                attribute.nodeValue = carRewriteReferences(attribute.nodeValue, names)
            }
        }
    } else if (node.nodeType == Node.TEXT_NODE || node.nodeType == Node.CDATA_SECTION_NODE) {
        node.nodeValue = carRewriteReferences(node.nodeValue, names)
    }
    for (index in 0 until node.childNodes.length) carRewriteDocumentReferences(node.childNodes.item(index), names)
}

/**
 * Links the independently compiled Car App Library resources (packaged by an extension
 * module's `package_resources.py`) into a target app without replacing any of its own
 * resources.
 *
 * @param label app name used in failure messages.
 * @param prefix resource-name prefix that keeps the extension's resources apart.
 * @param archive classpath location of the packaged `resources.zip`.
 * @param themeStyle fully prefixed name of the car theme style that receives [themeColors].
 * @param themeColors the four host theme attributes (public contract) and their colours.
 */
internal class CarAppResources(
    private val label: String,
    private val prefix: String,
    private val archive: String,
    private val themeStyle: String,
    private val themeColors: Map<String, String>,
) {
    val ids = linkedMapOf<Int, Int>()

    fun link(context: ResourcePatchContext) = with(context) {
        ids.clear()
        val entries = linkedMapOf<String, ByteArray>()
        val source = checkNotNull(CarAppResources::class.java.getResourceAsStream(archive)) {
            "Build the $label Android Auto extension resource archive first"
        }
        ZipInputStream(source).use { zip ->
            var entry = zip.nextEntry
            while (entry != null) {
                require((entry.name.startsWith("res/") || entry.name == CAR_API_RESOURCE) && ".." !in entry.name)
                check(entry.name !in entries) { "Duplicate $label extension resource" }
                if (!entry.isDirectory) entries[entry.name] = zip.readBytes()
                entry = zip.nextEntry
            }
        }
        val carApi = checkNotNull(entries.remove(CAR_API_RESOURCE)) { "Pinned car classloader resource is missing" }
        check(carApi.contentEquals(byteArrayOf(0x39, 0x0a))) { "Pinned car API-level bytes changed" }
        // ResourcePatchContext maps non-res paths to APK-root files, not assets/ or unknown/.
        get(CAR_API_RESOURCE).apply {
            check(!exists() || readBytes().contentEquals(carApi)) { "Conflicting target car API-level resource" }
            parentFile.mkdirs()
            writeBytes(carApi)
        }
        val factory = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
        fun parse(bytes: ByteArray) = factory.newDocumentBuilder().parse(ByteArrayInputStream(bytes))
        val public = parse(checkNotNull(entries.remove("res/values/public.xml")))
        val nodes = public.getElementsByTagName("public")
        val resources = (0 until nodes.length).map { nodes.item(it) as Element }
        val names = resources.associate { (it.getAttribute("type") to it.getAttribute("name")) to
            (prefix + it.getAttribute("name")) }
        document("res/values/public.xml").use { target ->
            val existing = target.getElementsByTagName("public")
            val all = (0 until existing.length).map { existing.item(it) as Element }
            check(all.none { it.getAttribute("name").startsWith(prefix) }) { "$label API 9 resources already exist" }
            val last = all.groupBy { it.getAttribute("type") }.mapValues { (_, items) ->
                items.maxOf { it.getAttribute("id").removePrefix("0x").toLong(16) }
            }.toMutableMap()
            var nextType = (last.values.maxOf { (it ushr 16) and 0xff } + 1).toInt()
            for (resource in resources) {
                val type = resource.getAttribute("type")
                val old = resource.getAttribute("id").removePrefix("0x").toLong(16).toInt()
                val previous = last[type]
                val id = if (previous != null) previous + 1 else {
                    check(nextType < 256) { "No Android resource type IDs left" }
                    0x7f000000L or (nextType++.toLong() shl 16)
                }
                check(id and 0xffff != 0L || previous == null) { "Android resource entry IDs exhausted" }
                last[type] = id
                ids[old] = id.toInt()
                target.documentElement.appendChild(target.createElement("public").apply {
                    setAttribute("type", type)
                    setAttribute("name", names.getValue(type to resource.getAttribute("name")))
                    setAttribute("id", "0x${id.toString(16)}")
                })
            }
        }
        for ((path, bytes) in entries) {
            val folder = path.substringAfter("res/").substringBefore('/')
            // Singular typed files select the right TypeBlock without rewriting originals.
            val destination = carResourceDestination(prefix, path)
            val output = get(destination).apply { parentFile.mkdirs() }
            if (!path.endsWith(".xml")) { output.writeBytes(bytes); continue }
            val doc = parse(bytes)
            carRewriteDocumentReferences(doc, names)
            val elements = doc.getElementsByTagName("*")
            for (index in 0 until elements.length) {
                val node = elements.item(index) as Element
                val attributes = (0 until node.attributes.length).map { node.attributes.item(it) }
                for (attribute in attributes) {
                    if (attribute.namespaceURI?.startsWith("http://schemas.android.com/apk/res/") == true &&
                        attribute.namespaceURI != CAR_APP_ANDROID_NS) {
                        names["attr" to attribute.localName]?.let { name ->
                            doc.renameNode(attribute, "http://schemas.android.com/apk/res-auto", "${attribute.prefix}:$name")
                        }
                    }
                }
            }
            if (folder.startsWith("values")) {
                for (index in 0 until doc.documentElement.childNodes.length) {
                    val node = doc.documentElement.childNodes.item(index) as? Element ?: continue
                    if (node.tagName == "attr") carPrepareAttribute(label, node, names)
                    val name = node.getAttribute("name")
                    if (name.isNotEmpty()) {
                        // Dotted styles otherwise acquire an implicit parent after prefixing.
                        if (node.tagName == "style" && !node.hasAttribute("parent") && '.' in name) {
                            node.setAttribute("parent", "@style/${names["style" to name.substringBeforeLast('.')] ?: name.substringBeforeLast('.')}")
                        }
                        node.setAttribute("name", prefix + name)
                    }
                    val children = node.getElementsByTagName("item")
                    for (child in 0 until children.length) {
                        val item = children.item(child) as Element
                        val attr = item.getAttribute("name")
                        names["attr" to attr]?.let { item.setAttribute("name", it) }
                    }
                    if (node.tagName == "style" && node.hasAttribute("parent")) {
                        names["style" to node.getAttribute("parent")]?.let { node.setAttribute("parent", "@style/$it") }
                    }
                }
            }
            if (folder.startsWith("values")) {
                if (!output.exists()) output.writeText("<resources/>")
                document(destination).use { target ->
                    val existingNames = (0 until target.documentElement.childNodes.length).mapNotNull { index ->
                        (target.documentElement.childNodes.item(index) as? Element)?.getAttribute("name")
                    }.toMutableSet()
                    val rootAttributes = doc.documentElement.attributes
                    for (index in 0 until rootAttributes.length) {
                        val attribute = rootAttributes.item(index)
                        if (!target.documentElement.hasAttribute(attribute.nodeName)) {
                            target.documentElement.setAttributeNS(attribute.namespaceURI, attribute.nodeName, attribute.nodeValue)
                        }
                    }
                    for (index in 0 until doc.documentElement.childNodes.length) {
                        val child = doc.documentElement.childNodes.item(index) as? Element ?: continue
                        val name = child.getAttribute("name")
                        check(name.isEmpty() || existingNames.add(name)) { "Duplicate $label extension value in $destination" }
                        target.documentElement.appendChild(target.importNode(child, true))
                    }
                }
            } else {
                TransformerFactory.newInstance().newTransformer().transform(DOMSource(doc), StreamResult(output))
            }
        }
        // These four names are a public host theme contract. Keep the isolated
        // library's attributes and add canonical names for remote host lookup.
        val colors = themeColors
        val added = mutableListOf<String>()
        document("res/values/public.xml").use { target ->
            val declarations = target.getElementsByTagName("public")
            val attributes = (0 until declarations.length).map { declarations.item(it) as Element }
                .filter { it.getAttribute("type") == "attr" }
            val existing = attributes.map { it.getAttribute("name") }.toSet()
            var next = attributes.maxOf { it.getAttribute("id").removePrefix("0x").toLong(16) }
            for (name in colors.keys.filterNot(existing::contains)) {
                next++
                check(next and 0xffff != 0L) { "Car theme attribute IDs exhausted" }
                target.documentElement.appendChild(target.createElement("public").apply {
                    setAttribute("type", "attr"); setAttribute("name", name); setAttribute("id", "0x${next.toString(16)}")
                })
                added.add(name)
            }
        }
        document(carResourceDestination(prefix, "res/values/attrs.xml")).use { target ->
            added.forEach { name -> target.documentElement.appendChild(target.createElement("attr").apply {
                setAttribute("name", name); setAttribute("formats", "color")
            }) }
        }
        document(carResourceDestination(prefix, "res/values/styles.xml")).use { target ->
            val styles = target.getElementsByTagName("style")
            val theme = (0 until styles.length).map { styles.item(it) as Element }
                .single { it.getAttribute("name") == themeStyle }
            colors.forEach { (name, color) -> theme.appendChild(target.createElement("item").apply {
                setAttribute("name", name); textContent = color
            }) }
        }
    }
}
