package app.hushmessenger.extension;

import android.graphics.Bitmap;
import android.graphics.ImageDecoder;
import android.util.Size;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

/**
 * The picture for Your own home header (#129). It's shrunk when it's picked, turned the way its camera says, and kept as
 * a PNG in Messenger's files, so drawing the chat list reads one small file and never the picker's address, which the
 * app behind it can take back. The copy it replaces stays until the new one is whole and takes its place in one rename.
 */
final class HomeHeaderPicture {
    /** The largest file taken. A phone camera's photo is well under it. */
    static final int MAX_MEGABYTES = 20;
    static final long MAX_BYTES = MAX_MEGABYTES * 1024L * 1024L;
    /** The header draws about 24 dp high, under 100 pixels on any phone, so this stays sharp and the file small. */
    static final int MAX_HEIGHT = 256, MAX_WIDTH = 1024;
    static final String PARTIAL = HomeHeader.PICTURE + ".part";

    /** Why a picked file wasn't taken. Each reaches the person as a sentence of its own. */
    enum Refusal { UNREADABLE, NOT_A_PICTURE, TOO_LARGE, NOT_SAVED }

    /** A file turned down. Nothing was written, and the copy it would have replaced is still there. */
    static final class Refused extends Exception {
        final Refusal reason;

        Refused(Refusal reason, String message) {
            super(message);
            this.reason = reason;
        }
    }

    private HomeHeaderPicture() { }

    /**
     * Copies [input] to [target] as a PNG at most {@link #MAX_WIDTH} by {@link #MAX_HEIGHT} and closes [input]. The PNG
     * goes to a file beside [target] first and replaces it only once it's whole and [wanted] still says yes, so a refused
     * file, one that stops halfway and a pick that was given up on all leave [target] as it was.
     */
    static void copy(InputStream input, File target, java.util.function.BooleanSupplier wanted) throws Refused {
        if (input == null) throw new Refused(Refusal.UNREADABLE, "No stream to read");
        File partial = new File(target.getParentFile(), PARTIAL);
        boolean kept = false;
        try {
            Bitmap picture = shrink(readAll(input));
            try {
                write(picture, partial);
            } finally {
                picture.recycle();
            }
            if (!wanted.getAsBoolean()) throw new Refused(Refusal.NOT_SAVED, "Given up on");
            try {
                Files.move(partial.toPath(), target.toPath(), StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE);
            } catch (IOException | RuntimeException failure) {
                // The class only: a message can carry a path.
                throw new Refused(Refusal.NOT_SAVED, failure.getClass().getSimpleName());
            }
            kept = true;
            HomeHeader.forget();
        } finally {
            try {
                input.close();
            } catch (IOException | RuntimeException ignored) {
                // Every byte wanted was read, or the copy was already turned down.
            }
            // A leftover that won't go is written over by the next pick.
            if (!kept) partial.delete();
        }
    }

    /** The saved copy's bytes, for Undo to put back, or null when there's none or it can't be read. */
    static byte[] keep(File target) {
        try {
            return target.isFile() && target.length() <= MAX_BYTES ? Files.readAllBytes(target.toPath()) : null;
        } catch (IOException | RuntimeException unreadable) {
            return null;
        }
    }

    /** Writes [bytes] back as the saved copy, whole or not at all, the way a pick does. */
    static boolean restore(byte[] bytes, File target) {
        File partial = new File(target.getParentFile(), PARTIAL);
        try {
            Files.write(partial.toPath(), bytes);
            Files.move(partial.toPath(), target.toPath(), StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE);
            HomeHeader.forget();
            return true;
        } catch (IOException | RuntimeException failure) {
            android.util.Log.w("HushMessenger", "Can't put the header picture back: " + failure.getClass().getSimpleName());
            partial.delete();
            return false;
        }
    }

    /** Takes the picture away, so the words or Messenger's wordmark show again. False when the copy wouldn't go. */
    static boolean remove(File target) {
        boolean gone = !target.exists() || target.delete();
        HomeHeader.forget();
        return gone;
    }

    /** The largest size that fits {@link #MAX_WIDTH} by {@link #MAX_HEIGHT} with the picture's shape, never larger than it came. */
    static int[] fit(int width, int height) {
        float scale = Math.min(1f, Math.min(MAX_WIDTH / (float) width, MAX_HEIGHT / (float) height));
        return new int[] {Math.max(1, Math.round(width * scale)), Math.max(1, Math.round(height * scale))};
    }

    /** [bytes] decoded at the size {@link #fit} gives, turned the way the camera wrote it. An animated picture gives its first frame. */
    static Bitmap shrink(byte[] bytes) throws Refused {
        Bitmap picture;
        try {
            picture = ImageDecoder.decodeBitmap(ImageDecoder.createSource(ByteBuffer.wrap(bytes)), (decoder, info, source) -> {
                // A software bitmap, so it can be written out as a PNG.
                decoder.setAllocator(ImageDecoder.ALLOCATOR_SOFTWARE);
                Size size = info.getSize();
                int[] kept = fit(size.getWidth(), size.getHeight());
                if (kept[0] != size.getWidth() || kept[1] != size.getHeight()) decoder.setTargetSize(kept[0], kept[1]);
            });
        } catch (IOException | RuntimeException error) {
            // The class only: a decoder's message can carry the source's details.
            throw new Refused(Refusal.NOT_A_PICTURE, error.getClass().getSimpleName());
        }
        if (picture.getWidth() <= 0 || picture.getHeight() <= 0) throw new Refused(Refusal.NOT_A_PICTURE, "Decoded to nothing");
        return picture;
    }

    /** Every byte of [input], at most {@link #MAX_BYTES}, so a stream that never ends is turned down too. Empty isn't a picture. */
    static byte[] readAll(InputStream input) throws Refused {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        byte[] buffer = new byte[64 * 1024];
        long total = 0;
        while (true) {
            int count;
            try {
                count = input.read(buffer);
            } catch (IOException | RuntimeException error) {
                throw new Refused(Refusal.UNREADABLE, error.getClass().getSimpleName());
            }
            if (count == -1) break;
            total += count;
            if (total > MAX_BYTES) throw new Refused(Refusal.TOO_LARGE, "Larger than " + MAX_BYTES + " bytes");
            bytes.write(buffer, 0, count);
        }
        if (total == 0) throw new Refused(Refusal.NOT_A_PICTURE, "Empty file");
        return bytes.toByteArray();
    }

    /** Writes [picture] to [partial] as a PNG, which keeps a logo's see-through parts. */
    private static void write(Bitmap picture, File partial) throws Refused {
        try (FileOutputStream output = new FileOutputStream(partial)) {
            if (!picture.compress(Bitmap.CompressFormat.PNG, 100, output)) throw new Refused(Refusal.NOT_SAVED, "The PNG wasn't written");
        } catch (IOException error) {
            throw new Refused(Refusal.NOT_SAVED, error.getClass().getSimpleName());
        }
    }
}
