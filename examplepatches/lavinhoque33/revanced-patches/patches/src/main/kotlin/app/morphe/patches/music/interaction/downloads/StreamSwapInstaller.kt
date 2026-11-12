/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.misc.fix.proto.parseByteArrayMethodRef
import app.morphe.util.Utils.printInfo
import app.morphe.util.Utils.printWarn
import app.morphe.util.fingerprint.matchSingle
import app.morphe.util.findMutableMethodOf
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SWAP = "Lapp/morphe/extension/music/patches/downloads/StreamSwap;"
private const val RESPONSE = $$"Lapp/morphe/extension/music/patches/downloads/StreamSwap$Response;"
private const val REGISTRY = "Lcom/google/protobuf/ExtensionRegistryLite;"
private const val REQUEST = "$SWAP->swap(Ljava/lang/Object;)Ljava/lang/Object;"

/**
 * Structurally resolved ABI, in 9.40.51 / 9.15.51 / 8.30.54 order:
 * request Lablf.d / Lazpg.d / Lawjm.c; wrapper Lwem / Lapde / Lamwf;
 * streaming Lwed / Lapck / Lamvm; offline factories Lwee.b / Lapcl.b / Lamvn.b.
 * Producer transform coverage is 4 / 4 / 5 sites, including legacy Labli.f on 9.40.
 * Resolve every dependency before mutation; an unfamiliar ABI only warns and leaves playback online.
 */
