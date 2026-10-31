/*
 * Copyright 2026 BDCrusher. GPL-3.0.
 * MediaSession/engagement fingerprints adapted from Morphe v1.48.0-dev.19; its NOTICE applies.
 */
package app.bdcrusher.ytmusic.addon
import app.bdcrusher.ytmusic.nativeentry.installNativeLyricsHooks
import app.bdcrusher.ytmusic.nativeentry.normalizePersonalLyricsAccessors
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.*
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.reference.*
private const val PREFIX="Lapp/morphe/extension/music/"
private const val OWN="Lapp/bdcrusher/ytmusic/lyrics/"
private object Metadata:Fingerprint(filters=listOf(
    fieldAccess(opcode=Opcode.IGET_OBJECT,type="Landroid/media/MediaMetadata;"),
    methodCall(definingClass="Landroid/media/session/MediaSession;",name="setMetadata",parameters=listOf("Landroid/media/MediaMetadata;"))))
private object Playback:Fingerprint(filters=listOf(methodCall(definingClass="Landroid/media/session/MediaSession;",name="setPlaybackState",parameters=listOf("Landroid/media/session/PlaybackState;"))))
private object Engagement:Fingerprint(strings=listOf(
    "EngagementPanelController: cannot show EngagementPanel before EngagementPanelController.init() has been called.",
    "[EngagementPanel] Cannot show EngagementPanel before EngagementPanelController.init() has been called."))
