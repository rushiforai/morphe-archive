package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.SystemClock;
import android.util.Log;
import android.util.SparseIntArray;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

/** Opt-in registered image NG: the ChMate UI thread only inspects already computed matches. */
public final class RegisteredImageNg {
    static final String PREFS = "haiagaru.registered-image-ng";
    static final String ENABLE = "enabled", COUNT = "min_matches", LEVEL = "level";
    static final int DEFAULT_COUNT = 2, MAX_REFERENCE_IMAGES = 80;
    // The native NG reason renders an aboon row. The separate 0x1000 bit hides it.
    private static final int IMAGE_NG_REASON = 0x8;
    private static final int MAX_BYTES = 8 * 1024 * 1024;
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor(r -> {
        Thread thread = new Thread(r, "Haiagaru-registered-images");
        thread.setPriority(Thread.MIN_PRIORITY); return thread;
    });
    private static final ConcurrentHashMap<String, RegisteredImageHash.Stamp> CACHED = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String, Boolean> DECISIONS = new ConcurrentHashMap<>();
    private static final Set<String> PENDING = Collections.newSetFromMap(new ConcurrentHashMap<>());
    private static final AtomicBoolean SCAN_QUEUED = new AtomicBoolean();
    private static volatile Context app;
    private static volatile List<RegisteredImageHash.Stamp> references = Collections.emptyList();
    private static volatile boolean loaded;
    private static volatile int registeredCount;
    private static volatile long lastScan;
    private static volatile String folderFingerprint = "";
    private static volatile long revision;
    private static volatile String status = "登録画像を確認していません";

    private RegisteredImageNg() { }
    static void initialize(Context context) { app = context.getApplicationContext(); }
    static SharedPreferences prefs(Context context) { return context.getSharedPreferences(PREFS, 0); }
    static int level(Context context) { return Math.max(0, Math.min(3, prefs(context).getInt(LEVEL, 1))); }
    static int count(Context context) { return Math.max(1, Math.min(10, prefs(context).getInt(COUNT, DEFAULT_COUNT))); }
    static String status() { return status; }
    static int registeredCount() { return registeredCount; }
    static boolean hasSafFolder(Context context) { return RegisteredImageSafStore.configured(context); }
    static String folderDescription(Context context) { return RegisteredImageSafStore.location(context); }
    private static void invalidate() {
        revision++;
        CACHED.clear(); DECISIONS.clear(); PENDING.clear();
    }
    static void settingsChanged() { invalidate(); }

    /** Safe to invoke from the existing NG map hook: network and pixel work stay on WORKER. */
    public static void apply(Object owner) {
        Context context = app;
        if (owner == null || context == null || !prefs(context).getBoolean(ENABLE, false)) return;
        if (!loaded) {
            scheduleLoad();
            return;
        }
        if (SystemClock.elapsedRealtime() - lastScan > 60000) scheduleLoad();
        if (references.isEmpty()) return;
        try {
            String rowsField, mapField, numberField, enabledField;
            switch (owner.getClass().getName()) {
                case "o.m9ExternalSyntheticLambda1":
                    rowsField = "K"; mapField = "N"; numberField = "o"; enabledField = "p"; break;
                case "o.listener":
                    rowsField = "J"; mapField = "K"; numberField = "l"; enabledField = "r"; break;
                case "o.zzaW":
                    rowsField = "a"; mapField = "j"; numberField = "o"; enabledField = "i"; break;
                default: return;
            }
            if (!Boolean.TRUE.equals(ResponseArchiveEntry.field(owner, enabledField))) return;
            Object source = ResponseArchiveEntry.field(owner, rowsField);
            List<?> rows = EdgeLevelNg.rows(source);
            if (rows.isEmpty()) return;
            String[] bindings = PatrolImages.bindings().split(";", -1);
            if (bindings.length != 10) return;
            int required = count(context), matchingLevel = level(context);
            long version = revision;
            Object map = ResponseArchiveEntry.field(owner, mapField);
            Map<String, Map<String, String>> jobs = new LinkedHashMap<>();
            // Start with recent replies while still visiting every eligible reply in this pass.
            List<?> newestFirst = new ArrayList<>(rows);
            Collections.reverse(newestFirst);
            for (Object row : newestFirst) {
                int number = ((Number) ResponseArchiveEntry.field(row, numberField)).intValue();
                if (number < 1) continue;
                Method method = row.getClass().getDeclaredMethod(bindings[1]);
                method.setAccessible(true);
                Object result = method.invoke(row);
                if (!(result instanceof String[])) continue;
                // Keep native cache URLs for fetching; use canonical identities only for deduplication.
                // VPN loopback aliases must not be replaced by upstream URLs before a native request.
                Map<String, String> urls = new LinkedHashMap<>();
                for (String url : (String[]) result)
                    if (PatrolImageRules.imageUrl(url))
                        urls.putIfAbsent(ImageVpnController.imageIdentity(url), url);
                if (urls.size() < required) continue;
                String key = version + ":" + matchingLevel + ":" + required + ":" + String.join("\n", urls.keySet());
                Boolean hide = DECISIONS.get(key);
                if (Boolean.TRUE.equals(hide)) {
                    if (map instanceof SparseIntArray) {
                        SparseIntArray target = (SparseIntArray) map;
                        target.put(number, target.get(number, 0) | IMAGE_NG_REASON);
                    } else if (map instanceof Map) {
                        @SuppressWarnings("unchecked") Map<Integer, Integer> target = (Map<Integer, Integer>) map;
                        target.put(number, target.getOrDefault(number, 0) | IMAGE_NG_REASON);
                    }
                } else if (hide == null) {
                    jobs.putIfAbsent(key, urls);
                }
            }
            jobs.keySet().removeIf(key -> !PENDING.add(key));
            if (!jobs.isEmpty()) {
                WORKER.execute(() -> jobs.forEach(
                        (key, images) -> evaluate(key, images, version, matchingLevel, required)));
            }
        } catch (Exception error) {
            status = "画像NG判定の準備に失敗: " + error.getClass().getSimpleName();
        }
    }

