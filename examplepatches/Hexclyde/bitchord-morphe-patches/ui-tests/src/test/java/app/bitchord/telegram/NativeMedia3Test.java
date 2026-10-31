package app.bitchord.telegram;

import static org.junit.Assert.*;

import android.net.Uri;

import androidx.media3.database.StandaloneDatabaseProvider;
import androidx.media3.datasource.*;
import androidx.media3.datasource.cache.*;

import org.drinkless.tdlib.TdApi;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

import java.io.*;
import java.nio.file.*;
import java.util.*;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 35)
public class NativeMedia3Test {
    TelegramBridge bridge;
    File file;
    long total = 131103;
    String url;
    int nativeCalls, networkOpens, transferred, starts, ends;
    boolean badSink;

    @Before
    public void setup() throws Exception {
        bridge = new TelegramBridge();
        TelegramBridge.instance = bridge;
        bridge.auth = new TdApi.AuthorizationStateReady();
        bridge.selected.add(10L);
        file = File.createTempFile("telegram-media3-", ".audio");
        try (RandomAccessFile f = new RandomAccessFile(file, "rw")) {
            f.setLength(total);
        }
        bridge.backend =
                request -> {
                    nativeCalls++;
                    if (request instanceof TdApi.GetMessage) {
                        TdApi.Message m = new TdApi.Message();
                        m.canBeSaved = true;
                        m.id = 20;
                        m.chatId = 10;
                        TdApi.Audio a = new TdApi.Audio();
                        a.audio = nativeFile();
                        a.fileName = "Test.flac";
                        a.mimeType = "audio/flac";
                        a.title = "Test";
                        a.performer = "Artist";
                        TdApi.MessageAudio content = new TdApi.MessageAudio();
                        content.audio = a;
                        m.content = content;
                        return m;
                    }
                    if (request instanceof TdApi.GetFile) return nativeFile();
                    if (request instanceof TdApi.DownloadFile) {
                        TdApi.DownloadFile d = (TdApi.DownloadFile) request;
                        try (RandomAccessFile f = new RandomAccessFile(file, "rw")) {
                            f.seek(d.offset);
                            for (long i = d.offset; i < Math.min(total, d.offset + d.limit); i++)
                                f.write((int) ((i * 17 + 13) % 251));
                        }
                        return nativeFile();
                    }
                    if (request instanceof TdApi.GetFileDownloadedPrefixSize) {
                        TdApi.FileDownloadedPrefixSize p = new TdApi.FileDownloadedPrefixSize();
                        long offset = ((TdApi.GetFileDownloadedPrefixSize) request).offset;
                        // The first query reports no bytes. DownloadFile writes the requested
                        // range.
                        try (RandomAccessFile f = new RandomAccessFile(file, "r")) {
                            f.seek(offset);
                            p.size =
                                    f.read() == (int) ((offset * 17 + 13) % 251)
                                            ? total - offset
                                            : 0;
                        }
                        return p;
                    }
                    throw new AssertionError(request.getClass());
                };
        url = bridge.url() + "/audio/10_20";
    }

    TdApi.File nativeFile() {
        TdApi.File f = new TdApi.File();
        f.id = 7;
        f.size = total;
        f.local = new TdApi.LocalFile();
        f.local.path = file.getAbsolutePath();
        return f;
    }

    @After
    public void cleanup() {
        bridge.work.shutdownNow();
        file.delete();
        TelegramBridge.instance = null;
    }

    DataSpec spec(String value, long start, long length) {
        return new DataSpec.Builder()
                .setUri(Uri.parse(value))
                .setPosition(start)
                .setLength(length)
                .setKey("test-track")
                .build();
    }

