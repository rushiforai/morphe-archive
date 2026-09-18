package app.template.patches.monefy.premium

import app.morphe.patcher.Fingerprint

// Monefy's app code is R8-obfuscated (defpackage), so the anchors are the stable, readable
// classes: ClearCashApplication.o() is the master "is pro" check (pro-app id or the cached
// IAP flag), GeneralSettingsProvider.F() reads the cached "MONEFY_PRO_IN_APP_BOUGHT" pref
// that the RevenueCat callback writes, and zt.p() reports the subscription-expired state.
object MasterProFingerprint : Fingerprint(
    definingClass = "Lgh;",
    name = "o",
)

object ProBoughtFingerprint : Fingerprint(
    definingClass = "Lcom/monefy/helpers/GeneralSettingsProvider;",
    name = "F",
)

object SubscriptionExpiredFingerprint : Fingerprint(
    definingClass = "Lzt;",
    name = "p",
)
