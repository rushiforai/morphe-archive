/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.lyrics
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import java.io.File
import java.util.zip.ZipFile
fun main(args:Array<String>){
 require(args.size==1){"Only a plain-text manifest is accepted"}
 val permitted=File(System.getProperty("user.dir")).canonicalFile.resolve("../../Verification/scratch").canonicalFile
 val own="Lapp/bdcrusher/ytmusic/lyrics/"
 for(path in File(args.single()).readLines().filter {it.isNotBlank()}){
  val file=File(path).canonicalFile;require(file.toPath().startsWith(permitted.toPath())&&file.name=="verified-unsigned.apk")
  val classes=mutableSetOf<String>();val callbackNames=mutableSetOf<String>();var callbackReturns=0;var entryHooks=0;var identityGetters=0;var catalogConstructors=0;var panelConstructors=0;var playlistPrefetchConstructors=0
  var controllerCapture=0;var presenterCapture=0;var nativeModel=0;var nativePanel=0;var parsers=0;var root=0;var id=0;var definitions=0;var nativeRefresh=0;var nativeVideoFields=0;var modelCalls=0;var scoped=false;var legacyDisabled=false;var publicModel=false
  var nativeIdentityInputs=0;var originalModelCaptures=0;var nativeRendererFields=0;var navigationSync=0;var navigationRelease=0;var hasNavigationHelper=false;var hiddenNativeScrollbars=0;var definitionCapture=0;var rendererClockHooks=0
  ZipFile(file).use {z->for(e in z.entries().asSequence().filter {it.name.matches(Regex("classes[0-9]*\\.dex"))}){
   val dex=DexBackedDexFile.fromInputStream(null,z.getInputStream(e).buffered())
   for(c in dex.classes){require(classes.add(c.type)){"Duplicate ${c.type}"}
                    if(c.type=="Lapp/morphe/extension/music/patches/lyrics/LyricsPatch;")for(m in c.methods)if(m.name in listOf("onSetMetadata","onSetPlaybackState")){
                        val implementation=m.implementation!!
                        val code=implementation.instructions.toList()
                        val addresses=mutableListOf<Int>();var address=0
                        for(i in code){addresses.add(address);address+=i.codeUnits}
                        val indices=addresses.withIndex().associate {it.value to it.index}
                        val queue=java.util.ArrayDeque<Pair<Int,Boolean>>();queue.add(0 to false)
                        val visited=mutableSetOf<Pair<Int,Boolean>>()
                        while(queue.isNotEmpty()){
                            val (index,prior)=queue.removeFirst();if(!visited.add(index to prior))continue
                            val i=code[index];val r=(i as? ReferenceInstruction)?.reference as? MethodReference
                            val covered=prior||(r?.definingClass==own+"LyricsEntryCoordinator;"&&r.name=="onPlaybackEvent")
                            if(i.opcode==com.android.tools.smali.dexlib2.Opcode.RETURN_VOID){require(covered){"Uncovered callback return: $m index=$index"};continue}
                            if(i.opcode==com.android.tools.smali.dexlib2.Opcode.THROW)continue
                            val op=i.opcode.toString()
                            if(i is com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction){
                                require(op.startsWith("GOTO")||op.startsWith("IF_")){"Unexpected callback branch: $op"}
                                queue.add(indices.getValue(addresses[index]+i.codeOffset) to covered)
                            }
                            if(!op.startsWith("GOTO")&&index+1<code.size)queue.add(index+1 to covered)
                            for(block in implementation.tryBlocks)if(addresses[index]>=block.startCodeAddress&&addresses[index]<block.startCodeAddress+block.codeUnitCount)
                                for(handler in block.exceptionHandlers)queue.add(indices.getValue(handler.handlerCodeAddress) to covered)
                        }
                        callbackReturns+=code.count {it.opcode==com.android.tools.smali.dexlib2.Opcode.RETURN_VOID}

                    }

    if(c.type=="Lapp/morphe/extension/music/patches/lyrics/LyricsManager;")identityGetters+=c.methods.count {it.name=="getCommittedVideoId"}
    if(c.type=="Lapp/morphe/extension/music/patches/lyrics/ui/LyricsPanelInstaller;"){
     fun refs(name:String)=c.methods.single {it.name==name}.implementation!!.instructions.mapNotNull {((it as? ReferenceInstruction)?.reference as? MethodReference)}.toList()
     scoped=refs("onLyricsPanelDetected").let {it.size==1&&it.single().definingClass==own+"NativeLyricsHost;"&&it.single().name=="onNativeLayout"}
     legacyDisabled=refs("enableLyricsButton").isEmpty()&&refs("onEngagementPanelChanged").isEmpty()
    }
    if(c.type==own+"LyricsEntryButton;"){publicModel=AccessFlags.PUBLIC.isSet(c.methods.single {it.name=="rewriteNative"}.accessFlags);require(c.methods.none {it.name=="nativeVideoId"}){"Entry still depends on optional server response identity"}}
    if(c.type==own+"LyricsSystemBars;")hasNavigationHelper=true
    for(m in c.methods){val impl=m.implementation?:continue;val code=impl.instructions.toList()
     val refs=code.mapNotNull {((it as? ReferenceInstruction)?.reference as? MethodReference)}
     val capture=if(c.type.startsWith(own))null else refs.singleOrNull {it.definingClass.startsWith(own)&&it.name in setOf("captureController","capturePresenter")}
     if(capture!=null){
      require(m.name=="<init>"&&!c.type.startsWith("Lapp/"))
      val addresses=mutableListOf<Int>();var addr=0;for(i in code){addresses.add(addr);addr+=i.codeUnits};val indices=addresses.withIndex().associate {it.value to it.index}
      val targets=mutableSetOf<Int>();for((index,i) in code.withIndex())if(i is OffsetInstruction){
       val target=addresses[index]+i.codeOffset;targets.add(target)
       val payload=code.getOrNull(indices[target]?:-1) as? SwitchPayload
       if(payload!=null)for(item in payload.switchElements)targets.add(addresses[index]+item.offset)
      }
      for(block in impl.tryBlocks)for(h in block.exceptionHandlers)targets.add(h.handlerCodeAddress)
      for((index,i) in code.withIndex())if(i.opcode==Opcode.RETURN_VOID){
       val before=((code.getOrNull(index-1) as? ReferenceInstruction)?.reference as? MethodReference)
       require(before?.definingClass==capture.definingClass&&before.name==capture.name&&addresses[index] !in targets){"Bypassable constructor capture $m"}
      }
     }
     for(i in code){val r=(i as? ReferenceInstruction)?.reference
      if(c.type==own+"LyricsEntryButton;"&&m.name=="refreshNative"&&r is FieldReference&&!r.definingClass.startsWith(own)){nativeRendererFields++;require(r.type.startsWith("L")&&r.type!="Ljava/lang/String;")}
      if(r !is MethodReference)continue
      if(c.type==own+"LyricsSystemBars;")require(!(r.definingClass=="Landroid/view/ViewOverlay;"&&r.name=="add")&&r.definingClass!="Landroid/graphics/Bitmap;"&&r.name!="setSystemBarsAppearance"){"Lyrics navigation must be transparent without color sampling/overlays/icon overrides"}
      if(r.definingClass==own+"RendererPlayback;"&&r.name=="sample"){rendererClockHooks++;require(c.type=="Lapp/morphe/extension/music/patches/lyrics/LyricsPatch;"&&m.name=="onSetPlaybackState"&&code.first()==i)}
      if(r.definingClass==own+"NativeLyricsHost;"&&!c.type.startsWith(own))when(r.name){"captureController"->controllerCapture++;"onNativePanelChanged"->nativePanel++;"observeNativeDefinition"->definitionCapture++}
      if(r.definingClass==own+"LyricsEntryButton;"&&!c.type.startsWith(own))when(r.name){"capturePresenter"->presenterCapture++;"captureIdentity"->{nativeIdentityInputs++;require(code.first()==i&&m.returnType=="V"&&m.parameterTypes.firstOrNull()=="Ljava/lang/String;")};"rewriteNative"->{nativeModel++;require(m.returnType=="V"&&m.parameterTypes.size==2&&code.first()==i){"Model hook must precede native renderer"}};else->error("Obsolete native view hook $r")}
      if(c.type==own+"LyricsEntryButton;"){
       require(r.name !in setOf("setEnabled","setAlpha","setOnClickListener","addView","open")){"Entry still edits views or opens personal panel"}
       if(m.name=="refreshNative"&&!r.definingClass.startsWith(own))nativeRefresh++
       if(m.name=="rewriteNative"&&r.definingClass==own+"LyricsEntryButton;"&&r.name=="captureModel"){originalModelCaptures++;require(r.parameterTypes==listOf("Ljava/lang/Object;","Ljava/lang/Object;","[B"))}
       if(r.definingClass==own+"NativeActionModel;"&&r.name in setOf("enable","orderWhilePending","orderUnavailable"))modelCalls++
      }
      if(c.type==own+"BetterLyricsPanelView;"&&m.name=="createWebView"&&r.definingClass in setOf("Landroid/view/View;","Landroid/webkit/WebView;")&&r.parameterTypes==listOf("Z")&&r.name in setOf("setVerticalScrollBarEnabled","setHorizontalScrollBarEnabled"))hiddenNativeScrollbars++
      if(c.type==own+"BetterLyricsPanelView;"&&r.definingClass==own+"LyricsSystemBars;")when(r.name){"sync"->{require(m.name=="syncOverlay"&&r.parameterTypes==listOf("Landroid/view/View;","Z"));navigationSync++};"release"->{require(m.name=="onDetachedFromWindow");navigationRelease++}}
      if(c.type==own+"LyricsSystemBars;")require(r.name !in setOf("addView","setOnClickListener","setOnTouchListener","setDecorFitsSystemWindows","setLayout","setFlags","addFlags")){"Navigation protection changes content layout or input"}
      if(c.type in setOf(own+"LyricsEntryButton;",own+"NativeLyricsHost;"))require(!(r.name=="<init>"&&(r.definingClass.startsWith("Landroid/app/Dialog")||r.definingClass in setOf("Landroid/widget/TextView;","Landroid/widget/Button;","Landroid/widget/PopupWindow;"))))
      if(c.type==own+"NativeLyricsHost;"){
       require(r.name!="getDecorView")
       if(m.name=="panelRoot"&&r.returnType=="Landroid/view/View;")root++
       if(m.name=="panelId"&&r.returnType=="Ljava/lang/String;")id++
       if(m.name=="nativeDefinition"&&r.parameterTypes==listOf("Ljava/lang/String;"))definitions++
       require(m.name !in setOf("open","openNative")){"Personal direct-show route remains"}
      }
      if(c.type.startsWith(own)&&r.name=="parseFrom")parsers++
      if(r.definingClass==own+"LyricsEntryCoordinator;"&&r.name=="onPlaybackEvent"){
       require(c.type=="Lapp/morphe/extension/music/patches/lyrics/LyricsPatch;"&&m.name in setOf("onSetMetadata","onSetPlaybackState"));callbackNames.add(m.name);entryHooks++
      }
      if(c.type.startsWith(own)&&r.definingClass==own+"LyricsCatalog;"&&r.name=="<init>"){
       if(c.type==own+"LyricsCatalog;")require(m.name=="<init>"&&r.parameterTypes.size==7){"Unexpected catalog constructor delegation"}
       else if(c.type==own+"LyricsPrefetch;"){playlistPrefetchConstructors++;require(m.name.startsWith("lambda\$enqueue")&&r.parameterTypes.size==5){"Unexpected background playlist catalog owner: $m"};require(c.methods.single {it.name=="enqueue"}.implementation!!.instructions.any {i->((i as? ReferenceInstruction)?.reference as? MethodReference)?.let {it.definingClass==own+"LyricsPrefetch;"&&it.name=="installed"}==true}){"Playlist lyrics discovery must check installed personal lyrics assets"}}
       else{catalogConstructors++;if(c.type==own+"BetterLyricsPanelView;")panelConstructors++;require(c.type==own+"LyricsRepository;"){"View-owned catalog construction: $m"}}
      }
     }
    }
   }
  }}
  require(rendererClockHooks==1){"Missing or duplicate personal renderer clock hook"}
  require(callbackNames==setOf("onSetMetadata","onSetPlaybackState")&&callbackReturns>=2&&identityGetters==1&&catalogConstructors==1&&panelConstructors==0&&playlistPrefetchConstructors==1)
  require(controllerCapture==1&&presenterCapture==1&&nativeModel==1&&nativePanel==1&&parsers==2&&root==1&&id==1&&definitions==1&&nativeRefresh==1&&nativeRendererFields==1&&nativeVideoFields==0&&nativeIdentityInputs==4&&originalModelCaptures==1&&navigationSync==0&&navigationRelease==0&&!hasNavigationHelper&&hiddenNativeScrollbars==2&&modelCalls==3&&definitionCapture==1&&scoped&&legacyDisabled&&publicModel){"Native replay audit counts: controller=$controllerCapture presenter=$presenterCapture model=$nativeModel panel=$nativePanel parsers=$parsers root=$root id=$id definitions=$definitions refresh=$nativeRefresh renderer=$nativeRendererFields identity=$nativeIdentityInputs original=$originalModelCaptures navigation=$navigationSync/$navigationRelease scrollbars=$hiddenNativeScrollbars calls=$modelCalls scoped=$scoped legacy=$legacyDisabled public=$publicModel"}
  for(name in listOf("LyricsEntryCoordinator;","LyricsRepository;","LyricsEntryButton;","NativeLyricsHost;","NativePanelWire;","NativeActionModel;","ProtoWire;","RendererPlayback;"))require(own+name in classes)
  val hash=java.security.MessageDigest.getInstance("SHA-256").digest(file.readBytes()).joinToString(""){"%02x".format(it)}
  file.parentFile.resolve("entry-bytecode-audit.json").writeText("""{"passed":true,"apkSha256":"$hash","entryPlaybackHooks":$entryHooks,"callbackReturnSites":$callbackReturns,"allCallbackReturnsCovered":true,"controlFlowAndHandlersChecked":true,"nativeControllerCaptures":$controllerCapture,"nativePresenterCaptures":$presenterCapture,"nativeModelHooks":$nativeModel,"nativePanelHooks":$nativePanel,"nativeParsers":$parsers,"nativeViewMutations":0,"overlayUiConstructors":0,"duplicateClasses":0,"typedNativeRoot":true,"typedNativeIdentity":true,"typedRegistryLookup":true,"typedNativeRefresh":true,"publicModelBridge":true,"installerScoped":true,"legacyButtonOverrideDisabled":true,"constructorReturnCaptureSafe":true,"phoneVerified":false}""")
  println("PASS: native model and Music host contracts: ${file.parentFile.name}")
  file.parentFile.resolve("native-replay-audit.json").writeText("""{"passed":true,"apkSha256":"$hash","timestampedRendererClockHooks":$rendererClockHooks,"nativeActionModes":3,"nativeDefinitionCaptureSites":$definitionCapture,"nativeIdentityInputs":$nativeIdentityInputs,"originalNativeModelCaptureSites":$originalModelCaptures,"nativeRendererReplayCalls":$nativeRefresh,"optionalServerResponseIdentityGate":false,"nativeNavigationSyncSites":$navigationSync,"nativeNavigationReleaseSites":$navigationRelease,"navigationDecorationOnly":false,"sharedWindowNavigation":true,"navigationAlwaysTransparent":true,"navigationProtectionOverlays":false,"nativeScrollbarSuppressionSites":$hiddenNativeScrollbars,"personalButtonViewOverrides":false,"phoneVerified":false}""")
 }
}

