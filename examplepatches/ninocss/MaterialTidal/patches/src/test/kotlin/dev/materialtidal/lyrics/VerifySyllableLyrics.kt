package dev.materialtidal.lyrics

import java.io.ByteArrayOutputStream
import java.io.File
import java.net.URLClassLoader
import java.nio.charset.StandardCharsets
import java.util.Base64
import java.util.zip.Deflater

fun main(args: Array<String>) {
    require(args.isNotEmpty()) { "Usage: VerifySyllableLyricsKt <extensionsTidalClassesDir>" }
    val classesDir = File(args[0])
    require(classesDir.isDirectory) { "Missing compiled extension classes dir: $classesDir" }

    val loader = URLClassLoader(arrayOf(classesDir.toURI().toURL()), object {}.javaClass.classLoader)

    testTtmlMultiSyllableAndDuets(loader)
    testTtmlLineOnlyFallbackReturnsNull(loader)
    testLyricsPlusParserAndFallback(loader)
    testLrclibWordAndLineParsers(loader)
    testKugouKrcDecoderAndParser(loader)
    testMatcherRanking(loader)
    testPlaybackClockInterpolation(loader)
    testSkipMetadataAndCacheIsolation(loader)

    println("ALL SYLLABLE LYRICS UNIT TESTS PASSED.")
}

private fun testTtmlMultiSyllableAndDuets(loader: ClassLoader) {
    val parserCls = loader.loadClass("dev.materialtidal.extension.tidal.player.lyrics.TtmlLyricsParser")
    val parseMethod = parserCls.getMethod("parse", String::class.java, String::class.java)

    val ttml = """
        <tt lrc:byModel="true" xmlns="http://www.w3.org/ns/ttml" xmlns:lrc="http://lrc.red/lyric-ttml-internal" xmlns:ttm="http://www.w3.org/ns/ttml#metadata" lrc:timing="Word" xml:lang="de">
          <head><metadata><ttm:agent type="person" xml:id="v1"/><ttm:agent type="person" xml:id="v2"/></metadata></head>
          <body dur="3:51.526">
            <div begin="0:03.836" end="0:29.871">
              <p begin="0:03.836" end="0:09.239" lrc:key="L1" ttm:agent="v1">
                <span begin="0:03.836" end="0:04.236">Hast</span> <span begin="0:04.236" end="0:04.506">du</span> <span begin="0:04.506" end="0:04.575">et</span><span begin="0:04.575" end="0:05.296">was</span> <span ttm:role="x-bg" begin="0:05.300" end="0:06.100"><span begin="0:05.300" end="0:05.700">(oh</span> <span begin="0:05.700" end="0:06.100">yeah)</span></span>
              </p>
              <p begin="0:18.000" end="0:20.000" lrc:key="L2" ttm:agent="v2">
                <span begin="18.000" end="19.200">東京</span><span begin="19.200" end="20.000">へ</span>
              </p>
            </div>
          </body>
        </tt>
    """.trimIndent()

    val doc = parseMethod.invoke(null, ttml, "lrc.red")
        ?: error("Expected parsed SyllableLyricsDocument")

    val docCls = doc.javaClass
    check(docCls.getField("providerName").get(doc) == "lrc.red") { "Unexpected providerName" }
    check(docCls.getField("hasWordOrSyllableTiming").getBoolean(doc)) { "Expected hasWordOrSyllableTiming=true" }
    check(docCls.getField("isAiAligned").getBoolean(doc)) { "Expected isAiAligned=true for lrc:byModel=true" }

    @Suppress("UNCHECKED_CAST")
    val lines = docCls.getField("lines").get(doc) as List<Any>
    // Line 1 ends at 6100ms, Line 2 starts at 18000ms -> gap 11900ms >= 6500ms => instrumental break inserted!
    check(lines.size == 3) { "Expected 3 lines (lead, instrumental break, duet), got ${lines.size}" }

    val line1 = lines[0]
    val lineCls = line1.javaClass
    check(lineCls.getField("fullText").get(line1) == "Hast du etwas") {
        "Expected merged word 'Hast du etwas', got '${lineCls.getField("fullText").get(line1)}'"
    }
    check(!lineCls.getField("isOppositeSide").getBoolean(line1)) { "Line 1 should be primary side" }

    @Suppress("UNCHECKED_CAST")
    val words1 = lineCls.getField("words").get(line1) as List<Any>
    check(words1.size == 3) { "Expected 3 words ('Hast', 'du', 'etwas'), got ${words1.size}" }

    val etwasWord = words1[2]
    val wordCls = etwasWord.javaClass
    check(wordCls.getField("text").get(etwasWord) == "etwas") { "Expected merged word text 'etwas'" }
    @Suppress("UNCHECKED_CAST")
    val syls = wordCls.getField("syllables").get(etwasWord) as List<Any>
    check(syls.size == 2) { "Expected 2 syllables in 'etwas', got ${syls.size}" }
    check(syls[0].javaClass.getField("text").get(syls[0]) == "et")
    check(syls[1].javaClass.getField("text").get(syls[1]) == "was")

    @Suppress("UNCHECKED_CAST")
    val bgWords1 = lineCls.getField("bgWords").get(line1) as List<Any>
    check(bgWords1.size == 2) { "Expected 2 background words, got ${bgWords1.size}" }
    check(wordCls.getField("text").get(bgWords1[0]) == "oh")
    check(wordCls.getField("text").get(bgWords1[1]) == "yeah")

    val breakLine = lines[1]
    check(lineCls.getField("isInstrumentalBreak").getBoolean(breakLine)) { "Expected instrumental break between lines" }

    val line2 = lines[2]
    check(lineCls.getField("isOppositeSide").getBoolean(line2)) { "Expected v2 duet line on opposite side" }
    @Suppress("UNCHECKED_CAST")
    val cjkWords = lineCls.getField("words").get(line2) as List<Any>
    check(cjkWords.size == 2) { "Expected CJK tokens split as individual WordGroups, got ${cjkWords.size}" }
}

