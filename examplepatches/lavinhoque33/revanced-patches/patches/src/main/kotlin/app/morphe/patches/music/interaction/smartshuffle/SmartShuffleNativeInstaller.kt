/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.patches.music.interaction.smartshuffle

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.music.interaction.downloads.resolveNativeQueueBatch
import app.morphe.patches.music.interaction.jam.*
import app.morphe.patches.music.interaction.playlisttracktap.CommandResolverFingerprint
import app.morphe.util.cloneMutable
import app.morphe.util.findInstructionIndicesReversedOrThrow
import app.morphe.util.getReference
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val NATIVE = "Lapp/morphe/extension/music/patches/smartshuffle/SmartShuffleNative;"
private const val ACCESS = $$"Lapp/morphe/extension/music/patches/smartshuffle/SmartShuffleNative$Access;"
private const val OCCURRENCE = $$"Lapp/morphe/extension/music/patches/smartshuffle/SmartShuffleNative$Occurrence;"
private const val COMMAND = $$"Lapp/morphe/extension/music/patches/smartshuffle/SmartShuffleNative$CommandAccess;"

internal fun installSmartShuffleReplacementAck(method: MutableMethod, index: Int, resultRegister: Int) {
    val acknowledge = "invoke-static/range {p0 .. p0}, $NATIVE->replaced(Ljava/lang/Object;)V"
    if (resultRegister < 0) {
        method.addInstructions(index, acknowledge)
    } else {
        method.addInstructionsWithLabels(index, """
            if-eqz v$resultRegister, :smart_unchanged
            $acknowledge
        """, ExternalLabel("smart_unchanged", method.implementation!!.instructions.elementAt(index)))
    }
}

/** Keep the native response-item/filter/mutation tail unchanged; replace only its target-index selection. */
internal fun indexedSmartShuffleSuccess(success: MutableMethod): MutableMethod {
    val code = success.implementation!!.instructions.toList()
    val responseItemsIndex = code.indices.single { index ->
        code[index].opcode == Opcode.IGET_OBJECT &&
            code[index].getReference<FieldReference>()?.type == "Ljava/util/List;"
    }
    check(code.first().opcode == Opcode.CHECK_CAST && responseItemsIndex > 1)
    val addIndex = code.indices.single { index ->
        code[index].getReference<MethodReference>()?.let {
            it.name == "addAll" && it.parameterTypes == listOf("I", "Ljava/util/Collection;")
        } == true
    }
    val insertionRegister = (code[addIndex] as ReferenceInstruction).registerAt(1)!!
    val zeroRegister = code.take(responseItemsIndex).filter {
        it.opcode == Opcode.CONST_4 && (it as NarrowLiteralInstruction).narrowLiteral == 0
    }.map { (it as OneRegisterInstruction).registerA }.single()

    // Appending one parameter and one register leaves every original parameter register unchanged.
    return success.cloneMutable(
        name = "smartIndexedSuccess",
        registerCount = success.implementation!!.registerCount + 1,
        parameters = success.parameters + ImmutableMethodParameter("I", null, null),
    ).apply {
        for (index in responseItemsIndex - 1 downTo 1) implementation!!.removeInstruction(index)
        addInstructions(1, "const/4 v$zeroRegister, 0x0\nmove/from16 v$insertionRegister, p2")
    }
}


