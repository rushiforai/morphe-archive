package app.voidhack.extension.applemusic.library;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

public class LibraryDaapTest {
    private static final LibraryDaap.Identity IDENTITY =
            new LibraryDaap.Identity(1L, new byte[]{1, 2, 3, 4, 5, 6, 7, 8});

    @Test public void paginatesOverFiveThousandCloudLibraryTracksUsingMpagTokens() throws Exception {
        byte[] token1 = "page-2-token".getBytes(StandardCharsets.UTF_8);
        List<byte[]> requestedTokens = new ArrayList<>();
        List<String> progressUpdates = new ArrayList<>();

        List<LibraryDaap.Track> tracks = LibraryDaap.readTracks(IDENTITY, new AtomicBoolean(), token -> {
            requestedTokens.add(token.clone());
            if (token.length == 0) {
                return DaapCodec.root(itemsPage(6436, 1, 5000, token1, false), "adbs");
            }
            if (Arrays.equals(token, token1)) {
                return DaapCodec.root(itemsPage(6436, 5001, 1436, null, false), "adbs");
            }
            throw new AssertionError("Unexpected pagination token");
        }, (loaded, total) -> progressUpdates.add(loaded + "/" + total));

        assertEquals(6436, tracks.size());
        assertEquals(2, requestedTokens.size());
        assertEquals(0, requestedTokens.get(0).length);
        assertArrayEquals(token1, requestedTokens.get(1));
        assertEquals(List.of("5000/6436", "6436/6436"), progressUpdates);
        assertEquals(1L, tracks.get(0).cloudId);
        assertEquals(6436L, tracks.get(6435).cloudId);
        assertTrue(tracks.get(0).inLibrary);
    }

    @Test public void preservesOpaqueBinaryPaginationTokensAcrossThreePages() throws Exception {
        byte[] token1 = new byte[]{(byte) 0xff, 0x00, (byte) 0xc3, 0x28};
        byte[] token2 = new byte[]{0x01, (byte) 0x80, (byte) 0xfe};
        List<byte[]> requestedTokens = new ArrayList<>();

        List<LibraryDaap.Track> tracks = LibraryDaap.readTracks(IDENTITY, new AtomicBoolean(), token -> {
            requestedTokens.add(token.clone());
            if (token.length == 0) return DaapCodec.root(itemsPage(5, 1, 2, token1, false), "adbs");
            if (Arrays.equals(token, token1)) return DaapCodec.root(itemsPage(5, 3, 2, token2, false), "adbs");
            if (Arrays.equals(token, token2)) return DaapCodec.root(itemsPage(5, 5, 1, new byte[0], true), "adbs");
            throw new AssertionError("Unexpected token");
        }, null);

        assertEquals(5, tracks.size());
        assertEquals(3, requestedTokens.size());
        assertArrayEquals(token1, requestedTokens.get(1));
        assertArrayEquals(token2, requestedTokens.get(2));
        assertFalse(tracks.get(4).inLibrary);
    }

    @Test public void restartsPaginationFromPageOneWhenServerRequestsMurr() throws Exception {
        byte[] staleToken = "stale-page-2".getBytes(StandardCharsets.UTF_8);
        byte[] freshToken = "fresh-page-2".getBytes(StandardCharsets.UTF_8);
        AtomicInteger calls = new AtomicInteger();
        List<String> progressUpdates = new ArrayList<>();

        List<LibraryDaap.Track> tracks = LibraryDaap.readTracks(IDENTITY, new AtomicBoolean(), token -> {
            int call = calls.incrementAndGet();
            switch (call) {
                case 1:
                    assertEquals(0, token.length);
                    return DaapCodec.root(itemsPage(4, 1, 2, staleToken, false), "adbs");
                case 2:
                    assertArrayEquals(staleToken, token);
                    return DaapCodec.root(murrRestartResponse(), "adbs");
                case 3:
                    assertEquals(0, token.length);
                    return DaapCodec.root(itemsPage(4, 101, 2, freshToken, false), "adbs");
                case 4:
                    assertArrayEquals(freshToken, token);
                    return DaapCodec.root(itemsPage(4, 103, 2, null, false), "adbs");
                default:
                    throw new AssertionError("Unexpected call " + call);
            }
        }, (loaded, total) -> progressUpdates.add(loaded + "/" + total));

        assertEquals(4, tracks.size());
        assertEquals(101L, tracks.get(0).cloudId);
        assertEquals(104L, tracks.get(3).cloudId);
        assertEquals(List.of("2/4", "0/0", "2/4", "4/4"), progressUpdates);
    }

    @Test public void failsCleanlyWhenMurrRestartsExceedLimit() {
        LibraryDaap.Failure error = assertThrows(LibraryDaap.Failure.class, () -> LibraryDaap.readTracks(
                IDENTITY, new AtomicBoolean(), token -> DaapCodec.root(murrRestartResponse(), "adbs"), null));

        assertEquals(LibraryDaap.Kind.LIBRARY_CHANGED, error.kind);
        assertTrue(error.detail.startsWith("items:restart_limit="));
    }

