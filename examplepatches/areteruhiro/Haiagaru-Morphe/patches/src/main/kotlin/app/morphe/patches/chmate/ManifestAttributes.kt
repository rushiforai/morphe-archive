package app.morphe.patches.chmate

import org.w3c.dom.Element

/** Morphe can decode attributes without namespaces. NS/non-NS twins serialize as invalid XML. */
internal fun Element.setAndroidAttribute(localName: String, value: String) {
    val namespace = "http://schemas.android.com/apk/res/android"
    removeAttribute("android:$localName")
    removeAttributeNS(namespace, localName)
    setAttributeNS(namespace, "android:$localName", value)
}
