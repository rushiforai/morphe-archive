/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.BooleanSupplier;

/** Runs the server on real sockets, with a client that writes its requests by hand. */
public class VideoStreamServerTest {
    @Rule public final TemporaryFolder folder = new TemporaryFolder();

    private static final int WAIT_MS = 5_000;
    private final AtomicInteger stops = new AtomicInteger();
    private final List<Socket> clients = new ArrayList<>();
    private VideoStreamServer server;

    /** Bytes that say where they are, read through a {@link VideoStreamServer.Source}. */
    private static class Video implements VideoStreamServer.Source {
        final byte[] bytes;
        final List<long[]> opens = new java.util.concurrent.CopyOnWriteArrayList<>();
        final AtomicInteger closes = new AtomicInteger();
        final AtomicInteger idles = new AtomicInteger();
        IOException refusal;

        Video(int size) {
            bytes = new byte[size];
            for (int i = 0; i < size; i++) bytes[i] = (byte) i;
        }

        @Override public VideoStreamServer.Reader open(long position, long length) throws IOException {
            opens.add(new long[] {position, length});
            if (refusal != null) throw refusal;
            return reader(position);
        }

        VideoStreamServer.Reader reader(long position) {
            return new VideoStreamServer.Reader() {
                long at = position;

                @Override public int read(byte[] into, int offset, int length) {
                    if (at >= bytes.length) return -1;
                    int count = (int) Math.min(length, bytes.length - at);
                    System.arraycopy(bytes, (int) at, into, offset, count);
                    at += count;
                    return count;
                }

                @Override public void close() {
                    closes.incrementAndGet();
                }
            };
        }

        @Override public void idle() {
            idles.incrementAndGet();
        }
    }

    /** A video whose bytes haven't arrived: a read waits, the way Telegram's does, until interrupted. */
    private static class Waiting extends Video {
        final CountDownLatch reading = new CountDownLatch(1);
        final CountDownLatch interrupted = new CountDownLatch(1);

        Waiting() {
            super(1000);
        }

        @Override VideoStreamServer.Reader reader(long position) {
            return new VideoStreamServer.Reader() {
                @Override public int read(byte[] into, int offset, int length) {
                    reading.countDown();
                    try {
                        new CountDownLatch(1).await();
                    } catch (InterruptedException stopped) {
                        interrupted.countDown();
                    }
                    return -3;
                }

                @Override public void close() {
                    closes.incrementAndGet();
                }
            };
        }
    }

    private static final class Reply {
        int status;
        final Map<String, String> headers = new HashMap<>();
        byte[] body = new byte[0];
    }

    /** Waits long enough that nothing but the test's own step stops a stream. */
    private static VideoStreamServer.Timing patient() {
        VideoStreamServer.Timing timing = new VideoStreamServer.Timing();
        timing.tickMs = 20;
        timing.headerMs = WAIT_MS;
        timing.emptyMs = 60_000;
        timing.stalledMs = 60_000;
        timing.unwatchedMs = 60_000;
        return timing;
    }

    private VideoStreamServer started(VideoStreamServer.Timing timing) throws IOException {
        server = new VideoStreamServer(timing, stops::incrementAndGet);
        server.start();
        return server;
    }

    @After public void stopEverything() throws IOException {
        for (Socket client : clients) client.close();
        if (server != null) server.stop();
    }

    private static String path(String address) {
        return address.substring(address.indexOf('/', "http://".length()));
    }

    private Socket connect() throws IOException {
        Socket socket = new Socket(InetAddress.getByAddress(new byte[] {127, 0, 0, 1}), server.port());
        socket.setSoTimeout(WAIT_MS);
        clients.add(socket);
        return socket;
    }

    private static void send(Socket socket, String method, String target, String... headers) throws IOException {
        StringBuilder request = new StringBuilder(method).append(' ').append(target).append(" HTTP/1.1\r\nHost: player\r\n");
        for (String header : headers) request.append(header).append("\r\n");
        socket.getOutputStream().write(request.append("\r\n").toString().getBytes(StandardCharsets.ISO_8859_1));
        socket.getOutputStream().flush();
    }

    private Reply ask(String method, String target, String... headers) throws IOException {
        Socket socket = connect();
        send(socket, method, target, headers);
        return reply(socket);
    }

