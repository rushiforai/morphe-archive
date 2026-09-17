package app.template.patches.googlephone

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.GOOGLE_PHONE_COMPATIBILITY

@Suppress("unused")
val removeDialerSupportLibraryPatch = resourcePatch(
    name = "Remove Dialer Support Library",
    description = "Removes the unavailable com.google.android.dialer.support shared-library requirement.",
    default = true,
) {
    compatibleWith(GOOGLE_PHONE_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val libraryNodes = document.getElementsByTagName("uses-library")

            for (index in libraryNodes.length - 1 downTo 0) {
                val node = libraryNodes.item(index)

                val name = node.attributes
                    ?.getNamedItem("android:name")
                    ?.nodeValue

                if (name == "com.google.android.dialer.support") {
                    node.parentNode?.removeChild(node)
                }
            }
        }
    }
}
