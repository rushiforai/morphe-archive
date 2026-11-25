package patches.gboard

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Attr
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val GBOARD_MORPHE_PACKAGE = "app.morphe.android.inputmethod.latin"

private fun Document.elements(tag: String): List<Element> =
    getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }

/** One manifest value that names Gboard's own identity: [prefix] + package + [suffix]. */
private class Identity(
    val element: String,
    val attribute: String,
    val prefix: String = "",
    val suffix: String = "",
    val optional: Boolean = false,
)

/**
 * Every manifest value in Gboard 18.5.11 that carries its package name, all of them the
 * app's own identity: the package; its two custom permissions and the receiver one
 * protects; nine provider authorities (Gboard builds each from getPackageName()); the
 * deeplink host (also built from getPackageName()); and the two Phenotype registration keys,
 * which Gboard looks up under its own package.
 */
private val identities = listOf(
    Identity("manifest", "package"),
    Identity("permission", "android:name", suffix = ".pixelbundle.RECEIVER"),
    Identity("permission", "android:name", suffix = ".DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"),
    Identity("receiver", "android:permission", suffix = ".pixelbundle.RECEIVER"),
    Identity("provider", "android:authorities"),
    Identity("provider", "android:authorities", suffix = ".androidx-startup"),
    Identity("provider", "android:authorities", suffix = ".clipboard_content"),
    Identity("provider", "android:authorities", suffix = ".gboard_patches", optional = true),
    Identity("provider", "android:authorities", suffix = ".fileprovider"),
    Identity("provider", "android:authorities", suffix = ".inputactionprovider"),
    Identity("provider", "android:authorities", suffix = ".mlkitinitprovider"),
    Identity("provider", "android:authorities", suffix = ".swissarmyknifefileprovider"),
    Identity("provider", "android:authorities", suffix = ".tracing"),
    Identity("provider", "android:authorities", suffix = ".wdb"),
    Identity("data", "android:host", prefix = "deeplink."),
    Identity("meta-data", "android:name", prefix = "com.google.android.gms.phenotype.registration.binarypb:"),
    Identity("meta-data", "android:name", prefix = "com.google.android.gms.phenotype.registration.xml:"),
)

/**
 * Installs Gboard under its own package name, beside the stock Gboard that most phones have
 * built in and signed by Google (a patched copy under the stock name cannot install there).
 *
 * Runs last, so screens other patches add are moved too. Deliberately left alone: class names,
 * intent actions and the log identifiers in Gboard's code that start with the stock package name.
 */
@Suppress("unused")
val gboardChangePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Installs Gboard under its own package name, alongside the stock Gboard that most phones have built in. " +
        "On by default, because a patched copy cannot replace the built-in Gboard.",
    default = true,
) {
    compatibleWith(gboard)
    dependsOn(originalInput)

    val packageName by stringOption(
        key = "packageName",
        default = GBOARD_MORPHE_PACKAGE,
        title = "Package name",
        description = "The package name to install under. Must be a valid Android package name that differs from $GBOARD_PACKAGE.",
        required = true,
    ) {
        it != null && it != GBOARD_PACKAGE && !it.contains(GBOARD_PACKAGE) && it.length <= 150 &&
            it.matches(Regex("^[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+$"))
    }

    finalize {
        val old = GBOARD_PACKAGE
        val new = packageName!!
        document("AndroidManifest.xml").use { manifest ->
            if (manifest.documentElement.getAttribute("package") != old) {
                throw PatchException("Gboard package was already changed")
            }
            val all = manifest.elements("*").flatMap { element ->
                (0 until element.attributes.length).map { element.attributes.item(it) as Attr }
            }
            val owned = identities.mapNotNull { identity ->
                val value = identity.prefix + old + identity.suffix
                val matches = manifest.elements(identity.element).mapNotNull { element ->
                    element.getAttributeNode(identity.attribute)?.takeIf { it.value == value }
                }
                when {
                    matches.size == 1 -> matches.single() to identity
                    matches.isEmpty() && identity.optional -> null
                    else -> throw PatchException(
                        "Expected one ${identity.element} ${identity.attribute}=\"$value\", found ${matches.size}",
                    )
                }
            }
            val ownedAttrs = owned.map { it.first }
            val unexpected = all.firstOrNull { attr -> old in attr.value && ownedAttrs.none { it === attr } }
            if (unexpected != null) {
                throw PatchException("Unexpected package value ${unexpected.name}=\"${unexpected.value}\" in Gboard's manifest")
            }
            owned.forEach { (attr, identity) -> attr.value = identity.prefix + new + identity.suffix }
        }

        // Settings screens that open Gboard's own activities by package, including ones other patches added.
        decode("res/xml", "res/xml-*")
        for (dir in this["res"].listFiles()!!.filter { it.isDirectory && (it.name == "xml" || it.name.startsWith("xml-")) }) {
            for (file in dir.listFiles()!!.filter { it.name.endsWith(".xml") }) {
                if ("targetPackage=\"$old\"" !in file.readText()) continue
                document("res/${dir.name}/${file.name}").use { xml ->
                    for (element in xml.elements("*")) {
                        if (element.getAttribute("android:targetPackage") == old) element.setAttribute("android:targetPackage", new)
                    }
                }
            }
        }
    }
}
