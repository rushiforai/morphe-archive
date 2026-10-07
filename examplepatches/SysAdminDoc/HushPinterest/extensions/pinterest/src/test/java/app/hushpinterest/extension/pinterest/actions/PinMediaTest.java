/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PinMediaTest {
    @Retention(RetentionPolicy.RUNTIME) @Target(ElementType.FIELD)
    public @interface Json { String value(); }

    public static final class Pin {
        @Json("id") String id = "123456";
        @Json("images") Map<String, Image> images = new HashMap<>();
        @Json("videos") Video videos;
        @Json("is_video") Boolean isVideo;
    }

    public static final class Image {
        @Json("url") String url;
        @Json("width") Double width;
        @Json("height") Double height;

        Image(String url, double width, double height) {
            this.url = url; this.width = width; this.height = height;
        }
    }

    public static final class Video {
        @Json("video_list") Map<String, Image> list = new HashMap<>();
    }

    public static final class BoardCover {
        @Json("id") String id = "123456";
        @Json("images") Map<String, Image> images = new HashMap<>();
    }

    @Test public void suppliedOriginalWinsAndOtherwiseTheLargestUncroppedSizeStandsIn() {
        Pin pin = new Pin();
        pin.images.put("150x150", new Image("https://i.pinimg.com/150x150/crop.jpg", 150, 150));
        assertNull("a square crop isn't the pin's image", PinMedia.source(pin));
        pin.images.put("236x", new Image("https://i.pinimg.com/236x/small.jpg", 236, 354));
        pin.images.put("736x", new Image("https://i.pinimg.com/736x/preview.jpg", 736, 1104));
        PinMedia.Resolution standIn = PinMedia.resolve(pin);
        assertEquals("https://i.pinimg.com/736x/preview.jpg", standIn.source.url);
        assertEquals("736x", standIn.size);
        assertTrue(PinMedia.standIn(standIn));
        assertEquals(Integer.valueOf(736), standIn.width);
        assertEquals(Integer.valueOf(1104), standIn.height);
        pin.images.put("orig", new Image("https://i.pinimg.com/originals/source.png?token=ok", 3000, 2000));
        PinMedia.Resolution original = PinMedia.resolve(pin);
        assertEquals("https://i.pinimg.com/originals/source.png?token=ok", original.source.url);
        assertEquals("image/png", original.source.mime);
        assertEquals(".png", original.source.suffix);
        assertEquals(PinMedia.ORIGINAL, original.size);
        assertFalse(PinMedia.standIn(original));
        assertEquals("https://www.pinterest.com/pin/123456/", PinMedia.pinUrl(pin));
    }

    @Test public void theStandInIsTheWidestTrustedSizeWhateverItsDimensionsSay() {
        Map<String, Object> images = new HashMap<>();
        images.put("1200x", Map.of("url", "https://example.com/1200x/elsewhere.jpg", "width", 1200, "height", 1800));
        images.put("90x", Map.of("url", "https://i.pinimg.com/90x/tiny.jpg", "width", 90, "height", 135));
        images.put("564x", Map.of("url", "https://i.pinimg.com/564x/a.jpg", "width", 564, "height", 846));
        images.put("736x", Map.of("url", "https://i.pinimg.com/736x/b.jpg"));
        images.put("orig", Map.of("url", "https://i.pinimg.com/originals/c.unknown"));
        PinMedia.Resolution media = PinMedia.resolve(Map.of("id", "123", "images", images));
        assertEquals("https://i.pinimg.com/736x/b.jpg", media.source.url);
        assertEquals("736x", media.size);
        assertNull(media.refusal);
        assertNull(media.width);
    }

    @Test public void theAppsOwnOriginalsKeyIsASuppliedOriginalToo() {
        PinMedia.Resolution media = PinMedia.resolve(Map.of("id", "123", "images", Map.of(
                "originals", Map.of("url", "https://i.pinimg.com/originals/source.gif", "width", 480, "height", 270),
                "736x", Map.of("url", "https://i.pinimg.com/736x/preview.jpg"))));
        assertEquals("https://i.pinimg.com/originals/source.gif", media.source.url);
        assertEquals("image/gif", media.source.mime);
        assertEquals(PinMedia.ORIGINALS, media.size);
        assertFalse(PinMedia.standIn(media));
        assertEquals(Integer.valueOf(480), media.width);
    }

    @Test public void originalsLiveBesideTheSuppliedSizeInEveryImageTypeInOrder() {
        List<PinMedia.Source> originals = PinMedia.originals(new PinMedia.Source(
                "https://i.pinimg.com/736x/0b/b2/5b/0bb25b05de960e1fee5da5e9c4e8f12e.jpg", "image/jpeg", ".jpg"));
        String base = "https://i.pinimg.com/originals/0b/b2/5b/0bb25b05de960e1fee5da5e9c4e8f12e";
        assertEquals(4, originals.size());
        String[][] expected = {{".jpg", "image/jpeg"}, {".png", "image/png"}, {".gif", "image/gif"}, {".webp", "image/webp"}};
        for (int i = 0; i < expected.length; i++) {
            assertEquals(base + expected[i][0], originals.get(i).url);
            assertEquals(expected[i][1], originals.get(i).mime);
            assertEquals(expected[i][0], originals.get(i).suffix);
        }
        assertTrue(PinMedia.originals(null).isEmpty());
    }

    @Test public void largestPlayableMp4WinsOverPreviewsAndPlaylists() {
        Pin pin = new Pin();
        pin.isVideo = true;
        pin.videos = new Video();
        pin.videos.list.put("small", new Image("https://v.pinimg.com/videos/small.mp4", 640, 360));
        pin.videos.list.put("large", new Image("https://v.pinimg.com/videos/large.mp4", 1920, 1080));
        pin.videos.list.put("hls", new Image("https://v.pinimg.com/videos/master.m3u8", 3840, 2160));
        assertEquals("https://v.pinimg.com/videos/large.mp4", PinMedia.source(pin).url);
        pin.videos.list.clear();
        pin.images.put("orig", new Image("https://i.pinimg.com/originals/thumbnail.jpg", 2000, 2000));
        assertNull(PinMedia.source(pin));
        pin.isVideo = null;
        pin.videos.list.put("hls", new Image("https://v.pinimg.com/videos/master.m3u8", 3840, 2160));
        assertNull(PinMedia.source(pin));
    }

    @Test public void mapModelsAndMissingDimensionAlternativesAreSupported() {
        Map<String, Object> pin = new HashMap<>();
        pin.put("id", "987");
        pin.put("videos", Map.of("video_list", Map.of(
                "first", Map.of("url", "https://v.pinimg.com/a.mp4"),
                "larger", Map.of("url", "https://v.pinimg.com/b.mp4", "width", 1280, "height", 720))));
        assertEquals("https://v.pinimg.com/b.mp4", PinMedia.source(pin).url);
    }

    @Test public void boardsMalformedIdsAndUntrustedMediaAreRefused() {
        assertNull(PinMedia.pinUrl(Map.of("id", "123")));
        assertNull(PinMedia.pinUrl(new BoardCover()));
        assertNull(PinMedia.pinUrl(Map.of("id", "123/../../login", "images", Map.of())));
        for (String url : new String[] {"http://i.pinimg.com/a.jpg", "https://pinimg.com.evil.test/a.jpg",
                "https://i.pinimg.com@evil.test/a.jpg", "https://user@i.pinimg.com/a.jpg", "file:///a.jpg",
                "https://i.pinimg.com:8443/a.jpg", "https://127.0.0.1/a.jpg", "https://i.pinimg.com/a.jpg\n"}) {
            assertNull(url, PinMedia.mediaUri(url));
        }
        assertNotNull(PinMedia.mediaUri("https://I.PINIMG.COM:443/a.jpg"));
        assertTrue(PinMedia.pinterestUri(PinMedia.webUri("https://accounts.pinterest.com/login/")));
        assertTrue(PinMedia.pinterestUri(PinMedia.webUri("https://www.pinterest.co.uk/pin/123/")));
        assertTrue(PinMedia.pinterestUri(PinMedia.webUri("https://pin.it/short")));
        assertFalse(PinMedia.pinterestUri(PinMedia.webUri("https://www.example.com/page")));
    }

    @Test public void suppliedMetadataBelongsToTheSelectedOriginalOrMp4() {
        Pin pin = new Pin();
        pin.images.put("orig", new Image("https://i.pinimg.com/originals/source.png", 3000, 2000));
        PinMedia.Resolution image = PinMedia.resolve(pin);
        assertNull(image.refusal);
        assertEquals(Integer.valueOf(3000), image.width);
        assertEquals(Integer.valueOf(2000), image.height);
        assertEquals("image/png", image.urlType);
        pin.videos = new Video();
        pin.videos.list.put("mp4", new Image("https://v.pinimg.com/source.mp4", 1920, 1080));
        pin.videos.list.put("adaptive", new Image("https://v.pinimg.com/master.m3u8", 3840, 2160));
        PinMedia.Resolution video = PinMedia.resolve(pin);
        assertEquals(Integer.valueOf(1920), video.width);
        assertEquals(Integer.valueOf(1080), video.height);
        assertEquals("video/mp4", video.urlType);
        assertEquals("https://v.pinimg.com/source.mp4", video.source.url);
    }

    @Test public void missingInvalidAndFractionalDimensionsStayUnknown() {
        for (Object value : new Object[]{"1920", -1, 0, 100001, Double.NaN, Double.POSITIVE_INFINITY, 2.5}) {
            PinMedia.Resolution media = PinMedia.resolve(Map.of("id", "123", "images", Map.of("orig", Map.of(
                    "url", "https://i.pinimg.com/source.jpg", "width", value))));
            assertNotNull(media.source);
            assertNull(media.width);
            assertNull(media.height);
        }
        PinMedia.Resolution absent = PinMedia.resolve(Map.of("id", "123", "images", Map.of("orig", Map.of(
                "url", "https://i.pinimg.com/source.jpg"))));
        assertNull(absent.width);
        assertNull(absent.height);
    }

    @Test public void anIdeaPinWithVideoPagesIsNeverSavedAsItsCover() {
        Map<String, Object> cover = Map.of("736x", Map.of("url", "https://i.pinimg.com/736x/aa/bb/cc/cover.jpg"));
        PinMedia.Resolution video = PinMedia.resolve(Map.of("id", "123", "images", cover,
                "story_pin_data", Map.of("total_video_duration", "0:15")));
        assertEquals(PinMedia.Refusal.MP4_MISSING, video.refusal);
        assertNull(video.source);
        for (String still : new String[]{"0", "0.0", "00:00", ""}) {
            PinMedia.Resolution image = PinMedia.resolve(Map.of("id", "123", "images", cover,
                    "story_pin_data", Map.of("total_video_duration", still)));
            assertEquals(still, "https://i.pinimg.com/736x/aa/bb/cc/cover.jpg", image.source.url);
        }
        assertEquals("pages without a duration", "736x", PinMedia.resolve(Map.of("id", "123", "images", cover,
                "story_pin_data", Map.of("page_count", 3))).size);
    }

    @Test public void knownPinsCarrySpecificRefusalsWithoutGuessingAMediaSource() {
        assertEquals(PinMedia.Refusal.IMAGE_MISSING, PinMedia.resolve(Map.of("id", "123", "images", Map.of())).refusal);
        assertEquals("a crop alone is no image", PinMedia.Refusal.IMAGE_MISSING, PinMedia.resolve(Map.of("id", "123", "images", Map.of(
                "150x150", Map.of("url", "https://i.pinimg.com/150x150/crop.jpg")))).refusal);
        PinMedia.Resolution elsewhere = PinMedia.resolve(Map.of("id", "123", "images", Map.of(
                "150x150", Map.of("url", "https://i.pinimg.com/150x150/crop.jpg"),
                "474x", Map.of("url", "https://i.pinimg.com/474x/aa/bb/cc/a.unknown"),
                "736x", Map.of("url", "https://example.com/736x/elsewhere.jpg", "width", 736.0, "height", 1104.0))));
        assertEquals("the widest supplied size explains it", PinMedia.Refusal.PUBLIC_LINK, elsewhere.refusal);
        assertEquals(Integer.valueOf(736), elsewhere.width);
        assertEquals(PinMedia.Refusal.IMAGE_TYPE, PinMedia.resolve(Map.of("id", "123", "images", Map.of(
                "236x", Map.of("url", "https://i.pinimg.com/236x/aa/bb/cc/a.svg")))).refusal);
        PinMedia.Resolution unknownType = PinMedia.resolve(Map.of("id", "123", "images", Map.of("orig", Map.of(
                "url", "https://i.pinimg.com/source.unknown"))));
        assertEquals(PinMedia.Refusal.IMAGE_TYPE, unknownType.refusal);
        assertNull(unknownType.urlType);
        assertNull(unknownType.source);
        assertEquals(PinMedia.Refusal.PUBLIC_LINK, PinMedia.resolve(Map.of("id", "123", "images", Map.of("orig", Map.of(
                "url", "https://outside.example/source.jpg")))).refusal);
        assertEquals(PinMedia.Refusal.MP4_MISSING, PinMedia.resolve(Map.of("id", "123", "is_video", true,
                "images", Map.of("orig", Map.of("url", "https://i.pinimg.com/thumbnail.jpg")))).refusal);
        for (String suffix : new String[]{"m3u8", "mpd"}) {
            PinMedia.Resolution adaptive = PinMedia.resolve(Map.of("id", "123", "videos", Map.of("video_list", Map.of(
                    "adaptive", Map.of("url", "https://v.pinimg.com/master." + suffix)))));
            assertEquals(PinMedia.Refusal.ADAPTIVE_VIDEO, adaptive.refusal);
            assertNull(adaptive.source);
            assertNull(adaptive.urlType);
        }
    }

    @Test public void unknownModelsDoNotGetAResolutionOrRefusal() {
        for (Object model : new Object[]{null, new Object(), Map.of("id", "123"), new BoardCover()}) {
            assertNull(PinMedia.resolve(model));
        }
    }
}
