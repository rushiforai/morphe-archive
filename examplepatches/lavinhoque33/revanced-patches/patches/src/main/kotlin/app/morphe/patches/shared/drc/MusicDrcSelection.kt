/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-23.
 */
package app.morphe.patches.shared.drc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.Utils.printInfo
import app.morphe.util.Utils.printWarn
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val EXTENSION = "Lapp/morphe/extension/music/patches/MusicDrcSelection;"
private const val FORMAT_BRIDGE = "Lapp/morphe/extension/music/patches/MusicDrcSelection\$Format;"
private const val LIST = "Ljava/util/List;"
private const val STRING = "Ljava/lang/String;"
private const val URI = "Landroid/net/Uri;"
private const val REQUEST = "Lcom/google/android/libraries/youtube/media/interfaces/PlaybackAgnosticUserPreferences;"
private const val ABR_STATE = "Lcom/google/android/apps/youtube/proto/ClientAbrStateOuterClass\$ClientAbrState;"

private data class Model(
    val type: String,
    val drcAccessor: String,
    val proto: String,
    val drcField: String,
    val trackAccessor: String,
)
private data class Filters(val type: String, val name: String, val gate: String, val predicate: String)
private data class Chunk(val type: String, val name: String, val uriBuilder: String)
private data class Media(val capabilityBuilder: String, val abrBuilder: String, val abrPreference: String)
private data class MusicDrcAbi(val model: Model, val selector: Filters, val chunk: Chunk, val media: Media)

// The format accessors below produce the same DRC variant bit the stock player uses for track selection.
private val musicDrcAbis = mapOf(
    "9.45.51" to MusicDrcAbi(Model("Lwhg;", "P", "Lalhj;", "L", "v"),
        Filters("Lyou;", "k", "Lzjm;->fn()Z", "Lyon;"), Chunk("Lzbe;", "i", "ap"),
        Media("Lzbo;", "Lzea;", "Lyos;->c()Z")),
    "9.40.51" to MusicDrcAbi(Model("Lwbv;", "Q", "Lakwg;", "L", "w"),
        Filters("Lyjx;", "a", "Lzfs;->eC()Z", "Lyjq;"), Chunk("Lyxr;", "i", "aq"),
        Media("Lyyb;", "Lzam;", "Lyjv;->c()Z")),
    "9.15.51" to MusicDrcAbi(Model("Laozl;", "P", "Lbqoz;", "L", "v"),
        Filters("Latoi;", "b", "Lauwk;->ai()Z", "Latoc;"), Chunk("Laumu;", "e", "p"),
        Media("Launf;", "Laurh;", "Latob;->d()Z")),
    "8.30.54" to MusicDrcAbi(Model("Lamsp;", "P", "Lblvt;", "K", "v"),
        Filters("Laqmi;", "b", "Larxu;->af()Z", "Laqmc;"), Chunk("Larjl;", "e", "p"),
        Media("Larpc;", "Lartg;", "Laqmb;->d()Z")),
    "8.28.54" to MusicDrcAbi(Model("Lammg;", "P", "Lblgz;", "K", "v"),
        Filters("Laqfa;", "b", "Larqi;->af()Z", "Laqeu;"), Chunk("Larcb;", "e", "p"),
        Media("Larhq;", "Larlu;", "Laqet;->d()Z")),
    "8.12.54" to MusicDrcAbi(Model("Lakqc;", "L", "Lbixg;", "K", "u"),
        Filters("Laohe;", "b", "Laprd;->W()Z", "Laogy;"), Chunk("Lapcv;", "e", "p"),
        Media("Lapim;", "Lapmq;", "Laogx;->e:Z")),
)

/** Resolve and validate the complete Music-only path before changing any instructions. */
internal fun BytecodePatchContext.installMusicDrcSelection(): Boolean {
    val version = packageMetadata.versionName
    val abi = musicDrcAbis[version]
    if (abi == null) {
        printWarn("Prefer original audio stream: no verified audio selector for YouTube Music $version; skipped.")
        return false
    }

    val hooks = try {
        listOf(
            prepareFormatBridge(abi.model),
            prepareCandidateFilter(abi),
            prepareMediaRequest(),
            prepareAbrRequest(abi.media),
            prepareSabrCapability(abi),
            prepareReaderTrace(abi),
        )
    } catch (ex: Exception) {
        printWarn("Prefer original audio stream: stock DRC path changed on YouTube Music $version; skipped: ${ex.message}")
        return false
    }
    hooks.forEach { it() }
    printInfo("Prefer original audio stream: ${abi.selector.type}->${abi.selector.name}, " +
        "${abi.model.type}->${abi.model.drcAccessor}()Z, request/ABR, SABR capability and plain chunk source hooked.")
    return true
}

