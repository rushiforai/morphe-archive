package app.hushmessenger.extension;

import android.graphics.BitmapFactory;
import android.media.ExifInterface;
import android.net.Uri;
import android.util.Log;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * "Send photos at original quality". In encrypted chats Messenger hands every photo to DefaultMediaTranscoder, which
 * re-encodes it even with HD on (a 6.4 MB 4032x3024 JPEG went out as about 1.8 MB). For an HD send of a JPEG these
 * prologues hand back a copy of the photo's own image data, without its metadata except a rotation tag, and Messenger
 * encrypts and uploads that. Anything else, and any failure here, falls through to Messenger's own transcode.
 */
public final class OriginalPhoto {
    private OriginalPhoto() { }

    static final String KEY = "original_photo";
    /** Larger originals keep Messenger's transcode, which fits them under its send limit. */
    static final long MAX_BYTES = 20_000_000;
    /** Smaller targets are thumbnails and previews, never the photo that gets sent. */
    static final double MIN_TARGET = 1024;
    /** Completes async sends off the calling thread, the way Messenger's own transcoder does. */
    static Executor completion = Executors.newSingleThreadExecutor();
    /** Where the copies go; null is the app's cache, where Messenger's own transcoder writes its output too. */
    static File tempDir;
    interface InputOpener { FileInputStream open(File file) throws IOException; }
    static InputOpener inputOpener = FileInputStream::new;

    /** Bounds each real opened file, including growth after the path's initial size check. */
    static final class LimitedInput extends InputStream {
        private final FileInputStream input;
        private long consumed;
        private boolean exceeded;

        LimitedInput(File file) throws IOException {
            input = inputOpener.open(file);
            try { check(); }
            catch (IOException | RuntimeException failure) { input.close(); throw failure; }
        }

        void check() throws IOException {
            if (exceeded || input.getChannel().size() > MAX_BYTES) throw new NotPassable("over 20 MB");
        }

        private void count(long bytes) throws IOException {
            if (bytes > 0) consumed += bytes;
            if (consumed > MAX_BYTES) {
                exceeded = true;
                throw new NotPassable("over 20 MB");
            }
        }

        @Override public int read() throws IOException {
            count(0);
            int value = input.read();
            count(value < 0 ? 0 : 1);
            return value;
        }

        @Override public int read(byte[] bytes, int offset, int length) throws IOException {
            count(0);
            int size = input.read(bytes, offset, (int) Math.min(length, MAX_BYTES - consumed + 1));
            count(size);
            return size;
        }

        @Override public long skip(long length) throws IOException {
            count(0);
            long skipped = input.skip(Math.max(0, Math.min(length, MAX_BYTES - consumed + 1)));
            count(skipped);
            return skipped;
        }

        @Override public int available() throws IOException {
            count(0);
            return (int) Math.min(input.available(), MAX_BYTES - consumed);
        }

        @Override public void close() throws IOException { input.close(); }
    }

    /** A prepared send: the copy to upload, its stored size in pixels and the EXIF rotation tag it kept (0 for none). */
    static final class Prepared {
        final File copy;
        final int width, height, orientation;

        Prepared(File copy, int width, int height, int orientation) {
            this.copy = copy;
            this.width = width;
            this.height = height;
            this.orientation = orientation;
        }

        /** Tags 5 to 8 turn the photo a quarter turn, so it shows with its width and height swapped. */
        boolean quarterTurn() {
            return orientation >= ExifInterface.ORIENTATION_TRANSPOSE;
        }

        String describe() {
            return copy.length() + " bytes, " + width + "x" + height + (orientation == 0 ? "" : ", rotation tag " + orientation);
        }
    }

    /** A file that isn't a JPEG this can pass through; Messenger's transcode handles it instead. */
    static final class NotPassable extends IOException {
        NotPassable(String reason) { super(reason); }
    }

