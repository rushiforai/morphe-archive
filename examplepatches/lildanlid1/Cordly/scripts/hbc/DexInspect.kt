// Developer-only DEX inspector for porting privacy patches. Not shipped.
// kotlinc -cp work/tools/morphe.jar scripts/hbc/DexInspect.kt -d work/dexinspect.jar
// java -cp work/dexinspect.jar:work/tools/morphe.jar DexInspectKt <mode> <dex dir> <args...>
//   methods <prefix...>   every method of matching classes, with register and instruction counts
//   body <class> [name]   instructions of one class or method
//   callers <prefix...>   methods that reference a matching class, method or field
//   strings <needle...>   methods that load a matching string constant
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File

fun main(args: Array<String>) {
    val mode = args[0]
    val rest = args.drop(2)
    for (file in File(args[1]).listFiles()!!.filter { it.name.endsWith(".dex") }.sorted()) {
        val dex = DexFileFactory.loadDexFile(file, Opcodes.getDefault())
        for (c in dex.classes) for (m in c.methods) {
            val impl = m.implementation ?: continue
            val sig = "${c.type}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
            when (mode) {
                "methods" -> if (rest.any { c.type.startsWith(it) })
                    println("$sig regs=${impl.registerCount} insns=${impl.instructions.count()} flags=${m.accessFlags}")
                "callers" -> for (i in impl.instructions) {
                    val r = (i as? ReferenceInstruction)?.reference?.toString() ?: continue
                    if (rest.any { r.startsWith(it) }) println("$sig :: $r")
                }
                "strings" -> for (i in impl.instructions) {
                    val r = (i as? ReferenceInstruction)?.reference as? StringReference ?: continue
                    if (rest.any { r.string.contains(it) }) println("$sig :: ${r.string}")
                }
                "body" -> if (c.type == rest[0] && (rest.size < 2 || m.name == rest[1])) {
                    println("== $sig regs=${impl.registerCount} flags=${m.accessFlags}")
                    for (i in impl.instructions) {
                        val r = (i as? ReferenceInstruction)?.reference
                        val reg = (i as? OneRegisterInstruction)?.registerA
                        val lit = (i as? WideLiteralInstruction)?.wideLiteral
                        println("   ${i.opcode.name}" + (if (reg != null) " v$reg" else "") + (if (lit != null) " #$lit" else "") + (if (r != null) " $r" else ""))
                    }
                }
            }
        }
    }
}
