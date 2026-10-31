package app.bdcrusher.lyrics
import java.io.File
import java.util.zip.ZipFile
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
fun main(){
 val home=File(System.getProperty("user.dir")).resolve("../..").canonicalFile
 val output=home.resolve("Verification/revision34-native-session.txt");require(!output.exists())
 val all=hashMapOf<String,ClassDef>()
 ZipFile(home.resolve("Inputs/youtube-music-9.42.52-original.apk")).use {zip->for(e in zip.entries().asSequence().filter {it.name.matches(Regex("classes[0-9]*\\.dex"))})for(c in DexBackedDexFile.fromInputStream(null,zip.getInputStream(e).buffered()).classes)all[c.type]=c}
 output.printWriter().use {w->
  for(type in listOf("Landroid/support/v4/media/session/MediaSessionCompat\$Token;","Lbre;","Lhfz;")){val c=all.getValue(type);w.println("SESSION CLASS $type");for(m in c.methods)if(m.parameterTypes.isEmpty()){w.println("SESSION METHOD $m access=${m.accessFlags}");if(m.returnType=="Ljava/lang/Object;")for(i in m.implementation?.instructions?:emptyList())w.println("${i.opcode} ${(i as? ReferenceInstruction)?.reference?:""}")}}

  for(start in listOf("Lcom/google/android/apps/youtube/music/mediabrowser/MusicBrowserService;","Lcom/google/android/libraries/youtube/player/background/service/BackgroundPlayerService;")){
   var type:String?=start;val seen=hashSetOf<String>()
   while(type!=null&&seen.add(type)){
    val c=all[type]?:break;w.println("CLASS ${c.type} extends ${c.superclass}");for(f in c.fields)w.println("FIELD $f")
    for(m in c.methods){if(m.name in setOf("onTaskRemoved","onDestroy","onCreate","onStartCommand")||m.returnType.contains("MediaSession")){w.println("METHOD $m");for(i in m.implementation?.instructions?:emptyList())w.println("${i.opcode} ${(i as? ReferenceInstruction)?.reference?:""}")}}
    type=c.superclass
   }
  }
 }
 println("PASS: exact original service lifecycle retained")
}
