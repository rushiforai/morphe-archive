package app.template.patches.calendar.widget

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Attr
import org.w3c.dom.Element

/** Re-signed fresh installs must not join Google's certificate-bound shared UID. */
internal object ScheduleInstallManifest {
    private const val ANDROID = "http://schemas.android.com/apk/res/android"
    private const val SHARED_UID = "com.google.android.calendar.uid.shared"

    fun prepare(manifest: Element) {
        if (manifest.tagName != "manifest" ||
            manifest.getAttribute("package") != "com.google.android.calendar") {
            throw PatchException("Stabilize schedule widget: unexpected manifest package")
        }
        // Morphe's Document parser is not namespace-aware. Identify attributes
        // by the declared prefix as well as the resolved URI, then remove the
        // actual Attr nodes so this works with either kind of DOM.
        val attributes = (0 until manifest.attributes.length)
            .map { manifest.attributes.item(it) as Attr }
            .filter { attribute ->
                attribute.namespaceURI == ANDROID ||
                    (attribute.namespaceURI == null && ':' in attribute.name &&
                        manifest.getAttribute("xmlns:" + attribute.name.substringBefore(':')) == ANDROID)
            }
        val fields = setOf("sharedUserId", "sharedUserLabel", "sharedUserMaxSdkVersion")
        fun name(attribute: Attr) = attribute.localName ?: attribute.name.substringAfter(':')
        if (attributes.any { name(it) == "sharedUserId" &&
                it.value.isNotEmpty() && it.value != SHARED_UID }) {
            throw PatchException("Stabilize schedule widget: unexpected shared user ID")
        }
        // This changes the new APK only; it cannot migrate an installed Google
        // package or its data to the Morphe signing key / a different Linux UID.
        attributes.filter { name(it) in fields }.forEach { manifest.removeAttributeNode(it) }
    }
}
