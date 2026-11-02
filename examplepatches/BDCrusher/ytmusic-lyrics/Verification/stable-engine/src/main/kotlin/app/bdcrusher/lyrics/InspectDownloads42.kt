package app.bdcrusher.lyrics
import java.io.File
import java.util.zip.ZipFile
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
fun main(args:Array<String>){
 val home=File(System.getProperty("user.dir")).resolve("../..").canonicalFile;val version=args[0];val phase=args[1];val focus=args.getOrNull(2)?.split(',')?.filter {it.isNotEmpty()}?.toSet().orEmpty()
 val out=home.resolve("Verification/revision42/native-$version-$phase.txt");require(!out.exists())
 val classes=ZipFile(home.resolve("Inputs/youtube-music-$version-original.apk")).use {z->z.entries().asSequence().filter {it.name.matches(Regex("classes[0-9]*\\.dex"))}.flatMap {DexBackedDexFile.fromInputStream(null,z.getInputStream(it).buffered()).classes.asSequence()}.toList()}
 val declarations=classes.filter {c->c.methods.any {m->m.name=="<clinit>"&&m.implementation?.instructions?.any {it is WideLiteralInstruction&&it.wideLiteral==443434441L}==true}}.map {it.type}.toSet()
 out.printWriter().use {w->w.println("EMPTY_COMMAND_TYPES $declarations");for(c in classes){
 val methods=if(c.type in declarations||c.type in focus)c.methods.toList() else c.methods.filter {m->m.implementation?.instructions?.any {i->val ref=(i as? ReferenceInstruction)?.reference;(ref is FieldReference&&ref.definingClass in declarations)||(ref is StringReference&&("DownloadButton" in ref.string||"download button" in ref.string))}==true}
 if(methods.isEmpty())continue;w.println("CLASS ${c.type} SUPER ${c.superclass} INTERFACES ${c.interfaces}");for(f in c.fields)w.println("FIELD $f flags=${f.accessFlags}")
 for(m in methods){val code=m.implementation?.instructions?.toList().orEmpty();w.println("METHOD $m flags=${m.accessFlags} registers=${m.implementation?.registerCount}");if(code.size>1000){w.println("OMITTED large method ${code.size}");continue}
 for((n,i)in code.withIndex()){
 val regs=when(i){is FiveRegisterInstruction->listOf(i.registerC,i.registerD,i.registerE,i.registerF,i.registerG).take(i.registerCount).joinToString(",");is RegisterRangeInstruction->"${i.startRegister}..${i.startRegister+i.registerCount-1}";is TwoRegisterInstruction->"${i.registerA},${i.registerB}";is OneRegisterInstruction->"${i.registerA}";else->""}
 val ref=(i as? ReferenceInstruction)?.reference;val text=if(ref is StringReference)ref.string.map {if(it.code<32)"\\u%04x".format(it.code)else it.toString()}.joinToString("")else ref?.toString().orEmpty()
 w.println("$n ${i.opcode} $regs $text ${(i as? WideLiteralInstruction)?.wideLiteral?:""} ${(i as? OffsetInstruction)?.codeOffset?:""}")}
 }}}
 println(out)
}