private fun testTtmlLineOnlyFallbackReturnsNull(loader: ClassLoader) {
    val parserCls = loader.loadClass("dev.materialtidal.extension.tidal.player.lyrics.TtmlLyricsParser")
    val parseMethod = parserCls.getMethod("parse", String::class.java, String::class.java)

    val lineOnlyTtml = """
        <tt xmlns="http://www.w3.org/ns/ttml" xmlns:itunes="http://music.apple.com/lyric-ttml-internal" itunes:timing="Line">
          <body>
            <div>
              <p begin="00:10.000" end="00:14.000">Only line synced here</p>
              <p begin="00:15.000" end="00:19.000">No word spans at all</p>
            </div>
          </body>
        </tt>
    """.trimIndent()

    val res = parseMethod.invoke(null, lineOnlyTtml, "lrc.red")
    check(res == null) { "Line-only TTML must return null for clean TIDAL fallback" }
}

private fun testLyricsPlusParserAndFallback(loader: ClassLoader) {
    val lpCls = loader.loadClass("dev.materialtidal.extension.tidal.player.lyrics.LyricsPlusJsonParser")
    val parseLp = lpCls.getMethod("parseLyricsPlus", String::class.java, String::class.java)
    val extractBl = lpCls.getMethod("extractBetterLyricsTtml", String::class.java)

    val wordJson = """
        {
          "type": "Word",
          "metadata": { "source": "Apple" },
          "lyrics": [
            {
              "time": 1000,
              "duration": 1500,
              "element": { "singer": "v1" },
              "syllabus": [
                { "text": "Hel", "time": 1000, "duration": 250, "isBackground": false },
                { "text": "lo ", "time": 1250, "duration": 350, "isBackground": false },
                { "text": "world", "time": 1600, "duration": 900, "isBackground": false },
                { "text": "echo", "time": 2000, "duration": 400, "isBackground": true }
              ]
            },
            {
              "time": 2600,
              "duration": 1200,
              "element": { "singer": "v2" },
              "syllabus": [
                { "text": "Answer", "time": 2600, "duration": 1200, "isBackground": false }
              ]
            }
          ]
        }
    """.trimIndent()

    val doc = parseLp.invoke(null, wordJson, "LyricsPlus")
        ?: error("Expected valid LyricsPlus Word document")
    val docCls = doc.javaClass
    check(docCls.getField("providerName").get(doc) == "LyricsPlus (Apple)")
    @Suppress("UNCHECKED_CAST")
    val lines = docCls.getField("lines").get(doc) as List<Any>
    check(lines.size == 2) { "Expected 2 lines, got ${lines.size}" }
    val l1 = lines[0]
    val lineCls = l1.javaClass
    check(lineCls.getField("fullText").get(l1) == "Hello world") {
        "Expected 'Hello world', got '${lineCls.getField("fullText").get(l1)}'"
    }
    @Suppress("UNCHECKED_CAST")
    val words = lineCls.getField("words").get(l1) as List<Any>
    check(words.size == 2) { "Expected 2 words ('Hello', 'world'), got ${words.size}" }
    check(words[0].javaClass.getField("text").get(words[0]) == "Hello")
    @Suppress("UNCHECKED_CAST")
    val bgWords = lineCls.getField("bgWords").get(l1) as List<Any>
    check(bgWords.size == 1 && bgWords[0].javaClass.getField("text").get(bgWords[0]) == "echo")
    check(lineCls.getField("isOppositeSide").getBoolean(lines[1])) { "Expected v2 on opposite side" }

    val lineJson = """{"type":"Line","lyrics":[{"time":1000,"text":"Line only"}]}"""
    check(parseLp.invoke(null, lineJson, "LyricsPlus") == null) {
        "Line-type LyricsPlus response must return null"
    }

    val blJson = """{"ttml":"\u003ctt\u003ehello\u003c/tt\u003e"}"""
    check(extractBl.invoke(null, blJson) == "<tt>hello</tt>") { "Failed BetterLyrics TTML extraction" }
}

