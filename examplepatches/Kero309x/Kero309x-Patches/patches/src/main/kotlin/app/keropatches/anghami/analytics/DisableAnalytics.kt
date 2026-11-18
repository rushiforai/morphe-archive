// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.analytics

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * Stops the application sending usage, attribution and crash data to third parties.
 *
 * The client funnels everything it reports through one class. The patch changes it
 * in two layers:
 *
 * 1. The bootstrap is silenced, so the Firebase, Amplitude, Adjust, Branch and
 *    Facebook SDKs are never started. This is what stops the traffic that those
 *    SDKs send on their own — install attribution, session events, and the
 *    initial upload of anything already buffered on disk.
 * 2. Every void method that hands an event to one of those SDKs returns
 *    immediately, so a call that happens before, after, or independently of the
 *    bootstrap cannot reach the network either.
 *
 * The bootstrap is fire-and-forget: `AnghamiApplication` calls it for its side
 * effects and reads nothing back, and the two fields it would have filled are
 * null-checked at their only reads. Silencing it therefore cannot leave anything
 * waiting. The experiment client is never created and its one outside caller
 * treats that as "use the default value", so onboarding still receives an artist
 * count — the stock fallback — instead of a remotely tuned one.
 *
 * The app's own networking is untouched: playback, catalogue and account traffic
 * behave exactly as they do unpatched. Advertising identifiers are out of scope
 * and belong to the advertising behaviours.
 */
@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Stops the app starting its analytics, attribution and crash reporting SDKs and sending events to them.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.PRIVACY.label)

    execute {
        AnalyticsInitFingerprint.method.returnEarly()
        ExperimentInitFingerprint.method.returnEarly()

        AnalyticsSinkFingerprints.all.forEach { sink ->
            sink.method.returnEarly()
        }
    }
}
