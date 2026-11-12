package app.template.patches.scores365.lists

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.scores365.controls.SCORES365_EXTENSION
import app.template.patches.scores365.controls.Scores365ControlsCategory
import app.template.patches.scores365.controls.scores365Controls
import app.template.patches.shared.Constants.COMPATIBILITY_365SCORES
import app.template.patches.shared.addInstructionsAtControlFlowLabelChecked
import app.template.patches.shared.hevalcontrols.HevalListFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val LIST_FILTERS = "Lapp/template/extension/scores365/ListFilters;"
private const val GAMES_OBJ = "Lcom/scores365/entitys/GamesObj;"
private const val COMPETITION_OBJ = "Lcom/scores365/entitys/CompetitionObj;"
private const val GAME_OBJ = "Lcom/scores365/entitys/GameObj;"
private const val COUNTRY_OBJ = "Lcom/scores365/entitys/CountryObj;"
private const val LINKED_HASH_MAP = "Ljava/util/LinkedHashMap;"

internal val HIDDEN_COMPETITIONS = HevalListFeature(
    id = "scores365.hidden_competitions",
    name = "Hidden competitions",
    description = "Matches of the competitions you pick are removed from the match lists. A competition shows up " +
        "here once the app has shown it.",
    category = Scores365ControlsCategory.LEAGUES,
    icon = "trophy",
)

internal val HIDDEN_COUNTRIES = HevalListFeature(
    id = "scores365.hidden_countries",
    name = "Hidden countries",
    description = "Matches of every competition of the countries you pick are removed from the match lists. A " +
        "country shows up here once the app has shown it.",
    category = Scores365ControlsCategory.LEAGUES,
    icon = "globe",
)

/** The model names the extension calls by reflection: a rename fails the patch instead of the hook. */
private fun BytecodePatchContext.requireModel() {
    fun requireMethod(type: String, name: String, returnType: String) {
        val found = classDefBy(type).methods.any { it.name == name && it.returnType == returnType && it.parameterTypes.isEmpty() }
        if (!found) throw PatchException("$type has no $name()$returnType (the 365Scores list filters call it by name)")
    }
    requireMethod(GAME_OBJ, "getCompetitionID", "I")
    requireMethod(COMPETITION_OBJ, "getCid", "I")
    // getName is declared on the base class of the entities.
    var current = classDefByOrNull(COMPETITION_OBJ)
    var hasName = false
    while (current != null && !hasName) {
        hasName = current.methods.any { it.name == "getName" && it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty() }
        current = current.superclass?.let { classDefByOrNull(it) }
    }
    if (!hasName) throw PatchException("$COMPETITION_OBJ has no getName() (the 365Scores list filters call it by name)")
    var countryName = false
    current = classDefByOrNull(COUNTRY_OBJ)
    while (current != null && !countryName) {
        countryName = current.methods.any { it.name == "getName" && it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty() }
        current = current.superclass?.let { classDefByOrNull(it) }
    }
    if (!countryName) throw PatchException("$COUNTRY_OBJ has no getName() (the 365Scores list filters call it by name)")
    val fields = classDefBy(GAMES_OBJ).fields.map { it.name to it.type }.toSet()
    for (field in listOf("competitions" to LINKED_HASH_MAP, "countries" to LINKED_HASH_MAP)) {
        if (field !in fields) throw PatchException("$GAMES_OBJ has no field ${field.first}:${field.second} (the 365Scores list filters read it by name)")
    }
}

/** Hands the value each `return-object` of [method] gives back to [call] first (the receiver is p0). */
private fun BytecodePatchContext.filterReturns(method: MutableMethod, call: String) {
    val receiver = method.implementation!!.registerCount - 1
    val returns = method.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
    if (returns.isEmpty()) throw PatchException("${method.definingClass}->${method.name} has no return-object")
    for ((index, instruction) in returns.reversed()) {
        val register = (instruction as OneRegisterInstruction).registerA
        if (receiver >= 16 || register >= 16) {
            throw PatchException("${method.definingClass}->${method.name}: registers v$receiver/v$register are out of 4-bit range")
        }
        method.addInstructionsAtControlFlowLabelChecked(
            index,
            """
                invoke-static { v$receiver, v$register }, $call
                move-result-object v$register
            """,
        )
    }
}

/**
 * The hook shared by "Hide competitions" and "Hide countries" (unnamed; the feature patches depend
 * on it): GamesObj.getGames() and GamesObj.getCompetitions() hand their map to ListFilters before
 * returning it. The filter reads the picks at run time, so with no pick it returns the stock map.
 */
internal val scores365ListFiltersPatch = bytecodePatch(
    description = "Hooks the 365Scores games response for Hide competitions and Hide countries.",
) {
    compatibleWith(COMPATIBILITY_365SCORES)

    extendWith(SCORES365_EXTENSION)

    execute {
        classDefBy(LIST_FILTERS)
        requireModel()
        val games = mutableClassDefBy(GAMES_OBJ).methods.singleOrNull {
            it.name == "getGames" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/util/Map;"
        } ?: throw PatchException("$GAMES_OBJ has no single getGames()Ljava/util/Map;")
        val competitions = mutableClassDefBy(GAMES_OBJ).methods.singleOrNull {
            it.name == "getCompetitions" && it.parameterTypes.isEmpty() && it.returnType == LINKED_HASH_MAP
        } ?: throw PatchException("$GAMES_OBJ has no single getCompetitions()$LINKED_HASH_MAP")
        filterReturns(games, "$LIST_FILTERS->filterGames(Ljava/lang/Object;Ljava/util/Map;)Ljava/util/Map;")
        filterReturns(competitions, "$LIST_FILTERS->filterCompetitions(Ljava/lang/Object;$LINKED_HASH_MAP)$LINKED_HASH_MAP")
    }
}

// Hidden competitions / hidden countries (2026-11-09, owner request: 365Scores lacked what Sofascore
// and FotMob have). The picks are Patch settings lists; keys are competition ids and country ids,
// labels "country · name" and the country name, learned from the responses the app loads (the
// competitions getter reports them). Filtered: every match list built from GamesObj.getGames() /
// getCompetitions(), which includes the match lists of team and competition pages. Not filtered:
// standings, news, search results, favourites' own pages, widgets and notifications.
@Suppress("unused")
val hideCompetitionsPatch = scores365Controls.featurePatch(
    HIDDEN_COMPETITIONS,
    name = "Hide competitions",
    description = "Hides the competitions you pick in Patch settings from the match lists.",
    default = false,
    dependencies = setOf(scores365ListFiltersPatch),
) {
    // The hook patch does the editing; this patch only registers the list.
}

@Suppress("unused")
val hideCountriesPatch = scores365Controls.featurePatch(
    HIDDEN_COUNTRIES,
    name = "Hide countries",
    description = "Hides every competition of the countries you pick in Patch settings from the match lists.",
    default = false,
    dependencies = setOf(scores365ListFiltersPatch),
) {
}
