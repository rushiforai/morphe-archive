package app.hushmessenger.patches.controls

import java.util.logging.Logger

/** Fixed discovery stages keep long patch runs visible without logging any bytecode or user data. */
internal fun <T> patchStage(name: String, action: () -> T): T {
    val logger = Logger.getLogger("HushMessenger")
    logger.info("HushMessenger: $name started")
    val started = System.nanoTime()
    var completed = false
    try {
        return action().also { completed = true }
    } finally {
        val elapsed = (System.nanoTime() - started) / 1_000_000
        logger.info("HushMessenger: $name ${if (completed) "completed" else "failed"} (${elapsed} ms)")
    }
}
