package app.nogoogle.gboard;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.os.StatFs;
import android.util.Log;

import app.nogoogle.gboard.gif.GifBridge;
import app.nogoogle.gboard.voice.Models;
import app.nogoogle.gboard.voice.NativeEngine;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Downloads the voice and translation models through the network helper app (Gboard has no network
 * access). Every file is checked against its published SHA-256 and resumed where it broke off; the
 * voice model, published as q8_0 only, is converted to q4_0, the type with fast ARM kernels.
 */
public final class ModelDownloads {
    private static final String TAG = "NoGoogleModels";
    private static final String HF = "https://huggingface.co/";
    private static final String MOZILLA_RECORDS =
            "https://firefox.settings.services.mozilla.com/v1/buckets/main/collections/translations-models/records";
    private static final String MOZILLA_FILES = "https://firefox-settings-attachments.cdn.mozilla.net/";

    /** A model that is one file (after an optional conversion). */
    public static final class Item {
        public final String id;
        public final String label;
        public final long downloadBytes;
        public final long installedBytes;
        final String url;
        final String sha256;
        final String installedSha256;
        final String subdir;
        final String file;
        final boolean toQ4;

        Item(String id, String label, String url, String sha256, long downloadBytes, String subdir,
             String file, boolean toQ4, String installedSha256, long installedBytes) {
            this.id = id;
            this.label = label;
            this.url = url;
            this.sha256 = sha256;
            this.downloadBytes = downloadBytes;
            this.subdir = subdir;
            this.file = file;
            this.toQ4 = toQ4;
            this.installedSha256 = installedSha256;
            this.installedBytes = installedBytes;
        }

        public File target() {
            File d = new File(NoGoogleSettings.modelsDir(), subdir);
            //noinspection ResultOfMethodCallIgnored
            d.mkdirs();
            return new File(d, file);
        }

        public boolean installed() {
            return target().isFile();
        }
    }

    public static final List<Item> ITEMS = Collections.unmodifiableList(java.util.Arrays.asList(
            new Item("whisper", "Voice typing: Whisper large-v3-turbo (ACFT)",
                    HF + "DeadBranches/acft-whisper-large-v3-turbo_q8_0/resolve/main/acft-whisper-large-v3-turbo-q8_0.bin",
                    "6d862034d882b83f76366fefc1bd750cef2057d2c644378c46e41e90b0331a72", 874188075L,
                    "whisper", "acft-whisper-large-v3-turbo-q4_0.bin", true,
                    "6371cc24fab08a108c32eab946129d59d3bcfeb7a77cf4c09a9b61300bc82b09", 473992235L),
            new Item("vad", "Voice typing: Silero speech detector",
                    HF + "ggml-org/whisper-vad/resolve/main/ggml-silero-v6.2.0.bin",
                    "2aa269b785eeb53a82983a20501ddf7c1d9c48e33ab63a41391ac6c9f7fb6987", 885098L,
                    "vad", "ggml-silero-v6.2.0.bin", false, null, 885098L),
            new Item("hymt", "Translation: Tencent Hy-MT2 1.8B",
                    HF + "tencent/Hy-MT2-1.8B-GGUF/resolve/main/Hy-MT2-1.8B-Q4_K_M.gguf",
                    "dc5f44fcf1fa496ee7ad725982c0c8c553a4de00259b53af84c4b89fb0c06699", 1133080448L,
                    "llm", "hymt2-1.8b-q4km.gguf", false, null, 1133080448L)));

