package app.template.patches.flashscore.misc.betting

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// A remote-config value (R8-renamed, r1o in 26.10.2). Every config switch the app reads is one of
// these: its constructor takes (context, key enum, ..., default supplier, parser) and opens the
// per-user override preferences "USER_PREFS_CONFIG_KEY-<user>". The second parameter is the key
// enum (i63 in 26.10.2), whose constants carry the stable names (ODDS_ENABLE, ...). The file name
// prefix is concatenated with the user, so it is matched by prefix: patcher 2.0 compares raw
// `strings` with the whole constant.
internal object RemoteConfigValueConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    filters = listOf(string("USER_PREFS_CONFIG_KEY-", StringComparisonType.STARTS_WITH)),
)

// The sponsored (bookmaker) strip widget's data class (R8-renamed, j3l in 26.10.2), found through
// its data-class toString(). The class-name prefix starts the concatenation, so it is matched by
// prefix: patcher 2.0 compares raw `strings` with the whole constant.
internal object SponsoredStripToStringFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("SponsoredStripWidgetDTO(sponsoredItems=", StringComparisonType.STARTS_WITH)),
)

// The bookmaker bonus strip widget's data class (R8-renamed, pt1 in 26.10.2). Its fields changed
// between releases (26.9.2: "(bonuses=", 26.10.2: "(summaryBonuses=" + ", oddsBonuses="), so only
// the class-name prefix is matched. Its constructors take only ArrayLists; the renderer skips
// the strip for an empty list.
internal object BonusStripToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("BonusStripWidgetDTO(", StringComparisonType.STARTS_WITH)),
)

// The league page header model (R8-renamed, y5b in 26.10.2). Its last field is the set of league
// tabs the API offers (the tab-id enum, r08 in 26.10.2, whose constants carry the stable names
// SUMMARY, ODDS, STANDING, ...). The league tab bar is built from this set alone; unlike the
// match detail tabs, no remote-config switch filters the ODDS tab out. Both strings are
// concatenation pieces (patcher 2.0 compares raw `strings` with the whole constant): the
// class-name prefix is matched by prefix, the field label with CONTAINS in `custom`, so its
// position is not pinned (R8 can hoist toString labels out of append order).
internal object LeagueHeaderModelToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("LeagueDetailHeaderModel(tournamentId=", StringComparisonType.STARTS_WITH)),
    custom = { method, _ -> method.hasStringContaining(", detailTabs=") },
)

private fun Method.hasStringContaining(value: String) = implementation?.instructions?.any { insn ->
    ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string?.contains(value) == true
} == true

// The league summary screen's parameters (R8-renamed, r8b in 26.10.2). The summary only creates
// the outright ("Winner Odds") widget when isAgeVerified is true; otherwise the widget is in its
// Hidden state, which renders nothing. That flag is read nowhere else. The class-name prefix is
// matched by prefix (patcher 2.0 compares raw `strings` with the whole constant). The
// ", isAgeVerified=" label stays an exact string: HideBettingContentPatch finds the field through
// that exact constant, so a looser match would only move the failure there.
internal object LeagueSummaryParamsToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf(string(", isAgeVerified=", StringComparisonType.CONTAINS)),
    filters = listOf(string("LeagueDetailSummaryScreenParams(tournamentId=", StringComparisonType.STARTS_WITH)),
)
