package arpit.morphe.patches.alphaprogression.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import arpit.morphe.patches.alphaprogression.shared.Constants.COMPATIBILITY_ALPHA_PROGRESSION

/** Directory that holds the Vite-built web app inside the base APK. */
private const val PUBLIC_ASSETS_DIR = "assets/public/assets"

/** WebView entry page; it loads the bundle and carries the CSS gate class. */
private const val INDEX_HTML = "assets/public/index.html"

/** CSS class the stylesheet uses to switch the paid / free surfaces. */
private const val PRO_CLASS = "pro-version"

/** `<body>` exactly as shipped in 7.7.1 — no attributes, so no class yet. */
private const val BODY_TAG = "<body>"

/** `<body>` with the class that makes the paid UI visible before RevenueCat answers. */
private const val PRO_BODY_TAG = "<body class=\"$PRO_CLASS\">"

/**
 * One literal rewrite applied to the minified web bundle.
 *
 * [anchor] is the exact text shipped in 7.7.1 and must occur exactly once — a count of
 * zero or more than one means the bundle is not the build this patch was written for.
 * [replacement] is the equivalent minified expression that reports an active
 * subscription.
 */
private class BundleRewrite(
    val description: String,
    val anchor: String,
    val replacement: String,
)

/**
 * The four places that write the `proVersion` state object.
 *
 * `proVersion` is the JS object every paid surface reads (`proVersion['isActive']`, plus
 * 46 obfuscated `'isActive'` lookups in the lazy chunks). It is only ever assigned in
 * these four places, so rewriting all four removes the gate on every screen:
 * 1. the boot default, which seeds the state from `localStorage['pro-version']` and falls
 *    back to `{}` on a clean install — the window before RevenueCat answers;
 * 2. the RevenueCat listener's active-entitlement branch, which otherwise keeps the real
 *    (free) `isActive` flag;
 * 3. the same listener's "no entitlement" branch, which resets the object to `{}` — the
 *    branch a free account takes on every app start;
 * 4. the funnel that assigns the state, writes `localStorage['pro-version']` and toggles
 *    `body.pro-version` (this one alone covers the callback path, because the
 *    `ProVersion[...]({})` call from the error path also routes through it with an
 *    undefined state object).
 *
 * `expires` is the far-future sentinel 4102444800000 (2100-01-01T00:00:00Z), so no surface
 * renders the subscription as expired.
 */
private val BUNDLE_REWRITES = listOf(
    BundleRewrite(
        description = "boot default from localStorage['pro-version']",
        anchor = "localStorage[_0x316508(0x2f28)](_0x316508(0x85b)))||{}",
        replacement = "localStorage[_0x316508(0x2f28)](_0x316508(0x85b)))||{isActive:!0}",
    ),
    BundleRewrite(
        description = "RevenueCat listener, active-entitlement branch",
        anchor = "'isActive':_0x3f0c1e",
        replacement = "'isActive':!0x0",
    ),
    BundleRewrite(
        description = "RevenueCat listener, no-entitlement branch",
        anchor = "proVersion={}",
        replacement = "proVersion={'isActive':!0x0,'type':'PLAY_STORE','expires':4102444800000}",
    ),
    BundleRewrite(
        description = "funnel: state assignment, localStorage write and body class toggle",
        anchor = "proVersion=_0x4544f8",
        replacement = "proVersion=(_0x4544f8=_0x4544f8||{},_0x4544f8['isActive']=!0x0," +
            "_0x4544f8['type']=_0x4544f8['type']||'PLAY_STORE'," +
            "_0x4544f8['expires']=4102444800000,_0x4544f8)",
    ),
)

/**
 * Counts non-overlapping occurrences of [needle] in [text].
 *
 * The bundle is a single 3.2 MB minified line, so line-based checks do not apply.
 */
private fun countOccurrences(text: String, needle: String): Int {
    var count = 0
    var index = text.indexOf(needle)
    while (index >= 0) {
        count++
        index = text.indexOf(needle, index + needle.length)
    }
    return count
}

/**
 * Applies [rewrite] to [text], asserting first that its anchor occurs exactly once.
 *
 * A missing or duplicated anchor means the patch does not match the bundle, so this fails
 * loudly instead of writing a half-patched bundle (which would ship an app whose gate is
 * only partly forced).
 */
private fun applyRewrite(text: String, rewrite: BundleRewrite): String {
    val occurrences = countOccurrences(text, rewrite.anchor)
    check(occurrences == 1) {
        "Expected exactly 1 occurrence of `${rewrite.anchor}` " +
            "(${rewrite.description}) in the Alpha Progression web bundle but found " +
            "$occurrences. The patch does not match this build."
    }
    return text.replace(rewrite.anchor, rewrite.replacement)
}

