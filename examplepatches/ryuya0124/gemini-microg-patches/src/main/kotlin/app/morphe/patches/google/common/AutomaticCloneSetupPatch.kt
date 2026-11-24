package app.morphe.patches.google.common

import app.morphe.patcher.patch.rawResourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private fun Document.elements(tag: String): List<Element> = getElementsByTagName(tag).let { nodes ->
    (0 until nodes.length).map { nodes.item(it) as Element }
}

/** A provider authority that is a resource reference cannot be read from the binary manifest. */
private fun ManifestElement.authorities(): String = android("authorities").also {
    check(it.isNotEmpty() || !hasAndroid("authorities")) { "Provider authority resources need decoded resources" }
}

private data class ProviderDeclaration(val component: String, val authorities: String)
private data class CloneManifestInput(
    val originalPackage: String,
    val permissions: List<String>,
    val providers: List<ProviderDeclaration>,
    val authorityStrings: Map<String, String>
)

/**
 * Keep this default patch sorted before optional external "Clone app". Patcher 1.12-2.5
 * executes selected patches by name and finalizes in reverse execution order, so
 * this snapshot-based finalizer also repairs the external patch's default options.
 * No external patch implementation or reflective option mutation is required.
 */
val automaticCloneSetupPatch = rawResourcePatch(
    name = "Automatic Clone Setup",
    description = "Automatically creates the fixed .morphe clone and isolates its permissions and providers. No official Clone app or Expert mode configuration is required.",
    default = true
) {
    compatibleWith(*VersionHookRegistry.compatibility("com.google.android.googlequicksearchbox", "com.google.android.apps.bard"))
    var input: CloneManifestInput? = null

    execute {
        VersionHookRegistry.requireProfile(packageMetadata)
        val original = packageMetadata.packageName
        var permissions = emptyList<String>()
        var providers = emptyList<ProviderDeclaration>()
        editManifest { doc ->
            check(doc.root.attribute("package") == original) { "Use an unpatched original APK" }
            permissions = doc.elements("permission").map { it.android("name") }
            providers = doc.elements("provider").map {
                ProviderDeclaration(it.android("name"), it.authorities())
            }
        }
        val resourceNames = providers.flatMap { it.authorities.split(';') }
            .filter { it.startsWith("@string/") }.map { it.removePrefix("@string/") }.toSet()
        val strings = if (resourceNames.isEmpty()) emptyMap() else {
            @Suppress("DEPRECATION")
            document("res/values/strings.xml").use { doc ->
                doc.elements("string").filter { it.getAttribute("name") in resourceNames }
                    .associate { it.getAttribute("name") to it.textContent }
            }.also { check(it.keys == resourceNames) { "Unresolved provider authority resources" } }
        }
        check(permissions.isNotEmpty() && permissions.none { it.isBlank() })
        input = CloneManifestInput(original, permissions, providers, strings)
    }

    finalize {
        val snapshot = checkNotNull(input)
        val original = snapshot.originalPackage
        val clone = "$original.morphe"
        fun authority(value: String): String = value.split(';').joinToString(";") {
            when {
                it.startsWith("@string/") -> it
                it.startsWith('@') -> error("Unsupported provider authority resource: $it")
                it.startsWith("$original.") -> clone + it.removePrefix(original)
                it.isBlank() -> error("Empty provider authority")
                else -> "${clone}_$it"
            }
        }
        editManifest { doc ->
            val current = doc.root.attribute("package")
            check(current == original || current == clone) {
                "Unsupported clone package $current; use Automatic Clone Setup with the fixed $clone package"
            }
            doc.root.setAttribute("package", clone)
            val declarations = doc.elements("permission")
            check(declarations.size == snapshot.permissions.size) { "Permission declarations changed unexpectedly" }
            for ((element, oldName) in declarations.zip(snapshot.permissions)) {
                val newName = ClonePermissionNames.renamed(oldName, original)
                check(element.android("name") in setOf(oldName, newName)) {
                    "Unexpected permission rewrite; keep Automatic Clone Setup selected"
                }
                element.setAndroid("name", newName)
            }
            val providers = doc.elements("provider")
            check(providers.size == snapshot.providers.size) { "Provider declarations changed unexpectedly" }
            for ((element, before) in providers.zip(snapshot.providers)) {
                check(element.android("name") == before.component)
                element.setAndroid("authorities", authority(before.authorities))
            }
        }
        // Compiling decoded resources renames the table package with the manifest; raw resources do not.
        if (usesBinaryManifest()) renameRawTablePackage(original, clone)
        if (snapshot.authorityStrings.isNotEmpty()) {
            @Suppress("DEPRECATION")
            document("res/values/strings.xml").use { doc ->
                for (element in doc.elements("string")) {
                    snapshot.authorityStrings[element.getAttribute("name")]?.let {
                        element.textContent = authority(it)
                    }
                }
            }
        }
        println("[AutomaticCloneSetup] $clone: ${snapshot.permissions.size} permissions and ${snapshot.providers.size} providers isolated")
    }
}
