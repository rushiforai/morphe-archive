import org.junit.After
import org.junit.Assert.*
import org.junit.Test
import suchi.morphe.extension.duchinese.DownloadDiagnostics

class DownloadLessonStateTest {
    private val messageId = 0x7f13020b

    @After
    fun clear() = DownloadDiagnostics.clear()

    private fun details(fragment: Any?): String {
        DownloadDiagnostics.capture(null)
        DownloadDiagnostics.appendLessonState(fragment)
        return DownloadDiagnostics.appendToMessage("Download failed", messageId).toString()
    }

    @Test
    fun reportsOriginalMetadataAndNormalizedReaderWithoutUrlValues() {
        for (url in listOf(null, "", "https://private.invalid/?token=private", " \r\n")) {
            val model = Any()
            val fragment = Any()
            DownloadDiagnostics.recordLesson(model, url)
            DownloadDiagnostics.recordCandidate(model, fragment)
            DownloadDiagnostics.acceptCandidate(fragment, url ?: "")
            val message = details(fragment)
            val expected = when (url) {
                null -> "null"
                "" -> "empty"
                else -> "nonempty"
            }
            assertTrue(message.lines().contains("Observed lesson URL: $expected"))
            assertTrue(message.lines().contains("Latest observed lesson URL: $expected"))
            assertTrue(message.lines().contains("Reader URL: ${if (url.isNullOrEmpty()) "empty" else "nonempty"}"))
            assertFalse(message.contains("private"))
            assertFalse(message.contains("https://"))
            assertFalse(message.contains("token="))
        }
    }

    @Test
    fun freezesCandidateUntilAnotherBindingAttempt() {
        val model = Any()
        val fragment = Any()
        DownloadDiagnostics.recordLesson(model, null)
        DownloadDiagnostics.recordCandidate(model, fragment)
        DownloadDiagnostics.recordLesson(model, "private later URL")
        DownloadDiagnostics.acceptCandidate(fragment, "")
        val message = details(fragment)
        assertTrue(message.lines().contains("Observed lesson URL: null"))
        assertTrue(message.lines().contains("Latest observed lesson URL: null"))
        assertTrue(message.lines().contains("Reader URL: empty"))
    }

    @Test
    fun preservesAcceptedMetadataWhenLaterCandidateIsNotAccepted() {
        val model = Any()
        val fragment = Any()
        DownloadDiagnostics.recordLesson(model, null)
        DownloadDiagnostics.recordCandidate(model, fragment)
        DownloadDiagnostics.acceptCandidate(fragment, "")
        DownloadDiagnostics.recordLesson(model, "private newer URL")
        DownloadDiagnostics.recordCandidate(model, fragment)
        val message = details(fragment)
        assertTrue(message.lines().contains("Observed lesson URL: null"))
        assertTrue(message.lines().contains("Latest observed lesson URL: nonempty"))
        assertTrue(message.lines().contains("Reader URL: empty"))
        assertFalse(message.contains("private"))
    }

    @Test
    fun keepsReadersSeparateAndPermitsSubsequentAcceptance() {
        val firstModel = Any()
        val secondModel = Any()
        val firstReader = Any()
        val secondReader = Any()
        DownloadDiagnostics.recordLesson(firstModel, "")
        DownloadDiagnostics.recordLesson(secondModel, "private URL")
        DownloadDiagnostics.recordCandidate(firstModel, firstReader)
        DownloadDiagnostics.recordCandidate(secondModel, secondReader)
        DownloadDiagnostics.acceptCandidate(firstReader, "")
        DownloadDiagnostics.acceptCandidate(secondReader, "private URL")
        assertTrue(details(firstReader).lines().contains("Observed lesson URL: empty"))
        assertTrue(details(secondReader).lines().contains("Observed lesson URL: nonempty"))
        DownloadDiagnostics.recordCandidate(secondModel, firstReader)
        DownloadDiagnostics.acceptCandidate(firstReader, "private URL")
        assertTrue(details(firstReader).lines().contains("Observed lesson URL: nonempty"))
    }

    @Test
    fun reportsUnavailableOriginsAndToleratesNullOwners() {
        DownloadDiagnostics.recordLesson(null, "private URL")
        DownloadDiagnostics.recordCandidate(null, null)
        DownloadDiagnostics.acceptCandidate(null, "private URL")
        assertEquals(3, details(null).lines().count { it.endsWith("URL: unavailable") })
        val reader = Any()
        DownloadDiagnostics.recordCandidate(Any(), reader)
        DownloadDiagnostics.acceptCandidate(reader, null)
        val message = details(reader)
        assertTrue(message.lines().contains("Observed lesson URL: unavailable"))
        assertTrue(message.lines().contains("Latest observed lesson URL: unavailable"))
        assertTrue(message.lines().contains("Reader URL: null"))
        val candidateOnly = Any()
        val model = Any()
        DownloadDiagnostics.recordLesson(model, "")
        DownloadDiagnostics.recordCandidate(model, candidateOnly)
        val candidate = details(candidateOnly)
        assertTrue(candidate.lines().contains("Observed lesson URL: unavailable"))
        assertTrue(candidate.lines().contains("Reader URL: unavailable"))
        assertTrue(candidate.lines().contains("Latest observed lesson URL: empty"))
    }

    @Test
    fun requiresCurrentCallbackDetailsAndRetainsStateAcrossRetries() {
        val model = Any()
        val reader = Any()
        DownloadDiagnostics.recordLesson(model, "")
        DownloadDiagnostics.recordCandidate(model, reader)
        DownloadDiagnostics.acceptCandidate(reader, "")
        DownloadDiagnostics.appendLessonState(reader)
        assertEquals("Original", DownloadDiagnostics.appendToMessage("Original", messageId))
        assertTrue(details(reader).lines().contains("Observed lesson URL: empty"))
        assertEquals("Original", DownloadDiagnostics.appendToMessage("Original", messageId))
        DownloadDiagnostics.capture(null)
        DownloadDiagnostics.appendLessonState(reader)
        DownloadDiagnostics.clear()
        assertEquals("Original", DownloadDiagnostics.appendToMessage("Original", messageId))
        assertTrue(details(reader).lines().contains("Observed lesson URL: empty"))
    }

    @Test
    fun sharesOnlyClassificationsAcrossCallbackThreads() {
        val model = Any()
        val reader = Any()
        DownloadDiagnostics.recordLesson(model, null)
        DownloadDiagnostics.recordCandidate(model, reader)
        DownloadDiagnostics.acceptCandidate(reader, "")
        val result = arrayOfNulls<String>(1)
        val thread = Thread { result[0] = details(reader) }
        thread.start()
        thread.join()
        assertTrue(result[0]!!.lines().contains("Observed lesson URL: null"))
        assertTrue(result[0]!!.lines().contains("Reader URL: empty"))
        DownloadDiagnostics.appendLessonState(reader)
        assertEquals("Original", DownloadDiagnostics.appendToMessage("Original", messageId))
    }
}
