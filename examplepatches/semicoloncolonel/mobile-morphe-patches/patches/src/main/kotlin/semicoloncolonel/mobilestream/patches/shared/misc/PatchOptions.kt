package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.patch.BytecodePatch

/**
 * Whether [patch] has the boolean option [key] switched on. A merged patch's
 * parts are its dependencies, and each part checks its option with this before
 * it changes anything. False when the option does not exist or cannot be read.
 */
internal fun isOptionOn(patch: BytecodePatch, key: String): Boolean =
    runCatching { patch.options[key].value == true }.getOrDefault(false)