    @Test public void rejectsRepeatedPaginationTokenToAvoidInfiniteLoop() {
        byte[] stuckToken = "same-token".getBytes(StandardCharsets.UTF_8);
        AtomicInteger pageIndex = new AtomicInteger();

        LibraryDaap.Failure error = assertThrows(LibraryDaap.Failure.class, () -> LibraryDaap.readTracks(
                IDENTITY, new AtomicBoolean(), token -> {
                    int page = pageIndex.getAndIncrement();
                    return DaapCodec.root(itemsPage(10, page * 2 + 1, 2, stuckToken, false), "adbs");
                }, null));

        assertEquals(LibraryDaap.Kind.PROTOCOL, error.kind);
        assertTrue(error.detail.startsWith("items:repeat_token="));
    }

    @Test public void rejectsIncompleteResponseWithoutNextPaginationToken() {
        LibraryDaap.Failure error = assertThrows(LibraryDaap.Failure.class, () -> LibraryDaap.readTracks(
                IDENTITY, new AtomicBoolean(), token -> DaapCodec.root(itemsPage(6436, 1, 5000, null, false), "adbs"), null));

        assertEquals(LibraryDaap.Kind.PROTOCOL, error.kind);
        assertEquals("items:incomplete=5000/6436", error.detail);
    }

    @Test public void handlesEmptyCloudLibraryCleanly() throws Exception {
        List<LibraryDaap.Track> tracks = LibraryDaap.readTracks(IDENTITY, new AtomicBoolean(),
                token -> DaapCodec.root(itemsPage(0, 1, 0, null, false), "adbs"), null);

        assertTrue(tracks.isEmpty());
    }

    @Test public void retryPolicyCoversReadOnlyItemsPostAndJapaneseLookupRateLimits() {
        assertTrue(LibraryDaap.shouldRetry("items", "POST", 429, 0));
        assertTrue(LibraryDaap.shouldRetry("items", "POST", 503, 2));
        assertFalse(LibraryDaap.shouldRetry("items", "POST", 503, 3));
        assertFalse(LibraryDaap.shouldRetry("edit", "POST", 503, 0));
        assertFalse(LibraryDaap.shouldRetry("edit", "POST", 429, 0));
        assertTrue(LibraryDaap.shouldRetry("lookup_jp", "GET", 403, 0));
        assertTrue(LibraryDaap.shouldRetry("lookup_jp", "GET", 429, 2));
        assertFalse(LibraryDaap.shouldRetry("login", "GET", 403, 0));
        assertEquals(2000L, LibraryDaap.retryBackoffMs("lookup_jp", 0));
        assertEquals(4000L, LibraryDaap.retryBackoffMs("lookup_jp", 1));
        assertEquals(500L, LibraryDaap.retryBackoffMs("items", 0));
    }

    private static byte[] itemsPage(int totalCount, int firstCloudId, int pageCount, byte[] mpag, boolean playlistOnly)
            throws IOException {
        ByteArrayOutputStream list = new ByteArrayOutputStream();
        for (int i = 0; i < pageCount; i++) {
            int id = firstCloudId + i;
            ByteArrayOutputStream item = new ByteArrayOutputStream();
            writeTag(item, "miid", uint32(id));
            writeTag(item, "ajsa", uint32(100000 + id));
            writeTag(item, "minm", ("Song " + id).getBytes(StandardCharsets.UTF_8));
            if (playlistOnly) {
                writeTag(item, "ajpo", new byte[]{1});
            }
            writeTag(list, "mlit", item.toByteArray());
        }
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        writeTag(body, "mstt", uint32(200));
        writeTag(body, "mtco", uint32(totalCount));
        writeTag(body, "mrco", uint32(pageCount));
        if (mpag != null) {
            writeTag(body, "mpag", mpag);
        }
        writeTag(body, "mlcl", list.toByteArray());

        ByteArrayOutputStream root = new ByteArrayOutputStream();
        writeTag(root, "adbs", body.toByteArray());
        return root.toByteArray();
    }

    private static byte[] murrRestartResponse() throws IOException {
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        writeTag(body, "mstt", uint32(200));
        writeTag(body, "murr", new byte[0]);
        ByteArrayOutputStream root = new ByteArrayOutputStream();
        writeTag(root, "adbs", body.toByteArray());
        return root.toByteArray();
    }

    private static void writeTag(ByteArrayOutputStream out, String code, byte[] value) throws IOException {
        out.write(code.getBytes(StandardCharsets.US_ASCII));
        out.write(uint32(value.length));
        out.write(value);
    }

    private static byte[] uint32(int value) {
        return ByteBuffer.allocate(4).putInt(value).array();
    }
}
