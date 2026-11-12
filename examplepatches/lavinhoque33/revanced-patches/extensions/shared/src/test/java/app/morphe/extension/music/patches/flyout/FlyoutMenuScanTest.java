/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-11.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.flyout;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import com.google.protobuf.CodedOutputStream;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.music.patches.downloads.DownloadMethod;

public class FlyoutMenuScanTest {
    private static final String SONG = "dQw4w9WgXcQ";
    private static final String OTHER = "lYBUbBu4W08";

    private static byte[] message(int field, byte[]... parts) {
        try {
            ByteArrayOutputStream inner = new ByteArrayOutputStream();
            for (byte[] part : parts) inner.write(part);
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            CodedOutputStream out = CodedOutputStream.newInstance(bytes);
            out.writeByteArray(field, inner.toByteArray());
            out.flush();
            return bytes.toByteArray();
        } catch (IOException ex) {
            throw new AssertionError(ex);
        }
    }

    private static byte[] string(int field, String value) {
        try {
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            CodedOutputStream out = CodedOutputStream.newInstance(bytes);
            out.writeString(field, value);
            out.flush();
            return bytes.toByteArray();
        } catch (IOException ex) {
            throw new AssertionError(ex);
        }
    }

    /** An item of the given renderer whose command (field 3) is the given endpoint. */
    private static byte[] item(int renderer, byte[] endpoint) {
        return message(renderer, message(3, endpoint));
    }

    private static byte[] queueAdd(int renderer, String id) {
        return item(renderer, message(163162354, message(1, string(1, id))));
    }

    private static byte[] startMix(int renderer, String id) {
        return item(renderer, message(48687757, string(1, id)));
    }

    private static byte[] credits(int renderer, String browseId) {
        return item(renderer, message(48687626, string(2, browseId)));
    }

    private static FlyoutMenuScan.Result scan(byte[]... items) {
        return FlyoutMenuScan.scan(Arrays.asList(items));
    }

    @Test
    public void ordinaryQueueItemNamesTheSong() {
        FlyoutMenuScan.Result result = scan(startMix(66441108, OTHER), queueAdd(66441155, SONG));

        assertEquals(SONG, result.songId());
        assertEquals(1, result.insertAfter());
        assertFalse(result.hasDownload());
    }

    @Test
    public void conditionalQueueItemNamesTheSong() {
        FlyoutMenuScan.Result result = scan(queueAdd(77258115, SONG));

        assertEquals(SONG, result.songId());
        assertEquals(0, result.insertAfter());
    }

    @Test
    public void startMixIsTheFallbackAndCreditsComeLast() {
        FlyoutMenuScan.Result mix = scan(credits(66441108, "MPTC" + OTHER), startMix(77262503, SONG));
        assertEquals(SONG, mix.songId());
        assertEquals(1, mix.insertAfter());

        FlyoutMenuScan.Result credit = scan(credits(66441108, "MPTC" + OTHER));
        assertEquals(OTHER, credit.songId());
    }

    @Test
    public void queueIdBeatsTheNavigationIds() {
        assertEquals(SONG, scan(startMix(66441108, OTHER), credits(66441108, "MPTC" + OTHER),
                queueAdd(77258115, SONG)).songId());
    }

    @Test
    public void conflictingQueueIdsAreNoSong() {
        assertNull(scan(queueAdd(66441155, SONG), queueAdd(77258115, OTHER)).songId());
    }

    @Test
    public void creditsNeedTheCreditsPrefixAndAnId() {
        assertNull(scan(credits(66441108, "UCsomechannel1")).songId());
        assertNull(scan(credits(66441108, "MPTCshort")).songId());
        assertNull(scan(credits(66441108, "MPREb_12345678901")).songId());
    }

    @Test
    public void downloadActionsAreRecognizedAcrossAllNativeWrappers() {
        for (int renderer : new int[]{66441155, 77258115, 66441108, 77262503}) {
            byte[] upsell = item(renderer, message(133724106, string(1, "encoded-song-params")));
            byte[] video = item(renderer, message(73080600, string(1, SONG), number(2, 1)));
            assertTrue(scan(queueAdd(66441155, SONG), upsell).hasDownload());
            assertTrue(scan(queueAdd(66441155, SONG), video).hasDownload());
        }
    }

    @Test
    public void menuWithoutASongStaysUnchanged() {
        FlyoutMenuScan.Result result = scan(null, item(66441155, message(1, string(1, "Close"))),
                string(5, "noise"));

        assertNull(result.songId());
        assertEquals(-1, result.insertAfter());
        assertNull(FlyoutMenuScan.scan(Collections.<byte[]>emptyList()).songId());
    }

