package santodan.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import kotlinx.coroutines.runBlocking
import software.santodan.extension.pillosummary.PilloWeightSummary
import java.io.File
import java.util.zip.ZipFile
import java.util.zip.ZipOutputStream
import java.util.zip.ZipEntry

fun main(args: Array<String>) = runBlocking {
    check(PilloWeightSummary.format(PilloWeightSummary.delta(listOf(110.7, 108.5, 108.2, 107.4, 105.0), false)) == "-5.7")
    check(PilloWeightSummary.format(PilloWeightSummary.delta(listOf(153.0, 105.0), false)) == "-48")
    check(PilloWeightSummary.format(PilloWeightSummary.delta(listOf(105.0, 108.0), false)) == "+3")
    check(PilloWeightSummary.format(PilloWeightSummary.delta(listOf(107.4, 105.0), false)) == "-2.4")
    check(PilloWeightSummary.delta(emptyList(), false) == null)
    check(PilloWeightSummary.delta(listOf(105.0), true) == null)
    check(PilloWeightSummary.format(0.001) == "0")
    val dates = listOf(20250904L, 20250912L, 20250918L, 20250925L, 20251009L)
    val weights = listOf(110.7, 108.5, 108.2, 107.4, 105.0)
    check(PilloWeightSummary.format(PilloWeightSummary.since(dates, weights, 20250912L, 20251009L)) == "-3.5")
    check(PilloWeightSummary.format(PilloWeightSummary.since(dates, weights, 20250913L, 20251009L)) == "-3.2")
    check(PilloWeightSummary.since(dates, weights, 20251009L, 20251009L) == null)
    check(PilloWeightSummary.since(dates, weights, 20251010L, 20251009L) == null)
    val full = listOf(1, 2, 3, 4, 5, 6)
    val filtered = PilloWeightSummary.takeLast(full, 2)
    check(filtered == listOf(5, 6) && (filtered as PilloWeightSummary.History).all == full)
    check(PilloWeightSummary.takeLast(full, PilloWeightSummary.ALL) == full)
    check(PilloWeightSummary.takeLast(emptyList<Any>(), PilloWeightSummary.ALL).isEmpty())
    println("PASS: selected total, signed change, insufficient data, rounding and full history retention")
    val output = File(args[2]).apply { mkdirs() }
    val patches = loadPatchesFromJar(setOf(File(args[1]))).filter {
        it.name in setOf(PilloWeightSummaryPatch.NAME, PilloWeightImportPatch.NAME,
            PilloLocalBackupPatch.NAME, PilloHybridNotificationPatch.NAME)
    }.toSet()
    check(patches.size == 4) { "Missing Pillo patch in bundle" }
    Patcher(PatcherConfig(apkFile = File(args[0]), temporaryFilesPath = File(output, "work"))).use { patcher ->
        patcher += patches
        patcher().collect { result ->
            result.exception?.let { throw it }
            println("PASS: packaged patch applied: ${result.patch.name}")
        }
        val result = patcher.get()
        val calls = mutableSetOf<String>()
        val classes = mutableSetOf<String>()
        val dexFiles = mutableListOf<File>()
        val definitions = mutableSetOf<String>()
        val extensionCalls = mutableListOf<String>()
        for (dex in result.dexFiles) {
            val target = File(output, dex.name)
            dex.stream.use { input -> target.outputStream().use { input.copyTo(it) } }
            dexFiles += target
            target.inputStream().buffered().use { input ->
                for (owner in DexBackedDexFile.fromInputStream(null, input).classes) {
                    classes += owner.type
                    for (method in owner.methods) {
                        definitions += method.toString()
                        for (instruction in PilloHybridNotificationPatch.instructions(method)) {
                            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                            if (ref.definingClass == PilloWeightSummaryPatch.EXT) {
                                calls += ref.name
                                extensionCalls += ref.toString()
                            }
                        }
                    }
                }
            }
        }
        check(calls.containsAll(setOf("takeLast", "rememberFilter", "filterButton", "render", "latest", "averages")))
        check(classes.contains(PilloWeightSummaryPatch.EXT))
        check(extensionCalls.all { it in definitions }) { "Hook references a missing extension signature: ${extensionCalls.filter { it !in definitions }}" }
        println("PASS: assembled DEX reloads; all six hooks resolve to bundled extension methods; four Pillo patches coexist")
        // Reuse the local merged APK's resources/manifest/native libraries for emulator verification.
        // All executable DEX comes from the original APK and the four patches above.
        ZipOutputStream(File(output, "pillo-summary-unsigned.apk").outputStream().buffered()).use { zip ->
            ZipFile(args.getOrElse(3) { args[0] }).use { original ->
                for (entry in original.entries().asSequence()) {
                    if (entry.name.matches(Regex("classes\\d*\\.dex")) ||
                        entry.name.matches(Regex("META-INF/[^/]+\\.(SF|RSA|DSA|EC)", RegexOption.IGNORE_CASE)) ||
                        entry.name.equals("META-INF/MANIFEST.MF", ignoreCase = true)) continue
                    val copied = ZipEntry(entry.name)
                    if (entry.method == ZipEntry.STORED || entry.name.endsWith(".so") || entry.name == "resources.arsc") {
                        copied.method = ZipEntry.STORED
                        copied.size = entry.size
                        copied.crc = entry.crc
                    }
                    zip.putNextEntry(copied)
                    original.getInputStream(entry).use { it.copyTo(zip) }
                    zip.closeEntry()
                }
            }
            for (dex in dexFiles) {
                zip.putNextEntry(ZipEntry(dex.name))
                dex.inputStream().use { it.copyTo(zip) }
                zip.closeEntry()
            }
        }
        println("Unsigned test APK: ${File(output, "pillo-summary-unsigned.apk")}")
    }
}
