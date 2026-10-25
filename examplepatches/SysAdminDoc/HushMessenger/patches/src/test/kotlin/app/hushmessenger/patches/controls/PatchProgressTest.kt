package app.hushmessenger.patches.controls

import java.util.logging.Handler
import java.util.logging.LogRecord
import java.util.logging.Logger
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class PatchProgressTest {
    @Test fun stagesReportBeforeWorkAndOnceAfterSuccessOrFailure() {
        val messages = mutableListOf<String>()
        val logger = Logger.getLogger("HushMessenger")
        val handler = object : Handler() {
            override fun publish(record: LogRecord) { messages.add(record.message) }
            override fun flush() {}
            override fun close() {}
        }
        logger.addHandler(handler)
        try {
            assertEquals(42, patchStage("Find runtime controls") {
                assertEquals(listOf("HushMessenger: Find runtime controls started"), messages)
                42
            })
            assertEquals(2, messages.size)
            assertTrue(messages.last().matches(Regex("HushMessenger: Find runtime controls completed \\(\\d+ ms\\)")))
            val failure = IllegalStateException("private input must not appear in progress")
            assertEquals(failure, assertFailsWith<IllegalStateException> {
                patchStage("Find runtime controls") { throw failure }
            })
            assertEquals(4, messages.size)
            assertTrue(messages.last().matches(Regex("HushMessenger: Find runtime controls failed \\(\\d+ ms\\)")))
            assertTrue(messages.none { it.contains("private input") })
        } finally {
            logger.removeHandler(handler)
        }
    }
}
