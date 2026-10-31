package app.ratbanana.patches.gaminghub.mygames

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionFilter
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.methodCall
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral

private const val MY_GAMES_LAYOUT_VIEW_BINDER_CLASS =
    "Lcom/samsung/android/game/gamehome/app/mygames/MyGamesLayoutViewBinder;"

/** Filters of a method that sets the My games top section title from the given string resource. */
private fun topAreaTitleFilters(titleResourceName: String): List<InstructionFilter> = listOf(
    resourceLiteral(ResourceType.STRING, titleResourceName),
    // topAreaText.setText(title)
    methodCall(
        definingClass = "Landroid/widget/TextView;",
        name = "setText",
        location = MatchAfterWithin(10),
    ),
)

/** Shows Instant Plays history in the top section of My games. */
internal object BindInstantPlaysHistoryFingerprint : Fingerprint(
    definingClass = MY_GAMES_LAYOUT_VIEW_BINDER_CLASS,
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
    filters = topAreaTitleFilters("main_home_my_games_card_instant_plays_history"),
)

/** Shows recently played games in the top section of My games. */
internal object BindRecentGamesFingerprint : Fingerprint(
    definingClass = MY_GAMES_LAYOUT_VIEW_BINDER_CLASS,
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
    filters = topAreaTitleFilters("main_home_my_games_card_header"),
)
