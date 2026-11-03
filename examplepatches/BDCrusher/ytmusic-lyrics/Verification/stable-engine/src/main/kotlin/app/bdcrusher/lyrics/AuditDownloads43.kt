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
private fun Method.ownerCalls()=implementation?.instructions?.mapNotNull {((it as? ReferenceInstruction)?.reference as? MethodReference)}.orEmpty()
fun main(args:Array<String>){
 for(path in File(args.single()).readLines().filter {it.isNotBlank()}){
  val apk=File(path);val all=linkedMapOf<String,ClassDef>();ZipFile(apk).use {z->for(e in z.entries().asSequence().filter {it.name.matches(Regex("classes[0-9]*\\.dex"))})for(c in DexBackedDexFile.fromInputStream(null,z.getInputStream(e).buffered()).classes)require(all.put(c.type,c)==null)}
  val context="Lapp/bdcrusher/ytmusic/playlists/DownloadViewContext;";val contract="Lapp/bdcrusher/ytmusic/playlists/DownloadViewContext\$Owner;"
  val owners=all.values.filter {contract in it.interfaces};require(owners.size==2)
  var header=0;var player=0
  for(owner in owners){
   require(!owner.type.startsWith("Lapp/"))
   val root=owner.methods.single {it.name=="bd_downloadRoot"};require(AccessFlags.PUBLIC.isSet(root.accessFlags)&&root.returnType=="Landroid/view/View;")
   val rootField=root.implementation!!.instructions.mapNotNull {((it as? ReferenceInstruction)?.reference as? FieldReference)}.single();require(rootField.definingClass==owner.type&&rootField.type=="Landroid/view/ViewGroup;")
   require(owner.methods.filter {it.name=="<init>"}.all {it.ownerCalls().any {r->r.definingClass==context&&r.name=="register"}})
   val video=owner.methods.single {it.name=="bd_downloadVideo"};val fields=video.implementation!!.instructions.mapNotNull {((it as? ReferenceInstruction)?.reference as? FieldReference)}
   if(fields.isEmpty()){
    header++;val capture=owner.methods.single {it.name=="bd_downloadHeader"};require(capture.ownerCalls().any {it.definingClass==context&&it.name=="header"})
    require(owner.methods.any {it.name!="bd_downloadHeader"&&it.ownerCalls().any {r->r.definingClass==owner.type&&r.name=="bd_downloadHeader"}})
   }else{
    player++;val id=fields.single();require(id.definingClass==owner.type&&id.type=="Ljava/lang/String;")
    require(all.values.any {it.type!=owner.type&&it.methods.any {m->m.implementation?.instructions?.any {i->i.opcode==Opcode.IPUT_OBJECT&&(i as? ReferenceInstruction)?.reference==id}==true}}){"Player ID must be the native state field updated by its callback"}
   }
  }
  require(player==1&&header==1)
  val dispatchers=all.values.filter {!it.type.startsWith("Lapp/")}.flatMap {it.methods.toList()}.filter {it.ownerCalls().any {r->r.definingClass=="Lapp/morphe/extension/music/patches/DownloadsPatch;"&&r.name=="captureDownloadContext"}}
  val dispatch=dispatchers.single();val calls=dispatch.ownerCalls();require(calls.first().name=="captureDownloadContext"&&calls.any {it.definingClass=="Ljava/util/concurrent/Executor;"&&it.name=="execute"})
  val runtime=all.getValue(context);val refs=runtime.methods.flatMap {it.ownerCalls()};require(refs.any {it.name=="getParent"}&&refs.any {it.name=="isAttachedToWindow"}&&refs.any {it.name=="addOnAttachStateChangeListener"}&&refs.none {it.name=="getVideoId"})
  val route=all.getValue("Lapp/morphe/extension/music/patches/DownloadsPatch;").methods.single {it.name=="routeEncodedDownload"}.ownerCalls();require(route.any {it.definingClass==context&&it.name=="target"})
  val strict=injectedInvokeAccess(all);require(strict.failures.isEmpty()){strict.failures.joinToString("\n")}
  val hash=MessageDigest.getInstance("SHA-256").digest(apk.readBytes()).joinToString(""){"%02x".format(it)}
  val out=apk.parentFile.resolve("downloads43-audit.json");require(!out.exists());out.writeText("""{"passed":true,"apkSha256":"$hash","nativePresenterOwners":2,"headerModelCapture":true,"committedPlayerIdentity":true,"snapshotBeforeExecutor":true,"popupDetachOwnership":true,"noNowPlayingFallback":true,"privateInvokeFailures":0,"phoneVerified":false}
""")
  println("PASS: ${apk.parentFile.name} native owner roots + header bytes + pre-worker snapshot")
 }
}
