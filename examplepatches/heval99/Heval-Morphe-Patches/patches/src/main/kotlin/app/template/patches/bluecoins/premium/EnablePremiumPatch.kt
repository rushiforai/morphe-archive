package app.template.patches.bluecoins.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BLUECOINS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the premium version (removes ads and lifts premium limits)."
) {
    compatibleWith(COMPATIBILITY_BLUECOINS)

    execute {
        // Every premium check collects one Flow<Boolean?>: the encrypted "premiumKey" pref
        // -> salted-value verification (step 1) -> [13.1.149+] combine with the Google Play
        // "versionOverride" pref (step 2) -> screens. 13.1.149 renames all kotlinx.coroutines
        // types, so a constant flowOf(TRUE) can no longer be built by name; instead the value
        // is forced to TRUE at the stages that produce it. Both run on every emission, so
        // premium holds on every launch and after any purchase-state refresh rewrites the
        // prefs, without touching the encrypted storage or the billing client.

        // ── 1. Salted premium verification: emit TRUE downstream ───────────────────────
        // The downstream collector call is the only invoke-interface after the log line with
        // the same name and shape as the emitter itself (FlowCollector.emit, R8-renamed or
        // not). Overwrite its value register with Boolean.TRUE just before the call.
        val emitMethod = PremiumStateEmitFingerprint.method
        val logIndex = PremiumStateEmitFingerprint.instructionMatches.first().index
        val instructions = emitMethod.implementation!!.instructions
        val emitIndex = (logIndex + 1 until instructions.size).firstOrNull { index ->
            val instruction = instructions[index]
            if (instruction.opcode != Opcode.INVOKE_INTERFACE &&
                instruction.opcode != Opcode.INVOKE_INTERFACE_RANGE
            ) return@firstOrNull false
            val call = (instruction as ReferenceInstruction).reference as MethodReference
            call.name == emitMethod.name &&
                call.returnType == emitMethod.returnType &&
                call.parameterTypes.map(CharSequence::toString) ==
                emitMethod.parameterTypes.map(CharSequence::toString)
        } ?: error("Bluecoins: downstream emit not found after the premium state log")

        val emitCall = instructions[emitIndex]
        // An inserted instruction is skipped by branches that target the call itself.
        if ((emitCall as BuilderInstruction).location.labels.isNotEmpty()) {
            error("Bluecoins: premium emit call is a branch target; patch would be bypassed")
        }
        val valueRegister = when (emitCall) {
            is FiveRegisterInstruction -> emitCall.registerD
            is RegisterRangeInstruction -> emitCall.startRegister + 1
            else -> error("Bluecoins: unexpected emit call format ${emitCall.opcode}")
        }
        emitMethod.addInstructions(
            emitIndex,
            "sget-object v$valueRegister, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;",
        )

        // ── 2. Google Play version override combine → TRUE (13.1.149+) ──────────────────
        // A non-null override (the "Google Play version override" setting, "standard" or
        // "premium") beats the salted state, so the combine lambda itself must return TRUE. 13.1.79 has no override; when the use
        // case reads "versionOverride" the combine anchor is mandatory and fails loudly.
        if (PremiumUseCaseFingerprint.methodOrNull != null) {
            PremiumOverrideCombineFingerprint.method.addInstructions(
                0,
                """
                    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    return-object p1
                """,
            )
        }
    }
}
