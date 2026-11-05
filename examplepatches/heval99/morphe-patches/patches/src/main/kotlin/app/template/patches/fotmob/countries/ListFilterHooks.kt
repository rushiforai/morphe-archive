package app.template.patches.fotmob.countries

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.fotmob.controls.fotMobActivityHooksPatch
import app.template.patches.fotmob.controls.fotMobControls
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import app.template.patches.shared.addInstructionsAtControlFlowLabelChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal const val COUNTRY_FILTER = "Lapp/template/extension/fotmob/CountryFilter;"
internal const val COMPETITION_FILTER = "Lapp/template/extension/fotmob/CompetitionFilter;"

/** Suggestion's list fields and the CountryFilter helper that filters each (players and referees stay). */
internal val SUGGESTION_FILTERS = mapOf(
    "leagueSuggestions" to "filterLeagueSuggestions",
    "teamSuggestions" to "filterTeamSuggestions",
    "matchesSuggestions" to "filterMatchSuggestions",
)

/**
 * The fields CountryFilter reads by name through reflection. FotMob keeps its model field names
 * (Gson and kotlinx models), but the patch checks them so a rename fails here, not silently at
 * runtime.
 */
internal val REFLECTED_FIELDS = mapOf(
    LIVE_MATCHES to listOf("leagueMatches"),
    "Lcom/fotmob/models/LeagueMatches;" to listOf("league", "Matches", "sortPriority"),
    "Lcom/fotmob/models/League;" to listOf("CountryCode", "Id", "ParentId", "CountryName", "Name", "isSuggested"),
    "Lcom/fotmob/models/Match;" to listOf("HomeTeam", "AwayTeam"),
    // 241 made Team a Kotlin class: the field is "id" (still serialized as "ID").
    "Lcom/fotmob/models/Team;" to listOf("id"),
    "Lcom/fotmob/models/search/LeagueSuggestions;" to listOf("leagues"),
    "Lcom/fotmob/models/search/TeamSuggestions;" to listOf("teams"),
    "Lcom/fotmob/models/search/MatchSuggestions;" to listOf("matches"),
    "Lcom/fotmob/models/search/LeagueSuggestion;" to listOf("nameAndId", "payload"),
    "Lcom/fotmob/models/search/TeamSuggestion;" to listOf("nameAndId", "payload"),
    "Lcom/fotmob/models/search/MatchSuggestion;" to listOf("payload"),
    "Lcom/fotmob/models/search/LeagueSuggestionPayload;" to listOf("countryCode"),
    "Lcom/fotmob/models/search/TeamSuggestionPayload;" to listOf("leagueId"),
    "Lcom/fotmob/models/search/MatchSuggestionPayload;" to listOf("leagueId", "homeTeamId", "awayTeamId"),
)

/** Passes register [register] through `CountryFilter.<helper>(Ljava/lang/Object;)...` before [index]. */
private fun MutableMethod.filterBefore(index: Int, register: Int, helper: String, castTo: String? = null) {
    val cast = castTo?.let { "\ncheck-cast v$register, $it" } ?: ""
    addInstructionsAtControlFlowLabelChecked(
        index,
        "invoke-static/range {v$register .. v$register}, $COUNTRY_FILTER->$helper\nmove-result-object v$register$cast",
    )
}

private fun BytecodePatchContext.requireReflectedFields() {
    REFLECTED_FIELDS.forEach { (type, names) ->
        val fields = classDefBy(type).fields.map { it.name }.toSet()
        names.filterNot(fields::contains).takeIf { it.isNotEmpty() }?.let { missing ->
            throw PatchException("Hide countries/competitions: $type no longer has the fields $missing")
        }
    }
}

// The hook sites of "Hide countries" and "Hide competitions" (2026-11-03): both feature patches
// depend on this unnamed patch, so each site is edited once whichever of them is selected, and each
// CountryFilter hook runs the lists of the patches that are in (CountryFilter.patched(),
// CompetitionFilter.patched(), rewritten to true by their patch). CountryFilter in extensions/fotmob
// does the filtering; the patch only routes three data paths through it:
//  1. match lists: the LiveMatches stored by LiveMatchesAndLeagueRank.<init> (a new LiveMatches
//     without hidden leagues; matches of favourite teams stay),
//  2. the leagues list: every List<League> LeagueConverter.convert returns (Leagues tab and
//     onboarding's league picker); it also reports the countries and competitions seen to the pickers,
//  3. search: Suggestion's leagueSuggestions/teamSuggestions/matchesSuggestions in every
//     constructor that stores them (players and referees are not filtered).
// The pickers are seeded from FotMobApp.onCreate through ActivityHooks.register (CountryFilter.init,
// which also calls CompetitionFilter.init), from fotMobActivityHooksPatch.
internal val fotMobListFiltersPatch = bytecodePatch(
    description = "Routes FotMob's match, league and search lists through the hidden countries and competitions.",
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    dependsOn(fotMobControls.patch, fotMobActivityHooksPatch)

    execute {
        classDefBy(COUNTRY_FILTER)
        classDefBy(COMPETITION_FILTER)
        requireReflectedFields()

        // Find every site before the first edit.
        val holder = LiveMatchesAndLeagueRankInitFingerprint.method
        val store = LiveMatchesAndLeagueRankInitFingerprint.instructionMatches.single().index
        val liveMatches = holder.instructions[store].let { (it as TwoRegisterInstruction).registerA }

        val convert = LeagueConverterFingerprint.method
        val returns = convert.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
        if (returns.isEmpty()) throw PatchException("LeagueConverter.convert has no return-object")

        val hooked = mutableSetOf<String>()
        val searchSites = mutableClassDefBy(SUGGESTION).methods.filter { it.name == "<init>" && it.implementation != null }.map { constructor ->
            constructor to constructor.instructions.withIndex().mapNotNull { (index, instruction) ->
                if (instruction.opcode != Opcode.IPUT_OBJECT) return@mapNotNull null
                val field = (instruction as ReferenceInstruction).reference as FieldReference
                val helper = SUGGESTION_FILTERS[field.name]?.takeIf { field.definingClass == SUGGESTION } ?: return@mapNotNull null
                hooked += field.name
                Triple(index, (instruction as TwoRegisterInstruction).registerA, helper)
            }
        }
        if (hooked != SUGGESTION_FILTERS.keys) {
            throw PatchException("Suggestion: no constructor stores ${SUGGESTION_FILTERS.keys - hooked}")
        }

        // 1. Match lists: filter the LiveMatches right before the constructor stores it.
        holder.filterBefore(store, liveMatches, "filterLiveMatches(Ljava/lang/Object;)Ljava/lang/Object;", LIVE_MATCHES)

        // 2. Leagues list: filter every returned list.
        for (index in returns.reversed()) {
            val register = (convert.instructions[index] as OneRegisterInstruction).registerA
            convert.filterBefore(index, register, "filterLeagues(Ljava/util/List;)Ljava/util/List;")
        }

        // 3. Search: every store of the three filtered lists in every Suggestion constructor.
        for ((constructor, sites) in searchSites) {
            for ((index, register, helper) in sites.reversed()) {
                constructor.filterBefore(index, register, "$helper(Ljava/util/List;)Ljava/util/List;")
            }
        }
    }
}
