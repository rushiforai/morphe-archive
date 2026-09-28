/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.font;

import android.content.Context;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

/**
 * The font file Use the system font draws in: a copy in Facebook's own files, made when the file is
 * picked. Drawing reads the copy and never the picker's address, which the provider behind it can
 * take back or move, and which would ask that provider on every read.
 *
 * <p>A picked file is checked on the way in. It has to start with one of the tags an sfnt font
 * starts with (TrueType's version 1.0 or 'true', 'OTTO' for OpenType with CFF outlines, 'ttcf' for
 * a collection), be at most {@link #MAX_MEGABYTES}, and be a font Android builds a typeface from.
 * The copy it replaces stays until the new one has passed and takes its place in one rename, and a
 * file turned down leaves nothing behind but, at worst, a partial file the next pick writes over.
 */
public final class FontFile {
    /**
     * The largest file taken. A full Chinese, Japanese and Korean font runs to about 20 MB, and a
     * Latin one is well under 1 MB.
     */
    public static final int MAX_MEGABYTES = 20;
    static final long MAX_BYTES = MAX_MEGABYTES * 1024L * 1024L;

    /** The copy, in Facebook's files folder. */
    static final String NAME = "hushfacebook-font";
    /** Where a copy is written until it has passed its checks. */
    static final String PARTIAL = NAME + ".part";

    static final int TRUETYPE = 0x00010000;
    /** 'true', the tag of Apple's TrueType fonts. */
    static final int TRUETYPE_APPLE = 0x74727565;
    /** 'OTTO', OpenType with CFF outlines. */
    static final int OPENTYPE_CFF = 0x4F54544F;
    /** 'ttcf', a collection of fonts in one file. Android builds the first one. */
    static final int COLLECTION = 0x74746366;

    private static final int FVAR = 0x66766172;
    private static final int WGHT = 0x77676874;
    /** More tables than any real font carries, so a directory that claims more isn't read. */
    private static final int MAX_TABLES = 512;
    private static final int MAX_AXES = 64;

    /** Why a picked file wasn't taken. Each reaches the person as a sentence of its own. */
    public enum Refusal {
        /** The picker's file couldn't be opened or read to the end. */
        UNREADABLE,
        /** It doesn't start like a TrueType or OpenType font, an empty file included. */
        NOT_A_FONT,
        /** Larger than {@link #MAX_MEGABYTES}. */
        TOO_LARGE,
        /** It starts like a font, but Android builds no typeface from it. */
        WONT_LOAD,
        /** The copy couldn't be written to Facebook's files or take the old one's place, or its name couldn't be saved. */
        NOT_SAVED
    }

    /** A file turned down. Nothing was written, and the copy it would have replaced is still there. */
    public static final class Refused extends Exception {
        public final Refusal reason;

        public Refused(Refusal reason, String message) {
            super(message);
            this.reason = reason;
        }
    }

    /** Whether Android builds a typeface from a file: the last check a copy passes. */
    public interface Check {
        boolean loads(File file);
    }

    /**
     * What else a copy taking the old one's place has to change: the setting that names the font.
     * [save] runs once the copy has passed its checks and before it moves in, so a name that won't
     * save leaves the copy before as it was. [undo] puts the name back when the copy then can't move
     * in. Either may throw; a throw from [save] counts as a name that didn't save.
     */
    public interface Choice {
        boolean save();

        void undo();
    }

    /** No setting to change, for a copy with nothing but the file to it. */
    private static final Choice FILE_ONLY = new Choice() {
        @Override
        public boolean save() {
            return true;
        }

        @Override
        public void undo() {
        }
    };

    private FontFile() {
    }

    /** The copy Use the system font draws in. */
    public static File file(Context context) {
        return new File(context.getFilesDir(), NAME);
    }

    /** Whether [tag], a file's first four bytes read as one number, is one a font file starts with. */
    static boolean isFontTag(int tag) {
        return tag == TRUETYPE || tag == TRUETYPE_APPLE || tag == OPENTYPE_CFF || tag == COLLECTION;
    }

    /** {@link #copy(InputStream, File, Check, Choice)} with no setting to change. */
    public static void copy(@Nullable InputStream input, File target, Check check) throws Refused {
        copy(input, target, check, FILE_ONLY);
    }

