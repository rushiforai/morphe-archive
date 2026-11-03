package app.tikkamasalla.stremio

import app.morphe.patcher.patch.resourcePatch
import app.tikkamasalla.stremio.introskip.Constants
import org.w3c.dom.Element

private const val NEW_PACKAGE = "com.stremio.one.morphe"
private const val NEW_LABEL = "Stremio Morphe"

private fun String.renamedPackage(oldPackage: String): String =
    if (this == oldPackage || startsWith("$oldPackage.")) {
        NEW_PACKAGE + substring(oldPackage.length)
    } else {
        this
    }

/**
 * Installs the patched app next to the stock one instead of replacing it: the package becomes
 * com.stremio.one.morphe and the label "Stremio Morphe". Off by default, so a normal build keeps
 * the stock package name and replaces the stock install as before.
 *
 * Only the install identity changes: the manifest package, the app-defined signature permission,
 * every provider authority, and the Facebook Custom Tab return host ("cct." + package, built that
 * way by the Facebook SDK). Class names (com.stremio.tv / .common / .core) are not package names
 * and stay untouched. The keep-alive provider added by External player progress derives its
 * authority from the manifest package, so it ends up renamed whichever patch runs first.
 * Attributes are edited in place: setAttributeNS does not replace existing attributes in
 * Morphe's manifest document, it only works on newly created elements.
 */
val sideBySidePatch = resourcePatch(
    name = "Side-by-side install",
    description = "Installs the patched app separately as Stremio Morphe (package " +
        "com.stremio.one.morphe) so it can sit next to the normal Stremio instead of " +
        "replacing it. Off by default.",
    default = false,
) {
    compatibleWith(Constants.STREMIO_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val oldPackage = manifest.getAttribute("package")
            if (oldPackage.isNullOrEmpty() || oldPackage == NEW_PACKAGE) return@execute

            val elements = doc.getElementsByTagName("*")
            for (i in 0 until elements.length) {
                val element = elements.item(i) as Element
                val tag = element.tagName
                val attrs = element.attributes ?: continue
                for (j in 0 until attrs.length) {
                    val attr = attrs.item(j)
                    val local = attr.localName ?: attr.nodeName.substringAfter(':')
                    val value = attr.nodeValue ?: continue
                    val renamed = when {
                        tag == "manifest" && local == "package" && value == oldPackage ->
                            NEW_PACKAGE
                        (tag == "permission" || tag == "uses-permission" ||
                            tag == "uses-permission-sdk-23") && local == "name" ->
                            value.renamedPackage(oldPackage)
                        local == "permission" || local == "readPermission" || local == "writePermission" ->
                            value.renamedPackage(oldPackage)
                        tag == "provider" && local == "authorities" ->
                            value.split(";").joinToString(";") { it.renamedPackage(oldPackage) }
                        tag == "data" && local == "host" && value == "cct.$oldPackage" ->
                            "cct.$NEW_PACKAGE"
                        tag == "application" && local == "label" -> NEW_LABEL
                        else -> value
                    }
                    if (renamed != value) attr.nodeValue = renamed
                }
            }
        }
    }
}
