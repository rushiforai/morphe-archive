package app.morphe.extension.sabp.info

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

/** Gemini: request bodies, answers and errors from canned JSON. No network. */
class GeminiTest {
    @Test
    fun bookRequestCarriesOnlyTheExcerpts() {
        val r = Gemini.bookRequest("Example Saga", "Tobin", listOf("Tobin woke up.", "Tobin ran.")).toString()
        assertTrue(r.contains("Tobin woke up.") && r.contains("Tobin ran.") && r.contains("Example Saga"))
        assertTrue(r.contains("systemInstruction"))
        assertFalse(r.contains("google_search"))
        assertFalse(r.contains("key"))
    }

    @Test
    fun webRequestUsesSearch() {
        val r = Gemini.webRequest("Example Saga", "A. Writer", "Gorran").toString()
        assertTrue(r.contains("google_search") && r.contains("Gorran") && r.contains("A. Writer"))
    }

    private fun answer(text: String) =
        """{"candidates":[{"content":{"role":"model","parts":[{"text":${org.json.JSONObject.quote(text)}}]}}]}"""

    @Test
    fun answerBecomesOneCleanLine() {
        assertEquals("Protagonist; a slave branded by the Spell.", Gemini.noteFrom(answer("\"**Protagonist; a slave branded by the Spell.**\"\n")))
        assertEquals("Second line kept when the first is empty", Gemini.noteFrom(answer("\n  \nSecond line kept when the first is empty\nmore")))
        val long = Gemini.noteFrom(answer("word ".repeat(60)))
        assertTrue(long.length <= 161 && long.endsWith("…"))
    }

    @Test
    fun thoughtPartsAreSkipped() {
        val json = """{"candidates":[{"content":{"parts":[{"text":"thinking...","thought":true},{"text":"Head of Valor clan."}]}}]}"""
        assertEquals("Head of Valor clan.", Gemini.noteFrom(json))
    }

    @Test(expected = Gemini.Failure::class)
    fun blockedAnswerIsAFailure() {
        Gemini.noteFrom("""{"promptFeedback":{"blockReason":"OTHER"}}""")
    }

    @Test
    fun errorsReadWell() {
        val bad = """{"error":{"code":400,"message":"API key not valid. Please pass a valid API key.","status":"INVALID_ARGUMENT"}}"""
        assertTrue(Gemini.errorMessage(400, bad).startsWith("The API key isn't valid"))
        assertTrue(Gemini.errorMessage(429, "{}").startsWith("Google's free limit is used up"))
        assertEquals("Gemini error 500: boom", Gemini.errorMessage(500, """{"error":{"message":"boom"}}"""))
    }

    @Test
    fun newestStableModelIsPicked() {
        val list = """{"models":[
            {"name":"models/gemini-2.5-flash-lite","supportedGenerationMethods":["generateContent"]},
            {"name":"models/gemini-3.5-flash-lite","supportedGenerationMethods":["generateContent","countTokens"]},
            {"name":"models/gemini-3.6-flash-lite-preview-09-2026","supportedGenerationMethods":["generateContent"]},
            {"name":"models/gemini-3.5-flash","supportedGenerationMethods":["generateContent"]},
            {"name":"models/gemini-4-flash","supportedGenerationMethods":["embedContent"]},
            {"name":"models/gemini-flash-lite-latest","supportedGenerationMethods":["generateContent"]}]}"""
        assertEquals("gemini-3.5-flash-lite", Gemini.pickModel(list, true))
        assertEquals("gemini-3.5-flash", Gemini.pickModel(list, false))
        assertNull(Gemini.pickModel("""{"models":[]}""", true))
        // Web search on the free tier: the newest 2.x Flash-Lite.
        assertEquals("gemini-2.5-flash-lite", Gemini.pickModel(list, true, 3.0))
        assertNull(Gemini.pickModel(list, false, 3.0))
    }

    @Test
    fun noFreeAllowanceIsNotCalledUsedUp() {
        val zero = """{"error":{"code":429,"message":"Quota exceeded for metric: generativelanguage.googleapis.com/search_grounding_request_count, limit: 0, model: gemini-3.5-flash-lite","status":"RESOURCE_EXHAUSTED"}}"""
        assertEquals("This isn't included in Google's free tier for your key.", Gemini.errorMessage(429, zero))
    }
}