    private static void scheduleLoad() {
        if (!SCAN_QUEUED.compareAndSet(false, true)) return;
        lastScan = SystemClock.elapsedRealtime();
        WORKER.execute(() -> {
            try { reload(false); }
            finally { SCAN_QUEUED.set(false); }
        });
    }
    private static void reload(boolean force) {
        List<RegisteredImageSafStore.Entry> entries;
        try { entries = RegisteredImageSafStore.list(app); }
        catch (Exception error) {
            status = "登録画像フォルダの読み込みに失敗: " + error.getMessage();
            loaded = true;
            return;
        }
        lastScan = SystemClock.elapsedRealtime();
        StringBuilder signature = new StringBuilder();
        for (RegisteredImageSafStore.Entry entry : entries) signature.append(entry.fingerprint()).append('\n');
        String current = signature.toString();
        if (!force && loaded && folderFingerprint.equals(current)) return;
        List<RegisteredImageHash.Stamp> stamps = new ArrayList<>();
        for (RegisteredImageSafStore.Entry entry : entries) {
            if (stamps.size() >= MAX_REFERENCE_IMAGES) break;
            try (InputStream input = entry.open(app)) {
                RegisteredImageHash.Stamp stamp = decode(readCapped(input));
                if (stamp != null) stamps.add(stamp);
            } catch (Exception error) { Log.w("HaiagaruImageNg", "Skipping invalid reference: " + error.getClass().getSimpleName()); }
        }
        List<RegisteredImageHash.Stamp> distinct = new ArrayList<>();
        for (RegisteredImageHash.Stamp stamp : stamps) {
            boolean duplicate = false;
            for (RegisteredImageHash.Stamp existing : distinct)
                if (RegisteredImageHash.sameImage(stamp, existing)) { duplicate = true; break; }
            if (!duplicate) distinct.add(stamp);
        }
        references = Collections.unmodifiableList(distinct);
        registeredCount = entries.size();
        folderFingerprint = current;
        loaded = true; invalidate();
        status = "フォルダ内 " + entries.size() + "枚／判定対象 " + stamps.size() + "枚（異なる画像 "
                + distinct.size() + "枚、次にスレを開くと反映）"
                + (entries.size() > MAX_REFERENCE_IMAGES ? "。上限" + MAX_REFERENCE_IMAGES + "枚を超える画像は対象外" : "");
    }
    private static void evaluate(String key, Map<String, String> urls, long version, int matchingLevel, int required) {
        try {
            Context context = app;
            if (context == null || version != revision || !prefs(context).getBoolean(ENABLE, false)) return;
            RegisteredImageNativeCache cache = new RegisteredImageNativeCache(context);
            Map<String, RegisteredImageHash.Stamp> resolved = new LinkedHashMap<>();
            int attempted = 0;
            for (Map.Entry<String, String> entry : urls.entrySet()) {
                if (version != revision || Thread.currentThread().isInterrupted()) return;
                if (attempted++ >= 20) break;
                String identity = entry.getKey();
                RegisteredImageHash.Stamp stamp = CACHED.get(identity);
                if (stamp == null) {
                    try (InputStream image = cache.await(entry.getValue(), SystemClock.elapsedRealtime() + 10000)) {
                        if (image != null) stamp = decode(readCapped(image));
                        if (stamp != null && CACHED.size() < 512) CACHED.put(identity, stamp);
                    } catch (Exception error) { /* Inaccessible image never counts as a match. */ }
                }
                if (stamp != null) resolved.put(identity, stamp);
            }
            if (version != revision) return;
            // Deduplicate images rehosted under several URLs by near-identical fingerprints.
            List<String> unique = new ArrayList<>();
            List<RegisteredImageHash.Stamp> seen = new ArrayList<>();
            for (String url : urls.keySet()) {
                RegisteredImageHash.Stamp stamp = resolved.get(url);
                if (stamp == null) continue;
                boolean duplicate = false;
                for (RegisteredImageHash.Stamp previous : seen)
                    if (RegisteredImageHash.sameImage(stamp, previous)) { duplicate = true; break; }
                if (!duplicate) { seen.add(stamp); unique.add(url); }
            }
            int matched = RegisteredImageHash.matchingCount(references, unique, resolved, matchingLevel);
            if (version == revision) {
                if (DECISIONS.size() >= 1000) DECISIONS.clear();
                DECISIONS.put(key, matched >= required);
                status = "画像NG判定済み：" + DECISIONS.size() + "レス。スレを開き直すと反映";
            }
        } catch (Exception error) {
            status = "画像NG判定に失敗: " + error.getClass().getSimpleName();
        } finally { PENDING.remove(key); }
    }

