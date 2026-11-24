package io.github.forsigh.waze

import app.morphe.patcher.patch.PatchException

/**
 * Refuses an option value the patch does not understand.
 *
 * Every choice option in this bundle is matched by its value token ("phone", "us", "2.0x"), not by
 * the label the UI shows ("Phone only", "US (white rectangle)"). A token that misses silently falls
 * through every branch: the patch reports Applied, writes nothing, and the user is left believing a
 * setting was changed. That is the exact failure mode this bundle exists to avoid, so an unknown
 * token now aborts the build instead.
 */
internal fun requireChoice(patch: String, key: String, value: String, allowed: Collection<String>) {
    if (value !in allowed) {
        throw PatchException(
            "$patch: $key='$value' is not one of ${allowed.sorted().joinToString(", ")} - " +
                "refusing to apply a change that would do nothing",
        )
    }
}

/** Same guard for numeric ranges parsed out of an option string. */
internal fun requireRange(patch: String, key: String, value: Long, min: Long, max: Long) {
    if (value !in min..max) {
        throw PatchException("$patch: $key=$value is outside $min..$max")
    }
}
