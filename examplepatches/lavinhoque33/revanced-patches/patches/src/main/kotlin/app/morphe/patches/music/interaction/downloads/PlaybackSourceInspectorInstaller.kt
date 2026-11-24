/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-23.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.Utils.printInfo
import app.morphe.util.Utils.printWarn
import app.morphe.util.fingerprint.matchSingle
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField

private const val INSPECTOR = "Lapp/morphe/extension/music/patches/downloads/PlaybackSourceInspector"
private const val INSPECTOR_CLASS = "$INSPECTOR;"
private const val PLAYBACK = "$INSPECTOR\$Playback;"
private const val EVENT_PLAYBACK = "$INSPECTOR\$EventPlayback;"
private const val LOCAL_FORMAT = "$INSPECTOR\$LocalFormat;"
private const val READ = "$INSPECTOR\$Read;"
private const val SWAP_SOURCE = "Lapp/morphe/extension/music/patches/downloads/StreamSwapDataSource;"
private const val URI = "Landroid/net/Uri;"
private const val STRING = "Ljava/lang/String;"

private data class PlaybackAbi(
    val coordinator: String,
    val current: String,
    val playback: String,
    val formatEvent: String,
    val video: String,
    val audio: String,
    val chunkSource: String,
    val chunkFactory: String,
)

/** Same stock active-clip setter and track event across these versions, with obfuscated field names. */
private fun playbackAbi(version: String): PlaybackAbi = when (version) {
    "9.45.51" -> PlaybackAbi("Lyxv;", "m", "Lzbx;", "x", "F", "q", "Lzbe;", "i")
    "9.40.51" -> PlaybackAbi("Lyun;", "m", "Lyyk;", "w", "E", "q", "Lyxr;", "i")
    "9.15.51" -> PlaybackAbi("Laugf;", "o", "Lauoc;", "w", "F", "r", "Laumu;", "e")
    "8.30.54" -> PlaybackAbi("Lardt;", "p", "Larpz;", "u", "F", "r", "Larjl;", "e")
    "8.28.54" -> PlaybackAbi("Laqwk;", "p", "Larin;", "t", "F", "r", "Larcb;", "e")
    "8.12.54" -> PlaybackAbi("Laoxp;", "p", "Lapjj;", "t", "G", "r", "Lapcv;", "e")
    else -> error("unverified playback ownership")
}

internal class PlaybackSourceInspectorHooks(
    private val fileReaderType: String,
    val install: () -> Unit,
) {
    fun bindFileReader(reader: Int, scratch: Int, cache: Int, spec: FieldReference, uri: FieldReference): String = """
        iget-object v$scratch, v$cache, $spec
        iget-object v$scratch, v$scratch, $uri
        invoke-static {v$scratch}, $SWAP_SOURCE->inspectFileRead($URI)$READ
        move-result-object v$scratch
        iput-object v$scratch, v$reader, $fileReaderType->rvxSourceRead:$READ
    """
}

