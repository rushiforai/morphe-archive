package app.template.patches.sofascore.betting

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// The odds helpers live in R8-renamed static utility classes, so they are found by the
// preference key they read plus their shape. Each key is also read or written by other methods
// (settings screen, listeners, analytics); their signatures differ, which keeps these unique.

internal const val CONTEXT = "Landroid/content/Context;"
internal const val EVENT_HEAD_FLAGS = "Lcom/sofascore/model/mvvm/model/EventHeadFlags;"

// static boolean(Context, SharedPreferences): the app-wide "show odds" decision. Reads the
// "Show odds" setting (default on) and the country/age gates. 11 methods hold the key in
// 26.10.05; this is the only one with this shape.
internal object OddsEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(CONTEXT, "Landroid/content/SharedPreferences;"),
    strings = listOf(string("PREF_PROVIDER_ODDS_ENABLE", StringComparisonType.CONTAINS)),
)

// static boolean(Context): true when the odds-providers response said odds are off for this
// region. The settings screen then removes its odds row, which would otherwise be a dead toggle
// once the odds decision above is forced off. The other holder of the key
// (the writer) is static void(Context, String, OddsProvidersResponse, boolean).
internal object OddsProvidersDisabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(CONTEXT),
    strings = listOf(string("ODDS_PROVIDERS_DISABLED", StringComparisonType.CONTAINS)),
)

// static boolean(Context): the "Promotions" setting (streaming, tickets and betting offers).
// The setter holding the same key is static void(Context, boolean).
internal object PromotionsEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(CONTEXT),
    strings = listOf(string("PREF_PROMOTIONS_ENABLE", StringComparisonType.CONTAINS)),
)

// static String(Context): the Bet365 open-account (sign-up) link for the user's country, or
// null when there is none. Matched on the URL prefix only, so the per-country affiliate codes
// may change. A default odds-provider object also holds such a URL, inside an R8 lambda's
// invoke()Object, which the shape excludes.
internal object Bet365SignUpLinkFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf(CONTEXT),
    filters = listOf(
        string("https://www.bet365.com/olp/open-account?affiliate=", StringComparisonType.STARTS_WITH),
    ),
)

// EventHeadFlags is a kept @Serializable model; its getters are the only readers of these
// flags outside the class (the match page's tab builders).
internal val EVENT_HEAD_ODDS_FLAGS = listOf(
    "getAdditionalOdds",
    "getAdditionalOddsComparison",
    "getRecommendedPrematchOdds",
)
