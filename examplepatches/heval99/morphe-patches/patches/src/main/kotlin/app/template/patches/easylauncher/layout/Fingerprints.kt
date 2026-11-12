package app.template.patches.easylauncher.layout

import app.morphe.patcher.Fingerprint

private const val SEARCH_MODEL = "Lcom/eet/core/search/data/model/"

// Response models of the search/news backend (kept: Parcelable and deserialized by name). Every
// screen that shows sponsored links, sponsored sites or sponsored articles reads these getters.
internal object SponsoredLinksDataFingerprint : Fingerprint(
    definingClass = "${SEARCH_MODEL}SponsoredLinksResponse;",
    name = "getData",
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    custom = { method, _ -> method.implementation != null },
)

internal object SponsoredSitesFingerprint : Fingerprint(
    definingClass = "${SEARCH_MODEL}SponsoredSites;",
    name = "getSponsoredSites",
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    custom = { method, _ -> method.implementation != null },
)

// The news feed's articles. The feed is built from this response, so it can end up short or
// empty.
internal object SponsoredPostsArticlesFingerprint : Fingerprint(
    definingClass = "${SEARCH_MODEL}SponsoredPostsResponse;",
    name = "getArticles",
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    custom = { method, _ -> method.implementation != null },
)

// Search suggestions provider for sponsored links (suspend; returns the list or COROUTINE_SUSPENDED).
internal object SponsoredLinkSuggestionsFingerprint : Fingerprint(
    definingClass = "Lcom/eet/feature/search2/suggest/SponsoredLinkSuggestionProvider;",
    name = "getSuggestions",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/List;", "I", "L"), // Continuation is R8-renamed since 1.10.31
    custom = { method, _ -> method.implementation != null },
)
