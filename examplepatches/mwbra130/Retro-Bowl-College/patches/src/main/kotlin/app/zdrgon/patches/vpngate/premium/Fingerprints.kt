package app.zdrgon.patches.vpngate.premium

import app.morphe.patcher.Fingerprint

/**
 * The app's single premium gate: BaseViewModel.isZeroAds(Context).
 *
 * The "remove ads" package (Play Billing day codes, 30/90/180/365 days,
 * or a redeemed GPA order id) persists entitlement in local preferences;
 * this method returns true iff the DATA-ZEROADS preference is a non-empty
 * string. Everything premium flows through it: ad loading at startup
 * (ScreenLoadingViewModel.loadAds), banner ads on the dashboard and
 * server list, the connect-dialog interstitials, and
 * ScreenDashboardViewModel.requestStartVpn, which branches on it to set
 * the VPN session time to -1 (the unlimited sentinel; free users get
 * 1800s on GP servers / 3600s on SE servers from DATA-TIMEGP/DATA-TIMESE).
 *
 * Verified against VPN Gate 20261111 (com.giamping.sevpn) by dex read:
 * the method body loads the "DATA-ZEROADS" preference via
 * Utils.loadPrefs and returns its non-emptiness; the string literal is
 * part of the fingerprint so a same-named method elsewhere cannot match.
 */
object IsZeroAdsFingerprint : Fingerprint(
    definingClass = "Lcom/giamping/sevpn/BaseViewModel;",
    name = "isZeroAds",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("DATA-ZEROADS"),
)
