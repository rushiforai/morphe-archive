import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry
import com.reandroid.apk.ApkModule
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import java.util.zip.ZipFile

fun main(args: Array<String>) {
    val file = File(args.single()); val apk = ApkModule.loadApkFile(file)
    val spec = try { VersionHookRegistry.requireProfile(apk.androidManifest.packageName.removeSuffix(".morphe"), apk.androidManifest.versionName).hooks.getValue(HookId.PROCESS_NAME_REDIRECT) } finally { apk.close() }
    val ins = ZipFile(file).use { z -> z.entries().asSequence().filter { it.name.matches(Regex("classes[0-9]*\\.dex")) }.flatMap { e ->
        z.getInputStream(e).buffered().use { DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it) }.classes.asSequence()
    }.single { it.type == spec.className }.methods.single { spec.matches(it) }.implementation!!.instructions.toList() }
    var address = 0; val addresses = ins.map { instruction -> address.also { address += instruction.codeUnits } }
    val returns = ins.indices.filter { ins[it].opcode == Opcode.RETURN_OBJECT }
    check(returns.size == spec.expectedMatches)
    for (index in returns) {
        check(index >= 4)
        check(ins[index-4].opcode == Opcode.CONST_STRING && (ins[index-4] as ReferenceInstruction).reference.toString() == ".morphe")
        check((ins[index-3] as? ReferenceInstruction)?.reference is StringReference && (ins[index-3] as ReferenceInstruction).reference.toString() == "")
        check((ins[index-2] as? ReferenceInstruction)?.reference.toString() == "Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;")
        check(ins[index-1].opcode == Opcode.MOVE_RESULT_OBJECT)
        check((ins[index-1] as OneRegisterInstruction).registerA == (ins[index] as OneRegisterInstruction).registerA)
        // Branches may enter the first const-string, but must never skip into/after it.
        for (i in ins.indices) if (ins[i] is OffsetInstruction) {
            val target = addresses[i] + (ins[i] as OffsetInstruction).codeOffset
            check(target !in addresses.subList(index-3, index+1)) { "Cached return bypasses normalization: ${spec.className} branch ${addresses[i]} -> $target" }
        }
    }
    println("Process name verified: every return, including cached branches, passes through normalization")
}
