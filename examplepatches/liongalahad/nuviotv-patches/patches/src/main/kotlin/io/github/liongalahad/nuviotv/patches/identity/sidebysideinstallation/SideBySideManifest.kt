package io.github.liongalahad.nuviotv.patches.identity.sidebysideinstallation

import org.w3c.dom.Document
import org.w3c.dom.Element

internal object SideBySideManifest {
    const val ORIGINAL_PACKAGE = "com.nuvio.tv"
    const val MORPHE_PACKAGE = "com.nuvio.morphe"
    const val MORPHE_LABEL = "Nuvio Morphe"

    fun transform(document: Document) {
        val manifest = document.documentElement
        check(manifest.tagName == "manifest") { "AndroidManifest.xml has no manifest root" }
        check(manifest.getAttribute("package") == ORIGINAL_PACKAGE) {
            "Expected manifest package $ORIGINAL_PACKAGE"
        }

        val applications = document.getElementsByTagName("application")
        check(applications.length == 1) { "Expected exactly one application element" }

        renameDeclaredPermissions(document)
        renameProviderAuthorities(document)
        manifest.setAttribute("package", MORPHE_PACKAGE)
        (applications.item(0) as Element).setAttribute("android:label", MORPHE_LABEL)
    }

    private fun renameDeclaredPermissions(document: Document) {
        val renamed = mutableMapOf<String, String>()
        val declarations = document.getElementsByTagName("permission")
        for (index in 0 until declarations.length) {
            val permission = declarations.item(index) as Element
            val name = permission.getAttribute("android:name")
            check(name.startsWith("$ORIGINAL_PACKAGE.")) {
                "Unexpected app-defined permission: $name"
            }
            renamed[name] = name.replacePackagePrefix()
            permission.setAttribute("android:name", renamed.getValue(name))
        }

        val usesPermissions = document.getElementsByTagName("uses-permission")
        for (index in 0 until usesPermissions.length) {
            val permission = usesPermissions.item(index) as Element
            val name = permission.getAttribute("android:name")
            renamed[name]?.let { permission.setAttribute("android:name", it) }
        }

        renamed.keys.forEach { original ->
            check((0 until usesPermissions.length).any { index ->
                (usesPermissions.item(index) as Element)
                    .getAttribute("android:name") == renamed.getValue(original)
            }) { "App-defined permission is not requested by the manifest: $original" }
        }
    }

    private fun renameProviderAuthorities(document: Document) {
        val providers = document.getElementsByTagName("provider")
        for (index in 0 until providers.length) {
            val provider = providers.item(index) as Element
            val authorities = provider.getAttribute("android:authorities")
            check(authorities.isNotBlank()) { "Provider has no android:authorities value" }
            val renamed = authorities.split(';').joinToString(";") { authority ->
                val value = authority.trim()
                check(value.startsWith("$ORIGINAL_PACKAGE.")) {
                    "Unexpected provider authority: $value"
                }
                value.replacePackagePrefix()
            }
            provider.setAttribute("android:authorities", renamed)
        }
    }

    private fun String.replacePackagePrefix() = MORPHE_PACKAGE + removePrefix(ORIGINAL_PACKAGE)
}
