/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-31.
 */

package app.morphe.extension.youtube.patches.general.offline;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class OfflineSubtitleTest {
    @Test
    public void measuredZooCaptionPreservesLineBreaksAndGaps() {
        String json = """
                {"events":[
                  {"tStartMs":1200,"dDurationMs":2160,"segs":[
                    {"utf8":"All right, so here we are, in front of the\\nelephants"}]},
                  {"tStartMs":5318,"dDurationMs":2656,"segs":[
                    {"utf8":"the cool thing about these guys is that they\\nhave really..."}]}
                ]}
                """;
        var cues = OfflineSubtitle.parseJson3(json, false);
        assertEquals(2, cues.size());
        assertEquals(3360, cues.get(0).endMs());
        assertTrue(cues.get(0).text().contains("\nelephants"));
        assertEquals("", OfflineSubtitle.textAt(cues, 4000));
        assertEquals(cues.get(1).text(), OfflineSubtitle.textAt(cues, 5318));
        assertEquals("", OfflineSubtitle.textAt(cues, 7974));
        assertEquals(cues.get(0).text(), OfflineSubtitle.textAt(cues, 1200));
    }

    @Test
    public void asrDuplicatesAppendAndOverlapDoNotProduceDoubleCaptions() {
        String json = """
                {"events":[
                  {"tStartMs":0,"dDurationMs":2000,"segs":[{"utf8":">> Hello [Music]"}]},
                  {"tStartMs":500,"dDurationMs":2500,"segs":[{"utf8":"Hello"}]},
                  {"tStartMs":800,"dDurationMs":100,"aAppend":1,"segs":[{"utf8":"ignore me"}]},
                  {"tStartMs":2200,"dDurationMs":1000,"segs":[{"utf8":"Next"}]},
                  {"tStartMs":2300,"dDurationMs":0,"segs":[{"utf8":"invalid"}]},
                  {"tStartMs":2300,"dDurationMs":100,"segs":[{"utf8":" [Applause] "}]},
                  {"tStartMs":2400,"dDurationMs":100},
                  {"tStartMs":2500,"dDurationMs":100,"segs":[]}
                ]}
                """;
        assertEquals(List.of(new OfflineSubtitle.Cue(0, 2200, "Hello"),
                new OfflineSubtitle.Cue(2200, 3200, "Next")), OfflineSubtitle.parseJson3(json, true));
    }

    @Test
    public void sameStartRollingEventsAndUnsortedInputHavePositiveNonoverlappingWindows() {
        String json = """
                {"events":[
                  {"tStartMs":1000,"dDurationMs":500,"segs":[{"utf8":"Second"}]},
                  {"tStartMs":0,"dDurationMs":2000,"segs":[{"utf8":"Fir"}]},
                  {"tStartMs":0,"dDurationMs":2000,"segs":[{"utf8":"First"}]}
                ]}
                """;
        assertEquals(List.of(new OfflineSubtitle.Cue(0, 1000, "First"),
                new OfflineSubtitle.Cue(1000, 1500, "Second")), OfflineSubtitle.parseJson3(json, true));
    }

    @Test
    public void htmlEntitiesNewlinesAndFractionalTimesSurviveSrtAndVtt() {
        String json = """
                {"events":[{"tStartMs":999.6,"dDurationMs":1000,
                  "segs":[{"utf8":"&gt;&gt; Caf&eacute; &amp; tea<br>你好 &#39;hi&#39;"}]}]}
                """;
        var cues = OfflineSubtitle.parseJson3(json, false);
        assertEquals(List.of(new OfflineSubtitle.Cue(1000, 2000, "Café & tea\n你好 'hi'")), cues);
        String srt = "1\n00:00:01,000 --> 00:00:02,000\nCafé &amp; tea\n你好 'hi'\n\n";
        assertEquals(srt, OfflineSubtitle.write(cues, "srt"));
        String vtt = "WEBVTT\n\n1\n00:00:01.000 --> 00:00:02.000\nCafé &amp; tea\n你好 'hi'\n\n";
        assertEquals(vtt, OfflineSubtitle.write(cues, "vtt"));
        assertEquals(vtt, new String(vtt.getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8));
    }

    @Test
    public void writersCarrySecondsMinutesAndHoursWithoutFourDigitMilliseconds() {
        var cues = List.of(new OfflineSubtitle.Cue(59_999, 60_001, "boundary"),
                new OfflineSubtitle.Cue(3_599_999, 3_600_001, "hour"));
        assertEquals("1\n00:00:59,999 --> 00:01:00,001\nboundary\n\n"
                + "2\n00:59:59,999 --> 01:00:00,001\nhour\n\n", OfflineSubtitle.write(cues, "srt"));
        assertEquals("WEBVTT\n\n", OfflineSubtitle.write(List.of(), "vtt"));
        assertEquals("", OfflineSubtitle.write(List.of(), "srt"));
        assertEquals(List.of(), OfflineSubtitle.parseJson3("{\"events\":[]}", true));
    }

    @Test
    public void filenamesCannotEscapeTheSubtitleDirectoryAndDistinguishKinds() {
        assertEquals(".._bad_title__ [abc12345678].en.auto.srt",
                OfflineSubtitle.fileName("../bad:title?* . ", "abc12345678", "en", "asr", "", "srt"));
        assertEquals("Video [abc12345678].en.fr.vtt",
                OfflineSubtitle.fileName("Video", "abc12345678", "en", "translated", "fr", "vtt"));
        String unicode = OfflineSubtitle.fileName("🎬".repeat(200), "abc12345678", "zh-Hant", "", "", "srt");
        assertTrue(unicode.getBytes(StandardCharsets.UTF_8).length <= 255);
        assertFalse(unicode.contains("\uFFFD"));
        assertFalse(OfflineSubtitle.fileName("\n/", "id", "en", "", "", "srt").contains("/"));
    }

    @Test
    public void translatedAndNativeChoicesShareOneCapAndCanBeDeselectedAtTheCap() {
        Set<String> selected = new LinkedHashSet<>();
        for (String key : List.of("en", "fr", "translate:de", "translate:es", "ja")) {
            assertTrue(OfflineSubtitle.select(selected, key, true));
        }
        assertEquals(5, selected.size());
        assertFalse(OfflineSubtitle.select(selected, "translate:ko", true));
        assertTrue(OfflineSubtitle.select(selected, "en", true));
        assertTrue(OfflineSubtitle.select(selected, "fr", false));
        assertTrue(OfflineSubtitle.select(selected, "translate:ko", true));
        assertEquals(5, selected.size());
    }

    @Test
    public void repeatedVideoDownloadsKeepTheExtensionAndUseTheFirstFreeSuffix() {
        String name = OfflineSubtitle.fileName("Same video", "abcdefghijk", "en", "", "", "vtt");
        Set<String> existing = new LinkedHashSet<>();
        assertEquals("Same video [abcdefghijk].en.vtt", OfflineSubtitle.uniqueName(name, existing::contains));
        existing.add(name);
        String second = OfflineSubtitle.uniqueName(name, existing::contains);
        assertEquals("Same video [abcdefghijk].en (2).vtt", second);
        existing.add(second);
        assertEquals("Same video [abcdefghijk].en (3).vtt", OfflineSubtitle.uniqueName(name, existing::contains));
        existing.remove(name);
        assertEquals(name, OfflineSubtitle.uniqueName(name, existing::contains));
    }

    @Test
    public void rateLimitsIncludeEmpty429AndSorryHtmlAtAnyStatusButNotJsonCaptionText() {
        assertTrue(OfflineSubtitle.isRateLimited(429, ""));
        assertTrue(OfflineSubtitle.isRateLimited(200,
                "  <!DOCTYPE html><HTML><HEAD><TITLE> Sorry... </TITLE></HEAD></HTML>"));
        assertTrue(OfflineSubtitle.isRateLimited(403,
                "<html>Our systems have detected unusual traffic from your computer network.</html>"));
        assertFalse(OfflineSubtitle.isRateLimited(200,
                "{\"events\":[{\"segs\":[{\"utf8\":\"Sorry, unusual traffic\"}]}]}"));
        assertFalse(OfflineSubtitle.isRateLimited(500, "<html><title>Internal server error</title></html>"));
        assertFalse(OfflineSubtitle.isRateLimited(200, ""));
    }

    @Test
    public void anonymousSessionCopiesOnlyVisitorCookiesAndDiscardsAttributesAndAuthentication() {
        Map<String, List<String>> headers = Map.of("Set-Cookie", List.of(
                "VISITOR_INFO1_LIVE=visitor; Domain=.youtube.com; Secure; HttpOnly",
                "YSC=session; Path=/; Secure; HttpOnly",
                "SAPISID=never-forward; Secure",
                "__Secure-ROLLOUT_TOKEN=rollout; Secure",
                "GPS=; Max-Age=0",
                "malformed"));
        assertEquals("VISITOR_INFO1_LIVE=visitor; YSC=session; __Secure-ROLLOUT_TOKEN=rollout",
                OfflineSubtitle.visitorCookies(headers));
    }

    @Test
    public void anonymousSessionNeedsARealVisitorCookieAndAcceptsCaseInsensitiveHeaderNames() {
        assertEquals("", OfflineSubtitle.visitorCookies(Map.of("Set-Cookie", List.of("YSC=session"))));
        assertEquals("", OfflineSubtitle.visitorCookies(Map.of("Content-Type", List.of("text/html"))));
        assertEquals("VISITOR_INFO1_LIVE=visitor",
                OfflineSubtitle.visitorCookies(Map.of("set-cookie", List.of("VISITOR_INFO1_LIVE=visitor"))));
    }
}