    static void importFiles(List<Uri> uris, java.util.function.Consumer<String> completed) {
        WORKER.execute(() -> {
            int added = 0, skipped = 0;
            for (Uri uri : uris) {
                try (InputStream source = app.getContentResolver().openInputStream(uri)) {
                    if (source == null) { skipped++; continue; }
                    byte[] bytes = readCapped(source);
                    if (decode(bytes) == null) { skipped++; continue; }
                    if (RegisteredImageSafStore.put(app, bytes, digest(bytes), MAX_REFERENCE_IMAGES)) added++;
                    else skipped++;
                } catch (Exception error) { skipped++; }
            }
            reload(true);
            completed.accept("登録 " + added + "枚／スキップ " + skipped + "枚（合計 " + registeredCount() + "枚）");
        });
    }
    static void importUrls(List<String> urls, java.util.function.Consumer<String> completed) {
        WORKER.execute(() -> {
            List<byte[]> bytes = new ArrayList<>(); int failed = 0;
            try {
                RegisteredImageNativeCache cache = new RegisteredImageNativeCache(app);
                for (String url : urls) {
                    if (!PatrolImageRules.imageUrl(url)) { failed++; continue; }
                    try (InputStream stream = cache.await(url, SystemClock.elapsedRealtime() + 15000)) {
                        if (stream != null) bytes.add(readCapped(stream)); else failed++;
                    } catch (Exception error) { failed++; }
                }
            } catch (Exception error) { failed += urls.size(); }
            int added = 0;
            for (byte[] data : bytes) {
                try {
                    if (decode(data) != null && RegisteredImageSafStore.put(app, data, digest(data), MAX_REFERENCE_IMAGES)) added++;
                    else failed++;
                } catch (Exception error) { failed++; }
            }
            reload(true); completed.accept("URLから登録 " + added + "枚／取得・登録失敗 " + failed + "枚");
        });
    }
    static void remove(RegisteredImageSafStore.Entry entry, java.util.function.Consumer<String> completed) {
        WORKER.execute(() -> {
            try {
                boolean present = false;
                for (RegisteredImageSafStore.Entry current : RegisteredImageSafStore.list(app))
                    if (current.identity().equals(entry.identity())) { present = true; break; }
                if (!present) { completed.accept("画像がフォルダ内に見つかりません"); return; }
                boolean removed = entry.delete(app);
                reload(true);
                completed.accept(removed ? "登録画像を削除しました" : "削除できませんでした");
            } catch (Exception error) {
                completed.accept("画像の削除に失敗: " + error.getMessage());
            }
        });
    }

