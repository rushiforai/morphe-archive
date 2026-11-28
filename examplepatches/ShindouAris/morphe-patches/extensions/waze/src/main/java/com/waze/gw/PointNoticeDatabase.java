package com.waze.gw;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/** Bounds-checked, dependency-free reader for wme-point-notices.proto. */
final class PointNoticeDatabase {
    static final int SUPPORTED_SCHEMA = 2;
    private static final Charset UTF_8 = Charset.forName("UTF-8");

    final byte[] bytes;
    final String datasetVersion;
    final long generatedAtMs;
    final int spatialZoom;
    private final long[] tileKeys;
    private final int[] bucketOffsets;
    private final int[] bucketLengths;

    private PointNoticeDatabase(byte[] bytes, String datasetVersion, long generatedAtMs,
                                int spatialZoom, List<IndexEntry> entries) {
        this.bytes = bytes;
        this.datasetVersion = datasetVersion;
        this.generatedAtMs = generatedAtMs;
        this.spatialZoom = spatialZoom;
        Collections.sort(entries, new Comparator<IndexEntry>() {
            @Override public int compare(IndexEntry a, IndexEntry b) {
                return a.key < b.key ? -1 : a.key == b.key ? 0 : 1;
            }
        });
        tileKeys = new long[entries.size()];
        bucketOffsets = new int[entries.size()];
        bucketLengths = new int[entries.size()];
        for (int i = 0; i < entries.size(); i++) {
            IndexEntry entry = entries.get(i);
            if (i > 0 && entry.key == tileKeys[i - 1]) {
                throw new ParseException("duplicate point-notice tile");
            }
            tileKeys[i] = entry.key;
            bucketOffsets[i] = entry.offset;
            bucketLengths[i] = entry.length;
        }
    }

    static PointNoticeDatabase parse(byte[] bytes) {
        if (bytes == null || bytes.length == 0) throw new ParseException("empty database");
        Reader reader = new Reader(bytes, 0, bytes.length);
        int schema = 0;
        int zoom = 0;
        String dataset = "";
        long generated = 0L;
        List<IndexEntry> entries = new ArrayList<IndexEntry>();
        while (reader.hasRemaining()) {
            int tag = reader.readTag();
            int field = tag >>> 3;
            int wire = tag & 7;
            if (field == 1 && wire == 0) schema = reader.readInt();
            else if (field == 2 && wire == 2) dataset = reader.readString();
            else if (field == 3 && wire == 0) generated = reader.readVarint();
            else if (field == 4 && wire == 0) zoom = reader.readInt();
            else if (field == 5 && wire == 2) {
                int length = reader.readLength();
                int offset = reader.position();
                long key = scanBucketKey(bytes, offset, length);
                entries.add(new IndexEntry(key, offset, length));
                reader.skipBytes(length);
            } else reader.skipField(wire);
        }
        if (schema != SUPPORTED_SCHEMA) throw new ParseException("unsupported schema " + schema);
        if (dataset.length() == 0 || generated <= 0 || zoom < 1 || zoom > 22) {
            throw new ParseException("missing point database metadata");
        }
        return new PointNoticeDatabase(bytes, dataset, generated, zoom, entries);
    }

    List<Notice> nearby(double latitude, double longitude) {
        int centerX = tileX(longitude, spatialZoom);
        int centerY = tileY(latitude, spatialZoom);
        ArrayList<Notice> out = new ArrayList<Notice>();
        for (int dy = -1; dy <= 1; dy++) {
            for (int dx = -1; dx <= 1; dx++) {
                int index = find(tileKey(centerX + dx, centerY + dy));
                if (index >= 0) parseBucket(bucketOffsets[index], bucketLengths[index], out);
            }
        }
        return out;
    }

    private int find(long key) {
        int low = 0, high = tileKeys.length - 1;
        while (low <= high) {
            int middle = (low + high) >>> 1;
            long value = tileKeys[middle];
            if (value < key) low = middle + 1;
            else if (value > key) high = middle - 1;
            else return middle;
        }
        return -1;
    }

    private void parseBucket(int offset, int length, List<Notice> out) {
        Reader reader = new Reader(bytes, offset, length);
        while (reader.hasRemaining()) {
            int tag = reader.readTag();
            int field = tag >>> 3;
            int wire = tag & 7;
            if (field == 3 && wire == 2) {
                int childLength = reader.readLength();
                out.add(parseNotice(reader.child(childLength)));
                reader.skipBytes(childLength);
            } else reader.skipField(wire);
        }
    }

