package app.morphe.patches.util

import java.util.logging.Logger

/**
 * Shared logger for patch-time summary messages.
 *
 * Morphe Manager captures this logger in its patch log.
 */
internal val patchLogger: Logger = Logger.getLogger("OscskiPatches")

/**
 * Formats a count with the matching singular or plural noun.
 */
internal fun formatCount(count: Int, singular: String, plural: String): String =
    "$count ${if (count == 1) singular else plural}"
