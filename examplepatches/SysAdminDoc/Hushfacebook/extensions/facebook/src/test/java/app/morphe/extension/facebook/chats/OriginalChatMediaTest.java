/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.chats;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.Executors;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

import static app.morphe.extension.facebook.chats.OriginalChatMediaForTests.box;
import static app.morphe.extension.facebook.chats.OriginalChatMediaForTests.bytes;
import static app.morphe.extension.facebook.chats.OriginalChatMediaForTests.fileType;
import static app.morphe.extension.facebook.chats.OriginalChatMediaForTests.handler;
import static app.morphe.extension.facebook.chats.OriginalChatMediaForTests.join;
import static app.morphe.extension.facebook.chats.OriginalChatMediaForTests.media;
import static app.morphe.extension.facebook.chats.OriginalChatMediaForTests.movie;
import static app.morphe.extension.facebook.chats.OriginalChatMediaForTests.plainVideo;
import static app.morphe.extension.facebook.chats.OriginalChatMediaForTests.track;
import static app.morphe.extension.facebook.chats.OriginalChatMediaForTests.video;

/**
 * Photos and videos from a chat inside Facebook, through the hooks: on sends the original and
 * counts it, off and paused leave Facebook's own transcode and size check alone. A video goes out
 * as it is only when its box tree was read in full and holds no location; built here as minimal
 * MP4 files with and without one.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class OriginalChatMediaTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void immediateCompletion() {
        OriginalPhoto.completion = Runnable::run;
        // Facebook's chats ask the size check on their media thread; Robolectric runs tests on the main one.
        OriginalChatMedia.onMainThread = () -> false;
    }

    @After
    public void restore() {
        OriginalChatMedia.onMainThread = OriginalChatMedia.MAIN_THREAD;
        OriginalPhoto.completion = Executors.newSingleThreadExecutor();
        PauseForTests.resume();
        Settings.ORIGINAL_CHAT_MEDIA.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.ORIGINAL_CHAT_MEDIA + ":")) return line;
        }
        return null;
    }

    private static Map<String, Object> extras() {
        return new HashMap<>();
    }

    @Test
    public void theSwitchStartsOffAndFacebookKeepsItsTranscode() throws IOException {
        assertFalse(Settings.ORIGINAL_CHAT_MEDIA.get());
        String path = OriginalChatMediaForTests.file(OriginalChatMediaForTests.jpeg());
        assertNull(OriginalChatMedia.photo(path, 0, 0, null, extras()));
        OriginalChatMediaForTests.Callback callback = new OriginalChatMediaForTests.Callback();
        assertFalse(OriginalChatMedia.photoAsync(path, 0, 0, null, extras(), callback));
        assertEquals(0, callback.successes);
        assertEquals(5, OriginalChatMedia.videoPassthrough(5, 1000, video(plainVideo())));
    }

    @Test
    public void aJpegGoesOutAsItsOwnImageDataAndIsCounted() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        byte[] original = OriginalChatMediaForTests.jpeg();
        byte[] sent = OriginalChatMedia.photo(OriginalChatMediaForTests.file(original), 0, 0, null, extras());
        assertNotNull(sent);
        assertEquals("starts as a JPEG", 0xFF, sent[0] & 0xFF);
        assertEquals(0xD8, sent[1] & 0xFF);
        assertEquals("ends as a JPEG", 0xD9, sent[sent.length - 1] & 0xFF);
        assertTrue("never bigger than the original", sent.length <= original.length);
        String line = statusLine();
        assertNotNull(String.join("\n", HookStatus.report()), line);
        assertTrue(line, line.contains(OriginalChatMedia.PHOTO_SENT + " 1"));
    }

    @Test
    public void aStandardSendAndAnyTargetSizeGetTheOriginalToo() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        String path = OriginalChatMediaForTests.file(OriginalChatMediaForTests.jpeg());
        Map<String, Object> standard = extras();
        standard.put("IS_HD", Boolean.FALSE);
        assertNotNull(OriginalChatMedia.photo(path, 1280, 960, null, standard));
        assertNotNull("a tall target", OriginalChatMedia.photo(path, 4, 4000, null, extras()));
    }

    @Test
    public void aPreviewAndAThumbnailKeepFacebooksTranscode() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        String path = OriginalChatMediaForTests.file(OriginalChatMediaForTests.jpeg());
        Map<String, Object> preview = extras();
        preview.put("IS_PREVIEW", Boolean.TRUE);
        assertNull("a preview", OriginalChatMedia.photo(path, 0, 0, null, preview));
        assertNull("a thumbnail size", OriginalChatMedia.photo(path, 320, 320, null, extras()));
        assertNull("a missing file", OriginalChatMedia.photo(path + ".gone", 0, 0, null, extras()));
        assertNull("no path", OriginalChatMedia.photo(null, 0, 0, null, extras()));
    }

    @Test
    public void somethingThatIsNotAJpegKeepsFacebooksTranscode() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        byte[] png = {(byte) 0x89, 'P', 'N', 'G', 13, 10, 26, 10, 0, 0, 0, 0};
        assertNull(OriginalChatMedia.photo(OriginalChatMediaForTests.file(png), 0, 0, null, extras()));
        assertFalse(OriginalChatMedia.photoAsync(OriginalChatMediaForTests.file(png), 0, 0, null, extras(),
                new OriginalChatMediaForTests.Callback()));
        String line = statusLine();
        assertTrue("nothing counted", line == null || !line.contains(OriginalChatMedia.PHOTO_SENT));
    }

    @Test
    public void theAsyncSendAnswersTheCallbackWithTheCopy() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        OriginalChatMediaForTests.Callback callback = new OriginalChatMediaForTests.Callback();
        String path = OriginalChatMediaForTests.file(OriginalChatMediaForTests.jpeg());
        assertTrue(OriginalChatMedia.photoAsync(path, 0, 0, null, extras(), callback));
        assertEquals(1, callback.successes);
        assertEquals(0, callback.failures);
        assertTrue(callback.path, callback.path.startsWith("file:"));
        assertEquals(8.0, callback.width, 0);
        assertEquals(8.0, callback.height, 0);
        assertFalse("no callback, no hand-over",
                OriginalChatMedia.photoAsync(path, 0, 0, null, extras(), null));
    }

    @Test
    public void aSmallVideoSkipsTheReEncodeAndALargeOneDoesNot() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        String plain = video(plainVideo());
        assertEquals("a small video", -1, OriginalChatMedia.videoPassthrough(9, 4_000_000L, plain));
        assertEquals("a video Facebook already passes", -3, OriginalChatMedia.videoPassthrough(-3, 4_000_000L, plain));
        assertEquals("no size", 9, OriginalChatMedia.videoPassthrough(9, 0, plain));
        assertEquals("at the ceiling", -1, OriginalChatMedia.videoPassthrough(9, OriginalChatMedia.VIDEO_MAX_BYTES, plain));
        assertEquals("over the ceiling", 9,
                OriginalChatMedia.videoPassthrough(9, OriginalChatMedia.VIDEO_MAX_BYTES + 1, plain));
        String line = statusLine();
        assertNotNull(String.join("\n", HookStatus.report()), line);
        assertTrue(line, line.contains(OriginalChatMedia.VIDEO_PASSED + " 2"));
    }

    /** The places a phone or a camera app writes where a video was filmed, each in an otherwise plain file. */
    private static Map<String, byte[]> locatedVideos() {
        byte[] place = bytes("+37.4220-122.0841/");
        Map<String, byte[]> videos = new LinkedHashMap<>();
        videos.put("Android's \u00A9xyz in the movie's udta",
                movie(track("vide"), track("soun"), box("udta", box("\u00A9xyz", new byte[4], place))));
        videos.put("\u00A9xyz in a track's udta",
                movie(track("vide", box("udta", box("\u00A9xyz", new byte[4], place))), track("soun")));
        videos.put("3GPP loci", movie(track("vide"), box("udta", box("loci", new byte[24]))));
        videos.put("QuickTime's location key in the movie's meta", movie(track("vide"), box("meta",
                box("hdlr", new byte[8], bytes("mdta"), new byte[13]),
                box("keys", new byte[8], box("mdta", bytes("com.apple.quicktime.location.ISO6709"))),
                box("ilst", box("\u0000\u0000\u0000\u0001", box("data", new byte[8], place))))));
        videos.put("a location key in a track's meta", movie(track("vide", box("meta",
                box("keys", new byte[8], box("mdta", bytes("com.android.location")))))));
        videos.put("\u00A9xyz in an iTunes-style list", movie(track("vide"),
                box("udta", box("meta", new byte[4], box("ilst", box("\u00A9xyz", box("data", new byte[8], place)))))));
        videos.put("an XMP packet with GPS tags", movie(track("vide"),
                box("udta", box("XMP_", bytes("<x:xmpmeta><exif:GPSLatitude>37,25.32N</exif:GPSLatitude></x:xmpmeta>")))));
        return videos;
    }

    @Test
    public void aVideoThatSaysWhereItWasFilmedKeepsTheReEncode() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        for (Map.Entry<String, byte[]> located : locatedVideos().entrySet()) {
            String address = video(join(fileType(), located.getValue(), media()));
            assertEquals(located.getKey(), 9, OriginalChatMedia.videoPassthrough(9, 4_000_000L, address));
        }
        String line = statusLine();
        assertNotNull(String.join("\n", HookStatus.report()), line);
        assertTrue(line, line.contains(OriginalChatMedia.VIDEO_KEPT + " " + locatedVideos().size()));
        assertFalse(line, line.contains(OriginalChatMedia.VIDEO_PASSED));
    }

    @Test
    public void aVideoWithOtherTagsOrItsMovieLastGoesOutAsItIs() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        byte[] tagged = movie(track("vide"), track("soun"),
                box("udta", box("\u00A9mak", new byte[4], bytes("Google")), box("\u00A9mod", new byte[4], bytes("Pixel 9"))),
                box("meta", box("keys", new byte[8], box("mdta", bytes("com.android.version")),
                        box("mdta", bytes("com.android.capture.fps")))));
        assertEquals("a make, a model and Android's version keys", -1,
                OriginalChatMedia.videoPassthrough(9, 4_000_000L, video(join(fileType(), tagged, media()))));
        assertEquals("the movie box after the media, as a camera writes it", -1, OriginalChatMedia.videoPassthrough(9,
                4_000_000L, video(join(fileType(), media(), movie(track("vide"), track("soun"))))));
        byte[] toTheEnd = box("mdat", new byte[32]);
        toTheEnd[3] = 0;
        assertEquals("media that runs to the end of the file", -1, OriginalChatMedia.videoPassthrough(9, 4_000_000L,
                video(join(fileType(), movie(track("vide")), toTheEnd))));
        assertEquals("the empty padding Android reserves beside the movie box", -1, OriginalChatMedia.videoPassthrough(9,
                4_000_000L, video(join(fileType(), movie(track("vide"), track("soun")), box("free", new byte[4096]), media()))));
        assertEquals("an iPhone's QuickTime layout", -1,
                OriginalChatMedia.videoPassthrough(9, 4_000_000L, video(quickTimeVideo())));
    }

    /**
     * A plain iPhone video as QuickTime lays it out: a wide box before the media, an aperture box
     * and an edit list in the video track, a data handler in its media information, and the
     * make and model as keys in the movie's meta.
     */
    private static byte[] quickTimeVideo() {
        byte[] videoMedia = box("mdia", box("mdhd", new byte[24]), handler("vide"), box("minf",
                box("vmhd", new byte[12]), box("hdlr", new byte[4], bytes("dhlr"), bytes("alis"), new byte[12], new byte[1]),
                box("dinf", box("dref", new byte[8])), box("stbl", box("stsd", new byte[8]))));
        byte[] videoTrack = box("trak", box("tkhd", new byte[84]), box("tapt", box("clef", new byte[12])),
                box("edts", box("elst", new byte[16])), videoMedia);
        byte[] tags = box("meta", box("hdlr", new byte[8], bytes("mdta"), new byte[13]),
                box("keys", new byte[8], box("mdta", bytes("com.apple.quicktime.make")),
                        box("mdta", bytes("com.apple.quicktime.model"))));
        return join(box("ftyp", bytes("qt  "), new byte[4], bytes("qt  ")), box("wide"), media(),
                movie(videoTrack, track("soun"), tags));
    }

    /**
     * Dashcams keep their GPS log outside the tags a phone writes. A Novatek indexes it from a
     * gps box in the movie and writes each block as a free box that starts "GPS "; a BlackVue
     * writes NMEA sentences into a gps box inside a top-level free box. Either piece alone keeps
     * the re-encode, and so does a location key or NMEA text in any padding.
     */
    @Test
    public void aDashcamVideoWithAGpsLogKeepsTheReEncode() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        byte[] plainMovie = movie(track("vide"), track("soun"));
        byte[] gpsIndex = box("gps ", new byte[8], new byte[16]);
        byte[] gpsBlock = box("free", bytes("GPS "), new byte[4], bytes("A"), new byte[40]);
        Map<String, byte[]> dashcams = new LinkedHashMap<>();
        dashcams.put("a Novatek's GPS index and its log", join(fileType(), media(), gpsBlock,
                movie(track("vide"), track("soun"), gpsIndex)));
        dashcams.put("a Novatek's GPS index alone", join(fileType(), media(), movie(track("vide"), track("soun"), gpsIndex)));
        dashcams.put("a Novatek's GPS log alone", join(fileType(), media(), gpsBlock, plainMovie));
        dashcams.put("a BlackVue's NMEA log", join(fileType(), box("free",
                box("gps ", bytes("[1553683130000]$GPRMC,103001.00,A,3725.32,N,12205.04,W,0.0,,270319,,,A*6B\n")),
                box("3gf ", new byte[30])), media(), plainMovie));
        dashcams.put("NMEA sentences in padding under no box name", join(fileType(),
                box("free", bytes("$GNRMC,103001.00,A,3725.32,N,12205.04,W")), plainMovie, media()));
        dashcams.put("a location key in skip padding", join(fileType(), plainMovie,
                box("skip", bytes("com.apple.quicktime.location.ISO6709")), media()));
        dashcams.put("a GPS log in the movie's own padding", join(fileType(),
                movie(track("vide"), box("free", bytes("GPS "), new byte[24])), media()));
        for (Map.Entry<String, byte[]> dashcam : dashcams.entrySet()) {
            assertEquals(dashcam.getKey(), 9, OriginalChatMedia.videoPassthrough(9, 4_000_000L, video(dashcam.getValue())));
        }
        assertEquals("the control: the same movie with nothing beside it", -1,
                OriginalChatMedia.videoPassthrough(9, 4_000_000L, video(join(fileType(), media(), plainMovie))));
    }

    /**
     * What Samsung, Pixel and iPhone cameras write into udta and meta beyond a place: Samsung's smta
     * and SDLN boxes beside the make and model, QuickTime's four-byte zero end of a udta, and an ISO
     * meta (version and flags first) listing Android's keys. All of them go out as they are.
     */
    @Test
    public void theTagsOrdinaryPhoneVideosCarryGoOutAsTheyAre() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        byte[] mdta = box("hdlr", new byte[8], bytes("mdta"), new byte[13]);
        Map<String, byte[]> phones = new LinkedHashMap<>();
        phones.put("a Samsung's smta and SDLN", movie(track("vide"), track("soun"),
                box("udta", box("smta", box("saut", new byte[8]), box("smrd", new byte[24])), box("SDLN", new byte[8]),
                        box("©mak", new byte[4], bytes("samsung")), box("©mod", new byte[4], bytes("SM-S901U")))));
        phones.put("a udta ended by four zero bytes", movie(track("vide"),
                join(box("udta", box("©swr", new byte[4], bytes("14.1")), box("auth", new byte[8], bytes("me"))),
                        new byte[0]), box("udta", box("©day", new byte[4], bytes("2026")), new byte[4])));
        phones.put("an ISO meta with version and flags", movie(track("vide"), box("meta", new byte[4], mdta,
                box("keys", new byte[8], box("mdta", bytes("com.android.version"))),
                box("ilst", box("\u0000\u0000\u0000\u0001", box("data", new byte[8], bytes("15")))))));
        phones.put("a track's udta with a meta in it", movie(track("vide", box("udta", box("meta", new byte[4], mdta))),
                track("soun")));
        for (Map.Entry<String, byte[]> phone : phones.entrySet()) {
            assertEquals(phone.getKey(), -1, OriginalChatMedia.videoPassthrough(9, 4_000_000L,
                    video(join(fileType(), phone.getValue(), media()))));
        }
    }

    /**
     * What editors and Galaxy phones write that names no place: ffmpeg's and Lavf's
     * udta/meta(hdlr mdir)/ilst/©too (CapCut, InShot and most editors), other iTunes-style text
     * items, 3GPP asset boxes, QuickTime's name, and Samsung's boxes straight under udta. All go out as
     * they are, and a place's box in the same shapes (loci, ©xyz) still keeps the re-encode.
     */
    @Test
    public void editedAndGalaxyVideosGoOutAsTheyAreWhileAPlaceStillDoesNot() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        byte[] mdir = box("hdlr", new byte[8], bytes("mdir"), bytes("appl"), new byte[9]);
        byte[] place = bytes("+37.4220-122.0841/");
        Map<String, byte[]> ordinary = new LinkedHashMap<>();
        ordinary.put("an ffmpeg file's udta meta ilst tool", movie(track("vide"), track("soun"),
                box("udta", box("meta", new byte[4], mdir,
                        box("ilst", box("©too", box("data", new byte[8], bytes("Lavf58.76.100"))))))));
        ordinary.put("an editor's title, comment, artist and description items", movie(track("vide"),
                box("udta", box("meta", new byte[4], mdir, box("ilst",
                        box("©nam", box("data", new byte[8], bytes("Holiday"))),
                        box("©cmt", box("data", new byte[8], bytes("clip"))),
                        box("©des", box("data", new byte[8], bytes("a day out"))),
                        box("©day", box("data", new byte[8], bytes("2026"))),
                        box("©ART", box("data", new byte[8], bytes("me"))),
                        box("©alb", box("data", new byte[8], bytes("trip"))),
                        box("©gen", box("data", new byte[8], bytes("vlog"))),
                        box("desc", box("data", new byte[8], bytes("short"))),
                        box("ldes", box("data", new byte[8], bytes("long"))))))));
        ordinary.put("3GPP asset boxes", movie(track("vide"), box("udta",
                box("titl", new byte[6], bytes("title")), box("dscp", new byte[6], bytes("about")),
                box("cprt", new byte[6], bytes("mine")), box("perf", new byte[6], bytes("me")),
                box("auth", new byte[6], bytes("me")), box("albm", new byte[6], bytes("trip")),
                box("yrrc", new byte[6], bytes("20")), box("kywd", new byte[6], bytes("k")),
                box("gnre", new byte[6], bytes("g")), box("rtng", new byte[6], bytes("r")),
                box("clsf", new byte[6], bytes("c")))));
        ordinary.put("QuickTime's name and hint info", movie(track("vide"), box("udta",
                box("name", bytes("clip")), box("hnti", new byte[8]), box("hinf", new byte[8]))));
        ordinary.put("a Galaxy's smrd and friends straight under udta", movie(track("vide"), track("soun"),
                box("udta", box("smrd", new byte[24]), box("SDLN", new byte[8]), box("cver", new byte[8]),
                        box("cmnm", bytes("SM-S901U")), box("©mak", new byte[4], bytes("samsung")))));
        for (Map.Entry<String, byte[]> file : ordinary.entrySet()) {
            assertEquals(file.getKey(), -1, OriginalChatMedia.videoPassthrough(9, 4_000_000L,
                    video(join(fileType(), file.getValue(), media()))));
        }

        Map<String, byte[]> placed = new LinkedHashMap<>();
        placed.put("loci beside an editor's tags", movie(track("vide"), box("udta", box("titl", new byte[6], bytes("a")),
                box("loci", new byte[24]))));
        placed.put("a ©xyz item beside ffmpeg's tool", movie(track("vide"), box("udta", box("meta", new byte[4], mdir,
                box("ilst", box("©too", box("data", new byte[8], bytes("Lavf58"))),
                        box("©xyz", box("data", new byte[8], place)))))));
        placed.put("a ©xyz directly under a Galaxy's udta", movie(track("vide"),
                box("udta", box("smrd", new byte[24]), box("©xyz", new byte[4], place))));
        placed.put("cover art in the item list", movie(track("vide"), box("udta", box("meta", new byte[4], mdir,
                box("ilst", box("covr", box("data", new byte[8], new byte[12])))))));
        for (Map.Entry<String, byte[]> file : placed.entrySet()) {
            assertEquals(file.getKey(), 9, OriginalChatMedia.videoPassthrough(9, 4_000_000L,
                    video(join(fileType(), file.getValue(), media()))));
        }
    }

    /**
     * The 25 MB cap was checked on the size Facebook reported. A file whose own length is over it
     * keeps the re-encode whatever size was reported, and one at the ceiling still goes out.
     */
    @Test
    public void theFilesOwnLengthIsHeldToTheCapToo() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        for (long extra : new long[] {0, 1}) {
            long total = OriginalChatMedia.VIDEO_MAX_BYTES + extra;
            byte[] front = join(fileType(), movie(track("vide"), track("soun")));
            long mdatSize = total - front.length;
            byte[] header = new byte[8];
            header[0] = (byte) (mdatSize >>> 24);
            header[1] = (byte) (mdatSize >>> 16);
            header[2] = (byte) (mdatSize >>> 8);
            header[3] = (byte) mdatSize;
            System.arraycopy(bytes("mdat"), 0, header, 4, 4);
            String address = video(join(front, header));
            try (java.io.RandomAccessFile file = new java.io.RandomAccessFile(
                    android.net.Uri.parse(address).getPath(), "rw")) {
                file.setLength(total);
            }
            // Facebook says it is small; the file itself says otherwise by one byte.
            assertEquals("a file of " + total + " bytes", extra == 0 ? -1 : 9,
                    OriginalChatMedia.videoPassthrough(9, 4_000_000L, address));
        }
    }

    /**
     * Binary Exif that carries a place and none of the words the scan looks for: Nikon's NCDT with
     * its NCTG, Pentax, Panasonic and Canon maker boxes, an ISO meta whose iloc points at an Exif
     * item, a UTF-16 XMP packet and an iTunes-style item. Each is a box the udta or meta isn't on the
     * list to hold, or text in a wider encoding, so the video keeps the re-encode.
     */
    @Test
    public void binaryExifAndOtherTagsInUdtaAndMetaKeepTheReEncode() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        byte[] mdta = box("hdlr", new byte[8], bytes("mdta"), new byte[13]);
        byte[] binary = new byte[] {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
        Map<String, byte[]> refused = new LinkedHashMap<>();
        refused.put("Nikon NCDT and NCTG", movie(track("vide"), box("udta", box("NCDT", box("NCTG", binary)))));
        refused.put("Pentax PENT", movie(track("vide"), box("udta", box("PENT", binary))));
        refused.put("Panasonic PANA", movie(track("vide"), box("udta", box("PANA", binary))));
        refused.put("Canon CNTH", movie(track("vide"), box("udta", box("CNTH", binary))));
        refused.put("a maker box in a track's udta", movie(track("vide", box("udta", box("PENT", binary))), track("soun")));
        refused.put("an unknown box beside the make", movie(track("vide"),
                box("udta", box("©mak", new byte[4], bytes("Nikon")), box("abcd", binary))));
        refused.put("an ISO meta with an Exif item in iloc and idat", movie(track("vide"), box("meta", new byte[4], mdta,
                box("iinf", new byte[8]), box("iloc", new byte[16]), box("idat", binary))));
        refused.put("an iloc alone in a QuickTime meta", movie(track("vide"), box("meta", mdta, box("iloc", new byte[16]))));
        refused.put("an iloc in a meta inside a udta", movie(track("vide"),
                box("udta", box("meta", new byte[4], mdta, box("iloc", new byte[16])))));
        refused.put("UTF-16 little-endian XMP in Samsung's smta", movie(track("vide"), box("udta",
                box("smta", "<exif:GPSLatitude>".getBytes(java.nio.charset.StandardCharsets.UTF_16LE)))));
        refused.put("UTF-16 big-endian XMP in a vendor box", movie(track("vide"), box("udta",
                box("SDLN", "<exif:GPSLatitude>".getBytes(java.nio.charset.StandardCharsets.UTF_16BE)))));
        refused.put("an iTunes-style freeform item in a list", movie(track("vide"),
                box("meta", mdta, box("ilst", box("----", binary)))));
        refused.put("a udta box cut short", movie(track("vide"), box("udta", box("©mak", new byte[4]), new byte[3])));
        for (Map.Entry<String, byte[]> movie : refused.entrySet()) {
            assertEquals(movie.getKey(), 9, OriginalChatMedia.videoPassthrough(9, 4_000_000L,
                    video(join(fileType(), movie.getValue(), media()))));
        }
        assertEquals("the control: a plain make and model", -1, OriginalChatMedia.videoPassthrough(9, 4_000_000L,
                video(join(fileType(), movie(track("vide"), box("udta", box("©mak", new byte[4], bytes("Nikon")))), media()))));
    }

    /** A media box of [size] zero bytes with [marker] written at [at]. */
    private static byte[] mediaWith(int size, int at, String marker) {
        byte[] payload = new byte[size];
        byte[] text = bytes(marker);
        System.arraycopy(text, 0, payload, at, text.length);
        return box("mdat", payload);
    }

    /**
     * Some Novatek-family dashcams write freeGPS blocks inside the media data with no gps box in
     * the movie, and others log NMEA sentences or LigoGPS there. A marker anywhere in the media,
     * including one split across two 64 KB reads, keeps the re-encode.
     */
    @Test
    public void aGpsLogInsideTheMediaKeepsTheReEncode() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        byte[] plainMovie = movie(track("vide"), track("soun"));
        int chunk = VideoLocation.MDAT_CHUNK;
        Map<String, byte[]> inside = new LinkedHashMap<>();
        inside.put("a freeGPS block", mediaWith(4096, 1000, "freeGPS \u0000\u0000"));
        inside.put("an RMC sentence", mediaWith(4096, 7, "$GPRMC,103001.00,A,3725.32,N"));
        inside.put("a multi-constellation GGA sentence", mediaWith(4096, 4000, "$GNGGA,103001.00,3725.32"));
        inside.put("LigoGPS", mediaWith(4096, 0, "LIGOGPSINFO "));
        inside.put("a marker that ends the media", mediaWith(4096, 4096 - 7, "freeGPS"));
        inside.put("a marker split across the first chunk boundary", mediaWith(chunk * 2, chunk - 3, "$GPRMC,"));
        inside.put("a marker split across the second chunk boundary", mediaWith(chunk * 3, chunk * 2 - 5, "LIGOGPSINFO"));
        inside.put("a marker in the last, short chunk", mediaWith(chunk * 2 + 100, chunk * 2 + 50, "freeGPS"));
        for (Map.Entry<String, byte[]> log : inside.entrySet()) {
            assertEquals(log.getKey() + ", movie first", 9, OriginalChatMedia.videoPassthrough(9, 4_000_000L,
                    video(join(fileType(), plainMovie, log.getValue()))));
            assertEquals(log.getKey() + ", movie last", 9, OriginalChatMedia.videoPassthrough(9, 4_000_000L,
                    video(join(fileType(), log.getValue(), plainMovie))));
        }
        assertEquals("the control: clean media of the same size", -1, OriginalChatMedia.videoPassthrough(9, 4_000_000L,
                video(join(fileType(), plainMovie, mediaWith(chunk * 3, 0, "")))));
        assertEquals("bare gps in the media isn't a log", -1, OriginalChatMedia.videoPassthrough(9, 4_000_000L,
                video(join(fileType(), plainMovie, mediaWith(4096, 100, "gps GPS $GP")))));
    }

    /**
     * A box the movie, a track, its media or their information isn't known to hold, a track with
     * no media or no handler, and every track that isn't video or sound keep the re-encode, since
     * this can't tell what they carry.
     */
    @Test
    public void aBoxTheScanCantVouchForKeepsTheReEncode() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        byte[] header = box("tkhd", new byte[84]);
        Map<String, byte[]> movies = new LinkedHashMap<>();
        movies.put("a box the movie box doesn't hold", movie(track("vide"), box("abcd", new byte[8])));
        movies.put("a box a track doesn't hold", movie(track("vide", box("abcd", new byte[8]))));
        movies.put("a box the media information doesn't hold", movie(box("trak", header, box("mdia",
                box("mdhd", new byte[24]), handler("vide"), box("minf", box("vmhd", new byte[12]), box("gps ", new byte[8]))))));
        movies.put("a track with no media", movie(track("vide"), box("trak", header)));
        movies.put("media with no handler", movie(box("trak", header, box("mdia", box("mdhd", new byte[24]),
                box("minf", box("vmhd", new byte[12]))))));
        movies.put("a track with two media", movie(box("trak", header, box("mdia", box("mdhd", new byte[24]), handler("vide")),
                box("mdia", box("mdhd", new byte[24]), handler("vide")))));
        movies.put("GoPro's gpmd metadata track", movie(track("vide"), track("soun"), track("meta")));
        movies.put("Google's camm motion track", movie(track("vide"), track("camm")));
        movies.put("a text track", movie(track("vide"), track("text")));
        movies.put("a timecode track", movie(track("vide"), track("tmcd")));
        for (Map.Entry<String, byte[]> movie : movies.entrySet()) {
            assertEquals(movie.getKey(), 9, OriginalChatMedia.videoPassthrough(9, 4_000_000L,
                    video(join(fileType(), movie.getValue(), media()))));
        }
        String line = statusLine();
        assertNotNull(String.join("\n", HookStatus.report()), line);
        assertFalse(line, line.contains(OriginalChatMedia.VIDEO_PASSED));
    }

    @Test
    public void aVideoThatCantBeReadInFullKeepsTheReEncode() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        byte[] plain = plainVideo();
        Map<String, String> unread = new LinkedHashMap<>();
        unread.put("cut short in its media", video(Arrays.copyOf(plain, plain.length - 10)));
        byte[] moviePart = join(fileType(), movie(track("vide"), track("soun")));
        unread.put("cut short in its movie box", video(Arrays.copyOf(moviePart, moviePart.length - 20)));
        unread.put("no movie box", video(join(fileType(), media())));
        unread.put("two movie boxes", video(join(fileType(), movie(track("vide")), movie(track("vide")), media())));
        unread.put("fragmented", video(join(fileType(), movie(track("vide"), box("mvex", box("trex", new byte[24]))),
                box("moof", new byte[16]), media())));
        unread.put("a top-level uuid, as XMP can be", video(join(fileType(), box("uuid", new byte[32]),
                movie(track("vide")), media())));
        unread.put("a timed metadata track", video(join(fileType(), movie(track("vide"), track("meta")), media())));
        unread.put("a uuid in the movie", video(join(fileType(), movie(track("vide"), box("uuid", new byte[16])), media())));
        unread.put("a movie box over the limit", video(join(fileType(),
                movie(track("vide"), box("free", new byte[VideoLocation.MAX_MOVIE_BYTES])), media())));
        unread.put("padding that takes the movie box past the limit", video(join(fileType(),
                box("free", new byte[VideoLocation.MAX_MOVIE_BYTES - 100]), movie(track("vide"), track("soun")), media())));
        unread.put("a box smaller than its own header", video(join(fileType(), new byte[] {0, 0, 0, 4, 'f', 'r', 'e', 'e'},
                movie(track("vide")), media())));
        unread.put("a content address", "content://media/external/video/media/1");
        unread.put("a bare path", OriginalChatMediaForTests.file(plain));
        unread.put("a file that's gone", video(plain) + ".gone");
        unread.put("no address", null);
        for (Map.Entry<String, String> file : unread.entrySet()) {
            assertEquals(file.getKey(), 9, OriginalChatMedia.videoPassthrough(9, 4_000_000L, file.getValue()));
        }
        assertEquals("the same file whole", -1, OriginalChatMedia.videoPassthrough(9, 4_000_000L, video(plain)));
    }

    @Test
    public void onTheMainThreadAVideoKeepsTheReEncode() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        String plain = video(plainVideo());
        OriginalChatMedia.onMainThread = () -> true;
        assertEquals(9, OriginalChatMedia.videoPassthrough(9, 4_000_000L, plain));
        OriginalChatMedia.onMainThread = () -> false;
        assertEquals(-1, OriginalChatMedia.videoPassthrough(9, 4_000_000L, plain));
    }

    @Test
    public void pausedFacebookKeepsItsOwnTranscodeAndSizeCheck() throws IOException {
        Settings.ORIGINAL_CHAT_MEDIA.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        String path = OriginalChatMediaForTests.file(OriginalChatMediaForTests.jpeg());
        assertNull(OriginalChatMedia.photo(path, 0, 0, null, extras()));
        assertFalse(OriginalChatMedia.photoAsync(path, 0, 0, null, extras(), new OriginalChatMediaForTests.Callback()));
        String plain = video(plainVideo());
        assertEquals(9, OriginalChatMedia.videoPassthrough(9, 4_000_000L, plain));
        PauseForTests.resume();
        assertEquals(-1, OriginalChatMedia.videoPassthrough(9, 4_000_000L, plain));
    }

    @Test
    public void theCopyKeepsTheRotationTagAndNothingElse() throws IOException {
        byte[] withExif = OriginalChatMediaForTests.jpeg();
        // An EXIF segment with GPS-sized padding goes in after SOI, as a camera writes it.
        byte[] exif = new byte[] {(byte) 0xFF, (byte) 0xE1, 0, 14, 'E', 'x', 'i', 'f', 0, 0, 'C', 'A', 'M', 'E', 'R', 'A'};
        byte[] merged = new byte[withExif.length + exif.length];
        System.arraycopy(withExif, 0, merged, 0, 2);
        System.arraycopy(exif, 0, merged, 2, exif.length);
        System.arraycopy(withExif, 2, merged, 2 + exif.length, withExif.length - 2);
        java.io.File source = new java.io.File(OriginalChatMediaForTests.file(merged));
        java.io.File target = java.io.File.createTempFile("copy", ".jpg");
        target.deleteOnExit();
        OriginalPhoto.copyImageData(source, target, 6);
        byte[] copy = java.nio.file.Files.readAllBytes(target.toPath());
        assertFalse("the camera's EXIF is gone", indexOf(copy, "CAMERA".getBytes()) >= 0);
        assertTrue("the rotation tag is in", indexOf(copy, OriginalPhoto.orientationExif(6)) >= 0);
        OriginalPhoto.copyImageData(source, target, 0);
        byte[] plain = java.nio.file.Files.readAllBytes(target.toPath());
        assertEquals("no tag, no EXIF segment", -1, indexOf(plain, new byte[] {'E', 'x', 'i', 'f'}));
    }

    private static int indexOf(byte[] bytes, byte[] part) {
        outer:
        for (int i = 0; i + part.length <= bytes.length; i++) {
            for (int j = 0; j < part.length; j++) if (bytes[i + j] != part[j]) continue outer;
            return i;
        }
        return -1;
    }
}
