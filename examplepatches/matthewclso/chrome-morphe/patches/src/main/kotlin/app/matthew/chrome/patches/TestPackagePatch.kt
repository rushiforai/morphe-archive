package app.matthew.chrome.patches

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Element

private val identityReplacements = linkedMapOf<String, String>()

// Keep class names and resource IDs intact: native/JNI code still refers to original classes.
private val testPackageResources = resourcePatch {
    execute {
        requireTarget(packageMetadata)
        identityReplacements.clear()
        identityReplacements[ORIGINAL_PACKAGE] = TEST_PACKAGE
        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            val nodes = root.getElementsByTagName("*")
            val components = setOf("application", "activity", "activity-alias", "service", "receiver", "provider")
            for (index in 0 until nodes.length) {
                val element = nodes.item(index) as Element
                if (element.tagName in components) {
                    for (attribute in listOf("name", "targetActivity", "backupAgent", "appComponentFactory")) {
                        val value = element.getAttribute("android:$attribute")
                        if (value.startsWith(".")) {
                            element.setAttribute("android:$attribute", ORIGINAL_PACKAGE + value)
                        } else if (value.isNotEmpty() && !value.contains('.')) {
                            element.setAttribute("android:$attribute", "$ORIGINAL_PACKAGE.$value")
                        }
                    }
                }
                val identityAttributes = mutableListOf("authorities", "permission", "readPermission", "writePermission", "taskAffinity")
                if (element.tagName in setOf("permission", "permission-group", "permission-tree", "uses-permission")) {
                    identityAttributes += "name"
                }
                for (attribute in identityAttributes) {
                    val value = element.getAttribute("android:$attribute")
                    if (value.isEmpty()) continue
                    val updated = value.split(';').joinToString(";") { item ->
                        if (item == ORIGINAL_PACKAGE || item.startsWith("$ORIGINAL_PACKAGE.")) {
                            val replacement = TEST_PACKAGE + item.removePrefix(ORIGINAL_PACKAGE)
                            identityReplacements[item] = replacement
                            replacement
                        } else item
                    }
                    if (updated != value) element.setAttribute("android:$attribute", updated)
                }
            }
            root.setAttribute("package", TEST_PACKAGE)
            val application = root.getElementsByTagName("application").item(0) as Element
            application.setAttribute("android:label", "Chrome Morphe")
            for (index in 0 until nodes.length) {
                val element = nodes.item(index) as Element
                if (element.tagName in setOf("activity", "activity-alias") &&
                    element.getElementsByTagName("category").let { categories ->
                        (0 until categories.length).any {
                            (categories.item(it) as Element).getAttribute("android:name") == "android.intent.category.LAUNCHER"
                        }
                    }) {
                    element.setAttribute("android:label", "Chrome Morphe")
                }
            }
        }
        check(identityReplacements.containsKey("$ORIGINAL_PACKAGE.permission.CHILD_SERVICE") &&
            identityReplacements.containsKey("$ORIGINAL_PACKAGE.FileProvider")) {
            "Expected Chrome permission and provider declarations were not found; refusing an incomplete manifest rename."
        }
        println("Test package manifest prepared; ${identityReplacements.size} identity mappings.")
    }
}

val testPackagePatch = bytecodePatch(
    name = "Separate Chrome Morphe installation",
    description = "Installs as Chrome Morphe alongside stock Chrome. Exact-build only.",
    default = false,
) {
    compatibleWith(chromeCompatibility)
    dependsOn(testPackageResources)
    execute {
        requireTarget(packageMetadata)
        var replacements = 0
        classDefForEach { classDef ->
            for (method in classDef.methods) {
                val instructions = method.implementation?.instructions?.toList() ?: continue
                val updates = instructions.mapIndexedNotNull { index, instruction ->
                    if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) return@mapIndexedNotNull null
                    val value = ((instruction as ReferenceInstruction).reference as StringReference).string
                    val replacement = identityReplacements[value] ?: identityReplacements.entries
                        .firstOrNull { value.startsWith("content://${it.key}/") }
                        ?.let { "content://${it.value}/" + value.removePrefix("content://${it.key}/") }
                    replacement?.let { Triple(index, instruction, it) }
                }
                if (updates.isEmpty()) continue
                val mutable = mutableClassDefBy(classDef).methods.single {
                    it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
                }
                for ((index, instruction, value) in updates) {
                    val register = (instruction as OneRegisterInstruction).registerA
                    val reference = ImmutableStringReference(value)
                    mutable.replaceInstruction(index,
                        if (instruction.opcode == Opcode.CONST_STRING_JUMBO)
                            BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, reference)
                        else BuilderInstruction21c(Opcode.CONST_STRING, register, reference))
                    replacements++
                }
            }
        }
        check(replacements > 0) { "No Chrome identity strings found; refusing an incomplete rename." }
        println("Rewrote $replacements package identity strings; component class names preserved.")
    }
}
