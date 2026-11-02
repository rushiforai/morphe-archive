/* Copyright 2026 BDCrusher. GPL-3.0. Exact native request/future contracts, no reflection. */
package app.bdcrusher.ytmusic.playlists
import app.morphe.patcher.*
import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patches.music.interaction.jam.*
import app.morphe.util.addFreeRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

private const val CACHE="Lapp/bdcrusher/ytmusic/playlists/NativeMediaCache;"
private const val REQUEST="Lapp/bdcrusher/ytmusic/playlists/NativeMediaCache\$Request;"
private const val CLIENT="Lapp/bdcrusher/ytmusic/playlists/NativeMediaCache\$Client;"
private const val NEXT="Lapp/bdcrusher/ytmusic/playlists/NativeMediaCache\$Next;"
private const val FUTURE="Lcom/google/common/util/concurrent/ListenableFuture;"
private object WatchRunnable:Fingerprint(strings=listOf("Problem fetching player response"))
private fun Method.isNextSender()=implementation?.instructions?.any {((it as? ReferenceInstruction)?.reference as? StringReference)?.string=="wn_s"}==true
private fun Method.calls()=implementation?.instructions?.mapNotNull {((it as? ReferenceInstruction)?.reference as? MethodReference)}?:emptyList()
private fun MethodReference.ref()="$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/** Called after upstream source edits, avoiding cached fingerprint index invalidation. */
internal fun BytecodePatchContext.installNativeMediaCache(playerProtoType:String){
    WatchRunnable.clearMatch();val runnerClass=WatchRunnable.classDef;val runner=runnerClass.methods.single {it.name=="run"&&it.parameterTypes.isEmpty()}
    val getters=runner.calls().filter {it.parameterTypes.isEmpty()&&it.returnType=="Ljava/lang/String;"}.distinct()
    val video=getters.singleOrNull()?:throw PatchException("Downloads: native watch recording getter is ambiguous")
    val request=mutableClassDefBy(video.definingClass);val videoMethod=request.methods.single {it.name==video.name&&it.parameterTypes==video.parameterTypes}
    val coreField=videoMethod.implementation!!.instructions.mapNotNull {((it as? ReferenceInstruction)?.reference as? FieldReference)}.firstOrNull {it.definingClass==request.type&&it.type.startsWith("L")}
        ?:throw PatchException("Downloads: native watch request core missing")
    val core=resolveProto(coreField.type,"native watch request")
    val schema=classDefBy(core.type).methods.flatMap {m->m.implementation?.instructions?.mapNotNull {((it as? ReferenceInstruction)?.reference as? StringReference)?.string}.orEmpty()}.singleOrNull {it.length>30&&it[0].code<8}
        ?:throw PatchException("Downloads: native request schema missing")
    // Actual APK raw-message-info: video ID=1, ID list=2, playlist ID=3, index=4, params=5.
    if(schema.map {it.code}.drop(10).take(14)!=listOf(1,4104,0,2,26,3,4104,1,4,4100,2,5,4104,4))throw PatchException("Downloads: unsupported native watch identity schema")
    val ctor=request.methods.singleOrNull {it.name=="<init>"&&it.parameterTypes.size==4&&it.parameterTypes[0]==core.type&&it.parameterTypes[1]=="I"}
        ?:throw PatchException("Downloads: native request copy contract missing")
    val fields=ctor.implementation!!.instructions.mapNotNull {((it as? ReferenceInstruction)?.reference as? FieldReference)}.filter {it.definingClass==request.type}.distinct()
    val mode=fields.single {it.type=="I"};val tracking=fields.single {it.type==ctor.parameterTypes[2]};val config=fields.single {it.type==ctor.parameterTypes[3]}
    request.interfaces.add(REQUEST)
    request.addBridge("bd_recording",emptyList(),"Ljava/lang/String;",1,body="invoke-virtual { p0 }, ${video.ref()}\nmove-result-object p0\nreturn-object p0")
    request.addBridge("bd_core",emptyList(),"[B",1,body="iget-object p0, p0, $coreField\ninvoke-virtual { p0 }, ${core.type}->toByteArray()[B\nmove-result-object p0\nreturn-object p0")
    request.addBridge("bd_copy",listOf("[B"),REQUEST,8,body="""
        ${core.decode("p1","v0")}
        new-instance v2, ${request.type}
        iget v3, p0, $mode
        iget-object v4, p0, $tracking
        iget-object v5, p0, $config
        invoke-direct { v2, v0, v3, v4, v5 }, ${ctor.ref()}
        return-object v2
    """)

    // The diagnostic literal also occurs in unrelated merged classes. Require the
    // typed watch request/future/dispatch relationship before selecting its owner.
    val transports=mutableListOf<String>()
    classDefForEach { c->if(c.methods.any {it.isNextSender()}&&c.methods.any {m->m.returnType==FUTURE&&m.parameterTypes.size==2&&m.parameterTypes[0]==request.type&&m.calls().any {it.definingClass==c.type&&it.parameterTypes.size==3&&it.parameterTypes[0]==request.type&&it.returnType=="V"}})transports+=c.type }
    val transport=mutableClassDefBy(transports.singleOrNull()?:throw PatchException("Downloads: native next transport missing or ambiguous: $transports"))
    val send=transport.methods.singleOrNull {m->m.returnType==FUTURE&&m.parameterTypes.size==2&&m.parameterTypes[0]==request.type&&m.calls().any {it.definingClass==transport.type&&it.parameterTypes.size==3&&it.parameterTypes[0]==request.type&&it.returnType=="V"}}
        ?:throw PatchException("Downloads: native next-response future contract ambiguous: ${transport.type} request=${request.type}; "+transport.methods.filter {it.returnType==FUTURE&&it.parameterTypes.firstOrNull()==request.type}.joinToString {it.ref()})
    val dispatch=send.calls().single {it.definingClass==transport.type&&it.parameterTypes.size==3&&it.parameterTypes[0]==request.type&&it.returnType=="V"}
    val callback=transport.methods.singleOrNull {it.returnType=="V"&&it.parameterTypes.size==3&&it.parameterTypes[1]==dispatch.parameterTypes[1]&&it.parameterTypes[2]==dispatch.parameterTypes[2]&&it.parameterTypes[0]!=request.type}
        ?:throw PatchException("Downloads: native next-response adapter missing")
    val response=mutableClassDefBy(callback.parameterTypes[0].toString())
    val responseCtor=response.methods.singleOrNull {it.name=="<init>"&&it.parameterTypes.size==1&&implementsType(it.parameterTypes[0].toString(),"Lcom/google/protobuf/MessageLite;")}
        ?:throw PatchException("Downloads: native next response constructor missing")
    val nextProto=resolveProto(responseCtor.parameterTypes.single().toString(),"native next response")
    val responseField=response.fields.single {it.type==nextProto.type}
    response.interfaces.add(NEXT);response.addBridge("bd_nextBytes",emptyList(),"[B",1,body="iget-object p0, p0, $responseField\ninvoke-virtual { p0 }, ${nextProto.type}->toByteArray()[B\nmove-result-object p0\nreturn-object p0")
    transport.interfaces.add(CLIENT);transport.addBridge("bd_next",listOf(REQUEST),FUTURE,3,body="check-cast p1, ${request.type}\nconst/4 v0, 0x0\ninvoke-virtual { p0, p1, v0 }, ${send.ref()}\nmove-result-object v0\nreturn-object v0")
    val cache=mutableClassDefBy(CACHE);cache.methods.removeAll {it.name=="decode"}
    cache.methods.removeAll {it.name=="createRequest"};cache.addBridge("createRequest",listOf("[B"),REQUEST,6,AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,"""
        ${core.decode("p0","v0")}
        new-instance v2, ${request.type}
        const/4 v1, 0x0
        const/4 v3, 0x0
        const/4 v4, 0x0
        invoke-direct { v2, v0, v1, v3, v4 }, ${ctor.ref()}
        return-object v2
    """)
    val sender=transport.methods.singleOrNull {it.isNextSender()}?:throw PatchException("Downloads: native next sender missing or ambiguous")
    val casts=sender.implementation!!.instructions.mapNotNull {((it as? ReferenceInstruction)?.reference as? TypeReference)?.type}.toSet()
    val transportCtor=transport.methods.singleOrNull {it.name=="<init>"&&it.parameterTypes.count {type->type in casts}>=3}
        ?:throw PatchException("Downloads: authenticated metadata transport constructor missing or ambiguous")
    for(index in transportCtor.implementation!!.instructions.withIndex().filter {it.value.opcode==Opcode.RETURN_VOID}.map {it.index}.reversed())transportCtor.addInstructions(index,"invoke-static/range { p0 .. p0 }, $CACHE->initialized($CLIENT)V")
    cache.addBridge("decode",listOf("[B"),"Ljava/lang/Object;",4,AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,"""
        ${nextProto.decode("p0","v0")}
        new-instance v2, ${response.type}
        invoke-direct { v2, v0 }, ${responseCtor.ref()}
        return-object v2
    """)
    val nativePlayer=mutableListOf<Method>()
    classDefForEach {c->nativePlayer+=c.methods.filter {it.name=="<init>"&&it.parameterTypes==listOf(playerProtoType,"J")}}
    val playerCtor=nativePlayer.singleOrNull()?:throw PatchException("Downloads: native saved-player constructor missing or ambiguous")
    if(!AccessFlags.PUBLIC.isSet(playerCtor.accessFlags)||!AccessFlags.PUBLIC.isSet(responseCtor.accessFlags))throw PatchException("Downloads: native response constructors must remain publicly accessible")
    val playerProto=resolveProto(playerProtoType,"saved player response")
    cache.methods.removeAll {it.name=="decodePlayer"};cache.addBridge("decodePlayer",listOf("[B"),"Ljava/lang/Object;",6,AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,"""
        ${playerProto.decode("p0","v0")}
        new-instance v2, ${playerCtor.definingClass}
        invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
        move-result-wide v3
        invoke-direct { v2, v0, v3, v4 }, ${playerCtor.ref()}
        return-object v2
    """)
    if(send.implementation!!.registerCount<4)throw PatchException("Downloads: native next future scratch register missing")
    for(i in send.implementation!!.instructions.withIndex().filter {it.value.opcode==Opcode.RETURN_OBJECT}.map {it.index}.reversed()){
        val result=send.getInstruction<OneRegisterInstruction>(i).registerA
        if(result>15||send.implementation!!.registerCount>16)throw PatchException("Downloads: unsupported native next callback registers")
        send.addInstructions(i,"invoke-static { v$result, p1 }, $CACHE->observe($FUTURE$REQUEST)$FUTURE\nmove-result-object v$result")
    }
    send.addInstructionsWithLabels(0,"""
        invoke-static { p0, p1 }, $CACHE->capture($CLIENT$REQUEST)V
        invoke-static { p1 }, $CACHE->cached($REQUEST)$FUTURE
        move-result-object v0
        if-eqz v0, :network_next
        return-object v0
        :network_next
        nop
    """)
    val nativeClients=runnerClass.fields.mapNotNull {classDefByOrNull(it.type)}.filter {c->AccessFlags.INTERFACE.isSet(c.accessFlags)&&c.methods.any {it.parameterTypes.firstOrNull()==request.type&&it.returnType=="Landroid/util/Pair;"}}
    val api=nativeClients.singleOrNull()?:throw PatchException("Downloads: native paired playback client missing or ambiguous")
    val paired=api.methods.singleOrNull {it.parameterTypes.size==4&&it.parameterTypes[0]==request.type&&it.returnType!="Landroid/util/Pair;"&&it.returnType!=FUTURE}
        ?:throw PatchException("Downloads: native combined player/next result missing")
    val implementations=mutableListOf<String>();classDefForEach {c->if(api.type in c.interfaces)implementations+=c.type}
    val combiners=implementations.flatMap {type->classDefBy(type).methods.flatMap {it.calls()}}.filter {it.parameterTypes==listOf(FUTURE,FUTURE)&&it.returnType==paired.returnType}.distinct()
    val combine=combiners.singleOrNull()?:throw PatchException("Downloads: native paired-future factory changed")
    val combiner=classDefBy(combine.definingClass).methods.single {it.name==combine.name&&it.parameterTypes==combine.parameterTypes&&it.returnType==combine.returnType}
    if(!AccessFlags.PUBLIC.isSet(combiner.accessFlags)||!AccessFlags.STATIC.isSet(combiner.accessFlags)||!AccessFlags.PUBLIC.isSet(classDefBy(combine.definingClass).accessFlags))throw PatchException("Downloads: native paired-future factory is inaccessible")
    cache.addBridge("bd_combined",listOf(REQUEST),"Ljava/lang/Object;",4,AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,"""
        invoke-static { p0 }, $CACHE->pair($REQUEST)Landroid/util/Pair;
        move-result-object v0
        if-eqz v0, :absent
        iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;
        check-cast v1, $FUTURE
        iget-object v2, v0, Landroid/util/Pair;->second:Ljava/lang/Object;
        check-cast v2, $FUTURE
        invoke-static { v1, v2 }, ${combine.ref()}
        move-result-object v0
        :absent
        return-object v0
    """)
    var pairs=0;var players=0
    for(type in implementations)for(original in mutableClassDefBy(type).methods.toList()){
        var method=original
        val params=method.parameterTypes.map {it.toString()};val parameter=params.indexOf(request.type);if(parameter<0||method.implementation==null)continue
        val pair=params.size==4&&params[0]==request.type&&params[1]=="Ljava/lang/String;"&&params[3]=="Z"&&method.returnType in listOf("Landroid/util/Pair;",paired.returnType)
        val player=method.returnType==FUTURE&&((params.size==5&&params[0]=="Ljava/lang/String;"&&params[1]==request.type&&params[4]=="Z")||(params.size==5&&params[0]==request.type&&params[1]=="Ljava/lang/String;"&&params[2]=="I"))
        if(!pair&&!player)continue
        val words=1+params.sumOf {if(it=="J"||it=="D")2 else 1};if(method.implementation!!.registerCount<=words)method=method.addFreeRegisters(1).first
        val p=1+params.take(parameter).sumOf {if(it=="J"||it=="D")2 else 1}
        val function=if(pair)if(method.returnType=="Landroid/util/Pair;")"pair($REQUEST)Landroid/util/Pair;" else "bd_combined($REQUEST)Ljava/lang/Object;" else "player($REQUEST)$FUTURE"
        method.addInstructionsWithLabels(0,"""
            invoke-static/range { p$p .. p$p }, $CACHE->$function
            move-result-object v0
            if-eqz v0, :ordinary_request
            check-cast v0, ${method.returnType}
            return-object v0
            :ordinary_request
            nop
        """)
        if(pair)pairs++ else players++
    }
    if(pairs<2||players<2)throw PatchException("Downloads: incomplete native playback entry coverage")
}
