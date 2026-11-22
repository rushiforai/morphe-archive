package app.revanced.extension.rif;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import androidx.core.util.c;

import org.json.JSONObject;
import org.junit.Test;

import java.nio.charset.Charset;

public class ImageHostingTest {

    private static final Charset UTF8 = Charset.forName("UTF-8");

    @Test
    public void sniffsTheFileTypeFromItsBytes() {
        assertEquals("image/gif", ImageHosting.sniffMime("GIF89a....".getBytes(UTF8), 10));
        assertEquals("image/png", ImageHosting.sniffMime(new byte[] {(byte) 0x89, 'P', 'N', 'G', 13, 10}, 6));
        assertEquals("image/jpeg", ImageHosting.sniffMime(new byte[] {(byte) 0xff, (byte) 0xd8, (byte) 0xff, (byte) 0xe0}, 4));
        assertEquals("image/webp", ImageHosting.sniffMime("RIFF\0\0\0\0WEBPVP8 ".getBytes(UTF8), 16));
        assertNull(ImageHosting.sniffMime("hello".getBytes(UTF8), 5));
        assertNull(ImageHosting.sniffMime(new byte[] {'G', 'I'}, 2));
        assertEquals("gif", ImageHosting.extensionFor("image/gif"));
        assertEquals("jpg", ImageHosting.extensionFor("image/jpeg"));
    }

    private static byte[] ftyp(String brand) {
        return ("\0\0\0\u0018ftyp" + brand + "\0\0\0\0").getBytes(UTF8);
    }

    @Test
    public void sniffsVideosAndNotHeicImages() {
        assertEquals("video/mp4", ImageHosting.sniffMime(ftyp("isom"), 16));
        assertEquals("video/mp4", ImageHosting.sniffMime(ftyp("mp42"), 16));
        assertEquals("video/quicktime", ImageHosting.sniffMime(ftyp("qt  "), 16));
        for (String image : new String[] {"heic", "heix", "hevc", "heim", "heis", "mif1", "msf1", "avif", "avis"}) {
            assertNull(image, ImageHosting.sniffMime(ftyp(image), 16));
        }
        assertEquals("video/webm", ImageHosting.sniffMime(new byte[] {0x1a, 0x45, (byte) 0xdf, (byte) 0xa3, 0x01}, 5));
        // Too short to carry a brand.
        assertNull(ImageHosting.sniffMime(ftyp("isom"), 10));
        assertEquals("mp4", ImageHosting.extensionFor("video/mp4"));
        assertEquals("mov", ImageHosting.extensionFor("video/quicktime"));
        assertEquals("webm", ImageHosting.extensionFor("video/webm"));
        assertTrue(ImageHosting.isVideoMime("video/x-matroska"));
        assertFalse(ImageHosting.isVideoMime("image/gif"));
        assertFalse(ImageHosting.isVideoMime(null));
    }

    @Test
    public void fitsFramesInsideABox() {
        assertArrayEquals(new int[] {1280, 720}, ImageHosting.fitSize(3840, 2160, 1280, 1280));
        assertArrayEquals(new int[] {720, 1280}, ImageHosting.fitSize(1080, 1920, 1280, 1280));
        assertArrayEquals(new int[] {640, 360}, ImageHosting.fitSize(640, 360, 1280, 1280));
        assertArrayEquals(new int[] {640, 360}, ImageHosting.fitSize(640, 360, 0, 0));
        assertArrayEquals(new int[] {0, 0}, ImageHosting.fitSize(0, 360, 100, 100));
    }

    private static c<String, String> pair(String key, String value) {
        return c.a(key, value);
    }

    @SuppressWarnings("unchecked")
    private static c<String, String>[] form(String url) {
        return (c<String, String>[]) new c[] {pair("kind", "link"), pair("title", "t"), pair("url", url)};
    }

    private static String value(c<String, String>[] pairs, String key) {
        for (c<String, String> p : pairs) {
            if (key.equals(p.a)) return p.b;
        }
        return null;
    }

