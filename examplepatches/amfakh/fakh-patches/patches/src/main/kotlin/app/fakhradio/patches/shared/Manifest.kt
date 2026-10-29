package app.fakhradio.patches.shared

import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Sets `android:enabled="false"` on the `<provider>` entries named in [names],
 * so Android never instantiates them at process start.
 */
fun Document.disableProviders(vararg names: String) {
    val providers = getElementsByTagName("provider")
    (0 until providers.length).map { providers.item(it) as Element }
        .filter { it.getAttribute("android:name") in names }
        .forEach { it.setAttribute("android:enabled", "false") }
}
