package app.morphe.patches.google.common

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Element

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
    val manifestReferences = resourcePatch {
        dependsOn(automaticCloneSetupPatch)
        execute {
            VersionHookRegistry.requireProfile(packageMetadata)
            check(packageMetadata.packageName == originalPackage)
            document("AndroidManifest.xml").use { doc ->
                val ns = "http://schemas.android.com/apk/res/android"
                fun read(element: Element, name: String) = element.getAttributeNS(ns, name).ifEmpty { element.getAttribute("android:$name") }
                val declarations = doc.getElementsByTagName("permission")
                names = (0 until declarations.length).associate { i ->
                    val old = read(declarations.item(i) as Element, "name")
                    check(old.isNotBlank())
                    old to ClonePermissionNames.renamed(old, originalPackage)
                }
                val all = doc.getElementsByTagName("*")
                for (i in 0 until all.length) {
                    val element = all.item(i) as Element
                    // The automatic clone finalizer owns declarations; leaving them
                    // unchanged here also avoids double rewriting by optional Clone app.
                    val attributes = mutableListOf("permission", "readPermission", "writePermission")
                    if (element.tagName.startsWith("uses-permission")) attributes.add("name")
                    for (attribute in attributes) {
                        names[read(element, attribute)]?.let {
                            element.setAttribute("android:$attribute", it)
                        }
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
            val candidates = names.keys.flatMap { getAllClassesWithString(it) }.distinctBy { it.type }
            for (clazz in candidates) {
                val mutable = mutableClassDefBy(clazz)
                for (field in mutable.fields) {
                    val value = field.initialValue as? StringEncodedValue ?: continue
                    names[value.value]?.let { replacement ->
                        (field.initialValue as MutableStringEncodedValue).value = replacement
                        rewritten++
                    }
                }
                for (method in mutable.methods) {
                    if (method.implementation == null) continue
                    for ((index, instruction) in method.instructions.toList().withIndex()) {
                        if (instruction.opcode !in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO)) continue
                        val ref = (instruction as ReferenceInstruction).reference as? StringReference ?: continue
                        val replacement = names[ref.string] ?: continue
                        val reg = (instruction as OneRegisterInstruction).registerA
                        val string = ImmutableStringReference(replacement)
                        method.replaceInstruction(index, if (instruction.opcode == Opcode.CONST_STRING_JUMBO)
                            BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, reg, string)
                        else BuilderInstruction21c(Opcode.CONST_STRING, reg, string))
                        rewritten++
                    }
                }
            }
            println("[ClonePermissions] ${names.size} declared permissions; $rewritten DEX references updated for $originalPackage.morphe")
        }
    }
}

internal val googleClonePermissionSupport = permissionSupport("com.google.android.googlequicksearchbox")
internal val geminiClonePermissionSupport = permissionSupport("com.google.android.apps.bard")
