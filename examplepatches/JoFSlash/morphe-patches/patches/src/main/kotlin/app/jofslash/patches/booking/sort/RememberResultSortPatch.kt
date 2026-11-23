package app.jofslash.patches.booking.sort

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.methodOf
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/booking/RememberSort;"
private const val SORT_TYPE = "Lcom/booking/searchquery/SortType;"

// Every change of a search's sort goes through setSortType(builder, sortType, params). A new
// search resets it with setSortType(builder, SortType.AUTO) ("Our top picks").
private const val BUILDER_EXT = "Lcom/booking/searchquery/SearchQueryBuilderExtKt;"

// The sort sheet of the search results: the coroutine that applies the picked sort, built with
// (sheetDelegate, viewModel, sortType, activity, continuation).
private const val SORT_SHEET_APPLY = "Lcom/booking/searchresult/SearchResultsActivity\$SortersBottomSheet\$1\$1\$1;"
private const val SEARCH_RESULTS = "Lcom/booking/searchresult/SearchResultsActivity;"

@Suppress("unused")
val rememberResultSortPatch = bytecodePatch(
    name = "Remember result sort",
    description = "Keeps the sort you last picked for search results (such as price or review " +
            "score) for new searches, instead of going back to \"Our top picks\", which Booking.com " +
            "ranks partly by commission. Until you pick a sort, Booking.com's default stays.",
    default = true
) {
    category("Search")
    compatibleWith(COMPATIBILITY_BOOKING)

    extendWith("extensions/booking.mpe")

    execute {
        // The remembered sort in place of the reset to "Our top picks".
        methodOf(BUILDER_EXT, "setSortType", listOf("Lcom/booking/searchquery/SearchQueryBuilder;", SORT_TYPE, "Ljava/util/Map;"))
            .addInstructions(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->forNewSearch(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object p1
                    check-cast p1, $SORT_TYPE
                """
            )

        // The sort the user picks: in the sort sheet, and in the filter screen's result.
        methodOf(SORT_SHEET_APPLY, "<init>").addInstruction(
            0,
            "invoke-static/range { p3 .. p3 }, $EXTENSION_CLASS->onSortPicked(Ljava/lang/Object;)V"
        )
        methodOf(
            SEARCH_RESULTS,
            "onFiltersOrSortersChange",
            listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/ArrayList;")
        ).addInstruction(0, "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onSorterId(Ljava/lang/String;)V")
    }
}
