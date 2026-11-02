package dev.hyzor.patches.duolingo.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.hyzor.patches.duolingo.shared.Constants.DUOLINGO
import dev.hyzor.patches.duolingo.shared.fieldFromToString
import dev.hyzor.patches.duolingo.shared.integrity.disableLoginIntegrityPatch
import dev.hyzor.patches.util.addInstructionsBeforeReturn
import dev.hyzor.patches.util.constructor
import dev.hyzor.patches.util.fieldByName
import dev.hyzor.patches.util.getReference
import dev.hyzor.patches.util.indexOfFirstInstructionOrThrow
import dev.hyzor.patches.util.removeFlag

private enum class PremiumVariant {
    SUPER,
    MAX,
}

/**
 * Duolingo keeps the premium decision on the device, on the signed-in `User` object:
 *
 *   `hasPlus`          the classic Super flag, serialized as `hasPlus`
 *   `subscriberLevel`  `FREE` / `LITE` / `PREMIUM` / `GOLD`, serialized as `subscriberLevel`
 *   `R0`               the computed "paid" bit (`hasPlus || …`), read by every paid helper
 *   `Q0`               the computed "MAX" bit, read by `MaxHooksUserData`
 *
 * The last two are calculated from the serialized fields rather than serialized themselves, so
 * they are located through the helpers that read them (`UserIsPaidFieldUsageFingerprint` and
 * `UserHasGoldFieldUsageFingerprint`) instead of by serializer names.
 *
 * The fields are written on the `User` instance passed to the `LoggedIn` state's constructor, so
 * only the signed-in user is affected — viewing a friend's profile keeps its real values — and
 * the values are applied every time the state is rebuilt from a fresh server user.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables app features locked behind the subscription paywall. " +
        "Some features like AI video calls may not work.",
) {
    compatibleWith(DUOLINGO)

    dependsOn(disableLoginIntegrityPatch)

    val premiumVariant by stringOption(
        key = "premiumVariant",
        default = PremiumVariant.SUPER.name,
        values = mapOf(
            "Duolingo Super" to PremiumVariant.SUPER.name,
            "Duolingo MAX" to PremiumVariant.MAX.name,
        ),
        title = "Type",
        description = "Choose which type of premium Duolingo subscription to enable.",
        required = true,
    )

    execute {
        val optionIsMax = premiumVariant == PremiumVariant.MAX.name

        val userClass = UserFingerprint.classDef
        val userType = userClass.type
        val hasPlusField = userClass.fieldFromToString("hasPlus")
        val subscriberLevelField = userClass.fieldFromToString("subscriberLevel")
        val subscriberLevel = if (optionIsMax) "GOLD" else "PREMIUM"

        // These fields are calculated in the User constructor, but not serialized, so find their
        // names through the methods that read them. The MAX bit is only needed for the MAX
        // variant, so do not fail a Super patch when that helper moves.
        val isPaidField = UserIsPaidFieldUsageFingerprint.instructionMatches.last().getFieldAccessed()
        val hasGoldField = if (optionIsMax) {
            UserHasGoldFieldUsageFingerprint.instructionMatches.last().getFieldAccessed()
        } else {
            null
        }

        // Remove final from the fields we patch.
        listOf(hasPlusField.name, subscriberLevelField.name, isPaidField.name, hasGoldField?.name)
            .filterNotNull()
            .forEach { userClass.fieldByName(it).removeFlag(AccessFlags.FINAL) }

        // Patching the User passed to LoggedIn(user) only affects the signed-in account, instead
        // of every User object (e.g. a friend's profile).
        val loggedInConstructor = LoggedInStateFingerprint.classDef.constructor

        val smali = buildList {
            add("const/4 v0, 0x1")
            add("iput-boolean v0, p1, $userType->${isPaidField.name}:Z")
            add("iput-boolean v0, p1, $userType->${hasPlusField.name}:Z")
            hasGoldField?.let { add("iput-boolean v0, p1, $userType->${it.name}:Z") }
            add("sget-object v0, ${subscriberLevelField.type}->$subscriberLevel:${subscriberLevelField.type}")
            add("iput-object v0, p1, $userType->${subscriberLevelField.name}:${subscriberLevelField.type}")
        }

        // Single-parameter constructor, so the User is always in p1, and the insertion goes right
        // before its return so the existing registers can be clobbered.
        loggedInConstructor.addInstructionsBeforeReturn(smali.joinToString("\n"))

        // The primary constructor is used when the app updates the energy config; the Kotlinx
        // serializer calls the synthetic default-args constructor instead, so patch both.
        EnergyConfigCtorFingerprint.method.addInstructions(0, "move p1, p2")
        // In the synthetic constructor p1 is the default-args mask, p2 is the current energy and
        // p3 is the maximum.
        EnergyConfigSerializationCtorFingerprint.method.addInstructions(0, "move p2, p3")

        if (optionIsMax) {
            // `SubscriptionFeatureGroup` lives on the server-side user data, so patch the places
            // that check the feature instead of the group itself.
            val features = listOf("VIDEO_CALL_IN_PATH", "VIDEO_CALL_IN_PRACTICE_HUB")
            features.forEach { feature ->
                getFeatureFingerprint(feature).matchAll().forEach { match ->
                    val resultIndex = match.instructionMatches.last().index
                    val resultReg = match.method
                        .getInstruction<OneRegisterInstruction>(resultIndex)
                        .registerA
                    match.method.addInstructions(resultIndex + 1, "const/16 v$resultReg, 0x1")
                }
            }

            // The Video Call bottom-nav entry is gated by `isEligibleFor[Secondary]Upsell`, which
            // would otherwise force the upsell purchase activity.
            val vidCallFieldStrings = listOf(
                ", isEligibleForSecondaryUpsell=",
                ", isEligibleForUpsell=",
            )

            vidCallFieldStrings.forEach { fieldStr ->
                val fingerprint = getVideoCallTabCtaButtonStateFieldFingerprint(fieldStr)
                val upsellField = fingerprint.instructionMatches.last().getFieldAccessed()
                val constructor = fingerprint.classDef.constructor

                val setFieldIndex = constructor.indexOfFirstInstructionOrThrow {
                    getReference<FieldReference>()?.name == upsellField.name
                }
                val paramReg = constructor.getInstruction<TwoRegisterInstruction>(setFieldIndex).registerA

                constructor.addInstructions(setFieldIndex, "const/16 v$paramReg, 0x0")
            }
        }
    }
}
