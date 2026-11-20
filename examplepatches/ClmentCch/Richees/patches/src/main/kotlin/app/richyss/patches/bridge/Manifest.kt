package app.richyss.patches.bridge

import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/** Returns the `<application>` element of a decoded AndroidManifest.xml. */
internal fun Document.applicationElement(): Element {
    val applications = documentElement.getElementsByTagName("application")
    if (applications.length == 0) {
        error("AndroidManifest.xml has no <application> element")
    }
    return applications.item(0) as Element
}

/**
 * Resolves the class declared as `android:name` of the `<application>` element.
 *
 * Discord declares its Application class explicitly, but relative names such as
 * `.DiscordApplication` are supported as well. Returns null when the manifest
 * relies on the platform default Application class.
 */
internal fun Document.applicationClassName(packageName: String): String? {
    val name = applicationElement().getAttributeNS(ANDROID_NS, "name").trim()
    if (name.isEmpty()) return null

    val binaryName = when {
        name.startsWith(".") -> packageName + name
        !name.contains('.') -> "$packageName.$name"
        else -> name
    }
    return "L${binaryName.replace('.', '/')};"
}

/** Returns the first direct child of [parent] with the given tag name. */
internal fun Element.child(tagName: String): Element? {
    val children = childNodes
    for (index in 0 until children.length) {
        val node = children.item(index)
        if (node is Element && node.tagName == tagName) return node
    }
    return null
}
