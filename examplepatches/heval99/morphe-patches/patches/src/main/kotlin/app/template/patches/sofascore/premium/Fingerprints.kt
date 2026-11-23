package app.template.patches.sofascore.premium

import app.morphe.patcher.Fingerprint

// The premium entitlement is a single boxed Boolean, persisted on the session account
// (UserAccount) and on the server profile (ProfileData). Both classes are not obfuscated.
// On 26.11.09 (2026-11-22 audit, callers listed with dexindex xrefs) UserAccount.getHasPremium is
// read by the proto encoder, the account/profile merge (eeo.l), an account-state coroutine (ceo),
// the "Active subscription" upsell queue check (r1i.a) and a list builder that also reads
// getHasServerAds (n8m); ProfileData.getHasPremium by the sync worker (dfm). AI insights is NOT
// behind them: its readers (o27.F and sq7.get) only call the server's per-match flag
// EventHeadFlags.getAiInsights(), which this patch leaves alone, so AI insights stay as the server
// sends them. Other feature gates were not traced.
object UserAccountHasPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/sofascore/local_persistance/UserAccount;",
    name = "getHasPremium",
)

object ProfileDataHasPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/sofascore/model/profile/ProfileData;",
    name = "getHasPremium",
)
