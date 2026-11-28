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

/**
 * Fail-closed guard: verify a **class the patch is about to reference** actually exists in
 * the target dex, before injecting a call to it.
 *
 * Why: injecting a reference to a library class the app does not ship produces a runtime
 * `NoClassDefFoundError` the moment the containing method is loaded — an instant crash on
 * launch, with no build-time signal. Real incident: adidas Running's "Enable dark mode"
 * injected `Landroidx/appcompat/app/AppCompatDelegate;->setDefaultNightMode(I)V`, but that
 * class is not in the adidas APK → `NoClassDefFoundError` in
 * `RuntasticApplication.onCreate` → the app could not start at all (both 14.12.1 and
 * 14.4.0). Nothing in the build or the patch log hinted at it.
 *
 * Rule: any injection that references a class *outside the app's own package* (framework
 * or library) must first call this. Framework classes are safe in practice, but libraries
 * get stripped by R8 whenever the app stops using them.
 */
fun app.morphe.patcher.patch.BytecodePatchContext.requireClass(type: String, what: String) {
    // Platform classes are provided by the OS at runtime and are never present in the
    // APK's own dex, so checking them would always fail. The guard targets classes the
    // app is expected to *bundle* (androidx/…, com.google.…, app SDKs, …).
    if (PLATFORM_PREFIXES.any { type.startsWith(it) }) return
    var found = false
    classDefForEach { classDef ->
        if (classDef.type == type) found = true
    }
    if (!found) {
        throw PatchException(
            "$what: referenced class $type is not present in this APK — R8 stripped it. " +
                "Injecting a reference would crash at runtime (NoClassDefFoundError). " +
                "Use a framework mechanism instead.",
        )
    }
}

/** Namespaces the platform supplies at runtime — never expected inside the APK dex. */
private val PLATFORM_PREFIXES = listOf(
    "Ljava/", "Ljavax/", "Ljdk/", "Lsun/", "Ldalvik/",
    "Landroid/", "Lorg/w3c/", "Lorg/xml/", "Lorg/json/", "Lorg/apache/http/",
)

/** [requireClass] for every type in [types]; throws on the first missing one. */
fun app.morphe.patcher.patch.BytecodePatchContext.requireClasses(
    types: List<String>,
    what: String,
) = types.forEach { requireClass(it, what) }
