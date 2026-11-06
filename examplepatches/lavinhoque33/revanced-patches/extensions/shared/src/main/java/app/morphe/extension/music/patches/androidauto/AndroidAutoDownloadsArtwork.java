/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-01.
 */
package app.morphe.extension.music.patches.androidauto;

import android.content.ContentProvider;
import android.content.Context;
import android.content.ContentUris;
import android.content.Intent;
import android.content.pm.ProviderInfo;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.provider.MediaStore;
import android.support.v4.media.MediaDescriptionCompat;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

import static app.morphe.extension.music.patches.androidauto.AndroidAutoDownloadsArtworkData.*;
import static app.morphe.extension.music.patches.androidauto.AndroidAutoDownloadsData.Track;

/** Small embedded covers, served through Music's existing grant-capable FileProvider. No network access. */
@SuppressWarnings("unused")
public final class AndroidAutoDownloadsArtwork {
    private static final String CAR_PACKAGE = "com.google.android.projection.gearhead";
    private static final Object EXTRACTION_LOCK = new Object();
    private static final Object STATE_LOCK = new Object();
    private static final Executor ARTWORK_EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Set<Key> warming = new HashSet<>();
    private static final Map<String, Key> grantedUris = new HashMap<>();
    private static final LinkedHashMap<Key, Boolean> missingArtwork = new LinkedHashMap<>(16, 0.75f, true);
    @Nullable
    private static volatile Context providerContext;

    private AndroidAutoDownloadsArtwork() {}

    /** Installed only after the stock provider and its cache path have been verified at patch time. */
    private static String providerRoot() {
        return "";
    }

    private static Context context() {
        Context context = Utils.getContext();
        if (context == null) context = providerContext;
        if (context == null) throw new IllegalStateException("Artwork provider context unavailable");
        return context;
    }

    private static String authority() {
        return context().getPackageName() + ".fileprovider";
    }

    private static boolean providerAvailable() {
        if (providerRoot().isEmpty()) return false;
        ProviderInfo provider = context().getPackageManager().resolveContentProvider(authority(), 0);
        return provider != null && !provider.exported && provider.grantUriPermissions
                && context().getPackageName().equals(provider.packageName)
                && "com.google.android.apps.youtube.music.util.MusicFileProviderCompat".equals(provider.name);
    }

    private static File directory() throws IOException {
        File cache = context().getCacheDir().getCanonicalFile();
        File directory = new File(new File(cache, "image_share"), DIRECTORY).getCanonicalFile();
        if (!directory.getPath().startsWith(cache.getPath() + File.separator)) {
            throw new IOException("Artwork cache escaped the application cache");
        }
        if (!directory.isDirectory() && !directory.mkdirs() && !directory.isDirectory()) {
            throw new IOException("Artwork cache unavailable");
        }
        return directory;
    }

    private static File imageFile(Key key) throws IOException {
        File directory = directory();
        File file = new File(directory, key.fileName()).getCanonicalFile();
        if (!directory.equals(file.getParentFile())) throw new IOException("Invalid artwork cache path");
        return file;
    }

    private static Set<Long> downloadedIds() {
        Set<Long> ids = new HashSet<>();
        for (Object value : context().getSharedPreferences("rvx_native_audio", 0).getAll().values()) {
            if (!(value instanceof String saved)) continue;
            try {
                Uri uri = Uri.parse(saved);
                if ("content".equals(uri.getScheme()) && "media".equals(uri.getAuthority())) {
                    ids.add(ContentUris.parseId(uri));
                }
            } catch (RuntimeException ignored) {
                // Malformed or removed legacy download mappings do not authorize an image.
            }
        }
        return ids;
    }

    @Nullable
    private static Key currentKey(long mediaId) {
        String[] columns = {MediaStore.Audio.Media.DATE_MODIFIED, MediaStore.Audio.Media.SIZE};
        try (Cursor cursor = context().getContentResolver().query(audioUri(mediaId), columns,
                null, null, null)) {
            if (cursor == null || !cursor.moveToFirst() || cursor.getLong(1) <= 0) return null;
            return new Key(mediaId, cursor.getLong(0), cursor.getLong(1));
        }
    }

    private static Uri audioUri(long mediaId) {
        return ContentUris.withAppendedId(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, mediaId);
    }