    /** DefaultMediaTranscoder.transcodeImage: the photo's own image data, or null for Messenger's transcode. */
    public static byte[] sync(String url, double maxWidth, double maxHeight, String options, Map<?, ?> extras) {
        try {
            Prepared prepared = prepare(url, maxWidth, maxHeight, extras);
            if (prepared == null) return null;
            try {
                Log.i("HushMessenger", "Original photo: " + prepared.describe());
                try (LimitedInput in = new LimitedInput(prepared.copy);
                     ByteArrayOutputStream bytes = new ByteArrayOutputStream((int) Math.min(prepared.copy.length(), MAX_BYTES))) {
                    byte[] buffer = new byte[8192];
                    int size;
                    while ((size = in.read(buffer)) != -1) {
                        if (size == 0) throw new IOException("No image data");
                        bytes.write(buffer, 0, size);
                    }
                    in.check();
                    return bytes.toByteArray();
                }
            } finally {
                prepared.copy.delete();
            }
        } catch (IOException | RuntimeException | OutOfMemoryError error) {
            Settings.hookFailedPrivately(KEY, "Original photo failed, Messenger's copy is sent instead", error);
            return null;
        }
    }

    /** DefaultMediaTranscoder.transcodeImageAsync: true once this send is handled, false for Messenger's transcode. */
    public static boolean async(String url, double maxWidth, double maxHeight, String options, Map<?, ?> extras, Object callback) {
        if (callback == null) return false;
        Prepared prepared = null;
        try {
            Method success = successMethod(callback.getClass());
            Method failure = failureMethod(callback.getClass());
            prepared = prepare(url, maxWidth, maxHeight, extras);
            if (prepared == null) return false;
            Prepared sent = prepared;
            Log.i("HushMessenger", "Original photo: " + sent.describe());
            completion.execute(() -> report(callback, success, failure, sent));
            return true;
        } catch (IOException | ReflectiveOperationException | RuntimeException | OutOfMemoryError error) {
            if (prepared != null) prepared.copy.delete();
            Settings.hookFailedPrivately(KEY, "Original photo failed, Messenger's copy is sent instead", error);
            return false;
        }
    }

    /** Hands the copy to Messenger with the same arguments its own transcoder uses, or reports a failure so the send ends. */
    static void report(Object callback, Method success, Method failure, Prepared sent) {
        double width = sent.width, height = sent.height;
        try {
            // Once the asynchronous send is owned here, rejection uses its existing failure callback.
            try (LimitedInput in = new LimitedInput(sent.copy)) { in.check(); }
            // Output URI, source size as stored, output size as shown, quality, PSNR (-1 is Messenger's "not measured"),
            // rotated, then fields its wrapper zeroes anyway. Messenger's own transcoder turns the pixels upright and
            // reports them that way; the copy's rotation tag makes any viewer show it the same way round.
            boolean rotated = sent.orientation >= ExifInterface.ORIENTATION_ROTATE_180;
            success.invoke(callback, Uri.fromFile(sent.copy).toString(), width, height,
                sent.quarterTurn() ? height : width, sent.quarterTurn() ? width : height, 100.0, -1.0,
                rotated, 0, false, 0.0, 0.0, 0.0);
        } catch (java.lang.reflect.InvocationTargetException error) {
            // Messenger entered success and may already own the copy. Never complete the send twice.
            Settings.hookFailedPrivately(KEY, "Original photo success callback failed", error);
        } catch (IOException | ReflectiveOperationException | RuntimeException error) {
            sent.copy.delete();
            Settings.hookFailedPrivately(KEY, "Original photo couldn't hand over its copy", error);
            try {
                failure.invoke(callback, width, height, new IOException("HushMessenger couldn't hand over the original photo"));
            } catch (ReflectiveOperationException | RuntimeException ignored) {
                // Messenger's own failure path threw too; the error above is already recorded.
            }
        }
    }

    static Method successMethod(Class<?> callback) throws NoSuchMethodException {
        return callback.getMethod("success", String.class, double.class, double.class, double.class, double.class,
            double.class, double.class, boolean.class, int.class, boolean.class, double.class, double.class, double.class);
    }

    static Method failureMethod(Class<?> callback) throws NoSuchMethodException {
        return callback.getMethod("failure", double.class, double.class, Throwable.class);
    }

