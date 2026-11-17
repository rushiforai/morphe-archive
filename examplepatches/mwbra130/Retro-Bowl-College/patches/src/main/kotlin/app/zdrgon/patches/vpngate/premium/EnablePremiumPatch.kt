package app.zdrgon.patches.vpngate.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.vpngate.shared.Constants.COMPATIBILITY_VPN_GATE

/**
 * Enables VPN Gate premium by pinning the app's single entitlement
 * reader, BaseViewModel.isZeroAds, to true.
 *
 * Premium in this app is one switch, not two: the paid "remove ads"
 * package is also what unlocks unlimited VPN sessions, and both the ad
 * loaders and the session timer consult isZeroAds. Pinning the reader
 * therefore removes all ads (AdMob/Yandex/Vungle: startup, banners,
 * connect interstitials) and makes every connection unlimited
 * (requestStartVpn takes the vpnTime = -1 branch). The purchase and
 * redeem flows are left untouched; the app's startup server refresh can
 * rewrite the underlying preferences, but the pinned reader ignores
 * them. This is a reader pin, not a forged purchase: no order id,
 * token, or server reply is fabricated.
 *
 * Verified against VPN Gate 20261111 by dex read (see recon): branch
 * polarity at requestStartVpn confirmed from the instruction stream —
 * isZeroAds true falls through to setVpnTime(-1).
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable premium",
    description = "Enables premium: removes all ads and unlocks unlimited VPN session time " +
        "(free sessions are capped at 30 to 60 minutes). VPN Gate 20261111 only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_VPN_GATE)

    execute {
        IsZeroAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