internal fun BytecodePatchContext.installStreamSwap() {
    if (packageMetadata.versionName !in setOf("9.40.51", "9.15.51", "8.30.54")) {
        printWarn("Play downloads locally is unavailable on this Music version; online playback unchanged.")
        return
    }
    try {
        val installGuard = prepareStreamSwapGuard()
        val installLocalSource = prepareStreamSwapLocalSource()
        val supported = mutableClassDefBy(SWAP).methods.single { it.name == "supported" }
        val caller = streamSwapCallerFingerprint.matchSingle().method
        val instructions = caller.implementation!!.instructions.toList()
        val transformIndex = instructions.indices.single { instructions[it].isStreamTransform(caller) }
        val videoId = instructions[transformIndex - 2].getReference<MethodReference>()!!
        check(instructions[transformIndex - 2].opcode == Opcode.INVOKE_INTERFACE &&
            videoId.definingClass == caller.returnType && videoId.parameterTypes.isEmpty() &&
            videoId.returnType == "Ljava/lang/String;")
        val parameterTypes = caller.parameterTypes.map(CharSequence::toString)
        check(parameterTypes.all { it.startsWith("L") } &&
            caller.implementation!!.registerCount in parameterTypes.size + 2..16)
        val transform = instructions[transformIndex].getReference<MethodReference>()!!
        val producerSites = streamSwapProducerSites(transform)
        check(producerSites.any { it.method == caller }) { "Missing request-base transform site" }
        val consumer = streamSwapConsumerFingerprint(caller.returnType).matchSingle().method
        check(consumer.implementation!!.registerCount <= 256) { "Playback response register exceeds 8 bits" }

        val wrapperMatch = streamSwapWrapperFingerprint(caller.returnType).matchSingle()
        val wrapper = wrapperMatch.classDef
        val constructor = wrapperMatch.method
        val types = constructor.parameterTypes.map(CharSequence::toString)
        val proto = types[0]
        val streaming = mutableClassDefBy(types[3])
        fun field(type: String) = wrapper.fields.single {
            it.type == type && !AccessFlags.STATIC.isSet(it.accessFlags)
        }
        val instant = field(types[1])
        val timestamp = field("J")
        val streams = field(streaming.type)
        val metadata = field(types[4])
        // 9.40 has another lazy boolean; the constructor-assigned request flag is the one to retain.
        val flag = constructor.implementation!!.instructions.mapNotNull {
            if (it.opcode == Opcode.IPUT_BOOLEAN) it.getReference<FieldReference>() else null
        }.distinct().single()
        val serialize = wrapper.methods.single { method ->
            method.parameterTypes.isEmpty() && method.returnType == "[B" &&
                method.implementation?.instructions?.any {
                    it.getReference<MethodReference>()?.name == "toByteArray"
                } == true
        }
        val protoClass = mutableClassDefBy(proto)
        val defaultProto = protoClass.fields.single { it.type == proto && AccessFlags.STATIC.isSet(it.accessFlags) }
        val streamingProto = protoClass.fields.single { it.type == STREAMING_PROTO }
        val parserOwner = parseByteArrayMethodRef.get()!!.definingClass
        val parser = mutableClassDefBy(parserOwner).methods.single {
            it.name == "parseFrom" && it.parameterTypes == listOf(parserOwner, "[B", REGISTRY)
        }
        // Follow the wrapper's stock streaming factory to its online builder.
        // Reusing the streaming clone drops the playability-derived format list; a plain proto ctor drops O.
        val factory = wrapper.methods.single {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == streaming.type &&
                it.parameterTypes.size == 3 && it.parameterTypes[1] == proto && it.parameterTypes[2] == "J"
        }
        val factoryInstructions = factory.implementation!!.instructions.toList()
        val builderConstructor = factoryInstructions.mapNotNull {
            it.getReference<MethodReference>()
        }.single { it.name == "<init>" && it.parameterTypes == listOf(proto) }
        val builder = mutableClassDefBy(builderConstructor.definingClass)
        val offlineWrite = factoryInstructions.indices.single { index ->
            index > 0 && factoryInstructions[index].opcode == Opcode.IPUT_BOOLEAN &&
                factoryInstructions[index - 1].opcode == Opcode.IGET_BOOLEAN &&
                factoryInstructions[index].getReference<FieldReference>()?.definingClass == builder.type &&
                factoryInstructions[index - 1].getReference<FieldReference>()?.definingClass ==
                    factory.parameterTypes[0] &&
                (factoryInstructions[index] as TwoRegisterInstruction).registerA ==
                    (factoryInstructions[index - 1] as TwoRegisterInstruction).registerA
        }
        val offlineFlag = factoryInstructions[offlineWrite].getReference<FieldReference>()!!
        val setTimestamp = builder.methods.single { method ->
            method.parameterTypes == listOf("J") && method.returnType == "V" &&
                method.implementation?.instructions?.any {
                    it.getReference<MethodReference>()?.let { call ->
                        call.definingClass == "Ljava/lang/Long;" && call.name == "valueOf"
                    } == true
                } == true
        }
        val build = builder.methods.single { it.parameterTypes.isEmpty() && it.returnType == streaming.type }
        val (setNetwork, networkHolder) = builder.methods.mapNotNull { method ->
            if (AccessFlags.CONSTRUCTOR.isSet(method.accessFlags) || AccessFlags.STATIC.isSet(method.accessFlags) ||
                method.returnType != "V" || method.parameterTypes.size != 1 ||
                !method.parameterTypes[0].startsWith("L")) return@mapNotNull null
            val holders = method.implementation?.instructions?.mapNotNull {
                it.getReference<MethodReference>()
            }?.filter { call ->
                call.name == "<init>" && call.parameterTypes.size == 1 &&
                    builder.fields.any { it.type == call.definingClass }
            }?.map { mutableClassDefBy(it.definingClass) }?.filter { holder ->
                holder.fields.count { !AccessFlags.STATIC.isSet(it.accessFlags) } == 1 &&
                    streaming.fields.any { it.type == holder.type }
            } ?: emptyList()
            holders.singleOrNull()?.let { method to it }
        }.single()
        val network = streaming.fields.single { it.type == networkHolder.type }
        val networkValue = networkHolder.fields.single { !AccessFlags.STATIC.isSet(it.accessFlags) }
        val networkType = setNetwork.parameterTypes.single()

        wrapper.addDownloadsBridge("rvxVideoId", emptyList(), "Ljava/lang/String;", 2, """
            invoke-interface {p0}, $videoId
            move-result-object v0
            return-object v0
        """)
        wrapper.addDownloadsBridge("rvxBytes", emptyList(), "[B", 2, """
            invoke-virtual {p0}, $serialize
            move-result-object v0
            return-object v0
        """)
        wrapper.addDownloadsBridge("rvxWithBytes", listOf("[B", "Z"), "Ljava/lang/Object;", 13, """
            sget-object v0, $defaultProto
            invoke-static {}, $REGISTRY->getGeneratedRegistry()$REGISTRY
            move-result-object v1
            invoke-static {v0, p1, v1}, $parser
            move-result-object v3
            check-cast v3, $proto
            iget-object v4, v3, $streamingProto
            if-eqz v4, :unchanged
            new-instance v2, ${builder.type}
            invoke-direct {v2, v3}, $builderConstructor
            iput-boolean p2, v2, $offlineFlag
            iget-wide v0, p0, $timestamp
            invoke-virtual {v2, v0, v1}, $setTimestamp
            iget-object v6, p0, $streams
            if-eqz v6, :no_network_metadata
            iget-object v6, v6, $network
            if-eqz v6, :no_network_metadata
            iget-object v6, v6, $networkValue
            check-cast v6, $networkType
            invoke-virtual {v2, v6}, $setNetwork
            :no_network_metadata
            invoke-virtual {v2}, $build
            move-result-object v7
            new-instance v2, ${wrapper.type}
            iget-object v4, p0, $instant
            iget-wide v5, p0, $timestamp
            iget-object v8, p0, $metadata
            iget-boolean v9, p0, $flag
            invoke-direct/range {v2 .. v9}, $constructor
            return-object v2
            :unchanged
            return-object p0
        """)
        wrapper.interfaces.add(RESPONSE)
        producerSites.asReversed().forEach { site ->
            site.method.addInstructions(site.index, """
                invoke-static {v${site.result}}, $REQUEST
                move-result-object v${site.result}
                check-cast v${site.result}, ${caller.returnType}
            """)
        }
        consumer.addInstructions(0, """
            invoke-static/range {p1 .. p1}, $REQUEST
            move-result-object p1
            check-cast p1, ${caller.returnType}
        """)
        installGuard()
        installLocalSource()
        supported.returnEarly(true)
        printInfo("StreamSwap: response adapter installed ${wrapper.type}; producers=${producerSites.size}")
    } catch (ex: Exception) {
        printWarn("StreamSwap: hook unavailable; online playback unchanged: ${ex.message}")
    }
}

