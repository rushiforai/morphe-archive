package santodan.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import java.io.File
import java.util.zip.ZipFile
import kotlinx.coroutines.runBlocking

fun verifyCarScanner242Arm64Bundle(args: Array<String>) = runBlocking {
    for (patchName in listOf("Car Scanner - Premium status", "Car Scanner - Premium status (Experimental)")) {

        val selected = loadPatchesFromJar(setOf(File(args[1])))
            .filter { it.name == patchName }.toSet()
        check(selected.size == 1)
        val output = File(args[2], if (patchName.endsWith("(Experimental)")) "experimental" else "stable").apply { mkdirs() }
        val original = ZipFile(args[0]).use { apk ->
            apk.getInputStream(apk.getEntry(CarScanner242Arm64.ENTRY)).use { it.readBytes() }
        }
        Patcher(PatcherConfig(apkFile = File(args[0]), temporaryFilesPath = File(output, "work"))).use { patcher ->
            patcher += selected
            patcher().collect { result -> result.exception?.let { throw it } }
            val result = patcher.get()
            check(result.dexFiles.isEmpty()) { "Raw patch unexpectedly produced DEX edits" }
            val candidates = File(output, "work").walkTopDown()
                .filter { it.isFile && it.name == "libassembly-store.so" }
                .filter { it.length() != original.size.toLong() }.toList()
            check(candidates.size == 1) { "Expected one rewritten store; found $candidates" }
            val rewritten = candidates.single().readBytes()
            VerifyCarScanner242Arm64.verify(original, rewritten)
            val originalAot = ZipFile(args[0]).use { it.getInputStream(it.getEntry(CarScanner242Arm64.AOT_ENTRY)).readBytes() }
            val originalGuard = ZipFile(args[0]).use { it.getInputStream(it.getEntry(CarScanner242Arm64.GUARD_ENTRY)).readBytes() }
            fun modified(name: String): ByteArray = File(output, "work").walkTopDown()
                .filter { it.isFile && it.name == name }.single().readBytes()
            VerifyCarScanner242Arm64.verifyNative(originalAot, modified("libaot-CarScannerMaui.dll.so"),
                originalGuard, modified("libusbtransport.so"))
            val originalDecoder = ZipFile(args[0]).use { it.getInputStream(it.getEntry(CarScanner242Arm64.DECODER_ENTRY)).readBytes() }
            VerifyCarScanner242Arm64.verifyDecoder(originalDecoder, modified("libvndctx.so"))
            File(output, "patched-decoder.so").writeBytes(modified("libvndctx.so"))
            val d = 16384 + 20 + 5616 + 192 * 28
            val start = 16384 + CarScannerAssemblyStore.integer(rewritten, d + 4)
            val size = CarScannerAssemblyStore.integer(rewritten, d + 8)
            File(output, "CarScannerMaui.dll").writeBytes(rewritten.copyOfRange(start, start + size))
            File(output, "patched-aot.so").writeBytes(modified("libaot-CarScannerMaui.dll.so"))
            File(output, "patched-guard.so").writeBytes(modified("libusbtransport.so"))
            File(output, "patched-store.so").writeBytes(rewritten)
            println("PASS: packaged Car Scanner 2.2.42 arm64 patch discovered and applied; managed store reloads; no DEX changes")
        }
    }
}
