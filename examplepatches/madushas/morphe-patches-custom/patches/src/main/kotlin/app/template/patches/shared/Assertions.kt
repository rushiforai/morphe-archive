/*
 * Shared fail-closed guards for patch authoring.
 *
 * Why this file exists: the single most expensive bug class in this repo is an
 * *enumeration that silently under-applies*. Two real incidents:
 *
 *  1. Strava's upsell gate compared the module type against a fixed list of five
 *     and defaulted to SHOW for unknown types → every upsell type Strava added
 *     afterwards leaked (toolbar-upsell, yis-2026-*, best-efforts-peek-*, …).
 *  2. `killPairIpFull` cleared its 18 PairIP call sites by re-reading a dexlib
 *     instruction list that had already been consumed → it "cleared 0 of 18",
 *     printed success, and the build shipped anyway.
 *
 * Neither showed up as a compile error, a build failure, or a missing "Applied:"
 * line. So the rule is: when a patch scans for candidates and then mutates them,
 * it must *notice* when the scan matched something and the mutation changed
 * nothing, and stop the build.
 *
 * Prefer, in order:
 *   1. a predicate or a single chokepoint over an enumeration (enumerations leak),
 *   2. an explicit count assertion on any scan-then-mutate step (this file),
 *   3. a plain `?: throw PatchException(...)` for a required anchor.
 */
package app.template.patches.shared

import app.morphe.patcher.patch.PatchException

/**
 * Fail-closed guard for scan-then-mutate patches.
 *
 * @param found   how many candidates the scan matched
 * @param mutated how many of them the patch actually modified
 * @param what    short label used in diagnostics, e.g. "AppsFlyer entry points"
 */
fun requireProgress(found: Int, mutated: Int, what: String) {
    if (found > 0 && mutated == 0) {
        throw PatchException(
            "$what: matched $found candidate(s) but changed none — the anchor moved. Re-audit."
        )
    }
    if (found == 0) {
        // Visible, but not fatal: the target can legitimately be absent from a given
        // build (variant / ABI / R8 shape). Silence is what we are trying to avoid.
        println("[morphe] $what: no candidates found — target may be absent in this build")
    }
}

/** Fail-closed guard for a required anchor that must exist. */
fun requireAnchor(value: Any?, what: String): Nothing? {
    if (value == null) throw PatchException("$what: anchor not found — re-audit.")
    return null
}
