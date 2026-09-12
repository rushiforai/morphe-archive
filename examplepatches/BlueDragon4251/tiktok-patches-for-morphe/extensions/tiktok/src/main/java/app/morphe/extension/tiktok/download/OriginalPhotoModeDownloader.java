package app.morphe.extension.tiktok.download;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;

import com.ss.android.ugc.aweme.base.model.UrlModel;
import com.ss.android.ugc.aweme.feed.model.Aweme;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.IdentityHashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.tiktok.settings.Settings;

/** Replaces TikTok's rendered Photo Mode downloads with the original CDN assets. */
@SuppressWarnings("unused")
public final class OriginalPhotoModeDownloader {
    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<String, Session> SESSIONS = new ConcurrentHashMap<>();
    private static final int MAX_DEPTH = 4;
    private static final int MAX_ITEMS = 64;

    private OriginalPhotoModeDownloader() {
    }

    public static void onTikTokDownloadCompleted(String generatedPath, Aweme aweme) {
        if (!Settings.DOWNLOAD_ORIGINAL_PHOTOS.get() || aweme == null) return;

        Object photoInfo;
        try {
            photoInfo = aweme.getPhotoModeImageInfo();
        } catch (Throwable ignored) {
            return;
        }
        if (photoInfo == null) return;

        String aid;
        try {
            aid = aweme.getAid();
        } catch (Throwable ignored) {
            aid = null;
        }
        if (aid == null || aid.trim().isEmpty()) {
            aid = Integer.toUnsignedString(System.identityHashCode(aweme), 16);
        }

        pruneSessions();
        Session session = SESSIONS.computeIfAbsent(aid, ignored -> new Session());
        synchronized (session) {
            if (generatedPath != null && !generatedPath.trim().isEmpty()) {
                session.generatedPaths.add(generatedPath);
                if (session.success) {
                    deleteQuietly(generatedPath);
                    return;
                }
            }
            if (session.started) return;
            session.started = true;
        }

        Context context = Utils.getContext();
        if (context == null) return;
        Context appContext = context.getApplicationContext();
        String finalAid = aid;
        Object finalPhotoInfo = photoInfo;
        EXECUTOR.execute(() -> saveOriginals(appContext, aweme, finalPhotoInfo, finalAid, session));
    }

    private static void saveOriginals(Context context, Aweme aweme, Object photoInfo, String aid, Session session) {
        List<Asset> assets = extractOrderedAssets(photoInfo, aweme);
        if (assets.isEmpty()) {
            debug("no original Photo Mode assets found aid=" + aid);
            return;
        }

        int saved = 0;
        List<Uri> createdUris = new ArrayList<>();
        List<File> createdFiles = new ArrayList<>();
        for (int index = 0; index < assets.size(); index++) {
            SaveResult result = saveAsset(context, aweme, aid, index + 1, assets.get(index));
            if (!result.success) {
                cleanup(context, createdUris, createdFiles);
                debug("original Photo Mode download failed aid=" + aid + " index=" + (index + 1));
                MAIN.post(() -> Utils.showToastLong("Original photo download failed; TikTok copies were kept"));
                return;
            }
            if (result.uri != null) createdUris.add(result.uri);
            if (result.file != null) createdFiles.add(result.file);
            saved++;
        }

        synchronized (session) {
            session.success = true;
            for (String path : session.generatedPaths) deleteQuietly(path);
        }
        int finalSaved = saved;
        MAIN.post(() -> Utils.showToastShort("Saved " + finalSaved + " original photo" + (finalSaved == 1 ? "" : "s")));
        debug("saved original Photo Mode assets aid=" + aid + " count=" + saved);
    }

