/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-12.
 * Modified by lavinhoque33, 2026-11-13.
 */

package app.morphe.patches.music.interaction.crossfade

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.string
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val PCM_ADAPTER =
    "Lapp/morphe/extension/music/patches/crossfade/PcmAudioProcessorAdapter;"
internal const val PCM_BRIDGE = "Lapp/morphe/extension/music/patches/crossfade/PcmFadeBridge;"
private const val BYTE_BUFFER = "Ljava/nio/ByteBuffer;"
private const val PLAYER = "Landroidx/media3/exoplayer/ExoPlayer;"



internal data class PcmNativeAbi(
    val processorType: String,
    val formatType: String,
    val sampleRate: FieldReference,
    val channelCount: FieldReference,
    val encoding: FieldReference,
    val notSet: FieldReference,
)

internal data class PcmDiscovery(
    val abi: PcmNativeAbi,
    val adapter: ClassDef,
    val chainConstructor: Method,
    val chainSizeIndex: Int,
    val chainSize: TwoRegisterInstruction,
    val chainFinalStoreIndex: Int,
    val chainArrayRegister: Int,
    val factory: Method,
    val sinkConfigure: Method,
    val sinkFormatRegister: Int,
    val sampleMime: FieldReference,
    val sinkChain: FieldReference,
    val chainArray: FieldReference,
    val rendererBranchCount: Int,
    val sinkPosition: Method,
    val sinkFlush: Method,
    val outputHolder: FieldReference,
    val nativeTrack: FieldReference,
)

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Method.hasSignature(name: String, parameters: List<String>, result: String) =
    this.name == name && parameterTypes.map { it.toString() } == parameters && returnType == result

private fun ClassDef.isPcmProcessor(): Boolean {
    if (!AccessFlags.INTERFACE.isSet(accessFlags)) return false

    val methods = this.methods.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && !AccessFlags.PRIVATE.isSet(it.accessFlags)
            && !AccessFlags.CONSTRUCTOR.isSet(it.accessFlags)
    }
    val configure = methods.singleOrNull {
        it.name == "b" && it.parameterTypes.size == 1 && it.returnType == it.parameterTypes[0].toString()
    } ?: return false
    val signatures = listOf(
        Triple("a", listOf("J"), "J"),
        Triple("b", listOf(configure.returnType), configure.returnType),
        Triple("c", emptyList(), BYTE_BUFFER),
        Triple("d", emptyList(), "V"),
        Triple("e", emptyList(), "V"),
        Triple("f", listOf(BYTE_BUFFER), "V"),
        Triple("g", emptyList(), "V"),
        Triple("h", emptyList(), "Z"),
        Triple("i", emptyList(), "Z"),
        Triple("j", emptyList(), "V"),
    )
    return methods.size == signatures.size && signatures.all { (name, parameters, result) ->
        methods.any { it.hasSignature(name, parameters, result) }
    }
}

private fun BytecodePatchContext.implementsProcessor(type: String, processorType: String): Boolean {
    var current: String? = type
    while (current != null && current != "Ljava/lang/Object;") {
        val classDef = classDefBy(current)
        if (processorType in classDef.interfaces) return true
        current = classDef.superclass
    }
    return false
}

private fun BytecodePatchContext.discoverAbi(processor: ClassDef): PcmNativeAbi {
    val formatType = processor.methods.single { it.name == "b" }.returnType
    val format = classDefBy(formatType)
    val constructor = format.methods.single { it.hasSignature("<init>", listOf("I", "I", "I"), "V") }
    val parameterStart = constructor.implementation!!.registerCount - 3
    val fields = (0..2).map { parameter ->
        constructor.code().firstNotNullOfOrNull { instruction ->
            if (instruction.opcode != Opcode.IPUT) return@firstNotNullOfOrNull null
            val registers = instruction as TwoRegisterInstruction
            instruction.getReference<FieldReference>()?.takeIf {
                registers.registerA == parameterStart + parameter &&
                    registers.registerB == parameterStart - 1 && it.definingClass == formatType && it.type == "I"
            }
        } ?: error("PCM format constructor does not expose parameter ${parameter + 1}")
    }
    check(fields.distinct().size == 3) { "PCM format fields overlap" }
    val notSet = format.fields.single { AccessFlags.STATIC.isSet(it.accessFlags) && it.type == formatType }
    return PcmNativeAbi(processor.type, formatType, fields[0], fields[1], fields[2], notSet)
}

