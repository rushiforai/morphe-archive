/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import static org.junit.Assert.*;

import com.google.protobuf.CodedOutputStream;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

public class SmartShuffleTriggerTest {
    private static final String PLAYLIST = "PL_source";

    private static byte[] field(int number, byte[] value) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        CodedOutputStream output = CodedOutputStream.newInstance(bytes);
        output.writeByteArray(number, value);
        output.flush();
        return bytes.toByteArray();
    }

    private static byte[] text(int number, String value) throws IOException {
        return field(number, value.getBytes(StandardCharsets.UTF_8));
    }

    private static byte[] join(byte[]... values) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        for (byte[] value : values) bytes.write(value);
        return bytes.toByteArray();
    }

    private static SmartShuffleTrigger.Start header() throws IOException {
        return SmartShuffleTrigger.command(field(SmartShuffleTrigger.WATCH_PLAYLIST,
                join(text(1, PLAYLIST), text(4, "opaque-native-shuffle-params"))));
    }

    private static SmartShuffleTrigger.Start song() throws IOException {
        return SmartShuffleTrigger.command(field(SmartShuffleTrigger.WATCH,
                join(text(1, "sameVideo01"), text(2, PLAYLIST), text(9, "opaque-row-params"),
                        text(13, "playlist-occurrence"))));
    }

    @Test public void capturedWatchPlaylistStartsAreNotAssumedToBeWatchEndpoints() throws Exception {
        assertEquals(PLAYLIST, header().playlistId());
        assertEquals(SmartShuffleTrigger.Kind.PLAYLIST, header().kind());
        assertTrue(SmartShuffleTrigger.accepts(header(), PLAYLIST, true, false, true, true, true));
        assertFalse(SmartShuffleTrigger.accepts(header(), PLAYLIST, false, true, true, true, true));
    }

    @Test public void capturedSongStartUsesEntryIdEvenWithOpaqueFieldNineParams() throws Exception {
        assertEquals(SmartShuffleTrigger.Kind.SONG, song().kind());
        assertTrue(SmartShuffleTrigger.accepts(song(), PLAYLIST, false, true, true, true, true));
        SmartShuffleTrigger.Start noEntry = SmartShuffleTrigger.command(field(SmartShuffleTrigger.WATCH,
                join(text(1, "sameVideo01"), text(2, PLAYLIST))));
        assertNull(noEntry);
        assertFalse(SmartShuffleTrigger.accepts(noEntry, PLAYLIST, true, true, true, true, true));
    }

    @Test public void restoredQueuesQueueSkipsAndShuffleToggleDoNotActivate() throws Exception {
        assertFalse(SmartShuffleTrigger.accepts(header(), PLAYLIST, false, false, true, true, true));
        assertFalse(SmartShuffleTrigger.accepts(song(), PLAYLIST, false, false, true, true, true));
        assertFalse(SmartShuffleTrigger.accepts(song(), "PL_other", false, true, true, true, true));
        assertFalse(SmartShuffleTrigger.accepts(header(), PLAYLIST, true, false, false, true, true));
        assertFalse(SmartShuffleTrigger.accepts(header(), PLAYLIST, true, false, true, false, true));
        assertNull(SmartShuffleTrigger.command(field(445684868, text(1, "native-toggle-entity"))));
    }

    @Test public void resolvedRimPlayUsesVisibleHeaderContextWithoutButtonHitGeometry() throws Exception {
        SmartShuffleTrigger.Start resolved = header();
        assertEquals(SmartShuffleTrigger.Kind.PLAYLIST, resolved.kind());
        assertTrue(SmartShuffleTrigger.accepts(resolved, PLAYLIST, true, false, true, true, true));
        assertFalse(SmartShuffleTrigger.accepts(resolved, "PL_other", true, false, true, true, true));
    }

    @Test public void restoredPlaylistRequiresBothVisibleHeaderAndRecentUserCommand() throws Exception {
        assertFalse(SmartShuffleTrigger.accepts(header(), PLAYLIST, true, false, true, true, false));
        assertFalse(SmartShuffleTrigger.accepts(header(), PLAYLIST, false, false, true, true, true));
        assertFalse(SmartShuffleTrigger.accepts(song(), PLAYLIST, false, true, true, true, false));
    }

    @Test public void genericQueueWatchCannotMasqueradeAsHeaderPlayEvenInItsVisibleContext() throws Exception {
        SmartShuffleTrigger.Start skip = SmartShuffleTrigger.command(field(SmartShuffleTrigger.WATCH,
                join(text(1, "sameVideo01"), text(2, PLAYLIST))));
        assertNull(skip);
        assertFalse(SmartShuffleTrigger.accepts(skip, PLAYLIST, true, true, true, true, true));
    }

    @Test public void wrappedPlayNextAndRadioCannotActivateEvenWithFreshHeaderProvenance() throws Exception {
        SmartShuffleTrigger.Start playNext = SmartShuffleTrigger.command(field(163162354,
                field(SmartShuffleTrigger.WATCH_PLAYLIST, text(1, PLAYLIST))));
        SmartShuffleTrigger.Start radio = SmartShuffleTrigger.command(field(SmartShuffleTrigger.WATCH_PLAYLIST,
                text(1, "RDAMPL_source")));
        assertFalse(SmartShuffleTrigger.accepts(playNext, PLAYLIST, true, true, true, true, true));
        assertFalse(SmartShuffleTrigger.accepts(radio, PLAYLIST, true, true, true, true, true));
    }

    @Test public void radioMixAndPlayNextAreNotPlaylistStarts() throws Exception {
        assertNull(SmartShuffleTrigger.command(field(SmartShuffleTrigger.WATCH_PLAYLIST,
                text(1, "RDAMPL_source"))));
        assertNull(SmartShuffleTrigger.command(field(SmartShuffleTrigger.WATCH,
                join(text(1, "video"), text(2, "RDAMVMvideo"), text(13, "entry")))));
        assertNull(SmartShuffleTrigger.command(field(163162354, text(1, "native-queue-add"))));
        assertNull(SmartShuffleTrigger.command(new byte[]{(byte) 0xFF}));
    }

    @Test public void headerScopeAndLabelsComeFromNativeModelNotEnglishText() throws Exception {
        byte[] off = join(text(2, "yt_outline_experimental_shuffle_vd_theme_24"), text(5, "Mélange désactivé"));
        byte[] on = join(text(2, "yt_outline_experimental_shuffle_vd_theme_24"), text(5, "Mélange activé"));
        byte[] toggle = field(479644279, join(field(1, field(461054335, off)),
                field(2, field(461054335, on)), text(8,
                        "elevate_shuffle_toggle_button_entity_key_" + PLAYLIST)));
        byte[] header = field(1258, field(4, toggle));
        assertEquals(PLAYLIST, SmartShuffleTrigger.headerPlaylist(header));
        SmartShuffleTrigger.Labels labels = SmartShuffleTrigger.labels(header);
        assertEquals("Mélange désactivé", labels.shuffleOff());
        assertEquals("Mélange activé", labels.shuffleOn());
        assertNull(SmartShuffleTrigger.headerPlaylist(text(1, "PL_unrelated-string")));
        assertNull(SmartShuffleTrigger.headerPlaylist(text(8,
                "elevate_shuffle_toggle_button_entity_key_RDAMPL_source")));
    }
}
