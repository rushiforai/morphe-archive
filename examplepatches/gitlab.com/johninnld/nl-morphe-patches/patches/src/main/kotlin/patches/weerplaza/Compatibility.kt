package patches.weerplaza

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import org.w3c.dom.Element

internal const val APP = "Lcom/meteoplaza/app"
internal const val ANDROID = "http://schemas.android.com/apk/res/android"
internal val weerplaza = Compatibility(
    name = "Weerplaza", packageName = "nl.weerplaza.app", apkFileType = ApkFileType.APKS,
    signatures = setOf("e7c541ac7f1f5f36fb7c2263e14b9d64297ba391115d926e9b81af337efa4dea"),
    targets = listOf(AppTarget(version = "3.13.1", versionCode = 734, minSdk = 26)),
)
internal val originalInput = patches.shared.originalInput(weerplaza)

internal fun exact(cls: String, name: String, result: String = "V", vararg params: String) =
    Fingerprint(definingClass = cls, name = name, returnType = result, parameters = params.toList())
internal fun org.w3c.dom.Document.one(attribute: String, value: String): Element {
    val nodes = getElementsByTagName("*")
    val matches = (0 until nodes.length).map { nodes.item(it) as Element }.filter { it.getAttribute(attribute) == value }
    check(matches.size == 1) { "Expected one $attribute=$value, found ${matches.size}" }
    return matches.single()
}
internal fun Element.collapse() {
    setAttributeNS(ANDROID, "android:visibility", "gone")
    setAttributeNS(ANDROID, "android:layout_height", "0dp")
}
