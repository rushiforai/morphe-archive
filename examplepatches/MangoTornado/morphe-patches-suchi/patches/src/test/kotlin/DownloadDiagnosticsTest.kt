import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test
import suchi.morphe.extension.duchinese.DownloadDiagnostics
import java.net.MalformedURLException
import java.net.UnknownHostException

class DownloadDiagnosticsTest {
    private val downloadMessageId = 0x7f13020b

    class Response(
        @JvmField val a: Int,
        @JvmField val b: ByteArray?,
        @JvmField val c: Map<String, String>?,
    )

    class Error(@JvmField val x: Response?, cause: Throwable? = null) :
        Exception("private URL and token", cause)

    class BrokenAccessorsError(@JvmField val x: Response? = null) : Exception("private message") {
        override val cause: Throwable?
            get() = throw IllegalStateException("private cause failure")

        override fun getStackTrace(): Array<StackTraceElement> =
            throw IllegalStateException("private stack failure")
    }

    class MissingStackError(private val nullStack: Boolean) : Exception("private message") {
        override fun getStackTrace(): Array<StackTraceElement>? {
            if (nullStack) return null
            val valid = StackTraceElement("g5.Network", "request", "private-filename.java", 37)
            val frames = arrayOf(valid, valid)
            java.lang.reflect.Array.set(frames, 0, null)
            return frames
        }
    }

    @After
    fun clear() = DownloadDiagnostics.clear()

    @Test
    fun reportsHttpResponseWithoutExposingContent() {
        val body = "private token and response".toByteArray()
        DownloadDiagnostics.capture(
            Error(Response(403, body, mapOf(
                "content-type" to "application/json; charset=utf-8; token=private",
                "Set-Cookie" to "private cookie",
            ))),
        )
        val message = DownloadDiagnostics.appendToMessage("Download failed", downloadMessageId).toString()
        assertTrue(message.startsWith("Download failed\n\nVolley: "))
        assertTrue(message.contains("HTTP: 403"))
        assertTrue(message.contains("Response bytes: ${body.size}"))
        assertTrue(message.contains("Content-Type: application/json"))
        assertFalse(message.contains("private"))
        assertFalse(message.contains("Set-Cookie"))
    }

    @Test
    fun reportsTransportCauseWithoutInventingStatus() {
        DownloadDiagnostics.capture(Error(null, UnknownHostException("private hostname")))
        val message = DownloadDiagnostics.appendToMessage("Download failed", downloadMessageId).toString()
        assertTrue(message.contains("HTTP: unavailable (no attached response)"))
        assertTrue(message.contains("Cause: java.net.UnknownHostException"))
        assertFalse(message.contains("private hostname"))
        assertFalse(message.contains("Response bytes"))
    }

    @Test
    fun locatesWrappedRuntimeFailuresWithoutExposingMessagesOrFileMetadata() {
        val malformed = MalformedURLException("https://private.invalid/?token=private").apply {
            stackTrace = arrayOf(StackTraceElement(
                "private-loader", "private-module", "private-version",
                "java.net.URL", "<init>", "private-filename.java", 12,
            ))
            addSuppressed(IllegalStateException("private suppressed failure"))
        }
        val runtime = RuntimeException("private wrapper", malformed).apply {
            stackTrace = arrayOf(StackTraceElement(
                "private-loader", "private-module", "private-version",
                "g5.Network", "request", "private-network.java", 91,
            ))
        }
        val error = Error(null, runtime).apply {
            stackTrace = arrayOf(StackTraceElement("f5.Dispatcher", "run", "private-dispatcher.java", 22))
        }
        DownloadDiagnostics.capture(error)
        val message = DownloadDiagnostics.appendToMessage("Download failed", downloadMessageId).toString()
        assertTrue(message.contains("Volley at: f5.Dispatcher.run:22"))
        assertTrue(message.contains("Cause: java.lang.RuntimeException"))
        assertTrue(message.contains("At: g5.Network.request:91"))
        assertTrue(message.contains("Cause 2: java.net.MalformedURLException"))
        assertTrue(message.contains("At: java.net.URL.<init>:12"))
        assertFalse(message.contains("private"))
        assertFalse(message.contains("java.lang.IllegalStateException"))
    }

