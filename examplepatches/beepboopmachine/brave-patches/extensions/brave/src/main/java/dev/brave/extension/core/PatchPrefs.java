package dev.brave.extension.core;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.AssetFileDescriptor;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Locale;

/**
 * Thread-safe, null-safe preferences storage for Brave Morphe patches.
 */
public final class PatchPrefs {
    private static final String PREF_NAME = "brave_morphe_patches_prefs";

    public static final String KEY_MEDIA_DOWNLOAD_ENABLED = "media_download_enabled";
    public static final String KEY_AUTO_CONVERT_WEBP = "auto_convert_webp";
    public static final String KEY_HLS_DEFAULT_RESOLUTION = "hls_default_res";
    public static final String KEY_CUSTOM_DOWNLOAD_DIR = "custom_download_dir";

    private PatchPrefs() {}

    public static SharedPreferences get(Context context) {
        if (context == null) return null;
        try {
            Context appCtx = context.getApplicationContext();
            Context target = (appCtx != null) ? appCtx : context;
            return target.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
        } catch (Throwable ignored) {
            return null;
        }
    }

    public static boolean getBoolean(Context context, String key, boolean defValue) {
        try {
            SharedPreferences sp = get(context);
            return (sp != null) ? sp.getBoolean(key, defValue) : defValue;
        } catch (Throwable t) {
            return defValue;
        }
    }

    public static void setBoolean(Context context, String key, boolean value) {
        try {
            SharedPreferences sp = get(context);
            if (sp != null) {
                sp.edit().putBoolean(key, value).apply();
            }
        } catch (Throwable ignored) {}
    }

    public static String getString(Context context, String key, String defValue) {
        try {
            SharedPreferences sp = get(context);
            return (sp != null) ? sp.getString(key, defValue) : defValue;
        } catch (Throwable t) {
            return defValue;
        }
    }

    public static void setString(Context context, String key, String value) {
        try {
            SharedPreferences sp = get(context);
            if (sp != null) {
                sp.edit().putString(key, value).apply();
            }
        } catch (Throwable ignored) {}
    }

    public static int getInt(Context context, String key, int defValue) {
        try {
            SharedPreferences sp = get(context);
            return (sp != null) ? sp.getInt(key, defValue) : defValue;
        } catch (Throwable t) {
            return defValue;
        }
    }

    public static void setInt(Context context, String key, int value) {
        try {
            SharedPreferences sp = get(context);
            if (sp != null) {
                sp.edit().putInt(key, value).apply();
            }
        } catch (Throwable ignored) {}
    }

    private static final String PREF_DOWNLOADED_PREFIX = "downloaded_media_v2_";

    private static String downloadedKeyForUrl(String url) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] digest = md.digest(url.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder(PREF_DOWNLOADED_PREFIX.length() + 64);
            sb.append(PREF_DOWNLOADED_PREFIX);
            for (byte b : digest) {
                sb.append(String.format(Locale.ROOT, "%02x", b & 0xFF));
            }
            return sb.toString();
        } catch (Throwable ignored) {
            return PREF_DOWNLOADED_PREFIX + url.length() + "_" + url.hashCode();
        }
    }

    public static boolean isMediaDownloaded(Context context, String url) {
        if (context == null || url == null || url.isEmpty()) return false;
        try {
            String key = downloadedKeyForUrl(url);
            String stored = getString(context, key, null);
            if (stored == null || stored.isEmpty()) return false;

            if (verifyStoredMediaExists(context, stored)) {
                return true;
            }

            // Stored file was deleted or never written: prune stale record
            SharedPreferences sp = get(context);
            if (sp != null) {
                sp.edit().remove(key).apply();
            }
        } catch (Throwable ignored) {}
        return false;
    }

    private static boolean verifyStoredMediaExists(Context context, String stored) {
        if (stored == null || stored.isEmpty() || "done".equals(stored)) {
            return false;
        }

        if (stored.startsWith("content://")) {
            try (AssetFileDescriptor afd = context.getContentResolver().openAssetFileDescriptor(Uri.parse(stored), "r")) {
                return afd != null && afd.getLength() != 0;
            } catch (Throwable ignored) {
                return false;
            }
        }

        File f = new File(stored);
        if (f.exists() && f.length() > 0) return true;

        File dlDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
        File picDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES);
        String baseName = f.getName();

        File fDl = new File(dlDir, stored);
        if (fDl.exists() && fDl.length() > 0) return true;
        File fDlSub = new File(new File(dlDir, "BraveMedia"), baseName);
        if (fDlSub.exists() && fDlSub.length() > 0) return true;
        File fPicSub = new File(new File(picDir, "BraveMedia"), baseName);
        if (fPicSub.exists() && fPicSub.length() > 0) return true;

        // On Android 10+, also verify via MediaStore (covers Chromium native Downloads)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q && baseName != null && !baseName.isEmpty()) {
            if (existsInMediaStore(
                    context,
                    MediaStore.Downloads.EXTERNAL_CONTENT_URI,
                    baseName,
                    new String[]{
                            Environment.DIRECTORY_DOWNLOADS + "/",
                            Environment.DIRECTORY_DOWNLOADS + "/BraveMedia/"
                    }
            )) {
                return true;
            }
            if (existsInMediaStore(
                    context,
                    MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
                    baseName,
                    new String[]{
                            Environment.DIRECTORY_PICTURES + "/BraveMedia/",
                            Environment.DIRECTORY_DOWNLOADS + "/",
                            Environment.DIRECTORY_DOWNLOADS + "/BraveMedia/"
                    }
            )) {
                return true;
            }
        }

        return false;
    }

    private static boolean existsInMediaStore(
            Context context,
            Uri collection,
            String displayName,
            String[] allowedRelativePaths
    ) {
        String[] projection = new String[]{
                MediaStore.MediaColumns._ID,
                MediaStore.MediaColumns.SIZE,
                MediaStore.MediaColumns.RELATIVE_PATH
        };
        String selection = MediaStore.MediaColumns.DISPLAY_NAME + "=?";
        try (Cursor c = context.getContentResolver().query(collection, projection, selection, new String[]{displayName}, null)) {
            if (c != null) {
                while (c.moveToNext()) {
                    long size = c.getLong(1);
                    if (size <= 0) continue;
                    String relPath = c.getString(2);
                    if (relPath == null) continue;
                    String normalized = relPath.endsWith("/") ? relPath : (relPath + "/");
                    for (String allowed : allowedRelativePaths) {
                        if (normalized.equalsIgnoreCase(allowed)) {
                            return true;
                        }
                    }
                }
            }
        } catch (Throwable ignored) {}
        return false;
    }

    public static void markMediaDownloaded(Context context, String url, String filePathOrUri) {
        if (context == null || url == null || url.isEmpty()) return;
        if (filePathOrUri == null || filePathOrUri.isEmpty() || "done".equals(filePathOrUri)) return;
        try {
            setString(context, downloadedKeyForUrl(url), filePathOrUri);
        } catch (Throwable ignored) {}
    }
}
