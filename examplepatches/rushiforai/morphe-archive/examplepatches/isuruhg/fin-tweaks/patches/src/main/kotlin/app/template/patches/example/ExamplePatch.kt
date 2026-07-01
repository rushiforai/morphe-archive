package app.template.patches.example

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_YAHOO_FINANCE

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes stream, pencil and markets ads from Yahoo Finance at the " +
        "source so they are never fetched, loaded or shown.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YAHOO_FINANCE)

    execute {
        // 1. Stream/feed ads (Home, News, QSP).
        // AdFetcher.getNextAd(int) returns the next ad unit to insert into the feed.
        // Return a fresh EmptyAdUnit (implements YFAdUnit, no-arg constructor) at the
        // very top of the method: the body that fetches a real ad becomes dead code,
        // so nothing is ever requested from GAM/Taboola.
        // Note: getNextAd is `declared-synchronized`, but in DEX the lock is taken via
        // explicit monitor-enter further down the body. Returning before that point is
        // safe -- no monitor is held, so none needs releasing.
        GetNextAdFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Lcom/yahoo/mobile/client/android/finance/ads/model/EmptyAdUnit;
                invoke-direct {v0}, Lcom/yahoo/mobile/client/android/finance/ads/model/EmptyAdUnit;-><init>()V
                return-object v0
            """,
        )

        // 2. Home top "pencil" banner: force canAdBeShown() to return false.
        PencilAdCanBeShownFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // 3. Markets top-center ad: force canAdBeShown() to return false.
        MarketsAdCanBeShownFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // 3b. Markets screen ad module: report ads as hidden (ad-free user path),
        // which stops the fetch and removes the empty placeholder container.
        MarketsAreAdsHiddenFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // 4. Quote page top banner: return null from buildRowViewModel so no row
        // (and no ad fetch) is ever produced.
        TopCenterAdBuildRowFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        // 5. Quote page pencil / native ads (Summary, Analysis, Financials):
        // same null-row removal.
        PencilAdBuildRowFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
    }
}
