/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.windy

import app.fakh.patches.windy.shared.Constants.COMPATIBILITY_WINDY
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile

// ── Architecture ─────────────────────────────────────────────────────────────
//
// Windy (com.windyty.android) is a Capacitor web-hybrid app. All subscription
// logic lives in a single minified JS bundle:
//
//   assets/public/v/<version>/mobile.js
//
// The version directory changes each release, so the patch scans for it.
//
// ── Subscription model ───────────────────────────────────────────────────────
//
// A custom store backed by SharedPreferences holds the `subscription` tier. A
// read goes through the in-memory cache, then persistent storage, then the
// default (`def`). Setting a key to null evicts it.
//
// Three gates guard premium features:
//
//   subscription store: null is free, any string is subscribed.
//   premium flag: `!!store.get(`subscription`)`, guards the premiumOnly store
//     getters (zoom levels, tile steps, overlay params).
//   hasAny: `store.get(`subscription`) !== null`, drives the UI (tile zoom
//     caps, 1-hour forecast step, premium calendar, paywall).
//   body.subs-{tier}: CSS class that hides the "Go Premium" buttons.
//
// When the account API answers without a subscription (on launch while logged
// out, or on logout), the app clears the store and removes the body class,
// which brings the "Go Premium" popup back.
//
// ── Patch strategy ───────────────────────────────────────────────────────────
//
// The minifier renames every identifier in each release, so each pattern matches
// the store keys and the syntax around them and captures the names it needs.
// Each pattern must match exactly once.
//

/** One replacement in the JS bundle: the only match of [pattern] becomes [replacement] of that match. */
private class JsPatch(val label: String, pattern: String, val replacement: (MatchResult) -> String) {
    val regex = Regex(pattern)
}

private val PATCHES = listOf(
    // The store returns 'premium' when nothing is stored. subscriptionInfo is falsy, so the subscription issue
    // warning stays hidden.
    JsPatch(
        label = "subscription store default",
        pattern = """(subscription:\{def:)null(,[^{}]*\},subscriptionInfo:\{def:)null""",
    ) { "${it.groupValues[1]}`premium`${it.groupValues[2]}0" },
    // The premium flag is true from module load, before the account API answers.
    JsPatch(
        label = "premium flag init",
        pattern = """([\w$]+)=!!([\w$]+)\.get\(`subscription`\),\1\|\|\2\.once\(`subscription`,([\w$]+)=>\1=!!\3\)""",
    ) { "${it.groupValues[1]}=!0" },
    JsPatch(
        label = "hasAny gate",
        pattern = """([\w$]+)=\(\)=>[\w$]+\.get\(`subscription`\)!==null""",
    ) { "${it.groupValues[1]}=()=>!0" },
    // Clearing the tier keeps the store as it is, so it still returns 'premium'.
    JsPatch(
        label = "subscription store clear",
        pattern = """[\w$]+\.set\(`subscription`,null\),[\w$]+\.set\(`subscriptionInfo`,null\)""",
    ) { "void 0" },
    // Clearing the tier adds the body class instead of removing it, which keeps "Go Premium" hidden.
    JsPatch(
        label = "body class removal",
        pattern = """classList\.remove\((`subs-\$\{[\w$]+\}`)\)""",
    ) { "classList.add(${it.groupValues[1]})" },
)

@Suppress("unused")
val windyUnlockPremiumPatch = patch(
    name = "Premium unlock",
    description = "Unlocks Windy Pro: deeper map zoom, 1-hour forecast steps and the premium screens.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WINDY)
    category("Premium")

    execute {
        // Locate the versioned JS bundle: assets/public/v/<version>/mobile.js.
        // The directory name is versioned and changes each release — never hardcode it.
        val bundleFile = resourceFile("assets/public/v")
            .listFiles()
            .orEmpty()
            .asSequence()
            .filter { it.isDirectory }
            .map { it.resolve("mobile.js") }
            .firstOrNull { it.exists() }
            ?: throw PatchException(
                "Windy: mobile.js not found under assets/public/v/<version>/mobile.js. " +
                    "The versioned directory structure may have changed.",
            )

        var bundle = bundleFile.readText()
        for (patch in PATCHES) {
            val match = patch.regex.findAll(bundle).singleOrNull() ?: throw PatchException(
                "Windy: '${patch.label}' does not match exactly once in ${bundleFile.name}. " +
                    "The JS bundle may have changed, update the pattern.",
            )
            bundle = bundle.replaceRange(match.range, patch.replacement(match))
        }

        bundleFile.writeText(bundle)
    }
}
