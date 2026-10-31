/* Copyright 2026 BDCrusher. GPL-3.0. Read-only original APK bytecode evidence. */
package app.bdcrusher.lyrics
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import java.io.File
import java.util.zip.ZipFile
fun main(){
 val home=File(System.getProperty("user.dir")).resolve("../..").canonicalFile
 val out=home.resolve("Verification/revision32-native-video-bytecode.txt");require(!out.exists())
 val found=mutableMapOf<String,ClassDef>()
 ZipFile(home.resolve("Inputs/youtube-music-9.42.52-original.apk")).use {zip->
  for(e in zip.entries().asSequence().filter {it.name.matches(Regex("classes[0-9]*\\.dex"))})
   for(c in DexBackedDexFile.fromInputStream(null,zip.getInputStream(e).buffered()).classes)if(c.type in setOf("Lhwc;","Ltuk;"))found[c.type]=c
 }
 require(found.size==2)
 out.printWriter().use {w->
  for((type,c) in found)for(m in c.methods){
   if(type=="Lhwc;"&&m.name !in setOf("F","f","B"))continue
   if(type=="Ltuk;"&&(m.name!="l"||m.parameterTypes!=listOf("Landroid/view/View;","Z")))continue
   w.println("METHOD $m")
   for((index,i) in (m.implementation?.instructions?:emptyList()).withIndex()){
    val registers=when(i){is FiveRegisterInstruction->listOf(i.registerC,i.registerD,i.registerE,i.registerF,i.registerG).take(i.registerCount).joinToString(","){"v$it"};is ThreeRegisterInstruction->"v${i.registerA},v${i.registerB},v${i.registerC}";is TwoRegisterInstruction->"v${i.registerA},v${i.registerB}";is OneRegisterInstruction->"v${i.registerA}";else->""}
    w.println("$index ${i.opcode} $registers ${(i as? ReferenceInstruction)?.reference?:""} ${(i as? WideLiteralInstruction)?.wideLiteral?:""} ${(i as? OffsetInstruction)?.codeOffset?:""}")
   }
  }
 }
 val text=out.readText()
 require("Lhwc;->aV:Z" in text&&"Ltuk;->l(Landroid/view/View;Z)V" in text&&"Landroid/view/View;->setVisibility(I)V" in text)
 println("PASS: Native poster/video visibility bytecode retained at $out")
}
