package app.template.patches.gboard

import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val gboardPackageRenamePatch = resourcePatch(
    name = "Gboard Package Rename (Pixel)",
    description = "將套件名稱改成 dev.jason.com.google.android.inputmethod.latin 以便在 Pixel 等裝置共存安裝，並更名自訂權限防止衝突。\nRename the package to dev.jason.com.google.android.inputmethod.latin for co-existence on Pixel/system-Gboard devices, and rename custom permissions to avoid installation conflicts.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        val originalPackageName = "com.google.android.inputmethod.latin"
        val packageNameOverride = "dev.jason.com.google.android.inputmethod.latin"

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            if (manifest.getAttribute("package") == originalPackageName) {
                manifest.setAttribute("package", packageNameOverride)
            }

            // Convert NodeList of all elements to Sequence of Element
            val elements = (0 until document.getElementsByTagName("*").length)
                .asSequence()
                .mapNotNull { document.getElementsByTagName("*").item(it) as? org.w3c.dom.Element }

            elements.forEach { element ->
                val attributes = element.attributes
                for (index in 0 until attributes.length) {
                    val attribute = attributes.item(index)
                    if (element === manifest && attribute.nodeName == "package") continue

                    val updatedValue = attribute.nodeValue?.replace(originalPackageName, packageNameOverride)
                    if (updatedValue != null && updatedValue != attribute.nodeValue) {
                        attribute.nodeValue = updatedValue
                    }
                }
            }
        }
    }
}
