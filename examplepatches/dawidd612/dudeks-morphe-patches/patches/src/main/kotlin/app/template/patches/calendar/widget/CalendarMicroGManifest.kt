package app.template.patches.calendar.widget

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Element

/** Declare the verified original signer to MicroG-RE, without replacing Android accounts. */
internal object CalendarMicroGManifest {
    const val MICROG = "app.revanced.android.gms"
    const val GATE = "pl.dudek.extension.calendar.CalendarMicroGAccessActivity"
    const val PACKAGE = "com.google.android.calendar"
    // OAuth uses the pre-rotation signer in the clean APK's v2/v3 blocks.
    // The Android 13+ v3.1 signer bd324... is rejected as UNREGISTERED_ON_API_CONSOLE.
    const val SIGNER = "38918a453d07199354f8b19af05ec6562ced5788"
    private const val ANDROID = "http://schemas.android.com/apk/res/android"
    private fun value(element: Element, name: String) =
        element.getAttributeNS(ANDROID, name).ifEmpty { element.getAttribute("android:$name") }

    fun install(manifest: Element) {
        fun requireShape(ok: Boolean, message: String) {
            if (!ok) throw PatchException("Calendar MicroG authentication: $message")
        }
        requireShape(manifest.getAttribute("package") == PACKAGE &&
            value(manifest, "versionCode") == "2018314914", "manifest target changed")
        val apps = manifest.getElementsByTagName("application")
        requireShape(apps.length == 1, "expected one application")
        val app = apps.item(0) as Element
        requireShape((0 until app.childNodes.length).none {
            (app.childNodes.item(it) as? Element)?.let { node -> value(node, "name") == GATE } == true
        }, "MicroG consent activity already present")
        val metadata = mapOf(
            "$MICROG.SPOOFED_PACKAGE_NAME" to PACKAGE,
            "$MICROG.SPOOFED_PACKAGE_SIGNATURE" to SIGNER,
            "app.revanced.MICROG_PACKAGE_NAME" to MICROG,
        )
        val existing = app.getElementsByTagName("meta-data")
        requireShape((0 until existing.length).none {
            value(existing.item(it) as Element, "name") in metadata
        }, "MicroG metadata already present; use a clean APK")
        val queries = manifest.getElementsByTagName("queries")
        requireShape(queries.length <= 1, "multiple queries elements")
        metadata.forEach { (name, text) ->
            app.appendChild(manifest.ownerDocument.createElement("meta-data").apply {
                setAttribute("android:name", name)
                setAttribute("android:value", text)
            })
        }
        app.appendChild(manifest.ownerDocument.createElement("activity").apply {
            setAttribute("android:name", GATE)
            setAttribute("android:exported", "false")
            setAttribute("android:excludeFromRecents", "true")
            setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
        })
        val query = (queries.item(0) as? Element) ?: manifest.ownerDocument.createElement("queries").also {
            manifest.appendChild(it)
        }
        val packages = query.getElementsByTagName("package")
        if ((0 until packages.length).none { value(packages.item(it) as Element, "name") == MICROG }) {
            query.appendChild(manifest.ownerDocument.createElement("package").apply {
                setAttribute("android:name", MICROG)
            })
        }
    }
}
