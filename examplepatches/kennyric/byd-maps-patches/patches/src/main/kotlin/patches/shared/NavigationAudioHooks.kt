package patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

internal const val PROVIDER_AUDIO = "Lnl/johninnl/navigation/startup/ProviderAudio;"

/** Require a real local; never overwrite a parameter in tiny R8 forwarding methods. */
internal fun gateProviderAudio(method: MutableMethod, callbackParameter: Int, result: String) {
    val call = if (callbackParameter < 0) "invoke-static {}, $PROVIDER_AUDIO->muted()Z"
        else "invoke-static/range {p$callbackParameter .. p$callbackParameter}, $PROVIDER_AUDIO->skip(Ljava/lang/Object;)Z"
    applyAudioGate(method, call, result)
}

internal fun gateProviderQueue(method: MutableMethod) = applyAudioGate(method,
    "invoke-static/range {p0 .. p0}, $PROVIDER_AUDIO->silenceQueue(Ljava/lang/Object;)Z", "void")

internal fun gateProviderBatch(method: MutableMethod) = applyAudioGate(method,
    "invoke-static/range {p1 .. p1}, $PROVIDER_AUDIO->skipItems(Ljava/lang/Object;)Z", "void")

private fun applyAudioGate(method: MutableMethod, call: String, result: String) {
    val words = method.parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 } +
        if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
    check(method.implementation!!.registerCount > words) { "No scratch register for provider audio gate: $method" }
    val finish = when (result) {
        "void" -> { check(method.returnType == "V"); "return-void" }
        "true" -> { check(method.returnType == "Z"); "const/4 v0, 0x1\nreturn v0" }
        "waze-tts" -> { check(method.returnType == "Ljava/lang/Object;"); "sget-object v0, Lcom/waze/sound/f;->a:Lcom/waze/sound/f;\nreturn-object v0" }
        else -> error("Unknown provider audio return contract")
    }
    method.addInstructions(0, """
        $call
        move-result v0
        if-eqz v0, :native_audio
        $finish
        :native_audio
        nop
    """)
}

/** Keep register operands and call result untouched while replacing only a reviewed playback ABI. */
internal fun replaceAudioCalls(method: MutableMethod, old: String, replacement: String, expected: Int) {
    val matches = method.instructions.withIndex().filter { (it.value as? ReferenceInstruction)?.reference.toString() == old }
    check(matches.size == expected) { "Changed provider audio calls in $method: expected $expected references to $old" }
    matches.reversed().forEach { (index, instruction) ->
        val call = when (instruction) {
            is RegisterRangeInstruction -> "invoke-static/range {v${instruction.startRegister} .. v${instruction.startRegister + instruction.registerCount - 1}}, $replacement"
            is FiveRegisterInstruction -> {
                val args = listOf(instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG)
                    .take(instruction.registerCount).joinToString(", ") { "v$it" }
                "invoke-static {$args}, $replacement"
            }
            else -> error("Unsupported provider playback instruction in $method")
        }
        method.replaceInstruction(index, call)
    }
}

internal fun trackProviderAudio(method: MutableMethod, parameter: Int, target: String) {
    check(method.name == "<init>")
    // R8 can reuse parameter registers later in a constructor. Track after Object initialization,
    // while p0 is an initialized reference and the constructor arguments still retain their types.
    val parent = method.instructions.withIndex().single {
        (it.value as? ReferenceInstruction)?.reference.toString() == "Ljava/lang/Object;-><init>()V"
    }.index
    method.addInstruction(parent + 1,
        "invoke-static/range {p$parameter .. p$parameter}, $PROVIDER_AUDIO->$target(Ljava/lang/Object;)V")
}