    byte[] read(DataSource source) throws Exception {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] b = new byte[4093];
        int n;
        while ((n = source.read(b, 0, b.length)) != -1) out.write(b, 0, n);
        return out.toByteArray();
    }

    void content(byte[] bytes, long start, int length) {
        assertEquals(length, bytes.length);
        for (int i = 0; i < length; i++)
            assertEquals("byte " + i, (byte) (((start + i) * 17 + 13) % 251), bytes[i]);
    }

    DataSource spy() {
        return new DataSource() {
            Uri uri;
            int remaining;

            public void addTransferListener(TransferListener l) {}

            public long open(DataSpec s) {
                networkOpens++;
                uri = s.uri;
                remaining = 4;
                return 4;
            }

            public int read(byte[] b, int o, int n) {
                if (n == 0) return 0;
                if (remaining == 0) return -1;
                int count = Math.min(n, remaining);
                Arrays.fill(b, o, o + count, (byte) 7);
                remaining -= count;
                return count;
            }

            public Uri getUri() {
                return uri;
            }

            public Map<String, List<String>> getResponseHeaders() {
                return Collections.emptyMap();
            }

            public void close() {
                uri = null;
            }
        };
    }

    @Test
    public void playbackAcknowledgementFollowsActualPlayerState() {
        final androidx.media3.common.MediaItem[] current = {
            new androidx.media3.common.MediaItem.Builder()
                    .setMediaId("src:telegram-native::10_20")
                    .build()
        };
        final boolean[] playing = {false};
        final long[] duration = {androidx.media3.common.C.TIME_UNSET};
        androidx.media3.common.Player player =
                (androidx.media3.common.Player)
                        java.lang.reflect.Proxy.newProxyInstance(
                                getClass().getClassLoader(),
                                new Class[] {androidx.media3.common.Player.class},
                                (proxy, method, args) ->
                                        method.getName().equals("getCurrentMediaItem")
                                                ? current[0]
                                                : method.getName().equals("isPlaying")
                                                        ? playing[0]
                                                        : method.getName().equals("getDuration")
                                                                ? duration[0]
                                                                : null);
        PlaybackPolicy.onState(player, false);
        PlaybackPolicy.onTransition(player);
        assertEquals(0, bridge.played);
        playing[0] = true;
        PlaybackPolicy.onState(player, true);
        assertEquals(1, bridge.played);
        assertEquals("10_20", bridge.playedId);
        current[0] =
                new androidx.media3.common.MediaItem.Builder()
                        .setMediaId("src:telegram-native::10_21")
                        .build();
        PlaybackPolicy.onTransition(player);
        assertEquals(2, bridge.played);
        assertEquals("10_21", bridge.playedId);
        assertTrue("Telegram tracks are not checked for misnamed copies", bridge.heard.isEmpty());
        current[0] =
                new androidx.media3.common.MediaItem.Builder().setMediaId("youtube-id").build();
        PlaybackPolicy.onState(player, true);
        assertEquals(2, bridge.played);
        assertTrue("Unknown length is skipped until the player knows it", bridge.heard.isEmpty());
        current[0] =
                new androidx.media3.common.MediaItem.Builder()
                        .setMediaId("youtube-id")
                        .setMediaMetadata(
                                new androidx.media3.common.MediaMetadata.Builder()
                                        .setTitle("One More Light")
                                        .setArtist("Linkin Park")
                                        .build())
                        .build();
        PlaybackPolicy.onState(player, false);
        assertTrue("Paused items are ignored", bridge.heard.isEmpty());
        duration[0] = 254_000;
        PlaybackPolicy.onState(player, true);
        assertEquals(
                java.util.Arrays.asList("One More Light|Linkin Park|254000|youtube-id"),
                bridge.heard);
        duration[0] = androidx.media3.common.C.TIME_UNSET;
        current[0] =
                current[0]
                        .buildUpon()
                        .setMediaMetadata(
                                current[0]
                                        .mediaMetadata
                                        .buildUpon()
                                        .setDurationMs(171_000L)
                                        .build())
                        .build();
        PlaybackPolicy.onTransition(player);
        assertEquals(2, bridge.heard.size());
        assertEquals("One More Light|Linkin Park|171000|youtube-id", bridge.heard.get(1));
        PlaybackPolicy.onState(null, true);
    }

    @Test
    @Config(sdk = {26, 35, 36})
    public void actualMedia3RangesListenersAndRouting() throws Exception {
        DataSource source = TelegramDataSource.wrap(spy());
        source.addTransferListener(
                new TransferListener() {
                    public void onTransferInitializing(DataSource s, DataSpec d, boolean n) {}

                    public void onTransferStart(DataSource s, DataSpec d, boolean n) {
                        starts++;
                    }

                    public void onBytesTransferred(DataSource s, DataSpec d, boolean n, int b) {
                        transferred += b;
                    }

                    public void onTransferEnd(DataSource s, DataSpec d, boolean n) {
                        ends++;
                    }
                });
        assertEquals(7777, source.open(spec(url, 1234, 7777)));
        assertEquals(Uri.parse(url), source.getUri());
        content(read(source), 1234, 7777);
        source.close();
        source.close();
        assertEquals(1, starts);
        assertEquals(1, ends);
        assertEquals(7777, transferred);
        assertEquals(0, networkOpens);
        assertFalse(bridge.audio.active());
        source.open(spec("https://example.com/song.flac", 0, -1));
        assertArrayEquals(new byte[] {7, 7, 7, 7}, read(source));
        source.close();
        assertEquals(1, networkOpens);
    }

    @Test
    public void resolutionAndHostStyleCacheStayAboveNativeReader() throws Exception {
        File directory = Files.createTempDirectory("telegram-media3-cache").toFile();
        StandaloneDatabaseProvider db =
                new StandaloneDatabaseProvider(RuntimeEnvironment.getApplication());
        SimpleCache cache =
                new SimpleCache(directory, new LeastRecentlyUsedCacheEvictor(1024 * 1024), db);
        try {
            DataSource.Factory resolving =
                    new ResolvingDataSource.Factory(
                            () -> TelegramDataSource.wrap(spy()), s -> s.withUri(Uri.parse(url)));
            DataSource.Factory androidDefault =
                    new DefaultDataSource.Factory(RuntimeEnvironment.getApplication(), resolving);
            CacheDataSource.Factory factory =
                    new CacheDataSource.Factory()
                            .setCache(cache)
                            .setUpstreamDataSourceFactory(androidDefault);
            DataSpec original =
                    spec("bitchord://source?config=telegram-native&track=10_20", 0, 65536);
            DataSource source = factory.createDataSource();
            source.open(original);
            content(read(source), 0, 65536);
            source.close();
            int calls = nativeCalls;
            assertTrue(cache.isCached("test-track", 0, 65536));
            source = factory.createDataSource();
            source.open(original);
            content(read(source), 0, 65536);
            source.close();
            assertEquals("Second read uses the existing Media3 cache", calls, nativeCalls);
            source = factory.createDataSource();
            source.open(spec(original.uri.toString(), 100000, 1234));
            content(read(source), 100000, 1234);
            source.close();
            assertEquals(0, networkOpens);
        } finally {
            cache.release();
            db.close();
        }
    }

    @Test
    public void staleAndMalformedNativeIdentifiersNeverFallThroughToHttp() throws Exception {
        for (String value :
                new String[] {
                    url.replace("https:", "http:"),
                    url.replace(".invalid/", ".invalid:443/"),
                    url + "?x=1",
                    url.replace(bridge.sessionTag, "old-session")
                }) {
            DataSource source = TelegramDataSource.wrap(spy());
            try {
                source.open(spec(value, 0, 1));
                fail("Accepted " + value);
            } catch (IOException expected) {
            } finally {
                source.close();
            }
        }
        assertEquals(0, networkOpens);
        assertFalse(bridge.audio.active());
    }

    @Test
    public void explicitDownloadUsesNativeReaderAndHonoursCancellation() throws Exception {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        long[] progress = {0};
        assertEquals(
                Long.valueOf(total),
                NativeDownloads.fetch(
                        url,
                        output,
                        (written, size) -> {
                            progress[0] = written;
                            return kotlin.Unit.INSTANCE;
                        },
                        kotlin.coroutines.EmptyCoroutineContext.INSTANCE));
        content(output.toByteArray(), 0, (int) total);
        assertEquals(total, progress[0]);
        assertEquals(0, networkOpens);
        kotlinx.coroutines.CompletableJob job = kotlinx.coroutines.JobKt.Job(null);
        job.cancel(new java.util.concurrent.CancellationException("test"));
        try {
            NativeDownloads.fetch(
                    url, new ByteArrayOutputStream(), (written, size) -> kotlin.Unit.INSTANCE, job);
            fail("Cancelled download accepted");
        } catch (java.util.concurrent.CancellationException expected) {
        }
        assertFalse(bridge.audio.active());
        kotlinx.coroutines.CompletableJob during = kotlinx.coroutines.JobKt.Job(null);
        ByteArrayOutputStream partial = new ByteArrayOutputStream();
        try {
            NativeDownloads.fetch(
                    url,
                    partial,
                    (written, size) -> {
                        during.cancel(
                                new java.util.concurrent.CancellationException("during transfer"));
                        return kotlin.Unit.INSTANCE;
                    },
                    during);
            fail("In-flight cancellation ignored");
        } catch (java.util.concurrent.CancellationException expected) {
        }
        assertTrue(partial.size() > 0 && partial.size() < total);
        assertFalse(bridge.audio.active());
        assertEquals(3, bridge.audio.slots.availablePermits());
    }
}