    @Test
    public void aVideoPostGetsItsKindAndPoster() {
        ImageHosting.forgetAssets();
        String video = "https://reddit-uploaded-video.s3-accelerate.amazonaws.com/vid1";
        String poster = "https://reddit-uploaded-media.s3-accelerate.amazonaws.com/pst1";
        ImageHosting.rememberAsset("vid1", video, "video/mp4", poster);
        c<String, String>[] out = ImageHosting.fixParams(form(video), null);
        assertEquals(4, out.length);
        assertEquals("video", value(out, "kind"));
        assertEquals(video, value(out, "url"));
        assertEquals(poster, value(out, "video_poster_url"));
    }

    @Test
    public void theSwitchMakesAVideoAVideogif() {
        ImageHosting.forgetAssets();
        String video = "https://reddit-uploaded-video.s3-accelerate.amazonaws.com/vid2";
        String poster = "https://reddit-uploaded-media.s3-accelerate.amazonaws.com/pst2";
        ImageHosting.rememberAsset("vid2", video, "video/mp4", poster);
        // The switch's state goes with the record (no row on screen in a unit test).
        ImageHosting.gifToggled(true);
        c<String, String>[] out = ImageHosting.fixParams(form(video), null);
        assertEquals("videogif", value(out, "kind"));
        assertEquals(video, value(out, "url"));
        // An image is never a videogif, switch or not.
        String image = "https://reddit-uploaded-media.s3-accelerate.amazonaws.com/img2";
        ImageHosting.rememberAsset("img2", image, "image/png", null);
        PostAsGifView.asGif = true;
        try {
            assertEquals("image", value(ImageHosting.fixParams(form(image), null), "kind"));
        } finally {
            PostAsGifView.asGif = false;
        }
    }

    @Test
    public void rifsRetryOfTheSameTaskReusesTheFirstParams() {
        ImageHosting.forgetAssets();
        String image = "https://reddit-uploaded-media.s3-accelerate.amazonaws.com/retry1";
        ImageHosting.rememberAsset("retry1", image, "image/png", null);
        Object task = new Object();
        c<String, String>[] first = ImageHosting.fixParams(form(image), task);
        assertEquals("image", value(first, "kind"));
        // After a token refresh rif asks the same task again: no "sent already" re-upload.
        c<String, String>[] again = ImageHosting.fixParams(form(image), task);
        assertEquals(image, value(again, "url"));
        assertEquals("image", value(again, "kind"));
        // A new send (a new task) of the same upload is still refused.
        try {
            ImageHosting.fixParams(form(image), new Object());
            org.junit.Assert.fail("a second post with the same upload");
        } catch (ImageHosting.SubmitRefused expected) {
            // fine
        }
    }

    @Test
    public void retriesDroppedConnectionsAndSomeHttpErrorsOnly() {
        assertTrue(ImageHosting.isRetryableHttp(500, ""));
        assertTrue(ImageHosting.isRetryableHttp(503, "<Error><Code>SlowDown</Code></Error>"));
        assertTrue(ImageHosting.isRetryableHttp(400, "<Error><Code>RequestTimeout</Code></Error>"));
        assertFalse(ImageHosting.isRetryableHttp(400, "<Error><Code>EntityTooLarge</Code></Error>"));
        assertFalse(ImageHosting.isRetryableHttp(400, null));
        assertFalse(ImageHosting.isRetryableHttp(403, "RequestTimeout"));
        assertFalse(ImageHosting.isRetryableHttp(404, ""));
        assertFalse(ImageHosting.isRetryableHttp(200, ""));
    }

    @Test
    public void anImagePostStaysAnImagePostWithoutPoster() {
        ImageHosting.forgetAssets();
        String image = "https://reddit-uploaded-media.s3-accelerate.amazonaws.com/img1";
        ImageHosting.rememberAsset("img1", image, "image/png", null);
        c<String, String>[] out = ImageHosting.fixParams(form(image), null);
        assertEquals(3, out.length);
        assertEquals("image", value(out, "kind"));
        assertNull(value(out, "video_poster_url"));
    }