private object Assets
private val assets=resourcePatch {
    execute {
        val files=listOf("index.html","host.css","renderer.js","variables.css","lyrics.css","image-highlights.css","instrumental.css","Satoshi-Variable.woff2","NOTICE.txt","providers.json","bd_lyrics_syllable.xml","bd_lyrics_word.xml","bd_lyrics_line.xml","bd_lyrics_unsynced.xml")
        for(name in files){
            val destination=this["assets/bdcrusher-lyrics/"+name];destination.parentFile.mkdirs()
            val stream=Assets::class.java.classLoader!!.getResourceAsStream("bdcrusher-lyrics/"+name)?:error("Missing personal asset "+name)
            stream.use {input->destination.outputStream().use {input.copyTo(it)}}
        }
        for(name in listOf("morphe_yt_copy_bold.xml","morphe_yt_romanize.xml")){
            val destination=this["res/drawable/"+name]
            if(!destination.exists()){destination.parentFile.mkdirs();Assets::class.java.classLoader!!.getResourceAsStream("drawable/"+name)!!.use {input->destination.outputStream().use {input.copyTo(it)}}}
        }
    }
}
@Suppress("unused")
val lyricsAddon=bytecodePatch(
    name="Third-party lyrics — Better Lyrics add-on",
    description="BDCrusher lyrics-only companion. Deselect Full Collection. Requires official default Music patches with official Third-party lyrics disabled.",
    default=false
){
    category("Lyrics-only Add-on")
    dependsOn(app.bdcrusher.ytmusic.nativeentry.addonEditionGuard, app.bdcrusher.ytmusic.nativeentry.personalRuntimePatch, assets)
    compatibleWith(Compatibility(packageName="com.google.android.apps.youtube.music",name="YouTube Music",
        apkFileType=ApkFileType.APK_REQUIRED,appIconColor=0xFF0000,
        signatures=setOf("6a2f65ec694a6a632acdcb5080912a565f903d4b8d83f0eb8e44fbdf2660d8e1","a2a1ad7ba7f41dfca4514e2afeb90691719af6d0fdbed4b09bbf0ed897701ceb"),
        targets=listOf(AppTarget(version="9.42.52",versionCodes=mapOf(SupportedAbi.ARM64_V8A to 94252240),minSdk=26,isExperimental=true))))
    execute {
        if(packageMetadata.versionName!="9.42.52"||packageMetadata.versionCode!="94252240")throw PatchException("Personal lyrics requires original YouTube Music 9.42.52 / 94252240 arm64-v8a.")
    }
    finalize {
        fun required(type:String)=mutableClassDefByOrNull(type)?:throw PatchException("Missing official Morphe runtime: "+type+". Select compatible official default Music patches, disabling their Third-party lyrics.")
        required(PREFIX+"settings/preference/MusicPreferenceFragment;")
        val manager=required(PREFIX+"patches/lyrics/LyricsManager;")
        val installer=required(PREFIX+"patches/lyrics/ui/LyricsPanelInstaller;")
        normalizePersonalLyricsAccessors()
        val callbacks=required(PREFIX+"patches/lyrics/LyricsPatch;")
        for(name in listOf("onSetMetadata","onSetPlaybackState")){
            val callback=callbacks.methods.singleOrNull {it.name==name&&it.returnType=="V"&&it.parameterTypes.size==1}
                ?:throw PatchException("Unsupported official playback callback: "+name)
            val returns=callback.implementation!!.instructions.withIndex().filter {it.value.opcode==Opcode.RETURN_VOID}.map {it.index}
            if(returns.isEmpty())throw PatchException("Missing official callback return: "+name)
            for(index in returns.reversed()){
                // Replace the branch target itself; inserting before a labelled return can be skipped.
                callback.replaceInstruction(index,BuilderInstruction35c(Opcode.INVOKE_STATIC,0,0,0,0,0,0,ImmutableMethodReference(OWN+"LyricsEntryCoordinator;","onPlaybackEvent",emptyList(),"V")))
                callback.addInstruction(index+1,"return-void")
            }
        }
        val meta=Metadata.method
        if(meta.implementation!!.instructions.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass==PREFIX+"patches/lyrics/LyricsPatch;"})
            throw PatchException("Two lyrics patches selected. Disable official Third-party lyrics; do not combine the Full edition with this add-on.")
        for((fp,method,arg) in listOf(Triple(Metadata,"onSetMetadata","Landroid/media/MediaMetadata;"),Triple(Playback,"onSetPlaybackState","Landroid/media/session/PlaybackState;"))){
            fp.clearMatch();val target=fp.method;val index=fp.instructionMatches.last().index
            val call=target.getInstruction<FiveRegisterInstruction>(index)
            target.addInstruction(index,"invoke-static { v"+call.registerD+" }, "+PREFIX+"patches/lyrics/LyricsPatch;->"+method+"("+arg+")V")
        }
        // Shared personal infrastructure normalizes the compile-only clock accessors.
        val old=PREFIX+"patches/lyrics/ui/LyricsPanelView;"
        val replacement=OWN+"BetterLyricsPanelView;"
        for(method in installer.methods) {
            val instructions=method.implementation?.instructions?.toList()?:continue
            for((i,insn) in instructions.withIndex()){
                val ref=(insn as? ReferenceInstruction)?.reference
                if(ref is TypeReference&&ref.type==old){
                    val type=ImmutableTypeReference(replacement)
                    when(insn){is TwoRegisterInstruction->method.replaceInstruction(i,BuilderInstruction22c(insn.opcode,insn.registerA,insn.registerB,type))
                        is OneRegisterInstruction->method.replaceInstruction(i,BuilderInstruction21c(insn.opcode,insn.registerA,type))
                        else->throw PatchException("Unsupported native panel type instruction")}
                }else if(ref is MethodReference&&ref.definingClass==old){
                    val call=ImmutableMethodReference(replacement,ref.name,ref.parameterTypes,ref.returnType)
                    when(insn){is FiveRegisterInstruction->method.replaceInstruction(i,BuilderInstruction35c(insn.opcode,insn.registerCount,insn.registerC,insn.registerD,insn.registerE,insn.registerF,insn.registerG,call))
                        is RegisterRangeInstruction->method.replaceInstruction(i,BuilderInstruction3rc(insn.opcode,insn.startRegister,insn.registerCount,call))
                        else->throw PatchException("Unsupported native panel call")}
                }
            }
        }
        // Restrict the reused native coordinator to YouTube fallback adapters.
        required(PREFIX+"patches/lyrics/requests/LunaBeatProvider;").methods.single {it.name=="preloadIndex"&&it.returnType=="V"}.addInstruction(0,"return-void")
        for(method in manager.methods)for((i,insn) in (method.implementation?.instructions?.toList()?:emptyList()).withIndex()){
            val ref=(insn as? ReferenceInstruction)?.reference as? MethodReference?:continue
            if(ref.name=="providersInOrder"&&ref.definingClass.endsWith("/LyricsProviders;")){
                val call=ImmutableMethodReference(OWN+"NativeLyricsBridge;","providersInOrder",ref.parameterTypes,ref.returnType)
                val r=insn as FiveRegisterInstruction
                method.replaceInstruction(i,BuilderInstruction35c(insn.opcode,r.registerCount,r.registerC,r.registerD,r.registerE,r.registerF,r.registerG,call))
            }
        }
        val fragment=required(PREFIX+"settings/preference/MusicPreferenceFragment;")
        val init=fragment.methods.single {it.name=="initialize"&&it.parameterTypes.isEmpty()}
        val before=init.implementation!!.instructions.indexOfFirst {((it as? ReferenceInstruction)?.reference as? MethodReference)?.name=="sortPreferenceGroups"}
        if(before<0)throw PatchException("Unsupported official Music settings initialization")
        init.addInstruction(before,"invoke-static { p0 }, "+OWN+"LyricsSettingsPage;->install(Landroid/preference/PreferenceFragment;)V")
        val filter=required("Lapp/morphe/extension/shared/patches/components/LithoFilterPatch;")
        val clinit=filter.methods.single {it.name=="<clinit>"}
        val arrayStore=clinit.implementation!!.instructions.withIndex().filter {(_,insn)->insn.opcode==Opcode.SPUT_OBJECT&&((insn as? ReferenceInstruction)?.reference as? FieldReference)?.type=="[Lapp/morphe/extension/shared/patches/components/Filter;"}.singleOrNull()?.index
            ?:throw PatchException("Unsupported official Litho filter-array assignment")
        val register=clinit.getInstruction<OneRegisterInstruction>(arrayStore).registerA
        clinit.addInstructions(arrayStore,"invoke-static { v"+register+" }, "+OWN+"NativeLyricsBridge;->withLyricsFilter([Lapp/morphe/extension/shared/patches/components/Filter;)[Lapp/morphe/extension/shared/patches/components/Filter;\nmove-result-object v"+register)
        // Heading-less panels use the same scoped engagement hook as the full edition.
        Engagement.clearMatch();val clazz=Engagement.classDef
        val types=clazz.fields.filter {it.type.startsWith("L")&&it.accessFlags and (AccessFlags.STATIC.value or AccessFlags.FINAL.value)==0}.map {it.type}
        val set=clazz.methods.single {it.returnType=="V"&&it.parameterTypes.size==2&&it.parameterTypes[1]=="Z"&&it.parameterTypes[0] in types}
        val index=set.implementation!!.instructions.indexOfFirst {val f=((it as? ReferenceInstruction)?.reference as? FieldReference);it.opcode==Opcode.IPUT_OBJECT&&f?.definingClass==clazz.type&&f.type==set.parameterTypes[0]}
        if(index<0)throw PatchException("Unsupported engagement panel assignment")
        set.addInstruction(index+1,"invoke-static { p1 }, "+PREFIX+"patches/lyrics/ui/LyricsPanelInstaller;->onEngagementPanelChanged(Ljava/lang/Object;)V")
        installNativeLyricsHooks()
        // Verify every direct official method reference in the personal payload after both sources execute.
        fun resolves(type:String,ref:MethodReference,seen:MutableSet<String> = mutableSetOf()):Boolean {
            if(!seen.add(type))return false
            val native=classDefByOrNull(type)?:return false
            return native.methods.any {it.name==ref.name&&it.parameterTypes==ref.parameterTypes&&it.returnType==ref.returnType} ||
                native.superclass?.let {resolves(it,ref,seen)}==true || native.interfaces.any {resolves(it,ref,seen)}
        }
        classDefForEach { c -> if(c.type.startsWith(OWN))for(m in c.methods)for(insn in m.implementation?.instructions?:emptyList()){
            val ref=(insn as? ReferenceInstruction)?.reference as? MethodReference?:continue
            if(!ref.definingClass.startsWith("Lapp/morphe/"))continue
            if(!resolves(ref.definingClass,ref))throw PatchException("Unsupported official API "+ref)
        } }
    }
}

