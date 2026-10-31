package santodan.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import kotlinx.coroutines.runBlocking
import java.io.File
import java.util.zip.ZipFile

fun main(args: Array<String>) = runBlocking {
    software.santodan.extension.pillosummary.verifyProgressWeightObserver()
    val originals = ZipFile(args[0]).use { zip ->
        zip.entries().asSequence().filter { it.name.matches(Regex("classes\\d*\\.dex")) }.flatMap { entry ->
            DexBackedDexFile.fromInputStream(null, zip.getInputStream(entry).buffered()).classes.asSequence()
        }.toList()
    }
    PilloProgressWeightPatch.validate(originals)
    val missing = originals.filterNot { it.type == PilloProgressWeightPatch.READING + "ViewTrackerReadingListState;" }
    check(runCatching { PilloProgressWeightPatch.validate(missing) }.isFailure)
    check(runCatching { PilloProgressWeightPatch.validate(originals + originals.first { it.type == PilloProgressWeightPatch.READING + "ViewTrackerReadingListState;" }) }.isFailure)
    val native = originals.single { it.type == PilloProgressWeightPatch.TARGET }.methods.single {
        it.name == "invoke" && it.returnType == "V"
    }
    val redirected = MutableMethod(native)
    PilloProgressWeightPatch.apply(redirected)
    check(runCatching { PilloProgressWeightPatch.apply(redirected) }.isFailure)
    val ambiguous = MutableMethod(native)
    val index = PilloHybridNotificationPatch.instructions(ambiguous).indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "LazyColumn"
    }
    val call = PilloHybridNotificationPatch.instructions(ambiguous)[index] as RegisterRangeInstruction
    val ref = (call as ReferenceInstruction).reference as MethodReference
    ambiguous.implementation!!.addInstruction(index, BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
        call.startRegister, call.registerCount, ref))
    check(runCatching { PilloProgressWeightPatch.apply(ambiguous) }.isFailure)
    val absent = MutableMethod(native)
    absent.implementation!!.removeInstruction(index)
    check(runCatching { PilloProgressWeightPatch.apply(absent) }.isFailure)
    println("PASS: original contracts; missing/ambiguous contracts and hooks; already-patched rejection")
    val bundle = loadPatchesFromJar(setOf(File(args[1])))
    for (combined in listOf(false, true)) {
        val names = mutableSetOf(PilloProgressWeightPatch.NAME)
        if (combined) names += setOf(PilloWeightSummaryPatch.NAME, PilloWeightImportPatch.NAME,
            PilloLocalBackupPatch.NAME, PilloHybridNotificationPatch.NAME)
        val patches = bundle.filter { it.name in names }.toSet()
        check(patches.size == names.size)
        val output = File(args[2], if (combined) "combined" else "standalone").apply { mkdirs() }
        Patcher(PatcherConfig(apkFile = File(args[0]), temporaryFilesPath = File(output, "work"))).use { patcher ->
            patcher += patches
            patcher().collect { result -> result.exception?.let { throw it }; println("PASS: ${result.patch.name}") }
            val definitions = mutableListOf<ClassDef>()
            val emittedNames = mutableSetOf<String>()
            for (dex in patcher.get().dexFiles) {
                emittedNames += dex.name
                val target = File(output, dex.name)
                dex.stream.use { input -> target.outputStream().use { input.copyTo(it) } }
                target.inputStream().buffered().use { definitions += DexBackedDexFile.fromInputStream(null, it).classes }
            }
            // STRIP_FAST returns only changed/new DEX; untouched original entries remain in the APK.
            ZipFile(args[0]).use { zip ->
                for (entry in zip.entries().asSequence().filter { it.name.matches(Regex("classes\\d*\\.dex")) }) {
                    val target = File(output, entry.name)
                    if (entry.name in emittedNames) continue
                    zip.getInputStream(entry).use { input -> target.outputStream().use { input.copyTo(it) } }
                    target.inputStream().buffered().use { definitions += DexBackedDexFile.fromInputStream(null, it).classes }
                }
            }
            val target = definitions.single { it.type == PilloProgressWeightPatch.TARGET }
            val calls = target.methods.flatMap { PilloHybridNotificationPatch.instructions(it) }
                .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            check(calls.count { it.definingClass == PilloProgressWeightPatch.EXT && it.name == "progress" } == 1)
            check(calls.none { it.name == "LazyColumn" })
            val extension = definitions.single { it.type == PilloProgressWeightPatch.EXT }
            val hook = calls.single { it.definingClass == extension.type }
            check(extension.methods.any { it.name == hook.name && it.parameterTypes == hook.parameterTypes && it.returnType == hook.returnType })
            // Same-width redirect: every other instruction in every Progress content method is untouched.
            val before = originals.single { it.type == target.type }
            for (method in target.methods) {
                val old = before.methods.single { it.name == method.name && it.parameterTypes == method.parameterTypes }
                val a = PilloHybridNotificationPatch.instructions(old)
                val b = PilloHybridNotificationPatch.instructions(method)
                check(a.size == b.size && old.implementation?.registerCount == method.implementation?.registerCount)
                check(a.zip(b).count { (x, y) ->
                    x.opcode != y.opcode || (x as? ReferenceInstruction)?.reference?.toString() != (y as? ReferenceInstruction)?.reference?.toString()
                } == if (method.name == "invoke" && method.returnType == "V") 1 else 0)
            }
            PilloProgressWeightPatch.validate(definitions)
            println("PASS: ${output.name}: DEX reload, bundled hook signature, unchanged Progress registers/instructions outside one call")
        }
    }
}
