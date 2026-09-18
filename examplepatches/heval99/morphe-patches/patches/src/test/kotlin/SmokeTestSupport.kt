import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import org.junit.jupiter.api.Assertions.assertNull
import org.junit.jupiter.api.Assertions.assertTrue
import java.io.File
import java.nio.ByteBuffer

/**
 * Shared helpers for the per-app unlock smoke tests. Each test applies the app's patch to the
 * APK in the gitignored `apks/` directory and asserts on the emitted bytecode.
 */
fun repoRoot(): File {
    var dir = File(System.getProperty("user.dir")).absoluteFile
    while (dir != null && !File(dir, "settings.gradle.kts").exists()) dir = dir.parentFile
    return dir ?: File(System.getProperty("user.dir")).absoluteFile
}

fun newestPatchBundle(root: File): File =
    File(root, "patches/build/libs").walkTopDown()
        .filter {
            it.isFile && it.extension == "mpp" &&
                !it.name.contains("sources") && !it.name.contains("javadoc")
        }
        .maxByOrNull { it.lastModified() }
        ?: error("no patch bundle (.mpp) found in patches/build/libs")

fun loadAllPatches(bundle: File): Set<Patch<*>> = loadPatchesFromJar(setOf(bundle))

fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

fun ClassDef.method(name: String, parameters: List<String>? = null): Method =
    methods.firstOrNull { method ->
        method.name == name &&
            (parameters == null ||
                method.parameterTypes.map(CharSequence::toString) == parameters)
    } ?: error("$type.$name(${parameters?.joinToString()}) not found")

fun assertForcedBoolean(method: Method, expected: Boolean, label: String, diagnostics: String = "") {
    val insns = method.instructions()
    val first = insns.getOrNull(0)
    val second = insns.getOrNull(1)
    assertTrue(
        first is NarrowLiteralInstruction &&
            first.opcode == Opcode.CONST_4 &&
            first.narrowLiteral.toInt() == if (expected) 1 else 0,
        "$label was not forced to $expected; first instruction is ${first?.opcode}\n$diagnostics"
    )
    assertTrue(
        second != null && second.opcode == Opcode.RETURN,
        "$label does not return immediately; second instruction is ${second?.opcode}\n$diagnostics"
    )
    assertTrue(
        (second as OneRegisterInstruction).registerA ==
            (first as OneRegisterInstruction).registerA,
        "$label returns a different register than the one set\n$diagnostics"
    )
}

fun assertReturnsLicensedEnum(method: Method, label: String, diagnostics: String = "") {
    val insns = method.instructions()
    val first = insns.getOrNull(0) as? ReferenceInstruction
    val ref = first?.reference as? FieldReference
    assertTrue(
        first != null &&
            first.opcode == Opcode.SGET_OBJECT &&
            ref != null &&
            ref.definingClass == "Lcom/joaomgcd/taskerm/licensing/LicenseStatus;" &&
            ref.name == "Licensed",
        "$label does not return LicenseStatus.Licensed; first instruction is ${insns.getOrNull(0)?.opcode}\n$diagnostics"
    )
    assertTrue(
        insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT,
        "$label does not return immediately; second instruction is ${insns.getOrNull(1)?.opcode}\n$diagnostics"
    )
}

/**
 * Applies [patchNames] (filtered to patches compatible with [pkg]) to [apk] and returns every
 * class from the emitted dex files.
 */
fun applyPatches(
    apk: File,
    workDir: File,
    pkg: String,
    version: String,
    patchNames: Set<String>,
    allPatches: Set<Patch<*>>,
): List<ClassDef> {
    val target = allPatches.filter { patch ->
        patch.name in patchNames && patch.compatibility.orEmpty().any { it.packageName == pkg }
    }.toList()

    assertTrue(
        target.map { it.name }.toSet() == patchNames,
        "expected patches $patchNames in the bundle, found ${target.map { it.name }}"
    )

    val config = PatcherConfig(apk, workDir.resolve("out"), pkg, version)

    // Patcher.invoke() only executes the patches. Patcher.get() finalizes the bytecode context
    // and emits the patched dex files - without it you just re-read the unpatched input dex.
    val result = Patcher(config).use { patcher ->
        patcher += target.toSet()
        val results = runBlocking { patcher.invoke().toList() }
        val ours = results.filter { it.patch.name in patchNames }
        assertTrue(
            ours.size == patchNames.size,
            "every patch must execute exactly once; got ${results.map { it.patch.name }}"
        )
        for (r in ours) {
            assertNull(r.exception, "patch '${r.patch.name}' failed: ${r.exception}")
        }
        patcher.get()
    }

    assertTrue(result.dexFiles.isNotEmpty(), "patcher produced no patched dex files")

    // Drain every stream up front (temp files stay open otherwise) and load from memory;
    // path-backed dex files stay locked on Windows.
    return result.dexFiles.flatMap { dexFile ->
        val bytes = dexFile.stream.use { it.readBytes() }
        DexBackedDexFile(Opcodes.forApi(36), ByteBuffer.wrap(bytes)).classes.toList()
    }
}
