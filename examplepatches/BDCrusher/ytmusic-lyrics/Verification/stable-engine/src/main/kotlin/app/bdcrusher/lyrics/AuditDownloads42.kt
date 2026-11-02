package app.bdcrusher.lyrics
import java.io.File
import java.util.zip.ZipFile
import java.security.MessageDigest
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.*
private fun Method.contextCalls()=implementation?.instructions?.mapNotNull {((it as? ReferenceInstruction)?.reference as? MethodReference)}.orEmpty()
fun main(args:Array<String>){
 for(path in File(args.single()).readLines().filter {it.isNotBlank()}){
  val apk=File(path);val all=linkedMapOf<String,ClassDef>();ZipFile(apk).use {z->for(e in z.entries().asSequence().filter {it.name.matches(Regex("classes[0-9]*\\.dex"))})for(c in DexBackedDexFile.fromInputStream(null,z.getInputStream(e).buffered()).classes)require(all.put(c.type,c)==null)}
  val context=all.getValue("Lapp/bdcrusher/ytmusic/playlists/NativeDownloadContext;")
  val selected=mutableListOf<MethodReference>()
  for(name in listOf("bd_video","bd_playlist")){
   val method=context.methods.single {it.name==name};require(method.implementation!!.instructions.map {it.opcode}.toList()==listOf(Opcode.INVOKE_STATIC_RANGE,Opcode.MOVE_RESULT_OBJECT,Opcode.RETURN_OBJECT)){"Native context source guard remains: $name"}
   val ref=method.contextCalls().single();val helper=all.getValue(ref.definingClass);val native=helper.methods.single {it.name==ref.name&&it.parameterTypes==ref.parameterTypes&&it.returnType==ref.returnType}
   require(!ref.definingClass.startsWith("Lapp/")&&ref.parameterTypes==listOf("Ljava/lang/Object;")&&ref.returnType=="Ljava/lang/String;"&&AccessFlags.PUBLIC.isSet(helper.accessFlags)&&AccessFlags.PUBLIC.isSet(native.accessFlags)&&AccessFlags.STATIC.isSet(native.accessFlags))
   val passesString=native.implementation!!.instructions.any {it.opcode==Opcode.INSTANCE_OF&&((it as? ReferenceInstruction)?.reference as? TypeReference)?.type=="Ljava/lang/String;"}
   require(passesString==(name=="bd_playlist")){"Incorrect native video/playlist getter distinction"};selected+=ref
  }
  require(selected.map {it.definingClass}.distinct().size==1&&selected.map {it.name}.distinct().size==2)
  val offline=all.values.flatMap {it.methods.toList()}.single {m->m.implementation?.instructions?.any {((it as? ReferenceInstruction)?.reference as? StringReference)?.string=="Object is not an offlineable video: %s"}==true}
  require(offline.contextCalls().any {it.definingClass==selected[0].definingClass&&it.parameterTypes==listOf("Ljava/lang/Object;")&&it.returnType !in listOf("Ljava/lang/Object;","Ljava/lang/String;")}){"Getter owner is unrelated to native offline context"}
  val route=all.getValue("Lapp/morphe/extension/music/patches/DownloadsPatch;").methods.single {it.name=="routeEncodedDownload"}.contextCalls()
  require(route.any {it.name=="contextual"&&it.definingClass=="Lapp/bdcrusher/ytmusic/playlists/DownloadCommand;"}&&route.any {it.name=="target"&&it.definingClass==context.type}&&route.none {it.name=="getVideoId"})
  val strict=injectedInvokeAccess(all);require(strict.failures.isEmpty()){strict.failures.joinToString("\n")}
  val hash=MessageDigest.getInstance("SHA-256").digest(apk.readBytes()).joinToString(""){"%02x".format(it)}
  val out=apk.parentFile.resolve("downloads42-audit.json");require(!out.exists());out.writeText("""{"passed":true,"apkSha256":"$hash","nativeTagGetters":2,"nativeTagGetterOwner":"${selected[0].definingClass}","sourceGuardsReplaced":true,"emptyActionContextRouted":true,"noNowPlayingFallback":true,"privateInvokeFailures":0,"phoneVerified":false}
""")
  println("PASS: ${apk.parentFile.name} empty-action context + two native getters")
 }
}