/** Preflights the installed Jam ABI: its callback wrappers must never be fingerprinted as stock a second time. */
internal fun BytecodePatchContext.resolveSmartShuffleNative(): () -> Unit {
    val manager = mutableClassDefBy(QueueEnqueueFingerprint.match().originalClassDef.type)
    fun bridge(name: String) = manager.methods.single { it.name == name }
    fun Method.calls() = implementation!!.instructions.mapNotNull { it.getReference<MethodReference>() }
    fun Method.fields() = implementation!!.instructions.mapNotNull { it.getReference<FieldReference>() }

    val enqueue = bridge("patch_jamLocalEnqueue")
    val proto = resolveProto(enqueue.parameterTypes.single().toString(), "Smart Shuffle command")
    val itemId = bridge("patch_jamItemId").calls().single()
    val itemType = bridge("patch_jamRemoveItem").implementation!!.instructions
        .single { it.opcode == Opcode.CHECK_CAST }.getReference<TypeReference>()!!.type
    val itemClasses = concreteImplementationsOf(itemType)
    check(itemClasses.isNotEmpty()) { "Smart Shuffle has no native occurrence implementations" }

    val callback = enqueue.implementation!!.instructions.mapNotNull {
        if (it.opcode == Opcode.NEW_INSTANCE) it.getReference<TypeReference>()?.type else null
    }.map { mutableClassDefBy(it) }.single { candidate ->
        candidate.methods.any { it.name == "patch_jamLocalSuccess" }
    }
    val success = callback.methods.single { it.name == "patch_jamLocalSuccess" }
    val constructor = callback.methods.single { it.name == "<init>" && it.parameterTypes.size == 2 }
    check(constructor.parameterTypes[0] == manager.type)
    val modeType = constructor.parameterTypes[1].toString()
    val constructorCode = constructor.implementation!!.instructions.toList()
    val playNextLabel = constructorCode.indexOfFirst { it.getReference<StringReference>()?.string == "PLAY_NEXT" }
    check(playNextLabel >= 0) { "Native Play-next mode is missing" }
    val playNext = constructorCode.take(playNextLabel).mapNotNull { it.getReference<FieldReference>() }
        .last { it.definingClass == modeType && it.type == modeType }

    val indexedSuccess = indexedSmartShuffleSuccess(success)

    val requestBridge = bridge("patch_jamRequestMenu")
    val dispatch = requestBridge.calls().single {
        it.parameterTypes == listOf(proto.type, "Ljava/util/concurrent/Executor;")
    }
    val executor = bridge("patch_jamExecutor").fields().single()
    val dispatcher = requestBridge.fields().single { it.definingClass == manager.type }
    val batch = resolveNativeQueueBatch(dispatch.getMutableMethod(),
        Fingerprint(strings = listOf("music/get_queue")).classDef.type).apply {
        setName("smartResolveBatch")
    }

    // PlaybackStartDescriptor's semantic diagnostic orders video, playlist, index, videoIds.
    val descriptor = Fingerprint(strings = listOf(
        "PlaybackStartDescriptor:\n  VideoId:%s\n  PlaylistId:%s\n  Index:%d\n  VideoIds:%s"
    )).match().originalMethod
    val sourceCalls = descriptor.calls().filter {
        it.definingClass == descriptor.definingClass && it.returnType == "Ljava/lang/String;" &&
            it.parameterTypes.isEmpty()
    }
    check(sourceCalls.size == 2) { "Native playback playlist source is ambiguous" }
    val playlistId = sourceCalls[1]
    val itemDescriptor = interfaceClosure(itemType).mapNotNull { classDefByOrNull(it) }.flatMap { it.methods }.single {
        it.parameterTypes.isEmpty() && it.returnType == descriptor.definingClass
    }
    val storage = bridge("patch_jamCurrent").fields().single()
    val storageMethods = mutableClassDefBy(storage.type).methods.filter { method ->
        !method.name.startsWith("<") && method.returnType == "V" && method.implementation != null &&
            method.calls().none {
                it.definingClass == "Ljava/util/Set;" && it.name in listOf("add", "remove")
            }
    }
    val currentAccessor = bridge("patch_jamCurrent").calls().single()
    val model = currentAccessor.getMutableMethod().fields().first { it.definingClass == storage.type }
    val replacement = storageMethods.single { method ->
        method.implementation!!.instructions.any {
            it.getReference<StringReference>()?.string?.contains("replaceQueueContents") == true
        }
    }
    val replaceCallIndex = replacement.implementation!!.instructions.indexOfFirst {
        it.getReference<MethodReference>()?.parameterTypes?.let { parameters ->
            parameters.size == 4 && parameters[0] == "Ljava/util/List;" &&
                parameters[1] == "Ljava/util/List;" && parameters[2] == "I"
        } == true
    }
    check(replaceCallIndex >= 0) { "Native committed replaceQueueContents operation is unavailable" }
    val replaceCall = replacement.implementation!!.instructions.elementAt(replaceCallIndex)
        .getReference<MethodReference>()!!
    val replacementAcknowledgement = when (replaceCall.returnType) {
        "V" -> Triple(replacement, replaceCallIndex + 1, -1)
        "Z" -> {
            val result = replacement.implementation!!.instructions.elementAt(replaceCallIndex + 1)
            check(result.opcode == Opcode.MOVE_RESULT) { "Native replacement result is unavailable" }
            val register = (result as OneRegisterInstruction).registerA
            Triple(replacement, replaceCallIndex + 2, register)
        }
        else -> error("Native replacement acknowledgement is unavailable")
    }
    val modelWrites = storageMethods.flatMap { method ->
        method.implementation!!.instructions.withIndex().filter {
            it.value.opcode == Opcode.IPUT_OBJECT && it.value.getReference<FieldReference>() == model
        }.map { method to it.index }
    }
    check(modelWrites.isNotEmpty()) { "Native queue model replacement is unavailable" }
    val refreshMethods = listOf("patch_jamRefreshDisplay", "patch_jamRefreshAutoplay").map { name ->
        bridge(name).calls().single { it.parameterTypes.isEmpty() && it.returnType == "V" }.getMutableMethod()
    }.distinct()
    val commandResolver = CommandResolverFingerprint.method
    check(commandResolver.parameterTypes == listOf(proto.type, "Ljava/util/Map;"))
    val resolverClass = mutableClassDefBy(commandResolver.definingClass)
    val nativeDispatch = resolverClass.methods.single {
        it.parameterTypes == listOf(proto.type) && it.returnType == "V"
    }
    val capture = mutableClassDefBy("Lapp/morphe/extension/music/patches/jam/YouTubeMusicBridge;")
        .methods.single { it.name == "capture" }
    val supported = mutableClassDefBy(NATIVE).methods.single { it.name == "supported" }
    val installActivityDispatcher = resolveSmartShuffleActivityDispatcher(proto, nativeDispatch)

    return {
        manager.interfaces.add(ACCESS)
        installActivityDispatcher()
        callback.methods.add(indexedSuccess)
        mutableClassDefBy(batch.definingClass).methods.add(batch)
        manager.addBridge("smartResolve", listOf("[B", "Ljava/util/List;"),
            "Ljava/util/concurrent/Future;", 6, body = proto.decode("p1", "v0") + """
            iget-object v1, p0, $dispatcher
            iget-object v2, p0, $executor
            ${invokeKind(batch)} {v1, v0, v2, p2}, $batch
            move-result-object v0
            return-object v0
        """)
        manager.addBridge("smartInsert", listOf("Ljava/lang/Object;", "I"), "V", 5, body = """
            new-instance v0, ${callback.type}
            sget-object v1, $playNext
            invoke-direct {v0, p0, v1}, $constructor
            ${invokeKind(indexedSuccess)} {v0, p1, p2}, $indexedSuccess
            return-void
        """)
        manager.addBridge("smartStorage", emptyList(), "Ljava/lang/Object;", 2, body = """
            iget-object v0, p0, $storage
            return-object v0
        """)
        manager.addBridge("smartPlaylistId", listOf("Ljava/lang/Object;"), "Ljava/lang/String;", 3, body = """
            check-cast p1, $itemType
            ${invokeKind(itemDescriptor)} {p1}, $itemDescriptor
            move-result-object v0
            if-eqz v0, :missing
            ${invokeKind(playlistId)} {v0}, $playlistId
            move-result-object v0
            return-object v0
            :missing
            const-string v0, ""
            return-object v0
        """)
        itemClasses.forEach { implementation ->
            val item = mutableClassDefBy(implementation.type)
            item.interfaces.add(OCCURRENCE)
            installNativeAccessor(item, "smartOccurrenceId", itemId)
        }
        capture.addInstructions(0, """
            check-cast p0, $ACCESS
            invoke-static {p0}, $NATIVE->capture($ACCESS)V
        """)
        // These acknowledgements do not depend on the lifetime of the mutable native model.
        val acknowledgements = modelWrites.map { (method, index) ->
            Triple(method, index + 1, -1)
        } + replacementAcknowledgement
        for ((method, index, register) in acknowledgements.sortedByDescending { it.second }) {
            installSmartShuffleReplacementAck(method, index, register)
        }
        for (method in (storageMethods + refreshMethods).distinct()) {
            method.findInstructionIndicesReversedOrThrow(Opcode.RETURN_VOID).forEach { index ->
                method.addInstructions(index, "invoke-static {}, $NATIVE->changed()V")
            }
        }
        resolverClass.interfaces.add(COMMAND)
        resolverClass.addBridge("smartDispatch", listOf("[B"), "V", 5,
            body = proto.decode("p1", "v0") + """
            ${invokeKind(nativeDispatch)} {p0, v0}, $nativeDispatch
            return-void
        """)
        commandResolver.addInstructions(0,
            "invoke-static/range {p0 .. p0}, $NATIVE->captureDispatcher($COMMAND)V")
        supported.returnEarly(true)
    }
}
