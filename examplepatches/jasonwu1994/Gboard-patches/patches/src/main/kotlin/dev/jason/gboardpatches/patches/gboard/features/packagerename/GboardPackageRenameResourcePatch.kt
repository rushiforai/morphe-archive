package dev.jason.gboardpatches.patches.gboard.features.packagerename

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.shared.elements
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_PACKAGE_NAME
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_PATCHED_PACKAGE_NAME

internal val gboardPackageRenameResourcePatch = resourcePatch(
    description = "將套件名稱改成可共存安裝的自訂值。"
) {
    finalize {
        applyManifestPackageOverride(
            originalPackageName = GBOARD_PACKAGE_NAME,
            packageNameOverride = GBOARD_PATCHED_PACKAGE_NAME
        )
    }
}

context(context: ResourcePatchContext)
private fun applyManifestPackageOverride(
    originalPackageName: String,
    packageNameOverride: String
) = with(context) {
    document("AndroidManifest.xml").use { document ->
        val manifest = document.documentElement
        if (manifest.getAttribute("package") == originalPackageName) {
            manifest.setAttribute("package", packageNameOverride)
        }

        document.getElementsByTagName("*").elements().forEach { element ->
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
