/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic

import java.io.File
import java.lang.reflect.InvocationTargetException
import java.net.URLClassLoader
import javax.tools.ToolProvider
import kotlin.io.path.createTempDirectory
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

/**
 * Unit tests of the pure Java part of the LRCLIB extension. The source is compiled here from
 * the extension module, so the tests always run against the code that is bundled.
 */
class LrcLibCoreTest {
    private val core: Class<*> by lazy { compileCore() }

    private fun call(name: String, vararg arguments: Any?): Any? {
        val method = core.declaredMethods.single { it.name == name && it.parameterCount == arguments.size }
        method.isAccessible = true
        return try {
            method.invoke(null, *arguments)
        } catch (e: InvocationTargetException) {
            throw e.targetException
        }
    }

    private fun json(text: String): Any? = call("parseJson", text)

    @Suppress("UNCHECKED_CAST")
    private fun choose(record: String, format: String) =
        call("chooseLyrics", json(record) as Map<String, Any?>, format) as Array<String>?

    @Test
    fun `urls are encoded with percent escapes`() {
        assertEquals(
            "https://lrclib.net/api/get?artist_name=Imagine%20Dragons&track_name=Believer&duration=204",
            call("buildGetUrl", "Imagine Dragons", "Believer", 204L),
        )
        assertEquals(
            "https://lrclib.net/api/get?artist_name=%D0%9A%D0%B8%D0%BD%D0%BE" +
                "&track_name=%D0%93%D1%80%D1%83%D0%BF%D0%BF%D0%B0%20%D0%BA%D1%80%D0%BE%D0%B2%D0%B8" +
                "&duration=285",
            call("buildGetUrl", "Кино", "Группа крови", 285L),
        )
        assertEquals(
            "https://lrclib.net/api/get?artist_name=AC%2FDC&track_name=T.N.T.%20%26%20more%3F",
            call("buildGetUrl", "AC/DC", "T.N.T. & more?", 0L),
        )
        assertEquals(
            "https://lrclib.net/api/search?track_name=Believer&artist_name=Imagine%20Dragons",
            call("buildSearchUrl", "Imagine Dragons", "Believer"),
        )
        assertEquals("https://lrclib.net/api/search?track_name=Believer", call("buildSearchUrl", null, "Believer"))
        assertEquals(
            "https://lrclib.net/api/search?q=%D0%9A%D0%B8%D0%BD%D0%BE%20Believer",
            call("buildQuerySearchUrl", "Кино Believer"),
        )
        assertEquals(204L, call("secondsFromMillis", 204_347L))
        assertEquals(0L, call("secondsFromMillis", 0L))
    }

    @Test
    fun `artist candidates are the joined list and then the main artist`() {
        assertEquals(
            listOf("Imagine Dragons, Lil Wayne", "Imagine Dragons & Lil Wayne", "Imagine Dragons"),
            call("artistCandidates", listOf("Imagine Dragons", " Lil Wayne ")),
        )
        assertEquals(listOf("Кино"), call("artistCandidates", listOf("Кино")))
        assertEquals(emptyList<String>(), call("artistCandidates", emptyList<String>()))
    }

    @Test
    fun `synced lyrics are preferred and normalized`() {
        val record = """{"id":1,"trackName":"Believer","duration":204.0,"instrumental":false,
            "plainLyrics":"First things first\nI'ma say all the words",
            "syncedLyrics":"[00:01.234] First things first\n[00:03.5]I'ma say all the words"}"""
        val lyrics = choose(record, "LRC")!!
        assertEquals("LRC", lyrics[0])
        assertEquals("[00:01.23]First things first\n[00:03.50]I'ma say all the words", lyrics[1])
    }

    @Test
    fun `plain lyrics are used as TEXT when synced lyrics are missing`() {
        val lyrics = choose("""{"plainLyrics":"  line one\nline two ","syncedLyrics":null}""", "LRC")!!
        assertContentEquals(arrayOf("TEXT", "line one\nline two"), lyrics)

        val empty = choose("""{"plainLyrics":"text","syncedLyrics":"   "}""", "LRC")!!
        assertEquals("TEXT", empty[0])
    }

