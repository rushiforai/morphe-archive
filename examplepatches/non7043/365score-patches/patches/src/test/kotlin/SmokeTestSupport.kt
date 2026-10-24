import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import org.junit.jupiter.api.Assertions.assertNull
import org.junit.jupiter.api.Assertions.assertTrue
import java.io.File
import java.nio.ByteBuffer

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

fun Instruction.stringOrNull(): String? {
    val ref = (this as? ReferenceInstruction)?.reference
    return (ref as? StringReference)?.string
}

fun ClassDef.method(name: String, parameters: List<String>? = null): Method =
    methods.firstOrNull { method ->
        method.name == name &&
            (parameters == null ||
                method.parameterTypes.map(CharSequence::toString) == parameters)
    } ?: error("$type.$name(${parameters?.joinToString()}) not found")

fun assertForcedBoolean(method: Method, expected: Boolean, label: String) {
    val insns = method.instructions()
    val first = insns.getOrNull(0)
    val second = insns.getOrNull(1)
    assertTrue(
        first is NarrowLiteralInstruction &&
            first.opcode == Opcode.CONST_4 &&
            first.narrowLiteral.toInt() == if (expected) 1 else 0,
        "$label was not forced to $expected; first instruction is ${first?.opcode}"
    )
    assertTrue(
        second != null && second.opcode == Opcode.RETURN,
        "$label does not return immediately; second instruction is ${second?.opcode}"
    )
    assertTrue(
        (second as OneRegisterInstruction).registerA ==
            (first as OneRegisterInstruction).registerA,
        "$label returns a different register than the one set"
    )
}

fun assertReturnsEarlyVoid(method: Method, label: String) {
    assertTrue(
        method.instructions().firstOrNull()?.opcode == Opcode.RETURN_VOID,
        "$label does not return immediately; first instruction is ${method.instructions().firstOrNull()?.opcode}"
    )
}

val GMA_THROWING_STATICS = listOf("initialize", "setAppVolume", "setAppMuted", "openDebugMenu", "setPlugin")

fun assertMobileAdsStaticsNeutralised(mobileAds: ClassDef, required: List<String> = GMA_THROWING_STATICS) {
    val staticVoids = mobileAds.methods.filter {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
            it.implementation != null && it.name != "<clinit>"
    }
    for (name in required) {
        assertTrue(staticVoids.any { it.name == name }, "${mobileAds.type} has no concrete static void $name")
    }
    assertTrue(staticVoids.isNotEmpty(), "${mobileAds.type} has no concrete static void")
    staticVoids.forEach {
        assertReturnsEarlyVoid(it, label = "MobileAds.${it.name}(${it.parameterTypes.joinToString()})")
    }
    mobileAds.methods.filter {
        it.name == "putPublisherFirstPartyIdEnabled" && it.returnType == "Z" && it.implementation != null
    }.forEach { assertForcedBoolean(it, expected = false, label = "MobileAds.putPublisherFirstPartyIdEnabled(Z)") }
}

fun applyPatches(
    apk: File,
    workDir: File,
    pkg: String,
    version: String,
    patchNames: Set<String>,
    allPatches: Set<Patch<*>>,
    filterByCompatibility: Boolean = true,
): List<ClassDef> {
    val target = allPatches.filter { patch ->
        patch.name in patchNames &&
            (!filterByCompatibility || patch.compatibility.orEmpty().any { it.packageName == pkg })
    }.toList()

    assertTrue(
        target.map { it.name }.toSet() == patchNames,
        "expected patches $patchNames in the bundle, found ${target.map { it.name }}"
    )

    val config = PatcherConfig(apk, workDir.resolve("out"), pkg, version)

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

    return result.dexFiles.flatMap { dexFile ->
        val bytes = dexFile.stream.use { it.readBytes() }
        DexBackedDexFile(Opcodes.forApi(36), ByteBuffer.wrap(bytes)).classes.toList()
    }
}
