import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import org.junit.jupiter.api.Assertions.assertNull
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File
import java.nio.ByteBuffer

private const val PKG = "easynotes.notes.notepad.notebook.privatenotes.note"
private const val APP_CLASS = "Lnotes/easy/android/mynotes/App;"

class EasyNotesSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun repoRoot(): File {
        var dir = File(System.getProperty("user.dir")).absoluteFile
        while (dir != null && !File(dir, "settings.gradle.kts").exists()) dir = dir.parentFile
        return dir ?: File(System.getProperty("user.dir")).absoluteFile
    }

    @Test
    fun `EasyNotes premium and ad-free patches force the App gates to return true`() {
        val root = repoRoot()
        val apk = File(root, "apks/easynotes/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val bundle = File(root, "patches/build/libs").walkTopDown()
            .filter {
                it.isFile && it.extension == "mpp" &&
                    !it.name.contains("sources") && !it.name.contains("javadoc")
            }
            .maxByOrNull { it.lastModified() } ?: error("no patch bundle (.mpp) found in patches/build/libs")

        assertTrue(bundle.exists(), "patch bundle missing at ${bundle.path}")

        val wanted = setOf("Enable Premium", "Disable ads")

        val all: Set<Patch<*>> = loadPatchesFromJar(setOf(bundle))
        val target = all.filter { patch ->
            patch.name in wanted && patch.compatibility.orEmpty().any { it.packageName == PKG }
        }.toList()

        assertTrue(
            target.size == wanted.size,
            "expected ${wanted.size} EasyNotes patches in the bundle, found ${target.map { it.name }}"
        )

        val config = PatcherConfig(
            apk,
            workDir.resolve("out"),
            PKG,
            "1.3.59.0819",
        )

        // Patcher.invoke() only executes the patches. Patcher.get() finalizes the bytecode
        // context and emits the patched dex files - without it you just re-read the unpatched
        // input dex that the patcher extracted into the output directory.
        val result = Patcher(config).use { patcher ->
            patcher += target.toSet()
            val results = runBlocking { patcher.invoke().toList() }

            val ours = results.filter { it.patch.name in wanted }
            assertTrue(ours.size == wanted.size, "patches must execute exactly once each; got $results")
            for (r in ours) {
                assertNull(r.exception, "patch '${r.patch.name}' failed: ${r.exception}")
            }

            patcher.get()
        }

        val dexFiles = result.dexFiles
        assertTrue(dexFiles.isNotEmpty(), "patcher produced no patched dex files")

        // Drain every stream up front. The streams are backed by files inside @TempDir, so
        // skipping one (e.g. by breaking out of the scan early) leaves it open and JUnit
        // then fails to delete the temp directory on Windows.
        val dexes = dexFiles.map { it.name to it.stream.use { stream -> stream.readBytes() } }

        // Locate the (possibly stripped-and-rewritten) App class across every emitted dex.
        val found = mutableMapOf<String, List<Instruction>>()
        val diagnostics = StringBuilder()

        for ((dexName, bytes) in dexes) {
            // Load from memory. Loading from a path memory-maps the file, which on Windows
            // keeps the file locked and again blocks @TempDir cleanup.
            val patched = DexBackedDexFile(Opcodes.forApi(36), ByteBuffer.wrap(bytes))
            val app = patched.classes.firstOrNull { it.type == APP_CLASS } ?: continue

            diagnostics.appendLine("dex=$dexName contains $APP_CLASS")

            for (name in listOf("isVip", "isAdFree")) {
                val method = app.methods.firstOrNull { it.name == name && it.returnType == "Z" }
                if (method == null) continue
                val insns = method.implementation?.instructions?.toList() ?: continue
                found.putIfAbsent(name, insns)
                diagnostics.appendLine("  $name -> ${insns.map { it.opcode }}")
            }
        }

        for (name in listOf("isVip", "isAdFree")) {
            val insns = found[name]
                ?: error("$APP_CLASS.$name()Z not found in any emitted dex\n$diagnostics")

            val first = insns[0]
            val second = insns.getOrNull(1)

            assertTrue(
                first is NarrowLiteralInstruction &&
                    first.opcode == Opcode.CONST_4 &&
                    first.narrowLiteral.toInt() == 1,
                "$name() was not forced true; first instruction is ${first.opcode}\n$diagnostics"
            )
            assertTrue(
                second != null && second.opcode == Opcode.RETURN,
                "$name() does not return immediately; second instruction is ${second?.opcode}\n$diagnostics"
            )
            assertTrue(
                (second as OneRegisterInstruction).registerA ==
                    (first as OneRegisterInstruction).registerA,
                "$name() returns a different register than the one set to 1\n$diagnostics"
            )
        }
    }
}
