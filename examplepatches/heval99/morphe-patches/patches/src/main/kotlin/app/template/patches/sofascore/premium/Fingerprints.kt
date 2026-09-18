package app.template.patches.sofascore.premium

import app.morphe.patcher.Fingerprint

// The premium entitlement is a single boxed Boolean, persisted on the session account
// (UserAccount) and on the server profile (ProfileData). Both classes are not obfuscated
// and every premium gate in the app (AI insights, subscription screens, upsell checks)
// reads one of these two getters, so forcing them covers the whole client surface.
object UserAccountHasPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/sofascore/local_persistance/UserAccount;",
    name = "getHasPremium",
)

object ProfileDataHasPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/sofascore/model/profile/ProfileData;",
    name = "getHasPremium",
)
