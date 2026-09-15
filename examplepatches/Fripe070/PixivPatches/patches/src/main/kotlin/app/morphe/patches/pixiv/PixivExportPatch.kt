import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.ResourcePatch
import app.morphe.patcher.patch.Compatibility
import org.w3c.dom.Element

val pixivExportPatch: ResourcePatch = resourcePatch(
    name = "Pixiv Export Activities",
    description = "Exports activities for testing",
    default = true
) {
    compatibleWith(Compatibility(name = "Pixiv", packageName = "jp.pxv.android"))
    execute {
        document("AndroidManifest.xml").use { doc ->
            val appNode = doc.getElementsByTagName("application").item(0) as? Element
            appNode?.setAttribute("android:debuggable", "true")

            val activityNodes = doc.getElementsByTagName("activity")
            for (i in 0 until activityNodes.length) {
                val element = activityNodes.item(i) as? Element ?: continue
                val name = element.getAttribute("android:name")
                if (name.contains("AiShowSettingActivity") || name.contains("SettingActivity")) {
                    element.setAttribute("android:exported", "true")
                }
            }
        }
    }
}