private fun testLrclibWordAndLineParsers(loader: ClassLoader) {
    val parserCls = loader.loadClass("dev.materialtidal.extension.tidal.player.lyrics.LrclibLyricsParser")
    val parseWord = parserCls.getMethod("parseWordSyncedFromJson", String::class.java, String::class.java)
    val parseLine = parserCls.getMethod("parseLineSyncedFromJson", String::class.java, String::class.java)

    val yamlExplicit = """
        version: "1.0"
        metadata:
          title: Blinding Lights
          artist: The Weeknd
        lines:
        - text: "I been "
          start_ms: 1000
          end_ms: 1800
          words:
          - text: "I "
            start_ms: 1000
            end_ms: 1300
          - text: "been "
            start_ms: 1300
            end_ms: 1800
        - text: Ooh
          start_ms: 2000
          end_ms: 3500
          words:
          - text: Ooh
            start_ms: 2000
        - text: 'I''ll wait'
          start_ms: 4000
          end_ms: 5200
          words:
          - text: 'I''ll '
            start_ms: 4000
          - text: wait
            start_ms: 4500
        plain: |
          I been
    """.trimIndent().replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n")

    val wordJson = """
        {
          "id": 390,
          "instrumental": false,
          "hasWordSync": true,
          "syncedLyrics": "[00:01.00]I been",
          "lyricsfile": "$yamlExplicit"
        }
    """.trimIndent()

    val wordDoc = parseWord.invoke(null, wordJson, "LRCLIB")
        ?: error("Expected valid LRCLIB word-synced document")
    val docCls = wordDoc.javaClass
    check(docCls.getField("providerName").get(wordDoc) == "LRCLIB")
    check(docCls.getField("hasWordOrSyllableTiming").getBoolean(wordDoc))
    check(docCls.getField("isLineSynced").getBoolean(wordDoc))

    @Suppress("UNCHECKED_CAST")
    val lines = docCls.getField("lines").get(wordDoc) as List<Any>
    check(lines.size == 3) { "Expected 3 word-synced lines, got ${lines.size}" }
    val lineCls = lines[0].javaClass
    check(lineCls.getField("fullText").get(lines[0]) == "I been")
    check(lineCls.getField("fullText").get(lines[1]) == "Ooh")
    check(lineCls.getField("fullText").get(lines[2]) == "I'll wait")

    @Suppress("UNCHECKED_CAST")
    val l2Words = lineCls.getField("words").get(lines[1]) as List<Any>
    check(l2Words.size == 1)
    check(l2Words[0].javaClass.getField("endMs").getLong(l2Words[0]) == 3500L) {
        "Single word with omitted end_ms should infer line endMs"
    }

    @Suppress("UNCHECKED_CAST")
    val l3Words = lineCls.getField("words").get(lines[2]) as List<Any>
    check(l3Words.size == 2)
    check(l3Words[0].javaClass.getField("text").get(l3Words[0]) == "I'll")
    check(l3Words[0].javaClass.getField("endMs").getLong(l3Words[0]) == 4500L) {
        "Word with omitted end_ms should infer next word startMs"
    }
    check(l3Words[1].javaClass.getField("endMs").getLong(l3Words[1]) == 5200L)

    val lineSyncJson = """
        {
          "instrumental": false,
          "hasWordSync": false,
          "syncedLyrics": "[ti:Demo]\n[offset:500]\n[00:10.50][00:40.25]Chorus line\n[00:15.00]Second line"
        }
    """.trimIndent()
    val lineDoc = parseLine.invoke(null, lineSyncJson, "LRCLIB")
        ?: error("Expected valid LRCLIB line-synced document")
    check(!docCls.getField("hasWordOrSyllableTiming").getBoolean(lineDoc))
    check(docCls.getField("isLineSynced").getBoolean(lineDoc))
    @Suppress("UNCHECKED_CAST")
    val lrcLines = docCls.getField("lines").get(lineDoc) as List<Any>
    check(lrcLines.size == 3) { "Expected 3 expanded LRC lines, got ${lrcLines.size}" }
    check(lineCls.getField("fullText").get(lrcLines[0]) == "Chorus line")
    check(lineCls.getField("startMs").getLong(lrcLines[0]) == 10_000L)
    check(lineCls.getField("startMs").getLong(lrcLines[1]) == 14_500L)
    check(lineCls.getField("startMs").getLong(lrcLines[2]) == 39_750L)

    val instrumentalJson = """
        {
          "instrumental": true,
          "hasWordSync": true,
          "syncedLyrics": "[00:01.00]Noise",
          "lyricsfile": "$yamlExplicit"
        }
    """.trimIndent()
    check(parseWord.invoke(null, instrumentalJson, "LRCLIB") == null)
    check(parseLine.invoke(null, instrumentalJson, "LRCLIB") == null)
}