private fun BytecodePatchContext.prepareFormatBridge(abi: Model): () -> Unit {
    val model = mutableClassDefBy(abi.type)
    val drc = model.methods.single { it.name == abi.drcAccessor && it.parameterTypes.isEmpty() && it.returnType == "Z" }
    check(modelGetter(drc, abi, abi.drcField, "Z")) { "DRC accessor does not read the expected format protobuf bit" }
    val mime = model.methods.single { modelGetter(it, abi, "g", STRING) }
    val track = model.methods.single {
        it.name == abi.trackAccessor && it.returnType == STRING && it.parameterTypes.isEmpty() &&
            AccessFlags.PUBLIC.isSet(it.accessFlags)
    }
    val trackCode = track.implementation!!.instructions
    val trackProto = trackCode[1].getReference<FieldReference>()
    check(trackCode[0].getReference<FieldReference>()?.toString() == "${abi.type}->b:${abi.proto}" &&
        trackProto?.definingClass == abi.proto && trackProto.name == "y" &&
        trackCode[4].getReference<FieldReference>()?.toString() == "${trackProto.type}->d:$STRING" &&
        trackCode.last().opcode == Opcode.RETURN_OBJECT) { "stock audio track identity accessor changed" }

    return {
        model.interfaces.add(FORMAT_BRIDGE)
        model.addDrcFormatGetter("rvxIsDrc", drc)
        model.addDrcFormatGetter("rvxMimeType", mime)
        model.addDrcFormatGetter("rvxAudioTrackId", track)
    }
}

private fun modelGetter(method: MutableMethod, abi: Model, name: String, fieldType: String): Boolean {
    if (method.returnType != fieldType || method.parameterTypes.isNotEmpty() ||
        !AccessFlags.PUBLIC.isSet(method.accessFlags)) return false
    val code = method.implementation?.instructions ?: return false
    if (code.map { it.opcode } != listOf(Opcode.IGET_OBJECT,
            if (fieldType == "Z") Opcode.IGET_BOOLEAN else Opcode.IGET_OBJECT,
            if (fieldType == "Z") Opcode.RETURN else Opcode.RETURN_OBJECT)) return false

    val model = code[0] as TwoRegisterInstruction
    val result = code[1] as TwoRegisterInstruction
    return model.getReference<FieldReference>()?.toString() == "${abi.type}->b:${abi.proto}" &&
        result.getReference<FieldReference>()?.toString() == "${abi.proto}->$name:$fieldType" &&
        model.registerB == method.implementation!!.registerCount - 1 && result.registerB == model.registerA &&
        (code[2] as OneRegisterInstruction).registerA == result.registerA
}

private fun MutableClass.addDrcFormatGetter(name: String, getter: MethodReference) {
    val suffix = if (getter.returnType == "Z") "" else "-object"
    methods.add(ImmutableMethod(type, name, emptyList(), getter.returnType,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, MutableMethodImplementation(2))
        .toMutable().apply {
            addInstructions(0, """
                invoke-virtual {p0}, $getter
                move-result$suffix v0
                return$suffix v0
            """)
        })
}

