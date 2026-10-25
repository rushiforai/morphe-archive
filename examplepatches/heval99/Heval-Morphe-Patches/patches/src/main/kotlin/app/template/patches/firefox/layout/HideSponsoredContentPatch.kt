package app.template.patches.firefox.layout

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.firefox.shared.concreteMethod
import app.template.patches.firefox.shared.firefoxClass
import app.template.patches.firefox.shared.readClass
import app.template.patches.firefox.shared.settingsGetter
import app.template.patches.shared.Constants.COMPATIBILITY_FIREFOX
import app.template.patches.shared.addInstructionsChecked

internal const val MAC_TOP_SITES_PROVIDER = "Lmozilla/components/service/mars/MacTopSitesProvider;"
internal const val CONTENT_RECOMMENDATIONS_HELPER = "Lorg/mozilla/fenix/home/pocket/ContentRecommendationsFeatureHelper;"
internal const val EMPTY_LIST = "Lkotlin/collections/EmptyList;"

internal val SPONSORED_SETTINGS = listOf(
    "getShowContileFeature",
    "getShowPocketSponsoredStories",
    "getShowSponsoredSuggestions",
)

@Suppress("unused")
val hideSponsoredContentPatch = bytecodePatch(
    name = "Hide sponsored content",
    description = "Hides sponsored shortcuts, stories and suggestions.",
) {
    compatibleWith(COMPATIBILITY_FIREFOX)

    execute {
        // ── 1. Sponsored shortcuts, sponsored stories and sponsored Firefox Suggest ────────
        //  Each reads as switched off wherever it is checked. The Home settings switch for
        //  sponsored shortcuts stays visible but has no effect (no resource patch).
        SPONSORED_SETTINGS.forEach { settingsGetter(it).returnEarly(false) }

        // ── 2. The "Sponsored stories" switch in Home settings is hidden ────────────────────
        concreteMethod(CONTENT_RECOMMENDATIONS_HELPER, "isPocketSponsoredStoriesFeatureEnabled", listOf("Landroid/content/Context;"))
            .returnEarly(false)

        // ── 3. Backstop: the MARS sponsored tile provider answers an empty list ─────────────
        //  getTopSites (a suspend fun whose parameters R8 dropped) returns its List directly;
        //  both callers just pass it on. Every concrete getTopSites on the provider is hooked.
        if (readClass(EMPTY_LIST).fields.none { it.name == "INSTANCE" && it.type == EMPTY_LIST }) {
            throw PatchException("$EMPTY_LIST has no INSTANCE")
        }
        val getTopSites = firefoxClass(MAC_TOP_SITES_PROVIDER).methods.filter {
            it.name == "getTopSites" && it.implementation != null && it.returnType.startsWith("L")
        }
        if (getTopSites.isEmpty()) throw PatchException("$MAC_TOP_SITES_PROVIDER has no concrete getTopSites")
        getTopSites.forEach {
            it.addInstructionsChecked(
                0,
                """
                    sget-object v0, $EMPTY_LIST->INSTANCE:$EMPTY_LIST
                    return-object v0
                """,
            )
        }
    }
}