private fun testKugouKrcDecoderAndParser(loader: ClassLoader) {
    val parserCls = loader.loadClass("dev.materialtidal.extension.tidal.player.lyrics.KugouKrcParser")
    val decodeMethod = parserCls.getMethod("decodeKrcBase64", String::class.java)
    val parseMethod = parserCls.getMethod(
        "parseKrcText",
        String::class.java,
        String::class.java,
        String::class.java,
        String::class.java,
    )

    val rawKrc = """
        [ti:Demo Song]
        [offset:0]
        [0,1500]<0,500,0>Demo <500,500,0>Song - <1000,500,0>Test Artist
        [2000,1200]<0,600,0>Lyrics <600,600,0>by：Writer
        [20000,2200]<0,300,0>Hel<300,400,0>lo <700,600,0>world
        [22500,1500]<0,500,0>东<500,500,0>京
    """.trimIndent()

    val krcBytes = rawKrc.toByteArray(StandardCharsets.UTF_8)
    val deflater = Deflater()
    deflater.setInput(krcBytes)
    deflater.finish()
    val compressedOut = ByteArrayOutputStream()
    val buf = ByteArray(1024)
    while (!deflater.finished()) {
        val count = deflater.deflate(buf)
        compressedOut.write(buf, 0, count)
    }
    deflater.end()
    val compressed = compressedOut.toByteArray()

    val key = byteArrayOf(
        64, 71, 97, 119, 94, 50, 116, 71, 81, 54, 49, 45,
        206.toByte(), 210.toByte(), 110, 105,
    )
    val packet = ByteArray(4 + compressed.size)
    packet[0] = 'k'.code.toByte()
    packet[1] = 'r'.code.toByte()
    packet[2] = 'c'.code.toByte()
    packet[3] = '1'.code.toByte()
    for (i in compressed.indices) {
        packet[4 + i] = (compressed[i].toInt() xor key[i % key.size].toInt()).toByte()
    }
    val b64 = Base64.getEncoder().encodeToString(packet)

    val decoded = decodeMethod.invoke(null, b64) as String
    check(decoded.contains("Hel<300,400,0>lo")) { "Unexpected decoded KRC text: $decoded" }

    val doc = parseMethod.invoke(null, decoded, "Demo Song", "Test Artist", "KuGou")
        ?: error("Expected valid KuGou KRC document")
    val docCls = doc.javaClass
    check(docCls.getField("providerName").get(doc) == "KuGou")
    check(docCls.getField("hasWordOrSyllableTiming").getBoolean(doc))

    @Suppress("UNCHECKED_CAST")
    val lines = docCls.getField("lines").get(doc) as List<Any>
    // Intro break at 1500..19600ms (since first lyric is at 20000ms >= 6500ms) + 2 lyric lines = 3
    check(lines.size == 3) { "Expected 3 lines (intro break + 2 lyric lines), got ${lines.size}" }
    val lineCls = lines[0].javaClass
    check(lineCls.getField("isInstrumentalBreak").getBoolean(lines[0]))
    check(lineCls.getField("fullText").get(lines[1]) == "Hello world") {
        "Credit lines should be stripped and Hello merged, got '${lineCls.getField("fullText").get(lines[1])}'"
    }

    @Suppress("UNCHECKED_CAST")
    val words1 = lineCls.getField("words").get(lines[1]) as List<Any>
    check(words1.size == 2)
    @Suppress("UNCHECKED_CAST")
    val helloSyls = words1[0].javaClass.getField("syllables").get(words1[0]) as List<Any>
    check(helloSyls.size == 2)
    check(helloSyls[0].javaClass.getField("text").get(helloSyls[0]) == "Hel")
    check(helloSyls[1].javaClass.getField("text").get(helloSyls[1]) == "lo")

    @Suppress("UNCHECKED_CAST")
    val cjkWords = lineCls.getField("words").get(lines[2]) as List<Any>
    check(cjkWords.size == 2) { "Expected CJK characters split as 2 WordGroups, got ${cjkWords.size}" }
}

