/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.extension

import java.util.logging.Handler
import java.util.logging.Level
import java.util.logging.LogRecord

/** What a block of patch code wrote to the patch log, captured off [patchLog] while it ran. */
internal object PatchLogCapture {
    /** Runs [block] and hands back the warnings it logged, each as its message. */
    fun warnings(block: () -> Unit): List<String> = messages(Level.WARNING, block)

    /**
     * Runs [block] and hands back the fine-level messages it logged, each as its message. Fine
     * messages don't show at the patch log's default level, so [block] runs with it raised, then
     * restored, the way a reader troubleshooting a build would raise it.
     */
    fun fine(block: () -> Unit): List<String> = messages(Level.FINE, block)

    private fun messages(level: Level, block: () -> Unit): List<String> {
        val records = mutableListOf<LogRecord>()
        val handler = object : Handler() {
            override fun publish(record: LogRecord) {
                synchronized(records) { records += record }
            }

            override fun flush() = Unit

            override fun close() = Unit
        }.apply { this.level = Level.ALL }
        patchLog.addHandler(handler)
        val previousLevel = patchLog.level
        patchLog.level = Level.ALL
        try {
            block()
        } finally {
            patchLog.removeHandler(handler)
            patchLog.level = previousLevel
        }
        return synchronized(records) { records.filter { it.level == level }.map { it.message } }
    }
}
