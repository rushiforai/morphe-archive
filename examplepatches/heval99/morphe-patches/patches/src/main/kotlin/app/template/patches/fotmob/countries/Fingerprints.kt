package app.template.patches.fotmob.countries

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal const val LIVE_MATCHES = "Lcom/fotmob/models/LiveMatches;"
internal const val LIVE_MATCHES_AND_LEAGUE_RANK = "Lcom/fotmob/models/LiveMatchesAndLeagueRank;"
internal const val LEAGUE_CONVERTER = "Lcom/fotmob/network/converters/LeagueConverter;"
internal const val SUGGESTION = "Lcom/fotmob/models/search/Suggestion;"

/**
 * The match lists' data holder: the coroutine that combines the live matches response with the
 * ranked leagues builds it (240: oo7.invokeSuspend), and every match list screen reads its
 * LiveMatches. The class is a model (name kept); its constructor stores the LiveMatches first.
 */
internal object LiveMatchesAndLeagueRankInitFingerprint : Fingerprint(
    definingClass = LIVE_MATCHES_AND_LEAGUE_RANK,
    name = "<init>",
    returnType = "V",
    parameters = listOf(LIVE_MATCHES, "Ljava/util/List;"),
    filters = listOf(
        fieldAccess(definingClass = LIVE_MATCHES_AND_LEAGUE_RANK, type = LIVE_MATCHES, opcode = Opcode.IPUT_OBJECT),
    ),
)

/**
 * The leagues list ("allLeagues" XML): Retrofit's converter for it parses the body with
 * FotMobDataParser.parseAvailableLeagues and returns the List<League>. Its only consumers are the
 * leagues repository's list (the Leagues tab and onboarding's league picker). The bundled-file
 * reader (the user's own country) calls the parser directly and is left alone.
 */
internal object LeagueConverterFingerprint : Fingerprint(
    definingClass = LEAGUE_CONVERTER,
    name = "convert",
    returnType = "Ljava/util/List;",
    parameters = listOf("Lokhttp3/ResponseBody;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/fotmob/network/parser/FotMobDataParser;",
            name = "parseAvailableLeagues",
            returnType = "Ljava/util/List;",
        ),
    ),
)