private fun testMatcherRanking(loader: ClassLoader) {
    val matcherCls = loader.loadClass("dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsMatcher")
    val pickLrcRed = matcherCls.getMethod(
        "pickBestLrcRedIsrc",
        String::class.java,
        String::class.java,
        String::class.java,
        Int::class.javaPrimitiveType,
    )
    val pickBinimum = matcherCls.getMethod(
        "pickBestBinimumUrls",
        String::class.java,
        Int::class.javaPrimitiveType,
    )

    val lrcRedSearchJson = """
        {
          "hits": [
            { "isrc": "DE0000000002", "title": "Blinding Lights (Live)", "artist": "The Weeknd", "duration": 200.5, "byModel": true },
            { "isrc": "USUG11904206", "title": "Blinding Lights", "artist": "The Weeknd", "duration": 200.0, "byModel": false },
            { "isrc": "DE0000000099", "title": "Blinding Lights", "artist": "The Weeknd", "duration": 250.0, "byModel": false }
          ]
        }
    """.trimIndent()

    @Suppress("UNCHECKED_CAST")
    val isrcs = pickLrcRed.invoke(null, lrcRedSearchJson, "Blinding Lights (Remastered)", "The Weeknd feat. Someone", 200) as List<String>
    check(isrcs.isNotEmpty() && isrcs[0] == "USUG11904206") {
        "Expected exact/human match USUG11904206 first, got $isrcs"
    }
    check(!isrcs.contains("DE0000000099")) { "Track outside 4s duration delta should be excluded" }

    val binJson = """
        {
          "results": [
            { "lyricsUrl": "https://example.com/line.ttml", "timing_type": "line", "duration": 200 },
            { "lyricsUrl": "https://example.com/word-far.ttml", "timing_type": "word", "duration": 203 },
            { "lyricsUrl": "https://example.com/word-exact.ttml", "timing_type": "word", "duration": 200 }
          ]
        }
    """.trimIndent()

    @Suppress("UNCHECKED_CAST")
    val urls = pickBinimum.invoke(null, binJson, 200) as List<String>
    check(urls == listOf("https://example.com/word-exact.ttml", "https://example.com/word-far.ttml")) {
        "Unexpected Binimum ranking: $urls"
    }

    val pickKugou = matcherCls.getMethod(
        "pickBestKugouCandidates",
        String::class.java,
        String::class.java,
        String::class.java,
        Int::class.javaPrimitiveType,
    )
    val kgJson = """
        {
          "candidates": [
            { "id": "10", "accesskey": "k10", "song": "Blinding Lights", "singer": "The Weeknd", "duration": 200090, "score": 60, "krctype": 1 },
            { "id": "11", "accesskey": "k11", "song": "Blinding Lights", "singer": "The Weeknd", "duration": 200050, "score": 55, "krctype": 2 },
            { "id": "12", "accesskey": "k12", "song": "Blinding Lights", "singer": "The Weeknd", "duration": 240000, "score": 99, "krctype": 2 }
          ]
        }
    """.trimIndent()
    @Suppress("UNCHECKED_CAST")
    val kgCands = pickKugou.invoke(null, kgJson, "Blinding Lights", "The Weeknd", 200) as List<Any>
    check(kgCands.size == 2) { "Expected 2 KuGou candidates, got ${kgCands.size}" }
    check(kgCands[0].javaClass.getField("id").get(kgCands[0]) == "11") {
        "Expected krctype=2 candidate first"
    }

    val pickLrclib = matcherCls.getMethod(
        "pickBestLrclibRecord",
        String::class.java,
        String::class.java,
        String::class.java,
        Int::class.javaPrimitiveType,
        Boolean::class.javaPrimitiveType,
    )
    val lrclibArr = """
        [
          { "id": 1, "trackName": "Blinding Lights", "artistName": "The Weeknd", "duration": 200.0, "instrumental": true, "hasWordSync": true, "lyricsfile": "lines:" },
          { "id": 2, "trackName": "Blinding Lights", "artistName": "The Weeknd", "duration": 200.0, "instrumental": false, "hasWordSync": false, "syncedLyrics": "[00:10.00]Line" },
          { "id": 3, "trackName": "Blinding Lights", "artistName": "The Weeknd", "duration": 201.0, "instrumental": false, "hasWordSync": true, "lyricsfile": "lines:\n- text: hi" },
          { "id": 4, "trackName": "Blinding Lights", "artistName": "The Weeknd", "duration": 250.0, "instrumental": false, "hasWordSync": true, "lyricsfile": "lines:\n- text: far" }
        ]
    """.trimIndent()
    @Suppress("UNCHECKED_CAST")
    val bestLrc = pickLrclib.invoke(null, lrclibArr, "Blinding Lights", "The Weeknd", 200, true) as Map<String, Any>?
        ?: error("Expected matched LRCLIB record")
    check((bestLrc["id"] as Number).toInt() == 3) { "Expected word-synced non-instrumental hit id=3, got ${bestLrc["id"]}" }
}

