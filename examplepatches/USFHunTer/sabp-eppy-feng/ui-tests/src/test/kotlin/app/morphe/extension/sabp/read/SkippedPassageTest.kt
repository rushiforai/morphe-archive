package app.morphe.extension.sabp.read

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** TranscriptSync.skipped: text the narrator skips, between two matched transcript chunks. */
class SkippedPassageTest {
    private val text = Array(300) { "w$it" }

    // Heard: text 0..19, a word the recogniser added, then text 120..139 (20..119 skipped).
    private val heard = (0 until 20).map { "w$it" } + "uh" + (120 until 140).map { "w$it" }

    private fun cand(t0: Double, t1: Double, w0: Int, w1: Int, i0: Int, i1: Int) = TranscriptSync.Cand().also {
        it.t0 = t0; it.t1 = t1; it.w0 = w0; it.w1 = w1; it.i0 = i0; it.i1 = i1
    }

    @Test
    fun narratedWordsAroundTheJumpAreNotMarked() {
        val chain = listOf(cand(0.0, 5.0, 0, 13, 0, 13), cand(8.0, 13.0, 126, 139, 27, 40))
        val sk = TranscriptSync.skipped(text, chain, heard)
        assertEquals(1, sk.size)
        assertEquals(20, sk[0][0])
        assertEquals(119, sk[0][1])
    }

    @Test
    fun aHyphenatedWordHeardAsOneWordIsStillNarrated() {
        // The text writes "door-nail" (two words), the recogniser hears "doornail", on both sides of the jump.
        val text = Array(300) { "w$it" }.also { it[18] = "door"; it[19] = "nail"; it[120] = "door"; it[121] = "nail" }
        val heard = (0 until 18).map { "w$it" } + "doornail" + "doornail" + (122 until 140).map { "w$it" }
        val chain = listOf(cand(0.0, 5.0, 0, 13, 0, 13), cand(8.0, 13.0, 126, 139, 24, 37))
        val sk = TranscriptSync.skipped(text, chain, heard)
        assertEquals(1, sk.size)
        assertEquals(20, sk[0][0])
        assertEquals(119, sk[0][1])
    }

    @Test
    fun aPassageReadInAnotherOrderIsNotASkip() {
        // Text 20..119 narrated, but its two halves swapped: the word-by-word walk stops at once.
        val heard = (0 until 20).map { "w$it" } + (70 until 120).map { "w$it" } + (20 until 70).map { "w$it" } +
                (120 until 140).map { "w$it" }
        val chain = listOf(cand(0.0, 5.0, 0, 13, 0, 13), cand(50.0, 55.0, 126, 139, 126, 139))
        assertTrue(TranscriptSync.skipped(text, chain, heard).isEmpty())
    }

    @Test
    fun audioNotTranscribedYetIsNotASkip() {
        val chain = listOf(cand(0.0, 5.0, 0, 13, 0, 13), cand(300.0, 305.0, 126, 139, 27, 40))
        assertTrue(TranscriptSync.skipped(text, chain, heard).isEmpty())
    }

    @Test
    fun smallJumpIsNoise() {
        val chain = listOf(cand(0.0, 5.0, 0, 13, 0, 13), cand(6.0, 11.0, 34, 47, 14, 27))
        assertTrue(TranscriptSync.skipped(text, chain, heard).isEmpty())
    }
}