    private static Reply reply(Socket socket) throws IOException {
        ByteArrayOutputStream all = new ByteArrayOutputStream();
        InputStream in = socket.getInputStream();
        byte[] buffer = new byte[8192];
        for (int read; (read = in.read(buffer)) >= 0; ) all.write(buffer, 0, read);
        return parse(all.toByteArray());
    }

    /** Reads only as far as the blank line, for a response whose body may never come. */
    private static Reply head(Socket socket) throws IOException {
        ByteArrayOutputStream all = new ByteArrayOutputStream();
        InputStream in = socket.getInputStream();
        while (!all.toString("ISO-8859-1").endsWith("\r\n\r\n")) {
            int read = in.read();
            if (read < 0) break;
            all.write(read);
        }
        return parse(all.toByteArray());
    }

    private static Reply parse(byte[] raw) {
        String text = new String(raw, StandardCharsets.ISO_8859_1);
        int end = text.indexOf("\r\n\r\n");
        assertTrue("a whole head: " + text, end > 0);
        String[] lines = text.substring(0, end).split("\r\n");
        Reply reply = new Reply();
        reply.status = Integer.parseInt(lines[0].split(" ")[1]);
        for (int i = 1; i < lines.length; i++) {
            int colon = lines[i].indexOf(':');
            reply.headers.put(lines[i].substring(0, colon).toLowerCase(Locale.ROOT), lines[i].substring(colon + 1).trim());
        }
        reply.body = Arrays.copyOfRange(raw, end + 4, raw.length);
        return reply;
    }

    private static void await(String what, BooleanSupplier done) throws InterruptedException {
        long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(WAIT_MS);
        while (!done.getAsBoolean()) {
            assertTrue("timed out waiting for " + what, System.nanoTime() < deadline);
            Thread.sleep(5);
        }
    }

    private String addVideo(String key, Video video) {
        return server.add(key, "clip.mp4", "video/mp4", video.bytes.length, video);
    }

    /** A player connected and waiting for bytes that aren't there yet. */
    private Socket watching(String address, Waiting video) throws IOException, InterruptedException {
        Socket socket = connect();
        send(socket, "GET", path(address));
        assertEquals(200, head(socket).status);
        assertTrue("the read started", video.reading.await(WAIT_MS, TimeUnit.MILLISECONDS));
        return socket;
    }

    @Test public void itListensOnlyOnThePhoneBehindAnAddressNobodyCanGuess() throws Exception {
        started(patient());
        assertTrue(server.address().isLoopbackAddress());
        assertArrayEquals(new byte[] {127, 0, 0, 1}, server.address().getAddress());
        String first = addVideo("one", new Video(10));
        String second = addVideo("two", new Video(10));
        assertTrue(first, first.matches("http://127\\.0\\.0\\.1:" + server.port() + "/[0-9a-f]{32}/clip\\.mp4"));
        assertNotEquals(first.split("/")[3], second.split("/")[3]);
    }

    @Test public void theWholeVideoComesWithWhatAPlayerNeedsToSeek() throws Exception {
        started(patient());
        Video video = new Video(200_000);
        Reply reply = ask("GET", path(addVideo("one", video)));
        assertEquals(200, reply.status);
        assertArrayEquals(video.bytes, reply.body);
        assertEquals("video/mp4", reply.headers.get("content-type"));
        assertEquals("200000", reply.headers.get("content-length"));
        assertEquals("bytes", reply.headers.get("accept-ranges"));
        assertEquals("close", reply.headers.get("connection"));
        assertEquals("no-store", reply.headers.get("cache-control"));
        assertNull(reply.headers.get("content-range"));
        assertEquals(1, video.closes.get());
    }

    @Test public void aRangeReadsOnlyThatPart() throws Exception {
        started(patient());
        Video video = new Video(100);
        String target = path(addVideo("one", video));
        Reply middle = ask("GET", target, "Range: bytes=10-19");
        assertEquals(206, middle.status);
        assertEquals("bytes 10-19/100", middle.headers.get("content-range"));
        assertEquals("10", middle.headers.get("content-length"));
        assertArrayEquals(Arrays.copyOfRange(video.bytes, 10, 20), middle.body);
        assertArrayEquals(new long[] {10, 10}, video.opens.get(0));

        Reply rest = ask("GET", target, "range: bytes=90-");
        assertEquals("bytes 90-99/100", rest.headers.get("content-range"));
        assertArrayEquals(Arrays.copyOfRange(video.bytes, 90, 100), rest.body);

        Reply tail = ask("GET", target, "Range: bytes=-5");
        assertEquals("bytes 95-99/100", tail.headers.get("content-range"));
        assertArrayEquals(Arrays.copyOfRange(video.bytes, 95, 100), tail.body);
    }