/**
 * Unlocks Alpha Progression Pro.
 *
 * Alpha Progression is a Capacitor hybrid app: the whole subscription UI is rendered by a
 * Vite-built web app in `assets/public/`, and `classes.dex` holds no meaningful gate
 * (4 app-owned classes, all Capacitor bridge plumbing). The client-side gate is two
 * things:
 * - `proVersion['isActive']`, the single JS object every paid surface reads, and
 * - `body.pro-version`, which the stylesheet uses to hide `free-version-only` elements and
 *   show `pro-version-only` ones.
 *
 * The patch therefore edits assets only:
 * 1. rewrites the four `proVersion` state writes in the main `index-*.js` bundle (found
 *    dynamically, never by hard-coded content hash) so `isActive` is forced to `!0x0` and
 *    a missing entitlement is seeded as an active `PLAY_STORE` subscription with a
 *    far-future `expires`;
 * 2. adds the `pro-version` class to `<body>` in `index.html`, so the paid UI is already
 *    visible in the window before RevenueCat's first `customerInfoUpdated` event.
 *
 * What is deliberately left alone:
 * - RevenueCat still receives the account's real (free) state. `Purchases.getCustomerInfo()`
 *   and the `addCustomerInfoUpdateListener` registration are untouched, and the purchase /
 *   restore flows keep working — the app simply ignores the answer.
 * - No network call is added, intercepted or rewritten, and no request/response body is
 *   replaced, so Play Integrity and Firebase App Check attestation is unchanged.
 * - Anything the server owns (account, workout history, synced programs) still comes from
 *   the real backend with the real entitlement.
 *
 * Deployment note: this build carries Google Play PairIP, but no root is required. The patch
 * is asset-only and the output is a normal re-signed APK. A working asset-only patch for this
 * app (hoomans-morphe-patches, 6.8.1/7.1.1) declares no PairIP dependency and is installed
 * normally, so re-signed sideload is the expected route. No PairIP bypass is part of this
 * patch; add one only if device testing shows `SignatureCheck.verifyIntegrity()` or
 * `LicenseClient.checkLicense()` actually rejecting the re-signed build. Root + mount is a
 * fallback, not the default.
 */
@Suppress("unused")
val unlockProPatch = rawResourcePatch(
    name = "Unlock Pro",
    description = "Unlocks all Pro features by forcing the web app's own client-side " +
        "subscription gate (`proVersion.isActive` and the `pro-version` body class) to " +
        "active. RevenueCat, Play Billing and the account's real server-side entitlement " +
        "are left untouched.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALPHA_PROGRESSION)

    execute {
        // The bundle name carries a Vite content hash that changes on every release, so
        // resolve it from the extracted asset directory instead of hard-coding it.
        val assetsDir = get(PUBLIC_ASSETS_DIR)
        val bundles = assetsDir.listFiles()
            ?.filter { it.isFile && it.name.startsWith("index-") && it.extension == "js" }
            .orEmpty()
        if (bundles.size != 1) {
            throw PatchException(
                "Expected exactly one `index-*.js` bundle in $PUBLIC_ASSETS_DIR but found " +
                    "${bundles.size}: ${bundles.map { it.name }}."
            )
        }

        val bundle = bundles.single()
        val original = bundle.readText(Charsets.UTF_8)
        val patched = BUNDLE_REWRITES.fold(original) { text, rewrite ->
            applyRewrite(text, rewrite)
        }

        // Post-check: none of the anchors may survive in the patched bundle.
        BUNDLE_REWRITES.forEach { rewrite ->
            check(countOccurrences(patched, rewrite.anchor) == 0) {
                "Anchor `${rewrite.anchor}` is still present in ${bundle.name} after " +
                    "patching. Aborting instead of shipping a partial patch."
            }
        }

        bundle.writeText(patched, Charsets.UTF_8)

        // `body.pro-version` is the second half of the gate: the stylesheet keys the paid
        // / free surfaces off it, and the bundle only adds it after a RevenueCat answer.
        val indexHtml = get(INDEX_HTML)
        if (!indexHtml.isFile) throw PatchException("$INDEX_HTML not found.")

        val html = indexHtml.readText(Charsets.UTF_8)
        val bodyTags = Regex("<body\\b[^>]*>", RegexOption.IGNORE_CASE).findAll(html).toList()
        check(bodyTags.size == 1 && bodyTags.single().value == BODY_TAG) {
            "Expected exactly one `<body>` tag without attributes in $INDEX_HTML but found " +
                "${bodyTags.map { it.value }}."
        }

        val patchedHtml = html.replace(BODY_TAG, PRO_BODY_TAG)
        check(countOccurrences(patchedHtml, PRO_BODY_TAG) == 1) {
            "$PRO_BODY_TAG was not added to $INDEX_HTML."
        }

        indexHtml.writeText(patchedHtml, Charsets.UTF_8)
    }
}