    @Test
    fun `TEXT requests get plain lyrics or synced lyrics without timestamps`() {
        assertContentEquals(
            arrayOf("TEXT", "plain"),
            choose("""{"plainLyrics":"plain","syncedLyrics":"[00:01.00]synced"}""", "TEXT"),
        )
        assertContentEquals(
            arrayOf("TEXT", "a\nb"),
            choose("""{"plainLyrics":null,"syncedLyrics":"[00:01.00]a\n[00:02.00]b"}""", "TEXT"),
        )
    }

    @Test
    fun `instrumental and empty records have no lyrics`() {
        assertNull(choose("""{"instrumental":true,"plainLyrics":null,"syncedLyrics":null}""", "LRC"))
        assertNull(choose("""{"plainLyrics":"","syncedLyrics":""}""", "LRC"))
        assertNull(call("chooseLyrics", null, "LRC"))
    }

    @Test
    fun `lrc timestamps are normalized for the app parser`() {
        val appParser = Regex("""\[(\d{2,}):(\d\d)\.(\d\d)](.*)""")
        val normalized = call(
            "normalizeLrc",
            "[ar:Artist]\r\n[ti:Title]\n[1:02.345]late\n[00:05]no fraction\n" +
                "[00:10.1][00:30.99]chorus\nuntimed line\n[00:00.00]",
        ) as String

        assertEquals(
            listOf(
                "[00:00.00]",
                "[00:05.00]no fraction",
                "[00:10.10]chorus",
                "[00:30.99]chorus",
                "[01:02.34]late",
            ),
            normalized.lines(),
        )
        normalized.lines().forEach { line ->
            assertTrue(appParser.matches(line), "App parser rejects: $line")
        }
        assertEquals("[100:00.00]long", (call("normalizeLrc", "[100:00.00]long") as String))
    }

    @Test
    fun `search picks the closest duration and prefers synced lyrics`() {
        @Suppress("UNCHECKED_CAST")
        val results = json(
            """[
                {"id":1,"duration":180,"plainLyrics":"wrong length","syncedLyrics":"[00:01.00]x"},
                {"id":2,"duration":205,"plainLyrics":"plain only","syncedLyrics":null},
                {"id":3,"duration":206,"plainLyrics":"p","syncedLyrics":"[00:01.00]synced"},
                {"id":4,"duration":204,"instrumental":true,"plainLyrics":null,"syncedLyrics":null}
            ]""",
        ) as List<Any?>

        val best = call("pickSearchResult", results, 204L) as Map<*, *>
        assertEquals(2L, best["id"]) // 1 s away, plain: score 3; id 3 is 2 s away, synced: score 4

        val exact = call("pickSearchResult", results, 206L) as Map<*, *>
        assertEquals(3L, exact["id"])

        assertNull(call("pickSearchResult", results, 300L))
        assertNull(call("pickSearchResult", null, 204L))
    }

    @Test
    fun `titles lose credits and release variants but keep other brackets`() {
        fun clean(title: String) = call("cleanTitle", title) as String
        assertEquals("Believer", clean("Believer (feat. Lil Wayne)"))
        assertEquals("Believer", clean("Believer [ft. Lil Wayne]"))
        assertEquals("Believer", clean("Believer feat. Lil Wayne"))
        assertEquals("Here Comes the Sun", clean("Here Comes the Sun (Remastered 2009)"))
        assertEquals("Here Comes the Sun", clean("Here Comes the Sun - Remastered 2009"))
        assertEquals("Song", clean("Song – Live at Wembley"))
        assertEquals("Song", clean("Song (Radio Edit) [Explicit]"))
        assertEquals("Песня", clean("Песня (при участии Кого-то)"))
        assertEquals("Песня", clean("Песня (Ремастер)"))
        assertEquals("Song (Acoustic)", clean("Song (Acoustic)"))
        assertEquals("Song (Artist Remix)", clean("Song (Artist Remix)"))
        assertEquals("Up - Down", clean("Up - Down"))
        assertEquals("(Live)", clean("(Live)"))
        assertEquals("Feat", clean("Feat"))

        assertEquals(listOf("Believer (feat. X)", "Believer"), call("titleCandidates", "Believer (feat. X)"))
        assertEquals(listOf("Believer"), call("titleCandidates", " Believer "))
        assertEquals(emptyList<String>(), call("titleCandidates", "  "))
    }