    /** Injection point in stock FileProvider.openFile, before it opens the canonical cache path. */
    public static void onOpenFile(ContentProvider provider, Uri uri, String mode) throws FileNotFoundException {
        if (provider != null && provider.getContext() != null) providerContext = provider.getContext();
        String root = providerRoot();
        if (root.isEmpty() || uri == null || !uri.toString().startsWith(uriPrefix(authority(), root))) return;
        Key key = parseUri(authority(), root, uri.toString());
        if (!"r".equals(mode) || key == null || ensureImage(key) == null) {
            throw new FileNotFoundException("Downloaded cover unavailable");
        }
    }

    /** Serial extraction bounds decode memory even when the car requests several covers at once. */
    @Nullable
    private static File ensureImage(Key key) {
        Utils.verifyOffMainThread();
        long started = SystemClock.elapsedRealtime();
        synchronized (EXTRACTION_LOCK) {
            try {
                Set<Long> downloaded = downloadedIds();
                File file = imageFile(key);
                if (!downloaded.contains(key.mediaId()) || !key.equals(currentKey(key.mediaId()))) {
                    file.delete();
                    logImage(key, "stale", 0, started);
                    return null;
                }
                if (file.isFile() && file.length() > 0 && file.length() <= MAX_IMAGE_BYTES) {
                    file.setLastModified(System.currentTimeMillis());
                    logImage(key, "hit", file.length(), started);
                    return file;
                }
                if (isMissing(key)) {
                    logImage(key, "missing-hit", 0, started);
                    return null;
                }

                boolean written = extractImage(key, file);
                if (!written) {
                    synchronized (STATE_LOCK) {
                        missingArtwork.put(key, true);
                        while (missingArtwork.size() > MAX_CACHE_ENTRIES) {
                            missingArtwork.remove(missingArtwork.keySet().iterator().next());
                        }
                    }
                }
                trim(downloaded, key);
                logImage(key, written ? "miss" : "missing", written ? file.length() : 0, started);
                return written ? file : null;
            } catch (IOException | RuntimeException | OutOfMemoryError ex) {
                if (Utils.getContext() != null) {
                    Logger.printInfo(() -> "AA downloads art unavailable: " + key.fileName() + " " + ex);
                }
                return null;
            }
        }
    }

    private static boolean isMissing(Key key) {
        synchronized (STATE_LOCK) {
            return missingArtwork.get(key) != null;
        }
    }

