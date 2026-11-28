package com.waze.gw;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Bounds-checked, dependency-free reader for road_notices.proto schema v2.
 *
 * The complete protobuf stays as raw bytes. Startup indexes segment byte ranges and point tile
 * keys; records are materialized only for the current segment or nearby spatial tiles.
 */
final class RoadNoticeDatabase {
    static final int SUPPORTED_SCHEMA = 2;
    static final int POINT_SPATIAL_ZOOM = 14;

    static final int DIRECTION_BOTH = 1;
    static final int DIRECTION_FORWARD = 2;
    static final int DIRECTION_REVERSE = 3;

    static final int TYPE_MINIMUM_SPEED = 1;
    static final int TYPE_NO_PARKING = 2;
    static final int TYPE_NO_STOPPING = 3;
    static final int TYPE_VOICE_NOTICE = 4;
    static final int TYPE_REST_STOP = 7;
    static final int TYPE_EXPRESSWAY_REST_STOP = 8;
    static final int TYPE_EXPRESSWAY_EXIT = 9;

    static final int TRIGGER_ENTER_SEGMENT = 1;

    static final int DAY_EVERY = 1;
    static final int DAY_ODD = 2;
    static final int DAY_EVEN = 3;

    private static final Charset UTF_8 = Charset.forName("UTF-8");

    final byte[] bytes;
    final int schemaVersion;
    final long datasetVersion;
    final long targetMapBuildId;
    final long generatedAtMs;
    final long[] segmentIds;
    final int[] recordOffsets;
    final int[] recordLengths;
    final long[] pointTileKeys;
    final int[] pointOffsets;
    final int[] pointLengths;

    private RoadNoticeDatabase(byte[] bytes, int schemaVersion, long datasetVersion,
                               long targetMapBuildId, long generatedAtMs,
                               List<IndexEntry> entries, List<PointIndexEntry> pointEntries) {
        this.bytes = bytes;
        this.schemaVersion = schemaVersion;
        this.datasetVersion = datasetVersion;
        this.targetMapBuildId = targetMapBuildId;
        this.generatedAtMs = generatedAtMs;
        Collections.sort(entries, new Comparator<IndexEntry>() {
            @Override public int compare(IndexEntry left, IndexEntry right) {
                return left.segmentId < right.segmentId ? -1
                        : left.segmentId == right.segmentId ? 0 : 1;
            }
        });
        segmentIds = new long[entries.size()];
        recordOffsets = new int[entries.size()];
        recordLengths = new int[entries.size()];
        long previous = -1L;
        for (int i = 0; i < entries.size(); i++) {
            IndexEntry entry = entries.get(i);
            if (entry.segmentId <= 0 || entry.segmentId == previous) {
                throw new ParseException("invalid or duplicate segment id");
            }
            previous = entry.segmentId;
            segmentIds[i] = entry.segmentId;
            recordOffsets[i] = entry.offset;
            recordLengths[i] = entry.length;
        }
        Collections.sort(pointEntries, new Comparator<PointIndexEntry>() {
            @Override public int compare(PointIndexEntry left, PointIndexEntry right) {
                if (left.tileKey < right.tileKey) return -1;
                if (left.tileKey > right.tileKey) return 1;
                return left.offset < right.offset ? -1 : left.offset == right.offset ? 0 : 1;
            }
        });
        pointTileKeys = new long[pointEntries.size()];
        pointOffsets = new int[pointEntries.size()];
        pointLengths = new int[pointEntries.size()];
        for (int i = 0; i < pointEntries.size(); i++) {
            PointIndexEntry entry = pointEntries.get(i);
            pointTileKeys[i] = entry.tileKey;
            pointOffsets[i] = entry.offset;
            pointLengths[i] = entry.length;
        }
    }

