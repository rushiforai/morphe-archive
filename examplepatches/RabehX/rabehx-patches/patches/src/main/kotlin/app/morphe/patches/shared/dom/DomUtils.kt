/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.shared.dom

import app.morphe.patcher.util.Document
import org.w3c.dom.Element
import org.w3c.dom.Node
import org.w3c.dom.NodeList

internal fun Node.removeFromParent(): Node = parentNode?.removeChild(this) ?: this

internal fun NodeList.asSequence(): Sequence<Node> =
    sequence { for (i in 0 until length) yield(item(i)) }

internal fun Node.childElementsSequence(): Sequence<Element> =
    childNodes.asSequence().filterIsInstance<Element>()

internal fun Node.forEachChildElement(block: (Element) -> Unit) {
    childElementsSequence().forEach(block)
}

internal fun Node.doRecursively(block: (Node) -> Unit) {
    block(this)
    childNodes.asSequence().forEach { it.doRecursively(block) }
}

internal fun Document.getNode(name: String): Node? {
    val elements = getElementsByTagName(name)
    return if (elements.length > 0) elements.item(0) else null
}

internal fun Node.adoptChild(tagName: String, block: Element.() -> Unit = {}): Element {
    val document = ownerDocument
    val element = document.createElement(tagName)
    element.block()
    appendChild(element)
    return element
}

internal fun String.trimIndentMultiline(): String = trimIndent()