private fun testPlaybackClockInterpolation(loader: ClassLoader) {
    val clockCls = loader.loadClass("dev.materialtidal.extension.tidal.player.lyrics.SyllablePlaybackClock")
    val clock = clockCls.getConstructor().newInstance()

    val onTick = clockCls.getMethod(
        "onNativeProgressTick",
        Long::class.javaPrimitiveType,
        Long::class.javaPrimitiveType,
        Long::class.javaPrimitiveType,
        Boolean::class.javaPrimitiveType,
    )
    val onState = clockCls.getMethod(
        "onPlayStateChanged",
        Boolean::class.javaPrimitiveType,
        Long::class.javaPrimitiveType,
    )
    val getPos = clockCls.getMethod(
        "getInterpolatedPositionMs",
        Long::class.javaPrimitiveType,
        Boolean::class.javaPrimitiveType,
        Boolean::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
    )
    val onSeek = clockCls.getMethod(
        "onUserSeek",
        Long::class.javaPrimitiveType,
        Long::class.javaPrimitiveType,
    )

    onState.invoke(clock, true, 1000L)
    onTick.invoke(clock, 10_000L, 180_000L, 1000L, true)

    // 100ms elapsed -> 10_100ms + 40ms visual lookahead = 10_140ms
    val p1 = getPos.invoke(clock, 1100L, true, false, 0f) as Long
    check(p1 == 10_140L) { "Expected interpolated 10140ms, got $p1" }

    // Pause at 1200ms -> anchor freezes at 10_200ms (no lookahead while paused)
    onState.invoke(clock, false, 1200L)
    val pPaused1 = getPos.invoke(clock, 1500L, false, false, 0f) as Long
    val pPaused2 = getPos.invoke(clock, 3000L, false, false, 0f) as Long
    check(pPaused1 == 10_200L && pPaused2 == 10_200L) {
        "Clock must freeze cleanly while paused: $pPaused1, $pPaused2"
    }

    // Small drift (60ms <= 200ms threshold) blends gently by 25%
    onState.invoke(clock, true, 3000L)
    onTick.invoke(clock, 10_260L, 180_000L, 3000L, false)
    val pBlend = getPos.invoke(clock, 3000L, true, false, 0f) as Long
    check(pBlend == 10_255L) { "Expected 25% blended 10215+40=10255ms, got $pBlend" }

    // Large seek jump (> 200ms) snaps immediately
    onTick.invoke(clock, 60_000L, 180_000L, 3100L, false)
    val pSnap = getPos.invoke(clock, 3100L, true, false, 0f) as Long
    check(pSnap == 60_040L) { "Expected immediate snap to 60040ms, got $pSnap" }

    // User tap-to-seek snaps immediately
    onSeek.invoke(clock, 42_000L, 3200L)
    val pUser = getPos.invoke(clock, 3200L, true, false, 0f) as Long
    check(pUser == 42_040L) { "Expected user seek to 42040ms, got $pUser" }

    // Scrub override ignores clock while dragging
    val pScrub = getPos.invoke(clock, 3200L, true, true, 0.5f) as Long
    check(pScrub == 90_000L) { "Expected scrub position 90000ms, got $pScrub" }
}

