package app.fakh.patches.windy.premium

import app.fakh.patches.windy.shared.Constants.COMPATIBILITY_WINDY
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

// ── Architecture ─────────────────────────────────────────────────────────────
//
// Windy (com.windyty.android) is a Capacitor web-hybrid app. All subscription
// logic lives entirely in a single minified JS bundle:
//
//   assets/public/v/<version>/mobile.js
//
// The bundle path uses a versioned directory (e.g. "51.3.2.mob.3c81") that
// changes each release. The patch locates it dynamically by scanning
// assets/public/v/ for any subdirectory containing mobile.js.
//
// ── Subscription model (v51.3.2 identifiers) ─────────────────────────────────
//
// Windy uses a custom store object (N in v51.3.2, was P in v51.0.1) backed by
// SharedPreferences via a localStorage adapter. The store system has three
// levels:
//
//   1. In-memory cache — set by store.set(key, value), evicted by
//      store.set(key, null).
//   2. Persistent storage — SharedPreferences; read on cache miss.
//   3. Default value (def) — used when storage.get() returns null.
//
// Two functions control the subscription state:
//
//   Au(subscriptionInfo): "setTier" — called with the server's account
//     response. With an active subscription it writes the tier string
//     (e.g. `premium`) to the store and calls ku(tier) to add the
//     `subs-${tier}` class to <body>; without one it calls Ou().
//
//   Ou(): "clearTier" — reads the current subscription value, clears the
//     `subscription` and `subscriptionInfo` stores to null, removes the
//     `subs-${e}` body class and emits a `tier/none` analytics event.
//
// Three interconnected gates guard premium features:
//
//   subscription store: def:null → N.get(`subscription`) === null is free;
//     any non-null string means subscribed.
//
//   xr (boolean flag): xr = !!N.get(`subscription`), kept in sync via
//     N.once(`subscription`, ...). Guards the premiumOnly store getters
//     (zoom levels, tile steps, overlay params, ...).
//
//   ju(): hasAny — ju = () => N.get(`subscription`) !== null. Drives the UI:
//     minifest API ?premium param, tile zoom caps, 1-hour forecast step,
//     premium calendar body class, paywall component.
//
//   body.subs-{tier}: CSS class on <body>; the stylesheet uses it to hide
//     the "Go Premium" CTAs and show premium-only UI. Added by
//     ku(tier), removed by Ou().
//
// ── Root cause of the popup ──────────────────────────────────────────────────
//
// Without patches, on app launch while logged out:
//   1. Account API responds with auth:false.
//   2. The response handler calls Au(null) → Ou().
//   3. Ou() clears the subscription store to null → ju() = false, xr = false.
//   4. Ou() removes `subs-${e}` from <body> → the premium CSS class is gone.
//   5. The Go Premium button (hidden by CSS body.subs-premium) shows and
//      triggers the subscription popup.
//
// ── Patch strategy ───────────────────────────────────────────────────────────
//
// Five same-length in-place byte replacements, targeting v51.3.2:
//
//   P1 — subscription store default (99 bytes):
//     def:null → def:`premium` — P.get returns 'premium' on a cache miss,
//     i.e. after Ou() evicts the cache entry.
//     subscriptionInfo.def:null → def:0 — falsy, so the subscription-issue
//     getter returns null → no warning popup.
//     allowed:e=>!0 → e=>1 and nativeSync:!0 → 1 keep the length equal.
//
//   P2 — xr premium flag init (63 bytes):
//     xr=!!N.get(`subscription`) → xr=!0, and the P.once registration is
//     dead-coded behind a !0|| short-circuit, so the flag is true from
//     module load, before the account API call fires.
//
//   P3 — ju() hasAny gate (35 bytes):
//     ju=()=>N.get(`subscription`)!==null → ju=()=>!0||N.get(...).
//     Always true; the store read becomes dead code.
//
//   P4 — Ou() subscription store clear (57 bytes):
//     Removes both N.set(...,null) calls (replaced with void 0, padded).
//     Prevents Ou() from writing null to SharedPreferences and evicting the
//     in-memory cache, so the subscription store keeps returning the
//     'premium' default even after Ou() runs.
//
//   P5 — Ou() body class direction (46 bytes):
//     classList.remove(`subs-${e}`) → classList.add(`subs-${e}`).
//     When Ou() fires, e = 'premium' (from P1, cache intact via P4), so
//     classList.add('subs-premium') keeps the Go Premium button hidden.
//     classList.add is idempotent.
//
// ── Stability notes ──────────────────────────────────────────────────────────
//
// All patterns target Windy-internal, structural syntax that is stable across
// minor releases: the store declaration, the store API calls, the flag
// initialiser and the DOM classList call. Minified identifier renames
// (P→N, pr→gr→xr, Hl→du→ju, zl→cu→Ou) are handled by matching the semantic
// patterns, never hardcoding names from another release — v51.3.2 renamed
// every one of them relative to v51.0.1. Each pattern must occur exactly once
// in the bundle; the in-place replacement keeps byte offsets intact.
//

