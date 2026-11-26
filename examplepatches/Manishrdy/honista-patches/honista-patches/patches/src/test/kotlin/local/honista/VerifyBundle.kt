package local.honista

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.dex.BytecodeMode
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import kotlinx.coroutines.runBlocking
import java.io.File
import java.security.MessageDigest

private fun canonical(def: ClassDef): String {
    val store = MemoryDataStore()
    val pool = DexPool(Opcodes.getDefault())
    pool.internClass(def)
    pool.writeTo(store)
    return MessageDigest.getInstance("SHA-256").digest(store.data.copyOf(store.size))
        .joinToString("") { "%02x".format(it.toInt() and 255) }
}
fun main(args: Array<String>) = runBlocking {
    val bundle = File(args[0])
    val input = File(args[1])
    val expected = File(args[2])
    val destination = File(args[3]).apply { mkdirs() }
    val reject = args.getOrNull(4) == "reject"
    val patches = loadPatchesFromJar(setOf(bundle))
    check(patches.size == 1) { "Expected one selectable patch, got ${patches.size}" }
    println("Loaded: ${patches.single().name}")
    Patcher(PatcherConfig(input, File(destination, "work"), useBytecodeMode = BytecodeMode.STRIP_SAFE)).use { patcher ->
        patcher += patches.toSet()
        val failures = mutableListOf<String>()
        patcher().collect { result -> result.exception?.let { failures += it.stackTraceToString() } }
        if (reject) {
            check(failures.any { "Unsupported input" in it }) { "Expected input guard rejection: $failures" }
            println("PASS: Already-patched input rejected before replacements")
            return@use
        }
        check(failures.isEmpty()) { failures.joinToString("\n") }
        if (args.getOrNull(4) == "apply") {
            val result = patcher.get()
            var dexCount = 0
            result.dexFiles.forEach { dex ->
                dex.stream.use { stream ->
                    File(destination, dex.name).outputStream().use { stream.copyTo(it) }
                }
                dexCount++
            }
            check(dexCount > 0)
            val originals = DexFileFactory.loadDexContainer(input, Opcodes.getDefault())
            val protectedTypes = setOf("LX/Ail9;",
                "LX/gΨ丷Ж乁π丂θ临丄Ν串丣丰д丵κأЭΕΓ丯δг;",
                "LX/z丳ظر乂ЕΣΔ乓Ь业九ΛЦΥПεНβ丐ؤح么乆;")
            val protectedOriginals = originals.dexEntryNames.flatMap { name ->
                originals.getEntry(name)!!.dexFile.classes.filter { it.type in protectedTypes }
            }.associateBy { it.type }
            val emitted = result.dexFiles.flatMap { dex ->
                DexFileFactory.loadDexFile(File(destination, dex.name), Opcodes.getDefault()).classes
                    .filter { it.type in protectedTypes }
            }
            check(emitted.size == protectedTypes.size && protectedOriginals.keys == protectedTypes)
            for (def in emitted) {
                val original = protectedOriginals.getValue(def.type)
                for (native in original.methods.filter { it.accessFlags and 0x100 != 0 }) {
                    val method = def.methods.single { it.name == native.name &&
                        it.parameterTypes == native.parameterTypes && it.returnType == native.returnType }
                    check(method.accessFlags == native.accessFlags && method.implementation == null) {
                        "Native declaration changed: ${def.type}->${native.name}"
                    }
                }
                if (def.type == "LX/Ail9;") {
                    // Only the two Java task entry points change. JNI still
                    // registers the original constructor and native c().
                    for (method in def.methods.filter { it.name == "b" || it.name == "d" }) {
                        check(method.implementation!!.instructions.none {
                            val ref = (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference
                                as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
                            ref?.definingClass == "LX/Ail9;" && ref.name == "c"
                        }) { "Java startup task still invokes remote loader" }
                    }
                }
            }
            println("PASS: Native declarations preserved; Java startup tasks bypass remote loader")
            val asset = File(result.resources!!.otherResources!!, "assets/local-startup-module.dex")
            check(asset.readBytes().contentEquals(java.util.zip.ZipFile(bundle).use {
                it.getInputStream(it.getEntry("honista/startup-module.dex")).readBytes()
            }))
            println("PASS: Original APK patched and $dexCount DEX files compiled; module asset matches bundle")
            return@use
        }
        val container = DexFileFactory.loadDexContainer(expected, Opcodes.getDefault())
        val targets = File(args[5]).readLines().filter { it.isNotBlank() }.toSet()
        val expectedHashes = mutableMapOf<String, String>()
        container.dexEntryNames.forEach { name ->
            container.getEntry(name)!!.dexFile.classes.forEach { def ->
                if (def.type in targets) {
                    expectedHashes[def.type] = canonical(def)
                }
            }
        }
        check(expectedHashes.size == targets.size) { "Missing expected classes" }
        val result = patcher.get()
        result.dexFiles.forEach { dex -> dex.stream.use { inputStream -> File(destination, dex.name).outputStream().use { inputStream.copyTo(it) } } }
        val seen = mutableSetOf<String>()
        result.dexFiles.forEach { dex ->
            val emitted = DexFileFactory.loadDexFile(File(destination, dex.name), Opcodes.getDefault())
            emitted.classes.forEach { def ->
                if (def.type in targets) {
                    check(seen.add(def.type)) { "Duplicate emitted class: ${def.type}" }
                    check(canonical(def) == expectedHashes[def.type]) { "Compiled mismatch: ${def.type}" }
                }
            }
        }
        check(seen == targets) { "Missing compiled classes: ${targets - seen}" }
        println("PASS: All ${seen.size} compiled modified/added classes exactly match the tested build")
        val asset = File(result.resources!!.otherResources!!, "assets/local-startup-module.dex")
        check(asset.readBytes().contentEquals(java.util.zip.ZipFile(expected).use { it.getInputStream(it.getEntry("assets/local-startup-module.dex")).readBytes() }))
        asset.copyTo(File(destination, "local-startup-module.dex"), true)
        println("PASS: Startup-module asset exactly matches tested build; compiled ${result.dexFiles.size} DEX files")
    }
}
