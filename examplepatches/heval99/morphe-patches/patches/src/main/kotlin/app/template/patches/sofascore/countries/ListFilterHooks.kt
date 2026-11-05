package app.template.patches.sofascore.countries

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.shared.addInstructionsAtControlFlowLabelChecked
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import app.template.patches.sofascore.controls.sofascoreControls
import app.template.patches.sofascore.misc.animations.ReleaseAppOnCreateFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val COUNTRY_FILTER = "Lapp/template/extension/sofascore/CountryFilter;"
internal const val COMPETITION_FILTER = "Lapp/template/extension/sofascore/CompetitionFilter;"

private const val MODEL = "Lcom/sofascore/model/mvvm/model/"

internal const val EVENT_LIST_RESPONSE = "Lcom/sofascore/model/newNetwork/EventListResponse;"

/**
 * The getters CountryFilter and CompetitionFilter call by name through reflection. Sofascore's
 * models are kotlinx-serialization classes whose names and getters R8 keeps, but the patch checks
 * them so a rename fails here, not silently at runtime.
 */
internal val REFLECTED_METHODS = mapOf(
    "${MODEL}Category;" to listOf("getAlpha2", "getSlug", "getName"),
    "Lcom/sofascore/model/newNetwork/CategoryWrapper;" to listOf("getCategory", "getUniqueTournamentIds"),
    "Lcom/sofascore/model/network/response/SearchEntity;" to listOf("getType", "getEntity"),
    "${MODEL}Event;" to listOf("getTournament", "getHomeTeam", "getAwayTeam"),
    "${MODEL}Tournament;" to listOf("getCategory", "getUniqueTournament"),
    "${MODEL}UniqueTournament;" to listOf("getCategory", "getId", "getName"),
    "${MODEL}UniqueStage;" to listOf("getCategory"),
    "${MODEL}Team;" to listOf("getCategory", "getCountry", "getId"),
    "${MODEL}Country;" to listOf("getAlpha2", "getSlug", "getName"),
    "${MODEL}Player;" to listOf("getTeam"),
    EVENT_LIST_RESPONSE to listOf("getEvents"),
)

/** The getter return filters: fingerprint, CountryFilter helper. */
private val GETTER_FILTERS = listOf(
    SportCategoriesGetterFingerprint to "filterCategories",
    CategoriesForDateGetterFingerprint to "filterCategoryWrappers",
    SearchResultsGetterFingerprint to "filterSearchResults",
    UniqueTournamentGroupGetterFingerprint to "filterUniqueTournaments",
)

/** The event list requests whose result is filtered: fingerprint, NetworkCoroutineAPI method, CountryFilter helper. */
internal val EVENT_LIST_REQUESTS = listOf(
    Triple(SportLiveEventsCallFingerprint, "sportLiveEvents", "filterEventList"),
    Triple(IndexedEventsPageCallFingerprint, "getIndexedEventsPage", "filterEventList"),
    Triple(CategoryScheduledEventsCallFingerprint, "categoryScheduledEvents", "filterCategoryEvents"),
)

private fun BytecodePatchContext.requireReflectedMethods() {
    REFLECTED_METHODS.forEach { (type, names) ->
        val methods = classDefBy(type).methods.map { it.name }.toSet()
        names.filterNot(methods::contains).takeIf { it.isNotEmpty() }?.let { missing ->
            throw PatchException("Hide countries/competitions: $type no longer has the methods $missing")
        }
    }
    classDefBy(EVENT_LIST_RESPONSE).methods.singleOrNull {
        it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/List;")
    } ?: throw PatchException("Hide countries/competitions: $EVENT_LIST_RESPONSE has no <init>(List)")
}

internal fun Instruction.methodReference() = (this as? ReferenceInstruction)?.reference as? MethodReference

/** The single return-object of a model getter. */
private fun MutableMethod.getterReturn(): Int {
    val returns = instructions.indices.filter { getInstruction(it).opcode == Opcode.RETURN_OBJECT }
    return returns.singleOrNull() ?: throw PatchException("$definingClass->$name has ${returns.size} return-object")
}

private val MOVE_OBJECTS = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

/**
 * The return-object of the request lambda's [api] case: the first one after the call, and the
 * register it returns. That is the call's result register (bnk, t93), or a register the result is
 * copied into before it (ro3 in 26.10.19: `move-object v0, v1; return-object v0`, where the
 * suspended path returns the suspend marker in v0 and the resumed path copies p1 into v0, all
 * through the same return).
 */