private fun BytecodePatchContext.requireBridge() {
    val bridge = classDefBy(PCM_BRIDGE)
    val state = "Ljava/lang/Object;"
    val signatures = listOf(
        Triple("create", emptyList(), state),
        Triple("configure", listOf(state, "I", "I", "I"), "Z"),
        Triple("queueInput", listOf(state, BYTE_BUFFER), "V"),
        Triple("getOutput", listOf(state), BYTE_BUFFER),
        Triple("isActive", listOf(state), "Z"),
        Triple("queueEndOfStream", listOf(state), "V"),
        Triple("isEnded", listOf(state), "Z"),
        Triple("flush", listOf(state), "V"),
        Triple("reset", listOf(state), "V"),
        Triple("beginPlayer", emptyList(), "V"),
        Triple("endPlayer", listOf(state), "V"),
        Triple("cancelPlayer", emptyList(), "V"),
        Triple("sinkConfigured", listOf(state, state, "Ljava/lang/String;"), "V"),
        Triple("sinkFlushed", listOf(state), "V"),
        Triple("beginPlayed", listOf(state, state, state), "J"),
        Triple("played", listOf(state, state, "I", "J"), "V"),
    )
    signatures.forEach { (name, parameters, result) ->
        check(bridge.methods.any {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.hasSignature(name, parameters, result)
        }) { "PCM bridge method missing: $name" }
    }
}

/**
 * A parameter's original register can be reused after its last native read. Retain the source reference
 * on every path to a successful exit; throwing-only paths may reuse it, as Music 9.15 does.
 */
internal fun Method.requireStableReferenceAtReturns(sourceIndex: Int): Int {
    val code = code()
    val source = code[sourceIndex]
    check(source.opcode == Opcode.IGET_OBJECT) { "PCM source format is not an object field read" }
    val register = (source as OneRegisterInstruction).registerA
    val tryBlocks = implementation!!.tryBlocks
    val addresses = IntArray(code.size)
    var codeAddress = 0
    code.forEachIndexed { index, instruction ->
        addresses[index] = codeAddress
        codeAddress += instruction.codeUnits
    }
    val indexByAddress = addresses.withIndex().associate { it.value to it.index }
    val predecessors = Array(code.size) { mutableSetOf<Int>() }
    fun edge(from: Int, address: Int) {
        val target = indexByAddress[address] ?: error("PCM sink branch has no instruction at $address")
        predecessors[target].add(from)
    }
    code.forEachIndexed { index, instruction ->
        if (instruction.opcode.canContinue() && index + 1 < code.size) {
            predecessors[index + 1].add(index)
        }
        if (instruction is OffsetInstruction) {
            when (instruction.opcode) {
                Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH -> {
                    val payload = code[indexByAddress.getValue(addresses[index] + instruction.codeOffset)]
                        as SwitchPayload
                    payload.switchElements.forEach { edge(index, addresses[index] + it.offset) }
                }
                Opcode.FILL_ARRAY_DATA -> Unit
                else -> edge(index, addresses[index] + instruction.codeOffset)
            }
        }
        tryBlocks.forEach { block ->
            if (addresses[index] >= block.startCodeAddress &&
                addresses[index] < block.startCodeAddress + block.codeUnitCount
            ) {
                block.exceptionHandlers.forEach { edge(index, it.handlerCodeAddress) }
            }
        }
    }
    val reachesReturn = BooleanArray(code.size)
    val pending = ArrayDeque<Int>()
    code.indices.forEach {
        if (code[it].opcode == Opcode.RETURN_VOID) {
            reachesReturn[it] = true
            pending.addLast(it)
        }
    }
    while (pending.isNotEmpty()) {
        predecessors[pending.removeFirst()].forEach {
            if (!reachesReturn[it]) {
                reachesReturn[it] = true
                pending.addLast(it)
            }
        }
    }
    check(code.withIndex().none { (index, instruction) ->
        if (index <= sourceIndex || !reachesReturn[index] || !instruction.opcode.setsRegister()) false
        else {
            val destination = (instruction as OneRegisterInstruction).registerA
            destination == register || instruction.opcode.setsWideRegister() && destination + 1 == register
        }
    }) { "PCM source format register is reused by native code" }

    val sourceAddress = addresses[sourceIndex]
    var address = 0
    code.take(sourceIndex).forEach { instruction ->
        check(instruction.opcode != Opcode.RETURN_VOID) { "PCM sink returns before reading the source format" }
        check(instruction.opcode != Opcode.PACKED_SWITCH && instruction.opcode != Opcode.SPARSE_SWITCH) {
            "PCM source format has an unverified switch predecessor"
        }
        if (instruction is OffsetInstruction && instruction.opcode != Opcode.FILL_ARRAY_DATA) {
            check(address + instruction.codeOffset <= sourceAddress) {
                "PCM sink can bypass the source format read"
            }
        }
        address += instruction.codeUnits
    }
    check(tryBlocks.none { block ->
        block.startCodeAddress < sourceAddress &&
            block.exceptionHandlers.any { it.handlerCodeAddress > sourceAddress }
    }) { "PCM sink can catch an exception before reading the source format" }
    return register
}

