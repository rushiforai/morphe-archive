package dev.hyzor.patches.sleep.premium

import app.morphe.patcher.patch.bytecodePatch
import dev.hyzor.patches.sleep.shared.Constants.SLEEP
import dev.hyzor.patches.util.returnEarly

/**
 * Sleep as Android keeps its entitlement entirely on the device:
 *
 *   Google Play Billing -> local SHA1withRSA check of Play's purchase signature
 *       -> PreferencesUtils.storeBillStatus() -> SharedPreferences "TVF"/"BS" == 42
 *       -> TrialFilter.refresh() -> isTrial = false
 *
 * There is no server-issued licence, the persisted flag is a bare long with no MAC,
 * and a failed Play query is treated as "keep whatever we have". The cheapest
 * reliable hook is therefore the final decision itself.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Sleep as Android Premium. Tap Wait I already Paid when Prompted",
    default = true,
) {
    compatibleWith(SLEEP)

    execute {
        // The whole paywall. isTrialExpired() calls this, so it falls out for free.
        IsTrialFingerprint.method.returnEarly(false)

        // Belt and braces: the drawer/unlock UI reads hasUnlock(), and the periodic
        // Play re-query is skipped only when hasUnlock() && isUnlockAcked().
        HasUnlockFingerprint.method.returnEarly(true)
        IsUnlockAckedFingerprint.method.returnEarly(true)

        // Re-signing makes checkOurSignature() fail, which paints an "unknown signature"
        // warning strip over the trial UI. Claim our own signature instead.
        IsOurSignatureFingerprint.methodOrNull?.returnEarly(true)

        // A sideloaded build has no installer package, so TrialFilter marks it as
        // "unknown source": pirate icon in the drawer, and the AI assistant refuses to
        // start. Present as a store install.
        IsUnknownSourceFingerprint.methodOrNull?.returnEarly(false)
    }
}