    /** A metadata-free copy of the photo when this send can use the original, else null. */
    static Prepared prepare(String url, double maxWidth, double maxHeight, Map<?, ?> extras) throws IOException {
        if (extras == null || !Boolean.TRUE.equals(extras.get("IS_HD")) || Boolean.TRUE.equals(extras.get("IS_PREVIEW"))) return null;
        // Nothing below touches the file while the switch is off, paused or in safe mode.
        if (!Settings.wouldUse(KEY)) return null;
        double longTarget = Math.max(maxWidth, maxHeight), shortTarget = Math.min(maxWidth, maxHeight);
        // Zero means no limit.
        if (longTarget > 0 && longTarget < MIN_TARGET) return skip("preview size " + (int) maxWidth + "x" + (int) maxHeight);
        String path = url == null ? null : url.startsWith("file:") ? Uri.parse(url).getPath() : new File(url).isAbsolute() ? url : null;
        if (path == null) return skip("not a file");
        File file = new File(path);
        long size = file.length();
        if (!file.isFile() || size <= 0) return skip("unreadable file");
        // Decimal megabytes, the way Android shows file sizes.
        if (size > MAX_BYTES) return skip("over " + MAX_BYTES / 1_000_000 + " MB");
        if (!startsLikeJpeg(file)) return skip("not a JPEG");
        // Phones often save a portrait photo sideways with a tag saying how to turn it. The copy keeps that one tag.
        int orientation = orientation(file, ExifInterface.ORIENTATION_NORMAL);
        if (orientation < ExifInterface.ORIENTATION_UNDEFINED || orientation > ExifInterface.ORIENTATION_ROTATE_270) {
            return skip("unknown rotation tag " + orientation);
        }
        if (orientation == ExifInterface.ORIENTATION_NORMAL) orientation = ExifInterface.ORIENTATION_UNDEFINED;
        int[] bounds = bounds(path);
        if (bounds == null) return skip("no image size");
        int longSide = Math.max(bounds[0], bounds[1]), shortSide = Math.min(bounds[0], bounds[1]);
        if (longTarget > 0 && (longSide > longTarget || shortSide > shortTarget)) {
            return skip(bounds[0] + "x" + bounds[1] + " is larger than " + (int) maxWidth + "x" + (int) maxHeight);
        }
        File copy = File.createTempFile("hush-photo", ".jpg", tempDir);
        try {
            copyImageData(file, copy, orientation);
            int[] copied = bounds(copy.getPath());
            if (copied == null || copied[0] != bounds[0] || copied[1] != bounds[1]) throw new NotPassable("copy decodes differently");
            int kept = orientation(copy, ExifInterface.ORIENTATION_UNDEFINED);
            if (kept != orientation) throw new NotPassable("rotation tag didn't carry over");
        } catch (NotPassable error) {
            copy.delete();
            return skip(error.getMessage());
        } catch (IOException | RuntimeException | OutOfMemoryError error) {
            copy.delete();
            throw error;
        }
        // Recorded last, so "Used" on the settings screen means a photo really went out as is.
        if (!Settings.enabled(KEY)) {
            copy.delete();
            return null;
        }
        return new Prepared(copy, bounds[0], bounds[1], orientation);
    }

    static int[] bounds(String path) throws IOException {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        // Its own stream, closed here, so the copy can be deleted right after on any filesystem.
        try (LimitedInput source = new LimitedInput(new File(path));
             InputStream in = new BufferedInputStream(source)) {
            BitmapFactory.decodeStream(in, null, options);
            // Native decoders can swallow stream exceptions after reading a usable header.
            source.check();
        }
        return options.outWidth > 0 && options.outHeight > 0 ? new int[] {options.outWidth, options.outHeight} : null;
    }

    /** Says why an HD photo keeps Messenger's transcode; the reason never includes the file's name or contents. */
    static Prepared skip(String reason) {
        Log.i("HushMessenger", "Original photo skipped: " + reason);
        return null;
    }

    static boolean startsLikeJpeg(File file) throws IOException {
        try (LimitedInput in = new LimitedInput(file)) {
            boolean jpeg = in.read() == 0xFF && in.read() == 0xD8;
            in.check();
            return jpeg;
        }
    }

    private static int orientation(File file, int fallback) throws IOException {
        try (LimitedInput in = new LimitedInput(file)) {
            int orientation = new ExifInterface(in).getAttributeInt(ExifInterface.TAG_ORIENTATION, fallback);
            in.check();
            return orientation;
        }
    }

