package app.markpaul099.patches.gboard.misc.packagename

import app.markpaul099.patches.gboard.misc.signature.ORIGINAL_PACKAGE_NAME
import app.markpaul099.patches.gboard.misc.signature.spoofAndroidCertPatch
import app.markpaul099.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

private const val DEFAULT_PACKAGE_NAME = "$ORIGINAL_PACKAGE_NAME.extended"
private const val DEFAULT_APP_NAME = "Gboard Extended"

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Changes the package name and app name so the patched Gboard can be installed next to the original.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(spoofAndroidCertPatch)

    val packageNameOption = stringOption(
        key = "packageName",
        default = DEFAULT_PACKAGE_NAME,
        values = mapOf("Default" to DEFAULT_PACKAGE_NAME),
        title = "Package name",
        description = "The package name of the patched app.",
        required = true
    ) {
        it != null && it != ORIGINAL_PACKAGE_NAME &&
            Regex("^[a-z][a-z0-9_]*(\\.[a-z][a-z0-9_]*)+$").matches(it)
    }

    val appNameOption = stringOption(
        key = "appName",
        default = DEFAULT_APP_NAME,
        values = mapOf("Default" to DEFAULT_APP_NAME),
        title = "App name",
        description = "The name shown in the launcher and the keyboard list.",
        required = true
    ) { !it.isNullOrBlank() }

    execute {
        val packageName = packageNameOption.value!!
        val appName = appNameOption.value!!

        fun rename(value: String) = when {
            value == ORIGINAL_PACKAGE_NAME -> packageName
            value.startsWith("$ORIGINAL_PACKAGE_NAME.") ->
                packageName + value.removePrefix(ORIGINAL_PACKAGE_NAME)
            else -> value
        }

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            if (manifest.getAttribute("package") != ORIGINAL_PACKAGE_NAME) {
                throw PatchException("Unexpected package name: ${manifest.getAttribute("package")}")
            }
            manifest.setAttribute("package", packageName)

            val elements = document.getElementsByTagName("*")
            for (i in 0 until elements.length) {
                val element = elements.item(i) as Element

                // Provider authorities and permissions must be unique on the device,
                // or the patched app cannot be installed next to the original.
                listOf("authorities", "permission").forEach { attribute ->
                    if (element.hasAttributeNS(ANDROID_NS, attribute)) {
                        val value = element.getAttributeNS(ANDROID_NS, attribute)
                        element.setAttributeNS(ANDROID_NS, "android:$attribute", value.split(';').joinToString(";", transform = ::rename))
                    }
                }

                when (element.tagName) {
                    "permission", "uses-permission", "permission-tree" -> {
                        val value = element.getAttributeNS(ANDROID_NS, "name")
                        element.setAttributeNS(ANDROID_NS, "android:name", rename(value))
                    }

                    // The keyboard list and launcher fall back to the application label.
                    "application" -> element.setAttributeNS(ANDROID_NS, "android:label", appName)
                }
            }
        }
    }
}