    private static SaveResult saveAsset(Context context, Aweme aweme, String aid, int index, Asset asset) {
        HttpURLConnection connection = null;
        Uri pending = null;
        try {
            connection = (HttpURLConnection) new URL(asset.url).openConnection();
            connection.setConnectTimeout(15_000);
            connection.setReadTimeout(30_000);
            connection.setInstanceFollowRedirects(true);
            connection.setRequestProperty("User-Agent", "TikTok 46.4.3 BlueIT Service");
            int code = connection.getResponseCode();
            if (code < 200 || code >= 300) return SaveResult.failure();

            String mime = normalizeMime(connection.getContentType(), asset.url);
            String extension = extensionForMime(mime, asset.url);
            String displayName = photoFileName(aweme, aid, index, extension);

            try (InputStream input = new BufferedInputStream(connection.getInputStream())) {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    ContentResolver resolver = context.getContentResolver();
                    ContentValues values = new ContentValues();
                    values.put(MediaStore.Images.Media.DISPLAY_NAME, displayName);
                    values.put(MediaStore.Images.Media.MIME_TYPE, mime);
                    values.put(MediaStore.Images.Media.RELATIVE_PATH, normalizeRelativePath(Settings.DOWNLOAD_PATH.get()));
                    values.put(MediaStore.Images.Media.IS_PENDING, 1);
                    pending = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values);
                    if (pending == null) return SaveResult.failure();
                    try (OutputStream output = resolver.openOutputStream(pending, "w")) {
                        if (output == null) throw new IllegalStateException("MediaStore output unavailable");
                        copy(input, output);
                    }
                    ContentValues publish = new ContentValues();
                    publish.put(MediaStore.Images.Media.IS_PENDING, 0);
                    resolver.update(pending, publish, null, null);
                    return SaveResult.success(pending, null);
                }

                File directory = new File(Environment.getExternalStorageDirectory(), normalizeRelativePath(Settings.DOWNLOAD_PATH.get()));
                if (!directory.isDirectory() && !directory.mkdirs()) return SaveResult.failure();
                File target = uniqueFile(directory, displayName);
                try (OutputStream output = new FileOutputStream(target)) {
                    copy(input, output);
                }
                return SaveResult.success(null, target);
            }
        } catch (Throwable throwable) {
            if (pending != null) {
                try { context.getContentResolver().delete(pending, null, null); } catch (Throwable ignored) { }
            }
            if (BaseSettings.DEBUG.get()) {
                Logger.printException(() -> "[BlueIT Photos] original photo save failed", throwable);
            }
            return SaveResult.failure();
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static List<Asset> extractOrderedAssets(Object photoInfo, Aweme aweme) {
        List<Asset> fromPhotoInfo = extractFromContainerLists(photoInfo);
        if (!fromPhotoInfo.isEmpty()) return fromPhotoInfo;

        try {
            Object imageInfos = aweme.getImageInfos();
            if (imageInfos instanceof List<?>) {
                List<Asset> result = new ArrayList<>();
                for (Object item : (List<?>) imageInfos) {
                    Asset best = bestAsset(item);
                    if (best != null) result.add(best);
                }
                if (!result.isEmpty()) return result;
            }
        } catch (Throwable ignored) {
        }
        return Collections.emptyList();
    }

    private static List<Asset> extractFromContainerLists(Object container) {
        if (container == null) return Collections.emptyList();
        for (Class<?> owner = container.getClass(); owner != null && owner != Object.class; owner = owner.getSuperclass()) {
            for (Field field : owner.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.isSynthetic()) continue;
                try {
                    field.setAccessible(true);
                    Object value = field.get(container);
                    if (!(value instanceof List<?>)) continue;
                    List<?> list = (List<?>) value;
                    if (list.isEmpty()) continue;
                    List<Asset> result = new ArrayList<>();
                    int limit = Math.min(list.size(), MAX_ITEMS);
                    for (int i = 0; i < limit; i++) {
                        Asset best = bestAsset(list.get(i));
                        if (best != null) result.add(best);
                    }
                    if (!result.isEmpty()) return dedupe(result);
                } catch (Throwable ignored) {
                }
            }
        }
        return Collections.emptyList();
    }

    private static Asset bestAsset(Object item) {
        List<Asset> candidates = new ArrayList<>();
        collectAssets(item, "item", 0, candidates, Collections.newSetFromMap(new IdentityHashMap<>()));
        Asset best = null;
        for (Asset candidate : candidates) {
            if (best == null || candidate.score > best.score
                    || (candidate.score == best.score && candidate.size > best.size)) {
                best = candidate;
            }
        }
        return best;
    }

    private static void collectAssets(Object value, String path, int depth, List<Asset> out, Set<Object> visited) {
        if (value == null || depth > MAX_DEPTH || visited.contains(value)) return;
        visited.add(value);
        if (value instanceof UrlModel) {
            UrlModel model = (UrlModel) value;
            String url = firstUsableUrl(model);
            if (url != null) out.add(new Asset(url, scorePath(path), safeSize(model)));
            return;
        }
        Class<?> type = value.getClass();
        if (type.isArray()) {
            int count = Math.min(Array.getLength(value), MAX_ITEMS);
            for (int i = 0; i < count; i++) collectAssets(Array.get(value, i), path + '[' + i + ']', depth + 1, out, visited);
            return;
        }
        if (value instanceof Iterable<?>) {
            int index = 0;
            for (Object child : (Iterable<?>) value) {
                if (index >= MAX_ITEMS) break;
                collectAssets(child, path + '[' + index++ + ']', depth + 1, out, visited);
            }
            return;
        }
        String name = type.getName();
        if (!(name.startsWith("com.ss.android.") || name.startsWith("com.bytedance.") || name.startsWith("X."))) return;
        for (Class<?> owner = type; owner != null && owner != Object.class; owner = owner.getSuperclass()) {
            for (Field field : owner.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.isSynthetic()) continue;
                try {
                    field.setAccessible(true);
                    collectAssets(field.get(value), path + '.' + field.getName(), depth + 1, out, visited);
                } catch (Throwable ignored) {
                }
            }
        }
    }

    private static int scorePath(String path) {
        String p = path.toLowerCase(Locale.US);
        int score = 0;
        if (p.contains("origin") || p.contains("original")) score += 80;
        if (p.contains("download")) score += 60;
        if (p.contains("large") || p.contains("display")) score += 30;
        if (p.contains("url")) score += 5;
        if (p.contains("thumb") || p.contains("small") || p.contains("preview")) score -= 80;
        return score;
    }

    private static List<Asset> dedupe(List<Asset> assets) {
        LinkedHashMap<String, Asset> unique = new LinkedHashMap<>();
        for (Asset asset : assets) unique.put(asset.url, asset);
        return new ArrayList<>(unique.values());
    }

    private static String firstUsableUrl(UrlModel model) {
        try {
            List<String> urls = model.getUrlList();
            if (urls != null) {
                for (String url : urls) if (url != null && url.startsWith("http")) return url;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static long safeSize(UrlModel model) {
        try { return model.getSize(); } catch (Throwable ignored) { return -1L; }
    }

    private static String photoFileName(Aweme aweme, String aid, int index, String extension) {
        String template = Settings.DOWNLOAD_PHOTO_FILENAME_TEMPLATE.get();
        String creator = creatorOf(aweme);
        String date = new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(new Date(createTimeOf(aweme)));
        String source = template == null || template.trim().isEmpty()
                ? "{creator}_{date}_{video_id}_{index}"
                : template.trim();
        String base = source
                .replace("{creator}", sanitize(creator))
                .replace("{date}", sanitize(date))
                .replace("{video_id}", sanitize(aid))
                .replace("{index}", String.valueOf(index));
        if (!source.contains("{index}")) base += "_" + index;
        base = sanitize(base);
        if (base.isEmpty()) base = "photo_" + sanitize(aid) + "_" + index;
        return base + "." + extension;
    }

    private static String creatorOf(Object aweme) {
        Object author = invoke(aweme, "getAuthor");
        String value = stringInvoke(author, "getUniqueId");
        if (value == null || value.trim().isEmpty()) value = stringInvoke(author, "getNickname");
        return value == null || value.trim().isEmpty() ? "unknown" : value;
    }

    private static long createTimeOf(Object aweme) {
        Object raw = invoke(aweme, "getCreateTime");
        if (raw instanceof Number) {
            long value = ((Number) raw).longValue();
            if (value > 0 && value < 100_000_000_000L) value *= 1000L;
            if (value > 0) return value;
        }
        return System.currentTimeMillis();
    }

    private static Object invoke(Object target, String name) {
        if (target == null) return null;
        try {
            Method method = target.getClass().getMethod(name);
            method.setAccessible(true);
            return method.invoke(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String stringInvoke(Object target, String name) {
        Object value = invoke(target, name);
        return value instanceof String ? (String) value : null;
    }

    private static String normalizeMime(String contentType, String url) {
        if (contentType != null) {
            String mime = contentType.split(";", 2)[0].trim().toLowerCase(Locale.US);
            if (mime.startsWith("image/")) return mime;
        }
        String lower = url == null ? "" : url.toLowerCase(Locale.US);
        if (lower.contains(".png")) return "image/png";
        if (lower.contains(".webp")) return "image/webp";
        if (lower.contains(".heic")) return "image/heic";
        if (lower.contains(".heif")) return "image/heif";
        return "image/jpeg";
    }

    private static String extensionForMime(String mime, String url) {
        if ("image/png".equals(mime)) return "png";
        if ("image/webp".equals(mime)) return "webp";
        if ("image/heic".equals(mime)) return "heic";
        if ("image/heif".equals(mime)) return "heif";
        return "jpg";
    }

    private static String normalizeRelativePath(String path) {
        String value = path == null ? "DCIM/TikTok" : path.trim().replace('\\', '/');
        while (value.startsWith("/")) value = value.substring(1);
        return value.isEmpty() ? "DCIM/TikTok" : value;
    }

    private static String sanitize(String value) {
        if (value == null) return "";
        String cleaned = value.replaceAll("[\\\\/:*?\"<>|\\p{Cntrl}]", "_").trim();
        while (cleaned.contains("__")) cleaned = cleaned.replace("__", "_");
        if (cleaned.length() > 150) cleaned = cleaned.substring(0, 150);
        return cleaned;
    }

    private static File uniqueFile(File directory, String displayName) {
        File file = new File(directory, displayName);
        if (!file.exists()) return file;
        int dot = displayName.lastIndexOf('.');
        String base = dot > 0 ? displayName.substring(0, dot) : displayName;
        String ext = dot > 0 ? displayName.substring(dot) : "";
        int index = 2;
        while (file.exists()) file = new File(directory, base + '_' + index++ + ext);
        return file;
    }

    private static void copy(InputStream input, OutputStream output) throws Exception {
        byte[] buffer = new byte[64 * 1024];
        int read;
        while ((read = input.read(buffer)) >= 0) {
            if (read > 0) output.write(buffer, 0, read);
        }
    }

    private static void cleanup(Context context, List<Uri> uris, List<File> files) {
        for (Uri uri : uris) try { context.getContentResolver().delete(uri, null, null); } catch (Throwable ignored) { }
        for (File file : files) try { if (file != null) file.delete(); } catch (Throwable ignored) { }
    }

    private static void deleteQuietly(String path) {
        try {
            if (path != null) new File(path).delete();
        } catch (Throwable ignored) {
        }
    }

    private static void pruneSessions() {
        if (SESSIONS.size() <= 128) return;
        SESSIONS.clear();
    }

    private static void debug(String message) {
        if (BaseSettings.DEBUG.get()) Logger.printInfo(() -> "[BlueIT Photos] " + message);
    }

    private static final class Session {
        boolean started;
        boolean success;
        final List<String> generatedPaths = new ArrayList<>();
    }

    private static final class Asset {
        final String url;
        final int score;
        final long size;

        Asset(String url, int score, long size) {
            this.url = url;
            this.score = score;
            this.size = size;
        }
    }

    private static final class SaveResult {
        final boolean success;
        final Uri uri;
        final File file;

        private SaveResult(boolean success, Uri uri, File file) {
            this.success = success;
            this.uri = uri;
            this.file = file;
        }

        static SaveResult success(Uri uri, File file) { return new SaveResult(true, uri, file); }
        static SaveResult failure() { return new SaveResult(false, null, null); }
    }
}