private fun BytecodePatchContext.prepareCandidateFilter(abi: MusicDrcAbi): () -> Unit {
    val selector = mutableClassDefBy(abi.selector.type)
    val bit = "${abi.model.type}->${abi.model.drcAccessor}()Z"
    val filter = selector.methods.single { method -> method.name == abi.selector.name &&
        method.implementation?.instructions?.any { it.getReference<MethodReference>()?.toString() == bit } == true }
    val code = filter.implementation!!.instructions
    val gate = code.indices.single { code[it].getReference<MethodReference>()?.toString() == abi.selector.gate }
    val result = code[gate + 1] as OneRegisterInstruction
    val branch = code[gate + 2 + if (abi.selector.type == "Lyjx;") 1 else 0] as BuilderOffsetInstruction
    check(result.opcode == Opcode.MOVE_RESULT && branch.opcode == Opcode.IF_EQZ &&
        (branch as OneRegisterInstruction).registerA == result.registerA) { "stock DRC filter guard changed" }

    val removeIndex = branch.target.location.index - 1
    val remove = code[removeIndex] as FiveRegisterInstruction
    val removeCall = remove.getReference<MethodReference>()
    check(remove.opcode == Opcode.INVOKE_STATIC && removeCall?.name == "removeIf" &&
        removeCall.parameterTypes == listOf("Ljava/util/Collection;", "Ljava/util/function/Predicate;") &&
        code[removeIndex - 1].getReference<MethodReference>()?.let {
            it.definingClass == abi.selector.predicate && it.name == "<init>" && it.parameterTypes.first() == "Z"
        } == true && removeIndex > gate) { "stock DRC filter no longer uses the expected predicate" }

    val list = remove.registerC
    val stockEnabled = result.registerA
    if (filter.parameterTypes != listOf(LIST, "Z", "I")) {
        return {
            filter.addInstructions(gate + 2, """
                invoke-static {v$list, v$stockEnabled}, $EXTENSION->useStockFilter(${LIST}Z)Z
                move-result v$stockEnabled
            """)
        }
    }

    // 9.45 has one filter before the experimental eligibility pass and one after it. Skip stock filtering
    // in both branches, then apply the preference to the final eligible list at their common continuation.
    val caller = selector.methods.single { method -> method.implementation?.instructions?.any {
        it.getReference<MethodReference>() == filter
    } == true }
    val callerCode = caller.implementation!!.instructions
    val calls = callerCode.indices.filter { callerCode[it].getReference<MethodReference>() == filter }
    check(calls.size == 2 && list == filter.implementation!!.registerCount - 3)
    val join = calls.last() + 1
    val finalList = (callerCode[calls.last()] as FiveRegisterInstruction).registerD
    val jumpsToJoin = callerCode.subList(calls.first() + 1, calls.last()).filterIsInstance<BuilderOffsetInstruction>()
    check(finalList == (callerCode[calls.first()] as FiveRegisterInstruction).registerD &&
        jumpsToJoin.any { it.opcode == Opcode.GOTO && it.target.location.index == join }) {
        "expanded selector branches no longer join with the same audio list"
    }

    return {
        filter.addInstructions(gate + 2, """
            invoke-static {v$stockEnabled}, $EXTENSION->useStockDrcGate(Z)Z
            move-result v$stockEnabled
        """)
        caller.addInstructionsAtControlFlowLabel(join,
            "invoke-static {v$finalList}, $EXTENSION->selectEligibleFormats($LIST)V")
    }
}

private fun BytecodePatchContext.prepareMediaRequest(): () -> Unit {
    val request = mutableClassDefBy(REQUEST)
    val constructor = request.methods.single { it.name == "<init>" && it.parameterTypes.take(2) == listOf("Z", STRING) }
    val code = constructor.implementation!!.instructions
    val index = code.indices.single {
        code[it].opcode == Opcode.IPUT_BOOLEAN &&
            code[it].getReference<FieldReference>()?.toString() == "$REQUEST->isDrcEnabled:Z"
    }
    val store = code[index] as TwoRegisterInstruction
    val receiver = constructor.implementation!!.registerCount - constructor.parameterTypes.size - 1
    check(store.registerA == receiver + 1 && store.registerB == receiver && index > 0 &&
        code[0].getReference<MethodReference>()?.toString() == "Ljava/lang/Object;-><init>()V") {
        "request preference no longer stores its first argument as isDrcEnabled"
    }

    return {
        constructor.addInstructions(index, """
            invoke-static {p1}, $EXTENSION->requestDrc(Z)Z
            move-result p1
        """)
    }
}

/** The shared native preference getter also feeds normalization; change only this ABR consumer. */
private fun BytecodePatchContext.prepareAbrRequest(abi: Media): () -> Unit {
    val builder = mutableClassDefBy(abi.abrBuilder).methods.single { method ->
        method.implementation?.instructions?.any {
            it.getReference<MethodReference>()?.toString() == abi.abrPreference ||
                it.getReference<FieldReference>()?.toString() == abi.abrPreference
        } == true
    }
    val code = builder.implementation!!.instructions
    val preference = code.indices.single {
        code[it].getReference<MethodReference>()?.toString() == abi.abrPreference ||
            code[it].getReference<FieldReference>()?.toString() == abi.abrPreference
    }
    val result = when (code[preference].opcode) {
        Opcode.IGET_BOOLEAN -> preference
        Opcode.INVOKE_VIRTUAL -> (preference + 1).also { check(code[it].opcode == Opcode.MOVE_RESULT) }
        else -> error("ABR DRC preference is not a boolean read")
    }
    val register = (code[result] as OneRegisterInstruction).registerA
    val branch = code[result + 1] as BuilderOffsetInstruction
    check(branch.opcode == Opcode.IF_EQZ && (branch as OneRegisterInstruction).registerA == register &&
        code.subList(result + 2, branch.target.location.index).any {
            it.opcode == Opcode.IPUT_BOOLEAN && it.getReference<FieldReference>()?.let { field ->
                field.definingClass == ABR_STATE && field.name in setOf("D", "E")
            } == true
        }) { "ABR preference is not the native DRC request flag" }

    return {
        builder.addInstructions(result + 1, """
            invoke-static {v$register}, $EXTENSION->requestDrc(Z)Z
            move-result v$register
        """)
    }
}