    @Test
    fun distinguishesEmptyRequestUrlsWithoutExposingTheirValues() {
        for (url in listOf("", "https://private.invalid/?token=private", "/private.crd", " \r\n")) {
            val malformed = MalformedURLException("private parser details")
            val runtime = RuntimeException("Bad URL $url", malformed)
            DownloadDiagnostics.capture(Error(null, runtime))
            val message = DownloadDiagnostics.appendToMessage("", downloadMessageId).toString()
            val expected = if (url.isEmpty()) "empty" else "nonempty"
            assertTrue(message.lines().contains("Request URL: $expected"))
            assertTrue(message.contains("Cause 2: java.net.MalformedURLException"))
            assertFalse(message.contains("private"))
            assertFalse(message.contains("Bad URL"))
            assertFalse(message.contains("https://"))
            assertFalse(message.contains("token="))
        }
    }

    @Test
    fun omitsUrlStateForUnrelatedOrUnrecognizedWrappers() {
        val malformed = MalformedURLException("private parser details")
        val wrappers = listOf(
            RuntimeException(null as String?, malformed),
            RuntimeException("Bad URL", malformed),
            RuntimeException("private wrapper", malformed),
            RuntimeException("Bad URL private", UnknownHostException("private hostname")),
            RuntimeException("Bad URL private", Exception("private intermediate", malformed)),
            object : RuntimeException("Bad URL ", malformed) {},
        )
        for (wrapper in wrappers) {
            DownloadDiagnostics.capture(Error(null, wrapper))
            val message = DownloadDiagnostics.appendToMessage("", downloadMessageId).toString()
            assertFalse(message.contains("Request URL:"))
            assertFalse(message.contains("private"))
            assertFalse(message.contains("Bad URL"))
        }
    }

    @Test(timeout = 1000)
    fun stopsCauseCyclesIncludingCyclesBackToTheVolleyError() {
        val first = RuntimeException("private first")
        val second = IllegalStateException("private second")
        first.initCause(second)
        second.initCause(first)
        val error = Error(null, first)
        for (throwable in listOf(error, first, second)) throwable.stackTrace = emptyArray()
        DownloadDiagnostics.capture(error)
        val message = DownloadDiagnostics.appendToMessage("", downloadMessageId).toString()
        assertTrue(message.contains("Cause: java.lang.RuntimeException"))
        assertTrue(message.contains("Cause 2: java.lang.IllegalStateException"))
        assertTrue(message.contains("Cause chain: cycle omitted"))
        assertFalse(message.contains("Cause 3:"))

        val outer = RuntimeException("private outer")
        val inner = IllegalArgumentException("private inner")
        outer.initCause(inner)
        inner.initCause(outer)
        outer.stackTrace = emptyArray()
        inner.stackTrace = emptyArray()
        DownloadDiagnostics.capture(outer)
        val outerMessage = DownloadDiagnostics.appendToMessage("", downloadMessageId).toString()
        assertTrue(outerMessage.contains("Cause: java.lang.IllegalArgumentException"))
        assertTrue(outerMessage.contains("Cause chain: cycle omitted"))
        assertFalse(outerMessage.contains("Cause 2:"))
    }

    @Test
    fun boundsCauseDepthAndOnlyMarksActuallyOmittedCauses() {
        val fifth = IllegalStateException("private fifth")
        val fourth = UnsupportedOperationException("private fourth", fifth)
        val third = IllegalArgumentException("private third", fourth)
        val second = RuntimeException("private second", third)
        val first = Exception("private first", second)
        val error = Error(null, first)
        for (throwable in listOf(error, first, second, third, fourth, fifth)) {
            throwable.stackTrace = emptyArray()
        }
        DownloadDiagnostics.capture(error)
        val message = DownloadDiagnostics.appendToMessage("", downloadMessageId).toString()
        assertTrue(message.contains("Cause 4: java.lang.UnsupportedOperationException"))
        assertTrue(message.contains("Cause chain: additional causes omitted"))
        assertFalse(message.contains("Cause 5:"))
        assertFalse(message.contains("java.lang.IllegalStateException"))
        assertFalse(message.contains("private"))

        val causes = List(4) { RuntimeException("private $it") }
        causes.zipWithNext { current, next -> current.initCause(next) }
        causes.forEach { it.stackTrace = emptyArray() }
        val exact = Error(null, causes.first()).apply { stackTrace = emptyArray() }
        DownloadDiagnostics.capture(exact)
        val exactMessage = DownloadDiagnostics.appendToMessage("", downloadMessageId).toString()
        assertTrue(exactMessage.contains("Cause 4: java.lang.RuntimeException"))
        assertFalse(exactMessage.contains("Cause chain:"))
    }

