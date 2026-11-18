package app.template.patches.calendar.widget

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Element

/** Keep the existing launcher alias; ask Android for account visibility first. */
internal object AccountAccessManifest {
    private const val ANDROID = "http://schemas.android.com/apk/res/android"
    private const val NATIVE = "com.android.calendar.event.LaunchInfoActivity"
    private const val GATE = "pl.dudek.extension.calendar.CalendarAccountAccessActivity"
    private fun value(element: Element, name: String) =
        element.getAttributeNS(ANDROID, name).ifEmpty { element.getAttribute("android:$name") }

    fun install(manifest: Element) {
        val apps = manifest.getElementsByTagName("application")
        checkShape(apps.length == 1, "expected one application")
        val app = apps.item(0) as Element
        val children = (0 until app.childNodes.length).map { app.childNodes.item(it) }
            .filterIsInstance<Element>()
        checkShape(children.none { value(it, "name") == GATE }, "account entry already installed; use a clean APK")
        val native = children.singleOrNull { it.tagName == "activity" && value(it, "name") == NATIVE }
        checkShape(native != null, "native launch activity changed")
        val launcher = children.singleOrNull {
            it.tagName == "activity-alias" && value(it, "name") == "com.android.calendar.AllInOneActivity"
        }
        checkShape(launcher != null && value(launcher, "targetActivity") == NATIVE,
            "launcher target changed")
        checkShape((0 until launcher!!.getElementsByTagName("category").length).any {
            value(launcher.getElementsByTagName("category").item(it) as Element, "name") ==
                "android.intent.category.LAUNCHER"
        }, "launcher category changed")
        val gate = manifest.ownerDocument.createElement("activity")
        gate.setAttribute("android:name", GATE)
        gate.setAttribute("android:exported", "false")
        gate.setAttribute("android:excludeFromRecents", "true")
        gate.setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
        value(native!!, "taskAffinity").takeIf { it.isNotEmpty() }?.let {
            gate.setAttribute("android:taskAffinity", it)
        }
        // Alias targets must be declared before the alias. Native intent filters,
        // provider permissions and other entry points are retained verbatim.
        app.insertBefore(gate, launcher)
        launcher.setAttribute("android:targetActivity", GATE)
    }

    private fun checkShape(ok: Boolean, message: String) {
        if (!ok) throw PatchException("Stabilize schedule widget: $message")
    }
}
