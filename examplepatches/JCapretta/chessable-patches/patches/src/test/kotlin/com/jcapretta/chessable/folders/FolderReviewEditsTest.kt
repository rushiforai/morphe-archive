package com.jcapretta.chessable.folders

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class FolderReviewEditsTest {
    // Evaluate the tiny instruction windows changed by the patch. This checks branch
    // destinations/register preservation, not a reimplementation of Chessable's queue.
    private fun run(bytes: ByteArray, registers: MutableMap<Int, Any?>): Int {
        fun u(i: Int) = bytes[i].toInt() and 0xff
        return when (u(0)) {
            8 -> { registers[u(1)] = registers[u(2)]; 3 } // Mov
            144 -> if (registers[u(2)] == true) bytes[1].toInt() else 3 // JmpTrue
            146 -> if (registers[u(2)] != true) bytes[1].toInt() else 3 // JmpFalse
            115 -> { // LoadConstString followed immediately by Throw.
                registers[u(1)] = u(2) or (u(3) shl 8)
                check(u(4) == 95)
                throw IllegalStateException("String #${registers[u(5)]}")
            }
            else -> error("Unexpected instruction ${u(0)}")
        }
    }

    @Test
    fun `premium-only branches fall through without overwriting registers`() {
        for ((index, register) in listOf(0 to 1, 1 to 3, 3 to 0)) {
            val edit = FolderReviewEdits.edits[index]
            for (premium in listOf(false, true)) {
                val registers = mutableMapOf<Int, Any?>(register to premium)
                assertEquals(3, run(edit.replacement, registers))
                assertEquals(premium, registers[register])
            }
            // Original non-PRO branch skipped the feature.
            assertEquals(edit.original[1].toInt(), run(edit.original, mutableMapOf(register to false)))
        }
    }

    @Test
    fun `random setting uses already checked review eligibility instead of premium flag`() {
        val edit = FolderReviewEdits.edits[2]
        for (premium in listOf(false, true)) {
            assertEquals(5, run(edit.replacement, mutableMapOf(5 to premium, 7 to true)))
            assertEquals(3, run(edit.replacement, mutableMapOf(5 to premium, 7 to false)))
        }
    }

    @Test
    fun `trial eligibility does not replace folder navigation`() {
        val edit = FolderReviewEdits.edits[5]
        assertEquals(40, run(edit.original, mutableMapOf(21 to true)))
        for (trialEligible in listOf(false, true)) {
            val registers = mutableMapOf<Int, Any?>(21 to trialEligible)
            assertEquals(3, run(edit.replacement, registers))
            assertEquals(trialEligible, registers[21])
        }
    }

    @Test
    fun `missing folder rejects rather than clearing folder restriction`() {
        val error = assertFailsWith<IllegalStateException> {
            run(FolderReviewEdits.edits[4].replacement, mutableMapOf(7 to null))
        }
        assertEquals("String #54979", error.message)
    }
}
