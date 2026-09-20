package app.morphe.patches.googlephotos.misc.gms

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.googlephotos.misc.gms.Constants.MORPHE_PHOTOS_PACKAGE_NAME
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.misc.gms.PackageNameConfig
import app.morphe.util.asSequence
import app.morphe.util.getNode
import org.w3c.dom.Element

lateinit var packageNameOption: Option<String>

@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Renames the package to $MORPHE_PHOTOS_PACKAGE_NAME to allow non-root installation alongside " +
        "pre-installed Google Photos. Deselect this if Google Photos is not installed as a system app " +
        "on your device to keep the original package name.",
    default = true,
) {
    category("Experimental")
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)

    packageNameOption = stringOption(
        key = "packageName",
        default = "Default",
        values = mapOf("Default" to "Default"),
        title = "Package name",
        description = "The name of the package to rename the app to.",
        required = true,
    ) {
        it == "Default" || it!!.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+\$"))
    }

    execute {
        PackageNameConfig.isPackageNameChangeEnabled = true
        val optVal = packageNameOption.value
        val targetName = if (optVal != null && optVal != packageNameOption.default) {
            optVal
        } else {
            MORPHE_PHOTOS_PACKAGE_NAME
        }
        PackageNameConfig.effectivePackageName = targetName
    }

    finalize {
        val targetPackageName = PackageNameConfig.effectivePackageName.ifEmpty { MORPHE_PHOTOS_PACKAGE_NAME }

        document("AndroidManifest.xml").use { document ->
            val manifest = document.getNode("manifest") as Element
            val originalPackageName = manifest.getAttribute("package")

            manifest.setAttribute("package", targetPackageName)

            val permissions = manifest.getElementsByTagName("permission").asSequence()
            val usesPermissions = manifest.getElementsByTagName("uses-permission").asSequence()
            val receiverNotExported = "DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"

            (permissions + usesPermissions)
                .map { it as Element }
                .filter { it.getAttribute("android:name") == "$originalPackageName.$receiverNotExported" }
                .forEach { it.setAttribute("android:name", "$targetPackageName.$receiverNotExported") }

            val providers = manifest.getElementsByTagName("provider").asSequence()
            for (node in providers) {
                val provider = node as Element
                val authorities = provider.getAttribute("android:authorities")
                if (!authorities.startsWith("$originalPackageName.")) continue
                provider.setAttribute("android:authorities", authorities.replace(originalPackageName, targetPackageName))
            }
        }
    }
}
