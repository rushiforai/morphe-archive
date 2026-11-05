package com.torbenstriegel.morphe.patches.ntv.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.torbenstriegel.morphe.patches.shared.Constants.COMPATIBILITY_NTV

/**
 * Unlocks ntv Plus / Premium features (ad-free, premium content, menu
 * sections) on de.lineas.lit.ntv.android.
 *
 * ## Architecture (verified on 8.5.7.1, versionCode 586)
 *
 * ntv has a clean, NON-obfuscated billing layer under `de.ntv.billing.*`
 * with clear choke points that all feature gates go through:
 *
 *   - `Billing.hasPurSubscription()Z` (public static final) — central
 *     "premium" check. Consumers: MainActivity (menu), NavigationViewModel
 *     (rubric enablement), BillingViewModel (showPurchaseUi + own check),
 *     PrivacyCenter (vendor consent), NtvApplication (consent init),
 *     BasicArticleItemView (content). Forcing this to `true` gives premium
 *     everywhere it gates.
 *   - `Billing.isAdsFree$lib_base_release()Z` (public final) — ad-free check
 *     used by AdvertisingHelper.prepareRequest, all ad item views
 *     (AppNext/EmsBanner/NativeAd), SectionListAdapter (ad slots between
 *     articles), MenuActivity, HandsetFetchFeed. The method already contains
 *     debug-simulation switches (`DebugSettings.simulateAdsFree`) — a
 *     built-in precedent that this exact value can be forced.
 *   - `BillingViewModel.getShowPurchaseUi()Z` — whether the paywall UI is
 *     offered; it consults hasPurSubscription internally, so it falls in
 *     line once the two central checks return true.
 *
 * Patch approach: inject `const/4 v0, 0x1 / return v0` at the start of the
 * two central checks (hasPurSubscription + isAdsFree). Both return `Z`, so
 * the smali is register-safe at position 0. BillingViewModel.hasPurSubscription
 * (3 insns) delegates to Billing.hasPurSubscription and needs no separate
 * patch.
 *
 * ## Runtime note (2026-10-10)
 *
 * Do NOT use the 1.15.1 patcher runtime (deletes patched classes from the
 * DEX -> ClassCastException/NoClassDefError on start). Verified flow:
 * build the MPP with the local toolchain, apply with morphe-patcher 1.14.1
 * (wr_runner), re-add missing j$-desugar classes.dex as classes3.dex if the
 * APK uses Java-8 core library desugaring, sign, test on device via ADB.
 */
private val HasPurSubscriptionFingerprint = Fingerprint(
    definingClass = "Lde/ntv/billing/Billing;",
    name = "hasPurSubscription",
    returnType = "Z",
)

private val IsAdsFreeLegacyFingerprint = Fingerprint(
    definingClass = "Lde/ntv/billing/Billing;",
    name = "isAdsFree\$lib_base_release",
    parameters = emptyList(),
    returnType = "Z",
)

private val IsAdsFreeFingerprint = Fingerprint(
    definingClass = "Lde/ntv/billing/Billing;",
    name = "isAdsFree\$lib_base",
    parameters = emptyList(),
    returnType = "Z",
)

@Suppress("unused")
val ntvPremiumPatch = bytecodePatch(
    name = "Unlock ntv Plus",
    description = "Unlocks ntv Plus premium features (ad-free, premium " +
        "content) by forcing the subscription state to active.",
) {
    compatibleWith(COMPATIBILITY_NTV)

    execute {
        HasPurSubscriptionFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """.trimIndent())
        (IsAdsFreeFingerprint.methodOrNull ?: IsAdsFreeLegacyFingerprint.method).addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """.trimIndent())
    }
}