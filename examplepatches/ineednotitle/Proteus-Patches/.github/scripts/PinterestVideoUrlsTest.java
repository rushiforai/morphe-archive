package app.template.extension.pinterest;

import java.util.LinkedHashMap;
import java.util.Map;

public class PinterestVideoUrlsTest {
    private static void assertNull(Object value) {
        if (value != null) throw new AssertionError("Expected null: " + value);
    }
    private static void assertEquals(Object expected, Object actual) {
        if (expected == null ? actual != null : !expected.equals(actual))
            throw new AssertionError("Expected " + expected + " but got " + actual);
    }
    public static void main(String[] args) {
        choosesProgressiveVideoInsteadOfPlaylist();
        handlesUnknownMp4AndRejectsStreamsAndUntrustedHosts();
        derivesOnlyCandidateFromPinterestHlsAndKeepsQuery();
        System.out.println("Pinterest video URL tests passed");
    }
    private static void choosesProgressiveVideoInsteadOfPlaylist() {
        Map<String, String> urls = new LinkedHashMap<>();
        urls.put("V_720P", "https://v1.pinimg.com/videos/720p/example.mp4?token=a");
        urls.put("V_HEVC_MP4_T5_V2", "https://v1.pinimg.com/videos/best.mp4");
        urls.put("HLS", "https://v1.pinimg.com/videos/hls/example.m3u8");
        assertEquals("https://v1.pinimg.com/videos/best.mp4", PinterestVideoUrls.findMp4(urls));
    }

    private static void handlesUnknownMp4AndRejectsStreamsAndUntrustedHosts() {
        Map<String, String> urls = new LinkedHashMap<>();
        urls.put("V_HEVC_MP4_T5_V2", "https://v1.pinimg.com/videos/not-mp4.m3u8");
        urls.put("other", "https://attacker.test/video.mp4");
        urls.put("lookalike", "https://pinimg.com.attacker.test/video.mp4");
        assertNull(PinterestVideoUrls.findMp4(urls));
        urls.put("new_variant", "https://v1.pinimg.com/videos/new.MP4?auth=1");
        assertEquals(urls.get("new_variant"), PinterestVideoUrls.findMp4(urls));
    }

    private static void derivesOnlyCandidateFromPinterestHlsAndKeepsQuery() {
        assertEquals("https://v1.pinimg.com/videos/mc/720p/ab/cd/id.mp4?x=1",
                PinterestVideoUrls.hlsCandidate("https://v1.pinimg.com/videos/mc/hls/ab/cd/id.m3u8?x=1"));
        assertNull(PinterestVideoUrls.hlsCandidate("https://attacker.test/hls/id.m3u8"));
        assertNull(PinterestVideoUrls.hlsCandidate("http://v1.pinimg.com/hls/id.m3u8"));
        assertNull(PinterestVideoUrls.hlsCandidate("https://v1.pinimg.com/videos/id.mpd"));
    }
}
