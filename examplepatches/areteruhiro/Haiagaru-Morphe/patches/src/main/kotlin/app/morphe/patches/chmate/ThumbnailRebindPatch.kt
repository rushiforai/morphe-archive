package app.morphe.patches.chmate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

/** Binding is not an explicit image retry. Leave the retry entry point intact. */
internal fun BytecodePatchContext.patchThumbnailRebind242(version: String) {
    if (version != "0.8.10.242 dev") return
    val row = mutableClassDefBy("Lo/zzbhe;")
    val parameters = listOf("[Ljava/lang/CharSequence;", "Z", "Z")
    val bind = row.methods.single { it.name == "setImageLinks" && it.parameterTypes == parameters }
    val native = row.methods.single { it.name == "setImageLinks2" && it.parameterTypes == parameters }
    val bridge = MutableMethod(ImmutableMethod(row.type, "haiagaruBindImageLinks", native.parameters,
        "V", 0x1, emptySet(), emptySet(), ImmutableMethodImplementation(5, emptyList(), emptyList(), emptyList())))
    bridge.addInstructions(0, """
        const/4 v0, 0x0
        invoke-virtual {p0, p1, v0, p3}, ${row.type}->setImageLinks2([Ljava/lang/CharSequence;ZZ)V
        return-void
    """.trimIndent())
    val sites = bind.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (ref?.definingClass == row.type && ref.name == native.name && ref.parameterTypes == parameters) index else null
    }
    check(sites.isNotEmpty()) { "242 thumbnail binding delegate missing" }
    for (index in sites) {
        val instruction = bind.implementation!!.instructions[index]
        check(instruction.opcode == Opcode.INVOKE_VIRTUAL)
        val call = instruction as FiveRegisterInstruction
        check(call.registerCount == 4)
        bind.replaceInstruction(index,
            "invoke-virtual {v${call.registerC}, v${call.registerD}, v${call.registerE}, v${call.registerF}}, " +
                "${row.type}->haiagaruBindImageLinks([Ljava/lang/CharSequence;ZZ)V")
    }
    row.methods.add(bridge)

    // An automatic same-URL requery also occurs on attachment and media notifications.
    // Keep its decoded image while the replacement is being decoded. Only intercept
    // the initial empty state here; errors, NG changes and URL changes remain native.
    val image = mutableClassDefBy("Lo/zzbes;")
    val retry = image.methods.single { it.name == "d" && it.parameterTypes == listOf("Z") && it.returnType == "V" }
    val bitmap = image.fields.single { it.type == "Lo/VN22;" }
    val user = image.fields.single { it.name == "mDownloadByUser" && it.type == "Z" }
    val instructions = retry.implementation!!.instructions.toList()
    val reset = instructions.withIndex().single { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == image.type && ref.name == "c" && ref.parameterTypes == listOf("Lo/zzbes\$write;")
    }
    val resetArg = (reset.value as FiveRegisterInstruction).registerD
    val emptyLoad = instructions.take(reset.index).takeLast(2).firstOrNull { it.opcode == Opcode.SGET_OBJECT }
    val empty = (emptyLoad as? ReferenceInstruction)?.reference as? FieldReference
    check(emptyLoad is com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction && emptyLoad.registerA == resetArg)
    check(empty?.definingClass == "Lo/zzbes\$write\$ComponentActivity;" ||
        empty?.type == "Lo/zzbes\$write\$ComponentActivity;") { "242 automatic requery reset changed: $empty" }
    val resetCall = reset.value as FiveRegisterInstruction
    check(resetCall.registerCount == 2)
    val guarded = MutableMethod(ImmutableMethod(image.type, "haiagaruResetForRequery",
        listOf(com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter("Lo/zzbes\$write;", emptySet(), null)),
        "V", 0x1, emptySet(), emptySet(), ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList())))
    guarded.addInstructionsWithLabels(0, """
        iget-boolean v0, p0, ${image.type}->${user.name}:Z
        if-nez v0, :reset
        iget-object v0, p0, ${image.type}->${bitmap.name}:Lo/VN22;
        if-eqz v0, :reset
        return-void
        :reset
        invoke-direct {p0, p1}, ${image.type}->c(Lo/zzbes${'$'}write;)V
        return-void
    """.trimIndent())
    retry.replaceInstruction(reset.index,
        "invoke-virtual {v${resetCall.registerC}, v${resetCall.registerD}}, ${image.type}->haiagaruResetForRequery(Lo/zzbes${'$'}write;)V")
    // The queued decoder immediately sets a second temporary loading state.
    // Guard that exact call as well; suppressing just the empty state still flickers.
    val start = image.methods.single { it.name == "f" && it.parameterTypes == listOf(image.type) && it.returnType == "V" }
    val loading = start.implementation!!.instructions.withIndex().single { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == image.type && ref.name == "c" && ref.parameterTypes == listOf("Lo/zzbes\$write;")
    }
    check(loading.value.opcode == Opcode.INVOKE_DIRECT)
    val loadingCall = loading.value as FiveRegisterInstruction
    check(loadingCall.registerCount == 2)
    start.replaceInstruction(loading.index,
        "invoke-virtual {v${loadingCall.registerC}, v${loadingCall.registerD}}, ${image.type}->haiagaruResetForRequery(Lo/zzbes${'$'}write;)V")
    image.methods.add(guarded)
}
