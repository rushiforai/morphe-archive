package com.jcapretta.chessable.offline

import kotlin.test.Test
import kotlin.test.assertEquals

class OfflineEditsTest {
    private fun edit(name: String) = OfflineEdits.edits.single { it.name == name }

    // Interpret the changed branch window, including its signed relative target.
    private fun branch(name: String, registers: Map<Int, Boolean?>): Int {
        val edit = edit(name)
        val code = edit.replacement
        assertEquals(0x92, code[0].toInt() and 0xff)
        return edit.offset + if (registers[code[2].toInt()] != true) code[1].toInt() else 3
    }

    @Test
    fun `offline startup rejoins cached authentication for both account tiers`() {
        for (premium in listOf(false, true)) {
            // The unchanged preceding guard admits this instruction only when
            // isInternetReachable is exactly false. The JWT/sign-out path follows.
            assertEquals(0x6c3742, branch("Offline startup", mapOf(6 to premium, 7 to false)))
        }
        assertEquals(0x6c3715, branch("Offline startup", mapOf(7 to true)))
        assertEquals(listOf(8, 2, 2), edit("Offline route recovery").replacement.map { it.toInt() })
    }

    @Test
    fun `persisted session is decoded before rejoining the original setJwt path`() {
        assertEquals(0x6c3715, branch("Restore decoded session", mapOf(8 to false)))
        val code = edit("Decode stored session").replacement.map { it.toInt() and 0xff }
        // CreateClosure r8,env4,#10177: existing environment-free JSON.parse callback.
        assertEquals(listOf(0x64, 8, 4, 0xc1, 0x27), code.take(5))
        // Call2 r6,r8,undefined(r1),r6; Mov r3,r6.
        assertEquals(listOf(0x53, 6, 8, 1, 6, 8, 3, 6), code.subList(5, 13))
        assertEquals(0x8e, code[13])
        assertEquals(0x6c378e, 0x6c3715 + 13 + code[14])
        assertEquals(42, code.size)
        for (padding in code.drop(15).chunked(3)) assertEquals(listOf(8, 9, 9), padding)
    }

    @Test
    fun `feature gates only load their local boolean register`() {
        for ((name, register) in listOf(
            "Offline dashboard" to 1,
            "Offline dashboard refresh" to 0,
            "Offline course page" to 1,
            "Offline status banner" to 0,
            "Offline course download" to 1,
            "Offline video controls" to 8,
            "Offline video download" to 3,
            "Offline video placeholder" to 12,
        )) {
            val code = edit(name).replacement
            assertEquals(edit(name).original.size, code.size)
            for (instruction in code.toList().chunked(2)) {
                assertEquals(listOf(0x78, register), instruction.map { it.toInt() and 0xff })
            }
        }
        // Not r8,r12 uses the existing true register to hide the PRO badge.
        assertEquals(listOf(11, 8, 12), edit("Offline download badge").replacement.map { it.toInt() })
    }
}
