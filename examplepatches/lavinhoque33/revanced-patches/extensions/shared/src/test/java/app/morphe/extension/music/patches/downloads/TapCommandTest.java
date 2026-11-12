/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

public class TapCommandTest {
    private static void varint(ByteArrayOutputStream out, long value) {
        while ((value & ~0x7FL) != 0) {
            out.write((int) ((value & 0x7F) | 0x80));
            value >>>= 7;
        }
        out.write((int) value);
    }

    private static void text(ByteArrayOutputStream out, int field, String value) {
        varint(out, ((long) field << 3) | 2);
        varint(out, value.length());
        out.writeBytes(value.getBytes(StandardCharsets.ISO_8859_1));
    }

    private static void number(ByteArrayOutputStream out, int field, long value) {
        varint(out, (long) field << 3);
        varint(out, value);
    }

    private static void message(ByteArrayOutputStream out, int field, byte[] payload) {
        varint(out, ((long) field << 3) | 2);
        varint(out, payload.length);
        out.writeBytes(payload);
    }

    private static byte[] watch(String video, String playlist, Integer index, String params) {
        ByteArrayOutputStream watch = new ByteArrayOutputStream();
        text(watch, 1, video);
        if (playlist != null) text(watch, 2, playlist);
        if (index != null) number(watch, 3, index);
        if (params != null) text(watch, 5, params);
        text(watch, 13, "setVideoId123");
        return watch.toByteArray();
    }

    private static byte[] command(byte[] watch) {
        ByteArrayOutputStream command = new ByteArrayOutputStream();
        text(command, 1, "tracking");
        message(command, TapCommand.WATCH_ENDPOINT_FIELD, watch);
        return command.toByteArray();
    }

    @Test public void readsTheWatchEndpointOfAnAlbumRow() {
        TapCommand tap = TapCommand.parse(command(watch("dQw4w9WgXcQ", "OLAK5uy_albumAlbumAlbumAlbum", 4, null)));
        assertTrue(tap.isWatch());
        assertEquals("dQw4w9WgXcQ", tap.videoId);
        assertEquals("OLAK5uy_albumAlbumAlbumAlbum", tap.playlistId);
        assertEquals(4, tap.index);
        assertFalse(tap.hasParams);
        assertEquals(List.of("dQw4w9WgXcQ"), tap.ids);
        assertTrue(tap.fields(), tap.fields().contains("watch=[1:s11,2:s28,3:v4"));
    }

    @Test public void anAbsentIndexIsMinusOneAndParamsAreSeen() {
        TapCommand tap = TapCommand.parse(command(watch("dQw4w9WgXcQ", "PLxxxxxxxxxxxx", null, "wAEB")));
        assertEquals(-1, tap.index);
        assertTrue(tap.hasParams);
    }

    @Test public void findsTheWatchEndpointInsideAWrappingCommand() {
        ByteArrayOutputStream wrapper = new ByteArrayOutputStream();
        text(wrapper, 1, "anything here");
        message(wrapper, 7, command(watch("lYBUbBu4W08", "OLAK5uy_albumAlbumAlbumAlbum", 0, null)));
        TapCommand tap = TapCommand.parse(wrapper.toByteArray());
        assertTrue(tap.isWatch());
        assertEquals("lYBUbBu4W08", tap.videoId);
        assertEquals(0, tap.index);
    }

    @Test public void aCommandWithoutAWatchEndpointKeepsItsIds() {
        ByteArrayOutputStream other = new ByteArrayOutputStream();
        text(other, 3, "lYBUbBu4W08");
        TapCommand tap = TapCommand.parse(other.toByteArray());
        assertFalse(tap.isWatch());
        assertEquals(List.of("lYBUbBu4W08"), tap.ids);
    }

    @Test public void aLikeOrAnAddToQueueThatNamesASongIsNotAPlayback() {
        // The commands of a like, an add to the queue and a share carry the song's id and no watch endpoint: the
        // start of a playback must not be armed (and the user's video mode not changed) by any of them.
        ByteArrayOutputStream like = new ByteArrayOutputStream();
        ByteArrayOutputStream target = new ByteArrayOutputStream();
        text(target, 1, "lYBUbBu4W08");
        message(like, 5000, target.toByteArray());
        TapCommand tap = TapCommand.parse(like.toByteArray());

        assertFalse(tap.isWatch());
        assertEquals(List.of("lYBUbBu4W08"), tap.ids);
        // It does tie to a copy by its id, which is why only a watch command may arm.
        assertNotNull(AudioFirstLogic.chooseArm(true, tap.ids, null, tap.index, tap.hasParams, "lYBUbBu4W08"::equals));
    }

    @Test public void theFieldsAreSummarisedOnDemandOverTheRangeOfTheWatchEndpoint() {
        ByteArrayOutputStream wrapper = new ByteArrayOutputStream();
        text(wrapper, 1, "anything here");
        message(wrapper, 7, command(watch("lYBUbBu4W08", "OLAK5uy_albumAlbumAlbumAlbum", 2, null)));
        TapCommand tap = TapCommand.parse(wrapper.toByteArray());

        assertEquals(2, tap.index);
        assertTrue(tap.fields(), tap.fields().startsWith("[1:s13,7:s"));
        assertTrue(tap.fields(), tap.fields().contains("watch=[1:s11,2:s28,3:v2"));
    }

    @Test public void garbageNeverThrows() {
        TapCommand tap = TapCommand.parse(new byte[]{(byte) 0xFF, (byte) 0xFF, (byte) 0xFF});
        assertFalse(tap.isWatch());
        assertTrue(tap.ids.isEmpty());
        assertFalse(TapCommand.parse(new byte[0]).isWatch());
    }
}
