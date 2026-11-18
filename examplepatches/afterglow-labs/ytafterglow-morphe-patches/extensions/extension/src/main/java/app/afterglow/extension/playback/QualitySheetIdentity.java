package app.afterglow.extension.playback;

import java.nio.charset.StandardCharsets;

/** Identifies the native sheet's root template, never a nested command or displayed text. */
public final class QualitySheetIdentity {
    // Captured from both native 21.43.523 sheet items. The last field is the template name.
    private static final int[] TEMPLATE_PATH = {1, 168777401, 3, 172035250, 1};
    private static final byte[] QUICK = "quick_quality_sheet_content.eml".getBytes(StandardCharsets.US_ASCII);
    private static final byte[] ADVANCED = "advanced_quality_sheet_content.eml".getBytes(StandardCharsets.US_ASCII);
    private static final byte[] CONTROLLER = "quick_quality_sheet_content_controller".getBytes(StandardCharsets.US_ASCII);
    private static final byte[] ON_TAP = "QuickQualitySheetContentController_handleOnTap".getBytes(StandardCharsets.US_ASCII);
    // The Advanced action's native bottom-sheet command, then the target template's model.
    // Empty and populated captures differ here: model field 8 contains the resolution options.
    private static final int[] ADVANCED_SHEET_PATH = {3, 1, 2, 169495254, 443434441, 1, 1,
            441573002, 4, 153515154, 172660663};
    private static final int[] QUALITY_MODEL_PATH = {1, 168777401, 6, 378898337, 4, 430262147};

    private QualitySheetIdentity() {}

    public static boolean isQuick(byte[] data) {
        if (data == null || data.length == 0) return false;
        try {
            return name(data, path(data, new Slice(0, data.length), TEMPLATE_PATH), QUICK);
        } catch (IllegalArgumentException malformed) {
            return false;
        }
    }

    /** A rendered Advanced row initially has an empty model; only its later action is usable. */
    public static boolean hasResolutions(byte[] data) {
        if (data == null || data.length == 0 || data.length > 65536) return false;
        try {
            Slice command = field(data, new Slice(0, data.length), 342268478);
            if (command == null || !name(data, field(data, command, 1), CONTROLLER)
                    || !name(data, field(data, command, 2), ON_TAP)) return false;
            Slice sheet = path(data, command, ADVANCED_SHEET_PATH);
            if (!name(data, path(data, sheet, TEMPLATE_PATH), ADVANCED)) return false;
            Slice model = path(data, sheet, QUALITY_MODEL_PATH);
            if (model == null) return false;
            Cursor cursor = new Cursor(data, model);
            int options = 0;
            while (cursor.at < model.end) {
                long tag = cursor.tag();
                int wire = (int) (tag & 7);
                if (tag >>> 3 == 8) {
                    if (wire != 2 || ++options > 256) return false;
                    Slice quality = field(data, cursor.bytes(), 1);
                    long resolution = integer(data, quality, 2);
                    if (resolution <= 0 || resolution > 16384) return false;
                } else cursor.skip(wire);
            }
            return options > 0;
        } catch (IllegalArgumentException malformed) {
            return false;
        }
    }

    private static Slice path(byte[] data, Slice message, int[] fields) {
        for (int number : fields) {
            if (message == null) return null;
            message = field(data, message, number);
        }
        return message;
    }

    private static boolean name(byte[] data, Slice value, byte[] expected) {
        if (value == null) return false;
        int length = value.end - value.start;
        if (length < expected.length || length > 256) return false;
        for (int i = 0; i < expected.length; i++) if (data[value.start + i] != expected[i]) return false;
        return length == expected.length || data[value.start + expected.length] == '-'
                || data[value.start + expected.length] == '|';
    }

    private static long integer(byte[] data, Slice message, int wanted) {
        if (message == null) return -1;
        Cursor cursor = new Cursor(data, message);
        long found = -1;
        boolean present = false;
        while (cursor.at < message.end) {
            long tag = cursor.tag();
            int wire = (int) (tag & 7);
            if (tag >>> 3 == wanted) {
                if (present || wire != 0) throw new IllegalArgumentException();
                present = true;
                found = cursor.varint();
            } else cursor.skip(wire);
        }
        return found;
    }

    private static Slice field(byte[] data, Slice message, int wanted) {
        Cursor cursor = new Cursor(data, message);
        Slice found = null;
        while (cursor.at < message.end) {
            long tag = cursor.tag();
            long number = tag >>> 3;
            int wire = (int) (tag & 7);
            if (wire == 2) {
                Slice value = cursor.bytes();
                if (number == wanted) {
                    // Ambiguous/repeated identifiers fail open to the unmodified native sheet.
                    if (found != null) throw new IllegalArgumentException();
                    found = value;
                }
            } else {
                if (number == wanted) throw new IllegalArgumentException();
                cursor.skip(wire);
            }
        }
        return found;
    }

    private static final class Slice {
        final int start, end;
        Slice(int start, int end) { this.start = start; this.end = end; }
    }

    private static final class Cursor {
        final byte[] data;
        final int end;
        int at;
        Cursor(byte[] data, Slice slice) { this.data = data; at = slice.start; end = slice.end; }
        long tag() {
            long tag = varint();
            long number = tag >>> 3;
            if (number == 0 || number > 0x1fffffffL) throw new IllegalArgumentException();
            return tag;
        }
        Slice bytes() {
            long length = varint();
            if (length < 0 || length > end - at) throw new IllegalArgumentException();
            Slice value = new Slice(at, at + (int) length);
            at = value.end;
            return value;
        }
        void skip(int wire) {
            if (wire == 0) varint();
            else if (wire == 2) bytes();
            else if (wire == 1 || wire == 5) {
                int size = wire == 1 ? 8 : 4;
                if (size > end - at) throw new IllegalArgumentException();
                at += size;
            } else throw new IllegalArgumentException();
        }
        long varint() {
            long result = 0;
            for (int shift = 0; shift < 64; shift += 7) {
                if (at == end) throw new IllegalArgumentException();
                int b = data[at++] & 255;
                if (shift == 63 && (b & 254) != 0) throw new IllegalArgumentException();
                result |= (long) (b & 127) << shift;
                if ((b & 128) == 0) return result;
            }
            throw new IllegalArgumentException();
        }
    }
}
