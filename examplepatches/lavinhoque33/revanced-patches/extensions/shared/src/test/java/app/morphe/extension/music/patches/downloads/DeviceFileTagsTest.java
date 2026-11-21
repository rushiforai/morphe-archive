/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertThrows;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HexFormat;
import java.util.List;

public class DeviceFileTagsTest {
    private static final String ALBUM_PAGE = "MPREb_original";
    private static final String ALBUM = "OLAK5uy_original";
    private static final String FIRST = "First000001";
    private static final String THIRD = "Third000003";

    // An empty MP4 moov and a WebM Opus track with one 20 ms Opus silence packet. The tests examine the real
    // output of the repackager, without a codec, network, Android storage, or dependence on the Ogg serial number.
    private static final byte[] MP4 = HexFormat.of().parseHex("000000086d6f6f76");
    private static final byte[] WEBM = HexFormat.of().parseHex("1a45dfa38018538067ff1654ae6ba3aea1d78101"
            + "8686415f4f50555363a2934f707573486561640102000080bb0000000000"
            + "1f43b67589a38781000080f8fffe");

    @Rule public final TemporaryFolder temporary = new TemporaryFolder();

    @Test
    public void unverifiedTrackHasNoNumberOrTotalInEitherContainer() throws Exception {
        AlbumFileTracks tracks = new AlbumFileTracks((id, token) -> {
            throw new AssertionError("An ordinary queue is not an album: " + id);
        });
        AlbumFileTracks.Position position = tracks.resolve(THIRD, watch(THIRD, "PLonlyAPlaylist", "UCnotAnAlbum"));
        assertNull(position);
        assertTags(position, 0, 0);
    }

    @Test
    public void unavailableMiddleTrackDoesNotRenumberLaterTrack() throws Exception {
        List<String> requests = new ArrayList<>();
        AlbumFileTracks tracks = new AlbumFileTracks((id, token) -> {
            requests.add(id + ":" + token);
            if (ALBUM_PAGE.equals(id)) return albumPage();
            assertEquals("VL" + ALBUM, id);
            if (token == null) {
                return shelf(row(FIRST, ALBUM), new JSONObject("""
                        {"musicTwoColumnItemRenderer":{
                          "musicItemRendererDisplayPolicy":"MUSIC_ITEM_RENDERER_DISPLAY_POLICY_GREY_OUT",
                          "playlistItemData":{"playlistSetVideoId":"hidden"}}}
                        """), new JSONObject("""
                        {"continuationItemRenderer":{"continuationEndpoint":{"continuationCommand":{"token":"page2"}}}}
                        """));
            }
            assertEquals("page2", token);
            return new JSONObject().put("appendContinuationItemsAction",
                    new JSONObject().put("continuationItems", new JSONArray().put(row(THIRD, ALBUM))));
        });
        AlbumFileTracks.Position position = tracks.resolve(THIRD, watch(THIRD, "PLarbitrary", ALBUM_PAGE));
        assertEquals(new AlbumFileTracks.Position(3, 3), position);
        assertEquals(new AlbumFileTracks.Position(1, 3), tracks.resolve(FIRST, watch(FIRST, ALBUM, ALBUM_PAGE)));
        assertEquals(List.of(ALBUM_PAGE + ":null", "VL" + ALBUM + ":null", "VL" + ALBUM + ":page2"), requests);
        assertTags(position, 3, 3);
    }

    @Test
    public void differentContainingPlaylistsNeverChangeTheSerializedAlbumPosition() throws Exception {
        List<String> requests = new ArrayList<>();
        AlbumFileTracks tracks = new AlbumFileTracks((id, token) -> {
            requests.add(id);
            if (ALBUM_PAGE.equals(id)) return albumPage();
            assertEquals("VL" + ALBUM, id);
            return shelf(row(FIRST, ALBUM), row(THIRD, ALBUM));
        });
        for (String list : List.of("PLfirstList", "PLsecondList", "OLAK5uy_otherAlbum")) {
            AlbumFileTracks.Position position = tracks.resolve(THIRD, watch(THIRD, list, ALBUM_PAGE));
            assertEquals(new AlbumFileTracks.Position(2, 2), position);
            assertTags(position, 2, 2);
        }
        assertEquals(List.of(ALBUM_PAGE, "VL" + ALBUM), requests);
    }

    @Test
    public void missingTotalDoesNotEraseTheTrackNumberOrInventATotal() throws Exception {
        assertTags(new AlbumFileTracks.Position(7, 0), 7, 0);
    }

    @Test
    public void duplicateVideoOnOriginalAlbumHasNoUniqueTrackNumber() throws Exception {
        AlbumFileTracks tracks = new AlbumFileTracks((id, token) -> ALBUM_PAGE.equals(id) ? albumPage()
                : shelf(row(THIRD, ALBUM), row(FIRST, ALBUM), row(THIRD, ALBUM)));
        AlbumFileTracks.Position position = tracks.resolve(THIRD, watch(THIRD, "PLsecondList", ALBUM_PAGE));
        assertNull(position);
        assertTags(position, 0, 0);
    }

    @Test
    public void mismatchedPlaylistRowCannotBeUsedForAlbumNumbers() {
        assertThrows(IOException.class, () -> PlaylistPage.readAlbum(ALBUM,
                shelf(row(FIRST, ALBUM), row(THIRD, "PLunrelated")), token -> null));
    }