    static RoadNoticeDatabase parse(byte[] bytes) {
        if (bytes == null || bytes.length == 0) throw new ParseException("empty database");
        Reader reader = new Reader(bytes, 0, bytes.length);
        int schema = 0;
        long dataset = 0L;
        long mapBuild = 0L;
        long generated = 0L;
        List<IndexEntry> entries = new ArrayList<IndexEntry>();
        List<PointIndexEntry> pointEntries = new ArrayList<PointIndexEntry>();
        while (reader.hasRemaining()) {
            int tag = reader.readTag();
            int field = tag >>> 3;
            int wire = tag & 7;
            if (field == 1 && wire == 0) schema = checkedInt(reader.readVarint());
            else if (field == 2 && wire == 0) dataset = reader.readVarint();
            else if (field == 3 && wire == 0) mapBuild = reader.readVarint();
            else if (field == 4 && wire == 0) generated = reader.readVarint();
            else if (field == 5 && wire == 2) {
                int length = reader.readLength();
                int offset = reader.position();
                long segmentId = scanSegmentId(bytes, offset, length);
                entries.add(new IndexEntry(segmentId, offset, length));
                reader.skipBytes(length);
            } else if (field == 6 && wire == 2) {
                int length = reader.readLength();
                int offset = reader.position();
                pointEntries.add(scanPointIndex(bytes, offset, length));
                reader.skipBytes(length);
            } else reader.skipField(wire);
        }
        if (schema != SUPPORTED_SCHEMA) throw new ParseException("unsupported schema " + schema);
        if (dataset <= 0 || mapBuild <= 0 || generated <= 0) {
            throw new ParseException("missing database metadata");
        }
        return new RoadNoticeDatabase(bytes, schema, dataset, mapBuild, generated,
                entries, pointEntries);
    }

    List<PointRecord> nearbyPoints(double latitude, double longitude) {
        int centerX = tileX(longitude, POINT_SPATIAL_ZOOM);
        int centerY = tileY(latitude, POINT_SPATIAL_ZOOM);
        ArrayList<PointRecord> out = new ArrayList<PointRecord>();
        // A z14 tile is roughly 2.4 km wide in Vietnam. Two rings safely cover the schema's
        // maximum 3 km trigger even when the vehicle is close to a tile boundary.
        for (int dy = -2; dy <= 2; dy++) {
            for (int dx = -2; dx <= 2; dx++) {
                long key = tileKey(centerX + dx, centerY + dy);
                int index = lowerBound(pointTileKeys, key);
                while (index < pointTileKeys.length && pointTileKeys[index] == key) {
                    out.add(parsePoint(pointOffsets[index], pointLengths[index]));
                    index++;
                }
            }
        }
        return out;
    }

    SegmentRecord find(long segmentId) {
        int low = 0;
        int high = segmentIds.length - 1;
        while (low <= high) {
            int middle = (low + high) >>> 1;
            long value = segmentIds[middle];
            if (value < segmentId) low = middle + 1;
            else if (value > segmentId) high = middle - 1;
            else return parseRecord(recordOffsets[middle], recordLengths[middle]);
        }
        return null;
    }

    private SegmentRecord parseRecord(int offset, int length) {
        Reader reader = new Reader(bytes, offset, length);
        long segmentId = 0L;
        long fromNode = -1L;
        long toNode = -1L;
        List<Notice> notices = new ArrayList<Notice>();
        while (reader.hasRemaining()) {
            int tag = reader.readTag();
            int field = tag >>> 3;
            int wire = tag & 7;
            if (field == 1 && wire == 0) segmentId = reader.readVarint();
            else if (field == 2 && wire == 0) fromNode = reader.readVarint();
            else if (field == 3 && wire == 0) toNode = reader.readVarint();
            else if (field == 4 && wire == 2) {
                int childLength = reader.readLength();
                notices.add(parseNotice(reader.child(childLength)));
                reader.skipBytes(childLength);
            } else reader.skipField(wire);
        }
        if (segmentId <= 0) throw new ParseException("record without segment id");
        return new SegmentRecord(segmentId, fromNode, toNode, notices);
    }

