package app.template.patches.firefox

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.FIREFOX_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Shrinks Firefox for Android (Fenix) to a strictly privacy-focused browser by
 * never letting the four data-collection subsystems initialize (all verified
 * against 158.0.2, where they are the only live telemetry pipes):
 *
 * - Glean / "Firefox Telemetry": initializeGlean() runs synchronously from
 *   FenixApplication.onCreate and wires the entire metrics pipeline. Never
 *   initializing means no metrics, no pings, no usage data, ever.
 * - Nimbus (FxNimbus.initialize): experiment enrollment and the experiments
 *   server sync. Skipped initialization means default feature states and no
 *   enrollment traffic.
 * - Sentry crash reporting (SentryService.initSentry): the crash-upload
 *   backend is never configured, so nothing can be reported.
 * - Adjust marketing attribution (AdjustMetricsService.start): install and
 *   activation attribution never start.
 * - Telemetry preference getters (Settings.isTelemetryEnabled /
 *   isMarketingTelemetryEnabled / isExperimentationEnabled) are forced to
 *   false, so the "Data collection and privacy" toggles in Settings actually
 *   read OFF and every code path gated on them takes the off-branch.
 *   (Initial version only killed the pipelines at init, which truly stops all
 *   outbound telemetry but left the toggles displaying their stale state.)
 *
 * IronFox-style feature hardening on top (the remaining Mozilla-side server
 * round-trips reachable from Fenix-level prefs, all getter-forced OFF, i.e.
 * anything that sends data to Mozilla/Pocket/Merino while browsing):
 * isDailyUsagePingEnabled (usage ping scheduling), getEnableFxSuggest and
 * getShowSponsored/NonSponsoredSuggestions (Firefox Suggest/Merino traffic
 * while typing), getShowContileFeature (sponsored top-sites ad service),
 * getShowPocketRecommendationsFeature and getShowPocketSponsoredStories
 * (Pocket feed + sponsored stories fetches on the home screen),
 * getShouldShowSearchSuggestions and getShouldShowSearchSuggestionsInPrivate
 * (typed text streamed to the search engine), and getNimbusUsePreview
 * (experiment preview enrollments). Purely LOCAL suggestion types (clipboard,
 * bookmarks, synced tabs - device DB only, no server calls) stay enabled.
 *
 * Browsing, Sync, add-ons, and all browser features are untouched. All
 * fingerprints are Mozilla's public, non-obfuscated class names and matching
 * is fail-open: if Mozilla renames one of them, that call simply stays and
 * the rest of the app patches normally.
 */
@Suppress("unused")
val blockTelemetryPatch = bytecodePatch(
    name = "Block Firefox telemetry",
    description = "IronFox-style hardening: never initializes Glean telemetry, Nimbus experiments, Sentry crash " +
        "reporting, or Adjust attribution at startup; kills Mozilla-side server traffic during browsing " +
        "(Firefox Suggest/Merino, sponsored shortcuts/Contile, Pocket feed + sponsored stories, search " +
        "suggestion streaming incl. private tabs, studies previews); and makes the telemetry toggles in " +
        "Settings read OFF. Browsing, Sync and add-ons keep working; local-only suggestions untouched.",
    default = true,
) {
    compatibleWith(FIREFOX_COMPATIBILITY)

    execute {
        // Glean: the whole metrics/telemetry pipeline inits exactly once, here.
        Fingerprint(
            definingClass = "Lorg/mozilla/fenix/components/GleanHelperKt;",
            name = "initializeGlean",
            returnType = "V",
            parameters = listOf(
                "Landroid/content/Context;",
                "Lmozilla/components/support/base/log/logger/Logger;",
                "Z",
                "Lmozilla/components/concept/fetch/Client;",
            ),
        ).method.addInstructions(0, "return-void")

        // Nimbus: experiment enrollment + experiments server sync.
        Fingerprint(
            definingClass = "Lorg/mozilla/fenix/nimbus/FxNimbus;",
            name = "initialize",
            returnType = "V",
            parameters = listOf("Lkotlin/jvm/functions/Function0;"),
        ).method.addInstructions(0, "return-void")

        // Sentry: crash-report backend init inside Mozilla's lib.crash wrapper.
        Fingerprint(
            definingClass = "Lmozilla/components/lib/crash/sentry/SentryService;",
            name = "initSentry\$lib_crash_sentry",
            returnType = "V",
            parameters = emptyList(),
        ).method.addInstructions(0, "return-void")

        // Adjust: marketing install/activation attribution service.
        Fingerprint(
            definingClass = "Lorg/mozilla/fenix/components/metrics/AdjustMetricsService;",
            name = "start",
            returnType = "V",
            parameters = emptyList(),
        ).method.addInstructions(0, "return-void")

        // Telemetry preference getters -> false, so the Settings > "Data
        // collection and privacy" toggles read OFF and every gated code path
        // takes the off-branch on top of the init kills above.
        listOf(
            // Telemetry toggles (Settings > Data collection and privacy)
            "isTelemetryEnabled",            // Technical and interaction data
            "isMarketingTelemetryEnabled",   // Marketing data (Adjust): any code path that checks it
            "isExperimentationEnabled",      // Studies / experiments (Nimbus)
            // IronFox-style server round-trips behind Fenix prefs
            "isDailyUsagePingEnabled",               // daily usage ping scheduling
            "getEnableFxSuggest",                    // Firefox Suggest (Merino) master switch
            "getShowSponsoredSuggestions",           // sponsored Suggest entries
            "getShowNonSponsoredSuggestions",        // non-sponsored Merino entries (still server traffic)
            "getShowContileFeature",                 // sponsored top-sites ad service
            "getShowPocketRecommendationsFeature",   // Pocket home feed fetch
            "getShowPocketSponsoredStories",         // sponsored Pocket stories
            "getShouldShowSearchSuggestions",        // typed text streamed to search engine
            "getShouldShowSearchSuggestionsInPrivate",// ...including private tabs
            "getNimbusUsePreview",                   // experiment preview enrollments
        ).forEach { getter ->
            Fingerprint(
                definingClass = "Lorg/mozilla/fenix/utils/Settings;",
                name = getter,
                returnType = "Z",
                accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
                parameters = emptyList(),
            ).method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """.trimIndent(),
            )
        }
    }
}
