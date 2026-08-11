package app.template.patches.bplace
//sjksafd
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

@Suppress("unused")
val removeCameraPermissionsPatch = resourcePatch(
    name = "Remove Camera Requirements",
    description = "Removes camera permissions and hardware requirements from the manifest.",
) {
    execute {
        document("AndroidManifest.xml").use { document ->
            val root = document.documentElement

            val permissions = root.getElementsByTagName("uses-permission")
            for (i in (permissions.length - 1) downTo 0) {
                val element = permissions.item(i) as? Element ?: continue

                if (element.getAttribute("android:name") ==
                    "android.permission.CAMERA"
                ) {
                    element.parentNode.removeChild(element)
                }
            }

            val features = root.getElementsByTagName("uses-feature")
            for (i in (features.length - 1) downTo 0) {
                val element = features.item(i) as? Element ?: continue

                if (element.getAttribute("android:name") ==
                    "android.hardware.camera"
                ) {
                    element.parentNode.removeChild(element)
                }
            }
        }
    }
}
