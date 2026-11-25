package dev.jason.gboardpatches.patches.gboard

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Attr
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val GBOARD_MORPHE_PACKAGE = "app.morphe.android.inputmethod.latin"

private fun Document.elements(tag: String): List<Element> =
    getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }

/** Permissions Gboard declares under its own package name. */
private val OWN_PERMISSION_SUFFIXES = listOf(
    ".DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION",
    ".pixelbundle.RECEIVER",
)

/** `<old package>` or `<old package>.<suffix>` becomes the same value under [new]. */
private fun String.renamePackagePrefix(old: String, new: String): String = when {
    this == old -> new
    startsWith("$old.") -> new + removePrefix(old)
    else -> this
}

/** Provider authorities hold `;`-separated names, each of them Gboard's own. */
private fun String.renameAuthorities(old: String, new: String): String =
    split(';').joinToString(";") { it.renamePackagePrefix(old, new) }

/** Phenotype registration keys, which Gboard looks up under its own package. */
private val PHENOTYPE_PREFIXES = listOf(
    "com.google.android.gms.phenotype.registration.binarypb:",
    "com.google.android.gms.phenotype.registration.xml:",
)

/** Only the permissions Gboard declares itself are renamed; framework ones are left alone. */
private fun String.renameOwnPermission(old: String, new: String): String =
    if (OWN_PERMISSION_SUFFIXES.any { this == old + it }) renamePackagePrefix(old, new) else this

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
        "Off by default: Gboard features that are tied to the stock package name keep working only when the " +
        "package is left alone. Enabling it requires uninstalling the built-in Gboard first, because a patched " +
        "copy is not signed with Google's key.",
    default = false,
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
            System.err.println("CPN-DIAG manifest package=" + manifest.documentElement.getAttribute("package"))
            if (manifest.documentElement.getAttribute("package") != old) {
                throw PatchException("Gboard package was already changed")
            }
                        val all = manifest.elements("*")
            val ownedAttrs = HashSet<Attr>()
            fun Element.rename(attribute: String, transform: (String) -> String) {
                val attr = getAttributeNode(attribute) ?: return
                val renamed = transform(attr.value)
                if (renamed != attr.value) {
                    attr.value = renamed
                    ownedAttrs.add(attr)
                }
            }
            // Prefix-based, like the reference implementation: other patches add providers,
            // receivers and hosts, so the set of values carrying the package name is not fixed.
            for (element in all) {
                element.rename("android:authorities") { it.renameAuthorities(old, new) }
                when (element.tagName) {
                    "permission", "uses-permission" -> element.rename("android:name") { it.renameOwnPermission(old, new) }
                    // <queries><package android:name="…"/>: packages the app may see. Patches that
                    // add Gboard's own package here are moved with it.
                    "package" -> element.rename("android:name") { value ->
                        if (value == old || value.startsWith("$old.")) value.renamePackagePrefix(old, new) else value
                    }
                    "data" -> element.rename("android:host") {
                        if (it.startsWith("deeplink.")) "deeplink." + it.removePrefix("deeplink.").renamePackagePrefix(old, new) else it
                    }
                    "meta-data" -> element.rename("android:name") { value ->
                        PHENOTYPE_PREFIXES.firstNotNullOfOrNull { prefix ->
                            value.takeIf { it.startsWith(prefix) }
                                ?.let { prefix + it.removePrefix(prefix).renamePackagePrefix(old, new) }
                        } ?: value
                    }
                }
                element.rename("android:permission") { it.renameOwnPermission(old, new) }
            }
            manifest.documentElement.setAttribute("package", new)
            // Anything still naming the old package is a value no rule covers, so report it instead
            // of leaving a manifest that points at the stock app.
            val leftovers = all.flatMap { element ->
                (0 until element.attributes.length).map { element.attributes.item(it) as Attr }
            }.filter { attr ->
                val value = attr.value
                value == old || value.startsWith("$old.") || value.startsWith("deeplink.$old") ||
                    PHENOTYPE_PREFIXES.any { value == it + old }
            }
            leftovers.take(8).forEach { attr ->
                System.err.println("CPN-DIAG leftover ${attr.ownerElement.tagName} ${attr.name}=${attr.value}")
            }
            val unexpected = leftovers.firstOrNull()
            if (unexpected != null) {
                throw PatchException("Unexpected package value ${unexpected.name}=\"${unexpected.value}\" in Gboard's manifest")
            }
        }

        // Settings screens that open Gboard's own activities by package, including ones other patches added.
        // Decoded on first use and shared with the other patches that touch res/xml*.
        System.err.println("CPN-DIAG manifest rewritten")
        decode("res/xml*")
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
