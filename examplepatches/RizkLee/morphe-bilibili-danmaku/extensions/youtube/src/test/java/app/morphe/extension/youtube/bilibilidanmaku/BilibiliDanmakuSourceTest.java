package app.morphe.extension.youtube.bilibilidanmaku;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import com.google.protobuf.CodedOutputStream;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Tests pure-Java parsing and matching without a live YouTube process or Bilibili API. */
public class BilibiliDanmakuSourceTest {
    @Test public void coverUrlsUseOnlyTrustedHttpsImageHosts() {
        assertEquals("https://i0.hdslb.com/bfs/archive/example.jpg",
                BilibiliDanmakuSource.normalizeCover("//i0.hdslb.com/bfs/archive/example.jpg"));
        assertEquals("https://i1.hdslb.com/bfs/bangumi/example.png",
                BilibiliDanmakuSource.normalizeCover("https://i1.hdslb.com/bfs/bangumi/example.png"));
        assertEquals("", BilibiliDanmakuSource.normalizeCover("https://hdslb.com.evil.example/x"));
        assertEquals("https://i0.hdslb.com/x", BilibiliDanmakuSource.normalizeCover("http://i0.hdslb.com/x"));
        assertEquals("", BilibiliDanmakuSource.normalizeCover("https://i0.hdslb.com:444/x"));
    }

    @Test public void referenceLinksMustUseBilibiliDomains() throws Exception {
        BilibiliDanmakuSource.ensureOfficialUrl("BV1abcdefgh1");
        BilibiliDanmakuSource.ensureOfficialUrl("https://www.bilibili.com/video/BV1abcdefgh1?p=2");
        BilibiliDanmakuSource.ensureOfficialUrl("https://bilibili.com/bangumi/play/ep123");
        for (String invalid : Arrays.asList(
                "https://bilibili.com.evil.example/video/BV1abcdefgh1",
                "https://fakebilibili.com/video/BV1abcdefgh1",
                "file://localhost/video/BV1abcdefgh1")) {
            try {
                BilibiliDanmakuSource.ensureOfficialUrl(invalid);
                throw new AssertionError("Accepted non-Bilibili URL: " + invalid);
            } catch (IOException expected) {
                // Rejection is expected.
            }
        }
    }

    @Test public void copiedShareTextExtractsEpisodeAndPreservesPages() throws Exception {
        assertEquals("https://www.bilibili.com/bangumi/play/ep258000",
                BilibiliDanmakuSource.extractReference(
                        "【《小马宝莉 友谊的魔力 第八季（中配）》 第3话 地设一对-哔哩哔哩番剧】"
                                + "https://www.bilibili.com/bangumi/play/ep258000"));
        assertEquals("https://www.bilibili.com/video/BV1abcdefgh1?p=2",
                BilibiliDanmakuSource.extractReference(
                        "视频分享 https://www.bilibili.com/video/BV1abcdefgh1?p=2 。"));
        assertEquals("ep258000", BilibiliDanmakuSource.extractReference("ep258000"));
        assertEquals("https://b23.tv/abc123", BilibiliDanmakuSource.extractReference("【视频分享】 https://b23.tv/abc123"));
        assertTrue(BilibiliDanmakuSource.isShortReference("https://b23.tv/abc123"));
        assertFalse(BilibiliDanmakuSource.isShortReference("https://www.bilibili.com/video/BV1abcdefgh1"));
        assertEquals("https://www.bilibili.com/video/BV1abcdefgh1",
                BilibiliDanmakuSource.extractReference("复制 https\\://www\\.bilibili.com/video/BV1abcdefgh1"));
        assertEquals("https://www.bilibili.com/bangumi/play/ep258000",
                BilibiliDanmakuSource.extractReference(
                        "【《小马宝莉 友谊的魔力 第八季（中配）》 第3话】"
                                + "https\\\\://www\\\\.bilibili.com/bangumi/play/ep258000"));
        for (String invalid : Arrays.asList(
                "分享 https://evil.example/video/BV1abcdefgh1",
                "分享 https://bilibili.com.evil.example/video/BV1abcdefgh1",
                "分享 https://b23.tv.evil.example/abc123",
                "任意字符串 BV1abcdefgh1")) {
            try {
                BilibiliDanmakuSource.extractReference(invalid);
                throw new AssertionError("Accepted invalid share text: " + invalid);
            } catch (IOException expected) { }
        }
    }

