package santodan.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import java.io.File
import java.util.zip.ZipFile
import kotlinx.coroutines.runBlocking

fun main(args: Array<String>) = runBlocking {
    val original = VerifyMonet.read(args[0])
    MonetCatalogChannels110.validate(original)
    val loaded = loadPatchesFromJar(setOf(File(args[1])))
    val selections = listOf(setOf(MonetCatalogChannelsPatch.NAME),
        setOf(MonetCatalogChannelsPatch.NAME, MonetDisplayedCardsPatch.NAME),
        setOf(MonetCatalogChannelsPatch.NAME, MonetPremiumPatch.NAME),
        setOf(MonetCatalogChannelsPatch.NAME, MonetPremiumPatch.EXPERIMENTAL),
        setOf(MonetCatalogChannelsPatch.NAME, MonetDisplayedCardsPatch.NAME, MonetPremiumPatch.NAME),
        setOf(MonetCatalogChannelsPatch.NAME, MonetDisplayedCardsPatch.NAME, MonetPremiumPatch.EXPERIMENTAL))
    for ((index, names) in selections.withIndex()) {
        val selected = loaded.filter { it.name in names }.toSet()
        check(selected.size == names.size)
        val compatibility = selected.single { it.name == MonetCatalogChannelsPatch.NAME }.compatibility!!.single()
        check(compatibility.packageName == "com.klevico.monet")
        check(compatibility.targets.map { it.version }.toSet() == setOf("1.0.97", "1.1.0"))
        val output = File(args[2], "selection-$index").apply { mkdirs() }
        Patcher(PatcherConfig(apkFile = File(args[0]), temporaryFilesPath = File(output,"work"))).use { patcher ->
            patcher += selected
            patcher().collect { it.exception?.let { failure -> throw failure } }
            val result = patcher.get()
            val patched = mutableListOf<ClassDef>()
            val replaced = result.dexFiles.map { it.name }.toSet()
            for (dex in result.dexFiles) {
                val file = File(output, dex.name)
                dex.stream.use { input -> file.outputStream().use { input.copyTo(it) } }
                file.inputStream().buffered().use { patched += DexBackedDexFile.fromInputStream(null,it).classes }
            }
            ZipFile(args[0]).use { zip ->
                for (entry in zip.entries().asSequence()) {
                    if (!entry.name.matches(Regex("classes[0-9]*\\.dex")) || entry.name in replaced) continue
                    zip.getInputStream(entry).buffered().use { patched += DexBackedDexFile.fromInputStream(null,it).classes }
                }
            }
            VerifyMonetCatalog110.audit(original, patched, MonetDisplayedCardsPatch.NAME in names, index > 1)
            println("PASS: packaged Monet 1.1.0 catalog selection $index: $names")
        }
    }
}
