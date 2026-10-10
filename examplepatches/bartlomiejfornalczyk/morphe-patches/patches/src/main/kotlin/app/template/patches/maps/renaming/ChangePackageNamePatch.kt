/*
 * Original patch by bearinmindcat:
 * https://github.com/bearinmindcat/morphe-patches
 */

package app.template.patches.maps.renaming

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Document
import org.w3c.dom.Element
import app.template.patches.maps.microg.stockPackageLookupPatch
import app.template.patches.shared.Constants.COMPATIBILITY_GOOGLE_MAPS

private const val STOCK_PACKAGE = "com.google.android.apps.maps"
private const val GENUINE_CERT = "38918A453D07199354F8B19AF05EC6562CED5788"

private fun moved(value: String, old: String, new: String, separators: String = "."): String? = when {
    value == old -> new
    separators.any { value.startsWith(old + it) } -> new + value.substring(old.length)
    else -> null
}

private fun Document.elements(tag: String): List<Element> =
    getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }

@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Installs alongside stock Google Maps under its own package name and adds MicroG spoofing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GOOGLE_MAPS)
    dependsOn(stockPackageLookupPatch)

    val packageName = stringOption(
        key = "packageName",
        default = "app.morphe.android.apps.maps",
        title = "Package name",
        description = "The package name to install under.",
        required = true,
    ) {
        it != null && it.matches(Regex("^[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+$"))
    }

    execute {
        val old = STOCK_PACKAGE
        val new = packageName.value!!
        val counts = linkedMapOf<String, Int>()
        
        fun rename(element: Element, attribute: String, separators: String = ".", what: String = attribute): Boolean {
            val value = element.getAttribute(attribute)
            val renamed = moved(value, old, new, separators) ?: return false
            element.setAttribute(attribute, renamed)
            counts[what] = (counts[what] ?: 0) + 1
            return true
        }

        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            rename(root, "package")
            rename(root, "android:sharedUserId")

            val ownPermissions = manifest.elements("permission")
                .map { it.getAttribute("android:name") }
                .filter { moved(it, old, new) != null }
                .toSet()
            for (permission in manifest.elements("permission")) rename(permission, "android:name", what = "permission")
            for (uses in manifest.elements("uses-permission")) {
                if (uses.getAttribute("android:name") in ownPermissions) rename(uses, "android:name", what = "uses-permission")
            }
            for (element in manifest.elements("*")) {
                for (attribute in listOf("android:permission", "android:readPermission", "android:writePermission")) {
                    if (element.getAttribute(attribute) in ownPermissions) rename(element, attribute, what = "permission reference")
                }
                rename(element, "android:process", separators = ".:", what = "process")
            }

            val application = manifest.elements("application").single()
            for (provider in manifest.elements("provider").filter { it.parentNode == application }) {
                val authorities = provider.getAttribute("android:authorities").split(';')
                val renamed = authorities.map { moved(it, old, new) ?: it }
                if (renamed != authorities) {
                    provider.setAttribute("android:authorities", renamed.joinToString(";"))
                    counts["authorities"] = (counts["authorities"] ?: 0) + renamed.zip(authorities).count { (a, b) -> a != b }
                }
            }
            for (alias in manifest.elements("activity-alias")) rename(alias, "android:name", what = "activity-alias")

            // Inject MicroG spoofing metadata tags for both Morphe and ReVanced MicroG / GmsCore
            val spoofEntries = listOf(
                "app.morphe.android.gms.SPOOFED_PACKAGE_NAME" to old,
                "app.morphe.android.gms.SPOOFED_PACKAGE_SIGNATURE" to GENUINE_CERT.lowercase(),
                "app.morphe.MICROG_PACKAGE_NAME" to "app.revanced.android.gms",
                "app.morphe.android.gms.MICROG_PACKAGE_NAME" to "app.revanced.android.gms",
                "app.revanced.android.gms.SPOOFED_PACKAGE_NAME" to old,
                "app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE" to GENUINE_CERT.lowercase(),
                "app.revanced.MICROG_PACKAGE_NAME" to "app.revanced.android.gms",
                "app.revanced.android.gms.MICROG_PACKAGE_NAME" to "app.revanced.android.gms",
            )
            for ((key, value) in spoofEntries) {
                val meta = manifest.createElement("meta-data").apply {
                    setAttribute("android:name", key)
                    setAttribute("android:value", value)
                }
                application.appendChild(meta)
            }
            counts["metadata"] = spoofEntries.size
        }

        val res = this["res"]
        for (dir in res.listFiles()!!.filter { it.isDirectory && (it.name == "xml" || it.name.startsWith("xml-")) }) {
            for (file in dir.listFiles()!!.filter { it.name.endsWith(".xml") }) {
                if (old !in file.readText()) continue
                document("res/${dir.name}/${file.name}").use { xml ->
                    for (element in xml.elements("*")) {
                        if (element.getAttribute("android:targetPackage") == old) {
                            element.setAttribute("android:targetPackage", new)
                            counts["shortcut package"] = (counts["shortcut package"] ?: 0) + 1
                        }
                        rename(element, "android:targetClass", what = "shortcut class")
                    }
                }
            }
        }

        val expected = mapOf(
            "package" to 1, "android:sharedUserId" to 1, "permission" to 3, "uses-permission" to 1,
            "permission reference" to 2, "process" to 7, "authorities" to 9, "activity-alias" to 54,
            "shortcut package" to 2, "shortcut class" to 2, "metadata" to 8
        )
        val short = expected.filter { (k, v) -> (counts[k] ?: 0) < v }
        if (short.isNotEmpty()) {
            throw PatchException("package rename found less than expected: " + short.keys.joinToString { "$it ${counts[it] ?: 0}/${expected[it]}" })
        }
    }
}
