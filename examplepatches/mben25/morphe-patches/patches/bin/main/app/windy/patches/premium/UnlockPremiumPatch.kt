package app.windy.patches.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.windy.patches.shared.Constants.COMPATIBILITY_WINDY

// ── Architecture ─────────────────────────────────────────────────────────────
//
// Windy (com.windyty.android) is a Capacitor web-hybrid app. All subscription logic
// lives in one minified ES-module bundle:
//
//   assets/public/v/<version>/mobile.js        (51.0.1 → "51.0.1.mob.0f9e",
//                                               51.2.1 → "51.2.1.mob.683f")
//
// Only the home-screen widgets have a native premium check (see Fingerprints.kt).
//
// ── Origin of this patch ──────────────────────────────────────────────────────
//
// Merged from two third-party Windy patches:
//   * "doom"    — rawResourcePatch, same-length byte edits of mobile.js on disk.
//   * "hoodles" — bytecodePatch hooking BridgeWebViewClient.shouldInterceptRequest
//                 and regex-rewriting the mobile.js response stream at runtime via an
//                 injected extension, plus forcing the widget check to true.
//
// This port keeps doom's on-disk edits (no extension, no per-request stream copy, no
// regex on a 395 KB string on every launch) and hoodles' widget check.
//
// ── "Gray screen" investigation (2026-10-02, garnet / AlphaDroid) ─────────────
//
// Both third-party patches showed only a gray screen on launch. Attaching DevTools to
// the WebView showed the real error, thrown by leaflet-gl.js while creating the map:
//
//   webglcontextcreationerror: "disabled by site settings policy." Failed to initialize WebGL
//
// The UNPATCHED APK fails identically, and WebGL is refused on every origin
// (example.com, data:). The system WebView on that device is the "Cromite
// SystemWebView" Magisk module, and Cromite blocks WebGL by default through a content
// setting that the app cannot change. Windy 51 renders its map only through WebGL
// (leaflet-gl), so the screen stays gray. This is a WebView/device problem, not a
// patch problem: switch the WebView provider (disable the cromite-webview module).
// The JS edits below were checked separately in headless Chromium: the bundle loads,
// the UI renders and <body> gets `subs-premium`.
//
// ── Subscription model (mobile.js, 51.0.1 identifiers; see JS_PATCHES for 51.2.1) ─
//
// Store `P` (localStorage adapter mirrored to SharedPreferences):
//   P.get(key): cache.has(key) ? cache.get(key) : storage.get() ?? def
//
//   uu(info) "setTier"  : status 'active' → P.set('subscription', tier), lu(tier)
//                          adds body class `subs-${tier}`; otherwise → cu().
//   cu()     "clearTier": nulls subscription + subscriptionInfo, removes body class.
//   du()     "hasAny"   : P.get('subscription') !== null — minifest ?premium, tile zoom
//                          caps, 1h step, premium calendar, paywall components.
//   gr       flag       : !!P.get('subscription') — premiumOnly store getters.
//   body.subs-premium   : CSS hides "Go Premium" CTAs and shows premium UI.
//
// Not logged in, launch runs uu(null) → cu(), which clears everything. The edits make
// the store default to 'premium', force gr/du true, and stop cu() from clearing.

// Minifier identifiers change every release (51.0.1 → 51.2.1: store P→N, ir→sr, gr→yr,
// du→Cu), so each site is matched by a regex that captures them; only the code shape is
// pinned. The bundle is decoded as ISO-8859-1 so every byte maps to one char and back —
// regex offsets are byte offsets and non-ASCII bytes round-trip untouched.
private const val ID = """[\w$]+"""

private class JsPatch(
    val label: String,
    pattern: String,
    /** Builds the edit from the match; padded with spaces to the original length. */
    val replacement: (MatchResult) -> String,
) {
    // Literal `{` and `}` must both be escaped: the JVM accepts a bare `}`, but Android's ICU
    // regex engine rejects it. JS_PATCHES is built in this file's static initializer, so a bad
    // pattern there made the Manager reject the whole bundle ("corrupted or incomplete",
    // 0 patches). Lazy, so a pattern error can only fail this patch at execute time.
    val regex by lazy { Regex(pattern) }
}

