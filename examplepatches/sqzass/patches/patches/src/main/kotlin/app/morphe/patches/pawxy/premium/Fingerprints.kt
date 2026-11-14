/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.pawxy.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

private const val SUBSCRIBE_STATE_CLASS =
    "Lcom/pawxy/browser/core/revenue/Subscribe\$State;"

/**
 * Fingerprints the `Subscribe$State.getState(int)` method.
 * This is the central dispatch used throughout the app to resolve a subscription
 * state integer (from billing) into the [UNSPECIFIED / PENDING / SUBSCRIBED] enum.
 * Patching it to always return SUBSCRIBED is the most reliable single-point unlock.
 */
internal object SubscribeStateGetStateFingerprint : Fingerprint(
    definingClass = SUBSCRIBE_STATE_CLASS,
    name = "getState",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = SUBSCRIBE_STATE_CLASS,
    parameters = listOf("I"),
)

/**
 * Fingerprints the SheetUpgrade subscribe button click listener (R0.onClick case 5).
 * When the upgrade/paywall sheet is shown, clicking "Subscribe" triggers a billing flow.
 * Fingerprinted by R0.onClick (defining class + name + params) plus the "trial" string
 * constant used in case 5 when comparing the billing product ID.
 * The strings "upgrade_tap_subscribe" / "billing_iap_page_tap_subscribe" from Java sources
 * were NOT found in smali, so they are not used here.
 */
internal object SubscribeButtonClickFingerprint : Fingerprint(
    definingClass = "Lcom/pawxy/browser/ui/sheet/R0;",
    name = "onClick",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    filters = listOf(string("trial")),
)

/**
 * Fingerprints the SheetVPN premium upsell / VPN ad badge visibility logic.
 * Uses the unique "wad_tag" string from the VPN sheet view binding.
 * The method sets visibility of the "PREMIUM" upsell tag based on subscribe state.
 */
internal object VpnPremiumUpsellFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(string("wad_tag")),
)
