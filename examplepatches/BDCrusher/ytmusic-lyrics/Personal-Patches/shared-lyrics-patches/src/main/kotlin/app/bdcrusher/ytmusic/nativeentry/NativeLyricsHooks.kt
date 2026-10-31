/* Copyright 2026 BDCrusher. GPL-3.0. Native contracts inspected in original 9.42.52 / 94252240. */
package app.bdcrusher.ytmusic.nativeentry

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import java.security.MessageDigest

private const val OWN="Lapp/bdcrusher/ytmusic/lyrics/"
private object Controller:Fingerprint(strings=listOf(
 "EngagementPanelController: cannot show EngagementPanel before EngagementPanelController.init() has been called.",
 "[EngagementPanel] Cannot show EngagementPanel before EngagementPanelController.init() has been called."))
private fun Method.calls()=implementation?.instructions?.mapNotNull {((it as? ReferenceInstruction)?.reference as? MethodReference)}?:emptyList()
private fun Method.ref()="$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
private object MusicActionPresenter:Fingerprint(strings=listOf("com/google/android/apps/youtube/music/watchpage/VideoActionBarPresenter"))
private object NativeLyricsFactory:Fingerprint(strings=listOf("music_offline_lyrics_panel"))

fun BytecodePatchContext.installNativeLyricsHooks(){
 fun fail(message:String):Nothing=throw PatchException("Unsupported native Lyrics integration: $message. Requires original 9.42.52 / 94252240 arm64-v8a.")
 val playback=mutableClassDefBy("Lapp/morphe/extension/music/patches/lyrics/LyricsPatch;").methods.singleOrNull {
  it.name=="onSetPlaybackState"&&it.returnType=="V"&&it.parameterTypes==listOf("Landroid/media/session/PlaybackState;")&&AccessFlags.STATIC.isSet(it.accessFlags)
 }?:fail("timestamped playback callback")
 playback.addInstruction(0,"invoke-static/range { p0 .. p0 }, ${OWN}RendererPlayback;->sample(Landroid/media/session/PlaybackState;)V")
 Controller.clearMatch();val controller=Controller.classDef
 val mutableTypes=controller.fields.filter {it.type.startsWith("L")&&!AccessFlags.STATIC.isSet(it.accessFlags)&&!AccessFlags.FINAL.isSet(it.accessFlags)}.map {it.type}
 val setter=controller.methods.singleOrNull {it.returnType=="V"&&it.parameterTypes.size==2&&it.parameterTypes[1]=="Z"&&it.parameterTypes[0] in mutableTypes}?:fail("current panel setter")
 val panelType=setter.parameterTypes[0].toString()
 val panel=classDefBy(panelType)
 val root=panel.methods.singleOrNull {it.parameterTypes.isEmpty()&&it.returnType=="Landroid/view/View;"}?:fail("panel content API")
 val id=panel.methods.singleOrNull {it.parameterTypes.isEmpty()&&it.returnType=="Ljava/lang/String;"}?:fail("panel identity API")
 val show=controller.methods.singleOrNull {it.returnType==panelType&&it.parameterTypes.size==2&&it.parameterTypes.all {p->p.startsWith("L")}}?:fail("native show API")
 val commandType=show.parameterTypes[0].toString()
 val register=controller.methods.singleOrNull {m->m.returnType=="V"&&m.parameterTypes.size==1&&m.calls().any {it.definingClass==controller.type&&it.parameterTypes.size==6&&it.parameterTypes[0]==m.parameterTypes[0]&&it.parameterTypes[2]=="Z"&&it.parameterTypes[3]==commandType&&it.parameterTypes[4]=="Z"}}?:fail("native panel registration")
 val definitionType=register.parameterTypes[0].toString();val definition=classDefBy(definitionType)
 val base=definition.superclass?:fail("native protobuf base")
 val registry="Lcom/google/protobuf/ExtensionRegistryLite;"
 val parse=classDefBy(base).methods.singleOrNull {it.name=="parseFrom"&&it.parameterTypes==listOf(base,"[B",registry)&&it.returnType==base&&AccessFlags.PUBLIC.isSet(it.accessFlags)&&AccessFlags.STATIC.isSet(it.accessFlags)}?:fail("native protobuf parser")
 val generated=classDefBy(registry).methods.singleOrNull {it.name=="getGeneratedRegistry"&&it.parameterTypes.isEmpty()&&it.returnType==registry&&AccessFlags.PUBLIC.isSet(it.accessFlags)}?:fail("native extension registry")
 fun default(type:String)=classDefBy(type).fields.singleOrNull {it.type==type&&AccessFlags.PUBLIC.isSet(it.accessFlags)&&AccessFlags.STATIC.isSet(it.accessFlags)}?:fail("protobuf default $type")
 val def=default(definitionType)
 val lookup=controller.methods.singleOrNull {it.returnType==panelType&&it.parameterTypes==listOf("Ljava/lang/String;")}?:fail("native panel registry lookup")
 val panelDefinition=panel.methods.singleOrNull {it.returnType==definitionType&&it.parameterTypes.isEmpty()}?:fail("native panel definition getter")
 // The wire builder uses these six schemas. Pin the actual message-info strings,
 // not obfuscated class names. Any schema change fails before patch output.
 val hashes=setOf("8fc64abc179f34880c1a844395f4702fc105499590740019c64949d8cf80b5d7", // panel
 "98c13c5c887d4193b35a5140491299e8f7c048f6d767bd501c6ec0e08cf826ef", // identity
 "d416323315ace3f553433540090546ab1bd38f76adffe582bd2603f630b5f8ed", // header union
 "7599e673ff8f5002e581cbca58445c8caf1d73ce9e0f51860ab05cde5fea0cf8", // header
 "289ce2a3ce19fd3d6cbbf2f00e06c1d5305a77aff4bfdb06525c376c25a6b8e3", // text
 "4e39c2f3040ef4c41496d06062ca6921803ae8e33ebc6393c983120ba7311cab") // show command extension
 val found=mutableMapOf<String,String>()
 classDefForEach {c->for(m in c.methods)if(m.name=="dynamicMethod")for(i in m.implementation?.instructions?:emptyList()){
  val value=((i as? ReferenceInstruction)?.reference as? StringReference)?.string?:continue
  if(value.length<10)continue
  val hash=MessageDigest.getInstance("SHA-256").digest(value.toByteArray(Charsets.UTF_8)).joinToString(""){"%02x".format(it)}
  if(hash in hashes){if(found.put(hash,c.type)!=null)fail("ambiguous protobuf schema")}
 }}
 if(found.keys!=hashes||found[hashes.first()]!=definitionType)fail("native panel protocol schema")
 NativeLyricsFactory.clearMatch()
 val recipe=NativeLyricsFactory.method.implementation!!.instructions.joinToString("\n") { "${it.opcode}|${(it as? ReferenceInstruction)?.reference?:""}|${(it as? WideLiteralInstruction)?.wideLiteral?:""}" }
 val recipeHash=MessageDigest.getInstance("SHA-256").digest(recipe.toByteArray(Charsets.UTF_8)).joinToString(""){"%02x".format(it)}
 if(recipeHash!=mapOf("9.42.52" to "7bc335a95608014c5d4d9ba2ca5e97752cc4b34706dfc8a69fdc225203229727","9.43.51" to "aca0edec453c3c649ea16d9df628b68ade76652552dc742ecce68be99ba6f339")[packageMetadata.versionName])fail("native Lyrics factory profile")
 val host=mutableClassDefBy(OWN+"NativeLyricsHost;")
 fun body(name:String,registers:Int,code:String){val old=host.methods.single {it.name==name};val m=MutableMethod(ImmutableMethod(old.definingClass,old.name,old.parameters,old.returnType,old.accessFlags,old.annotations,old.hiddenApiRestrictions,MutableMethodImplementation(registers)));host.methods.remove(old);m.addInstructions(0,code);host.methods.add(m)}
 body("registerNative",5,"""
  check-cast p0, ${controller.type}
  invoke-static {}, ${generated.ref()}
  move-result-object v1
  sget-object v0, ${def.definingClass}->${def.name}:${def.type}
  invoke-static { v0, p1, v1 }, ${parse.ref()}
  move-result-object v0
  check-cast v0, $definitionType
  invoke-virtual { p0, v0 }, ${register.ref()}
  return-void
 """)
 body("nativeDefinition",4,"""
  check-cast p0, ${controller.type}
  invoke-virtual { p0, p1 }, ${lookup.ref()}
  move-result-object v0
  if-eqz v0, :missing
  invoke-interface { v0 }, ${panelDefinition.ref()}
  move-result-object v0
  if-eqz v0, :missing
  invoke-interface { v0 }, Lcom/google/protobuf/MessageLite;->toByteArray()[B
  move-result-object v0
  return-object v0
  :missing
  const/4 v0, 0x0
  return-object v0
 """)
 body("panelRoot",2,"check-cast p0, $panelType\ninvoke-interface { p0 }, ${root.ref()}\nmove-result-object v0\nreturn-object v0")
 body("panelId",2,"check-cast p0, $panelType\ninvoke-interface { p0 }, ${id.ref()}\nmove-result-object v0\nreturn-object v0")
 body("observeNativeDefinition",3,"""
  check-cast p1, $definitionType
  invoke-interface { p1 }, Lcom/google/protobuf/MessageLite;->toByteArray()[B
  move-result-object v0
  invoke-static { p0, v0 }, ${OWN}NativeLyricsHost;->captureDefinition(Ljava/lang/Object;[B)V
  return-void
 """)
 register.addInstruction(0,BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,register.implementation!!.registerCount-2,2,ImmutableMethodReference(OWN+"NativeLyricsHost;","observeNativeDefinition",listOf("Ljava/lang/Object;","Ljava/lang/Object;"),"V")))
 val constructors=controller.methods.filter {it.name=="<init>"};if(constructors.isEmpty())fail("native controller constructor")
 for(m in constructors){val returns=m.implementation!!.instructions.withIndex().filter {it.value.opcode==Opcode.RETURN_VOID}.map {it.index}
  for(index in returns.reversed()){
   val receiver=m.implementation!!.registerCount-m.parameterTypes.sumOf {if(it.toString() in listOf("J","D"))2 else 1}-1
   m.replaceInstruction(index,BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,receiver,1,ImmutableMethodReference(OWN+"NativeLyricsHost;","captureController",listOf("Ljava/lang/Object;"),"V")))
   m.addInstruction(index+1,"return-void")
  }}
 val assignment=setter.implementation!!.instructions.withIndex().singleOrNull {(_,i)->i.opcode==Opcode.IPUT_OBJECT&&((i as? ReferenceInstruction)?.reference as? FieldReference)?.let {it.definingClass==controller.type&&it.type==panelType}==true}?.index?:fail("native panel assignment")
 setter.addInstruction(assignment+1,"invoke-static { p0, p1 }, ${OWN}NativeLyricsHost;->onNativePanelChanged(Ljava/lang/Object;Ljava/lang/Object;)V")
 // Intercept only Music's own action-bar model renderer, before native Elements runs.
 MusicActionPresenter.clearMatch();val presenter=MusicActionPresenter.classDef
 val render=presenter.methods.singleOrNull {m->m.returnType=="V"&&m.parameterTypes.size==2&&m.calls().any {it.definingClass==m.parameterTypes[0]&&it.parameterTypes==listOf(m.parameterTypes[1],"Z")}}?:fail("Music action-bar render model")
 val elementType=render.parameterTypes[1].toString()
 val refresh=presenter.methods.singleOrNull {m->m.returnType=="V"&&m.parameterTypes.size==2&&m.parameterTypes[0]=="Ljava/lang/String;"&&m.calls().any {it.definingClass==presenter.type&&it.name==render.name}}?:fail("Music action-bar refresh")
 val responseType=refresh.parameterTypes[1].toString()
 val rendererField=presenter.fields.singleOrNull {it.type==render.parameterTypes[0]&&!AccessFlags.STATIC.isSet(it.accessFlags)}?:fail("Music action-bar renderer field")
 val identityMethods=presenter.methods.filter {it.returnType=="V"&&!AccessFlags.STATIC.isSet(it.accessFlags)&&it.parameterTypes.map {p->p.toString()} in listOf(listOf("Ljava/lang/String;"),listOf("Ljava/lang/String;","Z"),listOf("Ljava/lang/String;",responseType))}
 if(identityMethods.size!=4)fail("Music action-bar server/client identity inputs")
 val entry=mutableClassDefBy(OWN+"LyricsEntryButton;")
 fun entryBody(name:String,count:Int,code:String){val old=entry.methods.single {it.name==name};val m=MutableMethod(ImmutableMethod(old.definingClass,old.name,old.parameters,old.returnType,old.accessFlags,old.annotations,old.hiddenApiRestrictions,MutableMethodImplementation(count)));entry.methods.remove(old);m.addInstructions(0,code);entry.methods.add(m)}
 entryBody("refreshNative",4,"""
  check-cast p0, ${presenter.type}
  invoke-static { p0 }, ${OWN}LyricsEntryButton;->originalModel(Ljava/lang/Object;)Ljava/lang/Object;
  move-result-object v0
  if-eqz v0, :done
  check-cast v0, $elementType
  iget-object v1, p0, ${rendererField.definingClass}->${rendererField.name}:${rendererField.type}
  invoke-virtual { p0, v1, v0 }, ${render.ref()}
  :done
  return-void
 """)
 val elementDefault=default(elementType)
 entryBody("rewriteNative",7,"""
  check-cast p1, $elementType
  invoke-interface { p1 }, Lcom/google/protobuf/MessageLite;->toByteArray()[B
  move-result-object v1
  invoke-static { p0, p1, v1 }, ${OWN}LyricsEntryButton;->captureModel(Ljava/lang/Object;Ljava/lang/Object;[B)V
  invoke-static { p0, v1 }, ${OWN}LyricsEntryButton;->rewrite(Ljava/lang/Object;[B)[B
  move-result-object v0
  if-eq v0, v1, :unchanged
  invoke-static {}, ${generated.ref()}
  move-result-object v2
  sget-object v3, ${elementDefault.definingClass}->${elementDefault.name}:${elementDefault.type}
  invoke-static { v3, v0, v2 }, ${parse.ref()}
  move-result-object v0
  return-object v0
  :unchanged
  return-object p1
 """)
 if(render.implementation!!.registerCount>16)fail("Music model register range")
 render.addInstructions(0,"invoke-static { p0, p2 }, ${OWN}LyricsEntryButton;->rewriteNative(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\nmove-result-object p2\ncheck-cast p2, $elementType")
 for(m in identityMethods){
  if(m.implementation!!.registerCount>16)fail("Music identity register range")
  m.addInstruction(0,"invoke-static { p0, p1 }, ${OWN}LyricsEntryButton;->captureIdentity(Ljava/lang/Object;Ljava/lang/String;)V")
 }
 for(m in presenter.methods.filter {it.name=="<init>"}){
  val returns=m.implementation!!.instructions.withIndex().filter {it.value.opcode==Opcode.RETURN_VOID}.map {it.index}
  val receiver=m.implementation!!.registerCount-m.parameterTypes.sumOf {if(it.toString() in listOf("J","D"))2 else 1}-1
  for(index in returns.reversed()){
   m.replaceInstruction(index,BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,receiver,1,ImmutableMethodReference(OWN+"LyricsEntryButton;","capturePresenter",listOf("Ljava/lang/Object;"),"V")))
   m.addInstruction(index+1,"return-void")
  }
 }
 // Kill the old global view-tree installer; only NativeLyricsHost can attach now.
 val installer=mutableClassDefBy("Lapp/morphe/extension/music/patches/lyrics/ui/LyricsPanelInstaller;")
 fun redirect(name:String,code:String){val old=installer.methods.single {it.name==name};val m=MutableMethod(ImmutableMethod(old.definingClass,old.name,old.parameters,old.returnType,old.accessFlags,old.annotations,old.hiddenApiRestrictions,MutableMethodImplementation(2)));installer.methods.remove(old);m.addInstructions(0,code);installer.methods.add(m)}
 redirect("onLyricsPanelDetected","invoke-static {}, ${OWN}NativeLyricsHost;->onNativeLayout()V\nreturn-void")
 redirect("onEngagementPanelChanged","return-void")
 redirect("enableLyricsButton","return-void")
 redirect("isLyricsPanelOpen","invoke-static {}, ${OWN}NativeLyricsHost;->isOpen()Z\nmove-result v0\nreturn v0")
}
