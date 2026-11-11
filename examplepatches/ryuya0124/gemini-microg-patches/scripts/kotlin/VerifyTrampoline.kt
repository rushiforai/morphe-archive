import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry
import com.reandroid.apk.ApkModule
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.*
import java.io.File
import java.util.zip.ZipFile

fun main(args: Array<String>) {
    require(args.size == 2)
    val apk = ApkModule.loadApkFile(File(args[0]))
    val profile = try { VersionHookRegistry.requireProfile(apk.androidManifest.packageName, apk.androidManifest.versionName) } finally { apk.close() }
    val spec = profile.hooks.getValue(HookId.WORK_PROFILE_BYPASS)
    val index = spec.integers["branchIndex"] ?: run { println("Explicit trampoline guard not used by this historical version"); return }
    fun read(path: String) = ZipFile(path).use { z -> z.entries().asSequence()
        .filter { it.name.matches(Regex("classes[0-9]*\\.dex")) }.flatMap { e ->
            z.getInputStream(e).buffered().use { DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it) }.classes.asSequence()
        }.single { it.type == spec.className }.methods.single { spec.matches(it) }.implementation!!.instructions.toList() }
    val before = read(args[0]); val after = read(args[1]); val reg = spec.int("branchRegister")
    check(after.size == before.size + 1)
    check(after[index].opcode == Opcode.CONST_4 && (after[index] as NarrowLiteralInstruction).narrowLiteral == 0)
    check((after[index] as OneRegisterInstruction).registerA == reg)
    for (i in before.indices) {
        val b = before[i]; val a = after[if (i < index) i else i+1]
        check(b.opcode == a.opcode && b.codeUnits == a.codeUnits)
        if (b is OneRegisterInstruction) check(b.registerA == (a as OneRegisterInstruction).registerA)
        if (b is TwoRegisterInstruction) check(b.registerB == (a as TwoRegisterInstruction).registerB)
        if (b is ReferenceInstruction) check(b.reference.toString() == (a as ReferenceInstruction).reference.toString())
    }
    fun addresses(ins: List<Instruction>): List<Int> { var offset = 0; return ins.map { instruction -> offset.also { offset += instruction.codeUnits } } }
    val oldAddresses = addresses(before); val newAddresses = addresses(after)
    // Every relative target still points to the corresponding original instruction.
    for (i in before.indices) if (before[i] is OffsetInstruction) {
        val target = oldAddresses.indexOf(oldAddresses[i] + (before[i] as OffsetInstruction).codeOffset)
        check(target >= 0)
        val newIndex = if (i < index) i else i+1
        val expectedTarget = newAddresses[if (target < index) target else target+1]
        check(newAddresses[newIndex] + (after[newIndex] as OffsetInstruction).codeOffset == expectedTarget)
    }
    check(before[index].opcode == Opcode.IF_EQZ && before[index-1].opcode == Opcode.AND_INT_2ADDR)
    println("Trampoline verified: only the validated work-profile guard is forced; nullable Boolean branch and all targets preserved")
}
