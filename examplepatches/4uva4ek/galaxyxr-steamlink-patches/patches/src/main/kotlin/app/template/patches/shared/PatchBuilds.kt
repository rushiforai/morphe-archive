package app.template.patches.shared

import app.morphe.patcher.patch.Compatibility

/**
 * User-facing build line for a patch description.
 *
 * The line is derived from the same [Compatibility] list the patch passes to `compatibleWith`, so
 * adding or removing an exact base cannot leave the description stale. Groups builds that share a
 * version name and keeps exact build codes visible.
 *
 * Examples:
 * - `Build: 2.0.23/5002363.`
 * - `Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244.`
 * - Long lists fall back to codes only: `Builds: 5001712, 5001812, 5001968, 5002244, 5002363.`
 */
internal fun buildLabel(compatibilities: List<Compatibility>): String {
    val pairs = compatibilities
        .flatMap { compatibility -> compatibility.targets }
        .flatMap { target ->
            target.versionCodes.orEmpty().values.map { code -> requireNotNull(target.version) to code }
        }
        .distinct()
        .sortedWith(compareBy({ it.first }, { it.second }))
    require(pairs.isNotEmpty()) { "A patch description needs at least one exact build" }
    val byVersion = linkedMapOf<String, MutableList<Int>>()
    pairs.forEach { (version, code) ->
        byVersion.getOrPut(version) { mutableListOf() }.add(code)
    }
    val parts = byVersion.map { (version, codes) ->
        if (codes.size == 1) "$version/${codes.single()}"
        else "$version (${codes.joinToString(", ")})"
    }
    val prefix = if (pairs.size == 1) "Build" else "Builds"
    val verbose = "$prefix: ${parts.joinToString(", ")}."
    if (verbose.length <= MAX_VERBOSE_BUILD_LABEL) return verbose
    // Too long for the description budget: fall back to the exact build codes alone. Every code
    // is kept, in the same sorted order, from the same compatibility source.
    return "$prefix: ${pairs.map { it.second }.distinct().joinToString(", ")}."
}

// The description contract caps the whole build line at 100 characters including the delimiter
// that follows it; the verbose, version-grouped form must leave room for that delimiter.
internal const val MAX_VERBOSE_BUILD_LABEL = 99