/** Resolve all stock reader and ownership boundaries before adding any instructions. */
internal fun BytecodePatchContext.preparePlaybackSourceInspector(fileReader: ClassDef): PlaybackSourceInspectorHooks {
    val abi = playbackAbi(packageMetadata.versionName)
    val coordinator = mutableClassDefBy(abi.coordinator)
    val playback = mutableClassDefBy(abi.playback)
    val setter = coordinator.methods.single { it.name == "e" && it.parameterTypes == listOf(abi.playback) &&
        it.returnType == "V" }
    val setterCode = setter.implementation!!.instructions
    val activeField = coordinator.fields.single { it.name == abi.current && it.type == abi.playback }
    val selected = setterCode.indices.single {
        setterCode[it].opcode == Opcode.IPUT_OBJECT && setterCode[it].getReference<FieldReference>() == activeField
    }
    val write = setterCode[selected] as TwoRegisterInstruction
    val coordinatorRegister = write.registerB
    val playbackRegister = write.registerA
    val setterThisRegister = setter.implementation!!.registerCount - 2
    check(coordinatorRegister == setterThisRegister && playbackRegister == setterThisRegister + 1) {
        "active playback write does not use the selected object"
    }

    val event = Fingerprint(strings = listOf("currentVideoFormat=", " currentAudioFormat=")).matchSingle().classDef
    val publishedVideo = event.fields.single { it.name == "c" }
    val publishedAudio = event.fields.single { it.name == "f" }
    val formatType = publishedVideo.type
    check(publishedAudio.type == formatType)
    val formatClass = mutableClassDefBy(formatType)
    val uri = formatClass.fields.single { it.name == "e" && it.type == URI }
    val itag = formatClass.methods.single { it.name == "e" && it.returnType == "I" && it.parameterTypes.isEmpty() }
    val itagCode = itag.implementation!!.instructions
    val proto = itagCode.first().getReference<FieldReference>()
    val itagField = itagCode.getOrNull(1)?.getReference<FieldReference>()
    check(itagCode.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.IGET, Opcode.RETURN) &&
        proto?.definingClass == formatType && proto.name == "b" &&
        itagField?.definingClass == proto.type && itagField.name == "e" && itagField.type == "I" &&
        AccessFlags.PUBLIC.isSet(itag.accessFlags)) { "selected format itag accessor changed" }
    val video = playback.fields.single { it.name == abi.video && it.type == formatType }
    val audio = playback.fields.single { it.name == abi.audio && it.type == formatType }
    val nonce = playback.fields.single { it.name == "a" && it.type == STRING }
    val publishFormats = playback.methods.single { method ->
        method.name == abi.formatEvent && method.returnType == "V" && method.implementation?.instructions?.any {
            it.opcode == Opcode.INVOKE_DIRECT_RANGE && it.getReference<MethodReference>()?.let { constructor ->
                constructor.definingClass == event.type && constructor.name == "<init>" &&
                    constructor.parameterTypes.take(2) == listOf(formatType, formatType)
            } == true
        } == true
    }
    val formatCode = publishFormats.implementation!!.instructions
    val formatReads = formatCode.filter { it.opcode == Opcode.IGET_OBJECT }
    check(formatReads.any { it.getReference<FieldReference>() == video } &&
        formatReads.any { it.getReference<FieldReference>() == audio }) { "format event does not read both tracks" }
    val formatDispatch = try {
        preparePlaybackFormatDispatch(playback, publishFormats, publishedVideo, publishedAudio)
    } catch (ex: Exception) {
        printWarn("Playback source inspector: clip event receiver unavailable; using the selected fields: ${ex.message}")
        null
    }

    checkChunkNonce(abi, formatClass, uri)
    checkChunkLoader()

    val reader = mutableClassDefBy(fileReader)
    val read = reader.methods.single { it.parameterTypes == listOf("[B", "I", "I") && it.returnType == "I" }
    val readCode = read.implementation!!.instructions
    val thisRegister = read.implementation!!.registerCount - 4
    val readCall = readCode.indices.single {
        readCode[it].opcode == Opcode.INVOKE_VIRTUAL && readCode[it].getReference<MethodReference>()?.let { call ->
            call.definingClass == "Ljava/io/RandomAccessFile;" && call.name == "read" &&
                call.parameterTypes == read.parameterTypes && call.returnType == "I"
        } == true
    }
    val result = readCode[readCall + 1] as OneRegisterInstruction
    val branch = readCode[readCall + 2] as BuilderOffsetInstruction
    check(result.opcode == Opcode.MOVE_RESULT && branch.opcode == Opcode.IF_LEZ &&
        (branch as OneRegisterInstruction).registerA == result.registerA) {
        "file reader does not branch on the native read count"
    }

    val hookIndex = branch.target.location.index
    check(hookIndex > readCall + 3 && readCode.subList(readCall + 3, hookIndex).all {
        it !is BuilderOffsetInstruction && it.opcode.canContinue() &&
            !it.writesReadRegister(thisRegister) && !it.writesReadRegister(result.registerA)
    }) { "file reader does not preserve its receiver and count through the positive path" }
    check(returnsReadCount(readCode, hookIndex, result.registerA)) {
        "file reader does not return the observed count"
    }
    check(thisRegister in 2..15 && result.registerA in 2..15 && thisRegister != result.registerA) {
        "file reader scratch registers are live"
    }
    val returnRead = ExternalLabel("return_read", read.getInstruction<Instruction>(hookIndex))
    val extensionGate = mutableClassDefBy(INSPECTOR_CLASS).methods.single { it.name == "supported" }
    val selectFormats = "$INSPECTOR_CLASS->selectFormats($PLAYBACK$LOCAL_FORMAT${LOCAL_FORMAT}II)V"
    val selectPlayback = "$INSPECTOR_CLASS->selectPlayback(Ljava/lang/Object;$PLAYBACK)V"

    return PlaybackSourceInspectorHooks(reader.type) {
        playback.interfaces.add(if (formatDispatch == null) PLAYBACK else EVENT_PLAYBACK)
        playback.addDownloadsBridge("rvxPlaybackNonce", emptyList(), STRING, 2, """
            iget-object v0, p0, $nonce
            return-object v0
        """)
        // Both selected stock formats are sampled together, including a null video track in Song mode.
        playback.addDownloadsBridge("rvxInspectSelectedFormats", emptyList(), "V", 6,
            sampleFormats(audio, video, itag, uri, "p0", selectFormats))
        if (formatDispatch == null) {
            publishFormats.addInstructions(0, """
                invoke-virtual/range {p0 .. p0}, ${playback.type}->rvxInspectSelectedFormats()V
            """)
        } else {
            formatDispatch.install(playback, event, publishedAudio, publishedVideo, itag, uri)
        }
        setter.addInstructionsWithLabels(selected + 1, """
            invoke-static {v$coordinatorRegister, v$playbackRegister}, $selectPlayback
            if-eqz v$playbackRegister, :continue_activation
            invoke-virtual {v$playbackRegister}, ${playback.type}->rvxInspectSelectedFormats()V
        """, ExternalLabel("continue_activation", setter.getInstruction<Instruction>(selected + 1)))

        reader.instanceFields.add(ImmutableField(reader.type, "rvxSourceRead", READ, AccessFlags.PUBLIC.value,
            null, null, null).toMutable())
        read.addInstructionsWithLabels(hookIndex, """
            if-lez v${result.registerA}, :return_read
            iget-object v0, v$thisRegister, ${reader.type}->rvxSourceRead:$READ
            if-eqz v0, :return_read
            const/4 v1, 0x0
            iput-object v1, v$thisRegister, ${reader.type}->rvxSourceRead:$READ
            invoke-virtual {v0, v${result.registerA}}, $READ->returned(I)V
        """, returnRead)
        extensionGate.returnEarly(true)
        printInfo("Playback source inspector: active clip, selected tracks and positive file reads hooked.")
    }
}

