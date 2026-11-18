// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.promotions

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The component that draws a popup ad over the current screen.
 *
 * Its source name is `PopupAdShower`, it is created once by the application and
 * handed to the screens that can show a promotion, and the one method that starts
 * a popup takes the popup's own model. Nothing else uses it, so it is the whole
 * popup surface rather than one caller of it.
 */
private object PopupAdShowerFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ui/popupwindow/x;",
    name = "i",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/anghami/ui/popupwindow/a;"),
)

/**
 * The handler that shows the full-screen flyer promotion.
 *
 * The class keeps its name from the stock source, but the class itself is
 * obfuscated, so the fingerprint also requires a log line that only this handler
 * prints. That keeps it from matching an unrelated `a` method if the obfuscation
 * shifts in a later build.
 */
private object AdsPopupHandlerFingerprint : Fingerprint(
    definingClass = "Lp4/d;",
    name = "a",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/anghami/odin/ads/e;"),
    strings = listOf("AdsPopupHandler: showing popup"),
)

/**
 * Stops promotional overlays from covering the application.
 *
 * The client has two ways to show a promotion over the screen: a popup window for
 * the anchored banner and a dialog for the full-screen flyer. Both are driven by
 * an ad model that the server sends, and both are started from a single method.
 * The patch answers those two methods immediately, so neither surface is drawn and
 * the user stays on the screen they asked for.
 *
 * Nothing else about the screen changes: the promotion is not replaced by an empty
 * container, no navigation is redirected, and the rest of the ad pipeline — which
 * still fetches and caches its models — is left to run as it does in the stock
 * build. Only the two calls that put something on top of the user are removed.
 */
@Suppress("unused")
val blockPromotionalPopupsPatch = bytecodePatch(
    name = "Block promotional popups",
    description = "Stops the popup and full-screen promotional overlays from being drawn over the app.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.ADS.label)

    execute {
        PopupAdShowerFingerprint.method.returnEarly()
        AdsPopupHandlerFingerprint.method.returnEarly()
    }
}
