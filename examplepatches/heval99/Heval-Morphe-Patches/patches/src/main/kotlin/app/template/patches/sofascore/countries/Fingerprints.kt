package app.template.patches.sofascore.countries

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

internal const val NETWORK_COROUTINE_API = "Lcom/sofascore/network/api/NetworkCoroutineAPI;"
internal const val SPORT_CATEGORIES_RESPONSE = "Lcom/sofascore/model/newNetwork/SportCategoriesResponse;"
internal const val CATEGORIES_FOR_DATE_RESPONSE = "Lcom/sofascore/model/newNetwork/CategoriesForDateResponse;"
internal const val SEARCH_RESPONSE = "Lcom/sofascore/model/network/response/SearchResponse;"
internal const val COUNTRY = "Lcom/sofascore/model/Country;"
internal const val UNIQUE_TOURNAMENT_GROUP_RESPONSE = "Lcom/sofascore/model/newNetwork/UniqueTournamentGroupResponse;"

/** A kept response model's `List` getter (`iget-object` + `return-object`). */
private fun listGetter(type: String, getter: String) = object : Fingerprint(
    definingClass = type,
    name = getter,
    returnType = "Ljava/util/List;",
    parameters = listOf(),
) {}

/** The leagues list of a sport (`api/v1/sport/{sport}/categories`), List<Category>. */
internal val SportCategoriesGetterFingerprint = listGetter(SPORT_CATEGORIES_RESPONSE, "getCategories")

/**
 * The date feed's country rows (`api/v1/sport/{sport}/{date}/{offset}/categories` and the
 * category query), List<CategoryWrapper>.
 */
internal val CategoriesForDateGetterFingerprint = listGetter(CATEGORIES_FOR_DATE_RESPONSE, "getCategories")

/** Search results (`/api/v1/search/all` and `/api/v1/search/{entityType}`), List<SearchEntity>. */
internal val SearchResultsGetterFingerprint = listGetter(SEARCH_RESPONSE, "getResults")

/**
 * A country's competitions, one group each (`api/v1/category/{id}/unique-tournaments`,
 * CategoryUniqueTournamentResponse.groups), List<UniqueTournament>. 26.10.19: read only through
 * CategoryUniqueTournamentResponse (Leagues and two league pickers).
 */
internal val UniqueTournamentGroupGetterFingerprint = listGetter(UNIQUE_TOURNAMENT_GROUP_RESPONSE, "getUniqueTournaments")

/**
 * The request lambda that calls the Retrofit method [api] of NetworkCoroutineAPI (kept interface
 * names). In 26.10.19 both are R8-merged invokeSuspend switches (sportLiveEvents in bnk,
 * getIndexedEventsPage in t93), one case per request; each request's case returns its result,
 * directly or after resuming, through one return-object.
 */
private fun apiCaller(api: String) = object : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(methodCall(definingClass = NETWORK_COROUTINE_API, name = api)),
) {}

/** The Live tab's events (`api/v1/sport/{sport}/events/live`, EventListResponse). */
internal val SportLiveEventsCallFingerprint = apiCaller("sportLiveEvents")

/** The chronological view's pages (`api/v1/sport/{sport}/{date}/events/{page}`, EventListResponse). */
internal val IndexedEventsPageCallFingerprint = apiCaller("getIndexedEventsPage")

/**
 * The matches of an expanded country in the date feed (`api/v1/category/{cid}/scheduled-events/{date}`,
 * EventListResponse). 26.10.19: case of the merged lambda ro3, returning through `move-object v0, v1`.
 */
internal val CategoryScheduledEventsCallFingerprint = apiCaller("categoryScheduledEvents")

private fun ReferenceInstruction.isCountryInit() =
    (reference as? MethodReference)?.let { it.definingClass == COUNTRY && it.name == "<init>" } == true

/**
 * The app's static country list (a <clinit> that builds ~234 Country objects; 26.10.19: zi4). Read
 * at patch time for the picker's options.
 */
internal object CountryListFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    filters = listOf(string("Afghanistan"), string("Zimbabwe")),
    custom = { method, _ ->
        (method.implementation?.instructions ?: emptyList()).count {
            (it.opcode == Opcode.INVOKE_DIRECT_RANGE || it.opcode == Opcode.INVOKE_DIRECT) &&
                (it as ReferenceInstruction).isCountryInit()
        } >= 100
    },
)
