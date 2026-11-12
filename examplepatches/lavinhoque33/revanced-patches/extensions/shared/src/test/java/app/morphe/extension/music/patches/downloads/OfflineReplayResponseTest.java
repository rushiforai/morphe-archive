/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

import java.util.Arrays;
import java.util.List;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.StreamingData;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.VideoDetails;

public class OfflineReplayResponseTest {
    private static final byte[] MARKER = {0x72, 0x02, 0x28, 0x01};
    private static final byte[] TRACKING = {10, 3, 'u', 'r', 'l'};

    private static byte[] streamingData(long expires) {
        return StreamingData.newBuilder().setExpiresInSeconds(expires)
                .addAdaptiveFormats(Format.newBuilder().setItag(251).setMimeType("audio/webm").setContentLength(5000))
                .build().toByteArray();
    }

    /** A stored response: details, streaming data with expiry, ad placements, tracking and an unknown field. */
    private static byte[] stored(long expires) {
        byte[] details = VideoDetails.newBuilder().setVideoId("abcdefghijk").setTitle("Song").build().toByteArray();
        return new ProtoWriter()
                .message(11, details)
                .message(4, streamingData(expires))
                .message(7, new byte[]{1, 2, 3})
                .message(9, TRACKING)
                .int64(777, 42)
                .toByteArray();
    }

    private static boolean endsWith(byte[] bytes, byte[] suffix) {
        return bytes.length >= suffix.length
                && Arrays.equals(Arrays.copyOfRange(bytes, bytes.length - suffix.length, bytes.length), suffix);
    }

    @Test public void theMarkerIsAppendedAsFieldFourteenWithActionOk() throws Exception {
        byte[] prepared = OfflineReplayResponse.prepare(stored(100));

        assertTrue(endsWith(prepared, MARKER));
        byte[] marker = ProtoFields.one(prepared, 14);
        assertEquals(List.of(5), ProtoFields.numbers(marker));
        assertEquals(1, ProtoFields.varint(marker, 5));
    }

    @Test public void anExistingMarkerIsNotDoubled() throws Exception {
        byte[] original = stored(100);
        byte[] withMarker = new ProtoWriter()
                .raw(MARKER, 0, MARKER.length)
                .raw(original, 0, original.length)
                .toByteArray();

        byte[] prepared = OfflineReplayResponse.prepare(withMarker);

        assertEquals(1, ProtoFields.all(prepared, 14).size());
        assertEquals(List.of(14, 11, 4, 9, 777), ProtoFields.numbers(prepared));
    }

    @Test public void preparingTwiceChangesNothingTheSecondTime() {
        byte[] once = OfflineReplayResponse.prepare(stored(100));

        assertArrayEquals(once, OfflineReplayResponse.prepare(once));
    }

    @Test public void theExpiryIsReplacedByTheFreshValue() throws Exception {
        byte[] streaming = ProtoFields.one(OfflineReplayResponse.prepare(stored(100)), 4);

        assertEquals(OfflineResponseTrim.DEFAULT_EXPIRES_SECONDS, ProtoFields.varint(streaming, 1));
        assertEquals(1, ProtoFields.all(streaming, 3).size());
    }

    @Test public void anExpiredStoredExpiryBecomesFresh() throws Exception {
        byte[] streaming = ProtoFields.one(OfflineReplayResponse.prepare(stored(0)), 4);

        assertEquals(21_540, ProtoFields.varint(streaming, 1));
    }

    @Test public void aResponseWithoutAnExpiryGetsOne() throws Exception {
        byte[] data = StreamingData.newBuilder().addAdaptiveFormats(Format.newBuilder().setItag(251)).build()
                .toByteArray();
        byte[] bare = new ProtoWriter().message(4, data).toByteArray();

        byte[] streaming = ProtoFields.one(OfflineReplayResponse.prepare(bare), 4);

        assertEquals(21_540, ProtoFields.varint(streaming, 1));
        assertEquals(1, ProtoFields.all(streaming, 3).size());
    }

    @Test public void theStreamingDataFormatsSurviveByteForByte() throws Exception {
        byte[] original = ProtoFields.all(ProtoFields.one(stored(100), 4), 3).get(0);

        byte[] prepared = OfflineReplayResponse.prepare(stored(100));

        assertArrayEquals(original, ProtoFields.all(ProtoFields.one(prepared, 4), 3).get(0));
    }

    @Test public void unknownStreamingFieldsSurvive() throws Exception {
        byte[] streaming = new ProtoWriter()
                .int64(1, 5)
                .string(15, "https://sabr")
                .int32(99, 7)
                .toByteArray();
        byte[] response = new ProtoWriter().message(4, streaming).toByteArray();

        byte[] kept = ProtoFields.one(OfflineReplayResponse.prepare(response), 4);

        assertEquals("https://sabr", ProtoFields.string(kept, 15));
        assertEquals(7, ProtoFields.varint(kept, 99));
        assertEquals(21_540, ProtoFields.varint(kept, 1));
    }

    @Test public void adPlacementsAreDropped() throws Exception {
        byte[] prepared = OfflineReplayResponse.prepare(stored(100));

        assertFalse(ProtoFields.has(prepared, 7));
    }

    @Test public void everyOtherFieldIsKept() throws Exception {
        byte[] prepared = OfflineReplayResponse.prepare(stored(100));

        assertArrayEquals(TRACKING, ProtoFields.one(prepared, 9));
        assertEquals(42, ProtoFields.varint(prepared, 777));
        assertEquals("Song", ProtoFields.string(ProtoFields.one(prepared, 11), 15));
    }

    @Test public void theFieldsKeepTheirOrderAndTheMarkerComesLast() throws Exception {
        byte[] prepared = OfflineReplayResponse.prepare(stored(100));

        assertEquals(List.of(11, 4, 9, 777, 14), ProtoFields.numbers(prepared));
    }

    @Test public void theAppsParserStillReadsTheResult() throws Exception {
        PlayerResponse response = PlayerResponse.parseFrom(OfflineReplayResponse.prepare(stored(100)));

        assertEquals(21_540, response.getStreamingData().getExpiresInSeconds());
        assertEquals(251, response.getStreamingData().getAdaptiveFormats(0).getItag());
        assertEquals("abcdefghijk", response.getVideoDetails().getVideoId());
    }

    @Test public void aResponseWithoutStreamingDataOnlyGainsTheMarker() throws Exception {
        byte[] bare = new ProtoWriter().int64(777, 1).toByteArray();

        assertEquals(List.of(777, 14), ProtoFields.numbers(OfflineReplayResponse.prepare(bare)));
    }

    @Test public void anEmptyResponseBecomesJustTheMarker() {
        assertArrayEquals(MARKER, OfflineReplayResponse.prepare(new byte[0]));
    }

    @Test(expected = IllegalArgumentException.class)
    public void aTruncatedResponseIsRejected() {
        OfflineReplayResponse.prepare(new byte[]{0x22, 0x09, 1, 2});
    }
}
