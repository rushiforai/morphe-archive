package me.dyskal.patches.discord

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/** Discover the queue/renderer references from Music's own explicit-content metadata projection. */
context(context: BytecodePatchContext)
internal fun installNativeMetadataHook() {
    val target = MusicMetadataAugmentFingerprint.method
    val instructions = target.implementation!!.instructions.toList()
    fun reference(index: Int) = (instructions.getOrNull(index) as? ReferenceInstruction)?.reference
    val queueIndex = instructions.indices.single { index ->
        val call = reference(index) as? MethodReference
        instructions[index].opcode == Opcode.INVOKE_VIRTUAL && call != null && call.parameterTypes.isEmpty()
                && call.returnType.startsWith("L") && call.returnType != "Ljava/lang/Object;"
                && instructions.getOrNull(index + 2)?.opcode == Opcode.CHECK_CAST
                && instructions.getOrNull(index + 4)?.opcode == Opcode.INSTANCE_OF
    }
    val queueGetter = reference(queueIndex) as MethodReference
    val providerCall = reference(queueIndex - 3) as MethodReference
    val providerField = reference(queueIndex - 4) as FieldReference
    require(providerField.definingClass == target.definingClass && providerField.type == providerCall.definingClass)
    val renderers = instructions.indices.filter { index ->
        instructions[index].opcode == Opcode.IGET_OBJECT && instructions.getOrNull(index - 1)?.opcode == Opcode.CHECK_CAST
                && (reference(index) as? FieldReference)?.definingClass == (reference(index - 1) as? TypeReference)?.type
                && index > queueIndex
    }.map { reference(it) as FieldReference }
    require(renderers.size == 2 && renderers.map { it.type }.distinct().size == 1) { "Unable to resolve current queue renderer projections" }
    val first = renderers[0]; val second = renderers[1]
    val name = "dyskal_discordCaptureQueue"
    val helper = createQueueCaptureHelper(target.definingClass, providerField, providerCall, queueGetter, first, second)
    context.mutableClassDefBy(target.definingClass).methods.add(helper)
    target.addInstruction(0, "invoke-direct/range {p0 .. p0}, ${target.definingClass}->$name()V")

    val player = MusicVideoIdFingerprint.method
    val playerInstructions = player.implementation!!.instructions.toList()
    val idIndex = playerInstructions.indices.first { index ->
        val call = (playerInstructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        playerInstructions[index].opcode in setOf(Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE)
                && call?.returnType == "Ljava/lang/String;" && call.parameterTypes.isEmpty()
    }
    require(playerInstructions[idIndex + 1].opcode == Opcode.MOVE_RESULT_OBJECT)
    val idRegister = (playerInstructions[idIndex + 1] as OneRegisterInstruction).registerA
    player.addInstruction(idIndex + 2, "invoke-static/range {v$idRegister .. v$idRegister}, Lme/dyskal/ytmrpc/DiscordRpcPatch;->onNativeVideoId(Ljava/lang/String;)V")
}

internal fun createQueueCaptureHelper(
    owner: String, providerField: FieldReference, providerCall: MethodReference,
    queueGetter: MethodReference, first: FieldReference, second: FieldReference,
): MutableMethod = ImmutableMethod(owner, "dyskal_discordCaptureQueue", emptyList(), "V",
        AccessFlags.PRIVATE.value or AccessFlags.FINAL.value, emptySet(), emptySet(),
        MutableMethodImplementation(3)
).toMutable().apply {
    // Assemble in method context so p0 resolves after the two local registers.
    addInstructions(0, """
            iget-object v0, p0, $providerField
            invoke-interface {v0}, $providerCall
            move-result-object v0
            if-eqz v0, :done
            check-cast v0, ${queueGetter.definingClass}
            invoke-virtual {v0}, $queueGetter
            move-result-object v0
            if-eqz v0, :done
            instance-of v1, v0, ${first.definingClass}
            if-eqz v1, :second
            check-cast v0, ${first.definingClass}
            iget-object v0, v0, $first
            goto :serialize
            :second
            instance-of v1, v0, ${second.definingClass}
            if-eqz v1, :done
            check-cast v0, ${second.definingClass}
            iget-object v0, v0, $second
            :serialize
            if-eqz v0, :done
            invoke-interface {v0}, Lcom/google/protobuf/MessageLite;->toByteArray()[B
            move-result-object v0
            invoke-static {v0}, Lme/dyskal/ytmrpc/DiscordRpcPatch;->onNativeQueueMetadata([B)V
            :done
            return-void
        """.trimIndent())
}
