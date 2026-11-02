package app.bdcrusher.lyrics
import java.io.File
import java.util.zip.ZipFile
import java.security.MessageDigest
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.*
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.Opcode
private const val OWN="Lapp/bdcrusher/ytmusic/playlists/"
private fun Method.refs()=implementation?.instructions?.mapNotNull {((it as? ReferenceInstruction)?.reference as? MethodReference)}.orEmpty()
private fun defs(file:File,selected:Set<String>?=null):Map<String,ClassDef>{val map=linkedMapOf<String,ClassDef>();ZipFile(file).use {z->for(e in z.entries().asSequence().filter {it.name.matches(Regex("classes[0-9]*\\.dex"))})for(c in DexBackedDexFile.fromInputStream(null,z.getInputStream(e).buffered()).classes)if(selected==null||c.type in selected)require(map.put(c.type,c)==null){"Duplicate class ${c.type}"}};return map}
fun main(args:Array<String>){
 val manifest=File(args.single());val home=File(System.getProperty("user.dir")).resolve("../..").canonicalFile
 val media="Lcom/google/android/libraries/youtube/media/interfaces/"
 val contracts=listOf("HttpRequest","HttpResponse","HttpHeader","HttpMethod","NetFetch","NetFetchTask","NetFetchCallbacks","QoeError").map {"$media$it;"}.toSet()+"Lcom/google/android/apps/youtube/proto/streaming/BandwidthSamplingConfigOuterClass\$BandwidthSamplingConfig;"
 for(path in manifest.readLines().filter {it.isNotBlank()}){val apk=File(path);val all=defs(apk);val raw=apk.parentFile.resolve("verification.json").readText();val version=if(raw.contains("da28424a01714090"))"9.43.51"else "9.42.52";val original=defs(home.resolve("Inputs/youtube-music-$version-original.apk"),contracts)
 ZipFile(apk).use {z->
  val installed=z.getEntry("assets/bdcrusher-features/downloads.enabled")!=null
  val methods=all.values.flatMap {it.methods.toList()}
  val localCalls=methods.sumOf {m->m.refs().count {it.definingClass=="${OWN}LocalNetFetch;"&&it.name=="local"&&!m.definingClass.startsWith(OWN)}}
  val envoy=methods.sumOf {m->m.refs().count {it.definingClass=="${OWN}LocalNetFetch;"&&it.name=="wrap"&&!m.definingClass.startsWith(OWN)}}
  val images=methods.sumOf {m->m.refs().count {it.definingClass=="${OWN}PlaylistArtwork;"&&it.name=="local"&&!m.definingClass.startsWith(OWN)}}
  require(installed&&localCalls==1&&envoy==1&&images==1){"Incorrect Downloads native activation $installed/$localCalls/$envoy/$images"}
  for(type in contracts){val expected=original.getValue(type);val actual=all.getValue(type)
   fun signatures(c:ClassDef)=c.methods.map {it.name+it.parameterTypes.joinToString("")+it.returnType+it.accessFlags}.toSet()
   // The selected upstream PoToken patch intentionally adds its reviewed URL accessor.
   // Preserve every original declaration, allowing only that exact existing adapter.
   val extra=if(type=="${media}HttpRequest;"&&actual.methods.any {it.name=="patch_getUrl"})setOf("patch_getUrlLjava/lang/String;17")else emptySet()
   val extraInterface=if(extra.isEmpty())emptySet()else setOf("Lapp/morphe/extension/shared/patches/PoTokenProviderPatch\$HttpRequest;")
   require(actual.superclass==expected.superclass&&actual.interfaces.toSet()==expected.interfaces.toSet()+extraInterface&&signatures(actual)==signatures(expected)+extra){"Native compile-only contract was replaced/changed: $type; expected=${signatures(expected)} actual=${signatures(actual)} parents=${expected.superclass}/${actual.superclass} interfaces=${expected.interfaces}/${actual.interfaces}"}
   require(actual.fields.map {it.name+it.type+it.accessFlags}.toSet()==expected.fields.map {it.name+it.type+it.accessFlags}.toSet()){"Stub enum/field payload changed native contract: $type"}
  }
  val cache=all.getValue("${OWN}NativeMediaCache;")
  for(name in listOf("decode","decodePlayer","createRequest","bd_combined")){val bridge=cache.methods.single {it.name==name};require(bridge.implementation!!.instructions.none {it.opcode==Opcode.THROW}){"Selected native adapter remains a source guard: $name"};require(bridge.refs().isNotEmpty())
   for(call in bridge.refs().filter {it.name=="<init>"&&!it.definingClass.startsWith("Lapp/")})require(com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.isSet(all.getValue(call.definingClass).accessFlags)){"Native response/request class is inaccessible: ${call.definingClass}"}
  }
  for(contract in listOf("Request","Client","Next")){val owners=all.values.filter {"${OWN}NativeMediaCache\$$contract;" in it.interfaces};val native=owners.filter {!it.type.startsWith("Lapp/")};val allowed=if(contract=="Request")setOf("${OWN}NativeMediaCache\$Unready;")else emptySet();require(native.size==1&&owners.filter {it.type.startsWith("Lapp/")}.map {it.type}.toSet()==allowed){"Native cache adapter ownership: $contract/$owners"}}
  val pairs=methods.count {m->!m.definingClass.startsWith(OWN)&&m.refs().any {it.definingClass=="${OWN}NativeMediaCache;"&&it.name in listOf("pair","bd_combined")}}
  val players=methods.count {m->!m.definingClass.startsWith(OWN)&&m.refs().any {it.definingClass=="${OWN}NativeMediaCache;"&&it.name=="player"}}
  require(pairs>=2&&players>=2){"Incomplete native offline entry coverage $pairs/$players"}
  val runtime=all.getValue("${OWN}PlaylistRuntime;");require(runtime.methods.flatMap {it.refs()}.none {it.name=="startForegroundService"}){"Original-playlist routing still starts a second player"}
  val store=all.getValue("${OWN}LocalPlayback;");require(store.methods.single {it.name=="bd_nativeResponse"}.implementation!!.instructions.none {it.opcode==Opcode.THROW})
  val spoof=all.getValue("Lapp/morphe/extension/shared/spoof/SpoofVideoStreamsPatch;")
  for(name in listOf("getStreamingData","getPlayerConfig")){
   val refs=spoof.methods.single {it.name==name&&it.parameterTypes==listOf("Ljava/lang/String;")}.refs()
   val own=refs.indexOfFirst {it.definingClass=="${OWN}LocalPlayback;"&&it.name=="response"}
   val network=refs.indexOfFirst {it.definingClass.endsWith("/StreamingDataRequest;")&&it.name=="getRequestForVideoId"}
   require(own>=0&&(network<0||own<network)){"Saved native stream/config guard missing: $name"}
  }
  val configCode=spoof.methods.single {it.name=="getPlayerConfig"}.implementation!!.instructions.toList()
  require(configCode.take(5).map {it.opcode}==listOf(Opcode.INVOKE_STATIC_RANGE,Opcode.MOVE_RESULT_OBJECT,Opcode.IF_EQZ,Opcode.CONST_4,Opcode.RETURN_OBJECT)){"Saved configuration must return null before network lookup"}
  require((configCode[3] as com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction).narrowLiteral==0){"Saved configuration guard must preserve the native config"}
  if(raw.contains("\"Spoof video streams\"")){
   val proto=store.methods.single {it.name=="bd_nativeResponse"}.returnType
   val consumer=methods.single {it.name=="patch_setStreamingData"}
   val references=consumer.implementation!!.instructions.filterIsInstance<ReferenceInstruction>().map {it.reference}
   require(references.any {it is com.android.tools.smali.dexlib2.iface.reference.TypeReference&&it.type==proto}&&references.any {it is com.android.tools.smali.dexlib2.iface.reference.FieldReference&&it.definingClass==proto}){"Native stream override must parse the full player wrapper before extracting its stream field"}
  }
  val strict=injectedInvokeAccess(all);require(strict.failures.isEmpty()){strict.failures.joinToString("\n")}
  val digest=MessageDigest.getInstance("SHA-256").digest(apk.readBytes()).joinToString(""){"%02x".format(it)}
  val report="""{"passed":true,"apkSha256":"$digest","originalVersion":"$version","nativeContractClasses":${contracts.size},"pairedEntryMethods":$pairs,"playerEntryMethods":$players,"nativeByteFetchHooks":$localCalls,"nativeImageHooks":$images,"privateInvokeFailures":0,"phoneVerified":false}"""
  val out=apk.parentFile.resolve("downloads40-audit.json");require(!out.exists());out.writeText(report+"\n");println("PASS: $version native download/cache/media/artwork contracts, $pairs paired + $players player entries")
 }
 }
}