/** SABR's audio capability tag must agree with the compatible format, including a DRC-only fallback. */
private fun BytecodePatchContext.prepareSabrCapability(abi: MusicDrcAbi): () -> Unit {
    val method = mutableClassDefBy(abi.media.capabilityBuilder).methods.single { method ->
        method.parameterTypes.isEmpty() && method.implementation?.instructions?.any {
            it.getReference<StringReference>()?.string == "drc"
        } == true
    }
    val code = method.implementation!!.instructions
    val compatible = code.first() as FiveRegisterInstruction
    val compatibleCall = compatible.getReference<MethodReference>()
    check(compatible.opcode == Opcode.INVOKE_VIRTUAL && compatible.registerCount == 1 &&
        compatibleCall?.definingClass == method.definingClass && compatibleCall.returnType == abi.model.type &&
        compatibleCall.parameterTypes.isEmpty()) { "SABR capability no longer starts with its compatible format" }

    val tag = code.indices.single { code[it].getReference<StringReference>()?.string == "drc" }
    val branch = code[tag - 2] as OneRegisterInstruction
    val boolRegister = branch.registerA
    check(branch.opcode == Opcode.IF_EQZ && code[tag - 1].opcode == Opcode.NEW_INSTANCE)

    // The sorted, checked audio format list is already eligible here. This only serializes the selected variant.
    val listAllocation = (tag - 3 downTo 0).first {
        code[it].opcode == Opcode.NEW_INSTANCE &&
            (code[it] as com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                .reference.toString() == "Ljava/util/ArrayList;"
    }
    val scratch = (code[listAllocation] as OneRegisterInstruction).registerA
    val previous = code[listAllocation - 1] as OneRegisterInstruction
    check(previous.registerA == boolRegister && previous.opcode in setOf(Opcode.IGET_BOOLEAN, Opcode.MOVE_RESULT) &&
        scratch != boolRegister && scratch != compatible.registerC) { "SABR audio DRC tag producer changed" }

    return {
        method.addInstructions(listAllocation, """
            invoke-virtual {p0}, $compatibleCall
            move-result-object v$scratch
            invoke-static {v$boolRegister, v$scratch}, $EXTENSION->capabilityDrc(Z$FORMAT_BRIDGE)Z
            move-result v$boolRegister
        """)
    }
}

private fun BytecodePatchContext.prepareReaderTrace(abi: MusicDrcAbi): () -> Unit {
    val chunk = mutableClassDefBy(abi.chunk.type).methods.single {
        it.name == abi.chunk.name && it.returnType == "V" && it.parameterTypes.size == 4 &&
            it.parameterTypes[1] == "J" && it.parameterTypes[2] == LIST
    }
    val code = chunk.implementation!!.instructions
    val index = code.indices.single { position -> code[position].getReference<MethodReference>()?.let {
        it.definingClass == abi.model.type && it.name == abi.chunk.uriBuilder && it.parameterTypes.isEmpty()
    } == true }
    val buildUri = code[index] as FiveRegisterInstruction
    val builder = buildUri.getReference<MethodReference>()!!
    val nonce = code[index + 3] as FiveRegisterInstruction
    val writeNonce = nonce.getReference<MethodReference>()!!
    val nonceMethod = mutableClassDefBy(builder.returnType).methods.single { it == writeNonce }
    val builderResult = code[index + 1] as OneRegisterInstruction
    val nonceField = code[index + 2] as TwoRegisterInstruction
    check(buildUri.opcode == Opcode.INVOKE_VIRTUAL && buildUri.registerCount == 1 &&
        builderResult.opcode == Opcode.MOVE_RESULT_OBJECT && nonceField.opcode == Opcode.IGET_OBJECT &&
        nonceField.getReference<FieldReference>()?.type == STRING && nonce.registerCount == 2 &&
        nonce.registerC == builderResult.registerA && nonce.registerD == nonceField.registerA &&
        nonceMethod.implementation!!.instructions.any { it.getReference<StringReference>()?.string == "cpn" } &&
        code.drop(index + 4).any { it.getReference<MethodReference>()?.let { call ->
            call.definingClass == builder.returnType && call.returnType == URI
        } == true }) { "plain playback chunk no longer builds the request from the selected audio model" }

    return {
        chunk.addInstructionsAtControlFlowLabel(index,
            "invoke-static {v${buildUri.registerC}}, $EXTENSION->traceReaderFormat($FORMAT_BRIDGE)V")
    }
}
