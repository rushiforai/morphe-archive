import com.reandroid.apk.ApkModule
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import java.util.zip.ZipFile

fun main(args: Array<String>) {
    require(args.size==1 || (args.size==2 && args[1]=="--required"))
    val file=File(args[0])
    val apk=ApkModule.loadApkFile(file)
    val pkg=try { apk.androidManifest.packageName } finally { apk.close() }
    val type="Lapp/morphe/extension/all/versioncode/DisablePlayStoreUpdatesPatch;"
    val clazz=ZipFile(file).use { zip ->
        zip.entries().asSequence().filter { it.name.matches(Regex("classes[0-9]*\\.dex")) }.flatMap { entry ->
            zip.getInputStream(entry).buffered().use { DexBackedDexFile.fromInputStream(Opcodes.getDefault(),it).classes.toList() }.asSequence()
        }.singleOrNull { it.type==type }
    }
    if (clazz==null) {
        check(args.size==1) { "Expected a scoped universal update-blocking extension" }
        println("Update-blocking compatibility: optional universal extension absent")
        return
    }
    val classifier=clazz.methods.single { it.name=="morpheIsOwnPackage" }
    val ownNames=classifier.implementation!!.instructions.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }.toList()
    check(ownNames==listOf(pkg)) { "Version restoration targets another package: $ownNames, expected $pkg" }
    for (name in listOf("getVersionCode","getVersionCodeLong")) {
        val method=clazz.methods.single { it.name==name }
        val impl=method.implementation!!
        val instructions=impl.instructions.toList()
        check(instructions[0].opcode==Opcode.INVOKE_STATIC_RANGE)
        val ref=(instructions[0] as ReferenceInstruction).reference as MethodReference
        check(ref.definingClass==type && ref.name==classifier.name)
        check((instructions[0] as RegisterRangeInstruction).startRegister==impl.registerCount-1)
        check(instructions[1].opcode==Opcode.MOVE_RESULT && instructions[2].opcode==Opcode.IF_NEZ)
        check(instructions.take(6).any { it.opcode==if(name=="getVersionCode") Opcode.RETURN else Opcode.RETURN_WIDE })
    }
    for (method in clazz.methods) {
        val impl=method.implementation ?: continue
        val instructions=impl.instructions.toList()
        var offset=0
        val addresses=instructions.map { instruction -> offset.also { offset+=instruction.codeUnits } }.toSet()
        offset=0
        for (ins in instructions) {
            val regs=when(ins) {
                is RegisterRangeInstruction -> (ins.startRegister until ins.startRegister+ins.registerCount).toList()
                is FiveRegisterInstruction -> listOf(ins.registerC,ins.registerD,ins.registerE,ins.registerF,ins.registerG).take(ins.registerCount)
                is ThreeRegisterInstruction -> listOf(ins.registerA,ins.registerB,ins.registerC)
                is TwoRegisterInstruction -> listOf(ins.registerA,ins.registerB)
                is OneRegisterInstruction -> listOf(ins.registerA)
                else -> emptyList()
            }
            check(regs.all { it in 0 until impl.registerCount }) { "Invalid register in ${method.name}" }
            if(ins is OffsetInstruction) check(offset+ins.codeOffset in addresses) { "Invalid branch in ${method.name}" }
            offset+=ins.codeUnits
        }
    }
    println("Update-blocking compatibility verified: own package guard, foreign return paths, register bounds and branch targets")
}
