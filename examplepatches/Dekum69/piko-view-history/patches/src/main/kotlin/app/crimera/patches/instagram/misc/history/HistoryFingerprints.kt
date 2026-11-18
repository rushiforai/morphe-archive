/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.history

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.patch.PatchException

/**
 * Resolves a history fingerprint that must match exactly one method.
 *
 * `Fingerprint.method` throws the same terse "failed to match the fingerprint" whether Instagram
 * removed the method or added a sibling next to it, and when several methods match it is not
 * obvious which one gets hooked. Both cases are expensive to diagnose on a phone, so every
 * history patch resolves through here and reports the candidates it actually saw.
 *
 * [what] is the patch-qualified name, [hint] says what to look for in the new APK. Keep the
 * anchor token (for example `viewed_impression`) inside the hint: MAINTENANCE.md maps that token
 * to the file that needs editing.
 */
internal fun Fingerprint.singleMatchOrFail(what: String, hint: String): Match {
    val matches = matchAll()
    if (matches.size == 1) return matches.single()

    val candidates = matches.joinToString("\n") {
        "  ${it.originalClassDef.type}->${it.originalMethod.name}"
    }
    throw PatchException(
        buildString {
            append(what)
            if (matches.isEmpty()) {
                append(" not found. ")
            } else {
                append(" matched ${matches.size} methods, so picking one would be a guess. ")
            }
            append(hint)
            if (candidates.isNotEmpty()) append("\nCandidates:\n").append(candidates)
        },
    )
}