private val JS_PATCHES = listOf(
    // P1 — subscription store defaults.
    //   def:`premium` → <store>.get('subscription') returns 'premium' on a cache/storage miss.
    //   subscriptionInfo def:0 → falsy, so getIssue returns null (no "payment issue" popup).
    //   e=>1 / nativeSync:1 are the same truthy values, freeing bytes for `premium`.
    //   nativeSync stays on, so 'premium' also reaches SharedPreferences for the widgets.
    JsPatch(
        label = "subscription store default",
        pattern = """subscription:\{def:null,allowed:e=>!0,save:!0,nativeSync:!0\},""" +
            """subscriptionInfo:\{def:null,allowed:($ID)\},""",
    ) { m ->
        "subscription:{def:`premium`,allowed:e=>1,save:!0,nativeSync:1}," +
            "subscriptionInfo:{def:0,allowed:${m.groupValues[1]}},"
    },

    // P2 — premium flag init (gr in 51.0.1, yr in 51.2.1): true at module load; the
    // once-listener becomes dead code.
    JsPatch(
        label = "premium flag init",
        pattern = """($ID)=!!($ID)\.get\(`subscription`\),\1\|\|\2\.once\(`subscription`,e=>\1=!!e\)""",
    ) { m ->
        val (flag, store) = m.destructured
        "$flag=!0,!0||$store.once(`subscription`,e=>$flag=!0)"
    },

    // P3 — hasAny() (du in 51.0.1, Cu in 51.2.1): always true.
    JsPatch(
        label = "hasAny gate",
        pattern = """($ID)=\(\)=>($ID)\.get\(`subscription`\)!==null""",
    ) { m ->
        val (fn, store) = m.destructured
        "$fn=()=>!0||$store.get(`subscription`)"
    },

    // P4 — clearTier(): drop the two <store>.set(...,null) calls so the 'premium' value is
    // never evicted from the cache nor overwritten in storage.
    JsPatch(
        label = "clearTier store clear",
        pattern = """($ID)\.set\(`subscription`,null\),\1\.set\(`subscriptionInfo`,null\)""",
    ) { "void 0" },

    // P5 — clearTier(): remove → add, so `subs-premium` is (re)applied instead of stripped.
    // e is 'premium' here thanks to P1 + P4. classList.add is idempotent.
    JsPatch(
        label = "clearTier body class direction",
        pattern = Regex.escape("e&&document.body.classList.remove(`subs-\${e}`)"),
    ) { "e&&document.body.classList.add   (`subs-\${e}`)" },
)

/** Applies [JS_PATCHES] to mobile.js on disk. */
private val unlockPremiumBundlePatch = rawResourcePatch {
    execute {
        // The bundle directory name is versioned — find it instead of hardcoding it.
        val bundleFile = get("assets/public/v")
            .listFiles()
            .orEmpty()
            .filter { it.isDirectory }
            .map { it.resolve("mobile.js") }
            .firstOrNull { it.exists() }
            ?: throw PatchException("Windy: assets/public/v/<version>/mobile.js not found.")

        var js = bundleFile.readText(Charsets.ISO_8859_1)

        for (patch in JS_PATCHES) {
            val matches = patch.regex.findAll(js).toList()
            when {
                matches.isEmpty() -> throw PatchException(
                    "Windy: '${patch.label}' not found in mobile.js — bundle changed or already patched.",
                )
                // Each site must be unique, otherwise we might be editing the wrong one.
                matches.size > 1 -> throw PatchException(
                    "Windy: '${patch.label}' matched ${matches.size} times in mobile.js.",
                )
            }
            val match = matches.single()
            val edit = patch.replacement(match)
            // Same-length edits keep every other byte offset in the bundle unchanged.
            if (edit.length > match.value.length) {
                throw PatchException("Windy: '${patch.label}' replacement longer than original.")
            }
            js = js.replaceRange(match.range, edit.padEnd(match.value.length))
        }

        bundleFile.writeText(js, Charsets.ISO_8859_1)
    }
}

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks Windy Premium UI and features client-side by patching the JS bundle " +
        "(store default 'premium', hasAny()=true, clearTier() neutralised, subs-premium body class) " +
        "and forces the widgets' native premium check to true. Server-side premium data still " +
        "requires a real subscription. Note: the map needs WebGL — it stays gray on WebViews that " +
        "block WebGL (e.g. Cromite SystemWebView).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WINDY)

    dependsOn(unlockPremiumBundlePatch)

    execute {
        // `.locals 2` in 51.0.1 (kr6.b) and 51.2.1 (ra6.b), so v0 is a plain local register.
        IsPremiumForWidgetFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
