package app.template.patches.beeper.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BEEPER
import app.template.patches.shared.addInstructionsAtControlFlowLabelChecked
import app.template.patches.shared.addInstructionsChecked
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// Beeper's account limits come from the backend: the SDK parses "max-accounts" and
// "max-accounts-per-bridge" from a JSON config into two Integer flows, ChatAccountList turns them
// into ChatAccountListState.canAddAccount / maxAccountsPerBridge, and ChatAccountsRepo derives the
// remaining-accounts counters from the same value. -1 is the app's own "unlimited" value.

/**
 * Forces a server cap parsed after the const-string [key] to -1. The parse is the first one-argument
 * static call returning Integer (the JSON element's intOrNull) followed by move-result-object.
 * With [atBoxing] the value is forced where the SDK boxes the final int with Integer.valueOf(I), so
 * the field's built-in defaults (used when the server omits the key) become -1 too; otherwise the
 * parsed Integer itself is replaced, and an omitted key already means "unlimited" (null).
 */
private fun MutableMethod.forceParsedCap(key: String, atBoxing: Boolean) {
    val instructions = implementation!!.instructions.toList()
    val keyIndex = instructions.indexOfFirst {
        it.opcode == Opcode.CONST_STRING && ((it as ReferenceInstruction).reference as StringReference).string == key
    }
    if (keyIndex < 0) throw PatchException("Enable Premium: \"$key\" not found in $definingClass->$name")
    val callIndex = (keyIndex + 1 until minOf(keyIndex + 16, instructions.size)).firstOrNull { i ->
        val ref = (instructions[i] as? ReferenceInstruction)?.reference as? MethodReference
        instructions[i].opcode == Opcode.INVOKE_STATIC && ref != null &&
            ref.returnType == "Ljava/lang/Integer;" && ref.parameterTypes.size == 1
    } ?: throw PatchException("Enable Premium: no Integer parse after \"$key\" in $definingClass->$name")
    val move = instructions.getOrNull(callIndex + 1)
    if (move == null || move.opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("Enable Premium: parse after \"$key\" has no move-result-object in $definingClass->$name")
    }
    if (!atBoxing) {
        val register = (move as OneRegisterInstruction).registerA
        addInstructionsChecked(
            callIndex + 2,
            """
                const/4 v$register, -0x1
                invoke-static {v$register}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                move-result-object v$register
            """.trimIndent(),
        )
        return
    }
    val boxIndex = (callIndex + 2 until minOf(callIndex + 24, instructions.size)).firstOrNull { i ->
        val ref = (instructions[i] as? ReferenceInstruction)?.reference as? MethodReference
        instructions[i].opcode == Opcode.INVOKE_STATIC && ref?.name == "valueOf" &&
            ref.definingClass == "Ljava/lang/Integer;" && ref.parameterTypes.map(CharSequence::toString) == listOf("I")
    } ?: throw PatchException("Enable Premium: no Integer.valueOf(I) after the \"$key\" parse in $definingClass->$name")
    val register = (instructions[boxIndex] as FiveRegisterInstruction).registerC
    addInstructionsAtControlFlowLabelChecked(boxIndex, "const/4 v$register, -0x1")
}
// The per-feature allowances (incognito, reminders, scheduled messages, labels, transcription,
// blasts) are "freebies". Their local counters are advanced by one suspend function with this
// shape, which also asks the server to consume the freebie. The class is R8-renamed, so the method
// is found by its parameter list and must match exactly once.
private const val FREEBIE = "Lcom/beeper/freebies/FreebiesRepository\$Freebie;"

private fun Method.isFreebieConsumer() =
    returnType == "Ljava/lang/Object;" &&
        implementation != null &&
        parameterTypes.map(CharSequence::toString) == listOf(
            FREEBIE,
            "Lcom/beeper/freebies/FreebiePromptSurface;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/jvm/internal/ContinuationImpl;",
        )

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Lifts the account limits and the free-tier usage limits.",
) {
    compatibleWith(COMPATIBILITY_BEEPER)

    execute {
        // 1. The parsed server caps become -1 (the app's own "unlimited" value): the SDK's two cap flows
        //    (total and per bridge) that decide canAddAccount, and the repo's remaining-accounts counter.
        SdkAccountCapsFingerprint.method.apply {
            forceParsedCap("max-accounts", atBoxing = true)
            forceParsedCap("max-accounts-per-bridge", atBoxing = true)
        }
        RepoAccountCapFingerprint.method.forceParsedCap("max-accounts", atBoxing = false)

        // 2. Freebie consumption: return the Kotlin Unit instance the method itself returns, so the
        //    app's local counter stays at zero and no consume request is sent.
        val consumerTypes = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.methods.any { it.isFreebieConsumer() }) consumerTypes += classDef.type
        }
        if (consumerTypes.size != 1) {
            throw PatchException("Enable Premium: found ${consumerTypes.size} freebie consumers, expected 1: $consumerTypes")
        }
        val consumer = mutableClassDefBy(consumerTypes.single()).methods.single { it.isFreebieConsumer() }
        // The Unit field is a self-typed singleton the method loads with sget-object and later returns
        // through the same register (the coroutine-suspended marker is excluded); the R8-renamed field
        // is never named here.
        val consumerInsns = consumer.implementation!!.instructions.toList()
        val unitCandidates = consumerInsns.indices.mapNotNull { i ->
            val get = consumerInsns[i]
            if (get.opcode != Opcode.SGET_OBJECT) return@mapNotNull null
            val field = (get as ReferenceInstruction).reference as FieldReference
            val register = (get as OneRegisterInstruction).registerA
            val returned = consumerInsns.drop(i + 1).any {
                it.opcode == Opcode.RETURN_OBJECT && (it as OneRegisterInstruction).registerA == register
            }
            if (returned && field.type == field.definingClass &&
                field.definingClass != "Lkotlin/coroutines/intrinsics/CoroutineSingletons;"
            ) field else null
        }.distinct()
        if (unitCandidates.size != 1) {
            throw PatchException("Enable Premium: ${consumer.definingClass}->${consumer.name} has ${unitCandidates.size} candidate Unit instances: $unitCandidates")
        }
        val unit = unitCandidates.single()
        consumer.addInstructionsChecked(
            0,
            """
                sget-object v0, ${unit.definingClass}->${unit.name}:${unit.type}
                return-object v0
            """.trimIndent(),
        )
    }
}
