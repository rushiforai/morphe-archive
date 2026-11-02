package app.bdcrusher.lyrics
import java.io.File
import java.util.zip.ZipFile
import java.security.MessageDigest
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.*
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
private fun Method.downloadRefs()=implementation?.instructions?.mapNotNull {((it as? ReferenceInstruction)?.reference as? MethodReference)}.orEmpty()
fun main(args:Array<String>){
 for(path in File(args.single()).readLines().filter {it.isNotBlank()}){
  val apk=File(path);val all=linkedMapOf<String,ClassDef>();ZipFile(apk).use {z->for(e in z.entries().asSequence().filter {it.name.matches(Regex("classes[0-9]*\\.dex"))})for(c in DexBackedDexFile.fromInputStream(null,z.getInputStream(e).buffered()).classes)require(all.put(c.type,c)==null)}
  val owner=all.getValue("Lapp/morphe/extension/music/patches/DownloadsPatch;")
  for(name in listOf("commandResolverOnClick","offlineVideoEndpointOnClick")){
   val refs=owner.methods.single {it.name==name}.downloadRefs();val route=refs.indexOfFirst {it.name=="routeEncodedDownload"};val main=refs.indexOfFirst {it.name=="verifyOnMainThread"}
   require(route>=0&&route<main){"Encoded download must be consumed before worker-thread rejection: $name"}
  }
  val route=owner.methods.single {it.name=="routeEncodedDownload"}.downloadRefs()
  require(route.any {it.definingClass=="Lapp/bdcrusher/ytmusic/playlists/DownloadCommand;"&&it.name=="target"}&&route.any {it.name=="runOnMainThread"})
  require(route.none {it.name=="getVideoId"}){"Encoded download must never substitute Now Playing"}
  val choice=all.getValue("Lapp/bdcrusher/ytmusic/common/FeaturePreferences\$Choice;")
  require(choice.methods.single {it.name=="onPrepareDialogBuilder"}.downloadRefs().any {it.name=="setSingleChoiceItems"&&it.parameterTypes.firstOrNull()=="Landroid/widget/ListAdapter;"})
  require(all.values.filter {it.type.startsWith("Lapp/bdcrusher/ytmusic/common/FeaturePreferences\$Choice")}.flatMap {it.methods.toList()}.any {m->m.name=="getView"&&m.downloadRefs().any {it.name=="setTextColor"}&&m.downloadRefs().any {it.name=="getAppForegroundColor"}}){"Native choice labels must use the explicit host foreground"}
  val storage=all.getValue("Lapp/bdcrusher/ytmusic/playlists/AudioStoragePreference;");val refs=storage.methods.flatMap {it.downloadRefs()}
  require(refs.any {it.definingClass=="Landroid/os/StatFs;"&&it.name=="getAvailableBytes"}&&refs.any {it.definingClass=="Lapp/bdcrusher/ytmusic/playlists/DownloadStorage;"&&it.name=="volumePath"}&&refs.any {it.name=="showAsDropDown"})
  require(refs.none {it.name=="getUsableSpace"})
  val hash=MessageDigest.getInstance("SHA-256").digest(apk.readBytes()).joinToString(""){"%02x".format(it)}
  val out=apk.parentFile.resolve("downloads41-audit.json");require(!out.exists());out.writeText("""{"passed":true,"apkSha256":"$hash","encodedRoutingBeforeMainThreadGuard":true,"explicitChoiceTextColor":true,"existingVolumeStorage":true,"phoneVerified":false}
""")
  println("PASS: ${apk.parentFile.name} encoded routing, choice contrast and storage contracts")
 }
}