/**
 * One same-length in-place replacement in the JS bundle.
 *
 * The replacement is padded with trailing spaces up to the original's byte
 * length at read time, so patch definitions only need to state the semantic
 * replacement, not hand-count filler spaces.
 */
private class JsPatch(label: String, val original: String, replacement: String) {
    /** Short diagnosis name used in [PatchException] messages. */
    val label: String = label

    /** Original bytes, exactly as they appear in the bundle. */
    val originalBytes: ByteArray = original.toByteArray(Charsets.UTF_8)

    /** Replacement bytes, space-padded to [originalBytes]' length. */
    val replacementBytes: ByteArray = replacement.toByteArray(Charsets.UTF_8).let {
        if (it.size > originalBytes.size) {
            throw IllegalArgumentException(
                "JsPatch '$label' replacement (${it.size} B) is longer than original " +
                    "(${originalBytes.size} B): $replacement",
            )
        }
        it + ByteArray(originalBytes.size - it.size) { 0x20 }
    }
}

private val PATCHES = listOf(
    // P1 — subscription store default.
    //
    // def:`premium` → N.get returns 'premium' on cache miss (after P4
    // neutralises the eviction). 'premium' matches the subs-premium CSS class
    // that hides the Go Premium button. subscriptionInfo.def:0 → the
    // subscription-issue getter receives falsy and returns null → no warning
    // popup. allowed:cr (v51.3.2) vs ir (v51.0.1) — updated for this release.
    JsPatch(
        label = "subscription store default",
        original = "subscription:{def:null,allowed:e=>!0,save:!0,nativeSync:!0},subscriptionInfo:{def:null,allowed:cr},",
        replacement = "subscription:{def:`premium`,allowed:e=>1,save:!0,nativeSync:1},subscriptionInfo:{def:0,allowed:cr},",
    ),

    // P2 — xr premium flag init. Forces xr=true at module load, before the
    // account API fires. The N.once listener stays registered but never runs
    // behind the !0|| short-circuit.
    JsPatch(
        label = "xr premium flag init",
        original = "xr=!!N.get(`subscription`),xr||N.once(`subscription`,e=>xr=!!e)",
        replacement = "xr=!0,!0||N.once(`subscription`,e=>xr=!0)",
    ),

    // P3 — ju() hasAny gate. Short-circuits to always return true; the store
    // read becomes unreachable.
    JsPatch(
        label = "ju hasAny gate",
        original = "ju=()=>N.get(`subscription`)!==null",
        replacement = "ju=()=>!0||N.get(`subscription`)",
    ),

    // P4 — Ou() subscription store clear. Prevents Ou() from writing null to
    // SharedPreferences and evicting the in-memory cache, so the subscription
    // store keeps returning 'premium' via its default even after Ou() runs.
    JsPatch(
        label = "Ou subscription store clear",
        original = "N.set(`subscription`,null),N.set(`subscriptionInfo`,null)",
        replacement = "void 0",
    ),

    // P5 — Ou() body class direction. Flips remove → add: when Ou() fires,
    // e = P.get('subscription') = 'premium' (P1 default, cache intact via P4),
    // so classList.add('subs-premium') keeps the Go Premium button hidden.
    JsPatch(
        label = "Ou body class direction",
        original = "e&&document.body.classList.remove(`subs-\${e}`)",
        replacement = "e&&document.body.classList.add(`subs-\${e}`)",
    ),
)

@Suppress("unused")
val windyUnlockPremiumPatch = rawResourcePatch(
    name = "Unlock Premium",
    description = "Unlocks Windy Pro on your phone: deeper map zoom, 1-hour forecast steps, " +
        "the premium calendar view and the rest of the premium screens, and hides the " +
        "\"Go Premium\" button. Stays unlocked when you are logged out.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WINDY)
    category("Premium")

    execute {
        // Locate the versioned JS bundle: assets/public/v/<version>/mobile.js.
        // The directory name is versioned and changes each release — never hardcode it.
        val bundleFile = get("assets/public/v")
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

        val bundle = bundleFile.readBytes()
        if (bundle.isEmpty()) throw PatchException("Windy: mobile.js is empty.")

        val patched = bundle.copyOf()

        for (patch in PATCHES) {
            val ob = patch.originalBytes
            val rb = patch.replacementBytes

            val idx = (0..patched.size - ob.size).firstOrNull { i ->
                ob.indices.all { j -> patched[i + j] == ob[j] }
            } ?: throw PatchException(
                "Windy: '${patch.label}' pattern not found in ${bundleFile.name}. " +
                    "The JS bundle may have changed — update the patch string.",
            )

            // Guard: detect double-apply.
            if (rb.indices.all { j -> patched[idx + j] == rb[j] }) {
                throw PatchException(
                    "Windy: '${patch.label}' already patched at offset $idx. " +
                        "Check the patch pipeline for a duplicate apply.",
                )
            }

            rb.copyInto(patched, idx)
        }

        bundleFile.writeBytes(patched)
    }
}
