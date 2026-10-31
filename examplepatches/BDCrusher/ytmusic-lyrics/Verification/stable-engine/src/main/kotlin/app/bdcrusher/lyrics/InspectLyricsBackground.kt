package app.bdcrusher.lyrics
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import java.io.File
import java.util.zip.ZipFile
fun main(){
 val h=File(System.getProperty("user.dir")).resolve("../..").canonicalFile;val o=h.resolve("Verification/revision28-native-background-paths.txt");require(!o.exists())
 ZipFile(h.resolve("Inputs/youtube-music-9.42.52-original.apk")).use{z->o.printWriter().use{w->for(e in z.entries().asSequence().filter{it.name.matches(Regex("classes[0-9]*\\.dex"))})for(c in DexBackedDexFile.fromInputStream(null,z.getInputStream(e).buffered()).classes)for(m in c.methods){
  val code=m.implementation?.instructions?.toList()?:continue
  if(code.none{val r=(it as? ReferenceInstruction)?.reference;(r is FieldReference&&r.definingClass=="Lakuj;"&&r.name=="P")||(r is MethodReference&&r.definingClass=="Lvob;"&&r.name=="P")})continue
  if(m.name in setOf("apply","dynamicMethod"))continue
  w.println("METHOD $m");for((i,a) in code.withIndex())w.println("$i ${a.opcode} ${(a as? ReferenceInstruction)?.reference?:""} ${(a as? WideLiteralInstruction)?.wideLiteral?:""}")
 }}};println(o)
}
