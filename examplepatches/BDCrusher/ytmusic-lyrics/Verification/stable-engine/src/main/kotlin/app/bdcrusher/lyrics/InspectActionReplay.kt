/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.lyrics
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import java.io.File
import java.util.zip.ZipFile

fun main(){
 val home=File(System.getProperty("user.dir")).resolve("../..").canonicalFile
 val output=home.resolve("Verification/native-replay-original-dex.txt");require(!output.exists())
 val dexes=ZipFile(home.resolve("Inputs/youtube-music-9.42.52-original.apk")).use {z->z.entries().asSequence().filter {it.name.matches(Regex("classes[0-9]*\\.dex"))}.map {e->DexBackedDexFile.fromInputStream(null,z.getInputStream(e).buffered())}.toList()}
 val marker="com/google/android/apps/youtube/music/watchpage/VideoActionBarPresenter"
 val presenter=dexes.flatMap {it.classes}.single {c->c.methods.any {m->m.name=="<clinit>"&&m.implementation?.instructions?.any {((it as? ReferenceInstruction)?.reference as? StringReference)?.string==marker}==true}}
 output.bufferedWriter().use {w->
  w.appendLine("PRESENTER ${presenter.type}; exact marker=$marker")
  for(f in presenter.fields)w.appendLine("FIELD $f")
  for(dex in dexes)for(c in dex.classes)for(m in c.methods){
   val code=m.implementation?.instructions?.toList()?:continue
   val relevant=code.indices.filter {i->val r=(code[i] as? ReferenceInstruction)?.reference;(r is MethodReference&&r.definingClass==presenter.type)||(r is FieldReference&&r.definingClass==presenter.type)}
   if(c.type!=presenter.type&&relevant.isEmpty())continue
   w.appendLine("METHOD $m registers=${m.implementation!!.registerCount}")
   val selected=if(c.type==presenter.type)code.indices.toSet() else relevant.flatMap {(maxOf(0,it-3)..minOf(code.lastIndex,it+5)).toList()}.toSet()
   for(i in code.indices)if(i in selected){
    val ins=code[i];val regs=when(ins){is FiveRegisterInstruction->"count=${ins.registerCount} C=${ins.registerC} D=${ins.registerD} E=${ins.registerE} F=${ins.registerF} G=${ins.registerG}";is ThreeRegisterInstruction->"A=${ins.registerA} B=${ins.registerB} C=${ins.registerC}";is TwoRegisterInstruction->"A=${ins.registerA} B=${ins.registerB}";is OneRegisterInstruction->"A=${ins.registerA}";else->""}
    w.appendLine("$i ${ins.opcode} $regs ${(ins as? ReferenceInstruction)?.reference?:""}")
   }
  }
 }
 println("Original native server/client action lifecycle: $output")
}
