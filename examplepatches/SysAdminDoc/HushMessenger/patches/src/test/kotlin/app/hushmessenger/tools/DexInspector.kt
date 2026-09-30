package app.hushmessenger.tools

import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import java.io.File

/**
 * Batched DEX queries against a stock Messenger APK. One load, many queries, one per line in a file:
 *   -Ptarget=@queries.txt   with lines like  class:LX/Foo;  method:LX/Foo;->A01  callers:LX/Foo;->A01
 *   strings:unsent  reads:LX/Foo;->A02  writes:LX/Foo;->A02  impl:LX/Iface;
 */
object DexInspector {

    private fun ClassDef.redexName(): String? = fields
        .firstOrNull { it.name == "__redex_internal_original_name" }
        ?.initialValue?.let { (it as? StringEncodedValue)?.value }

    private fun Method.id() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun loadClasses(apkPath: String): List<ClassDef> {
        val container = DexFileFactory.loadDexContainer(File(apkPath), Opcodes.forApi(35))
        return container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }
    }

    private fun dumpMethod(method: Method) {
        val code = method.implementation ?: return println("    (abstract/native)")
        println("  ${method.id()}  registers=${code.registerCount} params=${method.parameterTypes.size} static=${method.accessFlags and 0x8 != 0}")
        var offset = 0
        val offsets = code.instructions.map { insn -> offset.also { offset += insn.codeUnits } }
        for ((i, insn) in code.instructions.withIndex()) {
            val sb = StringBuilder("    [$i @${offsets[i]}] ${insn.opcode}")
            when (insn) {
                is FiveRegisterInstruction -> sb.append(
                    listOf(insn.registerC, insn.registerD, insn.registerE, insn.registerF, insn.registerG)
                        .take(insn.registerCount).joinToString(", ", " {", "}") { "v$it" },
                )
                is RegisterRangeInstruction -> sb.append(" {v${insn.startRegister}..v${insn.startRegister + insn.registerCount - 1}}")
                is TwoRegisterInstruction -> sb.append(" v${insn.registerA}, v${insn.registerB}")
                is OneRegisterInstruction -> sb.append(" v${insn.registerA}")
            }
            when (insn) {
                is WideLiteralInstruction -> sb.append(", #${insn.wideLiteral}")
                is NarrowLiteralInstruction -> sb.append(", #${insn.narrowLiteral}")
            }
            if (insn is OffsetInstruction) sb.append(", -> @${offsets[i] + insn.codeOffset}")
            if (insn is ReferenceInstruction) {
                when (val ref = insn.reference) {
                    is MethodReference -> sb.append(", ${ref.definingClass}->${ref.name}(${ref.parameterTypes.joinToString("")})${ref.returnType}")
                    is FieldReference -> sb.append(", ${ref.definingClass}->${ref.name}:${ref.type}")
                    is StringReference -> sb.append(", \"${ref.string}\"")
                    is TypeReference -> sb.append(", ${ref.type}")
                    else -> sb.append(", $ref")
                }
            }
            println(sb)
        }
    }

    private fun splitMember(spec: String): Pair<String, String> {
        val (cls, member) = spec.split("->", limit = 2)
        return cls to member
    }

    private fun query(classes: List<ClassDef>, byType: Map<String, ClassDef>, q: String) {
        val (kind, arg) = q.split(":", limit = 2)
        println("\n==== $q ====")
        when (kind) {
            "class" -> {
                val cls = byType[arg] ?: return println("  not found")
                println("  ${cls.type} extends ${cls.superclass} implements ${cls.interfaces}  redex=${cls.redexName()} access=0x${cls.accessFlags.toString(16)}")
                cls.fields.filter { it.name != "__redex_internal_original_name" }
                    .forEach { println("  field ${if (it.accessFlags and 0x8 != 0) "static " else ""}${it.name}: ${it.type}") }
                cls.methods.forEach { println("  method ${it.id()} [${it.implementation?.instructions?.count() ?: 0}]") }
            }
            "method" -> {
                val (cls, name) = splitMember(arg)
                val c = byType[cls] ?: return println("  not found")
                c.methods.filter { it.name == name || it.id() == arg }.forEach(::dumpMethod)
            }
            "callers" -> {
                val (cls, name) = splitMember(arg)
                for (c in classes) for (m in c.methods) {
                    val hit = m.implementation?.instructions?.any { insn ->
                        val r = (insn as? ReferenceInstruction)?.reference as? MethodReference
                        r != null && r.definingClass == cls && (r.name == name || "${r.definingClass}->${r.name}(${r.parameterTypes.joinToString("")})${r.returnType}" == arg)
                    } ?: false
                    if (hit) println("  ${m.id()}  redex=${c.redexName()}")
                }
            }
            "strings" -> for (c in classes) for (m in c.methods) {
                val hits = m.implementation?.instructions
                    ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
                    ?.filter { it.contains(arg) }.orEmpty()
                if (hits.isNotEmpty()) println("  ${m.id()}  redex=${c.redexName()}  ${hits.distinct()}")
            }
            "reads", "writes" -> {
                val (cls, name) = splitMember(arg)
                for (c in classes) for (m in c.methods) {
                    val hit = m.implementation?.instructions?.any { insn ->
                        val r = (insn as? ReferenceInstruction)?.reference as? FieldReference
                        // Opcode.name is the smali mnemonic ("iput-boolean"), not the enum constant.
                        val isWrite = insn.opcode.name.let { it.startsWith("iput") || it.startsWith("sput") }
                        r != null && r.definingClass == cls && r.name == name && isWrite == (kind == "writes")
                    } ?: false
                    if (hit) println("  ${m.id()}  redex=${c.redexName()}")
                }
            }
            "impl" -> classes.filter { it.superclass == arg || arg in it.interfaces }
                .forEach { println("  ${it.type} redex=${it.redexName()}") }
            else -> println("  unknown query kind $kind (class, method, callers, strings, reads, writes, impl)")
        }
    }

    @JvmStatic fun main(args: Array<String>) {
        require(args.size >= 2) { "Usage: DexInspector <apk-path> <query|query|...>" }
        require(File(args[0]).isFile) { "APK not found: ${args[0]}" }
        val classes = loadClasses(args[0])
        val byType = classes.associateBy { it.type }
        println("Loaded ${classes.size} classes")
        // gradlew.bat hands arguments to cmd.exe, which treats | and > as operators, so long batches go in a file.
        val queries = if (args[1].startsWith("@")) File(args[1].substring(1)).readLines() else args[1].split("|")
        queries.map(String::trim).filter { it.isNotEmpty() && !it.startsWith("#") }.forEach { query(classes, byType, it) }
    }
}
