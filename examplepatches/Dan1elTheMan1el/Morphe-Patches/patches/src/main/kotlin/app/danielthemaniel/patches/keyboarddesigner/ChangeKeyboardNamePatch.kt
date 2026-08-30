package app.danielthemaniel.patches.keyboarddesigner

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val KEYBOARD_SERVICE =
    "de.humbergsoftware.keyboarddesigner.EditorConnector"

@Suppress("unused")
val changeKeyboardNamePatch = resourcePatch(
    name = "Change keyboard name",
    description = "Changes the name shown for Keyboard Designer in Android's keyboard/input-method switcher.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KEYBOARD_DESIGNER)

    val keyboardName by stringOption(
        key = "keyboardName",
        title = "Keyboard name",
        description = "The name shown by Android when switching input methods.",
        default = "Poke Genie",
        required = true,
    )

    execute {
        val newName = keyboardName?.trim().orEmpty()
        if (newName.isEmpty()) {
            throw PatchException("Keyboard name cannot be empty.")
        }

        document("AndroidManifest.xml").use { document ->
            val services = document.getElementsByTagName("service")
            var patched = false

            for (index in 0 until services.length) {
                val service = services.item(index) as? Element ?: continue

                val serviceName =
                    service.getAttribute("android:name")
                        .ifEmpty { service.getAttributeNS(ANDROID_NAMESPACE, "name") }

                if (serviceName != KEYBOARD_SERVICE) {
                    continue
                }

                // Update the service's existing android:label attribute directly.
                // Morphe's manifest DOM may not expose Android attributes through
                // namespace-aware lookup consistently, so prefer the literal
                // prefixed attribute and fall back to the namespace-aware form.
                val labelAttribute =
                    service.attributes.getNamedItem("android:label")
                        ?: service.attributes.getNamedItemNS(ANDROID_NAMESPACE, "label")

                if (labelAttribute != null) {
                    labelAttribute.nodeValue = newName
                } else {
                    service.setAttribute("android:label", newName)
                }

                patched = true
                break
            }

            if (!patched) {
                throw PatchException(
                    "Could not find Keyboard Designer's EditorConnector service in AndroidManifest.xml."
                )
            }
        }
    }
}