    private PointRecord parsePoint(int offset, int length) {
        Reader reader = new Reader(bytes, offset, length);
        int latitudeE6 = 0, longitudeE6 = 0, bearingCdeg = -1, triggerDistanceM = 0;
        long matchedSegmentId = 0L;
        boolean routeOnly = false;
        Notice notice = null;
        ArrayList<Long> approachSegmentIds = new ArrayList<Long>();
        while (reader.hasRemaining()) {
            int tag = reader.readTag();
            int field = tag >>> 3;
            int wire = tag & 7;
            if (field == 1 && wire == 0) latitudeE6 = reader.readSint32();
            else if (field == 2 && wire == 0) longitudeE6 = reader.readSint32();
            else if (field == 3 && wire == 0) bearingCdeg = checkedInt(reader.readVarint());
            else if (field == 4 && wire == 0) triggerDistanceM = checkedInt(reader.readVarint());
            else if (field == 5 && wire == 0) matchedSegmentId = reader.readVarint();
            else if (field == 6 && wire == 0) routeOnly = reader.readVarint() != 0;
            else if (field == 7 && wire == 2) {
                int childLength = reader.readLength();
                notice = parseNotice(reader.child(childLength));
                reader.skipBytes(childLength);
            } else if (field == 8 && wire == 0) {
                approachSegmentIds.add(Long.valueOf(reader.readVarint()));
            } else if (field == 8 && wire == 2) {
                int packedLength = reader.readLength();
                Reader packed = reader.child(packedLength);
                while (packed.hasRemaining()) {
                    approachSegmentIds.add(Long.valueOf(packed.readVarint()));
                }
                reader.skipBytes(packedLength);
            } else reader.skipField(wire);
        }
        if ((approachSegmentIds.isEmpty() && bearingCdeg < 0) || bearingCdeg >= 36000
                || triggerDistanceM < 50
                || triggerDistanceM > 3000 || notice == null || notice.noticeId.length() == 0) {
            throw new ParseException("invalid road point");
        }
        long[] segmentIds = new long[approachSegmentIds.size()];
        for (int i = 0; i < segmentIds.length; i++) {
            long value = approachSegmentIds.get(i).longValue();
            if (value <= 0L) throw new ParseException("invalid approach segment");
            segmentIds[i] = value;
        }
        return new PointRecord(latitudeE6, longitudeE6, bearingCdeg, triggerDistanceM,
                matchedSegmentId, routeOnly, notice, segmentIds);
    }

    private static Notice parseNotice(Reader reader) {
        Notice notice = new Notice();
        while (reader.hasRemaining()) {
            int tag = reader.readTag();
            int field = tag >>> 3;
            int wire = tag & 7;
            if (field == 1 && wire == 2) notice.noticeId = reader.readString();
            else if (field == 2 && wire == 0) notice.direction = checkedInt(reader.readVarint());
            else if (field == 3 && wire == 0) notice.type = checkedInt(reader.readVarint());
            else if (field == 4 && wire == 0) notice.priority = (int) reader.readVarint();
            else if (field == 5 && wire == 0) notice.triggerMode = checkedInt(reader.readVarint());
            else if (field == 6 && wire == 0) reader.readVarint(); // display target, not a TTS gate
            else if (field == 6 && wire == 2) reader.skipBytes(reader.readLength()); // packed enum
            else if (field == 7 && wire == 0) {
                notice.valueKmh = (int) reader.readVarint();
                notice.hasValueKmh = true;
            } else if (field == 8 && wire == 2) notice.title = reader.readString();
            else if (field == 9 && wire == 2) notice.message = reader.readString();
            else if (field == 10 && wire == 2) notice.voiceText = reader.readString();
            else if (field == 13 && wire == 0) notice.cooldownSeconds = checkedInt(reader.readVarint());
            else if (field == 14 && wire == 0) notice.maxRepeatsPerTrip = checkedInt(reader.readVarint());
            else if (field == 15 && wire == 0) {
                notice.validFromMs = reader.readVarint();
                notice.hasValidFrom = true;
            } else if (field == 16 && wire == 0) {
                notice.validUntilMs = reader.readVarint();
                notice.hasValidUntil = true;
            } else if (field == 17 && wire == 0) notice.enabled = reader.readVarint() != 0;
            else if (field == 19 && wire == 2) {
                int childLength = reader.readLength();
                notice.schedule = parseSchedule(reader.child(childLength));
                reader.skipBytes(childLength);
            } else reader.skipField(wire);
        }
        if (notice.noticeId == null) notice.noticeId = "";
        return notice;
    }

