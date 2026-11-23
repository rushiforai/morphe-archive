/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.patches.youtube.shorts.components

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class ShortsDownloadTargetHookTest {
    @Test
    fun projectsTheFirstStringFieldInAllSupportedReelEndpoints() {
        // RawMessageInfo prefixes from stock 21.13.164, 21.39.525 and 21.45.90, respectively.
        assertEquals(8, reelVideoIdSlot(messageInfo(1, 54, 3, 2, 1, 79857908, 54, 0, 0, 18, 1, 4104, 3)))
        assertEquals(8, reelVideoIdSlot(messageInfo(1, 56, 3, 2, 1, 79857908, 56, 0, 0, 18, 1, 4104, 3)))
        assertEquals(9, reelVideoIdSlot(messageInfo(1, 60, 3, 3, 1, 79857908, 60, 0, 0, 20, 1, 4104, 3)))
    }

    @Test
    fun rejectsTheReelIdentifierInsteadOfTheVideoId() {
        assertNull(reelVideoIdSlot(messageInfo(1, 1, 0, 1, 53, 53, 1, 0, 0, 0, 53, 4104, 0)))
    }

    @Test
    fun rejectsTruncatedAndNonStringFirstFields() {
        assertNull(reelVideoIdSlot(messageInfo(1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1)))
        assertNull(reelVideoIdSlot(messageInfo(1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 4100, 0)))
    }

    private fun messageInfo(vararg values: Int): String = buildString {
        for (value in values) {
            var remaining = value
            while (remaining >= 0xd800) {
                append((0xe000 or (remaining and 0x1fff)).toChar())
                remaining = remaining ushr 13
            }
            append(remaining.toChar())
        }
    }
}
