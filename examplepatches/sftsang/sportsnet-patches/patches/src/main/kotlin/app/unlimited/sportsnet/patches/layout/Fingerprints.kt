package app.unlimited.sportsnet.patches.layout

import app.morphe.patcher.Fingerprint

/** Draws the bottom navigation bar from the list of top level tabs. */
internal object SportsnetBottomBarFingerprint : Fingerprint(
    definingClass = "Lcom/rogers/sportsnet/ui/SportsnetAppKt;",
    name = "SportsnetBottomBar",
    returnType = "V",
    parameters = listOf(
        "Ljava/util/List;", "Landroidx/navigation3/runtime/NavKey;", "Z",
        "Lkotlin/jvm/functions/Function1;", "Landroidx/compose/runtime/Composer;", "I",
    ),
)

/** Sets up navigation, starting on the tab it is given. */
internal object RememberNavigationStateFingerprint : Fingerprint(
    definingClass = "Lcom/rogers/sportsnet/ui/navigation/NavigationStateKt;",
    name = "rememberNavigationState",
    parameters = listOf(
        "Landroidx/navigation3/runtime/NavKey;", "Ljava/util/Set;",
        "Landroidx/compose/runtime/Composer;", "I",
    ),
)

private fun listGetter(definingClass: String, name: String) = Fingerprint(
    definingClass = definingClass,
    name = name,
    returnType = "Ljava/util/List;",
    parameters = listOf(),
)

private const val MODEL = "Lcom/rogers/sportsnet/common/model"

/** The leagues of a group of scores, from which Scores builds its league chips and game list. */
internal val leagueScoresFingerprint = listGetter(
    "Lcom/rogers/sportsnet/service/graphql/generated/fragment/ScoresGroupFragment;", "getLeagueScores",
)

/** Rails of a Watch tab page, the videos of a rail or list, and the Sportsnet+ schedule. */
internal val pageEntriesFingerprint = listGetter("$MODEL/Page;", "getEntries")
internal val itemListItemsFingerprint = listGetter("$MODEL/ItemList;", "getItems")
internal val sportSchedulesItemsFingerprint = listGetter("$MODEL/SportSchedulesList;", "getItems")

/** Builds the Watch tab's sub-tabs from the server's navigation and the app's site map. */
internal object WatchSubTabsFactoryFingerprint : app.morphe.patcher.Fingerprint(
    definingClass = "/NavEntryPageRouteItemsFactory;",
    name = "invoke",
    returnType = "Ljava/util/List;",
    parameters = listOf("Lcom/rogers/sportsnet/common/ui/model/NavigationDetails;"),
)