    @Test
    public void anUploadUrlWithoutAUsableRecordIsNeverPostedAsALink() {
        ImageHosting.forgetAssets();
        // No record (image and video bucket), or one that was sent / is too old and has no file to
        // upload again: the submit stops instead of posting the amazonaws URL as a link.
        for (String url : new String[] {
                "https://reddit-uploaded-media.s3-accelerate.amazonaws.com/old1",
                "https://reddit-uploaded-video.s3-accelerate.amazonaws.com/old2",
                "http://reddit-uploaded-media.s3.amazonaws.com/old3",
                "https://s3.amazonaws.com/reddit-uploaded-video/old4"}) {
            try {
                ImageHosting.fixParams(form(url), null);
                org.junit.Assert.fail("not refused: " + url);
            } catch (ImageHosting.SubmitRefused expected) {
                assertEquals(ImageHosting.PICK_AGAIN, expected.getMessage());
            }
        }
        String sent = "https://reddit-uploaded-media.s3-accelerate.amazonaws.com/sent1";
        ImageHosting.rememberAsset("sent1", sent, "image/png", null);
        assertEquals("image", value(ImageHosting.fixParams(form(sent), null), "kind"));
        try {
            ImageHosting.fixParams(form(sent), null);
            org.junit.Assert.fail("a second post with the same upload");
        } catch (ImageHosting.SubmitRefused expected) {
            // fine
        }
        String old = "https://reddit-uploaded-media.s3-accelerate.amazonaws.com/old5";
        ImageHosting.rememberAsset("old5", old, "image/png", null,
                System.currentTimeMillis() - ImageHosting.MAX_AGE_MS - 1000);
        try {
            ImageHosting.fixParams(form(old), null);
            org.junit.Assert.fail("an upload past its age limit");
        } catch (ImageHosting.SubmitRefused expected) {
            // fine
        }
        // Videos are trusted for a shorter time than images.
        String aged = "https://reddit-uploaded-video.s3-accelerate.amazonaws.com/aged1";
        ImageHosting.rememberAsset("aged1", aged, "video/mp4", "https://reddit-uploaded-media.s3.amazonaws.com/p",
                System.currentTimeMillis() - ImageHosting.MAX_VIDEO_AGE_MS - 1000);
        try {
            ImageHosting.fixParams(form(aged), null);
            org.junit.Assert.fail("a video past its age limit");
        } catch (ImageHosting.SubmitRefused expected) {
            // fine
        }
        String young = "https://reddit-uploaded-video.s3-accelerate.amazonaws.com/young1";
        ImageHosting.rememberAsset("young1", young, "video/mp4", "https://reddit-uploaded-media.s3.amazonaws.com/p",
                System.currentTimeMillis() - ImageHosting.MAX_VIDEO_AGE_MS + 60000);
        assertEquals("video", value(ImageHosting.fixParams(form(young), null), "kind"));
        // A video record without its poster can't be a video post either.
        String bare = "https://reddit-uploaded-video.s3-accelerate.amazonaws.com/bare1";
        ImageHosting.rememberAsset("bare1", bare, "video/mp4", null);
        try {
            ImageHosting.fixParams(form(bare), null);
            org.junit.Assert.fail("a video without a poster");
        } catch (ImageHosting.SubmitRefused expected) {
            // fine
        }
        // Other links and other kinds are untouched.
        assertEquals("link", value(ImageHosting.fixParams(form("https://example.com/a.mp4"), null), "kind"));
        ImageHosting.forgetAssets();
    }

    @Test
    public void recordsSurviveASaveAndLoadAndGetPruned() {
        long now = 10_000_000_000L;
        java.util.List<ImageHosting.Asset> all = new java.util.ArrayList<>();
        for (int i = 0; i < 25; i++) {
            all.add(new ImageHosting.Asset("https://reddit-uploaded-media.s3.amazonaws.com/a" + i, "a" + i,
                    "content://media/" + i, null, "image/png", null, now - 1000L * (25 - i)));
        }
        all.add(0, new ImageHosting.Asset("https://reddit-uploaded-media.s3.amazonaws.com/stale", "stale", null, null,
                "image/png", null, now - 8L * 24 * 3600 * 1000));
        java.util.List<ImageHosting.Asset> kept = ImageHosting.prune(all, now);
        assertEquals(20, kept.size());
        assertEquals("a5", kept.get(0).id);
        assertEquals("a24", kept.get(19).id);

        ImageHosting.Asset v = new ImageHosting.Asset("https://reddit-uploaded-video.s3.amazonaws.com/v1", "v1",
                "content://media/9", null, "video/mp4", "https://reddit-uploaded-media.s3.amazonaws.com/p1", now);
        v.submitted = true;
        v.gif = true;
        java.util.List<ImageHosting.Asset> back = ImageHosting.assetsFromJson(
                ImageHosting.assetsToJson(java.util.Collections.singletonList(v)), null);
        assertEquals(1, back.size());
        ImageHosting.Asset r = back.get(0);
        assertEquals("v1", r.id);
        assertEquals(v.url, r.url);
        assertEquals("content://media/9", r.sourceString);
        assertEquals("video/mp4", r.mime);
        assertEquals(v.posterUrl, r.posterUrl);
        assertEquals(now, r.uploadedAtMs);
        assertTrue(r.submitted);
        assertTrue(r.gif);
        assertEquals(0, ImageHosting.assetsFromJson("not json", null).size());
        assertEquals(0, ImageHosting.assetsFromJson("[{\"id\":\"x\"}, 5]", null).size());
    }