    private static boolean extractImage(Key key, File target) throws IOException {
        byte[] picture;
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            retriever.setDataSource(context(), audioUri(key.mediaId()));
            picture = retriever.getEmbeddedPicture();
        } finally {
            retriever.release();
        }
        // The downloader embeds at most 1 MiB. Reject unexpectedly replaced or malformed media.
        if (picture == null || picture.length == 0 || picture.length > 1024 * 1024) return false;
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(picture, 0, picture.length, options);
        if (options.outWidth <= 0 || options.outHeight <= 0) return false;
        options.inJustDecodeBounds = false;
        options.inSampleSize = 1;
        while (Math.max(options.outWidth, options.outHeight) / options.inSampleSize > 512) {
            options.inSampleSize *= 2;
        }
        Bitmap decoded = BitmapFactory.decodeByteArray(picture, 0, picture.length, options);
        if (decoded == null) return false;
        Bitmap square = null;
        File temporary = null;
        try {
            square = Bitmap.createBitmap(256, 256, Bitmap.Config.ARGB_8888);
            int edge = Math.min(decoded.getWidth(), decoded.getHeight());
            int left = (decoded.getWidth() - edge) / 2;
            int top = (decoded.getHeight() - edge) / 2;
            new Canvas(square).drawBitmap(decoded, new Rect(left, top, left + edge, top + edge),
                    new Rect(0, 0, 256, 256), new Paint(Paint.FILTER_BITMAP_FLAG));
            temporary = File.createTempFile("cover-", ".part", directory());
            try (FileOutputStream output = new FileOutputStream(temporary)) {
                if (!square.compress(Bitmap.CompressFormat.JPEG, 85, output)) return false;
            }
            if (temporary.length() == 0 || temporary.length() > MAX_IMAGE_BYTES) return false;
            if (!temporary.renameTo(target)) throw new IOException("Could not publish downloaded cover");
            return true;
        } finally {
            decoded.recycle();
            if (square != null) square.recycle();
            if (temporary != null) temporary.delete();
        }
    }

    private static void trim(Set<Long> downloaded, @Nullable Key current) throws IOException {
        File directory = directory();
        File[] files = directory.listFiles();
        if (files == null) return;
        var entries = new ArrayList<Entry>(files.length);
        for (File file : files) {
            if (file.isFile()) entries.add(new Entry(file.getName(), file.length(), file.lastModified()));
        }
        for (String name : evictions(entries, downloaded, current, MAX_CACHE_BYTES, MAX_CACHE_ENTRIES)) {
            File file = new File(directory, name).getCanonicalFile();
            if (!directory.equals(file.getParentFile())) continue;
            file.delete();
        }
        // A live evicted image must retain its grant: a later provider open regenerates it lazily.
        var revoke = new ArrayList<String>();
        synchronized (STATE_LOCK) {
            var grants = grantedUris.entrySet().iterator();
            while (grants.hasNext()) {
                var grant = grants.next();
                Key key = grant.getValue();
                if (!downloaded.contains(key.mediaId())
                        || current != null && key.mediaId() == current.mediaId() && !key.equals(current)) {
                    revoke.add(grant.getKey());
                    grants.remove();
                }
            }
            missingArtwork.keySet().removeIf(key -> !downloaded.contains(key.mediaId()));
        }
        for (String uri : revoke) {
            context().revokeUriPermission(CAR_PACKAGE, Uri.parse(uri), Intent.FLAG_GRANT_READ_URI_PERMISSION);
        }
    }

    private static void logImage(Key key, String cache, long bytes, long started) {
        if (Utils.getContext() == null) return;
        long elapsed = SystemClock.elapsedRealtime() - started;
        Logger.printDebug(() -> "AA downloads art route=provider uri="
                + (providerRoot().isEmpty() ? "none" : uri(authority(), providerRoot(), key))
                + " bytes=" + bytes + " cache=" + cache + " extractMs=" + elapsed + " key=" + key.fileName());
    }

    /** Browse rows never wait for extraction; provider opens generate missing images lazily. */
    static final class Batch {
        private final Set<Long> downloaded = downloadedIds();
        private final Set<Key> warm = new LinkedHashSet<>();
        private final boolean available = providerAvailable();
        private int hits;
        private int misses;
        private long bytes;
        private String firstUri = "none";

        Batch() {
            if (!available) return;
            ARTWORK_EXECUTOR.execute(() -> {
                synchronized (EXTRACTION_LOCK) {
                    try {
                        trim(downloadedIds(), null);
                    } catch (IOException | RuntimeException ex) {
                        Logger.printInfo(() -> "Could not trim Android Auto artwork cache", ex);
                    }
                }
            });
        }

        MediaDescriptionCompat description(String id, String title, String subtitle, Bundle extras, Track track) {
            Uri icon = null;
            if (track != null && downloaded.contains(track.mediaId()) && track.modifiedSeconds() >= 0
                    && track.fileSize() > 0 && available) {
                Key key = new Key(track.mediaId(), track.modifiedSeconds(), track.fileSize());
                try {
                    File file = imageFile(key);
                    boolean ready = file.isFile() && file.length() > 0 && file.length() <= MAX_IMAGE_BYTES;
                    if (!isMissing(key)) {
                        if (ready) {
                            hits++;
                            bytes += file.length();
                            file.setLastModified(System.currentTimeMillis());
                        } else {
                            misses++;
                            warm.add(key);
                        }
                        icon = grant(key);
                    }
                } catch (IOException | RuntimeException | OutOfMemoryError ex) {
                    Logger.printInfo(() -> "Could not describe downloaded cover: " + key.fileName() + " " + ex);
                }
            }
            return new MediaDescriptionCompat(id, title, subtitle, null, null, icon, extras, null);
        }

        private Uri grant(Key key) {
            String address = uri(authority(), providerRoot(), key);
            Uri uri = Uri.parse(address);
            // Force-stopping either package drops system grants even while this process retains its cache.
            context().grantUriPermission(CAR_PACKAGE, uri, Intent.FLAG_GRANT_READ_URI_PERMISSION);
            synchronized (STATE_LOCK) {
                grantedUris.put(address, key);
            }
            if (firstUri.equals("none")) firstUri = address;
            return uri;
        }

        void finish(int rows) {
            Logger.printDebug(() -> "AA downloads art route=provider"
                    + " uri=" + firstUri + " bytes=" + bytes + " rows=" + rows
                    + " hits=" + hits + " misses=" + misses + " available=" + available);
            if (warm.isEmpty()) return;
            synchronized (STATE_LOCK) {
                warm.removeIf(key -> !warming.add(key));
            }
            if (warm.isEmpty()) return;
            ARTWORK_EXECUTOR.execute(() -> {
                try {
                    for (Key key : warm) {
                        ensureImage(key);
                    }
                } finally {
                    synchronized (STATE_LOCK) {
                        warming.removeAll(warm);
                    }
                }
            });
        }
    }
}
