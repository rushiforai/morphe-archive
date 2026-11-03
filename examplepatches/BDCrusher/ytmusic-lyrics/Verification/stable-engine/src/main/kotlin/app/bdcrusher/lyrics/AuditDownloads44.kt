/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.lyrics
import java.io.File
import java.util.zip.ZipFile
import java.security.MessageDigest
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.*
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private fun Instruction.call44()=(this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.regs44()=when(this){is RegisterRangeInstruction->(startRegister until startRegister+registerCount).toList();is FiveRegisterInstruction->listOf(registerC,registerD,registerE,registerF,registerG).take(registerCount);else->emptyList()}
/** Prove a constructor/binder call receives the original object on every reachable path. */
private fun receiver44(method:Method,select:(MethodReference)->Boolean):Int{
 val impl=method.implementation!!;val code=impl.instructions.toList();val addresses=IntArray(code.size);var address=0
 for((n,i)in code.withIndex()){addresses[n]=address;address+=i.codeUnits};val indices=addresses.withIndex().associate {it.value to it.index}
 val words=method.parameterTypes.sumOf {if(it=="J"||it=="D")2 else 1}+if(AccessFlags.STATIC.isSet(method.accessFlags))0 else 1
 val receiver=impl.registerCount-words
 data class State(val at:Int,val aliases:Set<Int>)
 val queue=java.util.ArrayDeque<State>();queue.add(State(0,setOf(receiver)));val seen=mutableSetOf<State>();val sites=mutableSetOf<Int>()
 while(queue.isNotEmpty()){
  val state=queue.removeFirst();if(!seen.add(state))continue;require(seen.size<50000){"Unbounded receiver analysis $method"}
  val n=state.at;val i=code[n];val op=(i.opcode as Enum<*>).name;val ref=i.call44();val aliases=state.aliases.toMutableSet()
  if(ref!=null&&select(ref)){val arg=i.regs44().first();require(arg in aliases){"Receiver clobbered before $ref in $method @$n v$arg aliases=$aliases"};sites.add(n)}
  if(op.startsWith("MOVE_OBJECT")&&i is TwoRegisterInstruction){if(i.registerB in aliases)aliases.add(i.registerA)else aliases.remove(i.registerA)}
  else if(i.opcode!=Opcode.CHECK_CAST&&i.opcode.setsRegister()&&i is OneRegisterInstruction)aliases.remove(i.registerA)
  if(op.startsWith("RETURN")||op=="THROW")continue
  fun add(target:Int){queue.add(State(target,aliases.toSet()))}
  if(i is OffsetInstruction){
   val target=indices.getValue(addresses[n]+i.codeOffset)
   if(op.startsWith("GOTO")||op.startsWith("IF_"))add(target)
   else if(op.contains("SWITCH")){val payload=code[target] as SwitchPayload;for(element in payload.switchElements)add(indices.getValue(addresses[n]+element.offset))}
   else require(op=="FILL_ARRAY_DATA"){"Unsupported receiver flow $op"}
  }
  if(!op.startsWith("GOTO")&&n+1<code.size)add(n+1)
  for(block in impl.tryBlocks)if(addresses[n]>=block.startCodeAddress&&addresses[n]<block.startCodeAddress+block.codeUnitCount)for(handler in block.exceptionHandlers)add(indices.getValue(handler.handlerCodeAddress))
 }
 require(sites.isNotEmpty()){ "No receiver site in $method" };return sites.size
}
fun main(args:Array<String>){
 val expected=args.getOrNull(1)!="expect-clobber"
 for(path in File(args[0]).readLines().filter {it.isNotBlank()}){
  val apk=File(path);val all=linkedMapOf<String,ClassDef>();ZipFile(apk).use {z->for(e in z.entries().asSequence().filter {it.name.matches(Regex("classes[0-9]*\\.dex"))})for(c in DexBackedDexFile.fromInputStream(null,z.getInputStream(e).buffered()).classes)require(all.put(c.type,c)==null)}
  val prefix="Lapp/bdcrusher/ytmusic/playlists/";val context=prefix+"DownloadViewContext;";val contract=prefix+"DownloadViewContext\$Owner;"
  val playlists=ZipFile(apk).use {it.getEntry("assets/bdcrusher-features/playlists.enabled")!=null}
  val owners=all.values.filter {contract in it.interfaces};require(owners.size==2);var proven=0
  try{
   for(owner in owners)for(method in owner.methods){
    val refs=method.implementation?.instructions?.mapNotNull {it.call44()}.orEmpty()
    if(refs.any {it.definingClass==context&&it.name in listOf("register","header")})proven+=receiver44(method){it.definingClass==context&&it.name in listOf("register","header")}
    if(refs.any {it.definingClass==owner.type&&it.name=="bd_downloadHeader"})proven+=receiver44(method){it.definingClass==owner.type&&it.name=="bd_downloadHeader"}
   }
  }catch(failure:IllegalArgumentException){if(expected)throw failure;println("PASS: published receiver regression reproduced: ${failure.message}");continue}
  require(expected){"Old receiver regression unexpectedly passed"}
  var transportReceivers=0
  for(c in all.values)if(!c.type.startsWith("Lapp/"))for(m in c.methods)if(m.name=="<init>"&&m.implementation?.instructions?.any {it.call44()?.let {r->r.definingClass in setOf(prefix+"PlaylistRuntime;",prefix+"NativeMediaCache;")&&r.name in setOf("capture","initialized")}==true}==true)transportReceivers+=receiver44(m){it.definingClass in setOf(prefix+"PlaylistRuntime;",prefix+"NativeMediaCache;")&&it.name in setOf("capture","initialized")}
  require(transportReceivers>=(if(playlists)2 else 1))
  val manager=all.getValue("Lapp/morphe/extension/music/patches/downloads/LocalDownloadManager;").methods.single {it.name=="downloadBlocking"}
  if(playlists)receiver44(manager){it.definingClass==prefix+"PlaylistRuntime;"&&it.name=="finished"}
  val host=all.values.single {prefix+"DownloadsHost\$Owner;" in it.interfaces};require(host.methods.any {it.name=="bd_downloadContent"}&&host.methods.any {it.name=="bd_downloadDestination"})
  val labels=host.methods.flatMap {it.implementation?.instructions?.mapNotNull {((it as? ReferenceInstruction)?.reference as? StringReference)?.string}.orEmpty()};require("DOWNLOADS" in labels)
  var libraryReceivers=0;for(m in host.methods)if(m.implementation?.instructions?.any {it.call44()?.let {r->r.definingClass==prefix+"DownloadsHost;"&&r.name=="changed"}==true}==true)libraryReceivers+=receiver44(m){it.definingClass==prefix+"DownloadsHost;"&&it.name=="changed"}
  require(libraryReceivers>=4)
  val list=all.getValue(prefix+"DownloadsHost\$Pane;");require(list.fields.any {it.type=="Landroid/widget/ListView;"})
  val mini=all.getValue("Lapp/morphe/extension/music/patches/downloads/LocalDownloadsFragment;").methods.single {it.name=="onCreateView"};require(mini.implementation!!.instructions.none {it.call44()?.name=="createStockMiniPlayer"})
  val strict=injectedInvokeAccess(all);require(strict.failures.isEmpty()){strict.failures.joinToString("\n")}
  val hash=MessageDigest.getInstance("SHA-256").digest(apk.readBytes()).joinToString(""){"%02x".format(it)}
  val out=apk.parentFile.resolve("downloads44-audit.json");require(!out.exists());out.writeText("""{"passed":true,"apkSha256":"$hash","receiverSites":$proven,"libraryReceiverSites":$libraryReceivers,"transportReceiverSites":$transportReceivers,"nativeDownloadsDestination":true,"virtualizedCatalogue":true,"noCustomMiniPlayerCreated":true,"phoneVerified":false}
""")
  println("PASS: ${apk.parentFile.name}: $proven download + $libraryReceivers Library receiver sites retain actual object identity")
 }
}
