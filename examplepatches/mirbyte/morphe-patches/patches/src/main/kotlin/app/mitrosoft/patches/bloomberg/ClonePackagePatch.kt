package app.mitrosoft.patches.bloomberg

import app.morphe.patcher.patch.resourcePatch
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_BLOOMBERG
import org.w3c.dom.Element

private const val ORIGINAL_PACKAGE = "com.bloomberg.android.plus"
private const val CLONE_PACKAGE = "$ORIGINAL_PACKAGE.morphe"

private fun String.withClonePackage() =
    if (startsWith("$ORIGINAL_PACKAGE.")) replaceFirst(ORIGINAL_PACKAGE, CLONE_PACKAGE) else this

@Suppress("unused")
val clonePackagePatch = resourcePatch(
    name = "Clone Bloomberg",
    description = "Changes the package name to $CLONE_PACKAGE so the app installs next to the Play Store version. " +
        "Renames custom permissions and provider authorities to match. Makes updating easier as you can get the original APK from Play Store.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_BLOOMBERG)

    execute {
        val stringRefs = mutableSetOf<String>()

        document("AndroidManifest.xml").use { manifest ->
            manifest.documentElement.setAttribute("package", CLONE_PACKAGE)

            for (tag in listOf("permission", "uses-permission")) {
                val elements = manifest.getElementsByTagName(tag)
                for (i in 0 until elements.length) {
                    val element = elements.item(i) as Element
                    val name = element.getAttribute("android:name")
                    if (name.startsWith("$ORIGINAL_PACKAGE.")) element.setAttribute("android:name", name.withClonePackage())
                }
            }

            val providers = manifest.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val element = providers.item(i) as Element
                val authorities = element.getAttribute("android:authorities").split(';')
                stringRefs += authorities.filter { it.startsWith("@string/") }.map { it.removePrefix("@string/") }
                element.setAttribute("android:authorities", authorities.joinToString(";") { it.withClonePackage() })
            }
        }

        if (stringRefs.isNotEmpty()) {
            document("res/values/strings.xml").use { strings ->
                val elements = strings.getElementsByTagName("string")
                for (i in 0 until elements.length) {
                    val element = elements.item(i) as Element
                    if (element.getAttribute("name") in stringRefs) {
                        element.textContent = element.textContent.withClonePackage()
                    }
                }
            }
        }
    }
}
