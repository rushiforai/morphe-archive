package app.template.patches.forzafootball.betting

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

internal const val OPTED_OUT_LABEL = ", optedOut="

// The Betting data class (6.15.10: uj; country, isOldEnough, ageGatingUpdatedAt, optedOut).
// optedOut is the app's own "Opt out of gambling ads" setting; betting is allowed only when the
// user is old enough and has not opted out.
internal object BettingToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("Betting(country=", StringComparisonType.STARTS_WITH),
        string(OPTED_OUT_LABEL, StringComparisonType.EQUALS),
    ),
)