    private void assertTags(AlbumFileTracks.Position position, int number, int total) throws IOException {
        AudioTagger.Tags tags = position == null ? new AudioTagger.Tags("Track", "Artist", "Album", null)
                : new AudioTagger.Tags("Track", "Artist", "Album", null, position.number(), position.total());

        ByteBuffer moov = box(ByteBuffer.wrap(tagFile(MP4, "audio/mp4", tags)), "moov");
        ByteBuffer udta = box(moov, "udta");
        ByteBuffer meta = box(udta, "meta");
        meta.getInt(); // version and flags
        ByteBuffer items = box(meta, "ilst");
        ByteBuffer track = box(items, "trkn");
        if (number == 0) {
            assertNull(track);
        } else {
            ByteBuffer data = box(track, "data");
            assertEquals(0, data.getInt()); // implicit binary type
            assertEquals(0, data.getInt()); // locale
            assertEquals(8, data.remaining());
            assertEquals(0, data.getShort());
            assertEquals(number, Short.toUnsignedInt(data.getShort()));
            assertEquals(total, Short.toUnsignedInt(data.getShort()));
            assertEquals(0, data.getShort());
        }

        ByteBuffer ogg = ByteBuffer.wrap(tagFile(WEBM, "audio/webm; codecs=\"opus\"", tags));
        assertEquals("OpusHead", text(oggPage(ogg), 8));
        ByteBuffer comments = oggPage(ogg).order(ByteOrder.LITTLE_ENDIAN);
        assertEquals("OpusTags", text(comments, 8));
        assertEquals("RVX", text(comments, comments.getInt()));
        int count = comments.getInt();
        List<String> entries = new ArrayList<>(count);
        for (int index = 0; index < count; index++) entries.add(text(comments, comments.getInt()));

        List<String> expected = new ArrayList<>(List.of("TITLE=Track", "ARTIST=Artist", "ALBUM=Album"));
        if (number > 0) expected.add("TRACKNUMBER=" + number);
        if (total > 0) expected.add("TRACKTOTAL=" + total);
        assertEquals(expected, entries);
    }

    private byte[] tagFile(byte[] fixture, String mimeType, AudioTagger.Tags tags) throws IOException {
        File input = temporary.newFile();
        Files.write(input.toPath(), fixture);
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        AudioTagger.write(input, mimeType, output, tags);
        return output.toByteArray();
    }

    private static ByteBuffer box(ByteBuffer parent, String name) {
        assertNotNull(parent);
        while (parent.remaining() >= 8) {
            int size = parent.getInt();
            String type = text(parent, 4);
            int end = parent.position() + size - 8;
            if (name.equals(type)) return parent.slice(parent.position(), size - 8);
            parent.position(end);
        }
        return null;
    }

    private static ByteBuffer oggPage(ByteBuffer stream) {
        int start = stream.position();
        assertEquals("OggS", text(stream, 4));
        stream.position(start + 26);
        int laces = Byte.toUnsignedInt(stream.get());
        int size = 0;
        for (int index = 0; index < laces; index++) size += Byte.toUnsignedInt(stream.get());
        ByteBuffer payload = stream.slice(stream.position(), size);
        stream.position(stream.position() + size);
        return payload;
    }

    private static String text(ByteBuffer bytes, int count) {
        byte[] value = new byte[count];
        bytes.get(value);
        return new String(value, StandardCharsets.UTF_8);
    }

    private static JSONObject watch(String videoId, String containingList, String albumPage) throws JSONException {
        JSONObject action = new JSONObject("""
                {"menuNavigationItemRenderer":{"navigationEndpoint":{"browseEndpoint":{
                   "browseId":"%s","browseEndpointContextSupportedConfigs":{"browseEndpointContextMusicConfig":{
                     "pageType":"MUSIC_PAGE_TYPE_ALBUM"}}}}}}
                """.formatted(albumPage));
        JSONObject video = new JSONObject().put("videoId", videoId).put("selected", true).put("menu",
                object("menuRenderer", object("items", new JSONArray().put(action))));
        JSONObject panel = object("playlistPanelRenderer",
                object("contents", new JSONArray().put(object("playlistPanelVideoRenderer", video))));
        JSONObject queue = object("musicQueueRenderer", object("content", panel));
        JSONObject tabs = object("tabs", new JSONArray().put(object("tabRenderer", object("content", queue))));
        JSONObject renderer = object("singleColumnMusicWatchNextResultsRenderer",
                object("tabbedRenderer", object("watchNextTabbedResultsRenderer", tabs)));
        return object("contents", renderer).put("currentVideoEndpoint", object("watchEndpoint",
                new JSONObject().put("videoId", videoId).put("playlistId", containingList).put("index", 0)));
    }

    private static JSONObject albumPage() throws JSONException {
        return new JSONObject("""
                {"header":{"musicHeaderRenderer":{"anotherPlayButton":{"watchPlaylistEndpoint":{
                   "playlistId":"OLAK5uy_otherAlbum"}}}},
                 "fab":{"buttonRenderer":{"command":{"watchPlaylistEndpoint":{"playlistId":"%s"}}}}}
                """.formatted(ALBUM));
    }

    private static JSONObject shelf(JSONObject... rows) throws JSONException {
        JSONArray contents = new JSONArray(List.of(rows));
        return object("musicPlaylistShelfRenderer", object("contents", contents));
    }

    private static JSONObject row(String videoId, String playlistId) throws JSONException {
        return object("musicTwoColumnItemRenderer", object("navigationEndpoint", object("watchEndpoint",
                new JSONObject().put("videoId", videoId).put("playlistId", playlistId))));
    }

    private static JSONObject object(String key, Object value) throws JSONException {
        return new JSONObject().put(key, value);
    }
}
