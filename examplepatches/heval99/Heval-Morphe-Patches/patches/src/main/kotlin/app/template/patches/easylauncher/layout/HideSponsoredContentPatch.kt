package app.template.patches.easylauncher.layout

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_EASYLAUNCHER
import app.template.patches.shared.addInstructionsChecked

@Suppress("unused")
val hideSponsoredContentPatch = bytecodePatch(
    name = "Hide sponsored content",
    description = "Hides sponsored links and articles. The news feed may show few posts.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_EASYLAUNCHER)

    execute {
        // Every getter hands back an empty list. The suspend suggestion provider may return its
        // result directly instead of suspending, so it does the same.
        listOf(
            SponsoredLinksDataFingerprint,
            SponsoredSitesFingerprint,
            SponsoredPostsArticlesFingerprint,
            SponsoredLinkSuggestionsFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.addInstructionsChecked(
                0,
                """
                    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;
                    move-result-object v0
                    return-object v0
                """,
            )
        }
    }
}
