package app.smartlife.patches.smartlife.ad

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.smartlife.patches.smartlife.shared.localRegisterCount
import app.smartlife.patches.smartlife.shared.logWarning
import app.smartlife.patches.smartlife.shared.matchAllLogged
import app.smartlife.patches.smartlife.shared.signature

/** Make every method [fingerprint] matches return null. @return how many were patched. */
private fun BytecodePatchContext.returnNull(fingerprint: Fingerprint, label: String): Int {
    var patched = 0
    matchAllLogged(fingerprint, label, expectUnique = true).forEach { match ->
        val method = match.method
        if (localRegisterCount(method) < 1) {
            logWarning("$label ${method.signature}: no free register, not patched")
            return@forEach
        }
        method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
        patched++
    }
    if (patched == 0) logWarning("$label not patched: AdMob ads may still be shown")
    return patched
}

/**
 * Bytecode half of "Hide ads": stops the AdMob native ad above the home "favorites" cards.
 *
 * That ad does not depend on any flag the resource half can turn off (is_admob_support is not
 * read on this path) nor on a home_fragment_new.json entry: the home.adv card list adds the ad
 * card in code and shows it whenever AbsAdMobService is registered and the server's ad strategy
 * fills the slot. So it is stopped in code, at two points:
 *
 * 1. the home ad card's data source returns no data, so the card is not created at all
 *    (no empty gap is left where the ad was), and
 * 2. the advertisement service no longer finds the AdMob service, so it creates no AdMob slot
 *    for any page (home, the DPC marketing card, profile) and reports the legacy ad type.
 *
 * Not shown to users; "Hide ads" depends on it.
 */
internal val adSlotsBytecodePatch = bytecodePatch(
    description = "Stops the AdMob native ad slots on the home and profile screens.",
) {
    execute {
        returnNull(HomeAdvertisementQueryFingerprint, "Home ad card data source")
        returnNull(AdMobServiceLookupFingerprint, "AdvertisementService AdMob lookup")
    }
}
