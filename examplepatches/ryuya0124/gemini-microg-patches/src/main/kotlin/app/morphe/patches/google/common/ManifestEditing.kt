package app.morphe.patches.google.common

import app.morphe.patcher.patch.ResourcePatchContext
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock
import com.reandroid.arsc.chunk.xml.ResXmlAttribute
import com.reandroid.arsc.chunk.xml.ResXmlElement
import com.reandroid.arsc.value.DataType
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File
import java.io.RandomAccessFile
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.zip.ZipFile

/** The manifest operations these patches need, on the decoded document or on the binary manifest. */
internal interface ManifestElement {
    val tag: String
    /** An android: attribute as a string, or "" when it is absent or not a literal string. */
    fun android(name: String): String
    fun hasAndroid(name: String): Boolean
    fun setAndroid(name: String, value: String)
    fun setAndroidBoolean(name: String, value: Boolean)
    /** Removes an attribute by local name in any namespace, such as splitTypes. */
    fun removeAttribute(localName: String)
    fun attribute(name: String): String
    fun setAttribute(name: String, value: String)
    fun addChild(tag: String): ManifestElement
    fun children(tag: String): List<ManifestElement>
    fun remove()
}

internal interface ManifestDocument {
    val root: ManifestElement
    /** Elements named [tag] in document order, or all of them for "*", as getElementsByTagName. */
    fun elements(tag: String): List<ManifestElement>
}

/**
 * Edits AndroidManifest.xml of the APK being patched.
 *
 * When only raw resources are extracted, the binary manifest is edited as it is and written as a root
 * entry, which replaces the manifest of the APK. Patcher then never parses resources.arsc; for the
 * Google app that table alone needs more memory than a phone gives the patcher. When resources are
 * decoded anyway (another selected patch needs them), the decoded document is edited instead.
 */
internal fun ResourcePatchContext.editManifest(block: (ManifestDocument) -> Unit) {
    if (!usesBinaryManifest()) {
        @Suppress("DEPRECATION")
        document("AndroidManifest.xml").use { block(DomManifest(it)) }
        return
    }
    @Suppress("DEPRECATION")
    val root = get(ROOT_PROBE, false).parentFile
    val edited = root.resolve("AndroidManifest.xml")
    val bytes = if (edited.isFile) edited.readBytes() else ZipFile(inputApk()).use { zip ->
        zip.getInputStream(checkNotNull(zip.getEntry("AndroidManifest.xml")) { "APK has no manifest" }).readBytes()
    }
    val manifest = AndroidManifestBlock.load(bytes.inputStream())
    block(BinaryManifest(manifest))
    manifest.refreshFull()
    edited.writeBytes(manifest.bytes)
}

/** Whether resources stay raw, so the manifest is edited in its binary form. */
@Suppress("DEPRECATION")
internal fun ResourcePatchContext.usesBinaryManifest(): Boolean = listDecodableFiles("AndroidManifest.xml").isEmpty()

/**
 * Renames the package of the raw resource table in place, as compiling decoded resources does for a
 * renamed manifest. Only the fixed-size name in the package header changes; the table is not parsed.
 */
internal fun ResourcePatchContext.renameRawTablePackage(from: String, to: String) {
    check(usesBinaryManifest())
    require(to.length < 128)
    @Suppress("DEPRECATION")
    val table = get("resources.arsc")
    var renamed = 0
    RandomAccessFile(table, "rw").use { file ->
        val header = ByteArray(PACKAGE_NAME_OFFSET + 256)
        fun read(position: Long, length: Int): ByteBuffer {
            file.seek(position)
            file.readFully(header, 0, length)
            return ByteBuffer.wrap(header, 0, length).order(ByteOrder.LITTLE_ENDIAN)
        }
        val tableHeader = read(0, 12)
        check(tableHeader.getShort(0).toInt() == 0x0002) { "Unexpected resource table" }
        val tableSize = tableHeader.getInt(4).toLong() and 0xffffffffL
        check(tableSize == file.length()) { "Unexpected resource table size" }
        var position = (tableHeader.getShort(2).toInt() and 0xffff).toLong()
        while (position < tableSize) {
            val chunk = read(position, 8)
            val type = chunk.getShort(0).toInt() and 0xffff
            val size = chunk.getInt(4).toLong() and 0xffffffffL
            check(size >= 8 && position + size <= tableSize) { "Corrupt resource table chunk" }
            if (type == 0x0200) {
                read(position, PACKAGE_NAME_OFFSET + 256)
                val name = String(header, PACKAGE_NAME_OFFSET, 256, Charsets.UTF_16LE).substringBefore('\u0000')
                if (name == from) {
                    val bytes = ByteArray(256)
                    to.toByteArray(Charsets.UTF_16LE).copyInto(bytes)
                    file.seek(position + PACKAGE_NAME_OFFSET)
                    file.write(bytes)
                    renamed++
                }
            }
            position += size
        }
    }
    check(renamed == 1) { "Expected one resource package named $from, renamed $renamed" }
}

/** Offset of the UTF-16 name in ResTable_package, after the chunk header and the package id. */
private const val PACKAGE_NAME_OFFSET = 12

private const val ROOT_PROBE = "geminipatch-manifest.probe"

