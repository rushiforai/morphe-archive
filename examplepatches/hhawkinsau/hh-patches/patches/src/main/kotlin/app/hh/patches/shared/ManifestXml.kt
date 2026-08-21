package app.hh.patches.shared

import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

internal fun Element.childElements(tag: String): List<Element> {
    val nodes = childNodes
    return buildList {
        for (i in 0 until nodes.length) {
            val node = nodes.item(i)
            if (node is Element && node.nodeName == tag) add(node)
        }
    }
}

internal fun Element.androidName(): String {
    val namespaced = getAttributeNS(ANDROID_NS, "name")
    return namespaced.ifEmpty { getAttribute("android:name") }
}

internal fun Element.setAndroidAttr(name: String, value: String) {
    if (hasAttributeNS(ANDROID_NS, name)) {
        setAttributeNS(ANDROID_NS, "android:$name", value)
    } else {
        setAttribute("android:$name", value)
    }
}

internal fun Element.setMetaData(name: String, value: String) {
    val existing = childElements("meta-data").firstOrNull { it.androidName() == name }
    val node = existing ?: ownerDocument.createElement("meta-data").also { appendChild(it) }
    node.setAndroidAttr("name", name)
    node.setAndroidAttr("value", value)
}

internal fun Element.removeMetaData(name: String) {
    childElements("meta-data")
        .filter { it.androidName() == name }
        .forEach { it.parentNode?.removeChild(it) }
}

internal fun Element.disableComponent(componentName: String) {
    for (tag in listOf("activity", "provider", "service", "receiver")) {
        childElements(tag)
            .filter { it.androidName() == componentName }
            .forEach { component ->
                component.setAndroidAttr("enabled", "false")
                component.setAndroidAttr("exported", "false")
            }
    }
}

internal fun Document.removePermissions(names: Set<String>) {
    for (tag in listOf("uses-permission", "uses-permission-sdk-23")) {
        val nodes = getElementsByTagName(tag)
        for (i in nodes.length - 1 downTo 0) {
            val element = nodes.item(i) as Element
            if (element.androidName() in names) {
                element.parentNode?.removeChild(element)
            }
        }
    }
}

internal fun Document.applicationElement(): Element? {
    return getElementsByTagName("application").item(0) as? Element
}