private fun testSkipMetadataAndCacheIsolation(loader: ClassLoader) {
    val fetcherCls = loader.loadClass("dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsFetcher")
    val isCompat = fetcherCls.getMethod("isMetaTitleCompatible", String::class.java, String::class.java)
    val buildKey = fetcherCls.getMethod(
        "buildRequestKey",
        String::class.java,
        String::class.java,
        String::class.java,
        Int::class.javaPrimitiveType,
    )
    val cacheIsrc = fetcherCls.getMethod("cacheTrackIsrc", String::class.java, String::class.java)
    val getIsrc = fetcherCls.getMethod("getCachedIsrc", String::class.java)

    // Matching titles (exact, feat., remaster, or empty queue title) must validate cleanly.
    check(isCompat.invoke(null, "Blinding Lights", "Blinding Lights") as Boolean)
    check(isCompat.invoke(null, "Runaway (feat. Pusha T)", "Runaway") as Boolean)
    check(isCompat.invoke(null, "Starboy - Remastered", "Starboy") as Boolean)
    check(isCompat.invoke(null, null, "Any Title") as Boolean)

    // Genuinely different track titles must be rejected so lagging PlayQueue metadata cannot leak.
    check(!(isCompat.invoke(null, "Midnight City", "Blinding Lights") as Boolean)) {
        "Stale queue track title must fail compatibility check"
    }

    // Request keys must remain distinct across skipped tracks even when duration is equal or trackId is empty.
    val keyA = buildKey.invoke(null, "1001", "Midnight City", "M83", 243) as String
    val keyB = buildKey.invoke(null, "1002", "Blinding Lights", "The Weeknd", 243) as String
    val keyBNoId = buildKey.invoke(null, null, "Blinding Lights", "The Weeknd", 243) as String
    val keyCNoId = buildKey.invoke(null, null, "Starboy", "The Weeknd", 243) as String
    check(keyA != keyB && keyBNoId != keyCNoId) {
        "Skipped songs must produce distinct cache request keys: keyA=$keyA keyB=$keyB keyBNoId=$keyBNoId keyCNoId=$keyCNoId"
    }

    // ISRC cache must isolate entries strictly by trackId.
    cacheIsrc.invoke(null, "track_skip_A", "usug11904206")
    check(getIsrc.invoke(null, "track_skip_A") == "USUG11904206")
    check(getIsrc.invoke(null, "track_skip_B") == null) {
        "New track without cached ISRC must never inherit previous track's ISRC"
    }
}
