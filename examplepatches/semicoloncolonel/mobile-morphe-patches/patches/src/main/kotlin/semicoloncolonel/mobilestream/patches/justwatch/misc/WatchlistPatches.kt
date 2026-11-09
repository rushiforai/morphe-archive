package semicoloncolonel.mobilestream.patches.justwatch.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.justwatch.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.OKHTTP_JSON_FILTER_API
import semicoloncolonel.mobilestream.patches.shared.misc.missingMethods
import semicoloncolonel.mobilestream.patches.shared.privacy.OkHttpClientInitFingerprint

// JustWatch 26.44.2 (phone) and 26.43.8 (Android TV). The Watchlist loads
// its titles with WatchlistContentQuery on the phone or WatchlistGridQuery on
// Android TV, then WatchlistPaginationQuery. Each response
// already carries, for every title, the offer on the services picked in the
// service bar (watchNowOffer), the number of services that offer it
// (offerCount), whether it is released, and whether it is seen
// (seenlistEntry for movies, seenState.caughtUp for shows). An OkHttp
// interceptor uses that data; it does not change JustWatch Pro state, and it
// does not ask the server for JustWatch Pro filters.
//
// "Streaming titles only": when no Types filter is picked, the request asks
// for subscription, free, and ad-supported offers only, the same as picking
// those types in the app's own Types filter.
//
// "Hide unavailable titles": with My Services or single services picked,
// titles that none of them offer are removed. With All picked, titles that
// no service offers are removed, except unreleased titles.
//
// "Hide watched titles": movies marked as seen and shows you are caught up on
// are removed.
//
// The Seen, Likes, and Dislikes sub-tabs and other lists are not changed.
// The title count at the top of the Watchlist still counts removed titles.

private const val FILTER = "Lsemicoloncolonel/mobilestream/extension/justwatch/WatchlistFilter;"

// The calls WatchlistFilter makes to build a new request body.
private val REQUEST_REWRITE_API = listOf(
    "Lokhttp3/Request;->method()Ljava/lang/String;",
    "Lokhttp3/Request;->newBuilder()Lokhttp3/Request\$Builder;",
    "Lokhttp3/Request\$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request\$Builder;",
    "Lokhttp3/Request\$Builder;->build()Lokhttp3/Request;",
    "Lokhttp3/RequestBody;->contentType()Lokhttp3/MediaType;",
    "Lokhttp3/RequestBody;->create(Ljava/lang/String;Lokhttp3/MediaType;)Lokhttp3/RequestBody;",
)

private fun BytecodePatchContext.installWatchlistFilter(install: String) {
    // The filter calls OkHttp and okio by name; fail here, not in the app.
    missingMethods(OKHTTP_JSON_FILTER_API + REQUEST_REWRITE_API).takeIf { it.isNotEmpty() }?.let {
        throw PatchException("OkHttp methods missing: ${it.joinToString()}")
    }
    OkHttpClientInitFingerprint.method.addInstructions(
        0,
        "invoke-static/range { p1 .. p1 }, $FILTER->$install(Lokhttp3/OkHttpClient\$Builder;)V",
    )
}

@Suppress("unused")
val streamingTitlesOnlyPatch = bytecodePatch(
    name = "Streaming titles only",
    description = "Shows only titles you can stream on a subscription or for free on the Watchlist. " +
        "Titles you can only rent or buy are hidden. Picking a Types filter in the app overrides this.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        installWatchlistFilter("installStreamingOnly")
    }
}

@Suppress("unused")
val hideUnavailableTitlesPatch = bytecodePatch(
    name = "Hide unavailable titles",
    description = "Hides Watchlist titles that are not on the services you picked. " +
        "With All picked, hides titles that no service offers, except unreleased titles.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        installWatchlistFilter("installHideUnavailable")
    }
}

@Suppress("unused")
val hideWatchedTitlesPatch = bytecodePatch(
    name = "Hide watched titles",
    description = "Hides movies you marked as seen and shows you are caught up on from the Watchlist.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        installWatchlistFilter("installHideWatched")
    }
}
