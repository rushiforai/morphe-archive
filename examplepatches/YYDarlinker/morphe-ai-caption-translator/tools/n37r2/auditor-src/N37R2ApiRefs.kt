package validation
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.*
import java.io.File
/** Instruction references from the serialized extension DEX, not Java source or javap. */
fun main(args:Array<String>) {
 val dex=File(args[0]).inputStream().buffered().use { DexBackedDexFile.fromInputStream(Opcodes.forApi(28),it) }
 val rows=sortedSetOf<String>()
 for(c in dex.classes)if(c.type.startsWith("Lapp/yydarlinker/deepseekcaptions/"))for(m in c.methods) {
  val identity=m.name+"("+m.parameterTypes.joinToString("")+")"+m.returnType
  for(i in m.implementation?.instructions?:emptyList())if(i is ReferenceInstruction) {
   when(val ref=i.reference) {
    is MethodReference -> if(ref.definingClass.startsWith("Landroid/")||ref.definingClass.startsWith("Ljava/"))rows.add(listOf(c.type,identity,"method",ref.definingClass,ref.name+"("+ref.parameterTypes.joinToString("")+")"+ref.returnType).joinToString("\t"))
    is FieldReference -> if(ref.definingClass.startsWith("Landroid/")||ref.definingClass.startsWith("Ljava/"))rows.add(listOf(c.type,identity,"field",ref.definingClass,ref.name).joinToString("\t"))
    is TypeReference -> if(ref.type.startsWith("Landroid/")||ref.type.startsWith("Ljava/"))rows.add(listOf(c.type,identity,"class",ref.type,"").joinToString("\t"))
   }
  }
 }
 File(args[1]).writeText(rows.joinToString("\n")+"\n")
 println("N37R2_SERIALIZED_API_REFS_PASS refs=${rows.size}")
}