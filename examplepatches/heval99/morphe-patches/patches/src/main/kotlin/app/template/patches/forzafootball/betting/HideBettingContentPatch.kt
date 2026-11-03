package app.template.patches.forzafootball.betting

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.forzafootball.shared.booleanFieldAfterLabel
import app.template.patches.forzafootball.shared.forceBooleanInConstructors
import app.template.patches.shared.Constants.COMPATIBILITY_FORZA_FOOTBALL

@Suppress("unused")
val hideBettingContentPatch = bytecodePatch(
    name = "Hide betting content",
    description = "Hides gambling ads and betting content.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FORZA_FOOTBALL)

    execute {
        // Betting stores optedOut = true in every constructor (including copy() and the
        // deserializer), as if the user had turned on "Opt out of gambling ads". Betting is then
        // never allowed: no betting ad targeting, betting flows or age-gate prompt.
        val betting = BettingToStringFingerprint.match()
        forceBooleanInConstructors(
            betting.booleanFieldAfterLabel(OPTED_OUT_LABEL),
            value = true,
            what = "Hide betting content",
        )
    }
}