private data class PlaybackFormatDispatch(
    val events: FieldReference,
    val clipReceiver: MutableClass,
    val forwarded: MutableMethod,
) {
    fun install(
        playback: MutableClass,
        event: MutableClass,
        audio: FieldReference,
        video: FieldReference,
        itag: MethodReference,
        uri: FieldReference,
    ) {
        val report = "$INSPECTOR_CLASS->selectPublishedFormats(Ljava/lang/Object;$LOCAL_FORMAT${LOCAL_FORMAT}II)V"
        playback.addDownloadsBridge("rvxPlaybackEvents", emptyList(), "Ljava/lang/Object;", 2, """
            iget-object v0, p0, $events
            return-object v0
        """)
        event.addDownloadsBridge("rvxInspectPublishedFormats", listOf("Ljava/lang/Object;"), "V", 7,
            sampleFormats(audio, video, itag, uri, "p1", report))

        clipReceiver.addDownloadsBridge(forwarded.name, listOf(event.type), "V", 2, """
            invoke-virtual {p1, p0}, ${event.type}->rvxInspectPublishedFormats(Ljava/lang/Object;)V
            invoke-super {p0, p1}, $forwarded
            return-void
        """)
        printInfo("Playback source inspector: published formats hooked on ${clipReceiver.type}->${forwarded.name}.")
    }
}

