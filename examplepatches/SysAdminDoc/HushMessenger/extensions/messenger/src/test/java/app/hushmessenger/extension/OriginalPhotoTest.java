package app.hushmessenger.extension;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.ColorSpace;
import android.media.ExifInterface;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowLog;
import static org.junit.Assert.*;

// Real JPEG encoding and decoding need the native graphics stack; the legacy stand-in writes no image data.
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class OriginalPhotoTest {
    @Rule public TemporaryFolder folder = new TemporaryFolder();
    private Executor completion;

    /** Stands in for Messenger's TranscodeImageCompletionCallback, with the same success and failure signatures. */
    public static class Callback {
        final List<Object[]> successes = new ArrayList<>();
        final List<Object[]> failures = new ArrayList<>();

        public void success(String uri, double sourceWidth, double sourceHeight, double width, double height, double quality,
                            double psnr, boolean rotated, int a, boolean b, double c, double d, double e) {
            successes.add(new Object[] {uri, sourceWidth, sourceHeight, width, height, quality, rotated});
        }

        public void failure(double width, double height, Throwable error) {
            failures.add(new Object[] {width, height, error});
        }
    }

    /** A callback whose success throws, as Messenger's would if its own handling broke. */
    public static final class ThrowingCallback extends Callback {
        @Override public void success(String uri, double sourceWidth, double sourceHeight, double width, double height,
                                      double quality, double psnr, boolean rotated, int a, boolean b, double c, double d, double e) {
            super.success(uri, sourceWidth, sourceHeight, width, height, quality, psnr, rotated, a, b, c, d, e);
            throw new IllegalStateException("broken");
        }
    }

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        completion = OriginalPhoto.completion;
        OriginalPhoto.completion = Runnable::run;
        OriginalPhoto.inputOpener = java.io.FileInputStream::new;
        OriginalPhoto.tempDir = folder.getRoot().toPath().resolve("copies").toFile();
        assertTrue(OriginalPhoto.tempDir.mkdirs());
        ShadowLog.clear();
    }

    @After public void restore() {
        OriginalPhoto.completion = completion;
        OriginalPhoto.tempDir = null;
        OriginalPhoto.inputOpener = java.io.FileInputStream::new;
    }

    private static byte[] encode(int width, int height, ColorSpace space) {
        Bitmap bitmap = space == null ? Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
            : Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888, false, space);
        Random random = new Random(580);
        int[] row = new int[width];
        for (int y = 0; y < height; y++) {
            for (int x = 0; x < width; x++) row[x] = 0xFF000000 | random.nextInt(0x1000000);
            bitmap.setPixels(row, 0, width, 0, y, width, 1);
        }
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        assertTrue(bitmap.compress(Bitmap.CompressFormat.JPEG, 92, out));
        return out.toByteArray();
    }

    private File write(byte[] bytes) throws IOException {
        File file = folder.newFile();
        Files.write(file.toPath(), bytes);
        return file;
    }

    private File jpeg(int width, int height) throws IOException { return write(encode(width, height, null)); }

    private static Map<String, Object> hd() {
        Map<String, Object> extras = new HashMap<>();
        extras.put("IS_HD", true);
        extras.put("IS_ARMADILLO", true);
        return extras;
    }

    private static void switchOn() { Settings.preferences.edit().putBoolean(OriginalPhoto.KEY, true).commit(); }

    private static List<String> logs() {
        List<String> lines = new ArrayList<>();
        for (ShadowLog.LogItem item : ShadowLog.getLogsForTag("HushMessenger")) {
            assertNull("no exception, whose message could hold a path, is logged", item.throwable);
            lines.add(item.msg);
        }
        return lines;
    }

    /** One segment before the scan: its marker and where its bytes start and end (end exclusive). */
    private static List<int[]> headerSegments(byte[] jpeg) {
        List<int[]> segments = new ArrayList<>();
        int at = 2;
        while (at + 4 <= jpeg.length && (jpeg[at] & 0xFF) == 0xFF) {
            int marker = jpeg[at + 1] & 0xFF;
            int end = at + 2 + (((jpeg[at + 2] & 0xFF) << 8) | (jpeg[at + 3] & 0xFF));
            segments.add(new int[] {marker, at, end});
            if (marker == 0xDA) break;
            at = end;
        }
        return segments;
    }

    private static int scanStart(byte[] jpeg) {
        List<int[]> segments = headerSegments(jpeg);
        int[] sos = segments.get(segments.size() - 1);
        assertEquals(0xDA, sos[0]);
        return sos[1];
    }

    private static int endOfImage(byte[] jpeg) {
        for (int i = scanStart(jpeg); i + 1 < jpeg.length; i++) {
            if ((jpeg[i] & 0xFF) == 0xFF && (jpeg[i + 1] & 0xFF) == 0xD9) return i + 2;
        }
        throw new AssertionError("no end of image");
    }

    private static boolean hasSegment(byte[] jpeg, int marker, String prefix) {
        for (int[] s : headerSegments(jpeg)) {
            if (s[0] != marker) continue;
            byte[] payload = Arrays.copyOfRange(jpeg, s[1] + 4, s[2]);
            if (new String(payload, StandardCharsets.ISO_8859_1).startsWith(prefix)) return true;
        }
        return false;
    }

    private static byte[] segment(int marker, String payload) {
        byte[] body = payload.getBytes(StandardCharsets.ISO_8859_1);
        byte[] out = new byte[body.length + 4];
        out[0] = (byte) 0xFF;
        out[1] = (byte) marker;
        out[2] = (byte) ((body.length + 2) >> 8);
        out[3] = (byte) (body.length + 2);
        System.arraycopy(body, 0, out, 4, body.length);
        return out;
    }

    private static byte[] join(byte[]... parts) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (byte[] part : parts) out.write(part, 0, part.length);
        return out.toByteArray();
    }

    @Test public void anHdSendOfAnUprightJpegGoesOutWithItsOwnImageData() throws Exception {
        File photo = jpeg(1600, 1200);
        switchOn();
        // An encoder's plain JPEG has no metadata, so it goes out byte for byte.
        assertArrayEquals(Files.readAllBytes(photo.toPath()), OriginalPhoto.sync(photo.getPath(), 4096, 4096, null, hd()));
        assertEquals("the copy is deleted once read", 0, OriginalPhoto.tempDir.listFiles().length);
        assertTrue(Settings.lastActive(OriginalPhoto.KEY) > 0);
        // Zero means Messenger set no size limit.
        assertNotNull(OriginalPhoto.sync(photo.getPath(), 0, 0, null, hd()));
        assertTrue(logs().contains("Original photo: " + photo.length() + " bytes, 1600x1200"));
    }

    @Test public void everythingElseKeepsMessengersTranscodeAndDoesntCountAsAUse() throws Exception {
        File photo = jpeg(1600, 1200);
        assertNull("switch off", OriginalPhoto.sync(photo.getPath(), 4096, 4096, null, hd()));
        switchOn();
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertNull("paused", OriginalPhoto.sync(photo.getPath(), 4096, 4096, null, hd()));
        Settings.preferences.edit().putBoolean("paused", false).commit();
        Map<String, Object> standard = hd();
        standard.put("IS_HD", false);
        assertNull("HD off", OriginalPhoto.sync(photo.getPath(), 4096, 4096, null, standard));
        assertNull("no extras", OriginalPhoto.sync(photo.getPath(), 4096, 4096, null, null));
        Map<String, Object> preview = hd();
        preview.put("IS_PREVIEW", true);
        assertNull("preview", OriginalPhoto.sync(photo.getPath(), 4096, 4096, null, preview));
        assertNull("thumbnail size", OriginalPhoto.sync(photo.getPath(), 512, 512, null, hd()));
        assertNull("bigger than the target", OriginalPhoto.sync(photo.getPath(), 1280, 1280, null, hd()));
        assertNull("relative path", OriginalPhoto.sync("photo.jpg", 4096, 4096, null, hd()));
        assertNull("missing file", OriginalPhoto.sync(new File(folder.getRoot(), "gone.jpg").getPath(), 4096, 4096, null, hd()));

        File png = folder.newFile();
        try (FileOutputStream out = new FileOutputStream(png)) {
            Bitmap.createBitmap(1200, 900, Bitmap.Config.ARGB_8888).compress(Bitmap.CompressFormat.PNG, 100, out);
        }
        assertNull("PNG", OriginalPhoto.sync(png.getPath(), 4096, 4096, null, hd()));

        File huge = folder.newFile();
        try (RandomAccessFile file = new RandomAccessFile(huge, "rw")) {
            file.write(new byte[] {(byte) 0xFF, (byte) 0xD8});
            file.setLength(OriginalPhoto.MAX_BYTES + 1);
        }
        assertNull("over the size cap", OriginalPhoto.sync(huge.getPath(), 4096, 4096, null, hd()));

        File unknown = jpeg(1600, 1200);
        ExifInterface exif = new ExifInterface(unknown.getPath());
        exif.setAttribute(ExifInterface.TAG_ORIENTATION, "9");
        exif.saveAttributes();
        assertNull("unknown rotation tag", OriginalPhoto.sync(unknown.getPath(), 4096, 4096, null, hd()));

        byte[] whole = Files.readAllBytes(photo.toPath());
        File cut = write(Arrays.copyOf(whole, whole.length / 2));
        assertNull("ends early", OriginalPhoto.sync(cut.getPath(), 4096, 4096, null, hd()));

        assertEquals(0, Settings.lastActive(OriginalPhoto.KEY));
        assertTrue(Settings.hookErrors.isEmpty());
        assertEquals(0, OriginalPhoto.tempDir.listFiles().length);
    }

    @Test public void withTheSwitchOffThePhotoIsNeverOpened() throws Exception {
        String missing = new File(folder.getRoot(), "gone.jpg").getPath();
        assertNull(OriginalPhoto.sync(missing, 4096, 4096, null, hd()));
        assertEquals("nothing checked the file", List.of(), logs());
        switchOn();
        assertNull(OriginalPhoto.sync(missing, 4096, 4096, null, hd()));
        assertEquals(List.of("Original photo skipped: unreadable file"), logs());
    }

    @Test public void metadataIsLeftOutAndTheImageDataIsNot() throws Exception {
        byte[] p3 = encode(1600, 1200, ColorSpace.get(ColorSpace.Named.DISPLAY_P3));
        assertTrue("the encoder embeds its color profile", hasSegment(p3, 0xE2, "ICC_PROFILE\0"));
        // Real EXIF with a location, a camera and a time, written the way a phone's gallery would.
        File tagged = write(p3);
        ExifInterface exif = new ExifInterface(tagged.getPath());
        exif.setAttribute(ExifInterface.TAG_GPS_LATITUDE, "40/1,44/1,5424/100");
        exif.setAttribute(ExifInterface.TAG_GPS_LATITUDE_REF, "N");
        exif.setAttribute(ExifInterface.TAG_GPS_LONGITUDE, "73/1,59/1,834/100");
        exif.setAttribute(ExifInterface.TAG_GPS_LONGITUDE_REF, "W");
        exif.setAttribute(ExifInterface.TAG_MAKE, "HushCam");
        exif.setAttribute(ExifInterface.TAG_DATETIME_ORIGINAL, "2026:09:30 04:43:00");
        exif.saveAttributes();
        byte[] withExif = Files.readAllBytes(tagged.toPath());
        assertTrue(hasSegment(withExif, 0xE1, "Exif\0"));
        // Other metadata segments, then a motion photo's video after the end of the image.
        byte[] trailer = join("\0\0\0\u0018ftypmp42".getBytes(StandardCharsets.ISO_8859_1), new byte[4096]);
        byte[] original = join(Arrays.copyOf(withExif, 2),
            segment(0xE1, "http://ns.adobe.com/xap/1.0/\0<x:xmpmeta GCamera:MotionPhoto=\"1\"/>"),
            segment(0xE2, "MPF\0MM\0*"),
            segment(0xED, "Photoshop 3.0\08BIM"),
            segment(0xFE, "HushCam comment"),
            segment(0xE0, "JFXX\0\u0010thumbnail"),
            segment(0xEE, "Adobe\0d\0\0\0\0\1"),
            Arrays.copyOfRange(withExif, 2, withExif.length), trailer);
        File photo = write(original);
        switchOn();

        byte[] sent = OriginalPhoto.sync(photo.getPath(), 4096, 4096, null, hd());
        assertNotNull(sent);
        assertTrue(hasSegment(sent, 0xE0, "JFIF\0"));
        assertTrue(hasSegment(sent, 0xE2, "ICC_PROFILE\0"));
        assertTrue(hasSegment(sent, 0xEE, "Adobe"));
        for (int[] s : headerSegments(sent)) {
            assertNotEquals("no EXIF or XMP", 0xE1, s[0]);
            assertNotEquals("no IPTC", 0xED, s[0]);
            assertNotEquals("no comment", 0xFE, s[0]);
        }
        assertFalse("no multi-picture data", hasSegment(sent, 0xE2, "MPF\0"));
        assertFalse("no JFXX thumbnail", hasSegment(sent, 0xE0, "JFXX\0"));
        assertEquals("nothing after the end of the image", endOfImage(sent), sent.length);
        // The scan data is the original's, byte for byte.
        assertArrayEquals(Arrays.copyOfRange(original, scanStart(original), endOfImage(original)),
            Arrays.copyOfRange(sent, scanStart(sent), sent.length));

        File out = write(sent);
        ExifInterface result = new ExifInterface(out.getPath());
        assertFalse(result.getLatLong(new float[2]));
        assertNull(result.getAttribute(ExifInterface.TAG_MAKE));
        assertNull(result.getAttribute(ExifInterface.TAG_DATETIME_ORIGINAL));
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(out.getPath(), bounds);
        assertEquals(1600, bounds.outWidth);
        assertEquals(1200, bounds.outHeight);
        assertEquals(ColorSpace.get(ColorSpace.Named.DISPLAY_P3), bounds.outColorSpace);
        // The user's own file is never touched.
        assertArrayEquals(original, Files.readAllBytes(photo.toPath()));
    }

    @Test public void jfifEmbeddedThumbnailIsRemovedFromBothSendRoutes() throws Exception {
        byte[] encoded = encode(1600, 1200, null);
        byte[] jfif = {'J', 'F', 'I', 'F', 0, 1, 2, 1, 0, 72, 0, 72, 1, 1, 12, 34, 56};
        byte[] original = join(Arrays.copyOf(encoded, 2), segment(0xE0, new String(jfif, StandardCharsets.ISO_8859_1)),
            Arrays.copyOfRange(encoded, 2, encoded.length));
        File photo = write(original);
        switchOn();
        byte[] sent = OriginalPhoto.sync(photo.getPath(), 4096, 4096, null, hd());
        assertNotNull(sent);
        Callback callback = new Callback();
        assertTrue(OriginalPhoto.async(photo.getPath(), 4096, 4096, null, hd(), callback));
        File[] copies = OriginalPhoto.tempDir.listFiles();
        assertEquals(1, copies.length);
        byte[] async = Files.readAllBytes(copies[0].toPath());
        for (byte[] result : new byte[][] {sent, async}) {
            int[] header = headerSegments(result).get(0);
            assertEquals(0xE0, header[0]);
            // Segment bounds include marker and length. JFIF must keep its 14-byte header without RGB thumbnail data.
            assertEquals(18, header[2] - header[1]);
            assertArrayEquals(Arrays.copyOf(jfif, 12), Arrays.copyOfRange(result, header[1] + 4, header[1] + 16));
            assertEquals(0, result[header[1] + 16]);
            assertEquals(0, result[header[1] + 17]);
            assertArrayEquals(Arrays.copyOfRange(original, scanStart(original), endOfImage(original)),
                Arrays.copyOfRange(result, scanStart(result), endOfImage(result)));
        }
        assertArrayEquals(original, Files.readAllBytes(photo.toPath()));
    }

    @Test public void anAsyncSendReportsACopyOfItsOwnImageData() throws Exception {
        File photo = jpeg(1600, 1200);
        switchOn();
        Callback callback = new Callback();
        assertTrue(OriginalPhoto.async(photo.getPath(), 4096, 4096, null, hd(), callback));
        assertEquals(1, callback.successes.size());
        assertEquals(0, callback.failures.size());
        Object[] call = callback.successes.get(0);
        File[] copies = OriginalPhoto.tempDir.listFiles();
        assertEquals(1, copies.length);
        File copy = copies[0];
        assertTrue((String) call[0], ((String) call[0]).startsWith("file:") && ((String) call[0]).endsWith(copy.getName()));
        assertArrayEquals(Files.readAllBytes(photo.toPath()), Files.readAllBytes(copy.toPath()));
        assertEquals(1600.0, call[1]);
        assertEquals(1200.0, call[2]);
        assertEquals(1600.0, call[3]);
        assertEquals(1200.0, call[4]);
        assertEquals(100.0, call[5]);
        assertEquals(false, call[6]);
        copy.delete();
    }

    private File tagged(int orientation) throws IOException {
        File photo = jpeg(1600, 1200);
        ExifInterface exif = new ExifInterface(photo.getPath());
        exif.setAttribute(ExifInterface.TAG_ORIENTATION, String.valueOf(orientation));
        exif.setAttribute(ExifInterface.TAG_GPS_LATITUDE, "40/1,44/1,5424/100");
        exif.setAttribute(ExifInterface.TAG_GPS_LATITUDE_REF, "N");
        exif.setAttribute(ExifInterface.TAG_GPS_LONGITUDE, "73/1,59/1,834/100");
        exif.setAttribute(ExifInterface.TAG_GPS_LONGITUDE_REF, "W");
        exif.setAttribute(ExifInterface.TAG_MAKE, "HushCam");
        exif.saveAttributes();
        return photo;
    }

    @Test public void aSidewaysPhotoKeepsItsRotationTagAndNothingElse() throws Exception {
        File photo = tagged(ExifInterface.ORIENTATION_ROTATE_90);
        byte[] original = Files.readAllBytes(photo.toPath());
        switchOn();
        byte[] sent = OriginalPhoto.sync(photo.getPath(), 4096, 4096, null, hd());
        assertNotNull(sent);
        // The only EXIF is the new 32-byte one, straight after JFIF, the order cameras write them in.
        List<int[]> segments = headerSegments(sent);
        assertEquals(0xE0, segments.get(0)[0]);
        assertArrayEquals(OriginalPhoto.orientationExif(6), Arrays.copyOfRange(sent, segments.get(1)[1] + 4, segments.get(1)[2]));
        assertEquals(1, segments.stream().filter(s -> s[0] == 0xE1).count());
        assertArrayEquals(Arrays.copyOfRange(original, scanStart(original), endOfImage(original)),
            Arrays.copyOfRange(sent, scanStart(sent), sent.length));

        ExifInterface result = new ExifInterface(write(sent).getPath());
        assertEquals(ExifInterface.ORIENTATION_ROTATE_90, result.getAttributeInt(ExifInterface.TAG_ORIENTATION, 0));
        assertFalse(result.getLatLong(new float[2]));
        assertNull(result.getAttribute(ExifInterface.TAG_MAKE));
        assertTrue(logs().contains("Original photo: " + sent.length + " bytes, 1600x1200, rotation tag 6"));
        assertTrue(Settings.lastActive(OriginalPhoto.KEY) > 0);
    }

    @Test public void withoutJfifTheRotationTagComesFirst() throws Exception {
        byte[] plain = encode(1600, 1200, null);
        int[] jfif = headerSegments(plain).get(0);
        assertEquals(0xE0, jfif[0]);
        File photo = write(join(Arrays.copyOf(plain, 2), Arrays.copyOfRange(plain, jfif[2], plain.length)));
        ExifInterface exif = new ExifInterface(photo.getPath());
        exif.setAttribute(ExifInterface.TAG_ORIENTATION, String.valueOf(ExifInterface.ORIENTATION_ROTATE_270));
        exif.setAttribute(ExifInterface.TAG_MAKE, "HushCam");
        exif.saveAttributes();
        switchOn();
        byte[] sent = OriginalPhoto.sync(photo.getPath(), 4096, 4096, null, hd());
        assertNotNull(sent);
        List<int[]> segments = headerSegments(sent);
        assertArrayEquals(OriginalPhoto.orientationExif(8), Arrays.copyOfRange(sent, segments.get(0)[1] + 4, segments.get(0)[2]));
        List<Integer> source = new ArrayList<>(), rest = new ArrayList<>();
        for (int[] s : headerSegments(Files.readAllBytes(photo.toPath()))) if (s[0] != 0xE1) source.add(s[0]);
        for (int[] s : segments.subList(1, segments.size())) rest.add(s[0]);
        assertEquals("the photo's own segments follow in order", source, rest);
    }

    @Test public void theSizeCapIsTwentyMillionBytes() throws Exception {
        switchOn();
        // Exactly the cap gets past the size check to the next one, which this file fails.
        File atCap = folder.newFile();
        try (RandomAccessFile file = new RandomAccessFile(atCap, "rw")) {
            file.setLength(20_000_000);
        }
        assertNull(OriginalPhoto.sync(atCap.getPath(), 4096, 4096, null, hd()));
        File huge = folder.newFile();
        try (RandomAccessFile file = new RandomAccessFile(huge, "rw")) {
            file.write(new byte[] {(byte) 0xFF, (byte) 0xD8});
            file.setLength(20_000_001);
        }
        assertNull(OriginalPhoto.sync(huge.getPath(), 4096, 4096, null, hd()));
        assertEquals(List.of("Original photo skipped: not a JPEG", "Original photo skipped: over 20 MB"), logs());
    }

    private File paddedJpeg(int size) throws IOException {
        byte[] image = encode(32, 24, null);
        File file = write(image);
        try (RandomAccessFile output = new RandomAccessFile(file, "rw")) {
            output.setLength(size);
            output.seek(image.length - 2);
            output.writeShort(0);
            output.seek(size - 2);
            output.writeShort(0xffd9);
        }
        return file;
    }

    @Test public void overLimitCopyIsRejectedDuringParsing() throws Exception {
        File source = paddedJpeg((int) OriginalPhoto.MAX_BYTES + 1);
        File target = folder.newFile();
        try {
            OriginalPhoto.copyImageData(source, target, 0);
            fail("Copying must enforce the ceiling independently of prepare's earlier length check");
        } catch (IOException expected) {
            assertTrue(expected.getMessage().contains("over 20 MB"));
        }
        assertEquals(OriginalPhoto.MAX_BYTES + 1, source.length());
    }

    @Test public void aQueuedOversizedCopyFailsOnceAndKeepsUnrelatedFiles() throws Exception {
        File source = jpeg(32, 24);
        byte[] sourceBytes = Files.readAllBytes(source.toPath());
        File previous = new File(OriginalPhoto.tempDir, "previous.jpg");
        Files.write(previous.toPath(), new byte[] {1, 2, 3});
        List<Runnable> scheduled = new ArrayList<>();
        OriginalPhoto.completion = scheduled::add;
        Callback callback = new Callback();
        switchOn();
        assertTrue("The async route owns the send once queued", OriginalPhoto.async(source.getPath(), 4096, 4096, null, hd(), callback));
        assertEquals(1, scheduled.size());
        File[] copies = OriginalPhoto.tempDir.listFiles(file -> file.getName().startsWith("hush-photo"));
        assertEquals(1, copies.length);
        try (RandomAccessFile copy = new RandomAccessFile(copies[0], "rw")) { copy.setLength(OriginalPhoto.MAX_BYTES + 1); }
        scheduled.get(0).run();
        assertTrue(callback.successes.isEmpty());
        assertEquals(1, callback.failures.size());
        assertFalse(copies[0].exists());
        assertArrayEquals(new byte[] {1, 2, 3}, Files.readAllBytes(previous.toPath()));
        assertArrayEquals(sourceBytes, Files.readAllBytes(source.toPath()));
    }

    private static java.io.FileInputStream growOnFirstRead(File file, boolean moveEndMarker,
            java.util.concurrent.atomic.AtomicLong readBytes) throws IOException {
        return new java.io.FileInputStream(file) {
            boolean changed;
            @Override public int read(byte[] bytes, int offset, int length) throws IOException {
                if (!changed) {
                    changed = true;
                    try (RandomAccessFile output = new RandomAccessFile(file, "rw")) {
                        if (moveEndMarker) { output.seek(output.length() - 2); output.writeShort(0); }
                        output.setLength(OriginalPhoto.MAX_BYTES + 1);
                        if (moveEndMarker) { output.seek(output.length() - 2); output.writeShort(0xffd9); }
                    }
                }
                int size = super.read(bytes, offset, length);
                if (size > 0) readBytes.addAndGet(size);
                return size;
            }
        };
    }

    @Test public void sourceGrowthAndReplacementAfterValidationFallBackBeforeDelivery() throws Exception {
        switchOn();
        File previous = new File(OriginalPhoto.tempDir, "previous.jpg");
        Files.write(previous.toPath(), new byte[] {1, 2, 3});
        for (boolean replaced : new boolean[] {false, true}) for (boolean asynchronous : new boolean[] {false, true}) {
            File source = jpeg(32, 24);
            int[] opens = {0};
            OriginalPhoto.inputOpener = file -> {
                if (file.equals(source) && ++opens[0] == 4) {
                    if (!replaced) return growOnFirstRead(file, false, new java.util.concurrent.atomic.AtomicLong());
                    File replacement = paddedJpeg((int) OriginalPhoto.MAX_BYTES + 1);
                    Files.move(replacement.toPath(), source.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
                }
                return new java.io.FileInputStream(file);
            };
            Callback callback = new Callback();
            if (asynchronous) assertFalse(OriginalPhoto.async(source.getPath(), 4096, 4096, null, hd(), callback));
            else assertNull(OriginalPhoto.sync(source.getPath(), 4096, 4096, null, hd()));
            assertEquals("The source changed at the actual copying open", 4, opens[0]);
            assertEquals(OriginalPhoto.MAX_BYTES + 1, source.length());
            assertTrue(callback.successes.isEmpty());
            assertTrue(callback.failures.isEmpty());
            assertArrayEquals(new byte[] {1, 2, 3}, Files.readAllBytes(previous.toPath()));
            assertEquals("Only the new rejected copy is removed", 1, OriginalPhoto.tempDir.listFiles().length);
        }
    }

    @Test public void growthInsideTheScanCannotReadBeyondTheCeiling() throws Exception {
        File source = jpeg(32, 24);
        switchOn();
        int[] opens = {0};
        var readBytes = new java.util.concurrent.atomic.AtomicLong();
        OriginalPhoto.inputOpener = file -> file.equals(source) && ++opens[0] == 4 ?
            growOnFirstRead(file, true, readBytes) : new java.io.FileInputStream(file);
        assertNull(OriginalPhoto.sync(source.getPath(), 4096, 4096, null, hd()));
        assertEquals(OriginalPhoto.MAX_BYTES + 1, readBytes.get());
        assertEquals(0, OriginalPhoto.tempDir.listFiles().length);
        assertTrue(source.isFile());
    }

    @Test public void growthDuringTheFinalPreparedReadDeletesOnlyThatCopy() throws Exception {
        File source = jpeg(32, 24);
        byte[] sourceBytes = Files.readAllBytes(source.toPath());
        File previous = new File(OriginalPhoto.tempDir, "previous.jpg");
        Files.write(previous.toPath(), new byte[] {1, 2, 3});
        int[] opens = {0};
        var readBytes = new java.util.concurrent.atomic.AtomicLong();
        OriginalPhoto.inputOpener = file -> file.getName().startsWith("hush-photo") && ++opens[0] == 3 ?
            growOnFirstRead(file, false, readBytes) : new java.io.FileInputStream(file);
        switchOn();
        assertNull(OriginalPhoto.sync(source.getPath(), 4096, 4096, null, hd()));
        assertEquals(3, opens[0]);
        assertEquals(OriginalPhoto.MAX_BYTES + 1, readBytes.get());
        assertEquals(1, OriginalPhoto.tempDir.listFiles().length);
        assertArrayEquals(new byte[] {1, 2, 3}, Files.readAllBytes(previous.toPath()));
        assertArrayEquals(sourceBytes, Files.readAllBytes(source.toPath()));
    }

    @Test public void aValidJpegAtTheCeilingPreservesItsScanAndOutputSize() throws Exception {
        File source = paddedJpeg((int) OriginalPhoto.MAX_BYTES);
        byte[] original = Files.readAllBytes(source.toPath());
        switchOn();
        byte[] sent = OriginalPhoto.sync(source.getPath(), 4096, 4096, null, hd());
        assertNotNull(sent);
        assertEquals(OriginalPhoto.MAX_BYTES, sent.length);
        assertArrayEquals(Arrays.copyOfRange(original, scanStart(original), original.length),
            Arrays.copyOfRange(sent, scanStart(sent), sent.length));
        assertEquals(0, OriginalPhoto.tempDir.listFiles().length);
        File extraOrientation = folder.newFile();
        try {
            OriginalPhoto.copyImageData(source, extraOrientation, ExifInterface.ORIENTATION_ROTATE_180);
            fail("Keeping orientation can't produce an oversized result");
        } catch (IOException expected) { assertTrue(expected.getMessage().contains("over 20 MB")); }
        assertTrue(source.isFile());
    }

    @Test public void aSidewaysPhotoReportsItsUprightSizeTheWayMessengersTranscoderDoes() throws Exception {
        switchOn();
        // Tag, then the size it shows at and whether Messenger's own transcoder would have turned it.
        Object[][] cases = {
            {ExifInterface.ORIENTATION_NORMAL, 1600.0, 1200.0, false},
            {ExifInterface.ORIENTATION_FLIP_HORIZONTAL, 1600.0, 1200.0, false},
            {ExifInterface.ORIENTATION_ROTATE_180, 1600.0, 1200.0, true},
            {ExifInterface.ORIENTATION_FLIP_VERTICAL, 1600.0, 1200.0, true},
            {ExifInterface.ORIENTATION_TRANSPOSE, 1200.0, 1600.0, true},
            {ExifInterface.ORIENTATION_ROTATE_90, 1200.0, 1600.0, true},
            {ExifInterface.ORIENTATION_TRANSVERSE, 1200.0, 1600.0, true},
            {ExifInterface.ORIENTATION_ROTATE_270, 1200.0, 1600.0, true},
        };
        for (Object[] c : cases) {
            int orientation = (int) c[0];
            Callback callback = new Callback();
            assertTrue(OriginalPhoto.async(tagged(orientation).getPath(), 4096, 4096, null, hd(), callback));
            Object[] call = callback.successes.get(0);
            String label = "tag " + orientation;
            assertEquals(label, 1600.0, call[1]);
            assertEquals(label, 1200.0, call[2]);
            assertEquals(label, c[1], call[3]);
            assertEquals(label, c[2], call[4]);
            assertEquals(label, c[3], call[6]);
            File[] copies = OriginalPhoto.tempDir.listFiles();
            assertEquals(label, 1, copies.length);
            File copy = copies[0];
            assertTrue(label, ((String) call[0]).endsWith(copy.getName()));
            int kept = new ExifInterface(copy.getPath()).getAttributeInt(ExifInterface.TAG_ORIENTATION, 0);
            assertEquals(label, orientation == ExifInterface.ORIENTATION_NORMAL ? 0 : orientation, kept);
            assertTrue(copy.delete());
        }
    }

    @Test public void anAsyncSendItCantHandleIsLeftToMessenger() throws Exception {
        File photo = jpeg(1600, 1200);
        Callback callback = new Callback();
        assertFalse("switch off", OriginalPhoto.async(photo.getPath(), 4096, 4096, null, hd(), callback));
        switchOn();
        assertFalse("preview size", OriginalPhoto.async(photo.getPath(), 256, 256, null, hd(), callback));
        assertTrue(callback.successes.isEmpty());
        // A callback without Messenger's methods is a hook failure, and the send still goes out through Messenger.
        assertFalse(OriginalPhoto.async(photo.getPath(), 4096, 4096, null, hd(), new Object()));
        assertTrue(Settings.hookErrors.get(OriginalPhoto.KEY).startsWith("java.lang.NoSuchMethodException at "));
        assertEquals(0, OriginalPhoto.tempDir.listFiles().length);
    }

    @Test public void aSuccessCallbackThatThrowsCannotReceiveASecondCompletionOrLoseItsCopy() throws Exception {
        File photo = jpeg(1600, 1200);
        switchOn();
        ThrowingCallback callback = new ThrowingCallback();
        assertTrue(OriginalPhoto.async(photo.getPath(), 4096, 4096, null, hd(), callback));
        assertEquals(1, callback.successes.size());
        assertTrue(callback.failures.isEmpty());
        assertTrue(Settings.hookErrors.get(OriginalPhoto.KEY).startsWith("java.lang.reflect.InvocationTargetException at "));
        File[] copies = OriginalPhoto.tempDir.listFiles();
        assertEquals(1, copies.length);
        File handedOver = copies[0];
        assertEquals(android.net.Uri.fromFile(handedOver).toString(), callback.successes.get(0)[0]);
        assertTrue(handedOver.isFile());
        assertArrayEquals(Files.readAllBytes(photo.toPath()), Files.readAllBytes(handedOver.toPath()));
    }

    @Test public void aRefusedCompletionLeavesNoCopyAndFallsBack() throws Exception {
        File photo = jpeg(1600, 1200);
        switchOn();
        OriginalPhoto.completion = task -> { throw new RejectedExecutionException(); };
        Callback callback = new Callback();
        assertFalse(OriginalPhoto.async(photo.getPath(), 4096, 4096, null, hd(), callback));
        assertEquals(0, OriginalPhoto.tempDir.listFiles().length);
        assertTrue(Settings.hookErrors.get(OriginalPhoto.KEY).startsWith("java.util.concurrent.RejectedExecutionException at "));
    }

    @Test public void aFailureLogsNoPathOrFileName() throws Exception {
        File photo = jpeg(1600, 1200);
        switchOn();
        File nowhere = new File(folder.getRoot(), "no-such-folder");
        OriginalPhoto.tempDir = nowhere;
        assertNull(OriginalPhoto.sync(photo.getPath(), 4096, 4096, null, hd()));
        assertTrue(Settings.hookErrors.get(OriginalPhoto.KEY).startsWith("java.io.IOException at "));
        for (String line : logs()) {
            assertFalse(line, line.contains(nowhere.getName()) || line.contains(photo.getName()) || line.contains(folder.getRoot().getName()));
        }
        assertEquals(0, Settings.lastActive(OriginalPhoto.KEY));
    }
}