    @Test
    fun `artists match across case, accents, punctuation and collaborations`() {
        fun matches(artists: List<String>, record: String?) = call("artistMatches", artists, record) as Boolean
        assertTrue(matches(listOf("Beyoncé"), "BEYONCE"))
        assertTrue(matches(listOf("AC/DC"), "ACDC"))
        assertTrue(matches(listOf("Imagine Dragons"), "Imagine Dragons & JID"))
        assertTrue(matches(listOf("Imagine Dragons", "JID"), "JID"))
        assertTrue(matches(listOf("Ёлка"), "Елка"))
        assertFalse(matches(listOf("Imagine Dragons"), "Coldplay"))
        assertFalse(matches(listOf("A"), "ABBA")) // one-letter names are too ambiguous
        assertFalse(matches(listOf("Кино"), null))
    }

    @Test
    fun `search results can be required to match the artist`() {
        @Suppress("UNCHECKED_CAST")
        val results = json(
            """[
                {"id":1,"artistName":"Someone Else","duration":204,"syncedLyrics":"[00:01.00]x"},
                {"id":2,"artistName":"Imagine Dragons","duration":205,"syncedLyrics":"[00:01.00]y"},
                {"id":3,"duration":204,"syncedLyrics":"[00:01.00]no artist"}
            ]""",
        ) as List<Any?>
        assertEquals(1L, (call("pickSearchResult", results, 204L) as Map<*, *>)["id"])
        assertEquals(2L, (call("pickSearchResult", results, 204L, listOf("Imagine Dragons")) as Map<*, *>)["id"])
        assertNull(call("pickSearchResult", results, 204L, listOf("Coldplay")))
    }

    @Test
    fun `lrc is shifted earlier or later and clamped at zero`() {
        val lrc = "[00:00.50]a\n[00:10.00]b\n[01:00.05]c"
        assertEquals("[00:00.20]a\n[00:09.70]b\n[00:59.75]c", call("shiftLrc", lrc, 300L))
        assertEquals("[00:01.00]a\n[00:10.50]b\n[01:00.55]c", call("shiftLrc", lrc, -500L))
        assertEquals(lrc, call("shiftLrc", lrc, 0L))
        assertEquals("[00:00.00]", call("shiftLrc", "[00:00.10]", 5000L))
    }

    @Test
    fun `cache entries round-trip and misses expire`() {
        val day = 24L * 60 * 60 * 1000
        val lyrics = arrayOf("LRC", "[00:01.00]line one\n[00:02.00]line two")
        val entry = call("encodeCacheEntry", lyrics, 1_000L) as String
        assertEquals(lyrics.toList(), (call("decodeCacheEntry", entry, 1_000L + 365 * day, 3 * day) as Array<*>).toList())

        val miss = call("encodeCacheEntry", null, 1_000L) as String
        assertEquals(0, (call("decodeCacheEntry", miss, 1_000L + day, 3 * day) as Array<*>).size)
        assertNull(call("decodeCacheEntry", miss, 1_000L + 4 * day, 3 * day))
        assertNull(call("decodeCacheEntry", miss, 0L, 3 * day)) // saved in the future: clock changed

        assertNull(call("decodeCacheEntry", "garbage", 0L, day))
        assertNull(call("decodeCacheEntry", "nyandex-lyrics-1\nx\nLRC\ny", 0L, day))
        assertNull(call("decodeCacheEntry", "nyandex-lyrics-1\n1\nRICH_JSON\n{}", 1L, day))
        assertNull(call("decodeCacheEntry", null, 0L, day))

        assertEquals("12345.LRC.txt", call("cacheFileName", "12345", "LRC"))
        assertEquals("12345_678.TEXT.txt", call("cacheFileName", "12345:678", "TEXT"))
        assertEquals(".._x.LRC.txt", call("cacheFileName", "../x", "LRC"))
    }

