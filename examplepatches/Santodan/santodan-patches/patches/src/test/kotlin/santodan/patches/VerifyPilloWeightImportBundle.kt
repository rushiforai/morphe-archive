package santodan.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import kotlinx.coroutines.runBlocking
import java.io.File

/** Runs the packaged patch and extension together on the original APK. */
fun main(args: Array<String>) = runBlocking {
    val output = File(args[2]).apply { mkdirs() }
    val patches = loadPatchesFromJar(setOf(File(args[1]))).filter {
        it.name == PilloWeightImportPatch.NAME || it.name == PilloHybridNotificationPatch.NAME
    }.toSet()
    check(patches.size == 2) { "The bundle does not expose both Pillo patches" }
    Patcher(PatcherConfig(apkFile = File(args[0]), temporaryFilesPath = File(output, "work"))).use { patcher ->
        patcher += patches
        patcher().collect { result ->
            result.exception?.let { throw it }
            println("PASS: packaged patch applied: ${result.patch.name}")
        }
        val result = patcher.get()
        val classes = mutableSetOf<String>()
        var foundHook = false
        var foundFooter = false
        for (dex in result.dexFiles) {
            val target = File(output, dex.name)
            dex.stream.use { input -> target.outputStream().use { input.copyTo(it) } }
            target.inputStream().buffered().use { input ->
                val decoded = DexBackedDexFile.fromInputStream(null, input)
                for (owner in decoded.classes) {
                    classes.add(owner.type)
                    if (owner.type == PilloWeightImportPatch.FOOTER)
                        foundFooter = owner.methods.any { method -> PilloHybridNotificationPatch.instructions(method).any {
                            PilloHybridNotificationPatch.calls(it, PilloWeightImportPatch.EXTENSION, "footer", "V",
                                "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;", "Z", "Z", "Ljava/lang/String;",
                                "Ljava/lang/Object;", "I", "I")
                        } }
                    if (owner.type == PilloWeightImportPatch.ACTIVITY)
                        foundHook = owner.methods.any { method ->
                            method.name == "onCreate" && PilloHybridNotificationPatch.instructions(method).any {
                                PilloHybridNotificationPatch.calls(it, PilloWeightImportPatch.EXTENSION, "attach", "V", "Landroid/app/Activity;")
                            }
                        }
                }
            }
        }
        check(foundHook) { "Activity hook missing from assembled DEX" }
        check(foundFooter) { "Native weight footer hook missing from assembled DEX" }
        check(classes.contains(PilloWeightImportPatch.EXTENSION)) { "Importer was not merged" }
        check(classes.contains("Lsoftware/santodan/extension/pilloweight/PilloWeightImport\$ImportFragment;")) { "File-picker fragment was not merged" }
        check(classes.contains("Lsoftware/santodan/extension/pilloweight/WeightBackup;")) { "Parser was not merged" }
        println("PASS: original APK patched with both Pillo patches; assembled DEX reloads and includes importer, fragment and parser")
    }
}