    /**
     * Copies a JPEG's image data and nothing else, the way Messenger's own re-encode leaves out the metadata. JFIF, the
     * ICC color profile and Adobe's color transform stay, since they change how the pixels look. EXIF (location, camera,
     * time and its thumbnail), XMP, IPTC, comments, JFXX thumbnails, multi-picture data and anything after the end of the
     * image, such as a motion photo's video, are left out. The scan data is copied byte for byte. A rotation tag other
     * than 0 goes into a new EXIF segment of its own, after JFIF when there is one and first otherwise.
     */
    static void copyImageData(File source, File target, int orientation) throws IOException {
        try (LimitedInput sourceInput = new LimitedInput(source);
             DataInputStream in = new DataInputStream(new BufferedInputStream(sourceInput, 65536));
             OutputStream out = new BufferedOutputStream(new FileOutputStream(target), 65536)) {
            if (in.readUnsignedByte() != 0xFF || in.readUnsignedByte() != 0xD8) throw new NotPassable("not a JPEG");
            out.write(0xFF);
            out.write(0xD8);
            boolean exifDue = orientation != 0;
            int marker = nextMarker(in);
            while (true) {
                if (marker == 0xD9) {
                    out.write(0xFF);
                    out.write(0xD9);
                    break;
                }
                if (marker == 0x01 || (marker >= 0xD0 && marker <= 0xD7)) throw new NotPassable("stray marker");
                int length = in.readUnsignedShort();
                if (length < 2) throw new NotPassable("bad segment length");
                byte[] payload = new byte[length - 2];
                in.readFully(payload);
                if (keep(marker, payload)) {
                    if (marker == 0xE0) {
                        // JFIF's base segment can contain an RGB thumbnail, including pixels edited out of the image.
                        if (payload.length < 14) throw new NotPassable("short JFIF header");
                        payload = java.util.Arrays.copyOf(payload, 14);
                        payload[12] = payload[13] = 0;
                    }
                    if (exifDue && marker != 0xE0) {
                        writeSegment(out, 0xE1, orientationExif(orientation));
                        exifDue = false;
                    }
                    writeSegment(out, marker, payload);
                }
                marker = marker == 0xDA ? copyScan(in, out) : nextMarker(in);
            }
            sourceInput.check();
            out.flush();
            if (target.length() > MAX_BYTES) throw new NotPassable("over 20 MB");
        } catch (EOFException truncated) {
            throw new NotPassable("ends early");
        }
    }

    static void writeSegment(OutputStream out, int marker, byte[] payload) throws IOException {
        int length = payload.length + 2;
        out.write(0xFF);
        out.write(marker);
        out.write(length >> 8);
        out.write(length & 0xFF);
        out.write(payload);
    }

    /** EXIF with nothing in it but the rotation tag: one big-endian TIFF directory holding a single SHORT entry. */
    static byte[] orientationExif(int orientation) {
        return new byte[] {'E', 'x', 'i', 'f', 0, 0, 'M', 'M', 0, 42, 0, 0, 0, 8, 0, 1,
            0x01, 0x12, 0, 3, 0, 0, 0, 1, 0, (byte) orientation, 0, 0, 0, 0, 0, 0};
    }

    /** Reads the next marker code, skipping the fill bytes JPEG allows before it. */
    static int nextMarker(DataInputStream in) throws IOException {
        if (in.readUnsignedByte() != 0xFF) throw new NotPassable("expected a marker");
        int marker;
        do marker = in.readUnsignedByte(); while (marker == 0xFF);
        if (marker == 0x00) throw new NotPassable("expected a marker");
        return marker;
    }

    /** Copies entropy-coded data, with its stuffed bytes and restart markers, and returns the marker that ends it. */
    static int copyScan(DataInputStream in, OutputStream out) throws IOException {
        while (true) {
            int value = in.readUnsignedByte();
            if (value != 0xFF) {
                out.write(value);
                continue;
            }
            int next;
            do next = in.readUnsignedByte(); while (next == 0xFF);
            if (next == 0x00 || (next >= 0xD0 && next <= 0xD7)) {
                out.write(0xFF);
                out.write(next);
                continue;
            }
            return next;
        }
    }

    static boolean keep(int marker, byte[] payload) {
        if (marker == 0xE0) return startsWith(payload, "JFIF\0");
        if (marker == 0xE2) return startsWith(payload, "ICC_PROFILE\0");
        if (marker == 0xEE) return startsWith(payload, "Adobe");
        // Every other APPn segment and comments are metadata; tables, frame and scan headers are the image.
        return !(marker >= 0xE0 && marker <= 0xEF) && marker != 0xFE;
    }

    static boolean startsWith(byte[] payload, String prefix) {
        byte[] expected = prefix.getBytes(StandardCharsets.US_ASCII);
        if (payload.length < expected.length) return false;
        for (int i = 0; i < expected.length; i++) if (payload[i] != expected[i]) return false;
        return true;
    }
}
