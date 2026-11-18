// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.rating

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The single method the stock application asks before showing a rating request.
 *
 * It is a plain instance method on a singleton controller, so the declaration is
 * stable across builds even when the method body is reorganised. The body is not
 * part of the fingerprint: the patch only needs to know that the method exists
 * with this exact signature.
 */
private object RatingDecisionFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/rating/AppRater;",
    name = "getShouldShowDialog",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Stops the application from asking the user to rate it.
 *
 * The stock build decides whether to show a rating request in one predicate, and
 * uses that one answer for both of its presentation paths: a dialog of its own
 * and the Play in-app review sheet. Answering the predicate with `false` before
 * any of its conditions are evaluated therefore suppresses both paths without
 * touching either of them.
 *
 * Replacing the first instruction means none of the original checks run. The
 * counter that feeds the predicate is left alone, so no other behaviour that
 * shares it is affected.
 */
@Suppress("unused")
val disableRatingPromptPatch = bytecodePatch(
    name = "Disable the rating prompt",
    description = "Stops Anghami from asking you to rate the app, in both its own dialog and the Play review sheet.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.STORE.label)

    execute {
        RatingDecisionFingerprint.method.returnEarly(false)
    }
}
