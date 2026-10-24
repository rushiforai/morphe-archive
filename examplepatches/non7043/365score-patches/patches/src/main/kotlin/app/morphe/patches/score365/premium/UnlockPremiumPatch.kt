package app.morphe.patches.score365.premium

import app.morphe.patches.score365.utils.COMPATIBILITY_365SCORE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val ENTITLEMENT_STATE = "Lcom/scores365/billingClient/entitlement/EntitlementState;"
private const val REWARD_START_KEY = "iabc_fnrts"

private val FEATURE_GETTERS = setOf(
    "isPremium",
    "getAdsFree",
    "getTipster",
    "getPlus",
    "getDelayedNotifications",
    "getNotificationSounds",
)

private object EntitlementStateConstructorFingerprint : Fingerprint(
    definingClass = ENTITLEMENT_STATE,
    name = "<init>",
    returnType = "V",
    parameters = listOf("Z", "Z", "Z", "Z", "Z", "Ljava/util/Set;", "Ljava/util/List;", "J", "Z"),
)

private object RemoveAdsBasicActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/removeAds/RemoveAdsBasicActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    strings = listOf(REWARD_START_KEY),
)

/**
 * Unlocks 365Score premium features by patching the core EntitlementState methods
 * (isPremium, getAdsFree, getTipster, getPlus, getNotificationSounds, hasFeature),
 * forcing constructor entitlement flags to true, and disabling grace-period checks.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks 365Score premium/pro features (ad-free, tipster, plus, notification sounds).",
) {
    compatibleWith(*COMPATIBILITY_365SCORE)

    execute {
        EntitlementStateConstructorFingerprint.methodOrNull?.let { method ->
            method.addInstructions(
                0,
                """
                    const/16 p1, 0x1
                    const/16 p2, 0x1
                    const/16 p3, 0x1
                    const/16 p4, 0x1
                    const/16 p5, 0x1
                """.trimIndent(),
            )
        }

        val entitlementClass = mutableClassDefByOrNull(ENTITLEMENT_STATE)
        if (entitlementClass != null) {
            val getters = entitlementClass.methods.filter {
                it.name in FEATURE_GETTERS && it.returnType == "Z" && it.parameters.isEmpty() &&
                    it.implementation != null
            }
            getters.forEach { it.returnEarly(true) }

            entitlementClass.methods.filter {
                it.name == "hasFeature" && it.returnType == "Z" && it.implementation != null
            }.forEach { it.returnEarly(true) }
        }

        RemoveAdsBasicActivityOnCreateFingerprint.methodOrNull?.let { method ->
            val instructions = method.implementation!!.instructions.toList()
            val index = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == REWARD_START_KEY
            }
            if (index >= 0) {
                val register = (instructions[index] as OneRegisterInstruction).registerA
                method.replaceInstruction(index, "const-string v$register, \"morphe_disabled_$REWARD_START_KEY\"")
            }
        }
    }
}
