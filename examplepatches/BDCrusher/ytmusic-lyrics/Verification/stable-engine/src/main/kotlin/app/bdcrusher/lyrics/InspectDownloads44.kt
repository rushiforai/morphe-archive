package app.bdcrusher.lyrics
import java.io.File
import java.util.zip.ZipFile
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
fun main(args:Array<String>){
 val home=File(System.getProperty("user.dir")).resolve("../..").canonicalFile;val version=args[0];val phase=args[1];val focus=args.getOrNull(2)?.split(',')?.filter {it.isNotEmpty()}?.toSet().orEmpty()
 val out=home.resolve("Verification/revision44/native-$version-$phase.txt");require(!out.exists())
 val all=ZipFile(home.resolve("Inputs/youtube-music-$version-original.apk")).use {z->z.entries().asSequence().filter {it.name.matches(Regex("classes[0-9]*\\.dex"))}.flatMap {DexBackedDexFile.fromInputStream(null,z.getInputStream(it).buffered()).classes.asSequence()}.toList()}
 out.printWriter().use {w->for(c in all){
  val texts=c.methods.flatMap {m->m.implementation?.instructions?.mapNotNull {((it as? ReferenceInstruction)?.reference as? StringReference)?.string}.orEmpty()}
  val exact=texts.any {it=="FEmusic_offline"||it.contains("MusicOffline")||it.contains("MusicDownloads")||it.contains("OfflineLibrary")}
  val format=c.type.contains("StreamingDataOuterClass")||c.type.contains("FormatStream")
  val broad=texts.any {it.contains("offline",true)&&(it.contains("Music")||it.contains("library",true)||it.contains("browse",true))}
  if(c.type !in focus&&!exact&&!format&&!broad)continue
  w.println("CLASS ${c.type} SUPER ${c.superclass} INTERFACES ${c.interfaces} exact=$exact format=$format")
  for(f in c.fields)w.println("FIELD $f flags=${f.accessFlags}")
  for(m in c.methods){val code=m.implementation?.instructions?.toList().orEmpty();w.println("METHOD $m flags=${m.accessFlags} registers=${m.implementation?.registerCount}")
   val full=(c.type in focus||exact||format)&&code.size<=700
   for((n,i)in code.withIndex()){
    val ref=(i as? ReferenceInstruction)?.reference;val text=(ref as? StringReference)?.string
    if(!full&&text==null)continue
    val regs=when(i){is FiveRegisterInstruction->listOf(i.registerC,i.registerD,i.registerE,i.registerF,i.registerG).take(i.registerCount).joinToString(",");is RegisterRangeInstruction->"${i.startRegister}..${i.startRegister+i.registerCount-1}";is TwoRegisterInstruction->"${i.registerA},${i.registerB}";is OneRegisterInstruction->"${i.registerA}";else->""}
    val printable=if(text!=null)text.map {if(it.code<32)"\\u%04x".format(it.code)else it.toString()}.joinToString("")else ref?.toString().orEmpty()
    w.println("$n ${i.opcode} $regs $printable ${(i as? WideLiteralInstruction)?.wideLiteral?:""} ${(i as? OffsetInstruction)?.codeOffset?:""}")
   }
  }
 }};println(out)
}