    @Test public void aRangePastTheEndIsRefusedWithoutOpeningTheVideo() throws Exception {
        started(patient());
        Video video = new Video(100);
        Reply reply = ask("GET", path(addVideo("one", video)), "Range: bytes=100-");
        assertEquals(416, reply.status);
        assertEquals("bytes */100", reply.headers.get("content-range"));
        assertTrue(video.opens.isEmpty());
    }

    @Test public void rangeHeadersAreReadTheWayHttpSays() {
        assertNull(VideoStreamServer.parseRange(null, 100));
        assertArrayEquals(new long[] {0, 99}, VideoStreamServer.parseRange("bytes=0-", 100));
        assertArrayEquals(new long[] {5, 9}, VideoStreamServer.parseRange("bytes=5-9", 100));
        assertArrayEquals(new long[] {5, 9}, VideoStreamServer.parseRange(" BYTES= 5 - 9 ", 100));
        assertArrayEquals("past the end is cut", new long[] {5, 99}, VideoStreamServer.parseRange("bytes=5-500", 100));
        assertArrayEquals(new long[] {90, 99}, VideoStreamServer.parseRange("bytes=-10", 100));
        assertArrayEquals("more than there is", new long[] {0, 99}, VideoStreamServer.parseRange("bytes=-500", 100));
        assertEquals(0, VideoStreamServer.parseRange("bytes=100-", 100).length);
        assertEquals(0, VideoStreamServer.parseRange("bytes=-0", 100).length);
        assertEquals(0, VideoStreamServer.parseRange("bytes=-5", 0).length);
        for (String ignored : new String[] {"", "items=0-1", "bytes=", "bytes=a-b", "bytes=9-5", "bytes=0-1,3-4", "bytes=1",
                "bytes=99999999999999999999-"}) {
            assertNull(ignored, VideoStreamServer.parseRange(ignored, 100));
        }
    }

    @Test public void headAnswersWithoutOpeningTheVideo() throws Exception {
        started(patient());
        Video video = new Video(100);
        Reply reply = ask("HEAD", path(addVideo("one", video)));
        assertEquals(200, reply.status);
        assertEquals("100", reply.headers.get("content-length"));
        assertEquals(0, reply.body.length);
        assertTrue(video.opens.isEmpty());
    }

    @Test public void otherMethodsAreRefused() throws Exception {
        started(patient());
        Video video = new Video(100);
        Reply reply = ask("POST", path(addVideo("one", video)));
        assertEquals(405, reply.status);
        assertEquals("GET, HEAD", reply.headers.get("allow"));
        assertTrue(video.opens.isEmpty());
    }

    @Test public void anAddressWithoutTheTokenFindsNothing() throws Exception {
        started(patient());
        Video video = new Video(100);
        String target = path(addVideo("one", video));
        String token = target.split("/")[1];
        String wrong = (token.charAt(0) == 'a' ? "b" : "a") + token.substring(1);
        for (String guess : new String[] {"/", "/clip.mp4", "/" + wrong + "/clip.mp4", "/" + token.substring(1) + "/clip.mp4",
                "*", "http://127.0.0.1/" + token}) {
            assertEquals(guess, 404, ask("GET", guess).status);
        }
        assertEquals("the name after the token doesn't matter", 200, ask("GET", "/" + token + "/other.mkv").status);
        assertEquals("no name at all is fine too", 200, ask("HEAD", "/" + token).status);
        assertEquals(1, video.opens.size());
    }

    @Test public void aRequestThatIsNotHttpIsRefused() throws Exception {
        started(patient());
        Socket socket = connect();
        socket.getOutputStream().write("hello there\r\n\r\n".getBytes(StandardCharsets.ISO_8859_1));
        assertEquals(400, reply(socket).status);
    }

