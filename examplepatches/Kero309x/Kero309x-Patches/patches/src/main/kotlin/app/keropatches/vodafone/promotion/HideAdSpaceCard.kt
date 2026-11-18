// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.vodafone.promotion

import app.keropatches.core.PatchCategory
import app.keropatches.vodafone.VodafoneApp
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The composable that draws the promotional card.
 *
 * The card is a piece of interface code that reads the promotional state from
 * its view model and draws it. The shrinker renamed both the class and the
 * method, so the method is identified by its class and its full signature.
 */
private object AdSpaceCardFingerprint : Fingerprint(
    definingClass = "Lo/updateAnchorInfoForLayout;",
    name = "AdSpaceCard-lVb_Clg",
    isStatic = true,
    returnType = "V",
    parameters = listOf(
        "Lvodafone/vis/engezly/adspace/presentation/AdSpaceViewModel;",
        "Lo/getInitialPrefetchItemCount;",
        "J",
        "Landroidx/compose/ui/graphics/Brush;",
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function1;",
        "Lkotlin/jvm/functions/Function1;",
        "Lkotlin/jvm/functions/Function0;",
        "Landroidx/compose/runtime/Composer;",
        "I",
        "I",
    ),
)

/**
 * Hides the promotional gift card.
 *
 * The application asks the server for a gift offer and, when one comes back,
 * draws it as a card with a description, a price and a redemption button. The
 * card is drawn by one composable, which the home screen, the recharge screen
 * and the payment screen all call, so the card looks the same wherever it
 * appears.
 *
 * The patch answers that composable with an early return, so it draws nothing.
 * A composable that emits no nodes leaves no space behind: the surrounding
 * screen draws exactly what it would draw if the card had never been offered.
 *
 * The offer itself is still requested from the server and still held by the
 * view model, so the application still knows about it; the patch only stops the
 * card from being drawn. The redemption flow is therefore still reachable
 * through the server answer but not through the interface.
 */
@Suppress("unused")
val hideAdSpaceCardPatch = bytecodePatch(
    name = "Hide the promotional card",
    description = "Stops the home, recharge and payment screens from drawing the promotional gift card.",
    default = true,
) {
    compatibleWith(VodafoneApp.compatibility)
    category(PatchCategory.ADS.label)

    execute {
        AdSpaceCardFingerprint.method.returnEarly()
    }
}