    static void selectFolder(Uri tree, int flags, java.util.function.BiConsumer<Boolean, String> completed) {
        WORKER.execute(() -> {
            try {
                RegisteredImageSafStore.BytesReader reader = new RegisteredImageSafStore.BytesReader() {
                    @Override public byte[] read(InputStream input) throws Exception {
                        byte[] data = readCapped(input);
                        return decode(data) == null ? null : data;
                    }
                    @Override public String digest(byte[] bytes) throws Exception { return RegisteredImageNg.digest(bytes); }
                };
                int copied = RegisteredImageSafStore.selectFolder(app, tree, flags, MAX_REFERENCE_IMAGES, reader);
                reload(true);
                completed.accept(true, "専用フォルダを設定しました（以前の登録画像 " + copied + "枚をコピー）");
            } catch (Exception error) {
                completed.accept(false, "フォルダを設定できません: " + error.getMessage());
            }
        });
    }

    static void refresh(java.util.function.Consumer<String> completed) {
        WORKER.execute(() -> { reload(true); completed.accept(status); });
    }

    static final class Preview {
        final RegisteredImageSafStore.Entry entry;
        final Bitmap thumbnail;
        Preview(RegisteredImageSafStore.Entry entry, Bitmap thumbnail) {
            this.entry = entry; this.thumbnail = thumbnail;
        }
    }

    static void loadPreviews(java.util.function.BiConsumer<List<Preview>, String> completed) {
        WORKER.execute(() -> {
            List<Preview> results = new ArrayList<>();
            try {
                for (RegisteredImageSafStore.Entry entry : RegisteredImageSafStore.list(app)) {
                    if (results.size() >= MAX_REFERENCE_IMAGES) break;
                    Bitmap thumb = null;
                    try (InputStream source = entry.open(app)) {
                        byte[] data = readCapped(source);
                        BitmapFactory.Options options = new BitmapFactory.Options();
                        options.inJustDecodeBounds = true;
                        BitmapFactory.decodeByteArray(data, 0, data.length, options);
                        int sample = 1;
                        while (Math.max(options.outWidth, options.outHeight) / sample > 144 && sample < 1024)
                            sample *= 2;
                        options.inJustDecodeBounds = false;
                        options.inSampleSize = sample;
                        thumb = BitmapFactory.decodeByteArray(data, 0, data.length, options);
                    } catch (Exception ignored) { }
                    results.add(new Preview(entry, thumb));
                }
                completed.accept(results, null);
            } catch (Exception error) { completed.accept(results, error.getMessage()); }
        });
    }

    private static String digest(byte[] bytes) throws Exception {
        byte[] hash = MessageDigest.getInstance("SHA-256").digest(bytes);
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < 16; i++) result.append(String.format(java.util.Locale.ROOT, "%02x", hash[i] & 255));
        return result.toString();
    }
    private static byte[] readCapped(InputStream source) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream(); byte[] buffer = new byte[8192]; int n;
        while ((n = source.read(buffer)) != -1) {
            if (output.size() + n > MAX_BYTES) throw new IOException("画像は8MiB以内で登録してください");
            output.write(buffer, 0, n);
        }
        return output.toByteArray();
    }
    private static RegisteredImageHash.Stamp decode(byte[] image) {
        BitmapFactory.Options options = new BitmapFactory.Options(); options.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(image, 0, image.length, options);
        int width = options.outWidth, height = options.outHeight;
        if (width < 8 || height < 8 || width > 20000 || height > 20000) return null;
        options.inJustDecodeBounds = false;
        options.inSampleSize = 1;
        while (Math.max(width, height) / options.inSampleSize > 256) options.inSampleSize *= 2;
        Bitmap decoded = BitmapFactory.decodeByteArray(image, 0, image.length, options);
        if (decoded == null) return null;
        Bitmap sample = Bitmap.createScaledBitmap(decoded, 32, 32, true);
        int[] pixels = new int[1024]; sample.getPixels(pixels, 0, 32, 0, 0, 32, 32);
        RegisteredImageHash.Stamp stamp = RegisteredImageHash.calculate(pixels, width, height);
        if (sample != decoded) sample.recycle(); decoded.recycle();
        return stamp;
    }
}
