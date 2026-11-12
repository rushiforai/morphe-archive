/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import com.google.protobuf.CodedOutputStream;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Base64;
import java.util.Collections;

public class HeaderPlaylistIdTest {
    private static byte[] entityKey(String id, int type) throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        CodedOutputStream key = CodedOutputStream.newInstance(bytes);
        key.writeString(2, id);
        key.writeInt32(4, type);
        key.flush();
        return bytes.toByteArray();
    }

    private static byte[] encodedKey(String id, int type) throws Exception {
        String text = Base64.getUrlEncoder().encodeToString(entityKey(id, type));
        return text.getBytes(StandardCharsets.US_ASCII);
    }

    private static byte[] message(Object... fields) throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        CodedOutputStream output = CodedOutputStream.newInstance(bytes);
        for (int index = 0; index < fields.length; index += 2) {
            output.writeByteArray((Integer) fields[index], (byte[]) fields[index + 1]);
        }
        output.flush();
        return bytes.toByteArray();
    }

    @Test public void readsAPlaylistKey() throws Exception {
        assertEquals("PLabcdef123456", HeaderPlaylistId.playlistFromKey(encodedKey("PLabcdef123456", 24)));
    }

    @Test public void readsAnAlbumKeyWithItsOlakPlaylistId() throws Exception {
        assertEquals("OLAK5uy_nExample", HeaderPlaylistId.playlistFromKey(encodedKey("OLAK5uy_nExample", 17)));
    }

    @Test public void readsAKeyWhosePaddingIsPercentEncoded() throws Exception {
        String padded = Base64.getUrlEncoder().encodeToString(entityKey("PLpadded1", 24)).replace("=", "%3D");

        assertEquals("PLpadded1", HeaderPlaylistId.playlistFromKey(padded.getBytes(StandardCharsets.US_ASCII)));
    }

    @Test public void otherEntitiesAndOrdinaryStringsAreNotPlaylists() throws Exception {
        assertNull(HeaderPlaylistId.playlistFromKey(encodedKey("dQw4w9WgXcQ", 0xea)));
        assertNull(HeaderPlaylistId.playlistFromKey("Whenever You Need Somebody".getBytes(StandardCharsets.UTF_8)));
        assertNull(HeaderPlaylistId.playlistFromKey("short".getBytes(StandardCharsets.UTF_8)));
        assertNull(HeaderPlaylistId.playlistFromKey("notbase64notbase64!!".getBytes(StandardCharsets.UTF_8)));
    }

    @Test public void findsTheKeyDeepInsideTheHeaderModel() throws Exception {
        byte[] button = message(1, "Download".getBytes(StandardCharsets.UTF_8), 2, encodedKey("PLdeep", 24));
        byte[] header = message(3, message(1, message(7, button)), 4, "title text".getBytes(StandardCharsets.UTF_8));

        assertEquals(Collections.singletonList("PLdeep"), HeaderPlaylistId.findAll(header));
    }

    @Test public void listsEveryDistinctPlaylistTheHeaderNames() throws Exception {
        byte[] header = message(1, encodedKey("OLAK5uy_one", 17), 2, message(1, encodedKey("PLtwo", 24)),
                3, encodedKey("OLAK5uy_one", 17), 4, encodedKey("MPREb_release", 99));

        assertEquals(Arrays.asList("OLAK5uy_one", "PLtwo"), HeaderPlaylistId.findAll(header));
    }

    @Test public void aHeaderWithoutAKeyNamesNoPlaylist() throws Exception {
        assertTrue(HeaderPlaylistId.findAll(message(1, "just text".getBytes(StandardCharsets.UTF_8))).isEmpty());
        assertTrue(HeaderPlaylistId.findAll(new byte[0]).isEmpty());
    }
}
