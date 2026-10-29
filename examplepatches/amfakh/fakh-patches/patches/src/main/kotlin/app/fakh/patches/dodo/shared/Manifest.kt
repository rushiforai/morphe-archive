package app.fakh.patches.dodo.shared

import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Sets `android:enabled="false"` on every `<[tag]>` entry named in [names], so Android never
 * instantiates it at process start.
 */
fun Document.disableComponents(tag: String, vararg names: String) {
    val components = getElementsByTagName(tag)
    (0 until components.length).map { components.item(it) as Element }
        .filter { it.getAttribute("android:name") in names }
        .forEach { it.setAttribute("android:enabled", "false") }
}

/** Disables the `<provider>` entries named in [names]. */
fun Document.disableProviders(vararg names: String) = disableComponents("provider", *names)
