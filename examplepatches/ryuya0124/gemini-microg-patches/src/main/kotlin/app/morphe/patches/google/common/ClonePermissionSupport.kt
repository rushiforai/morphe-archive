package app.morphe.patches.google.common

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.replaceStrings
import app.morphe.patcher.string
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

/** Matches the permission namespace algorithm in the pinned official Clone app patch. */
object ClonePermissionNames {
    fun renamed(name: String, originalPackage: String): String {
        require(!name.startsWith('.')) { "Relative custom permission is unsupported: $name" }
        val clone = "$originalPackage.morphe"
        return if (name.startsWith("$originalPackage.")) clone + name.removePrefix(originalPackage)
        else "${clone}_$name"
    }
}

private fun permissionSupport(originalPackage: String): app.morphe.patcher.patch.BytecodePatch {
    var names = emptyMap<String, String>()
    val manifestReferences = rawResourcePatch {
        dependsOn(automaticCloneSetupPatch)
        execute {
            VersionHookRegistry.requireProfile(packageMetadata)
            check(packageMetadata.packageName == originalPackage)
            editManifest { doc ->
                names = doc.elements("permission").associate { declaration ->
                    val old = declaration.android("name")
                    check(old.isNotBlank())
                    old to ClonePermissionNames.renamed(old, originalPackage)
                }
                for (element in doc.elements("*")) {
                    // The automatic clone finalizer owns declarations; leaving them
                    // unchanged here also avoids double rewriting by optional Clone app.
                    val attributes = mutableListOf("permission", "readPermission", "writePermission")
                    if (element.tag.startsWith("uses-permission")) attributes.add("name")
                    for (attribute in attributes) {
                        names[element.android(attribute)]?.let { element.setAndroid(attribute, it) }
                    }
                }
            }
        }
    }
    return bytecodePatch {
        dependsOn(manifestReferences)
        execute {
            VersionHookRegistry.requireProfile(packageMetadata)
            check(packageMetadata.packageName == originalPackage && names.isNotEmpty())
            var rewritten = 0
            // Static String field initial values are not const-string instructions. Read the
            // indexed candidates first and make only classes with a matching field mutable.
            val fieldClasses = names.keys.flatMap { classDefByStrings(it) }.distinctBy { it.type }
                .filter { clazz -> clazz.fields.any { (it.initialValue as? StringEncodedValue)?.value in names } }
            for (clazz in fieldClasses) {
                for (field in mutableClassDefBy(clazz).fields) {
                    val value = field.initialValue as? StringEncodedValue ?: continue
                    names[value.value]?.let { replacement ->
                        (field.initialValue as MutableStringEncodedValue).value = replacement
                        rewritten++
                    }
                }
            }
            rewritten += replaceStrings(names.map { (old, new) -> string(old) to new })
            println("[ClonePermissions] ${names.size} declared permissions; $rewritten DEX references updated for $originalPackage.morphe")
        }
    }
}

internal val googleClonePermissionSupport = permissionSupport("com.google.android.googlequicksearchbox")
internal val geminiClonePermissionSupport = permissionSupport("com.google.android.apps.bard")