    @Test
    fun `every cache type but the temporary playback cache is a download`() {
        listOf("PermanentStrong", "PermanentWeak", "AutoCache", "SmartCache").forEach {
            assertTrue(call("isDownloadedCacheType", it) as Boolean, it)
        }
        assertFalse(call("isDownloadedCacheType", "TemporaryCache") as Boolean)
        assertFalse(call("isDownloadedCacheType", null) as Boolean)
    }

    @Test
    fun `cache row ids are normalized to the track model id`() {
        assertEquals("12345", call("normalizeTrackId", "12345"))
        assertEquals("12345", call("normalizeTrackId", "12345_sm"))
        assertEquals("12345", call("normalizeTrackId", "12345:678"))
        assertEquals("12345", call("normalizeTrackId", " 12345 "))
        assertNull(call("normalizeTrackId", ""))
        assertNull(call("normalizeTrackId", null))
    }

    @Test
    fun `json reader handles escapes, unicode and nesting`() {
        val value = json("""{"a":"line\n\"quoted\" Кино \/","b":[1,2.5,true,null],"c":{}}""")
            as Map<*, *>
        assertEquals("line\n\"quoted\" Кино /", value["a"])
        assertEquals(listOf(1L, 2.5, true, null), value["b"])
        assertEquals(emptyMap<String, Any>(), value["c"])
    }

    @Test
    fun `retry after header is read in seconds only`() {
        assertEquals(3000L, call("parseRetryAfterMs", "3"))
        assertEquals(0L, call("parseRetryAfterMs", " 0 "))
        assertEquals(-1L, call("parseRetryAfterMs", null))
        assertEquals(-1L, call("parseRetryAfterMs", ""))
        assertEquals(-1L, call("parseRetryAfterMs", "-1"))
        assertEquals(-1L, call("parseRetryAfterMs", "Wed, 21 Oct 2026 07:28:00 GMT"))
    }

    @Test
    fun `temporary failures are retried twice with a growing pause`() {
        assertEquals(3, core.getField("MAX_ATTEMPTS").getInt(null))
        listOf(0, 408, 429, 500, 502, 503, 504, 522, 524).forEach { status ->
            assertEquals(1000L, call("retryDelayMs", 1, status, -1L), "status $status, attempt 1")
            assertEquals(2000L, call("retryDelayMs", 2, status, -1L), "status $status, attempt 2")
            assertEquals(-1L, call("retryDelayMs", 3, status, -1L), "status $status, attempt 3 is the last")
        }
    }

    @Test
    fun `permanent failures are not retried`() {
        listOf(400, 401, 403, 405, 410, 418, 501, 505).forEach { status ->
            assertEquals(-1L, call("retryDelayMs", 1, status, -1L), "status $status")
        }
    }

    @Test
    fun `retry after is honored`() {
        assertEquals(3000L, call("retryDelayMs", 1, 429, 3000L))
        assertEquals(5000L, call("retryDelayMs", 2, 503, 5000L))
        assertEquals(0L, call("retryDelayMs", 1, 503, 0L))
        assertEquals(-1L, call("retryDelayMs", 1, 429, 60_000L), "too long a pause is not waited for")
        assertEquals(-1L, call("retryDelayMs", 3, 429, 1000L), "no attempt after the third")
    }

    private fun compileCore(): Class<*> {
        val root = generateSequence(File("").absoluteFile) { it.parentFile }
            .first { File(it, "extensions/lrclib-lyrics").isDirectory }
        val source = File(
            root,
            "extensions/lrclib-lyrics/src/main/java/app/nyandex/extension/yandexmusic/lyrics/LrcLibCore.java",
        )
        val output = createTempDirectory("lrclib-core").toFile()
        val compiler = ToolProvider.getSystemJavaCompiler()
        val result = compiler.run(null, null, null, "-d", output.path, "--release", "17", source.path)
        assertEquals(0, result, "LrcLibCore.java did not compile")

        val loader = URLClassLoader(arrayOf(output.toURI().toURL()), javaClass.classLoader)
        return loader.loadClass("app.nyandex.extension.yandexmusic.lyrics.LrcLibCore")
    }
}
