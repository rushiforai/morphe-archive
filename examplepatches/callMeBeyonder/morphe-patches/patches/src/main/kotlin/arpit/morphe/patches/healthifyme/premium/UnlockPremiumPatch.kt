package arpit.morphe.patches.healthifyme.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import arpit.morphe.patches.healthifyme.shared.Constants.COMPATIBILITY_HEALTHIFYME
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description =        "Unlocks premium and freemium features in the app, including the full macro " +
        "and micronutrient breakdown for food items and the dashboard freemium card locks, " +
        "locked-state CTAs (e.g. \"Unlock Macros\"), and the expired-trial tag chips. " +
        "Server-delivered content such as diet plans, coaching, and AI features may still " +
        "require a real subscription.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HEALTHIFYME)

    execute {
        //
        // Target 1 — premium flags (BaseProfile, `Lcom/healthifyme/base/utils/a0;`).
        //
        // `isPremiumUser()` (`isOnTrial() || isPaidUser()`) gates the ≈40 premium UI
        // surfaces; `isPaidUser()` is also read directly by some flows (`DpUtils`).
        // Both are pure local SharedPreferences reads, so forcing `true` flips every
        // UI gate; a server profile refetch only overwrites the stored preference,
        // never these methods. Returning before the `isOnTrial()` call is safe —
        // the forced `true` covers both branches of the original expression.
        //
        BaseProfileIsPremiumUserFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        BaseProfileIsPaidUserFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        //
        // Target 2 — freemium feature locks (`FeatureConfig.getLocked()`).
        //
        // Covers all six server-configured freemium features (`food_tracking`, `pfcf`,
        // `snap`, `active_choices`, `ria`, `timeline_insight`): the getter is read
        // locally by the dashboard/assistant consumers, so forcing `false` unlocks the
        // UI regardless of the cached payload.
        //
        FeatureConfigIsLockedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        //
        // Target 6 — freemium locked-state payload (`FeatureConfig.getLockedStateInfo()`).
        //
        // The new-generation dashboard does not gate the CTA on `getLocked()`: it builds
        // `NutritionTrackerData.Pfcf.lockedCta` from `locked_state_info.cta_button_config`
        // whenever the payload exists (`NewGenTrackersHelper.m48003v()`), and the Compose
        // nutrition card draws the "Unlock Macros" pill whenever that CTA is non-null.
        // Nulling this getter removes the pill (and the equivalent locked banners/CTAs
        // for Ria, active choices, and timeline insights) while keeping the rest of the
        // config intact.
        //
        FeatureConfigLockedStateInfoFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        //
        // Target 7 — freemium tag chip (`FeatureConfig.getTagButtonInfo()`).
        //
        // The dashboard renders the tag as the "Free trial Expired" / "Premium Feature"
        // chip (`FreemiumDivider(pfcf.getFreemiumTag())`); nulling the getter drops the
        // expired-trial chip without touching the card content.
        //
        FeatureConfigTagButtonInfoFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        //
        // Target 8 — dashboard "Free Trial Expired" status chip
        // (`NextGenDashboardResponseItem.getUserStatusTag()`).
        //
        // The header chip is dashboard_v3 server config (`user_state_tag_info`), separate
        // from the freemium `FeatureConfig` payload. `DashboardResponseUseCase` maps it to
        // a `FreemiumHeader`; returning `null` drops the chip and its paywall deeplink
        // while leaving the profile header, tabs, and tracker cards unchanged.
        //
        NextGenDashboardUserStatusTagFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        //
        // Target 9 — Ria insight page locked state (`UiModelV3.getShouldShowLockState()`).
        //
        // The "Today's Insights" page forwards this one flag into every insight card
        // holder (macro, micro, foods, meal suggestions, charts). The server payload marks
        // the account locked after the trial, which renders the "Detailed Premium
        // Analysis", "Unlock All Micronutrients", and "out of free Suggestions" variants.
        // Forcing the flag `false` selects the unlocked card variants instead.
        //
        RiaInsightShouldShowLockStateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        //
        // Target 10 — "All Nutrients" screen lock (`AllNutrientsViewModel.K()`).
        //
        // The detail screen builds its adapter unlocked but, 450 ms after binding, flips it
        // to locked when this getter is `true`: `NutrientsAdapter` then blurs every row after
        // position 0 and the screen shows its upgrade footer. The getter is a local
        // preference read (`!FaPreference.B1()`), so forcing it `false` leaves the adapter
        // unlocked and skips the footer, with all nutrient values readable.
        //
        AllNutrientsLockedStateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        //
        // Target 11 — "Today's Logs" timeline food card (`TimelineFood`).
        //
        // The meal card draws a "Premium" divider from `freemiumTag` and blurs the four
        // PFCF values when `freemiumLocked` is true. Both are plain model getters read only
        // by `TimelineFoodCard`, so forcing the flag `false` and the tag `null` unlocks the
        // macro values and drops the divider while leaving the card content untouched.
        //
        TimelineFoodFreemiumLockedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        TimelineFoodFreemiumTagFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        //
        // Target 4 — food-item micronutrient lock (`MicroNutrientsLockInfo.getIsLocked()`).
        //
        // The single gate behind the "Unlock micronutrient breakdown with HealthifyTrack+"
        // overlay and the 4-of-5 micro-value blanking in both food quantity pickers.
        // Forcing `false` removes the overlay and renders all five micronutrients.
        //
        val micronutrientsLockGetter = MicroNutrientsIsLockedFingerprint.method

        // The hunt found exactly two readers of this getter (`FoodQuantityPickerFragment`
        // and `OnlineFoodQuantityPickerFragment$Companion`). Fail loudly if that changes,
        // so a future build cannot silently keep a lock path unpatched.
        val callSites = countCallSitesOf(micronutrientsLockGetter)
        check(callSites == 2) {
            "Expected the micronutrient lock getter to have exactly 2 call sites, " +
                "found $callSites."
        }

        micronutrientsLockGetter.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        //
        // Target 5 — dashboard freemium card lock.
        //
        // `FoodTrackerCardView` locks the dashboard food card on
        // `Profile.isFreemiumUser() && FreemiumLockStateConfigPref.shouldShowLockState()`:
        // the lock icon replaces the add button and the card tap is redirected to the
        // server's `lock_icon_cta_url` instead of opening the tracker. `shouldShowLockState`
        // and the separate PFCF lock (`PfcfLockInfo.isLocked`) both come from the dashboard
        // `food_card_states` payload, so they are the server-controlled halves of the gate.
        //
        // Forcing both lock getters `false` removes the locked branches. `isFreemiumUser`
        // is additionally forced `false` so the other `isFreemiumUser()`-gated freemium
        // branches (food logs, quick track, snap eligibility, timeline cards) take their
        // non-freemium path; that also flips the `is_user_freemium` analytics label to
        // "false" (see the fingerprint doc).
        //
        BaseProfileIsFreemiumUserFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        FoodCardStatesShouldShowLockStateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        PfcfLockInfoIsLockedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}

/**
 * Counts instructions across all app classes that invoke [reference].
 */
private fun BytecodePatchContext.countCallSitesOf(reference: MethodReference): Int {
    var callSites = 0
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            method.implementation?.instructions?.forEach { instruction ->
                if (instruction is ReferenceInstruction) {
                    val target = instruction.reference
                    if (target is MethodReference &&
                        target.definingClass == reference.definingClass &&
                        target.name == reference.name &&
                        target.returnType == reference.returnType &&
                        target.parameterTypes == reference.parameterTypes
                    ) {
                        callSites++
                    }
                }
            }
        }
    }
    return callSites
}
