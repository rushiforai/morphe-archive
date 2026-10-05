package dev.twitchpatches.patches.twitch.shared

import app.morphe.patcher.patch.PatchException
import java.io.StringReader
import javax.xml.parsers.DocumentBuilderFactory
import org.w3c.dom.Document
import org.xml.sax.InputSource
import org.xml.sax.SAXException

private val declarations = Regex("<!\\s*(?:DOCTYPE|ENTITY)\\b", RegexOption.IGNORE_CASE)

internal fun parseResourceXml(
    source: String,
    namespaceAware: Boolean = false,
    factory: DocumentBuilderFactory = DocumentBuilderFactory.newInstance(),
): Document {
    // Android's parser does not support the desktop DTD feature flags.
    if (declarations.containsMatchIn(source))
        throw PatchException("Resource XML must not contain DTD or entity declarations.")
    factory.isNamespaceAware = namespaceAware
    val builder = factory.newDocumentBuilder()
    builder.setEntityResolver { _, _ -> throw SAXException("External XML entities are not supported.") }
    return builder.parse(InputSource(StringReader(source)))
}