    private static RestrictionSchedule parseSchedule(Reader reader) {
        RestrictionSchedule schedule = new RestrictionSchedule();
        while (reader.hasRemaining()) {
            int tag = reader.readTag();
            int field = tag >>> 3;
            int wire = tag & 7;
            if (field == 1 && wire == 0) schedule.dayRule = checkedInt(reader.readVarint());
            else if (field == 2 && wire == 0) {
                schedule.startMinute = checkedInt(reader.readVarint());
                schedule.hasLegacyRange = true;
            } else if (field == 3 && wire == 0) {
                schedule.endMinute = checkedInt(reader.readVarint());
                schedule.hasLegacyRange = true;
            } else if (field == 4 && wire == 2) {
                int childLength = reader.readLength();
                schedule.ranges.add(parseRange(reader.child(childLength)));
                reader.skipBytes(childLength);
            } else reader.skipField(wire);
        }
        return schedule;
    }

    private static TimeRange parseRange(Reader reader) {
        int start = 0;
        int end = 0;
        while (reader.hasRemaining()) {
            int tag = reader.readTag();
            int field = tag >>> 3;
            int wire = tag & 7;
            if (field == 1 && wire == 0) start = checkedInt(reader.readVarint());
            else if (field == 2 && wire == 0) end = checkedInt(reader.readVarint());
            else reader.skipField(wire);
        }
        return new TimeRange(start, end);
    }

    private static long scanSegmentId(byte[] bytes, int offset, int length) {
        Reader reader = new Reader(bytes, offset, length);
        while (reader.hasRemaining()) {
            int tag = reader.readTag();
            int field = tag >>> 3;
            int wire = tag & 7;
            if (field == 1 && wire == 0) return reader.readVarint();
            reader.skipField(wire);
        }
        throw new ParseException("segment record has no id");
    }

    private static PointIndexEntry scanPointIndex(byte[] bytes, int offset, int length) {
        Reader reader = new Reader(bytes, offset, length);
        int latitudeE6 = 0, longitudeE6 = 0;
        boolean hasLatitude = false, hasLongitude = false;
        while (reader.hasRemaining()) {
            int tag = reader.readTag();
            int field = tag >>> 3;
            int wire = tag & 7;
            if (field == 1 && wire == 0) {
                latitudeE6 = reader.readSint32();
                hasLatitude = true;
            } else if (field == 2 && wire == 0) {
                longitudeE6 = reader.readSint32();
                hasLongitude = true;
            } else reader.skipField(wire);
        }
        if (!hasLatitude || !hasLongitude || latitudeE6 < -90000000 || latitudeE6 > 90000000
                || longitudeE6 < -180000000 || longitudeE6 > 180000000) {
            throw new ParseException("road point without valid coordinates");
        }
        long key = tileKey(tileX(longitudeE6 / 1000000.0, POINT_SPATIAL_ZOOM),
                tileY(latitudeE6 / 1000000.0, POINT_SPATIAL_ZOOM));
        return new PointIndexEntry(key, offset, length);
    }

