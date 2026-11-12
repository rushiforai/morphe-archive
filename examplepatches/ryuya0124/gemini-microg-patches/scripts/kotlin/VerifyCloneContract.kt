import app.morphe.patches.google.common.ClonePermissionNames
import com.reandroid.apk.ApkModule
import com.reandroid.arsc.chunk.xml.ResXmlElement
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import java.io.File
import java.util.zip.ZipFile

private data class Node(val tag: String, val attrs: Map<String,String>)
private data class Manifest(val packageName: String, val versionName: String, val versionCode: String, val nodes: List<Node>)
private fun manifest(path: String): Manifest {
    val apk = ApkModule.loadApkFile(File(path))
    try {
        val block = apk.androidManifest
        val nodes = mutableListOf<Node>()
        fun visit(element: ResXmlElement) {
            nodes.add(Node(element.name, element.attributes.asSequence().associate { it.name.substringAfter(':') to it.valueAsString }))
            element.elements.asSequence().forEach { visit(it as ResXmlElement) }
        }
        visit(block.manifestElement)
        return Manifest(block.packageName, block.versionName, block.versionCode.toString(), nodes)
    } finally { apk.close() }
}
fun main(args: Array<String>) {
    require(args.size == 2) { "ORIGINAL_APK PATCHED_APK" }
    val original = manifest(args[0]); val patched = manifest(args[1])
    check(original.packageName in setOf("com.google.android.googlequicksearchbox", "com.google.android.apps.bard"))
    val clone = original.packageName + ".morphe"
    check(patched.packageName == clone) {
        "Unsupported clone package ${patched.packageName}; expected $clone. Keep Automatic Clone Setup selected."
    }
    check(patched.versionName == original.versionName && patched.versionCode == original.versionCode)
    val before = original.nodes.filter { it.tag == "permission" }.associate { it.attrs.getValue("name") to it }
    val after = patched.nodes.filter { it.tag == "permission" }.associate { it.attrs.getValue("name") to it }
    check(before.isNotEmpty())
    val names = before.keys.associateWith { ClonePermissionNames.renamed(it, original.packageName) }
    check(after.keys == names.values.toSet()) {
        "Custom permission declarations not isolated. Keep Automatic Clone Setup selected; missing=${names.values.toSet()-after.keys}; stale=${after.keys-names.values.toSet()}"
    }
    for ((name, replacement) in names) {
        check(before.getValue(name).attrs["protectionLevel"] == after.getValue(replacement).attrs["protectionLevel"]) {
            "Protection level changed for $name"
        }
    }
    val staleReferences = mutableListOf<String>()
    for (node in patched.nodes) {
        val attributes = mutableSetOf("permission", "readPermission", "writePermission")
        if (node.tag.startsWith("uses-permission")) attributes.add("name")
        for (key in attributes) if (node.attrs[key] in names.keys) staleReferences.add("${node.tag} $key=${node.attrs[key]}")
    }
    check(staleReferences.isEmpty()) { "Stale manifest permission references: $staleReferences" }
    fun authorities(m: Manifest) = m.nodes.filter { it.tag == "provider" }.flatMap { it.attrs["authorities"].orEmpty().split(';') }.filter { it.isNotEmpty() }.toSet()
    val oldAuthorities = authorities(original); val newAuthorities = authorities(patched)
    check(oldAuthorities.none { it.startsWith('@') } && newAuthorities.none { it.startsWith('@') }) { "Resolve resource-valued authorities before validating this APK" }
    check((oldAuthorities intersect newAuthorities).isEmpty()) {
        "Provider authority collision: ${oldAuthorities intersect newAuthorities}. Keep Automatic Clone Setup selected."
    }
    check(patched.nodes.count { it.tag == "provider" } == original.nodes.count { it.tag == "provider" })
    var staleDex = 0
    ZipFile(args[1]).use { z -> z.entries().asSequence().filter { it.name.matches(Regex("classes[0-9]*\\.dex")) }.forEach { entry ->
        val dex = z.getInputStream(entry).buffered().use { DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it) }
        for (clazz in dex.classes) {
            for (field in clazz.fields) if ((field.initialValue as? StringEncodedValue)?.value in names.keys) staleDex++
            for (method in clazz.methods) for (instruction in (method.implementation?.instructions ?: emptyList())) {
                val string = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                if (string in names.keys) staleDex++
            }
        }
    } }
    check(staleDex == 0) { "$staleDex stale custom-permission strings remain in DEX" }
    println("Clone contract verified: $clone; ${names.size} isolated permissions with unchanged protection; no stale manifest/DEX permission references; ${newAuthorities.size} noncolliding providers")
}
