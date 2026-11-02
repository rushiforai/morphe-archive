/* Copyright 2026 BDCrusher. GPL-3.0. Exact native media-library contracts, both supported originals. */
package app.bdcrusher.ytmusic.playlists

import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patches.music.interaction.jam.addBridge
import app.morphe.patches.music.interaction.jam.decode
import app.morphe.patches.music.interaction.jam.resolveProto
import app.morphe.patches.shared.misc.spoof.CreateStreamingDataFingerprint
import app.morphe.patches.shared.misc.spoof.NativeNetFetchFingerprint
import app.morphe.patches.shared.misc.fix.proto.fixProtoLibraryPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

private const val LOCAL="Lapp/bdcrusher/ytmusic/playlists/LocalPlayback;"
private const val FETCH="Lapp/bdcrusher/ytmusic/playlists/LocalNetFetch;"
private const val MEDIA="Lcom/google/android/libraries/youtube/media/interfaces/"

val localPlaybackPatch=bytecodePatch {
    dependsOn(fixProtoLibraryPatch,offlineArtworkResources,app.morphe.patches.music.misc.extension.sharedExtensionPatch,app.bdcrusher.ytmusic.nativeentry.personalRuntimePatch)
    // Install after upstream stream fingerprints have consumed their original instruction indices.
    finalize {
        // Validate every non-obfuscated contract used by the compile-only stubs before any injection.
        val expected=mapOf(
            "HttpRequest" to listOf("getUri()Ljava/lang/String;","getHeaders()Ljava/util/ArrayList;","getMethod()${MEDIA}HttpMethod;"),
            "HttpHeader" to listOf("<init>(Ljava/lang/String;Ljava/lang/String;)V","getKey()Ljava/lang/String;","getValue()Ljava/lang/String;"),
            "HttpResponse" to listOf("<init>(ILjava/util/ArrayList;)V"),
            "QoeError" to listOf("<init>(Ljava/lang/String;Ljava/util/ArrayList;)V"),
            "NetFetchCallbacks" to listOf("onBodyData(Ljava/nio/ByteBuffer;)V","onHttpResponse(${MEDIA}HttpResponse;)V","onDone(${MEDIA}QoeError;Z)V"),
            "NetFetchTask" to listOf("cancel()V"),
            "NetFetch" to listOf("startFetchTask(${MEDIA}HttpRequest;${MEDIA}NetFetchCallbacks;)${MEDIA}NetFetchTask;","onDefaultNetworkAvailable()V","onDefaultNetworkChange(I)V","onDefaultNetworkUnavailable()V","onProxySettingsChange(Ljava/lang/String;I)V")
        )
        for((name,methods) in expected){val type=classDefByOrNull("$MEDIA$name;")?:throw PatchException("Downloads: native media interface $name is missing")
            for(signature in methods)if(type.methods.none {"${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}"==signature&&AccessFlags.PUBLIC.isSet(it.accessFlags)})throw PatchException("Downloads: incompatible native media contract $name.$signature")}
        val task=classDefBy("${MEDIA}NetFetchTask;")
        val sampling="Lcom/google/android/apps/youtube/proto/streaming/BandwidthSamplingConfigOuterClass\$BandwidthSamplingConfig;"
        for(name in listOf("onPauseBandwidthSamplingHint","onStartBandwidthSamplingHint"))if(task.methods.none {it.name==name&&it.parameterTypes==listOf(sampling)&&it.returnType=="V"})throw PatchException("Downloads: unsupported native bandwidth callback")

        CreateStreamingDataFingerprint.clearMatch();val descriptor=CreateStreamingDataFingerprint.method
        val proto=resolveProto(descriptor.parameterTypes.single().toString(),"native player response")
        val runtime=mutableClassDefBy(LOCAL)
        runtime.addBridge("bd_nativeResponse",listOf(proto.type),proto.type,4,AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,"""
            invoke-virtual { p0 }, ${proto.type}->toByteArray()[B
            move-result-object v0
            invoke-static { v0 }, $LOCAL->replace([B)[B
            move-result-object v0
            if-eqz v0, :original
            ${proto.decode("v0","v1")}
            return-object v1
            :original
            return-object p0
        """)
        descriptor.addInstructions(0,"invoke-static/range { p1 .. p1 }, $LOCAL->bd_nativeResponse(${proto.type})${proto.type}\nmove-result-object p1")

        // Cronet-backed native media requests and the alternate Envoy factory both serve local bytes.
        NativeNetFetchFingerprint.clearMatch();val start=NativeNetFetchFingerprint.method
        if(start.implementation!!.registerCount<4)throw PatchException("Downloads: native media task needs one scratch register")
        start.addInstructionsWithLabels(0,"""
            invoke-static/range { p1 .. p2 }, $FETCH->local(${MEDIA}HttpRequest;${MEDIA}NetFetchCallbacks;)${MEDIA}NetFetchTask;
            move-result-object v0
            if-eqz v0, :network
            return-object v0
            :network
            nop
        """)
        val factory=mutableClassDefBy("${MEDIA}NetFetchFactory;")
        val create=factory.methods.singleOrNull {it.name=="createEnvoyNetFetch"&&it.returnType=="${MEDIA}NetFetch;"&&it.implementation!=null}?:throw PatchException("Downloads: native Envoy factory missing or ambiguous")
        val exits=create.implementation!!.instructions.withIndex().filter {it.value.opcode==Opcode.RETURN_OBJECT}.map {it.index}
        if(exits.isEmpty())throw PatchException("Downloads: native Envoy factory has no result")
        for(index in exits.reversed()){val r=create.getInstruction<OneRegisterInstruction>(index).registerA;create.addInstructions(index,"invoke-static/range { v$r .. v$r }, $FETCH->wrap(${MEDIA}NetFetch;)${MEDIA}NetFetch;\nmove-result-object v$r")}
        // A selected network spoof must never overwrite the exact local format later in the constructor.
        val spoof=mutableClassDefBy("Lapp/morphe/extension/shared/spoof/SpoofVideoStreamsPatch;")
        val stream=spoof.methods.single {it.name=="getStreamingData"&&it.parameterTypes==listOf("Ljava/lang/String;")}
        stream.addInstructionsWithLabels(0,"""
            invoke-static/range { p0 .. p0 }, $LOCAL->response(Ljava/lang/String;)[B
            move-result-object v0
            if-eqz v0, :network_stream
            return-object v0
            :network_stream
            nop
        """)
        // The native stream consumer parses a PlayerResponse wrapper before
        // extracting its streaming-data field. Retain that exact wire contract.
        // Prevent the following network-config override for a saved recording.
        val config=spoof.methods.single {it.name=="getPlayerConfig"&&it.parameterTypes==listOf("Ljava/lang/String;")&&it.returnType=="[B"}
        if(config.implementation!!.registerCount<=1)throw PatchException("Downloads: saved configuration guard has no scratch register")
        config.addInstructionsWithLabels(0,"""
            invoke-static/range { p0 .. p0 }, $LOCAL->response(Ljava/lang/String;)[B
            move-result-object v0
            if-eqz v0, :network_configuration
            const/4 v0, 0x0
            return-object v0
            :network_configuration
            nop
        """)
        val length=spoof.methods.single {it.name=="getVideoLengthSeconds"&&it.parameterTypes==listOf("Ljava/lang/String;")&&it.returnType=="J"}
        if(length.implementation!!.registerCount<5)throw PatchException("Downloads: saved duration hook has no scratch registers")
        length.addInstructionsWithLabels(0,"""
            invoke-static/range { p0 .. p0 }, $LOCAL->duration(Ljava/lang/String;)J
            move-result-wide v0
            const-wide/16 v2, 0x0
            cmp-long v2, v0, v2
            if-lez v2, :network_duration
            return-wide v0
            :network_duration
            nop
        """)
        installNativeMediaCache(proto.type)
        installOfflineArtwork()
    }
}