    @Test public void aHeadThatNeverEndsIsCutOff() throws Exception {
        started(patient());
        Socket socket = connect();
        byte[] endless = new byte[VideoStreamServer.MAX_HEADER_BYTES];
        Arrays.fill(endless, (byte) 'a');
        socket.getOutputStream().write(endless);
        assertEquals(431, reply(socket).status);
    }

    @Test public void aVideoThatWontOpenIsABadGateway() throws Exception {
        started(patient());
        Video video = new Video(100);
        video.refusal = new IOException("no such file");
        assertEquals(502, ask("GET", path(addVideo("one", video))).status);
    }

    @Test public void aTypeThatIsNotAVideoIsNotRepeatedToThePlayer() throws Exception {
        started(patient());
        Video video = new Video(10);
        String address = server.add("one", "a\r\nX-Evil: 1.mp4", "text/html\r\nX-Evil: 1", 10, video);
        assertFalse(address, address.contains("\r") || address.contains("\n"));
        Reply reply = ask("GET", path(address));
        assertEquals("application/octet-stream", reply.headers.get("content-type"));
        assertNull(reply.headers.get("x-evil"));
    }

    @Test public void aPlayerHangingUpWakesTheWaitingReadAndClosesIt() throws Exception {
        started(patient());
        Waiting video = new Waiting();
        Socket socket = watching(addVideo("one", video), video);
        socket.close();
        assertTrue("the read was interrupted", video.interrupted.await(WAIT_MS, TimeUnit.MILLISECONDS));
        await("the reader to close", () -> video.closes.get() == 1);
    }

    @Test public void nothingConnectedForAWhileStopsTheServerOnce() throws Exception {
        VideoStreamServer.Timing timing = patient();
        timing.emptyMs = 100;
        started(timing);
        Video video = new Video(10);
        addVideo("one", video);
        await("the server to stop", server::stopped);
        await("the stop to be told", () -> stops.get() == 1);
        assertEquals("the video is told too", 1, video.idles.get());
        server.stop();
        assertEquals(1, stops.get());
        assertNull(addVideo("two", video));
    }

    @Test public void aStreamThatStopsMovingStopsTheServer() throws Exception {
        VideoStreamServer.Timing timing = patient();
        timing.stalledMs = 150;
        started(timing);
        Waiting video = new Waiting();
        watching(addVideo("one", video), video);
        await("the server to stop", server::stopped);
        assertTrue(video.interrupted.await(WAIT_MS, TimeUnit.MILLISECONDS));
        await("the reader to close", () -> video.closes.get() == 1);
        assertEquals(1, stops.get());
    }

    @Test public void aStreamNobodyWatchesGoesIdleOnceUntilAPlayerComesBack() throws Exception {
        VideoStreamServer.Timing timing = patient();
        timing.unwatchedMs = 60;
        started(timing);
        Video video = new Video(10);
        String target = path(addVideo("one", video));
        await("the first idle", () -> video.idles.get() == 1);
        Thread.sleep(150);
        assertEquals("told once", 1, video.idles.get());
        assertFalse(server.stopped());

        assertEquals(200, ask("GET", target).status);
        await("the second idle", () -> video.idles.get() == 2);
    }

    @Test public void aWatchedStreamIsNotToldToGoIdle() throws Exception {
        VideoStreamServer.Timing timing = patient();
        timing.unwatchedMs = 40;
        started(timing);
        Waiting video = new Waiting();
        watching(addVideo("one", video), video);
        Thread.sleep(150);
        assertEquals(0, video.idles.get());
    }

    @Test public void tooManyConnectionsAreTurnedAway() throws Exception {
        started(patient());
        Waiting video = new Waiting();
        String address = addVideo("one", video);
        for (int i = 0; i < VideoStreamServer.MAX_CONNECTIONS; i++) watching(address, video);
        assertEquals(503, reply(connect()).status);
    }

