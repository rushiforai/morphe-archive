package com.waze.gw;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Bounds-checked reader and segment/direction index for wme-context-alerts/v3. */
final class ContextAlertDatabase {
    static final int SCHEMA_VERSION = 3;
    static final int SPATIAL_ZOOM = 14;
    static final int FORWARD = 1;
    static final int REVERSE = 2;
    static final int RIGHT_OF_TRAVEL = 1;
    private static final int MAX_BUCKETS = 200_000;
    private static final int MAX_NOTICES = 200_000;
    private static final int MAX_AFFECTED_SEGMENTS = 64;
    private static final int MAX_AFFECTED_DISTANCE_M = 300;
    private static final int MAX_MATCH_DISTANCE_CM = 1500;

    final byte[] bytes;
    final String datasetVersion;
    final long generatedAtMs;
    private final Map<Long, Map<Integer, List<Notice>>> index;

    private ContextAlertDatabase(byte[] bytes, String datasetVersion, long generatedAtMs,
                                 Map<Long, Map<Integer, List<Notice>>> index) {
        this.bytes = bytes;
        this.datasetVersion = datasetVersion;
        this.generatedAtMs = generatedAtMs;
        this.index = index;
    }

    static ContextAlertDatabase parse(byte[] bytes) {
        if (bytes == null || bytes.length == 0) throw new ParseException("empty context database");
        Reader root = new Reader(bytes, 0, bytes.length);
        int schema = 0;
        int zoom = 0;
        String version = "";
        long generated = 0L;
        Map<Long, Map<Integer, List<Notice>>> index = new HashMap<Long, Map<Integer, List<Notice>>>();
        Set<Long> tiles = new HashSet<Long>();
        int bucketCount = 0;
        int noticeCount = 0;
        while (root.hasRemaining()) {
            int tag = root.readTag();
            int field = tag >>> 3;
            int wire = tag & 7;
            if (field == 1 && wire == 0) schema = root.readUInt32();
            else if (field == 2 && wire == 2) version = root.readString();
            else if (field == 3 && wire == 0) generated = root.readInt64();
            else if (field == 4 && wire == 0) zoom = root.readUInt32();
            else if (field == 5 && wire == 2) {
                if (++bucketCount > MAX_BUCKETS) throw new ParseException("too many context buckets");
                Bucket bucket = parseBucket(root.readBytes());
                long tileKey = tileKey(bucket.x, bucket.y);
                if (!tiles.add(tileKey)) throw new ParseException("duplicate context tile");
                for (Notice notice : bucket.notices) {
                    noticeCount++;
                    if (noticeCount > MAX_NOTICES) throw new ParseException("too many context notices");
                    add(index, notice.targetSegmentId, notice.targetDirection, notice);
                    for (AffectedSegment affected : notice.affectedSegments)
                        add(index, affected.segmentId, affected.direction, notice);
                }
            } else root.skipField(wire);
        }
        if (schema != SCHEMA_VERSION) throw new ParseException("unsupported context schema " + schema);
        if (zoom != SPATIAL_ZOOM) throw new ParseException("unsupported context zoom " + zoom);
        if (version.length() == 0 || generated <= 0) throw new ParseException("missing context metadata");
        Map<Long, Map<Integer, List<Notice>>> frozen = new HashMap<Long, Map<Integer, List<Notice>>>();
        for (Map.Entry<Long, Map<Integer, List<Notice>>> entry : index.entrySet()) {
            Map<Integer, List<Notice>> directions = new HashMap<Integer, List<Notice>>();
            for (Map.Entry<Integer, List<Notice>> direction : entry.getValue().entrySet())
                directions.put(direction.getKey(), Collections.unmodifiableList(direction.getValue()));
            frozen.put(entry.getKey(), Collections.unmodifiableMap(directions));
        }
        return new ContextAlertDatabase(bytes, version, generated,
                Collections.unmodifiableMap(frozen));
    }

    List<Notice> lookup(long segmentId, int direction) {
        if (segmentId <= 0 || !validDirection(direction)) return Collections.emptyList();
        Map<Integer, List<Notice>> directions = index.get(Long.valueOf(segmentId));
        List<Notice> notices = directions == null ? null : directions.get(Integer.valueOf(direction));
        return notices == null ? Collections.<Notice>emptyList() : notices;
    }