    @Test
    public void itemsThatAreNotMessagesAreSkipped() {
        List<byte[]> items = Arrays.asList(new byte[]{(byte) 0xff, (byte) 0xff}, queueAdd(66441155, SONG));

        assertEquals(SONG, FlyoutMenuScan.scan(items).songId());
    }

    private static byte[] number(int field, int value) {
        try {
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            CodedOutputStream output = CodedOutputStream.newInstance(bytes);
            output.writeInt32(field, value);
            output.flush();
            return bytes.toByteArray();
        } catch (IOException ex) {
            throw new AssertionError(ex);
        }
    }

    /** Captured Ghost/Homesick standalone row ABI, with no account/tracking bytes retained. */
    private static byte[] sheetRow(String template, String destination, String params) {
        return sheetRowWithCommand(template, sheetCommand(destination, params));
    }

    private static byte[] sheetCommand(String destination, String params) {
        byte[] sheet = message(443434441, message(1, message(2, string(2, destination), string(3, params))));
        byte[] action = message(169495254, sheet);
        byte[] dismiss = message(169495254, message(274807924, number(1, 1)));
        return message(204158123, message(170382688, message(1, action), message(1, dismiss)));
    }

    private static byte[] sheetRowWithCommand(String template, byte[] batch) {
        byte[] click = message(3, message(169495254, batch));
        byte[] model = message(5, message(413471385,
                message(1, message(489973921, message(997, message(3, click))))));
        return message(153515154, message(172660663, message(1, message(168777401,
                message(3, message(172035250, string(1, template))), model))));
    }

    @Test
    public void capturedElementsDownloadIsReplacedWithoutChangingAnyOtherRow() {
        byte[] queue = queueAdd(66441155, SONG);
        byte[] album = credits(66441108, "MPREb_album");
        byte[] download = sheetRow("list_item.eml-fe|413c0648d97023c8", "PApremium_upsell", "igkCCA4%3D");
        byte[] artist = credits(66441108, "UC_artist");
        List<byte[]> original = List.of(queue, album, download, artist);
        byte[] replacement = item(66441155, message(133724106, string(1, "song-params")));

        FlyoutMenuScan.Result scanned = FlyoutMenuScan.scan(original);
        List<byte[]> changed = scanned.withDownload(original, replacement);
        assertEquals(SONG, scanned.songId());
        assertEquals(4, changed.size());
        assertSame(queue, changed.get(0));
        assertSame(album, changed.get(1));
        assertSame(replacement, changed.get(2));
        assertSame(artist, changed.get(3));
        assertSame(download, original.get(2));
    }

    @Test
    public void onlyDownloadUpsellsInStandaloneRowsAreReplaced() {
        byte[] queue = queueAdd(66441155, SONG);
        assertFalse(scan(queue, sheetRow("list_item.eml-fe|known", "PApremium_upsell", "igkCCAw=")).hasDownload());
        assertFalse(scan(queue, sheetRow("list_item.eml-fe|known", "PAother", "igkCCA4%3D")).hasDownload());
        assertFalse(scan(queue, sheetRow("carousel.eml-fe|unknown", "PApremium_upsell", "igkCCA4%3D"))
                .hasDownload());
    }

    @Test
    public void duplicateDownloadActionsBecomeOneAndRemoveCancelActionsStayIntact() {
        byte[] queue = queueAdd(66441155, SONG);
        byte[] download = item(66441108, message(73080600, string(7, SONG), number(2, 1)));
        byte[] cancel = item(66441155, message(73080600, string(1, SONG), number(2, 2)));
        byte[] elements = sheetRow("list_item.eml-fe|known", "PApremium_upsell", "igkCCA4%3D");
        byte[] last = credits(66441108, "MPTC" + SONG);
        List<byte[]> original = List.of(queue, download, cancel, elements, last);
        byte[] replacement = new byte[]{1};

        List<byte[]> changed = FlyoutMenuScan.scan(original).withDownload(original, replacement);
        assertEquals(4, changed.size());
        assertSame(queue, changed.get(0));
        assertSame(replacement, changed.get(1));
        assertSame(cancel, changed.get(2));
        assertSame(last, changed.get(3));
    }

    /** Sanitized Library > Playlists capture: menu field 66439850 / items 1, queue target field 2. */
    private static byte[] playlistMenu(String id, byte[] command) {
        byte[] queue = item(77258115, message(163162354, message(1, string(2, id))));
        return message(66439850, message(1, queue),
                message(1, sheetRowWithCommand("list_item.eml-fe|library-download", command)));
    }

