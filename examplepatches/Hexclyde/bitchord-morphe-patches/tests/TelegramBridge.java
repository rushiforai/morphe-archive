package app.bitchord.telegram;

// Fake TDLib bridge for host tests.
import org.drinkless.tdlib.TdApi;
import org.json.JSONObject;

import java.io.*;
import java.util.*;
import java.util.concurrent.*;

final class TelegramBridge {
    void played(String id) {}

    final TrackNames names = new TrackNames(null);
    final List<String> heard = new ArrayList<>();

    void heard(String title, String artist, long durationMs, String mediaId) {
        heard.add(title + "|" + artist + "|" + durationMs + "|" + mediaId);
    }

    final FormatProbe formats = new FormatProbe(null);

    void probeLater(JSONObject row) {}

    boolean formatLegend = true;

    boolean formatLegend() {
        return formatLegend;
    }

    void setFormatLegend(boolean on) {
        formatLegend = on;
    }

    boolean reportQuality = true;
    final List<List<JSONObject>> artworkRequests = new ArrayList<>();

    boolean reportQuality() {
        return reportQuality;
    }

    void decorate(List<JSONObject> rows) {
        artworkRequests.add(rows);
    }

    static int setupOpens;

    public static void openSetup() {
        setupOpens++;
    }

    public static int resourceId(String name, String type) {
        return 1;
    }

    final Set<Long> selected = ConcurrentHashMap.newKeySet();
    static TelegramBridge instance;
    long generation = 1, mediaRevision;

    void verifyMedia(long chat, long message, int file) throws Exception {
        requireReady();
        if (!mediaAllowed || resolveTrack(chat + "_" + message) == null)
            throw new IOException("Media unavailable");
    }

    String sessionTag = "test-session";
    final NativeAudio audioReader = new NativeAudio(this);
    final NativeAudio audioManager = audioReader;
    final File file;
    final NativeAudio audio = audioReader;
    final long length = 5L * 1024 * 1024 + 31;

    boolean signedIn = true, mediaAllowed = true;
    final LiveSearch remoteSearch = new LiveSearch((request, timeout) -> call(request));
    long offset, limit;
    int polls, downloads, optimizations;
    boolean revokeOnPrefix, changeTagAfterSearch;
    int cancellations;
    final Map<Long, Long> available = new TreeMap<>();
    long cacheLimit = CachePolicy.DEFAULT_BYTES, lastOptimized;

    long cacheLimitBytes() {
        return cacheLimit;
    }

    TelegramBridge(File audio) throws Exception {
        this.file = audio;
        instance = this;
        try (RandomAccessFile f = new RandomAccessFile(audio, "rw")) {
            f.setLength(length);
        }
        selected.add(10L);
    }

    String url() {
        return InternalAddon.ORIGIN + sessionTag;
    }

    void requireReady() throws IOException {
        if (!signedIn) throw new IOException("Sign in first");
    }

    List<JSONObject> searchTracks(String query) throws Exception {
        requireReady();
        List<JSONObject> result = remoteSearch.search(new HashSet<>(selected), query, 1).tracks;
        if (changeTagAfterSearch) {
            changeTagAfterSearch = false;
            sessionTag = "changed-during-search";
        }
        return result;
    }

    JSONObject resolveTrack(String id) throws Exception {
        requireReady();
        return TrackMetadata.resolve(
                id, selected, (chat, message) -> call(new TdApi.GetMessage(chat, message)));
    }

    void cancelDownload(int id) {
        cancellations++;
    }

    void optimize(long bytes) {
        optimizations++;
        lastOptimized = bytes;
    }

    <T extends TdApi.Object> T call(TdApi.Function<T> fn, long timeout) throws Exception {
        return call(fn);
    }

    @SuppressWarnings("unchecked")
    synchronized <T extends TdApi.Object> T call(TdApi.Function<T> fn) throws Exception {
        if (fn instanceof TdApi.GetMessage) {
            TdApi.GetMessage get = (TdApi.GetMessage) fn;
            return get.chatId == 10 && get.messageId == 20
                    ? (T) TestMessages.audio(10, 20, "Test Song")
                    : null;
        }
        if (fn instanceof TdApi.SearchChatMessages) {
            TdApi.SearchChatMessages search = (TdApi.SearchChatMessages) fn;
            boolean match =
                    search.chatId == 10
                            && search.filter instanceof TdApi.SearchMessagesFilterAudio
                            && ("test song artist".contains(search.query.toLowerCase(Locale.ROOT)));
            return (T)
                    new TdApi.FoundChatMessages(
                            match ? 1 : 0,
                            match
                                    ? new TdApi.Message[] {TestMessages.audio(10, 20, "Test Song")}
                                    : new TdApi.Message[0],
                            0);
        }
        if (fn instanceof TdApi.GetFile) return (T) file();
        if (fn instanceof TdApi.DownloadFile) {
            TdApi.DownloadFile d = (TdApi.DownloadFile) fn;
            offset = d.offset;
            limit = d.limit;
            polls = 0;
            downloads++;
            return (T) file();
        }
        if (fn instanceof TdApi.GetFileDownloadedPrefixSize) {
            long pos = ((TdApi.GetFileDownloadedPrefixSize) fn).offset;
            TdApi.FileDownloadedPrefixSize prefix = new TdApi.FileDownloadedPrefixSize();
            for (Map.Entry<Long, Long> e : available.entrySet())
                if (pos >= e.getKey() && pos < e.getValue()) prefix.size = e.getValue() - pos;
            if (prefix.size == 0
                    && limit > 0
                    && ++polls > 1
                    && pos >= offset
                    && pos < offset + limit) {
                try (RandomAccessFile f = new RandomAccessFile(file, "rw")) {
                    byte[] bytes = new byte[(int) limit];
                    for (int i = 0; i < bytes.length; i++) bytes[i] = expected(offset + i);
                    f.seek(offset);
                    f.write(bytes);
                }
                available.put(offset, offset + limit);
                prefix.size = offset + limit - pos;
                if (revokeOnPrefix) {
                    revokeOnPrefix = false;
                    generation++;
                    sessionTag = "changed";
                }
            }
            return (T) prefix;
        }
        throw new AssertionError("Unexpected request " + fn.getClass());
    }

    TdApi.File file() {
        TdApi.File f = new TdApi.File();
        f.id = 7;
        f.size = length;
        f.local = new TdApi.LocalFile();
        f.local.path = file.getAbsolutePath();
        return f;
    }

    static byte expected(long offset) {
        return (byte) ((offset * 17 + 13) % 251);
    }
}
