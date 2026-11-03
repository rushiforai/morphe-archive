package app.template.patches.forzafootball.ads

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.forzafootball.shared.booleanFieldAfterLabel
import app.template.patches.forzafootball.shared.forceBooleanInConstructors
import app.template.patches.forzafootball.shared.returnUnit
import app.template.patches.shared.Constants.COMPATIBILITY_FORZA_FOOTBALL

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads.",
) {
    compatibleWith(COMPATIBILITY_FORZA_FOOTBALL)

    execute {
        // 1. Every ad slot's load returns Unit before it requests anything, so the slot stays idle
        // and its collector waits for the next state change. The next-gen GMA SDK still
        // initialises: it throws on almost every call without init (rule 9).
        AdOpportunityLoadFingerprint.method.returnUnit()

        // 2. Prebid stays off: AdsSettings stores prebidEnabled = false in every constructor, so
        // no header-bidding request goes out either. subscriptionActive is not touched.
        val adsSettings = AdsSettingsToStringFingerprint.match()
        forceBooleanInConstructors(
            adsSettings.booleanFieldAfterLabel(PREBID_ENABLED_LABEL),
            value = false,
            what = "Disable ads",
        )
    }
}