/** Resolve the receiver shared by all of the clip's format publishers, not just the plain Exo producer. */
private fun BytecodePatchContext.preparePlaybackFormatDispatch(
    playback: MutableClass,
    publish: MutableMethod,
    video: FieldReference,
    audio: FieldReference,
): PlaybackFormatDispatch {
    val publishCode = publish.implementation!!.instructions
    val dispatch = publishCode.filter { it.opcode == Opcode.INVOKE_INTERFACE }
        .mapNotNull { it.getReference<MethodReference>() }
        .single { it.parameterTypes == listOf(video.definingClass) && it.returnType == "V" }
    val events = playback.fields.single { it.name == "b" && it.type == dispatch.definingClass }
    check(AccessFlags.FINAL.isSet(events.accessFlags) &&
        publishCode.any { it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>() == events }) {
        "format publisher does not read the clip's event receiver"
    }

    val constructor = playback.methods.single { method ->
        method.name == "<init>" && method.implementation?.instructions?.any {
            it.opcode == Opcode.IPUT_OBJECT && it.getReference<FieldReference>() == events
        } == true
    }
    val code = constructor.implementation!!.instructions
    val writeIndex = code.indices.single {
        code[it].opcode == Opcode.IPUT_OBJECT && code[it].getReference<FieldReference>() == events
    }
    val receiverRegister = (code[writeIndex] as TwoRegisterInstruction).registerA
    val allocation = (0 until writeIndex).last {
        code[it].opcode == Opcode.NEW_INSTANCE && (code[it] as OneRegisterInstruction).registerA == receiverRegister
    }
    val receiver = mutableClassDefBy(code[allocation].getReference<TypeReference>()!!.type)
    val relay = mutableClassDefBy(requireNotNull(receiver.superclass))
    val init = code[writeIndex - 1] as FiveRegisterInstruction
    val initCall = init.getReference<MethodReference>()
    check(AccessFlags.FINAL.isSet(receiver.accessFlags) && init.opcode == Opcode.INVOKE_DIRECT &&
        init.registerC == receiverRegister && initCall?.name == "<init>" &&
        initCall.definingClass in setOf(receiver.type, relay.type) &&
        code.subList(allocation + 1, writeIndex).none { it.writesReadRegister(receiverRegister) }) {
        "format events are not bound to a fresh receiver for this clip"
    }
    fun MethodReference.isFormatDispatch() =
        name == dispatch.name && parameterTypes == dispatch.parameterTypes && returnType == dispatch.returnType

    check(receiver.methods.none { it.isFormatDispatch() }) { "clip receiver already overrides format dispatch" }
    val forwarded = relay.methods.single { it.isFormatDispatch() }
    check(!AccessFlags.FINAL.isSet(forwarded.accessFlags) &&
        forwarded.implementation!!.instructions.count {
            it.opcode == Opcode.INVOKE_INTERFACE && it.getReference<MethodReference>() == dispatch
        } == 1) { "format receiver does not forward the exact event" }

    val event = mutableClassDefBy(video.definingClass)
    val eventConstructor = publishCode.filter { it.opcode == Opcode.INVOKE_DIRECT_RANGE }
        .mapNotNull { it.getReference<MethodReference>() }
        .single { it.name == "<init>" && it.definingClass == event.type }
    val buildEvent = event.methods.single { it.name == "<init>" && it.parameterTypes == eventConstructor.parameterTypes }
    val eventRegisters = buildEvent.implementation!!.registerCount
    val parameters = buildEvent.parameterTypes.fold(0) { slots, type ->
        slots + if (type == "J" || type == "D") 2 else 1
    }
    val eventThis = eventRegisters - parameters - 1
    val eventWrites = buildEvent.implementation!!.instructions.filter { it.opcode == Opcode.IPUT_OBJECT }
    fun containsFormatWrite(field: FieldReference, register: Int) = eventWrites.any {
        val write = it as TwoRegisterInstruction
        write.registerB == eventThis && write.registerA == register && it.getReference<FieldReference>() == field
    }
    check(containsFormatWrite(video, eventThis + 1) && containsFormatWrite(audio, eventThis + 2)) {
        "current video/audio are no longer the first two format event arguments"
    }
    return PlaybackFormatDispatch(events, receiver, forwarded)
}