    /**
     * Copies [input] to [target], checking it on the way, and closes [input]. The bytes go to a
     * file beside [target] first and replace it only once [check] has built a typeface from them and
     * [choice] has saved, in one rename that swaps the whole file or leaves [target] as it was. So a
     * refused file, one that stops halfway, a name that won't save and a copy that can't move in all
     * leave [target] and the name as they were.
     *
     * <p>The first four bytes are read before anything is written, so a picked video or photo is
     * turned down without being copied. Reading stops one chunk past {@link #MAX_BYTES}, so a
     * stream that never ends is turned down too.
     */
    public static void copy(@Nullable InputStream input, File target, Check check, Choice choice) throws Refused {
        if (input == null) throw new Refused(Refusal.UNREADABLE, "No stream to read");
        File partial = new File(target.getParentFile(), PARTIAL);
        boolean kept = false;
        try {
            byte[] head = new byte[4];
            int got = readFully(input, head);
            if (got < head.length || !isFontTag(tagOf(head))) {
                throw new Refused(Refusal.NOT_A_FONT, got < head.length ? "Shorter than a font header" : "No font tag");
            }
            write(input, head, partial);
            boolean loads;
            try {
                loads = check.loads(partial);
            } catch (RuntimeException failure) {
                loads = false;
            }
            if (!loads) throw new Refused(Refusal.WONT_LOAD, "Android built no typeface from it");
            boolean saved;
            try {
                saved = choice.save();
            } catch (RuntimeException failure) {
                saved = false;
            }
            if (!saved) throw new Refused(Refusal.NOT_SAVED, "The font file's name couldn't be saved");
            try {
                moveIn(partial, target);
            } catch (Refused refused) {
                try {
                    choice.undo();
                } catch (RuntimeException failure) {
                    // The name stays the new one, and the copy the old one. Picking again mends it.
                }
                throw refused;
            }
            kept = true;
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

    /**
     * Puts [partial] in [target]'s place in one rename, which replaces [target] whole or leaves it
     * as it was. The old copy is never deleted first, so a rename that fails can't lose both.
     */
    private static void moveIn(File partial, File target) throws Refused {
        try {
            Files.move(partial.toPath(), target.toPath(), StandardCopyOption.REPLACE_EXISTING,
                    StandardCopyOption.ATOMIC_MOVE);
        } catch (IOException | RuntimeException failure) {
            // The class only: a message can carry a path.
            throw new Refused(Refusal.NOT_SAVED, failure.getClass().getSimpleName());
        }
    }

    /** Writes [head] and the rest of [input] to [partial], at most {@link #MAX_BYTES} in all. */
    private static void write(InputStream input, byte[] head, File partial) throws Refused {
        OutputStream output = null;
        try {
            output = new FileOutputStream(partial);
            output.write(head);
            long total = head.length;
            byte[] buffer = new byte[64 * 1024];
            int count;
            while ((count = read(input, buffer)) != -1) {
                total += count;
                if (total > MAX_BYTES) throw new Refused(Refusal.TOO_LARGE, "Larger than " + MAX_BYTES + " bytes");
                output.write(buffer, 0, count);
            }
            output.close();
            output = null;
        } catch (IOException error) {
            // The class only: a message can carry a path.
            throw new Refused(Refusal.NOT_SAVED, error.getClass().getSimpleName());
        } finally {
            if (output != null) {
                try {
                    output.close();
                } catch (IOException ignored) {
                    // The copy is turned down already, and its file removed after this.
                }
            }
        }
    }

    private static int read(InputStream input, byte[] buffer) throws Refused {
        try {
            return input.read(buffer);
        } catch (IOException | RuntimeException error) {
            throw new Refused(Refusal.UNREADABLE, error.getClass().getSimpleName());
        }
    }

    /** Reads until [buffer] is full or the stream ends, and says how many bytes came. */
    private static int readFully(InputStream input, byte[] buffer) throws Refused {
        int filled = 0;
        while (filled < buffer.length) {
            int count;
            try {
                count = input.read(buffer, filled, buffer.length - filled);
            } catch (IOException | RuntimeException error) {
                throw new Refused(Refusal.UNREADABLE, error.getClass().getSimpleName());
            }
            if (count < 0) break;
            filled += count;
        }
        return filled;
    }

    private static int tagOf(byte[] head) {
        return ((head[0] & 0xFF) << 24) | ((head[1] & 0xFF) << 16) | ((head[2] & 0xFF) << 8) | (head[3] & 0xFF);
    }

    /**
     * The least and greatest value of [file]'s 'wght' axis, from its fvar table, or null when it
     * has no such axis: a font that isn't variable, and one whose tables can't be read. For a
     * collection, its first font's, which is the one Android builds.
     */
    @Nullable
    static float[] weightAxis(File file) {
        try (RandomAccessFile font = new RandomAccessFile(file, "r")) {
            long start = 0;
            if (readInt(font, 0) == COLLECTION) {
                if (readInt(font, 8) < 1) return null;
                start = readUnsignedInt(font, 12);
            }
            int tables = readUnsignedShort(font, start + 4);
            if (tables > MAX_TABLES) return null;
            for (int index = 0; index < tables; index++) {
                long record = start + 12 + 16L * index;
                if (readInt(font, record) != FVAR) continue;
                long fvar = readUnsignedInt(font, record + 8);
                int axesAt = readUnsignedShort(font, fvar + 4);
                int axes = readUnsignedShort(font, fvar + 8);
                int axisSize = readUnsignedShort(font, fvar + 10);
                if (axisSize < 20 || axes > MAX_AXES) return null;
                for (int axis = 0; axis < axes; axis++) {
                    long at = fvar + axesAt + (long) axisSize * axis;
                    if (readInt(font, at) != WGHT) continue;
                    // Fixed 16.16: minimum, default, maximum.
                    float least = readInt(font, at + 4) / 65536f;
                    float greatest = readInt(font, at + 12) / 65536f;
                    return least >= 1 && greatest <= 1000 && least <= greatest ? new float[]{least, greatest} : null;
                }
                return null;
            }
            return null;
        } catch (IOException | RuntimeException unreadable) {
            return null;
        }
    }

    private static int readInt(RandomAccessFile font, long at) throws IOException {
        font.seek(at);
        return font.readInt();
    }

    private static long readUnsignedInt(RandomAccessFile font, long at) throws IOException {
        return readInt(font, at) & 0xFFFFFFFFL;
    }

    private static int readUnsignedShort(RandomAccessFile font, long at) throws IOException {
        font.seek(at);
        return font.readUnsignedShort();
    }
}
