package santodan.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import java.io.File
import java.util.zip.ZipFile
import kotlinx.coroutines.runBlocking

fun main(args: Array<String>) = runBlocking {
    val original = VerifyMonet.read(args[0])
    val hook = MonetPremiumPatch.findUnique(original)
    val loaded = loadPatchesFromJar(setOf(File(args[1])))
    val names = listOf(MonetPremiumPatch.NAME, MonetPremiumPatch.EXPERIMENTAL)
    for ((index, name) in names.withIndex()) {
        val selected = loaded.filter { it.name == name }.toSet()
        check(selected.size == 1)
        val compatibility = selected.single().compatibility!!.single()
        check(compatibility.packageName == "com.klevico.monet")
        check(compatibility.targets.single().version == if (index == 0) "1.0.97" else null)
        check(compatibility.targets.single().isExperimental == (index == 1))
        val output = File(args[2], "selection-$index").apply { mkdirs() }
        Patcher(PatcherConfig(apkFile = File(args[0]), temporaryFilesPath = File(output, "work"))).use { patcher ->
            patcher += selected
            patcher().collect { it.exception?.let { error -> throw error } }
            val result = patcher.get()
            var found = 0
            val seen = mutableSetOf<String>()
            val replaced = result.dexFiles.map { it.name }.toSet()
            val originalByType = original.associateBy { it.type }
            for (dex in result.dexFiles) {
                val file = File(output, dex.name)
                dex.stream.use { input -> file.outputStream().use { input.copyTo(it) } }
                file.inputStream().buffered().use { input ->
                    for (c in DexBackedDexFile.fromInputStream(null, input).classes) {
                        check(seen.add(c.type)) { "Duplicate class ${c.type}" }
                        check(c.type in originalByType) { "Unexpected new class ${c.type}" }
                        for (m in c.methods) if (m == hook) {
                            VerifyMonet.verifyBehavior(hook, m)
                            found++
                        }
                    }
                }
            }
            // Reconstruct STRIP_FAST output together with untouched original DEX.
            ZipFile(args[0]).use { zip ->
                for (entry in zip.entries().asSequence()) {
                    if (!entry.name.matches(Regex("classes[0-9]*\\.dex")) || entry.name in replaced) continue
                    zip.getInputStream(entry).buffered().use { input ->
                        for (c in DexBackedDexFile.fromInputStream(null, input).classes)
                            check(seen.add(c.type)) { "Duplicate retained class ${c.type}" }
                    }
                }
            }
            check(seen == originalByType.keys) { "Output class set differs from original" }
            check(found == 1) { "Patched evaluator missing or duplicated" }
            println("PASS: packaged $name applies; serialized evaluator passes all entitlement states; complete class set retained without cross-DEX duplicates")
        }
    }
}