    private static int lowerBound(long[] values, long target) {
        int low = 0, high = values.length;
        while (low < high) {
            int middle = (low + high) >>> 1;
            if (values[middle] < target) low = middle + 1;
            else high = middle;
        }
        return low;
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

    private static int checkedInt(long value) {
        if (value < 0 || value > Integer.MAX_VALUE) throw new ParseException("integer overflow");
        return (int) value;
    }

    static final class SegmentRecord {
        final long segmentId;
        final long fromNodeId;
        final long toNodeId;
        final List<Notice> notices;

        SegmentRecord(long segmentId, long fromNodeId, long toNodeId, List<Notice> notices) {
            this.segmentId = segmentId;
            this.fromNodeId = fromNodeId;
            this.toNodeId = toNodeId;
            this.notices = notices;
        }
    }

    static final class Notice {
        String noticeId = "";
        int direction;
        int type;
        int priority;
        int triggerMode;
        int valueKmh;
        boolean hasValueKmh;
        String title = "";
        String message = "";
        String voiceText = "";
        int cooldownSeconds;
        int maxRepeatsPerTrip;
        long validFromMs;
        boolean hasValidFrom;
        long validUntilMs;
        boolean hasValidUntil;
        boolean enabled;
        RestrictionSchedule schedule;
    }

    static final class PointRecord {
        final int latitudeE6;
        final int longitudeE6;
        final int approachBearingCdeg;
        final int triggerDistanceM;
        final long matchedSegmentId;
        final boolean routeOnly;
        final Notice notice;
        final long[] approachSegmentIds;

        PointRecord(int latitudeE6, int longitudeE6, int approachBearingCdeg,
                    int triggerDistanceM, long matchedSegmentId, boolean routeOnly,
                    Notice notice, long[] approachSegmentIds) {
            this.latitudeE6 = latitudeE6;
            this.longitudeE6 = longitudeE6;
            this.approachBearingCdeg = approachBearingCdeg;
            this.triggerDistanceM = triggerDistanceM;
            this.matchedSegmentId = matchedSegmentId;
            this.routeOnly = routeOnly;
            this.notice = notice;
            this.approachSegmentIds = approachSegmentIds == null
                    ? new long[0] : approachSegmentIds;
        }

        double latitude() { return latitudeE6 / 1000000.0; }
        double longitude() { return longitudeE6 / 1000000.0; }
        double approachBearing() { return approachBearingCdeg / 100.0; }

        boolean hasApproachSegment(long segmentId) {
            if (segmentId <= 0L) return false;
            for (long candidate : approachSegmentIds) {
                if (candidate == segmentId) return true;
            }
            return false;
        }
    }

    static final class RestrictionSchedule {
        int dayRule;
        int startMinute;
        int endMinute;
        boolean hasLegacyRange;
        final List<TimeRange> ranges = new ArrayList<TimeRange>();
    }

    static final class TimeRange {
        final int startMinute;
        final int endMinute;

        TimeRange(int startMinute, int endMinute) {
            this.startMinute = startMinute;
            this.endMinute = endMinute;
        }
    }

    private static final class IndexEntry {
        final long segmentId;
        final int offset;
        final int length;

        IndexEntry(long segmentId, int offset, int length) {
            this.segmentId = segmentId;
            this.offset = offset;
            this.length = length;
        }
    }

    private static final class PointIndexEntry {
        final long tileKey;
        final int offset;
        final int length;

        PointIndexEntry(long tileKey, int offset, int length) {
            this.tileKey = tileKey;
            this.offset = offset;
            this.length = length;
        }
    }

    static final class ParseException extends IllegalArgumentException {
        private static final long serialVersionUID = 1L;
        ParseException(String message) { super(message); }
    }

    private static final class Reader {
        private final byte[] bytes;
        private final int end;
        private int position;

        Reader(byte[] bytes, int offset, int length) {
            if (bytes == null || offset < 0 || length < 0 || offset > bytes.length - length) {
                throw new ParseException("invalid bounds");
            }
            this.bytes = bytes;
            this.position = offset;
            this.end = offset + length;
        }

        boolean hasRemaining() { return position < end; }
        int position() { return position; }

        int readTag() {
            long tag = readVarint();
            if (tag <= 0 || tag > Integer.MAX_VALUE || (tag >>> 3) == 0) {
                throw new ParseException("invalid tag");
            }
            return (int) tag;
        }

        long readVarint() {
            long value = 0L;
            for (int shift = 0; shift < 64; shift += 7) {
                if (position >= end) throw new ParseException("truncated varint");
                int current = bytes[position++] & 0xFF;
                if (shift == 63 && (current & 0xFE) != 0) {
                    throw new ParseException("varint overflow");
                }
                value |= (long) (current & 0x7F) << shift;
                if ((current & 0x80) == 0) return value;
            }
            throw new ParseException("varint too long");
        }

        int readSint32() {
            long value = readVarint();
            return (int) ((value >>> 1) ^ -(value & 1));
        }

        int readLength() {
            long value = readVarint();
            if (value < 0 || value > Integer.MAX_VALUE || value > end - position) {
                throw new ParseException("invalid length");
            }
            return (int) value;
        }

        String readString() {
            int length = readLength();
            String value = new String(bytes, position, length, UTF_8);
            position += length;
            return value;
        }

        Reader child(int length) { return new Reader(bytes, position, length); }

        void skipBytes(int length) {
            if (length < 0 || length > end - position) throw new ParseException("truncated field");
            position += length;
        }

        void skipField(int wire) {
            if (wire == 0) readVarint();
            else if (wire == 1) skipBytes(8);
            else if (wire == 2) skipBytes(readLength());
            else if (wire == 5) skipBytes(4);
            else throw new ParseException("unsupported wire type " + wire);
        }
    }
}
