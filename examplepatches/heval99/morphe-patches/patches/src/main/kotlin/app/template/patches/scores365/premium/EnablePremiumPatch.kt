package app.template.patches.scores365.premium

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_365SCORES
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val ENTITLEMENT_STATE = "Lcom/scores365/billingClient/entitlement/EntitlementState;"
private const val REWARD_START_KEY = "iabc_fnrts"

// Every reader outside the class goes through these (no direct field reads); isPremium() is
// adsFree || tipster || plus on the fields.
private val FEATURE_GETTERS = setOf(
    "isPremium",
    "getAdsFree",
    "getTipster",
    "getPlus",
    "getDelayedNotifications",
    "getNotificationSounds",
)

// The purchase gateway's entries are mapped into one EntitlementState(adsFree, tipster, plus,
// delayedNotifications, notificationSounds, rawFeatures, activePurchases, updatedAt, gracePeriod).
// Most instances come from its constructor (EMPTY, copy(), the gateway mapper), but the startup
// cache (SharedPreferences "365scores_entitlement" / "entitlement_cache_v1") is read with
// Gson.fromJson, which allocates the object without calling any constructor and restores the
// stored flags. So the feature getters are forced as well; the constructor change keeps the
// fields, equals() and the persisted cache consistent with them.
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks premium features."
) {
    compatibleWith(COMPATIBILITY_365SCORES)

    execute {
        EntitlementStateConstructorFingerprint.method.addInstructionsChecked(
            0,
            """
                const/16 p1, 0x1
                const/16 p2, 0x1
                const/16 p3, 0x1
                const/16 p4, 0x1
                const/16 p5, 0x1
            """,
        )

        val getters = mutableClassDefBy(ENTITLEMENT_STATE).methods.filter {
            it.name in FEATURE_GETTERS && it.returnType == "Z" && it.parameters.isEmpty() &&
                it.implementation != null
        }
        val missing = FEATURE_GETTERS - getters.map { it.name }.toSet()
        if (missing.isNotEmpty()) throw PatchException("$ENTITLEMENT_STATE is missing $missing")
        getters.forEach { it.returnEarly(true) }

        // With isPremium() forced, the entitlement sync takes its "premium but billing has no
        // purchase" branch and starts a grace period, which stores the current time under
        // "iabc_fnrts". The Remove ads screen then ignores adsFree and shows the purchase screen.
        // Reading the key under another name yields the default 0, so it shows the ad-free
        // confirmation instead.
        RemoveAdsBasicActivityOnCreateFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val index = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == REWARD_START_KEY
            }
            if (index < 0) throw PatchException("RemoveAdsBasicActivity.onCreate no longer reads \"$REWARD_START_KEY\"")
            val register = (instructions[index] as OneRegisterInstruction).registerA
            replaceInstruction(index, "const-string v$register, \"morphe_disabled_$REWARD_START_KEY\"")
        }
    }
}