private fun MutableMethod.requestReturn(api: String): Pair<Int, Int> {
    val calls = instructions.indices.filter {
        getInstruction(it).methodReference()?.let { ref -> ref.definingClass == NETWORK_COROUTINE_API && ref.name == api } == true
    }
    val call = calls.singleOrNull()
        ?: throw PatchException("$definingClass->$name calls $api ${calls.size} times")
    val move = getInstruction(call + 1)
    if (move.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("$api's result is not moved right after the call")
    val result = (move as OneRegisterInstruction).registerA
    val ret = (call + 2 until instructions.size).firstOrNull { getInstruction(it).opcode == Opcode.RETURN_OBJECT }
        ?: throw PatchException("$definingClass->$name has no return-object after $api")
    val returned = (getInstruction(ret) as OneRegisterInstruction).registerA
    if (returned != result && (call + 2 until ret).none { i ->
            getInstruction(i).let {
                it.opcode in MOVE_OBJECTS && (it as TwoRegisterInstruction).registerA == returned && it.registerB == result
            }
        }
    ) {
        throw PatchException("$definingClass->$name does not return $api's result")
    }
    return ret to returned
}

/** `vX = CountryFilter.<helper>(vX)` before instruction [index]. */
private fun filterSmali(register: Int, helper: String) =
    "invoke-static/range {v$register .. v$register}, $COUNTRY_FILTER->$helper\nmove-result-object v$register"

// The hook sites of "Hide countries" and "Hide competitions" (2026-11-03): both feature patches
// depend on this unnamed patch, so the sites are edited once whichever of them is selected, and each
// CountryFilter hook runs the lists of the patches that are in (CountryFilter.patched(),
// CompetitionFilter.patched(), rewritten to true by their patch). The sites:
//  1. the leagues list: SportCategoriesResponse.getCategories (countries; never emptied),
//  2. the date feed's country rows: CategoriesForDateResponse.getCategories (the categories of a
//     date and the category query; a row also goes when all its uniqueTournamentIds are hidden
//     competitions),
//  3. search: SearchResponse.getResults (events, competitions, teams and players),
//  4. a country's competitions in Leagues: UniqueTournamentGroupResponse.getUniqueTournaments (only
//     read from CategoryUniqueTournamentResponse, `api/v1/category/{id}/unique-tournaments`;
//     competitions only, may be emptied: the app skips empty groups),
//  5. the Live tab: the sportLiveEvents request's result (a new EventListResponse),
//  6. the chronological view: the getIndexedEventsPage request's result (the same),
//  7. an expanded country of the date feed: the categoryScheduledEvents request's result
//     (`api/v1/category/{cid}/scheduled-events/{date}`, the same; 26.10.19: ro3, which returns the
//     result through `move-object v0, v1`),
// plus CountryFilter.init before every return of ReleaseApp.onCreate (country seeds and the
// pickers' icons).
internal val sofascoreListFiltersPatch = bytecodePatch(
    description = "Routes Sofascore's match, league and search lists through the hidden countries and competitions.",
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    dependsOn(sofascoreControls.patch)

    execute {
        classDefBy(COUNTRY_FILTER)
        classDefBy(COMPETITION_FILTER)
        requireReflectedMethods()

        // Validate every site before the first edit.
        val getters = GETTER_FILTERS.map { (fingerprint, helper) ->
            val method = fingerprint.method
            val ret = method.getterReturn()
            method.requireNoBranchTargetAt(ret, "List filter $helper")
            Triple(method, ret, helper)
        }
        val requests = EVENT_LIST_REQUESTS.map { (fingerprint, api, helper) ->
            val method = fingerprint.method
            val (ret, register) = method.requestReturn(api)
            Triple(method, ret, register) to helper
        }
        if (requests.map { it.first.first }.toSet().size != requests.size) {
            throw PatchException("Hide countries/competitions: two event list requests share a method")
        }
        val onCreate = ReleaseAppOnCreateFingerprint.method
        val onCreateReturns = onCreate.instructions.indices.filter { onCreate.getInstruction(it).opcode == Opcode.RETURN_VOID }
        if (onCreateReturns.isEmpty()) throw PatchException("ReleaseApp.onCreate has no return-void")

        // 0. Country seeds and picker icons, registered at startup.
        onCreateReturns.sortedDescending().forEach { ret ->
            onCreate.addInstructionsAtControlFlowLabelChecked(ret, "invoke-static {}, $COUNTRY_FILTER->init()V")
        }

        // 1-4. vX = helper(vX); return-object vX in the model getters.
        for ((method, ret, helper) in getters) {
            val register = (method.getInstruction(ret) as OneRegisterInstruction).registerA
            method.addInstructionsChecked(ret, filterSmali(register, "$helper(Ljava/util/List;)Ljava/util/List;"))
        }

        // 5-7. The request lambdas' return: labels move to the filter, so the direct and the resumed
        //      path both pass through it.
        for ((site, helper) in requests) {
            val (method, ret, register) = site
            method.addInstructionsAtControlFlowLabelChecked(ret, filterSmali(register, "$helper(Ljava/lang/Object;)Ljava/lang/Object;"))
        }
    }
}
