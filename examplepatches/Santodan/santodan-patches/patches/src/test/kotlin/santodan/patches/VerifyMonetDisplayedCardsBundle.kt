package santodan.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import java.io.File
import java.util.zip.ZipFile
import kotlinx.coroutines.runBlocking

fun main(args: Array<String>) = runBlocking {
    val original = VerifyMonet.read(args[0])
    val contracts = MonetDisplayedCardsPatch.validate(original)
    val catalogContracts = MonetCatalogChannelsPatch.validate(original)
    val byType = original.associateBy { it.type }
    val loaded = loadPatchesFromJar(setOf(File(args[1])))
    val selections = listOf(setOf(MonetDisplayedCardsPatch.NAME),
        setOf(MonetDisplayedCardsPatch.NAME, MonetCatalogChannelsPatch.NAME),
        setOf(MonetDisplayedCardsPatch.NAME, MonetCatalogChannelsPatch.NAME, MonetPremiumPatch.NAME),
        setOf(MonetDisplayedCardsPatch.NAME, MonetCatalogChannelsPatch.NAME, MonetPremiumPatch.EXPERIMENTAL))
    for ((index, names) in selections.withIndex()) {
        val selected = loaded.filter { it.name in names }.toSet()
        check(selected.size == names.size)
        val compatibility = selected.single { it.name == MonetDisplayedCardsPatch.NAME }.compatibility!!.single()
        check(compatibility.packageName == "com.klevico.monet" && compatibility.targets.single().version == "1.0.97")
        val output = File(args[2], "selection-$index").apply { mkdirs() }
        Patcher(PatcherConfig(apkFile = File(args[0]), temporaryFilesPath = File(output, "work"))).use { patcher ->
            patcher += selected
            patcher().collect { it.exception?.let { error -> throw error } }
            val result = patcher.get()
            val seen = mutableSetOf<String>()
            val added = mutableSetOf<String>()
            val callbacks = mutableSetOf<String>()
            var hookCount = 0
            var catalogHooks = 0
            val replaced = result.dexFiles.map { it.name }.toSet()
            fun verify(c: com.android.tools.smali.dexlib2.iface.ClassDef) {
                check(seen.add(c.type)) { "Duplicate class ${c.type}" }
                val before = byType[c.type]
                if (before == null) {
                    check(c.type.startsWith("Lsoftware/santodan/extension/monetcards/") || index > 0 && c.type.startsWith("Lsoftware/santodan/extension/monetchannels/")) { "Unexpected new class ${c.type}" }
                    added += c.type
                    if (c.type.startsWith("Lsoftware/santodan/extension/monetcards/")) {
                        for (method in c.methods) for (instruction in method.implementation?.instructions ?: emptyList()) {
                            val reference = (instruction as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString() ?: continue
                            check(!reference.startsWith("Landroid/app/") && !reference.startsWith("Landroid/widget/")) { "Native picker adapter unexpectedly references platform UI: $reference" }
                        }
                    }
                    if (c.type == MonetDisplayedCardsPatch.UI || c.type == MonetDisplayedCardsPatch.MODEL) callbacks += c.methods.map { it.name }
                    return
                }
                val methods = before.methods.associateBy { it.toString() }
                check(c.methods.count() == methods.size)
                for (m in c.methods) {
                    val old = methods[m.toString()] ?: error("Unexpected original method $m")
                    if (m.toString() in MonetDisplayedCardsPatch.TARGETS) {
                        VerifyMonetDisplayedCards.mutation(contracts[m.toString()], m)
                        hookCount++
                    } else if (index > 0 && m.toString() in MonetCatalogChannelsPatch.TARGETS) {
                        VerifyMonetCatalog.mutation(catalogContracts[m.toString()], m)
                        catalogHooks++
                    } else if (index > 1 && m.toString() == "La/sa5;->a()Z") {
                        VerifyMonet.verifyBehavior(old, m)
                    } else if (old.implementation != null) {
                        check(NuvioPlaybackButtonsPatch.fingerprint(MutableMethod(old)) == NuvioPlaybackButtonsPatch.fingerprint(MutableMethod(m))) { "Unrelated method modified: $m" }
                    }
                }
            }
            for (dex in result.dexFiles) {
                val file = File(output, dex.name)
                dex.stream.use { input -> file.outputStream().use { input.copyTo(it) } }
                file.inputStream().buffered().use { input -> DexBackedDexFile.fromInputStream(null, input).classes.forEach(::verify) }
            }
            ZipFile(args[0]).use { zip ->
                for (entry in zip.entries().asSequence()) {
                    if (!entry.name.matches(Regex("classes[0-9]*\\.dex")) || entry.name in replaced) continue
                    zip.getInputStream(entry).buffered().use { input -> DexBackedDexFile.fromInputStream(null, input).classes.forEach(::verify) }
                }
            }
            check(hookCount == 5 && catalogHooks == (if (index > 0) MonetCatalogChannelsPatch.TARGETS.size else 0) && seen.containsAll(byType.keys) && added.isNotEmpty())
            check(callbacks.containsAll(listOf("buttons", "footer", "properties", "schemaMaximum", "label", "step", "pickerMaximum", "number")))
            println("PASS: packaged displayed cards patch selection $index applies; callbacks merged; original class set retained; only intended methods change; no cross-DEX duplicates")
        }
    }
}