    private static void add(Map<Long, Map<Integer, List<Notice>>> index, long segmentId, int direction,
                            Notice notice) {
        if (segmentId <= 0 || !validDirection(direction)) return;
        Long key = Long.valueOf(segmentId);
        Map<Integer, List<Notice>> directions = index.get(key);
        if (directions == null) {
            directions = new HashMap<Integer, List<Notice>>();
            index.put(key, directions);
        }
        List<Notice> notices = directions.get(Integer.valueOf(direction));
        if (notices == null) {
            notices = new ArrayList<Notice>();
            directions.put(Integer.valueOf(direction), notices);
        }
        if (!notices.contains(notice)) notices.add(notice);
    }

    private static Bucket parseBucket(byte[] bytes) {
        Reader reader = new Reader(bytes, 0, bytes.length);
        int x = -1, y = -1;
        List<Notice> notices = new ArrayList<Notice>();
        while (reader.hasRemaining()) {
            int tag = reader.readTag();
            int field = tag >>> 3;
            int wire = tag & 7;
            if (field == 1 && wire == 0) x = reader.readUInt32();
            else if (field == 2 && wire == 0) y = reader.readUInt32();
            else if (field == 3 && wire == 2) notices.add(parseNotice(reader.readBytes()));
            else reader.skipField(wire);
        }
        if (x < 0 || y < 0 || x >= (1 << SPATIAL_ZOOM) || y >= (1 << SPATIAL_ZOOM))
            throw new ParseException("invalid context tile");
        return new Bucket(x, y, notices);
    }

    private static Notice parseNotice(byte[] bytes) {
        Reader reader = new Reader(bytes, 0, bytes.length);
        String id = "";
        int type = 0, longitudeE6 = 0, latitudeE6 = 0, trigger = 0, sideRule = 0;
        long targetSegment = 0L;
        int targetDirection = 0, affectedDistance = 0, confidence = 0, matchDistance = 0;
        int projection = 0, stopReason = 0;
        Integer valueKmh = null;
        List<AffectedSegment> affected = new ArrayList<AffectedSegment>();
        while (reader.hasRemaining()) {
            int tag = reader.readTag();
            int field = tag >>> 3;
            int wire = tag & 7;
            if (field == 1 && wire == 2) id = reader.readString();
            else if (field == 2 && wire == 0) type = reader.readUInt32();
            else if (field == 3 && wire == 0) longitudeE6 = reader.readSint32();
            else if (field == 4 && wire == 0) latitudeE6 = reader.readSint32();
            else if (field == 6 && wire == 0) trigger = reader.readUInt32();
            else if (field == 7 && wire == 0) valueKmh = Integer.valueOf(reader.readUInt32());
            else if (field == 9 && wire == 0) sideRule = reader.readUInt32();
            else if (field == 10 && wire == 0) targetSegment = reader.readUInt64();
            else if (field == 11 && wire == 0) targetDirection = reader.readUInt32();
            else if (field == 12 && wire == 2) {
                if (affected.size() >= MAX_AFFECTED_SEGMENTS)
                    throw new ParseException("too many affected segments");
                affected.add(parseAffected(reader.readBytes()));
            } else if (field == 13 && wire == 0) affectedDistance = reader.readUInt32();
            else if (field == 14 && wire == 0) confidence = reader.readUInt32();
            else if (field == 15 && wire == 0) matchDistance = reader.readUInt32();
            else if (field == 16 && wire == 0) projection = reader.readUInt32();
            else if (field == 17 && wire == 0) stopReason = reader.readUInt32();
            else reader.skipField(wire);
        }
        if (id.length() == 0 || type <= 0 || trigger <= 0 || trigger > 1000
                || sideRule != RIGHT_OF_TRAVEL || targetSegment <= 0
                || !validDirection(targetDirection) || affectedDistance > MAX_AFFECTED_DISTANCE_M
                || confidence < 0 || confidence > 2 || matchDistance > MAX_MATCH_DISTANCE_CM
                || projection > 1000 || stopReason == 3 || stopReason < 0 || stopReason > 8)
            throw new ParseException("invalid context notice");
        return new Notice(id, type, longitudeE6, latitudeE6, trigger, valueKmh, sideRule,
                targetSegment, targetDirection, affected, affectedDistance, confidence,
                matchDistance, projection, stopReason);
    }