/** The input APK, which Patcher does not expose to raw patches. */
private fun ResourcePatchContext.inputApk(): File {
    fun hasManifest(file: File) = file.isFile && runCatching {
        ZipFile(file).use { it.getEntry("AndroidManifest.xml") != null }
    }.getOrDefault(false)

    fun files(owner: Any): Sequence<Any?> = generateSequence<Class<*>>(owner.javaClass) { it.superclass }
        .flatMap { it.declaredFields.asSequence() }
        .filterNot { java.lang.reflect.Modifier.isStatic(it.modifiers) }
        .map { field -> runCatching { field.isAccessible = true; field.get(owner) }.getOrNull() }

    // PatcherConfig.apkFile, reached through the context's config or its resource coder.
    val candidates = files(this).flatMap { value ->
        when (value) {
            is File -> sequenceOf(value)
            null, is String, is Number, is Boolean -> emptySequence()
            else -> if (value.javaClass.name.startsWith("app.morphe.patcher.")) files(value).filterIsInstance<File>() else emptySequence()
        }
    }.filter(::hasManifest).distinct().toList()
    return candidates.singleOrNull() ?: error("Could not locate the input APK to edit its manifest (${candidates.size} candidates)")
}

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

private class DomManifest(private val document: Document) : ManifestDocument {
    override val root: ManifestElement = DomElement(document.documentElement)
    override fun elements(tag: String): List<ManifestElement> = document.getElementsByTagName(tag).let { nodes ->
        (0 until nodes.length).map { DomElement(nodes.item(it) as Element) }
    }
}

private class DomElement(private val element: Element) : ManifestElement {
    override val tag: String get() = element.tagName
    override fun android(name: String) = element.getAttributeNS(ANDROID_NS, name).ifEmpty { element.getAttribute("android:$name") }
    override fun hasAndroid(name: String) = element.hasAttributeNS(ANDROID_NS, name) || element.hasAttribute("android:$name")
    override fun setAndroid(name: String, value: String) = element.setAttribute("android:$name", value)
    override fun setAndroidBoolean(name: String, value: Boolean) = element.setAttribute("android:$name", value.toString())
    override fun removeAttribute(localName: String) {
        element.removeAttributeNS(ANDROID_NS, localName)
        element.removeAttribute("android:$localName")
        element.removeAttribute(localName)
    }
    override fun attribute(name: String): String = element.getAttribute(name)
    override fun setAttribute(name: String, value: String) = element.setAttribute(name, value)
    override fun addChild(tag: String): ManifestElement =
        DomElement(element.ownerDocument.createElement(tag).also { element.appendChild(it) })
    override fun children(tag: String): List<ManifestElement> = (0 until element.childNodes.length)
        .map { element.childNodes.item(it) }.filterIsInstance<Element>().filter { it.tagName == tag }.map(::DomElement)
    override fun remove() { element.parentNode?.removeChild(element) }
}

private class BinaryManifest(private val manifest: AndroidManifestBlock) : ManifestDocument {
    override val root: ManifestElement = BinaryElement(manifest.manifestElement)
    override fun elements(tag: String): List<ManifestElement> {
        val result = mutableListOf<ManifestElement>()
        fun visit(element: ResXmlElement) {
            if (tag == "*" || element.name == tag) result.add(BinaryElement(element))
            element.elements.forEach { visit(it as ResXmlElement) }
        }
        visit(manifest.manifestElement)
        return result
    }
}

/** Framework attribute ids, which are fixed across Android versions. */
private val ANDROID_IDS = mapOf(
    "label" to 0x01010001,
    "name" to 0x01010003,
    "permission" to 0x01010006,
    "readPermission" to 0x01010007,
    "writePermission" to 0x01010008,
    "enabled" to 0x0101000e,
    "authorities" to 0x01010018,
    "value" to 0x01010024,
)

private class BinaryElement(private val element: ResXmlElement) : ManifestElement {
    override val tag: String get() = element.name
    private fun id(name: String) = ANDROID_IDS[name] ?: error("Unsupported manifest attribute android:$name")
    private fun find(name: String): ResXmlAttribute? = element.searchAttributeByResourceId(id(name))
    override fun android(name: String): String = find(name)?.takeIf { it.dataType == DataType.STRING }?.dataAsString ?: ""
    override fun hasAndroid(name: String) = find(name) != null
    override fun setAndroid(name: String, value: String) = element.getOrCreateAndroidAttribute(name, id(name)).setDataAsString(value)
    override fun setAndroidBoolean(name: String, value: Boolean) = element.getOrCreateAndroidAttribute(name, id(name)).setValueAsBoolean(value)
    override fun removeAttribute(localName: String) { element.removeAttributeIf { it.name == localName } }
    override fun attribute(name: String): String =
        element.searchAttributeByName(name)?.takeIf { it.uri.isNullOrEmpty() && it.dataType == DataType.STRING }?.dataAsString ?: ""
    override fun setAttribute(name: String, value: String) {
        val attribute = element.searchAttributeByName(name)?.takeIf { it.uri.isNullOrEmpty() }
            ?: error("Missing manifest attribute $name")
        attribute.setDataAsString(value)
    }
    override fun addChild(tag: String): ManifestElement = BinaryElement(element.newElement(tag))
    override fun children(tag: String): List<ManifestElement> =
        element.elements.asSequence().map { it as ResXmlElement }.filter { it.name == tag }.map(::BinaryElement).toList()
    override fun remove() { check(element.removeSelf()) { "Could not remove manifest element ${element.name}" } }
}
