package app.template.patches.truecaller.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.BuilderSwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val GOLD = "$PREMIUM_TIER_TYPE->GOLD:$PREMIUM_TIER_TYPE"

// PremiumFeature constants (kept enum) that only work through Truecaller's servers.
private val SERVER_BACKED_FEATURES = listOf("CALL_ASSISTANT", "FAMILY_SHARING")

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks premium features. Server features like Who viewed me stay locked.",
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // 1. Stored tier: GOLD instead of the "premiumLevel" pref.
        PremiumTierFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, $GOLD
                return-object v0
            """,
        )

        // 2. Stored premium flag: never expired.
        IsPremiumFingerprint.method.returnEarly(true)

        // 3. Every availableFeatures status check reports INCLUDED.
        FeatureStatusIncludedFingerprint.method.returnEarly(true)

        // 4. isFeatureAvailable(feature, refresh). This also skips the server's
        // "disabledPremiumFeatures" kill-switch list, which is read in the same method; forcing
        // only the availability half would need an R8-shaped mid-method edit. CALL_ASSISTANT and
        // FAMILY_SHARING return false at once instead of falling through to the stock check:
        // both only work through Truecaller's servers, and the forced premium state would make
        // the stock check offer them anyway. A forced Call Assistant would also let users pick
        // "Assistant" for spam calls, which then ring through. The stock check stays below the
        // early returns, unreached.
        val premiumFeature = classDefBy(PREMIUM_FEATURE)
        for (feature in SERVER_BACKED_FEATURES) {
            if (premiumFeature.staticFields.none { it.name == feature && it.type == PREMIUM_FEATURE }) {
                throw PatchException("$PREMIUM_FEATURE has no $feature")
            }
        }
        FeatureAvailableFingerprint.method.apply {
            // p1 is the feature; v0 is a local the method writes before reading.
            addInstructionsWithLabelsChecked(
                0,
                SERVER_BACKED_FEATURES.joinToString("\n") { feature ->
                    """
                        sget-object v0, $PREMIUM_FEATURE->$feature:$PREMIUM_FEATURE
                        if-eq p1, v0, :server_backed
                    """
                } + """
                    const/4 v0, 0x1
                    return v0
                    :server_backed
                    const/4 v0, 0x0
                    return v0
                """,
            )
        }

        // 5. PremiumState(isPremium, tier, ...): whatever the store or a sync hands in, the state
        // the premium UI observes is premium GOLD. The constructor has no locals, so p1/p2 are
        // low registers; const/16 and sget-object take any register below 256 anyway.
        PremiumStateConstructorFingerprint.method.addInstructions(
            0,
            """
                const/16 p1, 0x1
                sget-object p2, $GOLD
            """,
        )

        // 6. The subscription status worker returns a work Result before building the
        // "subscription expired" notification. Success needs an output Data in this build, so
        // the no-arg Failure is used unless Success gains a no-arg constructor; for this one-shot,
        // push-triggered worker either result only ends the run.
        val success = WorkResultSuccessToStringFingerprint.originalClassDef
        val failure = WorkResultFailureToStringFingerprint.originalClassDef
        if (success.superclass != failure.superclass) {
            throw PatchException("Work Result classes ${success.type} / ${failure.type} do not share a base class")
        }
        val result = success.takeIf { cls ->
            cls.methods.any { it.name == "<init>" && it.parameterTypes.isEmpty() }
        } ?: failure
        if (result.methods.none { it.name == "<init>" && it.parameterTypes.isEmpty() }) {
            throw PatchException("${result.type} has no no-arg constructor")
        }
        SubscriptionStatusWorkerFingerprint.method.apply {
            // doWork already produces this Result type on its own paths; do not guess otherwise.
            val producesResult = implementation!!.instructions.any { instruction ->
                when (val reference = (instruction as? ReferenceInstruction)?.reference) {
                    is TypeReference -> reference.type == result.type
                    is MethodReference -> reference.returnType == result.type
                    else -> false
                }
            }
            if (!producesResult) throw PatchException("$definingClass.doWork no longer returns ${result.type}")
            addInstructions(
                0,
                """
                    new-instance v0, ${result.type}
                    invoke-direct {v0}, ${result.type}-><init>()V
                    return-object v0
                """,
            )
        }

        // 7. Premium status sync: return Unit before the server's status is stored. The writer
        // ends with a PremiumStatusUpdate event that counts "stored isPremium (forced above) and
        // the server says expired" as a lost subscription, so every sync reset Max spam
        // protection to Basic, turned off the premium blocking options and the call blocking
        // method, re-enabled ads and posted "Your subscription has expired". The premium getters
        // are forced, and without a stored availableFeatures list the feature manager falls back
        // to the built-in list for the (forced) GOLD tier.
        val unit = classDefBy("Lkotlin/Unit;").staticFields.firstOrNull { it.type == "Lkotlin/Unit;" }
            ?: throw PatchException("kotlin.Unit has no singleton field")
        PremiumStatusWriterFingerprint.method.addInstructions(
            0,
            """
                sget-object p0, Lkotlin/Unit;->${unit.name}:Lkotlin/Unit;
                return-object p0
            """,
        )

        // 8. Premium tab (#77): with the forced isPremium (step 2) the tab's state chooser built the
        // Entitled screen (subscription management), whose view model expects a real subscription
        // and crashed on the server's FREE data. Only in that chooser the isPremium result reads
        // false right after its move-result, so the tab builds the Paywall state (the plans) as on
        // a stock free account. Every other isPremium reader keeps the forced true.
        val entitled = PremiumTabEntitledStateToStringFingerprint.originalClassDef.type
        val paywall = PremiumTabPaywallStateToStringFingerprint.originalClassDef.type
        val isPremium = IsPremiumFingerprint.originalMethod
        PremiumTabScreenStateFingerprint.method.apply {
            val code = implementation!!
            val instructions = code.instructions.toList()
            for (state in listOf(entitled, paywall)) {
                val builds = instructions.any {
                    it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == state
                }
                if (!builds) throw PatchException("$definingClass.$name no longer builds the Premium tab state $state")
            }
            val calls = instructions.indices.filter { index ->
                val call = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                call != null && call.definingClass == isPremium.definingClass && call.name == isPremium.name &&
                    call.parameterTypes.isEmpty() && call.returnType == "Z"
            }
            val call = calls.singleOrNull()
                ?: throw PatchException("$definingClass.$name calls isPremium ${calls.size} times, expected 1")
            val moveResult = instructions.getOrNull(call + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT } as? OneRegisterInstruction
                ?: throw PatchException("$definingClass.$name: no move-result after the isPremium call")
            // The branch after the move-result carries the try block's end label, so the shared
            // requireNoBranchTargetAt guard (any label) does not fit; a jump there would skip the insert.
            val jumpTargets = instructions.flatMap { instruction ->
                when (instruction) {
                    is BuilderOffsetInstruction -> listOf(instruction.target)
                    is BuilderSwitchPayload -> instruction.switchElements.map { it.target }
                    else -> emptyList()
                }
            } + code.tryBlocks.flatMap { block -> block.exceptionHandlers.map { it.handler } }
            if (jumpTargets.any { it.location.index == call + 2 }) {
                throw PatchException("$definingClass.$name: the instruction after the isPremium move-result is a jump target")
            }
            // const/16 takes any register below 256.
            addInstructionChecked(call + 2, "const/16 v${moveResult.registerA}, 0x0")
        }
    }
}