    @Test
    fun limitsDisplayedFramesForTheVolleyErrorAndItsCauses() {
        val cause = RuntimeException("private cause").apply {
            stackTrace = Array(5) { index ->
                StackTraceElement("g5.Network", "read$index", "private.java", index + 1)
            }
        }
        val error = Error(null, cause).apply {
            stackTrace = Array(5) { index ->
                StackTraceElement("f5.Dispatcher", "dispatch$index", "private.java", index + 10)
            }
        }
        DownloadDiagnostics.capture(error)
        val message = DownloadDiagnostics.appendToMessage("", downloadMessageId).toString()
        assertEquals(3, message.lines().count { it.startsWith("Volley at: ") })
        assertEquals(3, message.lines().count { it.startsWith("At: ") })
        assertTrue(message.contains("Volley at: f5.Dispatcher.dispatch2:12"))
        assertTrue(message.contains("At: g5.Network.read2:3"))
        assertFalse(message.contains("dispatch3"))
        assertFalse(message.contains("read3"))
        assertFalse(message.contains("private"))
    }

    @Test
    fun rejectsInvalidFrameIdentifiersAndOmitsUnavailableLineNumbers() {
        val cause = RuntimeException("private cause").apply {
            stackTrace = arrayOf(
                StackTraceElement("java.net.URL\nprivate", "parse", "private.java", 1),
                StackTraceElement("java.net.URL", "parse?private=1", "private.java", 2),
                StackTraceElement("a".repeat(201), "run", "private.java", 3),
                StackTraceElement("g5.Network", "a".repeat(101), "private.java", 4),
                StackTraceElement("g5.Network", "run", "private.java", -1),
                StackTraceElement("g5.Network", "<init>", "private.java", -2),
                StackTraceElement("g5.Network", "<clinit>", "private.java", 0),
            )
        }
        val error = Error(null, cause).apply { stackTrace = emptyArray() }
        DownloadDiagnostics.capture(error)
        val message = DownloadDiagnostics.appendToMessage("", downloadMessageId).toString()
        assertTrue(message.lines().contains("At: g5.Network.run"))
        assertTrue(message.lines().contains("At: g5.Network.<init>"))
        assertTrue(message.lines().contains("At: g5.Network.<clinit>"))
        assertFalse(message.contains("private"))
        assertFalse(message.contains("a".repeat(101)))
        assertFalse(message.contains(":-1"))
        assertFalse(message.contains(":-2"))
        assertFalse(message.contains(":0"))
    }

    @Test
    fun onlyScansTheFirstSixteenFrames() {
        val invalid = StackTraceElement("invalid/class", "invalid method", "private.java", 1)
        val valid = StackTraceElement("g5.Network", "request", "private.java", 27)
        val cause = RuntimeException("private cause").apply {
            stackTrace = Array(16) { invalid } + valid
        }
        val error = Error(null, cause).apply { stackTrace = emptyArray() }
        DownloadDiagnostics.capture(error)
        val message = DownloadDiagnostics.appendToMessage("", downloadMessageId).toString()
        assertFalse(message.contains("At: "))
        assertFalse(message.contains("g5.Network"))

        cause.stackTrace = Array(15) { invalid } + valid
        DownloadDiagnostics.capture(error)
        val boundaryMessage = DownloadDiagnostics.appendToMessage("", downloadMessageId).toString()
        assertTrue(boundaryMessage.contains("At: g5.Network.request:27"))
        assertFalse(boundaryMessage.contains("private"))
    }

