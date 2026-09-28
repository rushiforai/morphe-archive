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
    fun warnings(block: () -> Unit): List<String> {
        val records = mutableListOf<LogRecord>()
        val handler = object : Handler() {
            override fun publish(record: LogRecord) {
                synchronized(records) { records += record }
            }

            override fun flush() = Unit

            override fun close() = Unit
        }.apply { level = Level.ALL }
        patchLog.addHandler(handler)
        try {
            block()
        } finally {
            patchLog.removeHandler(handler)
        }
        return synchronized(records) { records.filter { it.level == Level.WARNING }.map { it.message } }
    }
}
