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
    val plan = FyloProPatch.findUnique(original)
    val loaded = loadPatchesFromJar(setOf(File(args[1])))
    val names = listOf(FyloProPatch.NAME, FyloProPatch.EXPERIMENTAL)
    for ((index, name) in names.withIndex()) {
        val selected = loaded.filter { it.name == name }.toSet()
        check(selected.size == 1)
        val compatibility = selected.single().compatibility!!.single()
        check(compatibility.packageName == "com.aeroloom.fylofilemanager")
        if (index == 0) check(compatibility.targets.map { it.version }.toSet() == setOf("2.6"))
        else check(compatibility.targets.single().version == null)
        check(compatibility.targets.all { it.isExperimental == (index == 1) })
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
                        for (m in c.methods) {
                            if (m == plan.seed) { VerifyFylo.verifyMethod(plan.seed, m, plan.seedIndex); found++ }
                            if (m == plan.refresh) { VerifyFylo.verifyMethod(plan.refresh, m, plan.refreshIndex); found++ }
                            if (m == plan.license) {
                                val body = FyloProPatch.instructions(m)
                                val before = FyloProPatch.instructions(plan.license)
                                check(body.size == before.size + 1)
                                check(body.first().opcode == com.android.tools.smali.dexlib2.Opcode.RETURN_VOID)
                                check(body.drop(1).map { VerifyFylo.key(it) } == before.map { VerifyFylo.key(it) })
                                found++
                            }
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
            check(found == 3) { "Patched hooks missing or duplicated" }
            println("PASS: packaged $name applies; serialized startup/refresh preserve Pro across enum states; Pairip entry returns early; complete class set retained without cross-DEX duplicates")
        }
    }
}
