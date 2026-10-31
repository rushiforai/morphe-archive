package app.bitchord.telegram;

import org.json.*;

import java.io.*;
import java.nio.file.*;
import java.util.*;

public final class NativeAudioTest {
    static int checks;

    static void check(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }

    interface Task {
        void run() throws Exception;
    }

    static void denied(Task task, String why) throws Exception {
        try {
            task.run();
            throw new AssertionError("Accepted " + why);
        } catch (IOException | IllegalArgumentException expected) {
            checks++;
        }
    }

    static byte[] bytes(NativeAudio.Reader reader) throws Exception {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] block = new byte[8191];
        int n;
        while ((n = reader.read(block, 0, block.length)) != -1) out.write(block, 0, n);
        return out.toByteArray();
    }

    static void content(byte[] data, long start, long length) {
        check(data.length == length, "Exact read length");
        for (int i = 0; i < data.length; i++)
            if (data[i] != TelegramBridge.expected(start + i))
                throw new AssertionError("Sparse or corrupt bytes at " + (start + i));
        checks++;
    }

    public static void main(String[] args) throws Exception {
        File file = Files.createTempFile("native-telegram-", ".audio").toFile();
        TelegramBridge bridge = new TelegramBridge(file);
        NativeAudio audio = bridge.audio;
        String url = bridge.url() + "/audio/10_20";
        try {
            check(
                    InternalAddon.bodyOrNull("https://example.com/search?q=test") == null,
                    "External addon metadata stays external");
            check(InternalAddon.reserved(url), "Reserved native identifier recognized");
            check(
                    new JSONObject(InternalAddon.body(bridge, bridge.url() + "/manifest.json"))
                            .getString("version")
                            .equals("1.0.20"),
                    "Native manifest");
            check(
                    new JSONObject(InternalAddon.body(bridge, bridge.url() + "/search?q=Test"))
                                    .getJSONArray("tracks")
                                    .length()
                            == 1,
                    "Direct typed Telegram search");
            JSONObject found =
                    new JSONObject(InternalAddon.body(bridge, bridge.url() + "/search?q=Test"))
                            .getJSONArray("tracks")
                            .getJSONObject(0);
            check(
                    found.getString("audioQuality").equals("LOSSLESS")
                            && !found.has("artworkURL")
                            && bridge.artworkRequests.size() == 2,
                    "Search reports FLAC as lossless and asks for covers");
            bridge.reportQuality = false;
            check(
                    !new JSONObject(InternalAddon.body(bridge, bridge.url() + "/search?q=Test"))
                            .getJSONArray("tracks")
                            .getJSONObject(0)
                            .has("audioQuality"),
                    "Quality can be turned off");
            check(
                    !new JSONObject(
                                    InternalAddon.body(
                                            bridge,
                                            bridge.url() + "/stream/10_20?quality=LOSSLESS"))
                            .has("audioQuality"),
                    "Stream quality can be turned off");
            bridge.reportQuality = true;
            bridge.changeTagAfterSearch = true;
            denied(
                    () -> InternalAddon.body(bridge, bridge.url() + "/search?q=test"),
                    "session change while metadata is fetched");
            bridge.sessionTag = "test-session";
            String stream =
                    new JSONObject(
                                    InternalAddon.body(
                                            bridge,
                                            bridge.url() + "/stream/10_20?quality=LOSSLESS"))
                            .getString("url");
            check(stream.equals(url), "Direct stream resolution uses current session");
            JSONObject streamed =
                    new JSONObject(
                            InternalAddon.body(
                                    bridge, bridge.url() + "/stream/10_20?quality=LOSSLESS"));
            check(
                    streamed.getString("audioQuality").equals("LOSSLESS")
                            && streamed.getInt("bitrate") == 139_000,
                    "Stream reports quality and bitrate, in bits a second as BitChord reads it");
            check(
                    new JSONObject(
                                            InternalAddon.body(
                                                    bridge,
                                                    bridge.url()
                                                            + "/search?q=%27+OR+1%3D1%3B%24%28id%29"))
                                    .getJSONArray("tracks")
                                    .length()
                            == 0,
                    "Query metacharacters remain text");
            denied(
                    () -> InternalAddon.body(bridge, bridge.url() + "/search?q=a&q=b"),
                    "duplicate query");
            for (String value :
                    new String[] {
                        "http://telegram.bitchord.invalid/test-session/audio/10_20",
                        "https://telegram.bitchord.invalid:443/test-session/audio/10_20",
                        "https://user@telegram.bitchord.invalid/test-session/audio/10_20",
                        url + "#x",
                        url + "?x=1",
                        bridge.url() + "/audio/../config.json",
                        bridge.url() + "/audio/%31%30_20",
                        bridge.url() + "/audio/010_20",
                        bridge.url() + "/audio/10_020",
                        bridge.url() + "/audio/0_0",
                        bridge.url() + "/audio/10_20/extra",
                        bridge.url() + "/audio/999_20"
                    }) denied(() -> audio.open(value, 0, 1), "malformed or out-of-scope reference");
            check(
                    !audio.active()
                            && audio.slots.availablePermits() == 3
                            && audio.leases.isEmpty(),
                    "Rejected requests release all resources");
            denied(() -> audio.open(url, -1, 1), "negative position");
            denied(() -> audio.open(url, 0, -2), "invalid length");
            denied(() -> audio.open(url, bridge.length + 1, 1), "past EOF");
            try (NativeAudio.Reader reader = audio.open(url, bridge.length, -1)) {
                check(
                        reader.remaining() == 0 && reader.read(new byte[1], 0, 1) == -1,
                        "Open at EOF is valid");
                check(reader.read(new byte[0], 0, 0) == 0, "Zero-length EOF read");
            }
            try (NativeAudio.Reader reader = audio.open(url, 12345, 1234)) {
                check(reader.remaining() == 1234, "Bounded seek length");
                content(bytes(reader), 12345, 1234);
                check(reader.read(new byte[1], 0, 1) == -1, "EOF remains EOF");
            }
            try (NativeAudio.Reader reader = audio.open(url, bridge.length - 17, Long.MAX_VALUE)) {
                content(bytes(reader), bridge.length - 17, 17);
            }
            try (NativeAudio.Reader reader = audio.open(url, 0, -1)) {
                content(bytes(reader), 0, bridge.length);
            }
            check(bridge.downloads >= 2, "Reads fetch bounded native windows");
            check(!audio.active() && audio.leases.isEmpty(), "Completed readers release leases");
            NativeAudio.Reader first = audio.open(url, 0, 32),
                    second = audio.open(url, 100, 32),
                    third = audio.open(url, 200, 32);
            denied(() -> audio.open(url, 0, 1), "fourth simultaneous reader");
            check(
                    audio.leases.size() == 1
                            && audio.leases.values().iterator().next().readers == 3,
                    "Same file shares a bounded lease");
            int cancellations = bridge.cancellations;
            first.close();
            first.close();
            check(
                    bridge.cancellations == cancellations,
                    "Closing one reader does not cancel its siblings");
            content(bytes(second), 100, 32);
            second.close();
            check(
                    bridge.cancellations == cancellations,
                    "Penultimate reader preserves remaining stream");
            third.close();
            check(bridge.cancellations == cancellations + 1, "Last reader cancels native download");
            check(
                    audio.slots.availablePermits() == 3
                            && !audio.active()
                            && audio.leases.isEmpty(),
                    "Double close and concurrent readers leave clean accounting");
            bridge.cacheLimit = 8L * 1024 * 1024 * 1024;
            check(
                    audio.applyCacheLimit() && bridge.lastOptimized == bridge.cacheLimit,
                    "8 GiB cache target stays 64-bit");
            try (NativeAudio.Reader reader = audio.open(url, 0, 5)) {
                int before = bridge.optimizations;
                check(
                        !audio.applyCacheLimit() && before == bridge.optimizations,
                        "Cache trim waits for active playback");
                denied(audio::clearCache, "cache clear during active read");
            }
            audio.clearCache();
            check(bridge.lastOptimized == 0, "Idle cache clear reaches TDLib");
            try (NativeAudio.Reader reader = audio.open(url, 0, 10)) {
                bridge.mediaAllowed = false;
                bridge.mediaRevision++;
                denied(
                        () -> reader.read(new byte[1], 0, 1),
                        "protected/deleted message during active read");
            }
            bridge.mediaAllowed = true;
            bridge.mediaRevision++;
            try (NativeAudio.Reader reader = audio.open(url, 0, 10)) {
                bridge.mediaAllowed = false;
                reader.checkedAt = 0;
                denied(
                        () -> reader.read(new byte[1], 0, 1),
                        "periodic permission recheck without update");
            }
            bridge.mediaAllowed = true;
            NativeAudio.Reader removed = audio.open(url, 0, 10);
            bridge.selected.clear();
            denied(() -> removed.read(new byte[10], 0, 10), "deselected active chat");
            removed.close();
            denied(() -> audio.open(url, 0, 1), "deselected open");
            bridge.selected.add(10L);
            NativeAudio.Reader signedOut = audio.open(url, 0, 10);
            bridge.signedIn = false;
            denied(() -> signedOut.read(new byte[10], 0, 10), "signed-out active read");
            signedOut.close();
            denied(
                    () -> InternalAddon.body(bridge, bridge.url() + "/search?q=test"),
                    "signed-out search");
            bridge.signedIn = true;
            NativeAudio.Reader old = audio.open(url, 0, 10);
            bridge.generation++;
            denied(() -> old.read(new byte[10], 0, 10), "changed generation");
            old.close();
            String tag = bridge.sessionTag;
            bridge.sessionTag = "new-session";
            denied(() -> audio.open(url, 0, 1), "stale session marker");
            denied(
                    () -> InternalAddon.body(bridge, InternalAddon.ORIGIN + tag + "/search?q=test"),
                    "stale metadata marker");
            bridge.sessionTag = tag;
            bridge.available.clear();
            bridge.limit = 0;
            bridge.revokeOnPrefix = true;
            try (NativeAudio.Reader reader = audio.open(url, 1234, 32)) {
                denied(() -> reader.read(new byte[32], 0, 32), "reconnect during prefix fetch");
            }
            bridge.sessionTag = tag;
            try (NativeAudio.Reader reader = audio.open(url, 0, 10)) {
                reader.cancellation =
                        () -> {
                            throw new java.util.concurrent.CancellationException();
                        };
                try {
                    reader.read(new byte[1], 0, 1);
                    throw new AssertionError("Cancellation ignored");
                } catch (java.util.concurrent.CancellationException expected) {
                    checks++;
                }
            }
            for (int i = 0; i < 100; i++)
                try (NativeAudio.Reader reader = audio.open(url, i, 1)) {
                    reader.read(new byte[1], 0, 1);
                }
            check(
                    audio.leases.isEmpty() && audio.slots.availablePermits() == 3,
                    "Repeated open/close does not grow the file-lock map");
            System.out.println(
                    "PASS: "
                            + checks
                            + " private metadata, byte-range, sparse-file, revocation, concurrency"
                            + " and cache checks.");
        } finally {
            bridge.remoteSearch.close();
            file.delete();
        }
    }
}