private fun sampleFormats(
    audio: FieldReference,
    video: FieldReference,
    itag: MethodReference,
    uri: FieldReference,
    owner: String,
    report: String,
) = """
    const/4 v0, 0x0
    const/4 v2, -0x1
    iget-object v4, p0, $audio
    if-eqz v4, :audio_ready
    invoke-virtual {v4}, $itag
    move-result v2
    iget-object v4, v4, $uri
    invoke-static {v4}, $SWAP_SOURCE->inspectionFormat($URI)$LOCAL_FORMAT
    move-result-object v0
    :audio_ready
    const/4 v1, 0x0
    const/4 v3, -0x1
    iget-object v4, p0, $video
    if-eqz v4, :video_ready
    invoke-virtual {v4}, $itag
    move-result v3
    iget-object v4, v4, $uri
    invoke-static {v4}, $SWAP_SOURCE->inspectionFormat($URI)$LOCAL_FORMAT
    move-result-object v1
    :video_ready
    invoke-static {$owner, v0, v1, v2, v3}, $report
    iget-object v4, p0, $audio
    invoke-static {$owner, v4, v0}, $INSPECTOR_CLASS->traceAudioVariant(Ljava/lang/Object;Ljava/lang/Object;$LOCAL_FORMAT)V
    return-void
"""

private fun Instruction.writesReadRegister(register: Int): Boolean {
    if (!opcode.setsRegister()) return false

    val destination = (this as OneRegisterInstruction).registerA
    return destination == register || opcode.setsWideRegister() && destination + 1 == register
}

private fun returnsReadCount(code: List<Instruction>, start: Int, countRegister: Int): Boolean {
    val first = code[start]
    if (first.opcode == Opcode.RETURN) return (first as OneRegisterInstruction).registerA == countRegister
    if (first.opcode != Opcode.MOVE) return false

    // 9.45.51 shares its return with early zero-length/EOF paths. Its read path first moves the count into the
    // instance register, so observe the count before that move, when the reader still exists in that register.
    val move = first as TwoRegisterInstruction
    val result = code.getOrNull(start + 1)
    return move.registerB == countRegister && result?.opcode == Opcode.RETURN &&
        (result as OneRegisterInstruction).registerA == move.registerA
}

private fun BytecodePatchContext.checkChunkLoader() {
    val stream = Fingerprint(name = "<init>", strings = listOf("ChunkSampleStream")).matchSingle().method
    val prefix = Fingerprint(name = "<init>", strings = listOf("ExoPlayer:Loader:")).matchSingle().method
    check(stream.implementation!!.instructions.any {
        (it is FiveRegisterInstruction || it is RegisterRangeInstruction) &&
            it.getReference<MethodReference>() == prefix && prefix.parameterTypes == listOf(STRING)
    }) { "chunk loading does not use the expected native playback executor" }
}

/** The selected clip's CPN is on plain-format chunk URLs before the cache or HTTP wrapper can rewrite them. */
private fun BytecodePatchContext.checkChunkNonce(abi: PlaybackAbi, format: ClassDef, uri: FieldReference) {
    val builder = format.methods.single { method ->
        method.parameterTypes.isEmpty() && method.returnType.startsWith("L") && method.returnType != STRING &&
            method.implementation?.instructions?.any {
                it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>() == uri
            } == true
    }
    val nonceWriter = mutableClassDefBy(builder.returnType).methods.single { method ->
        method.returnType == "V" && method.parameterTypes == listOf(STRING) &&
            method.implementation?.instructions?.any { it.getReference<StringReference>()?.string == "cpn" } == true
    }

    val source = mutableClassDefBy(abi.chunkSource)
    val chunk = source.methods.single { method ->
        method.name == abi.chunkFactory && method.returnType == "V" && method.parameterTypes.size == 4 &&
            method.parameterTypes[1] == "J" && method.parameterTypes[2] == "Ljava/util/List;"
    }
    val code = chunk.implementation!!.instructions
    val index = code.indices.single { code[it].getReference<MethodReference>() == nonceWriter }
    val write = code[index] as FiveRegisterInstruction
    val nonce = code[index - 1] as TwoRegisterInstruction
    val result = code[index - 2] as OneRegisterInstruction
    check(code[index - 3].getReference<MethodReference>() == builder && result.opcode == Opcode.MOVE_RESULT_OBJECT &&
        nonce.opcode == Opcode.IGET_OBJECT && nonce.getReference<FieldReference>()?.definingClass == source.type &&
        nonce.getReference<FieldReference>()?.type == STRING && write.registerCount == 2 &&
        write.registerC == result.registerA && write.registerD == nonce.registerA) {
        "plain playback chunk no longer attaches its CPN to the selected format URI"
    }
}