private data class StreamSwapProducerSite(
    val method: MutableMethod,
    val index: Int,
    val result: Int,
)

/** Include legacy callbacks/retries as well as the feature-flagged unified request base. */
private fun BytecodePatchContext.streamSwapProducerSites(transform: MethodReference): List<StreamSwapProducerSite> {
    val matches = mutableListOf<Triple<ClassDef, Method, Int>>()
    classDefForEach { owner ->
        owner.methods.forEach { method ->
            method.implementation?.instructions?.forEachIndexed { index, instruction ->
                val call = instruction.getReference<MethodReference>()
                if (instruction.opcode == Opcode.INVOKE_VIRTUAL && call != null &&
                    call.definingClass == transform.definingClass &&
                    call.name == transform.name && call.returnType == transform.returnType &&
                    call.parameterTypes == transform.parameterTypes) {
                    matches.add(Triple(owner, method, index))
                }
            }
        }
    }
    return matches.map { (owner, method, index) ->
        val mutable = mutableClassDefBy(owner).findMutableMethodOf(method)
        val instructions = mutable.implementation!!.instructions.toList()
        check(instructions[index + 1].opcode == Opcode.MOVE_RESULT_OBJECT)
        val result = (instructions[index + 1] as OneRegisterInstruction).registerA
        check(result < 16) { "Producer response register exceeds invoke range" }
        StreamSwapProducerSite(mutable, index + 2, result)
    }
}
