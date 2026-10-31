/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.lyrics
import java.io.File
import java.util.zip.ZipFile
import java.security.MessageDigest
import java.io.DataInputStream
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.*
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.*
private fun featureHash(file:File)=MessageDigest.getInstance("SHA-256").digest(file.readBytes()).joinToString(""){"%02x".format(it)}
private data class SdkDeclaration(val parents:List<String>,val methods:Set<String>,val fields:Set<String>)
private fun sdkDeclarations():Map<String,SdkDeclaration>{
 val output=mutableMapOf<String,SdkDeclaration>()
 ZipFile(File(System.getenv("ANDROID_HOME"),"platforms/android-36/android.jar")).use {jar->
  for(entry in jar.entries().asSequence().filter {it.name.endsWith(".class")})jar.getInputStream(entry).use {stream->
   val input=DataInputStream(stream);require(input.readInt()==0xcafebabe.toInt());input.readUnsignedShort();input.readUnsignedShort()
   val cp=arrayOfNulls<Any>(input.readUnsignedShort());var at=1
   while(at<cp.size){when(input.readUnsignedByte()){
    1->cp[at]=input.readUTF();7->cp[at]=input.readUnsignedShort()
    3,4->input.skipNBytes(4);5,6->{input.skipNBytes(8);at++}
    8,16,19,20->input.skipNBytes(2);9,10,11,12,17,18->input.skipNBytes(4);15->input.skipNBytes(3)
    else->error("Unsupported Android SDK constant pool")
   };at++}
   fun type(index:Int)=if(index==0)"" else "L"+(cp[cp[index] as Int] as String)+";"
   input.readUnsignedShort();val own=type(input.readUnsignedShort());val parent=type(input.readUnsignedShort());val parents=mutableListOf<String>();if(parent.isNotEmpty())parents+=parent
   repeat(input.readUnsignedShort()){parents+=type(input.readUnsignedShort())}
   fun attributes(){repeat(input.readUnsignedShort()){input.readUnsignedShort();input.skipNBytes(input.readInt().toLong() and 0xffffffffL)}}
   fun members():Set<String>{val set=mutableSetOf<String>();repeat(input.readUnsignedShort()){input.readUnsignedShort();val name=cp[input.readUnsignedShort()] as String;val descriptor=cp[input.readUnsignedShort()] as String;set+=name+descriptor;attributes()};return set}
   val fields=members();val methods=members();output[own]=SdkDeclaration(parents,methods,fields)
  }
 };return output
}
fun main(args:Array<String>){
 require(args.size==1)
 val permitted=File(System.getProperty("user.dir")).resolve("../scratch").canonicalFile
 val sdk=sdkDeclarations()
 for(path in File(args[0]).readLines().filter {it.isNotBlank()}){
  val file=File(path).canonicalFile;require(file.toPath().startsWith(permitted.toPath())&&file.name=="verified-unsigned.apk")
  ZipFile(file).use {zip->
   val types=linkedMapOf<String,ClassDef>()
   for(entry in zip.entries().asSequence().filter {it.name.matches(Regex("classes[0-9]*\\.dex"))})for(c in DexBackedDexFile.fromInputStream(null,zip.getInputStream(entry).buffered()).classes)require(types.put(c.type,c)==null){"Duplicate class ${c.type}"}
   fun method(ref:MethodReference,type:String=ref.definingClass,seen:MutableSet<String> = mutableSetOf()):Boolean{
    if(!seen.add(type))return false;val c=types[type]
    if(c==null){val platform=sdk[type]?:return false;return (ref.name+"("+ref.parameterTypes.joinToString("")+")"+ref.returnType) in platform.methods||platform.parents.any {method(ref,it,seen)}}
    if(c.methods.any {it.name==ref.name&&it.parameterTypes==ref.parameterTypes&&it.returnType==ref.returnType})return true
    return (listOfNotNull(c.superclass)+c.interfaces).any {method(ref,it,seen)}
   }
   fun field(ref:FieldReference,type:String=ref.definingClass,seen:MutableSet<String> = mutableSetOf()):Boolean{
    if(!seen.add(type))return false;val c=types[type]
    if(c==null){val platform=sdk[type]?:return false;return (ref.name+ref.type) in platform.fields||platform.parents.any {field(ref,it,seen)}}
    if(c.fields.any {it.name==ref.name&&it.type==ref.type})return true
    return (listOfNotNull(c.superclass)+c.interfaces).any {field(ref,it,seen)}
   }
   val owned=types.values.filter {it.type.startsWith("Lapp/bdcrusher/")};val missing=sortedSetOf<String>();var references=0
   var lifecycle=0;var dialogHooks=0;var oldBars=0;var shaderCallbacks=0;var personalCallbacks=0;var playlistCommands=0;var completions=0;var nativeBrowse=0;var nativeHeader=0;var lyricsMetadataHooks=0;var lyricsPlaybackHooks=0
   for(c in types.values)for(m in c.methods)for(i in m.implementation?.instructions?:emptyList()){
    val ref=(i as? ReferenceInstruction)?.reference
    if(ref is MethodReference){
     if(c.type.startsWith("Lapp/bdcrusher/")&&(ref.definingClass.startsWith("Lapp/bdcrusher/")||ref.definingClass.startsWith("Lapp/morphe/"))){references++;if(!method(ref))missing+=ref.toString()}
     if(ref.definingClass=="Lapp/bdcrusher/ytmusic/common/PersonalRuntime;")when(ref.name){"attach"->lifecycle++;"dialog","showBuilder"->dialogHooks++}
     if(ref.definingClass.endsWith("/LyricsSystemBars;"))oldBars++
     if(!c.type.startsWith("Lapp/bdcrusher/")&&ref.definingClass=="Lapp/morphe/extension/music/patches/lyrics/LyricsPatch;")when(ref.name){"onSetMetadata"->lyricsMetadataHooks++;"onSetPlaybackState"->lyricsPlaybackHooks++}
     if(!c.type.startsWith("Lapp/bdcrusher/")&&ref.definingClass=="Lapp/bdcrusher/ytmusic/shaders/ShaderRuntime;"&&ref.name in setOf("onMetadata","onPlayback","onArtwork","onPlayerBackground","onNativePanel"))shaderCallbacks++
     if(!c.type.startsWith("Lapp/bdcrusher/")&&ref.definingClass=="Lapp/bdcrusher/ytmusic/lyrics/LyricsEntryCoordinator;"&&ref.name=="onPlaybackEvent")personalCallbacks++
     if(!c.type.startsWith("Lapp/bdcrusher/")&&ref.definingClass=="Lapp/bdcrusher/ytmusic/playlists/PlaylistRuntime;")when(ref.name){"command"->playlistCommands++;"finished"->completions++;"capture"->nativeBrowse++;"bd_rewriteHeader"->nativeHeader++}
    }else if(ref is FieldReference&&c.type.startsWith("Lapp/bdcrusher/")&&(ref.definingClass.startsWith("Lapp/bdcrusher/")||ref.definingClass.startsWith("Lapp/morphe/"))){references++;if(!field(ref))missing+=ref.toString()}
   }
   var taskStops=0;var sessionCaptures=0
   for(c in types.values.filter { !it.type.startsWith("Lapp/bdcrusher/") })for(m in c.methods)for(i in m.implementation?.instructions?:emptyList()){
    val ref=(i as? ReferenceInstruction)?.reference as? MethodReference?:continue
    if(ref.definingClass=="Lapp/bdcrusher/ytmusic/common/TaskDismissal;")when(ref.name){"removed"->{require(m.name=="onTaskRemoved"){"Task stop attached outside actual Recents lifecycle"};taskStops++};"session"->{require(m.name=="<init>"){"Unexpected session capture"};sessionCaptures++}}
   }
   require(taskStops==2&&sessionCaptures>=1){"Missing exact Recents/session hooks: $taskStops/$sessionCaptures"}
   require(types.getValue("Lapp/bdcrusher/ytmusic/common/FrameDiagnostics;").methods.any {m->m.implementation?.instructions?.any {i->((i as? ReferenceInstruction)?.reference as? MethodReference)?.name=="addOnFrameMetricsAvailableListener"}==true}){"Android frame diagnostics missing"}
   val log=types.getValue("Lapp/morphe/extension/shared/Logger;")
   for((name,hook) in listOf("logInternal" to "stack","appendToLogBuffer" to "bound","getFilteredLogs" to "export"))require(log.methods.single {it.name==name}.implementation!!.instructions.any {i->((i as? ReferenceInstruction)?.reference as? MethodReference)?.let {it.definingClass=="Lapp/bdcrusher/ytmusic/common/DebugLogPolicy;"&&it.name==hook}==true}){"Missing existing logger integration: $name"}
   require(missing.isEmpty()){ "Unresolved owned/native contracts: "+missing.joinToString(" | ") }
   require(lifecycle==1&&oldBars==0&&dialogHooks>0){"Shared navigation ownership: lifecycle=$lifecycle old=$oldBars dialog=$dialogHooks"}
   val rootSettings=types.getValue("Lapp/morphe/extension/music/settings/preference/MusicPreferenceFragment;").methods.single {it.name=="onViewCreated"}
   val rootBindings=rootSettings.implementation!!.instructions.count {i->((i as? ReferenceInstruction)?.reference as? MethodReference)?.let {it.definingClass=="Lapp/bdcrusher/ytmusic/common/PersonalSettings;"&&it.name=="bindRoot"}==true}
   require(rootBindings==1){"Native settings must bind one opaque root: $rootBindings"}
   val shaders=zip.getEntry("assets/bdcrusher-features/shaders.enabled")!=null
   val playlists=zip.getEntry("assets/bdcrusher-features/playlists.enabled")!=null
   val lyrics=zip.getEntry("assets/bdcrusher-lyrics/providers.json")!=null
   // Full runtime retains dormant coordinator references. Activation is the native metadata/clock entry, not residence of a method body.
   require((lyricsMetadataHooks>0)==lyrics&&(lyricsPlaybackHooks>0)==lyrics){"Personal lyrics native entry activation does not match selected assets: $lyricsMetadataHooks/$lyricsPlaybackHooks/$lyrics"}
   require(!lyrics||personalCallbacks>0){"Selected personal lyrics has no coordinator path"}
   require((shaderCallbacks>0)==shaders){"Incorrect Shaders activation"}
   require((playlistCommands==1&&completions>0&&nativeBrowse>0&&nativeHeader==1)==playlists){"Incorrect native playlist integration: $playlistCommands/$completions/$nativeBrowse/$nativeHeader"}
   if(shaders)for(name in listOf("nativePanelId","nativePanelView","thumbnailId")){
    val m=types.getValue("Lapp/bdcrusher/ytmusic/shaders/ShaderRuntime;").methods.single {it.name==name}
    require(m.implementation!!.instructions.none {it.opcode.toString()=="THROW"}){"Unreplaced native Shaders bridge: $name"}
   }
   if(shaders){
    val verification=file.parentFile.resolve("verification.json").readText()
    val expectedThumbnail=when {
        verification.contains("da28424a01714090f392f963c2d822dff10eed9dc397b443e3e34e3691cf4dd9")->0x7f0b0948L
        verification.contains("9c38d63907362715f6172545bcb36f11ddbd45f014938626068016f06dcc3c56")->0x7f0b0943L
        else->error("Unknown exact target for Shaders resource audit")
    }
    require(types.getValue("Lapp/bdcrusher/ytmusic/shaders/ShaderRuntime;").methods.single {it.name=="thumbnailId"}.implementation!!.instructions.any {(it as? com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction)?.wideLiteral==expectedThumbnail}){"Wrong exact APK artwork resource bridge"}
    val cover=types.getValue("Lapp/bdcrusher/ytmusic/shaders/AnimatedCoverSurface;")
    val refs=cover.methods.flatMap {m->m.implementation?.instructions?.mapNotNull {((it as? ReferenceInstruction)?.reference as? MethodReference)}?.toList()?:emptyList()}
    require(cover.superclass=="Landroid/widget/FrameLayout;"&&refs.none {it.definingClass=="Landroid/webkit/WebView;"}){"Cover must use native decoding, without HTML playback controls"}
    require(refs.count {it.definingClass=="Landroid/media/MediaPlayer;"&&it.name=="prepareAsync"}==1&&refs.any {it.definingClass=="Landroid/media/MediaPlayer;"&&it.name=="setLooping"}){"Cover decoder preparation or looping contract changed"}
    require(refs.any {it.definingClass=="Landroid/media/MediaPlayer;"&&it.name=="setDataSource"&&it.parameterTypes.size==3}){"Native cover must stream the validated remote source"}
    require(types.getValue("Lapp/bdcrusher/ytmusic/shaders/ArtworkRepository;").methods.none {it.name=="download"}){"Retained animation-file library remains active"}

   }
   if(playlists){
    val resolver=types.values.filter {!it.type.startsWith("Lapp/bdcrusher/")}.flatMap {it.methods.toList()}.singleOrNull {m->m.implementation?.instructions?.any {i->((i as? ReferenceInstruction)?.reference as? MethodReference)?.let {it.definingClass=="Lapp/bdcrusher/ytmusic/playlists/PlaylistRuntime;"&&it.name=="command"}==true}==true}?:error("Playlist command owner ambiguous")
    val refs=resolver.implementation!!.instructions.mapNotNull {((it as? ReferenceInstruction)?.reference as? MethodReference)}
    require(refs.indexOfFirst {it.definingClass=="Lapp/bdcrusher/ytmusic/playlists/PlaylistRuntime;"&&it.name=="command"}<refs.indexOfFirst {it.definingClass=="Lapp/morphe/extension/music/patches/DownloadsPatch;"&&it.name=="commandResolverOnClick"}){"Playlist command interception occurs after ordinary downloads"}
    require(zip.entries().asSequence().any {it.name.endsWith("yt_outline_bdcrusher_download_playlist_vd_theme_24.xml")}){"Missing compiled playlist icon"}
   }
   fun nativeCalls(owner:String,name:String)=types.values.filter {!it.type.startsWith("Lapp/bdcrusher/")}.sumOf {c->c.methods.sumOf {m->m.implementation?.instructions?.count {i->((i as? ReferenceInstruction)?.reference as? MethodReference)?.let {it.definingClass==owner&&it.name==name}==true}?:0}}
   val pageEntry=nativeCalls("Lapp/bdcrusher/ytmusic/playlists/PlaylistBrowse;","cached")
   val pageObserve=nativeCalls("Lapp/bdcrusher/ytmusic/playlists/PlaylistBrowse;","observe")
   val imageUri=nativeCalls("Lapp/bdcrusher/ytmusic/playlists/PlaylistArtwork;","local")
   val rowOwner="Lapp/bdcrusher/ytmusic/playlists/PlaylistRows\$Owner;"
   val rowOwners=types.values.filter {rowOwner in it.interfaces}
   require((pageEntry==1&&pageObserve>0&&imageUri==1&&rowOwners.size==2)==playlists){"Incorrect native page/image/row activation: $pageEntry/$pageObserve/$imageUri/${rowOwners.size}"}
   if(playlists){
    for((type,name) in listOf("PlaylistBrowse" to "decode","PlaylistArtwork" to "fileUri")){
     val bridge=types.getValue("Lapp/bdcrusher/ytmusic/playlists/$type;").methods.single {it.name==name}
     require(bridge.implementation!!.instructions.none {it.opcode.toString()=="THROW"}){"Unreplaced selected native playlist bridge: $type.$name"}
     require(bridge.implementation!!.instructions.any {it is ReferenceInstruction&&it.reference is MethodReference}){"Empty selected native playlist bridge: $type.$name"}
    }
    val rows=types.getValue("Lapp/bdcrusher/ytmusic/playlists/PlaylistRows;")
    require(rows.methods.count {it.name.startsWith("bd_playlistRow")&&it.parameterTypes.size==4}==2){"Native row decode bridges missing"}
    for(owner in rowOwners)for(name in listOf("bd_playlistRow","bd_playlistRowView"))require(owner.methods.single {it.name==name}.implementation?.instructions?.any {it is ReferenceInstruction&&it.reference is MethodReference}==true){"Native row owner adapter missing: ${owner.type}/$name"}
    val request="Lapp/bdcrusher/ytmusic/playlists/PlaylistBrowse\$Request;"
    val requestOwner=types.values.singleOrNull {request in it.interfaces}?:error("Native page request adapter missing or duplicated")
    for(name in listOf("bd_playlistId","bd_playlistToken","bd_playlistParams","bd_playlistLanguage","bd_playlistQuery","bd_playlistForm","bd_playlistGenericForm"))require(requestOwner.methods.single {it.name==name}.implementation!!.instructions.any {it is ReferenceInstruction&&it.reference is FieldReference}){"Native request key field missing: $name"}
   }
   require(zip.getEntry("assets/bdcrusher-features/NOTICE.txt")!=null)
   if(playlists){
    val owner=types.values.single {c->c.methods.any {it.name=="bdcrusher_nativePlaylistBrowse"}}
    val delegate=owner.methods.single {it.name=="bdcrusher_nativePlaylistBrowse"}
    val wrapper=owner.methods.single {m->m.implementation?.instructions?.any {i->i is ReferenceInstruction&&(i.reference as? MethodReference)?.let {it.definingClass=="Lapp/bdcrusher/ytmusic/playlists/PlaylistBrowse;"&&it.name=="snapshot"}==true}==true}
    val calls=wrapper.implementation!!.instructions.filterIsInstance<ReferenceInstruction>().mapNotNull {it.reference as? MethodReference}.toList()
    val normalizer=calls.single {it.definingClass==owner.type&&it.returnType=="V"&&it.parameterTypes.size==1}
    require(calls.indexOf(normalizer)<calls.indexOfFirst {it.name=="snapshot"}){"Native normalization must precede immutable cache key"}
    require(delegate.implementation!!.instructions.filterIsInstance<ReferenceInstruction>().none {(it.reference as? MethodReference)?.let {m->m.definingClass==normalizer.definingClass&&m.name==normalizer.name&&m.parameterTypes==normalizer.parameterTypes}==true}){"Native request normalization would run twice"}
    require(calls.count {it.name=="bdcrusher_nativePlaylistBrowse"}==1&&calls.count {it.name=="snapshot"}==1){"Native browse delegate/snapshot must be single-owned"}
   }
   val report="""{"passed":true,"apkSha256":"${featureHash(file)}","ownedClasses":${owned.size},"validatedRuntimeReferences":$references,"unresolvedRuntimeReferences":0,"sharedLifecycleHooks":$lifecycle,"taskDismissalHooks":$taskStops,"sessionCaptureHooks":$sessionCaptures,"dialogHooks":$dialogHooks,"legacyBarHooks":$oldBars,"shaders":$shaders,"playlistDownloads":$playlists,"personalLyrics":$lyrics,"shaderCallbacks":$shaderCallbacks,"personalCallbacks":$personalCallbacks,"lyricsMetadataHooks":$lyricsMetadataHooks,"lyricsPlaybackHooks":$lyricsPlaybackHooks,"playlistCommandHooks":$playlistCommands,"typedCompletionHooks":$completions,"nativeBrowseCaptures":$nativeBrowse,"nativeHeaderHooks":$nativeHeader,"nativePageCacheEntries":$pageEntry,"nativePageObservers":$pageObserve,"nativeOfflineImageHooks":$imageUri,"nativeLiveRowOwners":${rowOwners.size},"phoneVerified":false}"""
   file.parentFile.resolve("personal-features-audit.json").writeText(report)
   println("PASS: ${file.parentFile.name}; ${owned.size} owned classes, $references runtime references, independent native hooks")
  }
 }
}