    @Test public void durationsSupportLongVideosAndRejectMalformedInputs() {
        assertEquals(65, BilibiliDanmakuSource.parseDuration("1:05"));
        assertEquals(5400, BilibiliDanmakuSource.parseDuration("90:00"));
        assertEquals(379210, BilibiliDanmakuSource.parseDuration("105:20:10"));
        assertEquals(360000, BilibiliDanmakuSource.parseDuration("100:00:00"));
        assertEquals(0, BilibiliDanmakuSource.parseDuration("90:60"));
        assertEquals(0, BilibiliDanmakuSource.parseDuration("abc"));
        assertEquals(0, BilibiliDanmakuSource.parseDuration(""));
        assertEquals(0, BilibiliDanmakuSource.parseDuration(null));
        assertEquals(0, BilibiliDanmakuSource.parseDuration("999999999:00:00"));
    }

    @Test public void matchingRequiresConfidenceAndRejectsTies() {
        BilibiliDanmakuSource.Candidate exact = new BilibiliDanmakuSource.Candidate(
                "BV1abcdefgh1", "The Original Video", 120, 180);
        BilibiliDanmakuSource.Candidate unrelated = new BilibiliDanmakuSource.Candidate(
                "BV1abcdefgh2", "An Entirely Different Clip", 1, 90);
        assertSame(exact, BilibiliDanmakuSource.bestMatch(
                Arrays.asList(unrelated, exact), "The Original Video", 180_000));
        assertNull(BilibiliDanmakuSource.bestMatch(
                Arrays.asList(exact, exact), "The Original Video", 180_000));
        assertNull(BilibiliDanmakuSource.bestMatch(
                Arrays.asList(unrelated), "Unrelated Song", 600_000));
    }

    @Test public void protobufSegmentsDecodeTimesModesColorsAndUnicode() throws Exception {
        ByteArrayOutputStream itemBytes = new ByteArrayOutputStream();
        CodedOutputStream element = CodedOutputStream.newInstance(itemBytes);
        element.writeInt64(2, 12_345);
        element.writeInt32(3, 5);
        element.writeInt32(4, 25);
        element.writeInt32(5, 0xabcdef);
        element.writeString(7, "测试弹幕 😁");
        element.writeString(18, "ignored");
        element.flush();

        ByteArrayOutputStream segmentBytes = new ByteArrayOutputStream();
        CodedOutputStream segment = CodedOutputStream.newInstance(segmentBytes);
        segment.writeByteArray(1, itemBytes.toByteArray());
        segment.writeInt32(99, 123);
        segment.flush();

        List<DanmakuComment> result = BilibiliDanmakuSource.parseSegment(segmentBytes.toByteArray());
        assertEquals(1, result.size());
        DanmakuComment comment = result.get(0);
        assertEquals(12_345, comment.timeMs);
        assertEquals(5, comment.mode);
        assertEquals(0xabcdef, comment.color);
        assertEquals("测试弹幕 😁", comment.text);
        assertTrue(BilibiliDanmakuSource.parseSegment(new byte[0]).isEmpty());
    }

    @Test public void wbiSigningOrdersAndEscapesQueryParameters() throws Exception {
        Map<String, String> params = new HashMap<>();
        params.put("b", "a b");
        params.put("a", "中文!()'");
        String query = BilibiliDanmakuSource.signParams(params,
                "7cd084941338484aae1ad9425b84077c",
                "4932caff0ff746eab6f01bf08b70ac45", 1702204169);
        assertTrue(query.startsWith("a=%E4%B8%AD%E6%96%87&b=a%20b&wts=1702204169&w_rid="));
        String hash = query.substring(query.lastIndexOf('=') + 1);
        assertEquals(32, hash.length());
        assertTrue(hash.matches("[a-f0-9]{32}"));
        assertFalse(query.contains("+"));
    }
}
