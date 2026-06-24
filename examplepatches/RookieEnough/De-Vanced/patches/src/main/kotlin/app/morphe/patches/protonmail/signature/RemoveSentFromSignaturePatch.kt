/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/protonmail/signature/RemoveSentFromSignaturePatch.kt
 */
package app.morphe.patches.protonmail.signature

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.findElementByAttributeValue
import java.io.File

@Suppress("unused")
val removeSentFromSignaturePatch = resourcePatch(
    name = "Remove 'Sent from' signature",
    description = "Removes the 'Sent from Proton Mail mobile' signature from emails.",
) {
    compatibleWith(AppCompatibilities.PROTON_MAIL)

    execute {
        val stringResourceFiles = mutableListOf<File>()

        get("res").walk().forEach { file ->
            if (file.isFile && file.name.equals("strings.xml", ignoreCase = true)) {
                stringResourceFiles.add(file)
            }
        }

        var foundString = false
        stringResourceFiles.forEach { filePath ->
            document(filePath.absolutePath).use { document ->
                val node = document.documentElement.childNodes.findElementByAttributeValue(
                    "name",
                    "mail_settings_identity_mobile_footer_default_free"
                )

                // String is not localized in all languages.
                if (node != null) {
                    node.textContent = ""
                    foundString = true
                }
            }
        }

        if (!foundString) throw PatchException("Could not find 'sent from' string in resources")
    }
}