    private static Notice parseNotice(Reader reader) {
        Notice notice = new Notice();
        while (reader.hasRemaining()) {
            int tag = reader.readTag();
            int field = tag >>> 3;
            int wire = tag & 7;
            if (field == 1 && wire == 2) notice.id = reader.readString();
            else if (field == 2 && wire == 0) notice.type = reader.readInt();
            else if (field == 3 && wire == 0) notice.longitudeE6 = reader.readSint32();
            else if (field == 4 && wire == 0) notice.latitudeE6 = reader.readSint32();
            else if (field == 6 && wire == 0) notice.triggerDistanceM = reader.readInt();
            else if (field == 7 && wire == 0) {
                notice.valueKmh = reader.readInt();
                notice.hasValueKmh = true;
            } else if (field == 9 && wire == 0) notice.sideRule = reader.readInt();
            else reader.skipField(wire);
        }
        if (notice.id.length() == 0 || notice.type <= 0
                || notice.triggerDistanceM <= 0 || notice.triggerDistanceM > 1000
                || notice.sideRule != Notice.RIGHT_OF_TRAVEL) {
            throw new ParseException("invalid point notice");
        }
        return notice;
    }

    private static long scanBucketKey(byte[] bytes, int offset, int length) {
        Reader reader = new Reader(bytes, offset, length);
        int x = -1, y = -1;
        while (reader.hasRemaining()) {
            int tag = reader.readTag();
            int field = tag >>> 3;
            int wire = tag & 7;
            if (field == 1 && wire == 0) x = reader.readInt();
            else if (field == 2 && wire == 0) y = reader.readInt();
            else reader.skipField(wire);
        }
        if (x < 0 || y < 0) throw new ParseException("bucket without coordinates");
        return tileKey(x, y);
    }

    private static long tileKey(int x, int y) {
        return ((long) x << 32) | (y & 0xFFFFFFFFL);
    }

    private static int tileX(double longitude, int zoom) {
        return (int) Math.floor(((longitude + 180.0) / 360.0) * (1 << zoom));
    }

    private static int tileY(double latitude, int zoom) {
        double bounded = Math.max(-85.05112878, Math.min(85.05112878, latitude));
        double radians = Math.toRadians(bounded);
        return (int) Math.floor((1.0 - Math.log(Math.tan(radians)
                + 1.0 / Math.cos(radians)) / Math.PI) * 0.5 * (1 << zoom));
    }

    static final class Notice {
        static final int RIGHT_OF_TRAVEL = 1;
        String id = "";
        int type;
        int longitudeE6;
        int latitudeE6;
        int triggerDistanceM;
        int valueKmh;
        boolean hasValueKmh;
        int sideRule;

        double longitude() { return longitudeE6 / 1000000.0; }
        double latitude() { return latitudeE6 / 1000000.0; }
    }

    private static final class IndexEntry {
        final long key;
        final int offset;
        final int length;
        IndexEntry(long key, int offset, int length) {
            this.key = key;
            this.offset = offset;
            this.length = length;
        }
    }

    private static final class Reader {
        final byte[] data;
        final int end;
        int position;
        Reader(byte[] data, int offset, int length) {
            if (offset < 0 || length < 0 || offset > data.length - length) {
                throw new ParseException("invalid bounds");
            }
            this.data = data;
            this.position = offset;
            this.end = offset + length;
        }
        boolean hasRemaining() { return position < end; }
        int position() { return position; }
        Reader child(int length) { return new Reader(data, position, length); }
        int readTag() {
            long tag = readVarint();
            if (tag <= 0 || tag > Integer.MAX_VALUE) throw new ParseException("bad tag");
            return (int) tag;
        }
        int readLength() {
            long value = readVarint();
            if (value < 0 || value > Integer.MAX_VALUE || value > end - position) {
                throw new ParseException("bad length");
            }
            return (int) value;
        }
        int readInt() {
            long value = readVarint();
            if (value < 0 || value > Integer.MAX_VALUE) throw new ParseException("integer overflow");
            return (int) value;
        }
        int readSint32() {
            long value = readVarint();
            return (int) ((value >>> 1) ^ -(value & 1));
        }
        long readVarint() {
            long value = 0L;
            for (int shift = 0; shift < 64; shift += 7) {
                if (position >= end) throw new ParseException("truncated varint");
                int next = data[position++] & 0xFF;
                value |= (long) (next & 0x7F) << shift;
                if ((next & 0x80) == 0) return value;
            }
            throw new ParseException("varint overflow");
        }
        String readString() {
            int length = readLength();
            String value = new String(data, position, length, UTF_8);
            position += length;
            return value;
        }
        void skipBytes(int length) {
            if (length < 0 || length > end - position) throw new ParseException("truncated bytes");
            position += length;
        }
        void skipField(int wire) {
            if (wire == 0) readVarint();
            else if (wire == 1) skipBytes(8);
            else if (wire == 2) skipBytes(readLength());
            else if (wire == 5) skipBytes(4);
            else throw new ParseException("unsupported wire type");
        }
    }

    static final class ParseException extends IllegalArgumentException {
        ParseException(String message) { super(message); }
    }
}