    /** UI callback, on the main thread, whenever a download's state changes. */
    public interface Listener {
        void changed();
    }

    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "nogoogle-models");
        t.setDaemon(true);
        return t;
    });
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<String, String> STATE = Collections.synchronizedMap(new TreeMap<>());
    private static volatile Listener listener;
    private static volatile String stopping;

    private ModelDownloads() {
    }

    public static void setListener(Listener l) {
        listener = l;
    }

    /** "Downloading 40% ...", "Failed: ...", or null when idle. */
    public static String state(String id) {
        return STATE.get(id);
    }

    /** A running or failed language download ("he: Downloading 40% ..."), or null. */
    public static String languageState() {
        synchronized (STATE) {
            for (Map.Entry<String, String> e : STATE.entrySet()) {
                if (e.getKey().startsWith("lang-")) return e.getKey().substring(5) + ": " + e.getValue();
            }
        }
        return null;
    }

    /** Some download or conversion is running. */
    public static boolean anyBusy() {
        for (String s : STATE.values()) if (!s.startsWith("Failed")) return true;
        return false;
    }

    public static boolean busy(String id) {
        String s = STATE.get(id);
        return s != null && !s.startsWith("Failed");
    }

    private static void set(String id, String state) {
        if (state == null) STATE.remove(id);
        else STATE.put(id, state);
        Listener l = listener;
        if (l != null) MAIN.post(l::changed);
    }

    public static void stop(String id) {
        stopping = id;
    }

    public static void download(Item item) {
        if (busy(item.id)) return;
        set(item.id, "Waiting…");
        WORKER.execute(() -> {
            if (stoppedBeforeStart(item.id)) return;
            try {
                File target = item.target();
                long need = item.downloadBytes + (item.toQ4 ? item.installedBytes : 0);
                if (new StatFs(target.getParent()).getAvailableBytes() < need + (64 << 20)) {
                    throw new IOException("not enough free space (" + mb(need) + " needed)");
                }
                if (item.toQ4) {
                    // Not "*.bin": the voice settings list every .bin file as a model.
                    File q8 = new File(target.getParentFile(), "acft-q8_0.download");
                    fetchFile(item.id, item.url, q8, item.sha256, item.downloadBytes);
                    set(item.id, "Converting for this phone…");
                    File part = new File(target.getPath() + ".part");
                    if (!NativeEngine.load() || !NativeEngine.whisperToQ4(q8.getPath(), part.getPath())) {
                        part.delete();
                        throw new IOException("conversion failed");
                    }
                    q8.delete();
                    if (!item.installedSha256.equals(sha256(part))) {
                        part.delete();
                        throw new IOException("converted file does not match");
                    }
                    rename(part, target);
                } else {
                    fetchFile(item.id, item.url, target, item.sha256, item.downloadBytes);
                }
                set(item.id, null);
            } catch (Throwable t) {
                Log.w(TAG, "download failed: " + item.id, t);
                set(item.id, stopping(item.id) ? null : "Failed: " + t.getMessage());
            }
        });
    }

    public static boolean delete(Item item) {
        return item.target().delete();
    }

    /** A language with Firefox Translations models to and from English. */
    public static final class Language {
        public final String code;
        final List<JSONObject> records = new ArrayList<>();

        Language(String code) {
            this.code = code;
        }

        public String name() {
            return Locale.forLanguageTag(code).getDisplayName();
        }

        public long bytes() {
            long sum = 0;
            for (JSONObject r : records) sum += r.optJSONObject("attachment").optLong("size");
            return sum;
        }

        public boolean installed() {
            for (JSONObject r : records) if (!file(r).isFile()) return false;
            return !records.isEmpty();
        }
    }

    /** The languages Mozilla publishes (newest model per pair and file), off the main thread. */
    public static List<Language> languages() throws Exception {
        byte[] json = fetchBytes(MOZILLA_RECORDS);
        JSONArray data = new JSONObject(new String(json, StandardCharsets.UTF_8)).getJSONArray("data");
        Map<String, JSONObject> newest = new TreeMap<>(); // "from-to/fileType" -> record
        for (int i = 0; i < data.length(); i++) {
            JSONObject r = data.getJSONObject(i);
            String key = r.optString("fromLang") + "-" + r.optString("toLang") + "/" + r.optString("fileType");
            JSONObject old = newest.get(key);
            if (r.optJSONObject("attachment") != null
                    && (old == null || compareVersions(r.optString("version"), old.optString("version")) > 0)) {
                newest.put(key, r);
            }
        }
        // Pairs with separate source/target vocabularies don't load in slimt (the Firefox engine here).
        java.util.Set<String> splitVocab = new java.util.HashSet<>();
        for (JSONObject r : newest.values()) {
            String type = r.optString("fileType");
            if (type.equals("srcvocab") || type.equals("trgvocab")) splitVocab.add(r.optString("fromLang") + "-" + r.optString("toLang"));
        }
        Map<String, Language> byCode = new TreeMap<>();
        for (JSONObject r : newest.values()) {
            String from = r.optString("fromLang"), to = r.optString("toLang");
            String type = r.optString("fileType");
            String code = "en".equals(from) ? to : "en".equals(to) ? from : null;
            if (code == null || code.isEmpty() || splitVocab.contains(from + "-" + to)) continue;
            if (!type.equals("model") && !type.equals("lex") && !type.equals("vocab")) continue;
            byCode.computeIfAbsent(code, Language::new).records.add(r);
        }
        List<Language> out = new ArrayList<>(byCode.values());
        out.sort((a, b) -> a.name().compareToIgnoreCase(b.name()));
        return out;
    }

    public static void download(Language language) {
        String id = "lang-" + language.code;
        if (busy(id)) return;
        set(id, "Waiting…");
        WORKER.execute(() -> {
            if (stoppedBeforeStart(id)) return;
            try {
                if (new StatFs(Models.translateDir().getPath()).getAvailableBytes() < language.bytes() + (64 << 20)) {
                    throw new IOException("not enough free space");
                }
                for (JSONObject r : language.records) {
                    JSONObject a = r.getJSONObject("attachment");
                    File f = file(r);
                    //noinspection ResultOfMethodCallIgnored
                    f.getParentFile().mkdirs();
                    if (f.isFile() && f.length() == a.optLong("size")) continue;
                    fetchFile(id, MOZILLA_FILES + a.getString("location"), f, a.getString("hash"), a.optLong("size"));
                }
                set(id, null);
            } catch (Throwable t) {
                Log.w(TAG, "download failed: " + id, t);
                set(id, stopping(id) ? null : "Failed: " + t.getMessage());
            }
        });
    }

    private static File file(JSONObject record) {
        String pair = record.optString("fromLang") + "-" + record.optString("toLang");
        return new File(new File(Models.translateDir(), pair), record.optString("name"));
    }

    public static void delete(Language language) {
        File dir = Models.translateDir();
        for (String pair : new String[]{language.code + "-en", "en-" + language.code}) {
            File d = new File(dir, pair);
            File[] files = d.listFiles();
            if (files != null) for (File f : files) f.delete();
            d.delete();
        }
    }

    /** True when a stop was requested for this download before it started. */
    private static boolean stoppedBeforeStart(String id) {
        if (!id.equals(stopping)) return false;
        stopping = null;
        set(id, null);
        return true;
    }

    private static boolean stopping(String id) {
        if (!id.equals(stopping)) return false;
        stopping = null;
        return true;
    }

    /** Downloads (resuming a .part file) and checks the SHA-256 before moving it into place. */
    private static void fetchFile(String id, String url, File target, String sha256, long size) throws Exception {
        File part = new File(target.getPath() + ".part");
        for (int attempt = 0; ; attempt++) {
            try {
                transfer(id, url, part, size);
                break;
            } catch (IOException e) {
                if (stopping(id) || attempt >= 3) throw e;
                Log.w(TAG, "retrying " + url + ": " + e.getMessage());
                Thread.sleep(2000L << attempt);
            }
        }
        set(id, "Checking…");
        if (!sha256.equalsIgnoreCase(sha256(part))) {
            part.delete();
            throw new IOException("download corrupted (checksum mismatch)");
        }
        rename(part, target);
    }

    private static void transfer(String id, String url, File part, long size) throws IOException {
        long from = part.isFile() ? part.length() : 0;
        ParcelFileDescriptor pfd = open(url, from);
        try (DataInputStream in = new DataInputStream(new FileInputStream(pfd.getFileDescriptor()))) {
            int code = in.readInt();
            long total = in.readLong();
            if (code != 200 && code != 206) throw new IOException("HTTP " + code);
            boolean append = code == 206 && from > 0;
            if (!append) from = 0;
            if (total <= 0) total = size;
            try (OutputStream out = new FileOutputStream(part, append)) {
                byte[] buf = new byte[256 << 10];
                long done = from;
                long shownAt = 0;
                int n;
                while ((n = in.read(buf)) > 0) {
                    if (id.equals(stopping)) throw new IOException("stopped");
                    out.write(buf, 0, n);
                    done += n;
                    if (done - shownAt >= (4 << 20) || done == total) {
                        shownAt = done;
                        set(id, String.format(Locale.ROOT, "Downloading %d%% (%s of %s)",
                                total > 0 ? done * 100 / total : 0, mb(done), mb(total)));
                    }
                }
            }
            pfd.checkError();
            if (size > 0 && part.length() != size) throw new IOException("incomplete download");
        } finally {
            close(pfd);
        }
    }

    private static byte[] fetchBytes(String url) throws IOException {
        ParcelFileDescriptor pfd = open(url, 0);
        try (DataInputStream in = new DataInputStream(new FileInputStream(pfd.getFileDescriptor()))) {
            int code = in.readInt();
            in.readLong();
            ByteArrayOutputStream out = new ByteArrayOutputStream(1 << 20);
            byte[] buf = new byte[64 << 10];
            int n;
            while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
            pfd.checkError();
            if (code != 200) throw new IOException("HTTP " + code);
            return out.toByteArray();
        } finally {
            close(pfd);
        }
    }

    private static void close(ParcelFileDescriptor pfd) throws IOException {
        try {
            pfd.close();
        } finally {
            GifBridge.endTransfer();
        }
    }

    private static ParcelFileDescriptor open(String url, long from) throws IOException {
        Context c = NoGoogleSettings.context();
        if (c == null) throw new IOException("no context");
        Uri u = new Uri.Builder().scheme("content").authority(GifBridge.HELPER).path("download")
                .appendQueryParameter("u", url).appendQueryParameter("from", String.valueOf(from)).build();
        GifBridge.beginTransfer(); // ended by close()
        try {
            ParcelFileDescriptor pfd = c.getContentResolver().openFileDescriptor(u, "r");
            if (pfd == null) throw new IOException("network helper unavailable");
            return pfd;
        } catch (FileNotFoundException | SecurityException e) {
            GifBridge.endTransfer();
            String m = String.valueOf(e.getMessage());
            throw new IOException(m.contains("No content provider") ? "install the network helper app (GIF settings)"
                    : e instanceof SecurityException ? "reinstall the network helper app (GIF settings)" : m);
        } catch (IOException | RuntimeException e) {
            GifBridge.endTransfer();
            throw e;
        }
    }

    private static String sha256(File f) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        try (InputStream in = new FileInputStream(f)) {
            byte[] buf = new byte[1 << 20];
            int n;
            while ((n = in.read(buf)) > 0) md.update(buf, 0, n);
        }
        StringBuilder sb = new StringBuilder();
        for (byte b : md.digest()) sb.append(String.format(Locale.ROOT, "%02x", b));
        return sb.toString();
    }

    private static void rename(File from, File to) throws IOException {
        //noinspection ResultOfMethodCallIgnored
        to.delete();
        if (!from.renameTo(to)) throw new IOException("cannot move " + from.getName());
    }

    private static int compareVersions(String a, String b) {
        String[] x = a.split("\\."), y = b.split("\\.");
        for (int i = 0; i < Math.max(x.length, y.length); i++) {
            int p = i < x.length ? number(x[i]) : 0, q = i < y.length ? number(y[i]) : 0;
            if (p != q) return Integer.compare(p, q);
        }
        return 0;
    }

    private static int number(String s) {
        try {
            return Integer.parseInt(s.replaceAll("[^0-9]", ""));
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    public static String mb(long bytes) {
        return bytes >= (1 << 30) ? String.format(Locale.ROOT, "%.1f GB", bytes / (double) (1 << 30))
                : (bytes >> 20) + " MB";
    }
}
