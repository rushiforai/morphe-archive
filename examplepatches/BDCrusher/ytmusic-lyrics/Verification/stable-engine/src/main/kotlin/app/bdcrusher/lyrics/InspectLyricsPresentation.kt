package app.bdcrusher.lyrics
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.*
import java.io.File
import java.util.zip.ZipFile
fun main(){
 val home=File(System.getProperty("user.dir")).resolve("../..").canonicalFile
 val out=home.resolve("Verification/revision28-native-presentation.txt");require(!out.exists())
 ZipFile(home.resolve("Inputs/youtube-music-9.42.52-original.apk")).use {z->out.printWriter().use {w->
  for(e in z.entries().asSequence().filter {it.name.matches(Regex("classes[0-9]*\\.dex"))})for(c in DexBackedDexFile.fromInputStream(null,z.getInputStream(e).buffered()).classes){
   if(c.type !in setOf("Liap;","Lakuj;","Lakui;","Lakuo;","Lvor;"))continue
   w.println("CLASS ${c.type}");c.fields.forEach {w.println("FIELD $it")}
   for(m in c.methods){if(c.type=="Lvor;"&&m.name !in setOf("b","C","N","O","T","x","<init>"))continue
    w.println("METHOD $m");for((i,ins) in (m.implementation?.instructions?:emptyList()).withIndex()){
     val r=(ins as? ReferenceInstruction)?.reference?.toString()?.map{if(it.code<32)"\\u%04x".format(it.code) else it.toString()}?.joinToString("")?:""
     w.println("$i ${ins.opcode} $r ${(ins as? WideLiteralInstruction)?.wideLiteral?:""} regs="+when(ins){is FiveRegisterInstruction->listOf(ins.registerC,ins.registerD,ins.registerE,ins.registerF,ins.registerG).take(ins.registerCount);is ThreeRegisterInstruction->listOf(ins.registerA,ins.registerB,ins.registerC);is TwoRegisterInstruction->listOf(ins.registerA,ins.registerB);is OneRegisterInstruction->listOf(ins.registerA);else->emptyList<Int>()})
    }
   }
  }
 }};println(out)
}
