import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry
import com.reandroid.apk.ApkModule
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import java.util.zip.ZipFile

private fun verifyRegisters(method: Method) {
    val impl = checkNotNull(method.implementation)
    for (instruction in impl.instructions) {
        val used = when (instruction) {
            is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
            is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG).take(instruction.registerCount)
            is ThreeRegisterInstruction -> listOf(instruction.registerA, instruction.registerB, instruction.registerC)
            is TwoRegisterInstruction -> listOf(instruction.registerA, instruction.registerB)
            is OneRegisterInstruction -> listOf(instruction.registerA)
            else -> emptyList()
        }
        check(used.all { it in 0 until impl.registerCount }) {
            "${method.definingClass}->${method.name}: register index out of range $used for registers_size=${impl.registerCount} (${instruction.opcode})"
        }
    }
}

fun main(args: Array<String>) {
    val file = File(args.single()); val apk = ApkModule.loadApkFile(file)
    val spec = try { VersionHookRegistry.requireProfile(apk.androidManifest.packageName.removeSuffix(".morphe"), apk.androidManifest.versionName).hooks.getValue(HookId.PROCESS_NAME_REDIRECT) } finally { apk.close() }
    val providerClass = ZipFile(file).use { z -> z.entries().asSequence().filter { it.name.matches(Regex("classes[0-9]*\\.dex")) }.flatMap { e ->
        z.getInputStream(e).buffered().use { DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it) }.classes.asSequence()
    }.single { it.type == spec.className } }
    val provider = providerClass.methods.single { spec.matches(it) }
    verifyRegisters(provider)
    check(AccessFlags.STATIC.isSet(provider.accessFlags) && provider.parameterTypes.isEmpty())
    val ins = provider.implementation!!.instructions.toList()
    var address = 0; val addresses = ins.map { instruction -> address.also { address += instruction.codeUnits } }
    val returns = ins.indices.filter { ins[it].opcode == Opcode.RETURN_OBJECT }
    check(returns.size == spec.expectedMatches)
    for (index in returns) {
        check(index >= 2)
        val call = ins[index-2]
        check(call.opcode == Opcode.INVOKE_STATIC)
        val ref = (call as ReferenceInstruction).reference as MethodReference
        check(ref.definingClass == spec.className && ref.name == "morpheNormalizeProcessName" && ref.parameterTypes == listOf("Ljava/lang/String;") && ref.returnType == "Ljava/lang/String;")
        check(ins[index-1].opcode == Opcode.MOVE_RESULT_OBJECT)
        val result = (ins[index] as OneRegisterInstruction).registerA
        val arguments = call as FiveRegisterInstruction
        check(arguments.registerCount == 1 && arguments.registerC == result)
        check((ins[index-1] as OneRegisterInstruction).registerA == result)
        for (i in ins.indices) if (ins[i] is OffsetInstruction) {
            val target = addresses[i] + (ins[i] as OffsetInstruction).codeOffset
            check(target !in addresses.subList(index-1, index+1)) { "Cached return bypasses normalization: ${spec.className} branch ${addresses[i]} -> $target" }
        }
    }
    val helper = providerClass.methods.single { it.name == "morpheNormalizeProcessName" }
    verifyRegisters(helper)
    check(AccessFlags.STATIC.isSet(helper.accessFlags) && helper.parameterTypes == listOf("Ljava/lang/String;") && helper.returnType == "Ljava/lang/String;")
    check(helper.implementation!!.registerCount == 3) { "Helper parameter must be v2" }
    val body = helper.implementation!!.instructions.toList()
    check(body.size == 5)
    for ((i, text) in listOf(0 to ".morphe", 1 to "")) {
        check(body[i].opcode in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO))
        check((body[i] as OneRegisterInstruction).registerA == i)
        check(((body[i] as ReferenceInstruction).reference as StringReference).string == text)
    }
    check(body[2].opcode == Opcode.INVOKE_VIRTUAL)
    val replace = body[2] as FiveRegisterInstruction
    check(replace.registerCount == 3 && replace.registerC == 2 && replace.registerD == 0 && replace.registerE == 1)
    check((body[2] as ReferenceInstruction).reference.toString() == "Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;")
    check(body[3].opcode == Opcode.MOVE_RESULT_OBJECT && (body[3] as OneRegisterInstruction).registerA == 0)
    check(body[4].opcode == Opcode.RETURN_OBJECT && (body[4] as OneRegisterInstruction).registerA == 0)
    println("Process name verified: valid provider/helper registers; first and cached returns always call normalization")
}
