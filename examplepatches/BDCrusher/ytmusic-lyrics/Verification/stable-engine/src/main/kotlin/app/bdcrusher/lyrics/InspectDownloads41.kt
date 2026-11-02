package app.bdcrusher.lyrics
import java.io.File
import java.util.zip.ZipFile
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
fun main(args:Array<String>){
 val home=File(System.getProperty("user.dir")).resolve("../..").canonicalFile
 val version=args.single();val out=home.resolve("Verification/revision41/native-$version-downloads-schema.txt");require(!out.exists())
 val classes=ZipFile(home.resolve("Inputs/youtube-music-$version-original.apk")).use {z->z.entries().asSequence().filter {it.name.matches(Regex("classes[0-9]*\\.dex"))}.flatMap {DexBackedDexFile.fromInputStream(null,z.getInputStream(it).buffered()).classes.asSequence()}.toList()}
 val needles=listOf("Object is not an offlineable video: %s","CommandResolver threw exception during resolution","music_download_button","MusicElementHeaderPresenter")
 val hits=classes.flatMap {c->c.methods.filter {m->m.implementation?.instructions?.any {i->val s=((i as? ReferenceInstruction)?.reference as? StringReference)?.string;(s!=null&&needles.any {s.contains(it)})||(i is WideLiteralInstruction&&i.wideLiteral==133724106L)}==true}}
 val owners=hits.map {it.definingClass}.toSet();val target=hits.map {it.toString()}.toSet()
 out.printWriter().use {w->for(c in classes){val methods=if(c.type in owners)c.methods.toList()else c.methods.filter {m->m.implementation?.instructions?.any {((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString() in target}==true};if(methods.isEmpty())continue
 w.println("CLASS ${c.type} ${c.superclass}");for(f in c.fields)w.println("FIELD $f flags=${f.accessFlags}")
 for(m in methods){w.println("METHOD $m flags=${m.accessFlags} registers=${m.implementation?.registerCount}");for((n,i)in(m.implementation?.instructions?:emptyList()).withIndex()){
 val regs=when(i){is FiveRegisterInstruction->listOf(i.registerC,i.registerD,i.registerE,i.registerF,i.registerG).take(i.registerCount).joinToString(",");is RegisterRangeInstruction->"${i.startRegister}..${i.startRegister+i.registerCount-1}";is TwoRegisterInstruction->"${i.registerA},${i.registerB}";is OneRegisterInstruction->"${i.registerA}";else->""}
 w.println("$n ${i.opcode} $regs ${(i as? ReferenceInstruction)?.reference?:""} ${(i as? WideLiteralInstruction)?.wideLiteral?:""} ${(i as? OffsetInstruction)?.codeOffset?:""}")}
 }}}
 println("Inspected ${hits.size} selected native download methods: $out")
}