    @Test
    public void aVideoRecordWithoutTheSwitchOnScreenStaysAVideo() {
        ImageHosting.forgetAssets();
        String video = "https://reddit-uploaded-video.s3-accelerate.amazonaws.com/vid3";
        String poster = "https://reddit-uploaded-media.s3-accelerate.amazonaws.com/pst3";
        ImageHosting.rememberAsset("vid3", video, "video/mp4", poster);
        // No row on screen (a restored draft): the record's last state decides, "off" by default.
        assertEquals("video", value(ImageHosting.fixParams(form(video), null), "kind"));
    }

    @Test
    public void spotsRedditRefusals() {
        assertTrue(ImageHosting.hasErrors("{\"json\":{\"errors\":[[\"BAD_URL\",\"x\",\"url\"]]}}"));
        assertFalse(ImageHosting.hasErrors("{\"json\":{\"errors\":[],\"data\":{}}}"));
        assertFalse(ImageHosting.hasErrors("nope"));
    }

    @Test
    public void assetUrlFromAction() {
        assertEquals("https://reddit-uploaded-media.s3-accelerate.amazonaws.com/abc",
                ImageHosting.assetUrl("//reddit-uploaded-media.s3-accelerate.amazonaws.com", "abc"));
        assertEquals("https://example.com/abc", ImageHosting.assetUrl("https://example.com/", "abc"));
    }

    @Test
    public void findsTheAssetIdInOurUrls() {
        assertEquals("abc", ImageHosting.assetIdOf("https://reddit-uploaded-media.s3-accelerate.amazonaws.com/abc"));
        assertEquals("abc", ImageHosting.assetIdOf("https://reddit-uploaded-media.s3-accelerate.amazonaws.com/abc/?x=1"));
        assertEquals("v1", ImageHosting.assetIdOf("https://reddit-uploaded-video.s3-accelerate.amazonaws.com/v1"));
        assertEquals("abc", ImageHosting.assetIdOf("http://REDDIT-uploaded-media.s3.amazonaws.com/abc"));
        assertEquals("abc", ImageHosting.assetIdOf("https://s3.amazonaws.com/reddit-uploaded-media/abc"));
        assertNull(ImageHosting.assetIdOf("https://s3.amazonaws.com/reddit-uploaded-media/"));
        assertNull(ImageHosting.assetIdOf("https://s3.amazonaws.com/other-bucket/abc"));
        assertNull(ImageHosting.assetIdOf("https://i.imgur.com/abc.png"));
        assertNull(ImageHosting.assetIdOf(null));
    }

    @Test
    public void parsesTheLeaseAndBuildsTheMultipartBody() throws Exception {
        String json = "{\"args\":{\"action\":\"//s3.example\",\"fields\":[{\"name\":\"key\",\"value\":\"k1\"},"
                + "{\"name\":\"acl\",\"value\":\"private\"}]},\"asset\":{\"asset_id\":\"zzz\"}}";
        ImageHosting.Lease lease = ImageHosting.parseLease(json);
        assertEquals("//s3.example", lease.action);
        assertEquals("zzz", lease.id);
        assertEquals(2, lease.fields.size());
        String head = new String(ImageHosting.multipartHead("B", lease.fields, "image.gif", "image/gif"), UTF8);
        assertEquals("--B\r\nContent-Disposition: form-data; name=\"key\"\r\n\r\nk1\r\n"
                + "--B\r\nContent-Disposition: form-data; name=\"acl\"\r\n\r\nprivate\r\n"
                + "--B\r\nContent-Disposition: form-data; name=\"file\"; filename=\"image.gif\"\r\n"
                + "Content-Type: image/gif\r\n\r\n", head);
        assertArrayEquals("\r\n--B--\r\n".getBytes(UTF8), ImageHosting.multipartTail("B"));
    }

