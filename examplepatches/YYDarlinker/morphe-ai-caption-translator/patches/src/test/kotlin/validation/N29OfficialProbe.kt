package validation
import com.android.tools.smali.dexlib2.*
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import java.io.File
fun main(args:Array<String>) {
 val d=DexFileFactory.loadDexContainer(File(args[0]),Opcodes.getDefault())
 for(n in d.dexEntryNames)for(c in d.getEntry(n)!!.dexFile.classes)for(m in c.methods) {
  val code=m.implementation?.instructions?.toList()?:continue
  if(c.type=="Lapp/morphe/extension/shared/settings/preference/AbstractPreferenceFragment;" && m.name.contains("LongClick") || c.type=="Laosh;" || code.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string=="DISABLE_CAPTIONS_OPTION" } || c.type.contains("AutoCaptionsPatch") || !c.type.startsWith("Lapp/") && code.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass=="Lapp/morphe/extension/youtube/patches/AutoCaptionsPatch;" }) {
   println("METHOD $n ${m.definingClass}->${m.name}(${m.parameterTypes})${m.returnType} super=${c.superclass} flags=${m.accessFlags} regs=${m.implementation!!.registerCount}")
   var pc=0
   code.forEach {i->
    val registers=when(i){is FiveRegisterInstruction->listOf(i.registerC,i.registerD,i.registerE,i.registerF,i.registerG).take(i.registerCount);is RegisterRangeInstruction->(i.startRegister until i.startRegister+i.registerCount).toList();is ThreeRegisterInstruction->listOf(i.registerA,i.registerB,i.registerC);is TwoRegisterInstruction->listOf(i.registerA,i.registerB);is OneRegisterInstruction->listOf(i.registerA);else->emptyList()}
    println(" $pc ${i.opcode} v=$registers ref=${(i as? ReferenceInstruction)?.reference?:""} lit=${(i as? WideLiteralInstruction)?.wideLiteral?:""} target=${(i as? OffsetInstruction)?.let {pc+it.codeOffset}?:""}");pc+=i.codeUnits
   }
  }
 }
}