internal fun BytecodePatchContext.discoverPcmCrossfade(): PcmDiscovery {
    requireBridge()
    val adapter = classDefBy(PCM_ADAPTER)
    check(adapter.interfaces.isEmpty()) { "PCM adapter already implements an interface" }
    check(adapter.fields.any { it.name == "state" && it.type == "Ljava/lang/Object;" }) {
        "PCM adapter state field missing"
    }
    check(adapter.methods.all { it.name == "<init>" }) { "PCM adapter is not an unmodified shell" }
    check(adapter.methods.single().hasSignature("<init>", emptyList(), "V")) {
        "PCM adapter constructor missing"
    }

    val processors = mutableListOf<ClassDef>()
    classDefForEach { if (it.isPcmProcessor()) processors.add(it) }
    val processor = processors.single()
    val abi = discoverAbi(processor)
    val nativeArray = "[${processor.type}"
    val chainCandidates = mutableListOf<Method>()
    classDefForEach { classDef ->
        // Partitioned member views are cached snapshots in Patcher 2.1. Reading them here on
        // every class would hide helpers subsequently added by unrelated patches (for example DRC).
        classDef.methods.filterTo(chainCandidates) { method ->
            method.name == "<init>" && method.parameterTypes.size == 3 &&
                method.parameterTypes[0].toString() == nativeArray &&
                method.parameterTypes.drop(1).all { type ->
                    implementsProcessor(type.toString(), processor.type)
                }
        }
    }
    val chain = chainCandidates.single()
    val chainCode = chain.code()
    val allocationIndex = chainCode.indices.single {
        chainCode[it].opcode == Opcode.NEW_ARRAY &&
            chainCode[it].getReference<TypeReference>()?.type == nativeArray
    }
    val allocation = chainCode[allocationIndex] as TwoRegisterInstruction
    val sizeIndex = allocationIndex - 1
    val size = chainCode[sizeIndex] as TwoRegisterInstruction
    check(chainCode[sizeIndex].opcode == Opcode.ADD_INT_LIT8 &&
        (size as NarrowLiteralInstruction).narrowLiteral == 2 && size.registerA == allocation.registerB
    ) { "PCM chain does not reserve exactly silence/speed slots" }
    val stores = chainCode.withIndex().filter { it.value.opcode == Opcode.APUT_OBJECT }
    val parameterStart = chain.implementation!!.registerCount - 3
    val inputLength = chainCode[sizeIndex - 1] as TwoRegisterInstruction
    check(chainCode[sizeIndex - 1].opcode == Opcode.ARRAY_LENGTH &&
        inputLength.registerA == size.registerB && inputLength.registerB == parameterStart
    ) { "PCM chain size does not follow the custom processor array length" }
    check(stores.size == 2 && stores.map { (it.value as ThreeRegisterInstruction).registerA } ==
        listOf(parameterStart + 1, parameterStart + 2)
    ) { "PCM chain builtin ordering changed" }
    check(stores.all { (it.value as ThreeRegisterInstruction).registerB == allocation.registerA }) {
        "PCM chain builtins use another array"
    }
    check(chainCode.last().opcode == Opcode.RETURN_VOID && stores.last().index == chainCode.lastIndex - 1) {
        "PCM chain has instructions after speed insertion"
    }
    check(allocation.registerA <= 15) { "PCM chain array register cannot be passed to adapter" }

    val rendererMethods = mutableListOf<Pair<Method, Int>>()
    classDefForEach { owner ->
        owner.methods.filter {
            it.parameterTypes.firstOrNull()?.toString() == "Landroid/os/Handler;" && it.returnType.startsWith("[")
        }.forEach { method ->
            val count = method.code().count {
                it.getReference<MethodReference>()?.toString() == chain.toString()
            }
            if (count > 0) rendererMethods.add(method to count)
        }
    }
    check(rendererMethods.size == 1) {
        "PCM chain must have one renderer-factory owner, found ${rendererMethods.map { it.first }}"
    }
    val (renderer, branchCount) = rendererMethods.single()
    val coordinator = classDefBy(renderer.definingClass)
    check(renderer.parameterTypes.firstOrNull()?.toString() == "Landroid/os/Handler;" &&
        renderer.returnType.startsWith("[")
    ) { "PCM renderer factory signature changed" }

    val factory = Fingerprint(
        returnType = PLAYER,
        custom = { method, _ ->
            !AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 3 &&
                method.parameterTypes[0].toString() == coordinator.type && method.parameterTypes[2].toString() == "I"
        },
    ).method
    check(factory.code().any { it.opcode == Opcode.RETURN_OBJECT }) { "PCM player factory has no return" }
    check(factory.code().none { it.opcode == Opcode.RETURN || it.opcode == Opcode.RETURN_VOID }) {
        "PCM player factory has a non-player return"
    }

    val sink = Fingerprint(
        returnType = "V",
        strings = listOf("audio/raw"),
        custom = { method, classDef ->
            method.parameterTypes.size == 1 && classDef.fields.any { it.type == chain.definingClass }
        },
    ).method
    val sinkCode = sink.code()
    check(sink.implementation!!.registerCount - 2 >= 2) { "PCM sink has no diagnostic scratch registers" }
    val rawIndex = sinkCode.indices.single {
        sinkCode[it].getReference<StringReference>()?.string == "audio/raw"
    }
    val mime = sinkCode.drop(rawIndex + 1).firstNotNullOf {
        it.getReference<FieldReference>()?.takeIf { field -> field.type == "Ljava/lang/String;" }
    }
    val configParameter = sink.implementation!!.registerCount - 1
    val formatIndex = sinkCode.take(rawIndex).indexOfFirst { instruction ->
        instruction.getReference<FieldReference>()?.let {
            instruction.opcode == Opcode.IGET_OBJECT && it.type == mime.definingClass &&
                (instruction as TwoRegisterInstruction).registerB == configParameter
        } == true
    }
    check(formatIndex >= 0) { "PCM source format read was not found" }
    val formatRegister = sink.requireStableReferenceAtReturns(formatIndex)
    val sinkChain = sinkCode.firstNotNullOf { instruction ->
        instruction.getReference<FieldReference>()?.takeIf {
            instruction.opcode == Opcode.IGET_OBJECT && it.definingClass == sink.definingClass &&
                it.type == chain.definingClass
        }
    }
    val chainArray = sinkCode.firstNotNullOf { instruction ->
        instruction.getReference<FieldReference>()?.takeIf {
            instruction.opcode == Opcode.IGET_OBJECT && it.definingClass == chain.definingClass &&
                (it.type == nativeArray || it.type == "Ljava/lang/Object;")
        }
    }

    val sinkClass = classDefBy(sink.definingClass)
    val position = sinkClass.methods.single {
        it.parameterTypes.map { type -> type.toString() } == listOf("Z") && it.returnType == "J"
    }
    val holderCandidates = position.code().mapNotNull { it.getReference<FieldReference>() }
        .filter { it.definingClass == sink.definingClass && it.type.startsWith("L") }.distinctBy { it.toString() }
    val trackReferences = sinkClass.methods.flatMap { it.code() }
        .mapNotNull { it.getReference<FieldReference>() }.filter { it.type == "Landroid/media/AudioTrack;" }
        .distinctBy { it.toString() }
    val holderTracks = holderCandidates.flatMap { holder ->
        trackReferences.filter { track ->
            val owner = classDefBy(track.definingClass)
            holder.type == owner.type || holder.type in owner.interfaces
        }.map { holder to it }
    }
    val (outputHolder, nativeTrack) = holderTracks.single()
    val flush = sinkClass.methods.single { method ->
        method.returnType == "V" && method.parameterTypes.isEmpty() &&
            method.code().count {
                it.opcode == Opcode.IPUT_WIDE &&
                    it.getReference<FieldReference>()?.definingClass == sink.definingClass
            } >= 4 &&
            method.code().any {
                it.getReference<MethodReference>()?.toString() == "Landroid/media/AudioTrack;->pause()V"
            }
    }
    check(flush.implementation!!.registerCount - 1 >= 2) {
        "PCM telemetry boundaries lack scratch registers"
    }
    check(sink.implementation!!.registerCount - 2 >= 3) { "PCM negotiation lacks scratch registers" }
    return PcmDiscovery(
        abi, adapter, chain, sizeIndex, size, stores.last().index, allocation.registerA,
        factory, sink, formatRegister, mime, sinkChain, chainArray, branchCount,
        position, flush, outputHolder, nativeTrack,
    )
}
