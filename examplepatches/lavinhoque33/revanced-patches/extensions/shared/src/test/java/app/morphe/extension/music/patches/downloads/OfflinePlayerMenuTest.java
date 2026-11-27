/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-26.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.WireFormat;

import org.junit.Test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class OfflinePlayerMenuTest {
    private static final String SONG = "AbcDefg_Hij";
    private static final String VIDEO = "OtherVid-01";
    private static final OfflinePlayerMenu.Labels LABELS = new OfflinePlayerMenu.Labels(
            "Play next", "Add to queue", "Share", "Remove download");

    @Test
    public void eachOccurrenceTargetsItsOwnNativeQueueAndShareActions() throws IOException {
        assertNativeActions(SONG, "Saved song");
        assertNativeActions(VIDEO, "Saved video");
    }

    private static void assertNativeActions(String videoId, String title) throws IOException {
        List<byte[]> items = items(OfflinePlayerMenu.encode(videoId, title, SONG, true, LABELS));
        assertEquals(4, items.size());
        assertQueue(items.get(0), videoId, 1);
        assertQueue(items.get(1), videoId, 2);
        assertShare(items.get(2), videoId, title);
        assertEquals(SONG, OfflinePlayerMenu.removalFromCommand(command(items.get(3), 66_441_155)));
    }

    @Test
    public void unavailableQueueOmitsBothQueueCommandsButStillSharesAndRemoves() throws IOException {
        List<byte[]> items = items(OfflinePlayerMenu.encode(VIDEO, "Saved video", SONG, false, LABELS));
        assertEquals(2, items.size());
        assertShare(items.get(0), VIDEO, "Saved video");
        assertEquals(SONG, OfflinePlayerMenu.removalFromCommand(command(items.get(1), 66_441_155)));
    }

    @Test
    public void removalDispatcherIgnoresOrdinaryDownloadAndNestedUpsell() throws IOException {
        byte[] download = new ProtoWriter().string(4, SONG).toByteArray();
        byte[] params = new ProtoWriter()
                .string(1, Base64.getUrlEncoder().withoutPadding().encodeToString(download)).toByteArray();
        assertNull(OfflinePlayerMenu.removalFromCommand(new ProtoWriter().message(133_724_106, params).toByteArray()));

        List<byte[]> items = items(OfflinePlayerMenu.encode(VIDEO, "Saved video", SONG, false, LABELS));
        byte[] marked = command(items.get(1), 66_441_155);
        assertNull(OfflinePlayerMenu.removalFromCommand(new ProtoWriter().message(204_158_123, marked).toByteArray()));
        assertNull(OfflinePlayerMenu.removalFromCommand(command(items.get(0), 66_441_108)));
    }

    @Test
    public void insertedQueueRowKeepsRawRendererAndDoesNotClaimPositionOrSelection() throws IOException {
        var item = new OfflineWatchNext.Item(VIDEO, "Saved video", "Artist", "Album", 42_000, null,
                CommandRewrite.TYPE_OMV);
        byte[] endpoint = OfflineWatchCommand.build(VIDEO, "offline-test", 3, CommandRewrite.TYPE_OMV);
        byte[] menu = OfflinePlayerMenu.encode(VIDEO, item.title(), SONG, true, LABELS);
        byte[] row = OfflineWatchNext.queueRow(item, endpoint, menu);
        CodedInputStream raw = CodedInputStream.newInstance(row);
        while (!raw.isAtEnd()) {
            int tag = raw.readTag();
            int number = WireFormat.getTagFieldNumber(tag);
            assertTrue("Unexpected renderer wrapper, position or selection: " + number,
                    number != 51_779_701 && number != 5 && number != 6);
            assertTrue(raw.skipField(tag));
        }

        assertArrayEquals(endpoint, field(row, 7));
        assertArrayEquals(menu, field(field(row, 20), 66_439_850));
        assertNull(field(OfflineWatchNext.queueRow(item, endpoint, null), 20));
    }

    private static List<byte[]> items(byte[] menu) throws IOException {
        List<byte[]> items = new ArrayList<>();
        CodedInputStream input = CodedInputStream.newInstance(menu);
        while (!input.isAtEnd()) {
            assertEquals(10, input.readTag());
            items.add(input.readByteArray());
        }
        return items;
    }

    private static void assertQueue(byte[] item, String id, int position) throws IOException {
        byte[] command = command(item, 66_441_155);
        CodedInputStream raw = CodedInputStream.newInstance(command);
        int tag = raw.readTag();
        assertEquals(163_162_354 << 3 | 2, tag);
        assertTrue(raw.skipField(tag));
        assertTrue(raw.isAtEnd());

        OfflineQueueCommand parsed = OfflineQueueCommand.parse(command);
        assertNotNull(parsed);
        assertEquals(id, parsed.videoId());
        assertEquals(position, parsed.position());
        assertNull(parsed.watch());
        assertTrue(parsed.playerOnly());
    }

    private static void assertShare(byte[] item, String id, String title) throws IOException {
        CodedInputStream share = payload(item, 66_441_108, 73_844_178);
        assertEquals(10, share.readTag());
        assertEquals(id, share.readStringRequireUtf8());
        assertEquals(18, share.readTag());
        assertEquals("https://music.youtube.com/watch?v=" + id + "&feature=share", share.readStringRequireUtf8());
        assertEquals(26, share.readTag());
        assertEquals(title, share.readStringRequireUtf8());
        assertTrue(share.isAtEnd());
    }

    private static CodedInputStream payload(byte[] item, int renderer, int endpoint) throws IOException {
        CodedInputStream command = CodedInputStream.newInstance(command(item, renderer));
        assertEquals(endpoint << 3 | 2, command.readTag());
        byte[] payload = command.readByteArray();
        assertTrue(command.isAtEnd());
        return CodedInputStream.newInstance(payload);
    }

    private static byte[] command(byte[] item, int renderer) throws IOException {
        CodedInputStream wrapper = CodedInputStream.newInstance(item);
        assertEquals(renderer << 3 | 2, wrapper.readTag());
        byte[] command = field(wrapper.readByteArray(), 3);
        assertTrue(wrapper.isAtEnd());
        assertNotNull(command);
        return command;
    }

    private static byte[] field(byte[] message, int field) throws IOException {
        assertNotNull(message);
        CodedInputStream input = CodedInputStream.newInstance(message);
        while (!input.isAtEnd()) {
            int tag = input.readTag();
            if (tag == (field << 3 | 2)) return input.readByteArray();
            if (!input.skipField(tag)) break;
        }
        return null;
    }
}