    private static AffectedSegment parseAffected(byte[] bytes) {
        Reader reader = new Reader(bytes, 0, bytes.length);
        long segment = 0L;
        int direction = 0, distance = 0;
        while (reader.hasRemaining()) {
            int tag = reader.readTag();
            int field = tag >>> 3;
            int wire = tag & 7;
            if (field == 1 && wire == 0) segment = reader.readUInt64();
            else if (field == 2 && wire == 0) direction = reader.readUInt32();
            else if (field == 3 && wire == 0) distance = reader.readUInt32();
            else reader.skipField(wire);
        }
        if (segment <= 0 || !validDirection(direction) || distance > MAX_AFFECTED_DISTANCE_M)
            throw new ParseException("invalid affected segment");
        return new AffectedSegment(segment, direction, distance);
    }

    private static boolean validDirection(int value) { return value == FORWARD || value == REVERSE; }
    private static long tileKey(int x, int y) { return ((long) x << 32) | (y & 0xffffffffL); }

    static final class Notice {
        final String sourceCommentId;
        final int type, longitudeE6, latitudeE6, triggerDistanceM, sideRule;
        final Integer valueKmh;
        final long targetSegmentId;
        final int targetDirection, affectedZoneDistanceM, matchConfidence;
        final int matchDistanceCm, projectionRatioMilli, traceStopReason;
        final List<AffectedSegment> affectedSegments;
        Notice(String id, int type, int lon, int lat, int trigger, Integer value, int side,
               long target, int direction, List<AffectedSegment> affected, int zone, int confidence,
               int matchDistance, int projection, int stop) {
            sourceCommentId = id; this.type = type; longitudeE6 = lon; latitudeE6 = lat;
            triggerDistanceM = trigger; valueKmh = value; sideRule = side; targetSegmentId = target;
            targetDirection = direction; affectedSegments = Collections.unmodifiableList(affected);
            affectedZoneDistanceM = zone; matchConfidence = confidence; matchDistanceCm = matchDistance;
            projectionRatioMilli = projection; traceStopReason = stop;
        }
    }
    static final class AffectedSegment {
        final long segmentId; final int direction; final int distanceFromTargetM;
        AffectedSegment(long id, int direction, int distance) {
            segmentId = id; this.direction = direction; distanceFromTargetM = distance;
        }
    }
    private static final class Bucket {
        final int x, y; final List<Notice> notices;
        Bucket(int x, int y, List<Notice> notices) { this.x = x; this.y = y; this.notices = notices; }
    }

    static final class ParseException extends IllegalArgumentException {
        ParseException(String message) { super(message); }
    }

    private static final class Reader {
        final byte[] data; final int end; int position;
        Reader(byte[] data, int offset, int length) {
            if (data == null || offset < 0 || length < 0 || offset > data.length - length)
                throw new ParseException("invalid bounds");
            this.data = data; position = offset; end = offset + length;
        }
        boolean hasRemaining() { return position < end; }
        int readTag() { long tag = readVarint(); if (tag <= 0 || tag > Integer.MAX_VALUE) throw new ParseException("bad tag"); return (int) tag; }
        int readUInt32() { long value = readVarint(); if (value < 0 || value > 0xffffffffL) throw new ParseException("uint32 overflow"); return (int) value; }
        long readUInt64() { return readVarint(); }
        long readInt64() { return readVarint(); }
        int readSint32() { long value = readVarint(); return (int) ((value >>> 1) ^ -(value & 1)); }
        long readVarint() {
            long value = 0L;
            for (int shift = 0; shift < 64; shift += 7) {
                if (position >= end) throw new ParseException("truncated varint");
                int next = data[position++] & 0xff;
                if (shift == 63 && (next & 0x7e) != 0) throw new ParseException("varint overflow");
                value |= (long) (next & 0x7f) << shift;
                if ((next & 0x80) == 0) return value;
            }
            throw new ParseException("varint overflow");
        }
        String readString() { return new String(readBytes(), StandardCharsets.UTF_8); }
        byte[] readBytes() {
            long length = readVarint();
            if (length < 0 || length > Integer.MAX_VALUE || length > end - position) throw new ParseException("bad length");
            byte[] result = new byte[(int) length]; System.arraycopy(data, position, result, 0, result.length); position += result.length; return result;
        }
        void skipField(int wire) {
            if (wire == 0) readVarint(); else if (wire == 1) skip(8); else if (wire == 2) { long n = readVarint(); if (n > Integer.MAX_VALUE) throw new ParseException("bad length"); skip((int) n); } else if (wire == 5) skip(4); else throw new ParseException("unsupported wire type");
        }
        void skip(int count) { if (count < 0 || count > end - position) throw new ParseException("truncated field"); position += count; }
    }
}
