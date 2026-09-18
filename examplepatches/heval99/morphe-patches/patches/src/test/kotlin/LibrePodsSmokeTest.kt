import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import org.junit.jupiter.api.Assertions.assertNull
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File
import java.nio.ByteBuffer

private const val PREMIUM_PRODUCT = "librepods.advanced_features.v2"
private const val PKG = "me.kavishdevar.librepods"

class LibrePodsSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun repoRoot(): File {
        var dir = File(System.getProperty("user.dir")).absoluteFile
        while (dir != null && !File(dir, "settings.gradle.kts").exists()) dir = dir.parentFile
        return dir ?: File(System.getProperty("user.dir")).absoluteFile
    }

    @Test
    fun `Enable Premium patch applies and forces premium flag in PlayBillingProvider`() {
        val root = repoRoot()
        val apk = File(root, "apks/librepods/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val bundle = File(root, "patches/build/libs").walkTopDown()
            .filter { it.isFile && it.extension == "mpp" && !it.name.contains("sources") && !it.name.contains("javadoc") }
            .maxByOrNull { it.lastModified() } ?: error("no patch bundle (.mpp) found in patches/build/libs")
        assertTrue(bundle.exists(), "patch bundle missing at ${bundle.path}")

        val all: Set<Patch<*>> = loadPatchesFromJar(setOf(bundle))
        val target = all.filter { patch ->
            patch.name == "Enable Premium" &&
                patch.compatibility.orEmpty().any { it.packageName == PKG }
        }.toList()
        assertTrue(target.size == 1, "expected exactly one Enable Premium patch in bundle")

        val config = PatcherConfig(
            apk,
            workDir.resolve("out"),
            PKG,
            "1.0.0-rc1-play",
        )

        // Patcher.invoke() only executes the patches. Patcher.get() is what finalizes the
        // bytecode context and emits the patched dex files - without it you just re-read
        // the unpatched input dex that the patcher extracted into the output directory.
        val result = Patcher(config).use { patcher ->
            patcher += target.toSet()
            val results = runBlocking { patcher.invoke().toList() }

            val ours = results.filter { it.patch.name == "Enable Premium" }
            assertTrue(ours.size == 1, "Enable Premium must execute exactly once; got $results")
            assertNull(ours.single().exception, "patch failed: ${ours.single().exception}")

            patcher.get()
        }

        val dexFiles = result.dexFiles
        assertTrue(dexFiles.isNotEmpty(), "patcher produced no patched dex files")

        // Drain every stream up front. The streams are backed by files inside @TempDir, so
        // skipping one (e.g. by breaking out of the scan early) leaves it open and JUnit
        // then fails to delete the temp directory on Windows.
        val dexes = dexFiles.map { it.name to it.stream.use { stream -> stream.readBytes() } }

        // Verify the produced dex: const/4 vX, 0x1 must now sit right before the
        // Boolean.valueOf(Z) write-back inside processPurchases.
        var sawPatchedAdjacency = false
        val diagnostics = StringBuilder()

        for ((dexName, bytes) in dexes) {
            // Load from memory. Loading from a path memory-maps the file, which on Windows
            // keeps the file locked and again blocks @TempDir cleanup.
            val patched = DexBackedDexFile(Opcodes.forApi(36), ByteBuffer.wrap(bytes))

            val hits = patched.classes
                .asSequence()
                .flatMap { it.methods.asSequence() }
                .filter { m ->
                    val impl = m.implementation ?: return@filter false
                    impl.instructions.any { insn ->
                        (insn as? ReferenceInstruction)?.reference.toString() == PREMIUM_PRODUCT
                    }
                }
                .filter { it.returnType == "V" && it.parameters == listOf("Ljava/util/List;") }
                .toList()

            if (hits.isEmpty()) continue

            val insns: List<Instruction> = hits.single().implementation!!.instructions.toList()
            val iValueOf = insns.indexOfFirst { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                ref != null &&
                    ref.definingClass == "Ljava/lang/Boolean;" &&
                    ref.name == "valueOf" &&
                    ref.returnType == "Ljava/lang/Boolean;"
            }
            diagnostics.appendLine("dex=$dexName size=${bytes.size} methods_with_product=${hits.size} valueOfIdx=$iValueOf")
            if (iValueOf <= 0) continue

            val valueOfInsn = insns[iValueOf]
            val valueOfReg: Int = when (valueOfInsn) {
                is FiveRegisterInstruction -> valueOfInsn.registerC
                is OneRegisterInstruction -> valueOfInsn.registerA
                else -> error("unexpected Boolean.valueOf format ${valueOfInsn.opcode}")
            }
            val prev = insns[iValueOf - 1] as OneRegisterInstruction
            val context = insns.drop((iValueOf - 4).coerceAtLeast(0)).take(9)
                .mapIndexed { idx, i -> "${(iValueOf - 4).coerceAtLeast(0) + idx}:${i.opcode}" }
            if (prev.opcode == Opcode.CONST_4 && prev.registerA == valueOfReg &&
                (prev as NarrowLiteralInstruction).narrowLiteral.toInt() == 1
            ) {
                sawPatchedAdjacency = true
                break
            }
            diagnostics.appendLine("  not-patched here; context=$context")
        }

        assertTrue(sawPatchedAdjacency, "no emitted dex shows the forced const/4 write-back\n$diagnostics")
    }
}