    @Test
    public void libraryDownloadUsesThatRowsPlaylistForBothOwnedMethods() {
        String rowId = "PL16FEhKJOy-Ymx5_29RV8sCv6MwBSsicE";
        byte[] command = sheetCommand("PApremium_upsell", "igkCCA4%3D");
        byte[] menu = playlistMenu(rowId, command);

        assertEquals(rowId, FlyoutMenuScan.playlistForDownload(DownloadMethod.STREAM, command, menu));
        assertEquals(rowId, FlyoutMenuScan.playlistForDownload(DownloadMethod.DEVICE_FILES, command, menu));
    }

    @Test
    public void delegatedLibraryDownloadKeepsStockBehavior() {
        byte[] command = sheetCommand("PApremium_upsell", "igkCCA4%3D");

        assertNull(FlyoutMenuScan.playlistForDownload(DownloadMethod.DELEGATED,
                command, playlistMenu("PLlibrary", command)));
    }

    @Test
    public void otherPremiumUpsellsAndDifferentTappedCommandsAreNotPlaylistDownloads() {
        byte[] download = sheetCommand("PApremium_upsell", "igkCCA4%3D");
        byte[] otherReason = sheetCommand("PApremium_upsell", "igkCCAw=");
        byte[] otherOffer = sheetCommand("PAother", "igkCCA4%3D");
        byte[] invalidParams = sheetCommand("PApremium_upsell", "not-base64!");

        for (byte[] unrelated : new byte[][]{otherReason, otherOffer, invalidParams}) {
            assertNull(FlyoutMenuScan.playlistForDownload(DownloadMethod.STREAM,
                    unrelated, playlistMenu("PLlibrary", unrelated)));
        }

        byte[] differentButton = message(204158123,
                new ProtoMessage(download).messageField(204158123).serializedBytes(), string(99, "other-button"));
        assertNull(FlyoutMenuScan.playlistForDownload(DownloadMethod.STREAM,
                differentButton, playlistMenu("PLlibrary", download)));
        assertNull(FlyoutMenuScan.playlistForDownload(DownloadMethod.STREAM,
                otherReason, playlistMenu("PLlibrary", download)));
        assertNull(FlyoutMenuScan.playlistForDownload(DownloadMethod.STREAM,
                download, playlistMenu("PLlibrary", otherReason)));
    }

    @Test
    public void ambiguousOrSongQueueTargetsDoNotFallBackToAPlaylist() {
        byte[] command = sheetCommand("PApremium_upsell", "igkCCA4%3D");
        byte[] download = message(1, sheetRowWithCommand("list_item.eml-fe|download", command));
        byte[] first = message(1, item(66441155, message(163162354, message(1, string(2, "PLfirst")))));
        byte[] second = message(1, item(77258115, message(163162354, message(1, string(2, "PLsecond")))));
        byte[] song = message(1, item(77258115,
                message(163162354, message(1, string(1, SONG), string(2, "PLcontext")))));

        assertNull(FlyoutMenuScan.playlistForDownload(DownloadMethod.STREAM,
                command, message(66439850, first, second, download)));
        assertNull(FlyoutMenuScan.playlistForDownload(DownloadMethod.STREAM,
                command, message(66439850, song, download)));
        assertNull(FlyoutMenuScan.playlistForDownload(DownloadMethod.STREAM,
                command, message(66439850, download)));
    }

    @Test
    public void matchingAlbumPlaylistAndRepeatedIdenticalTargetsAreSupported() {
        byte[] command = sheetCommand("PApremium_upsell", "igkCCA4%3D");
        String albumId = "OLAK5uy_album";
        assertEquals(albumId, FlyoutMenuScan.playlistForDownload(DownloadMethod.DEVICE_FILES,
                command, playlistMenu(albumId, command)));

        byte[] queue = message(1, item(66441155,
                message(163162354, message(1, string(2, "VLPLlibrary")))));
        byte[] download = message(1, sheetRowWithCommand("list_item.eml-fe|download", command));
        assertEquals("PLlibrary", FlyoutMenuScan.playlistForDownload(DownloadMethod.STREAM,
                command, message(66439850, queue, queue, download)));
    }

    @Test
    public void unknownMenuModelsAndNonStandaloneUpsellsStayStock() {
        byte[] command = sheetCommand("PApremium_upsell", "igkCCA4%3D");
        byte[] queue = message(1, item(77258115, message(163162354, message(1, string(2, "PLlibrary")))));
        byte[] carousel = message(1, sheetRowWithCommand("carousel.eml-fe|not-a-download-row", command));

        assertNull(FlyoutMenuScan.playlistForDownload(DownloadMethod.STREAM, command, new byte[]{(byte) 0xff}));
        assertNull(FlyoutMenuScan.playlistForDownload(DownloadMethod.STREAM,
                command, message(66439850, queue, carousel)));
        assertNull(FlyoutMenuScan.playlistForDownload(DownloadMethod.STREAM,
                new byte[]{(byte) 0xff}, playlistMenu("PLlibrary", command)));
    }
}
