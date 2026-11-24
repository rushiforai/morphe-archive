package app.adebisi.patches.shared

import org.w3c.dom.Document
import javax.xml.parsers.DocumentBuilderFactory

internal fun parseManifestXml(xml: String): Document {
    val factory = DocumentBuilderFactory.newInstance()
    factory.isNamespaceAware = false
    return factory.newDocumentBuilder().parse(xml.byteInputStream())
}