    @Test
    public void recognisesTheProcessingReply() {
        String pending = "{\"json\":{\"errors\":[],\"data\":{\"user_submitted_page\":\"https://www.reddit.com/user/x/submitted/\","
                + "\"websocket_url\":\"wss://example\"}}}";
        assertEquals("https://www.reddit.com/user/x/submitted/", ImageHosting.pendingReplyUserPage(pending));
        // A normal post reply, an error reply and junk are left alone.
        assertNull(ImageHosting.pendingReplyUserPage(
                "{\"json\":{\"errors\":[],\"data\":{\"url\":\"https://www.reddit.com/r/a/comments/b/c/\",\"id\":\"b\",\"name\":\"t3_b\"}}}"));
        assertNull(ImageHosting.pendingReplyUserPage(
                "{\"json\":{\"errors\":[[\"BAD_IMAGE\",\"x\",\"url\"]],\"data\":{\"websocket_url\":\"wss://example\"}}}"));
        assertNull(ImageHosting.pendingReplyUserPage("not json"));
    }

    @Test
    public void findsAVideoPost() {
        String listing = "{\"data\":{\"children\":["
                + "{\"data\":{\"url\":\"https://i.redd.it/other.png\",\"permalink\":\"/r/a/comments/1/x/\",\"id\":\"1\","
                + "\"title\":\"other\",\"created_utc\":2000}},"
                + "{\"data\":{\"url\":\"https://v.redd.it/vid123\",\"permalink\":\"/r/a/comments/2/y/\",\"id\":\"2\","
                + "\"title\":\"clip\",\"created_utc\":1000}},"
                + "{\"data\":{\"url\":\"https://www.reddit.com/r/a/comments/3/z/\",\"permalink\":\"/r/a/comments/3/z/\",\"id\":\"3\","
                + "\"title\":\"by player\",\"created_utc\":1500,\"media\":{\"reddit_video\":"
                + "{\"fallback_url\":\"https://v.redd.it/pl456/DASH_720.mp4\"}}}}]}}";
        assertArrayEquals(new String[] {"/r/a/comments/2/y/", "2"}, ImageHosting.findPost(listing, "vid123"));
        assertArrayEquals(new String[] {"/r/a/comments/3/z/", "3"}, ImageHosting.findPost(listing, "pl456"));
        assertNull(ImageHosting.findPost(listing, "missing"));
        // No id match: the newest post with the same title created after the submit.
        assertArrayEquals(new String[] {"/r/a/comments/2/y/", "2"}, ImageHosting.findPost(listing, "missing", "clip", 900));
        assertNull(ImageHosting.findPost(listing, "missing", "clip", 1001));
        assertNull(ImageHosting.findPost(listing, "missing", "nothing", 900));
        // An id match wins over a title match.
        assertArrayEquals(new String[] {"/r/a/comments/2/y/", "2"}, ImageHosting.findPost(listing, "vid123", "other", 900));
    }

    @Test
    public void findsThePostByItsImageId() throws Exception {
        String listing = "{\"data\":{\"children\":["
                + "{\"data\":{\"url\":\"https://i.redd.it/other.png\",\"permalink\":\"/r/a/comments/1/x/\",\"id\":\"1\"}},"
                + "{\"data\":{\"url\":\"https://i.redd.it/abc123.gif\",\"permalink\":\"/r/a/comments/2/y/\",\"id\":\"2\"}}]}}";
        assertArrayEquals(new String[] {"/r/a/comments/2/y/", "2"}, ImageHosting.findPost(listing, "abc123"));
        assertNull(ImageHosting.findPost(listing, "missing"));
        assertNull(ImageHosting.findPost("{}", "abc123"));

        JSONObject reply = new JSONObject(ImageHosting.successReply("https://www.reddit.com/r/a/comments/2/y/", "2"));
        JSONObject data = reply.getJSONObject("json").getJSONObject("data");
        assertEquals("t3_2", data.getString("name"));
        assertEquals(0, reply.getJSONObject("json").getJSONArray("errors").length());
    }
}
