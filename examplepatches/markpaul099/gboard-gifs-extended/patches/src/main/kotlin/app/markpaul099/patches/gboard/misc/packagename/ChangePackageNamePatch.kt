package app.markpaul099.patches.gboard.misc.packagename

import app.markpaul099.patches.gboard.misc.identity.googleApiIdentityPatch
import app.markpaul099.patches.shared.Constants.ANDROID_NAMESPACE
import app.markpaul099.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.markpaul099.patches.shared.Constants.GBOARD_PACKAGE_NAME
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

private const val DEFAULT_PACKAGE_NAME = "$GBOARD_PACKAGE_NAME.gifsextended"

@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Changes the package name so the patched Gboard can be installed next to the original.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    // Google APIs check the calling package: keep identifying as the original Gboard.
    dependsOn(googleApiIdentityPatch)

    val packageNameOption = stringOption(
        key = "packageName",
        default = DEFAULT_PACKAGE_NAME,
        values = mapOf("Default" to DEFAULT_PACKAGE_NAME),
        title = "Package name",
        description = "The package name of the patched app.",
        required = true
    ) {
        it != null && it != GBOARD_PACKAGE_NAME &&
            Regex("^[a-z][a-z0-9_]*(\\.[a-z][a-z0-9_]*)+$").matches(it)
    }

    execute {
        val packageName = packageNameOption.value!!

        fun rename(value: String) = when {
            value == GBOARD_PACKAGE_NAME -> packageName
            value.startsWith("$GBOARD_PACKAGE_NAME.") ->
                packageName + value.removePrefix(GBOARD_PACKAGE_NAME)
            else -> value
        }

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            if (manifest.getAttribute("package") != GBOARD_PACKAGE_NAME) {
                throw PatchException("Unexpected package name: ${manifest.getAttribute("package")}")
            }
            manifest.setAttribute("package", packageName)

            val elements = document.getElementsByTagName("*")
            for (i in 0 until elements.length) {
                val element = elements.item(i) as Element

                // Provider authorities and permissions must be unique on the device,
                // or the patched app cannot be installed next to the original.
                listOf("authorities", "permission").forEach { attribute ->
                    if (element.hasAttributeNS(ANDROID_NAMESPACE, attribute)) {
                        val value = element.getAttributeNS(ANDROID_NAMESPACE, attribute)
                        element.setAttributeNS(
                            ANDROID_NAMESPACE,
                            "android:$attribute",
                            value.split(';').joinToString(";", transform = ::rename)
                        )
                    }
                }

                if (element.tagName in setOf("permission", "uses-permission", "permission-tree")) {
                    val value = element.getAttributeNS(ANDROID_NAMESPACE, "name")
                    element.setAttributeNS(ANDROID_NAMESPACE, "android:name", rename(value))
                }
            }
        }
    }
}
