/* Copyright 2026 BDCrusher. GPL-3.0. Native owner contracts verified on both original APKs. */
package app.bdcrusher.ytmusic.playlists
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patches.music.interaction.jam.addBridge
import app.morphe.patches.music.interaction.jam.implementsType
import app.morphe.patches.music.interaction.downloads.CommandResolverFingerprint
import app.morphe.util.cloneParameters
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
private const val CONTEXT="Lapp/bdcrusher/ytmusic/playlists/DownloadViewContext;"
private const val OWNER="Lapp/bdcrusher/ytmusic/playlists/DownloadViewContext\$Owner;"
private const val DOWNLOADS="Lapp/morphe/extension/music/patches/DownloadsPatch;"
private const val COMMAND="Lapp/morphe/extension/music/patches/DownloadsPatch\$ProtocolBufferFieldInterface;"
private object DownloadPlayer:Fingerprint(strings=listOf("com/google/android/apps/youtube/music/watchpage/VideoActionBarPresenter"))
private object DownloadHeader:Fingerprint(strings=listOf("com/google/android/apps/youtube/music/ui/presenter/MusicElementHeaderPresenter"))
private fun Method.calls()=implementation?.instructions?.mapNotNull {it.getReference<MethodReference>()}.orEmpty()
/** Finalize after optional model rewrites so cached fingerprint offsets stay valid. */
internal fun BytecodePatchContext.installDownloadViewContext(){
    fun fail(s:String):Nothing=throw PatchException("Downloads: native click ownership changed: $s")
    DownloadPlayer.clearMatch();DownloadHeader.clearMatch()
    val player=mutableClassDefBy(DownloadPlayer.classDef.type)
    val header=mutableClassDefBy(DownloadHeader.classDef.type)
    val initialVideo=player.methods.filter {it.name=="<init>"}.flatMap {m->
        val code=m.implementation!!.instructions.toList();code.withIndex().mapNotNull {(n,i)->
            if(i.opcode!=Opcode.IPUT_OBJECT)return@mapNotNull null
            val f=i.getReference<FieldReference>()?:return@mapNotNull null
            val before=code.getOrNull(n-1)
            if(f.definingClass==player.type&&f.type=="Ljava/lang/String;"&&before?.getReference<StringReference>()?.string==""&&
                (i as TwoRegisterInstruction).registerA==(before as OneRegisterInstruction).registerA)f else null
        }
    }.distinct().singleOrNull()?:fail("committed action-bar recording field")
    for((owner,video)in listOf(player to initialVideo,header to null)){
        val root=owner.fields.singleOrNull {it.type=="Landroid/view/ViewGroup;"&&!AccessFlags.STATIC.isSet(it.accessFlags)}?:fail("presenter element container")
        owner.interfaces.add(OWNER)
        owner.addBridge("bd_downloadRoot",emptyList(),"Landroid/view/View;",2,body="iget-object v0, p0, $root\nreturn-object v0")
        owner.addBridge("bd_downloadVideo",emptyList(),"Ljava/lang/String;",2,body=if(video==null)"const/4 v0, 0x0\nreturn-object v0" else "iget-object v0, p0, $video\nreturn-object v0")
        val constructors=owner.methods.filter {it.name=="<init>"};if(constructors.isEmpty())fail("presenter constructor")
        for(original in constructors){
            // Native constructors reuse parameter registers; keep a fresh receiver alias.
            val ctor=original.cloneParameters()
            for(index in ctor.implementation!!.instructions.withIndex().filter {it.value.opcode==Opcode.RETURN_VOID}.map {it.index}.reversed())
                ctor.addInstruction(index,"invoke-static/range { p0 .. p0 }, $CONTEXT->register(Ljava/lang/Object;)V")
        }
    }
    val factories=header.methods.flatMap {m->m.implementation?.instructions?.mapNotNull {i->
        val ref=i.getReference<MethodReference>()?:return@mapNotNull null
        if(i.opcode!=Opcode.INVOKE_INTERFACE||ref.parameterTypes.size!=1||!ref.returnType.startsWith("L"))return@mapNotNull null
        val result=classDefByOrNull(ref.returnType)?:return@mapNotNull null
        if(result.fields.count {it.type=="[B"}!=1||!implementsType(ref.parameterTypes.single().toString(),"Lcom/google/protobuf/MessageLite;"))return@mapNotNull null
        m to ref
    }.orEmpty()}
    val (originalBind,factory)=factories.singleOrNull()?:fail("header model factory")
    val proto=factory.parameterTypes.single().toString()
    header.addBridge("bd_downloadHeader",listOf(proto),proto,3,body="""
        invoke-interface { p1 }, Lcom/google/protobuf/MessageLite;->toByteArray()[B
        move-result-object v0
        invoke-static { p0, v0 }, $CONTEXT->header(Ljava/lang/Object;[B)V
        return-object p1
    """)
    val method=originalBind.cloneParameters()
    val index=method.implementation!!.instructions.indexOfFirst {it.getReference<MethodReference>()==factory}
    val call=method.implementation!!.instructions.elementAt(index) as? FiveRegisterInstruction?:fail("header factory registers")
    val receiver=method.implementation!!.registerCount-method.parameterTypes.size-1
    if(receiver>15||call.registerD>15)fail("header register range")
    method.addInstructions(index,"invoke-virtual { v$receiver, v${call.registerD} }, ${header.type}->bd_downloadHeader($proto)$proto\nmove-result-object v${call.registerD}")
    CommandResolverFingerprint.clearMatch();val resolver=CommandResolverFingerprint.originalMethod
    val dispatch=mutableClassDefBy(resolver.definingClass).methods.singleOrNull {m->
        !AccessFlags.STATIC.isSet(m.accessFlags)&&m.returnType=="V"&&m.parameterTypes.map {it.toString()}==listOf(resolver.parameterTypes[1].toString(),"Ljava/util/Map;")&&m.calls().any {it.definingClass==resolver.definingClass&&it.name==resolver.name&&it.returnType=="Z"}
    }?:fail("command dispatch before worker scheduling; resolver=$resolver; methods="+mutableClassDefBy(resolver.definingClass).methods.joinToString {it.toString()})
    val captured=dispatch.cloneParameters()
    if(captured.implementation!!.registerCount>16)fail("dispatcher register range")
    captured.addInstructions(0,"invoke-static { p1, p2 }, $DOWNLOADS->captureDownloadContext(${COMMAND}Ljava/util/Map;)Ljava/util/Map;\nmove-result-object p2")
}
