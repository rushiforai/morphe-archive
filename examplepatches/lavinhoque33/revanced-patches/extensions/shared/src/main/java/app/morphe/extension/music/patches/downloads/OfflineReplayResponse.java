/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.WireFormat;

import java.io.IOException;

/**
 * Turns a stored (trimmed) player response into one the app accepts as an offline response. Works on the encoded
 * fields, so every field it does not touch, known or not, survives byte for byte.
 *
 * <p>Three changes: the offline marker (field 14, holding the playability action OK) is added unless the response
 * has it, which makes the app treat the response as an offline one; the streaming data expiry is set to a fresh
 * value, so the app does not discard the response as expired; the ad placements are dropped.
 */
final class OfflineReplayResponse {
    /** Player response fields: 4 streaming data, 7 ad placements, 14 the offline marker. */
    static final int STREAMING_DATA_FIELD = 4;
    static final int AD_PLACEMENTS_FIELD = 7;
    static final int OFFLINE_MARKER_FIELD = 14;
    /** Streaming data field 1: the seconds the response stays valid. */
    static final int EXPIRES_IN_SECONDS_FIELD = 1;

    /** The encoded marker: field 14 holding a message whose field 5 (the action) is 1, OK. */
    static final byte[] OFFLINE_MARKER = {0x72, 0x02, 0x28, 0x01};

    /** Valid for as long as a stock streaming response is, the value the store already writes. */
    static final long EXPIRES_SECONDS = OfflineResponseTrim.DEFAULT_EXPIRES_SECONDS;

    private OfflineReplayResponse() {}

    /** The bytes of {@code stored} ready for the app's parser. Throws {@link IllegalArgumentException} if malformed. */
    static byte[] prepare(byte[] stored) {
        try {
            return rewrite(stored);
        } catch (IOException ex) {
            throw new IllegalArgumentException("stored response is not a valid message", ex);
        }
    }

    private static byte[] rewrite(byte[] stored) throws IOException {
        ProtoWriter response = new ProtoWriter();
        boolean hasMarker = false;

        CodedInputStream input = CodedInputStream.newInstance(stored);
        while (true) {
            int start = input.getTotalBytesRead();
            int tag = input.readTag();
            if (tag == 0) break;

            int field = WireFormat.getTagFieldNumber(tag);
            boolean delimited = WireFormat.getTagWireType(tag) == WireFormat.WIRETYPE_LENGTH_DELIMITED;
            if (field == STREAMING_DATA_FIELD && delimited) {
                response.message(STREAMING_DATA_FIELD, withFreshExpiry(input.readByteArray()));
                continue;
            }
            if (!input.skipField(tag)) break;
            if (field == AD_PLACEMENTS_FIELD) continue;

            if (field == OFFLINE_MARKER_FIELD) hasMarker = true;
            response.raw(stored, start, input.getTotalBytesRead() - start);
        }
        if (!hasMarker) response.raw(OFFLINE_MARKER, 0, OFFLINE_MARKER.length);
        return response.toByteArray();
    }

    /** The streaming data with its expiry replaced; its other fields are copied as they are. */
    private static byte[] withFreshExpiry(byte[] streamingData) throws IOException {
        ProtoWriter fresh = new ProtoWriter().int64(EXPIRES_IN_SECONDS_FIELD, EXPIRES_SECONDS);

        CodedInputStream input = CodedInputStream.newInstance(streamingData);
        while (true) {
            int start = input.getTotalBytesRead();
            int tag = input.readTag();
            if (tag == 0) break;
            if (!input.skipField(tag)) break;
            if (WireFormat.getTagFieldNumber(tag) == EXPIRES_IN_SECONDS_FIELD) continue;

            fresh.raw(streamingData, start, input.getTotalBytesRead() - start);
        }
        return fresh.toByteArray();
    }
}