    @Test public void theFifthVideoPushesOutOneNobodyIsWatching() throws Exception {
        started(patient());
        Waiting watched = new Waiting();
        String watchedAddress = addVideo("watched", watched);
        watching(watchedAddress, watched);
        Video oldest = new Video(10);
        String oldestAddress = addVideo("oldest", oldest);
        List<String> kept = new ArrayList<>();
        for (int i = 0; i < VideoStreamServer.MAX_STREAMS - 2; i++) kept.add(addVideo("kept" + i, new Video(10)));
        kept.add(addVideo("newest", new Video(10)));

        assertEquals(404, ask("HEAD", path(oldestAddress)).status);
        assertEquals(1, oldest.idles.get());
        for (String address : kept) assertEquals(200, ask("HEAD", path(address)).status);
        assertEquals("the one playing stays", 0, watched.idles.get());
    }

    @Test public void theSameVideoKeepsItsAddress() throws Exception {
        VideoStreamServer.Timing timing = patient();
        timing.unwatchedMs = 40;
        started(timing);
        Video video = new Video(10);
        String address = addVideo("one", video);
        await("it to go idle", () -> video.idles.get() == 1);
        assertEquals(address, addVideo("one", new Video(10)));
        await("it to go idle again, so adding it woke it", () -> video.idles.get() == 2);
    }

    @Test public void removingAStreamEndsItAndItsPlayers() throws Exception {
        started(patient());
        Waiting video = new Waiting();
        String address = addVideo("one", video);
        watching(address, video);
        server.remove("one");
        assertTrue(video.interrupted.await(WAIT_MS, TimeUnit.MILLISECONDS));
        assertEquals(1, video.idles.get());
        assertTrue(server.empty());
        assertEquals(404, ask("HEAD", path(address)).status);
        server.remove("one");
        assertEquals(1, video.idles.get());
    }

    @Test public void stoppingEndsEveryPlayer() throws Exception {
        started(patient());
        Waiting video = new Waiting();
        watching(addVideo("one", video), video);
        server.stop();
        assertTrue(video.interrupted.await(WAIT_MS, TimeUnit.MILLISECONDS));
        await("the reader to close", () -> video.closes.get() == 1);
        assertEquals(1, stops.get());
        assertEquals(1, video.idles.get());
    }

    @Test public void namesAreSafeInAnAddress() {
        assertEquals("clip-1_final.mp4", VideoStreamServer.safeName("clip-1_final.mp4"));
        assertEquals("my_clip__1_.mp4", VideoStreamServer.safeName("my clip (1).mp4"));
        assertEquals(".._.._etc_passwd", VideoStreamServer.safeName("../../etc/passwd"));
        assertEquals("__X__y.mp4", VideoStreamServer.safeName("\r\nX: y.mp4"));
        for (String empty : new String[] {null, "", "...", "___", "/", "   "}) {
            assertEquals("video.mp4", VideoStreamServer.safeName(empty));
        }
        char[] letters = new char[100];
        Arrays.fill(letters, 'a');
        String longName = VideoStreamServer.safeName(new String(letters) + ".mkv");
        assertEquals(60, longName.length());
        assertTrue(longName, longName.endsWith(".mkv"));
        assertEquals(60, VideoStreamServer.safeName(new String(letters)).length());
    }

    @Test public void onlyAWellFormedVideoTypeIsKept() {
        assertEquals("video/mp4", VideoStreamServer.safeMime("video/mp4"));
        assertEquals("video/x-matroska", VideoStreamServer.safeMime(" VIDEO/X-Matroska "));
        char[] letters = new char[64];
        Arrays.fill(letters, 'a');
        for (String refused : new String[] {null, "", "video/", "audio/mp4", "text/html", "video/mp4; codecs=avc1",
                "video/mp4\r\nX-Evil: 1", "video/../x", "video/" + new String(letters)}) {
            assertNull(refused, VideoStreamServer.safeMime(refused));
        }
    }

    @Test public void aFileOnThePhoneServesAnyPartOfItself() throws Exception {
        started(patient());
        File file = folder.newFile("clip.mp4");
        byte[] bytes = new Video(5000).bytes;
        try (FileOutputStream out = new FileOutputStream(file)) {
            out.write(bytes);
        }
        String address = server.add("file", "clip.mp4", "video/mp4", bytes.length, VideoStreamServer.fileSource(file));
        assertNotNull(address);
        assertArrayEquals(bytes, ask("GET", path(address)).body);
        assertArrayEquals(Arrays.copyOfRange(bytes, 4000, 4100), ask("GET", path(address), "Range: bytes=4000-4099").body);
    }
}
