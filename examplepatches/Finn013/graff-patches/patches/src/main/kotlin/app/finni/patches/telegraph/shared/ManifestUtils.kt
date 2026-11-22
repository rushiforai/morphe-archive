package app.finni.patches.telegraph.shared

import app.morphe.patcher.xml.ResourceXml
import app.morphe.patcher.xml.XmlElement

internal fun ResourceXml.application(): XmlElement = elements("application").first()

/** Removes every element with [tag] whose android:name matches [predicate]. Returns how many were removed. */
internal fun ResourceXml.removeElements(tag: String, predicate: (String) -> Boolean): Int {
    val toRemove = elements(tag).filter { predicate(it.attribute("android:name").orEmpty()) }.toList()
    toRemove.forEach { it.remove() }
    return toRemove.size
}

/** Adds or replaces a <meta-data> entry inside <application>. */
internal fun ResourceXml.putMetaData(name: String, value: String) {
    val app = application()
    val existing = app.children("meta-data").firstOrNull { it.attribute("android:name") == name }
    if (existing != null) {
        existing.setAttribute("android:value", value)
    } else {
        app.insertChild(0, "meta-data") {
            setAttribute("android:name", name)
            setAttribute("android:value", value)
        }
    }
}

/** Reads a file bundled inside the patches file. */
internal fun bundledBytes(path: String): ByteArray {
    val loader = Constants::class.java.classLoader
    val stream = loader.getResourceAsStream(path) ?: throw IllegalStateException("Missing bundled resource: $path")
    return stream.use { it.readBytes() }
}