    @Test
    fun permitsEmptyStacksAndThrowingDiagnosticAccessors() {
        val cause = RuntimeException("private cause").apply { stackTrace = emptyArray() }
        val error = Error(null, cause).apply { stackTrace = emptyArray() }
        DownloadDiagnostics.capture(error)
        val message = DownloadDiagnostics.appendToMessage("", downloadMessageId).toString()
        assertTrue(message.contains("Cause: java.lang.RuntimeException"))
        assertFalse(message.contains("At: "))

        DownloadDiagnostics.capture(BrokenAccessorsError())
        val brokenMessage = DownloadDiagnostics.appendToMessage("", downloadMessageId).toString()
        assertTrue(brokenMessage.contains("BrokenAccessorsError"))
        assertTrue(brokenMessage.contains("HTTP: unavailable (no attached response)"))
        assertFalse(brokenMessage.contains("Cause:"))
        assertFalse(brokenMessage.contains("at:"))
        assertFalse(brokenMessage.contains("private"))

        val nullStack = Error(null, MissingStackError(true)).apply { stackTrace = emptyArray() }
        DownloadDiagnostics.capture(nullStack)
        val nullStackMessage = DownloadDiagnostics.appendToMessage("", downloadMessageId).toString()
        assertTrue(nullStackMessage.contains("Cause: ${MissingStackError::class.java.name}"))
        assertFalse(nullStackMessage.contains("At: "))
        assertFalse(nullStackMessage.contains("private"))

        val nullFrame = Error(null, MissingStackError(false)).apply { stackTrace = emptyArray() }
        DownloadDiagnostics.capture(nullFrame)
        val nullFrameMessage = DownloadDiagnostics.appendToMessage("", downloadMessageId).toString()
        assertTrue(nullFrameMessage.contains("At: g5.Network.request:37"))
        assertEquals(1, nullFrameMessage.lines().count { it.startsWith("At: ") })
        assertFalse(nullFrameMessage.contains("private"))
    }

    @Test
    fun consumesDetailsOnceAndPreservesOtherMessages() {
        val original = StringBuilder("Original message")
        assertSame(original, DownloadDiagnostics.appendToMessage(original, downloadMessageId))
        DownloadDiagnostics.capture(Error(null))
        assertTrue(DownloadDiagnostics.appendToMessage(original, downloadMessageId).toString().contains("Volley: "))
        assertSame(original, DownloadDiagnostics.appendToMessage(original, downloadMessageId))
        DownloadDiagnostics.capture(Error(null))
        DownloadDiagnostics.clear()
        assertSame(original, DownloadDiagnostics.appendToMessage(original, downloadMessageId))
        DownloadDiagnostics.capture(Error(null))
        assertSame(original, DownloadDiagnostics.appendToMessage(original, 0x7f13020a))
        assertSame(original, DownloadDiagnostics.appendToMessage(original, downloadMessageId))
    }

    @Test
    fun toleratesMissingMetadataAndRejectsInvalidContentTypes() {
        DownloadDiagnostics.capture(Any())
        assertTrue(DownloadDiagnostics.appendToMessage("", downloadMessageId).toString().contains("HTTP: unavailable"))
        DownloadDiagnostics.capture(Error(Response(500, null, mapOf(
            "Content-Type" to "text/plain\r\nprivate-header",
        ))))
        val message = DownloadDiagnostics.appendToMessage("", downloadMessageId).toString()
        assertTrue(message.contains("HTTP: 500"))
        assertFalse(message.contains("Content-Type"))
        assertFalse(message.contains("private-header"))
        DownloadDiagnostics.capture(null)
        assertTrue(DownloadDiagnostics.appendToMessage("", downloadMessageId).toString().contains("Volley: unavailable"))
    }

    @Test
    fun keepsDiagnosticsOnTheCallbackThread() {
        DownloadDiagnostics.capture(Error(null))
        var otherThreadMessage: CharSequence? = null
        val thread = Thread { otherThreadMessage = DownloadDiagnostics.appendToMessage("Other", downloadMessageId) }
        thread.start()
        thread.join()
        assertEquals("Other", otherThreadMessage)
        assertTrue(DownloadDiagnostics.appendToMessage("Current", downloadMessageId).toString().contains("Volley: "))
    }
}
