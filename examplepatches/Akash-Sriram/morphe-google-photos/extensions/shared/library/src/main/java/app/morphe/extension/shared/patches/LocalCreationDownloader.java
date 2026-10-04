package app.morphe.extension.shared.patches;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Locale;
import java.util.SimpleTimeZone;
import java.util.TimeZone;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Intercepts saving memory collages in Google Photos.
 * Instead of committing the collage solely to Google's cloud server (which debits account storage quota),
 * this downloader exports the image stream directly to the device's DCIM/Google Photos folder.
 * Google Photos then detects the local file and backs it up under the Pixel XL quota-free exemption.
 *
 * Highlight videos are intentionally NOT intercepted — Google Photos handles their export natively
 * via its own pending-download pipeline (Lbgth;), naming them <Fife_hash>-ExportedMemoryVideo.mp4
 * and later renaming to IMG_<yyyyMMdd_HHmmss>-VIDEO_HIGHLIGHT.mp4.
 *
 * It also hooks into SaveCreationMixin->e(bwel) to check if a collage has already been saved
 * locally. While the permanent saved flag (SharedPreferences) is set, the Save button is
 * suppressed/hidden (matching official behavior), even if the local file is deleted later.
 */
public class LocalCreationDownloader {
    private static final String TAG = "LocalCreationDownloader";
    private static final String PREFS_NAME = "morphe_saved_creations";
    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static volatile Context sAppContext = null;

    /**
     * Interception entry point called directly from SaveCreationMixin (Lakxr->h).
     *
     * @param saveCreationMixin The SaveCreationMixin instance (this)
     * @param mediaList         The collection of media items (Collection<_1846>) to save
     * @return true if intercepted and handled locally; false to allow Google Photos standard cloud save
     */
    public static boolean onSaveRequested(Object saveCreationMixin, Object mediaList) {
        if (saveCreationMixin == null || mediaList == null) {
            return false;
        }

        try {
            Context context = extractContext(saveCreationMixin);
            if (context == null) {
                context = getApplicationContext();
            }
            if (context != null) {
                sAppContext = context.getApplicationContext();
            }

            Collection<?> items = (mediaList instanceof Collection)
                    ? (Collection<?>) mediaList
                    : null;
            if (items == null || items.isEmpty()) {
                return false;
            }

            // Check if all items in the request are already saved locally
            boolean allAlreadySaved = true;
            for (Object media : items) {
                if (media != null && !isCreationSaved(media)) {
                    allAlreadySaved = false;
                    break;
                }
            }

            if (allAlreadySaved) {
                Log.i(TAG, "Creation is already saved locally on device. Suppressing duplicate download.");
                notifySaveListeners(saveCreationMixin, mediaList);
                notifyStoryUi(saveCreationMixin);
                return true;
            }

            final Context appContext = sAppContext != null ? sAppContext : context.getApplicationContext();
            Log.i(TAG, "Intercepted creation save request for " + items.size() + " item(s). Redirecting to DCIM/Google Photos.");

            // Dispatch background save to avoid blocking the main UI thread
            EXECUTOR.execute(() -> {
                int successCount = 0;
                for (Object media : items) {
                    if (media == null) continue;
                    if (saveSingleItem(appContext, media)) {
                        successCount++;
                    }
                }

                final int saved = successCount;
                MAIN_HANDLER.post(() -> {
                    if (saved > 0) {
                        Log.i(TAG, "Successfully exported " + saved + " creation(s) to DCIM/Google Photos.");

                        // Notify save listeners AFTER download finishes so the UI updates
                        // button state to Saved and advances/dismisses story
                        notifySaveListeners(saveCreationMixin, mediaList);
                        notifyStoryUi(saveCreationMixin);
                    } else {
                        Log.w(TAG, "Failed to resolve local stream for creation item(s).");
                    }
                });
            });

            return true;
        } catch (Throwable t) {
            Log.e(TAG, "Error during onSaveRequested interception", t);
            return false;
        }
    }

    public static class CreationTime {
        public final long utcMs;
        public final long tzOffsetMs;

        public CreationTime(long utcMs, long tzOffsetMs) {
            this.utcMs = utcMs;
            this.tzOffsetMs = tzOffsetMs;
        }

        public String formatLocalFileName() {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US);
            if (tzOffsetMs != 0) {
                sdf.setTimeZone(new SimpleTimeZone((int) tzOffsetMs, "photo_tz"));
            } else {
                sdf.setTimeZone(TimeZone.getDefault());
            }
            return sdf.format(new Date(utcMs));
        }

        public String formatUtcFileName() {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US);
            sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
            return sdf.format(new Date(utcMs));
        }
    }

    /**
     * Called directly from SaveCreationMixin->e(bwel) to check if an item is already saved.
     * When this returns true, the story button provider (Lakxp->c) returns null, causing
     * the Save button to vanish from the UI.
     * Once saved, this permanently remembers the item so deleting the local file after cloud
     * backup does not resurrect the Save button.
     */
    public static boolean isCreationSaved(Object mediaItem) {
        if (mediaItem == null) return false;
        try {
            String key = extractItemKey(mediaItem);
            CreationTime creationTime = extractCreationTime(mediaItem);

            // 1. Check SharedPreferences for permanent saved flag
            Context ctx = getApplicationContext();
            if (ctx != null) {
                SharedPreferences prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
                if (key != null && (prefs.getBoolean(key + "_saved", false) || prefs.contains(key))) {
                    return true;
                }
            }

            // 2. Check deterministic file paths in DCIM/Google Photos
            // Note: highlight videos are handled natively by Google Photos — we only check collages.
            File dir = getGooglePhotosDir();
            if (dir.exists()) {
                // Primary: local wall-clock filename (matches stock camera / GP naming)
                File officialCollage = new File(dir, getOfficialCollageFileName(creationTime));
                if (officialCollage.exists() && officialCollage.length() > 0) {
                    return true;
                }
                // Backward-compat: check earlier UTC-formatted filename
                File utcCollage = new File(dir, "IMG_" + creationTime.formatUtcFileName() + "-COLLAGE.jpg");
                if (utcCollage.exists() && utcCollage.length() > 0) {
                    return true;
                }
                // Backward-compat: old format had milliseconds (yyyyMMdd_HHmmssSSS)
                String dateStr = creationTime.formatUtcFileName();
                File msCollage = new File(dir, "IMG_" + dateStr + "000-COLLAGE.jpg");
                if (msCollage.exists() && msCollage.length() > 0) {
                    return true;
                }
                if (key != null) {
                    File legacyFile = new File(dir, getFileNameForKey(key));
                    if (legacyFile.exists() && legacyFile.length() > 0) {
                        return true;
                    }
                }
            }

            // 3. Check SharedPreferences for mapped file path
            if (ctx != null && key != null) {
                SharedPreferences prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
                String savedPath = prefs.getString(key, null);
                if (savedPath != null) {
                    File f = new File(savedPath);
                    if (f.exists() && f.length() > 0) {
                        return true;
                    }
                    // IMPORTANT: Do NOT remove key if local file is missing.
                    // Google Photos "Free up space" or manual purge shouldn't reset the save state.
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Error in isCreationSaved", t);
        }
        return false;
    }

    public static File getGooglePhotosDir() {
        return new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM), "Google Photos");
    }

    public static String getOfficialCollageFileName(CreationTime time) {
        return "IMG_" + time.formatLocalFileName() + "-COLLAGE.jpg";
    }

    public static String getOfficialCollageFileName(long timestamp) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US);
        sdf.setTimeZone(TimeZone.getDefault());
        return "IMG_" + sdf.format(new Date(timestamp)) + "-COLLAGE.jpg";
    }

    public static String getFileNameForKey(String key) {
        return "Collage_" + sanitizeFileName(key) + ".jpg";
    }

    private static String sanitizeFileName(String input) {
        if (input == null || input.isEmpty()) return "item";
        return input.replaceAll("[^a-zA-Z0-9._-]", "_");
    }

    /**
     * Extracts the historical capture timestamp (epoch ms) and timezone offset of the creation source media.
     * In Google Photos, media items implement bwep which provides h() -> bwol (Timestamp object).
     * bwol contains field e (UTC timestamp in ms) and field f (timezone offset in ms).
     */
    public static CreationTime extractCreationTime(Object mediaItem) {
        if (mediaItem == null) {
            return new CreationTime(System.currentTimeMillis(), 0);
        }

        // 1. Try bwep.h() returning bwol (Timestamp object in Google Photos)
        try {
            Method hMethod = mediaItem.getClass().getMethod("h");
            Object bwol = hMethod.invoke(mediaItem);
            if (bwol != null) {
                long utc = 0;
                long tzOffset = 0;
                try {
                    Field eField = bwol.getClass().getDeclaredField("e");
                    eField.setAccessible(true);
                    utc = eField.getLong(bwol);
                } catch (Throwable ignored) {}

                try {
                    Field fField = bwol.getClass().getDeclaredField("f");
                    fField.setAccessible(true);
                    tzOffset = fField.getLong(bwol);
                } catch (Throwable ignored) {}

                if (utc > 946684800000L && utc < System.currentTimeMillis() + 86400000L * 365) {
                    return new CreationTime(utc, tzOffset);
                }

                // If e field was missing/zero, try bwol.a() (wall-clock timestamp)
                try {
                    Method aMethod = bwol.getClass().getMethod("a");
                    Object res = aMethod.invoke(bwol);
                    if (res instanceof Number) {
                        long ts = ((Number) res).longValue();
                        if (ts > 946684800000L && ts < System.currentTimeMillis() + 86400000L * 365) {
                            return new CreationTime(ts, tzOffset);
                        }
                    }
                } catch (Throwable ignored) {}
            }
        } catch (Throwable ignored) {}

        // 2. Try reflection for TimestampFeature / DateHeaderFeature or any method returning bwol
        for (Method m : mediaItem.getClass().getMethods()) {
            if (m.getParameterTypes().length == 0) {
                String retName = m.getReturnType().getSimpleName();
                if (retName.equals("bwol") || retName.contains("Timestamp")) {
                    try {
                        Object obj = m.invoke(mediaItem);
                        if (obj != null) {
                            long utc = 0;
                            long tzOffset = 0;
                            try {
                                Field eField = obj.getClass().getDeclaredField("e");
                                eField.setAccessible(true);
                                utc = eField.getLong(obj);
                            } catch (Throwable ignored) {}
                            try {
                                Field fField = obj.getClass().getDeclaredField("f");
                                fField.setAccessible(true);
                                tzOffset = fField.getLong(obj);
                            } catch (Throwable ignored) {}

                            if (utc > 946684800000L && utc < System.currentTimeMillis() + 86400000L * 365) {
                                return new CreationTime(utc, tzOffset);
                            }

                            Method aMethod = obj.getClass().getMethod("a");
                            long ts = ((Number) aMethod.invoke(obj)).longValue();
                            if (ts > 946684800000L && ts < System.currentTimeMillis() + 86400000L * 365) {
                                return new CreationTime(ts, tzOffset);
                            }
                        }
                    } catch (Throwable ignored) {}
                } else if (m.getReturnType() == long.class || m.getReturnType() == Long.class) {
                    String name = m.getName().toLowerCase(Locale.US);
                    if (name.contains("time") || name.contains("date") || name.contains("timestamp")) {
                        try {
                            long ts = ((Number) m.invoke(mediaItem)).longValue();
                            if (ts > 946684800000L && ts < System.currentTimeMillis() + 86400000L * 365) {
                                return new CreationTime(ts, 0);
                            }
                        } catch (Throwable ignored) {}
                    }
                }
            }
        }

        return new CreationTime(System.currentTimeMillis(), 0);
    }

    public static long extractCreationTimestamp(Object mediaItem) {
        return extractCreationTime(mediaItem).utcMs;
    }

    /**
     * Extracts a stable identifier for a media item (_1846 / bwel).
     */
    public static String extractItemKey(Object mediaItem) {
        if (mediaItem == null) return null;

        // 1. Try bwep.e() returning long ID
        try {
            Method eMethod = mediaItem.getClass().getMethod("e");
            if (eMethod.getReturnType() == long.class || eMethod.getReturnType() == Long.class) {
                long id = ((Number) eMethod.invoke(mediaItem)).longValue();
                if (id != 0 && id != -1) {
                    return "id_" + id;
                }
            }
        } catch (Throwable ignored) {}

        // 2. Check 0-arg methods returning String
        for (Method m : mediaItem.getClass().getMethods()) {
            if (m.getParameterTypes().length == 0 && m.getReturnType() == String.class) {
                String name = m.getName().toLowerCase(Locale.US);
                if (name.contains("key") || name.contains("dedup") || name.equals("i")) {
                    try {
                        String val = (String) m.invoke(mediaItem);
                        if (val != null && val.length() > 5 && !val.contains("com.google") && !val.contains("@")) {
                            return val;
                        }
                    } catch (Throwable ignored) {}
                }
            }
        }

        // 3. Check fields
        for (Field f : mediaItem.getClass().getDeclaredFields()) {
            if (f.getType() == String.class) {
                String name = f.getName().toLowerCase(Locale.US);
                if (name.contains("key") || name.contains("dedup")) {
                    try {
                        f.setAccessible(true);
                        String val = (String) f.get(mediaItem);
                        if (val != null && val.length() > 5 && !val.contains("com.google") && !val.contains("@")) {
                            return val;
                        }
                    } catch (Throwable ignored) {}
                }
            } else if (f.getType() == long.class) {
                try {
                    f.setAccessible(true);
                    long val = f.getLong(mediaItem);
                    if (val > 0) return "id_" + val;
                } catch (Throwable ignored) {}
            }
        }

        // 4. Fallback to hash code
        return "item_" + Math.abs(mediaItem.toString().hashCode());
    }

    private static String extractKeyFromUri(Uri uri) {
        if (uri == null) return null;
        String path = uri.getPath();
        if (path == null) return null;
        int lastSlash = path.lastIndexOf('/');
        if (lastSlash >= 0 && lastSlash < path.length() - 1) {
            String seg = path.substring(lastSlash + 1);
            int eq = seg.indexOf('=');
            if (eq > 0) seg = seg.substring(0, eq);
            if (seg.length() > 10) return seg;
        }
        return null;
    }

    private static boolean saveSingleItem(Context context, Object mediaItem) {
        Uri mediaUri = resolveMediaUri(context, mediaItem);
        if (mediaUri == null) {
            Log.w(TAG, "Could not resolve URI for media item: " + mediaItem);
            return false;
        }

        Log.d(TAG, "Resolved creation URI: " + mediaUri);
        ContentResolver resolver = context.getContentResolver();
        String mimeType = resolver.getType(mediaUri);
        if (mimeType == null) {
            mimeType = "image/jpeg";
        }

        // Only intercept image collages — highlight videos are exported natively by Google Photos.
        if (mimeType.startsWith("video/")) {
            Log.i(TAG, "Skipping video item — handled natively by Google Photos.");
            return false;
        }

        CreationTime creationTime = extractCreationTime(mediaItem);
        String fileName = getOfficialCollageFileName(creationTime);
        File targetFile = new File(getGooglePhotosDir(), fileName);

        String itemKey = extractItemKey(mediaItem);
        String uriKey = extractKeyFromUri(mediaUri);

        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                ContentValues values = new ContentValues();
                values.put(MediaStore.MediaColumns.DISPLAY_NAME, fileName);
                values.put(MediaStore.MediaColumns.MIME_TYPE, mimeType);
                values.put(MediaStore.MediaColumns.RELATIVE_PATH, "DCIM/Google Photos");
                values.put(MediaStore.MediaColumns.DATE_ADDED, creationTime.utcMs / 1000);
                values.put(MediaStore.MediaColumns.DATE_MODIFIED, creationTime.utcMs / 1000);
                values.put(MediaStore.Images.Media.DATE_TAKEN, creationTime.utcMs);
                values.put(MediaStore.MediaColumns.IS_PENDING, 1);

                Uri inserted = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values);
                if (inserted == null) {
                    Log.e(TAG, "Failed to create MediaStore entry for " + fileName);
                    return false;
                }

                try (InputStream in = openMediaStream(resolver, mediaUri);
                     OutputStream out = resolver.openOutputStream(inserted)) {
                    if (in == null || out == null) {
                        return false;
                    }
                    byte[] buffer = new byte[16384];
                    int len;
                    while ((len = in.read(buffer)) > 0) {
                        out.write(buffer, 0, len);
                    }
                }

                values.clear();
                values.put(MediaStore.MediaColumns.IS_PENDING, 0);
                resolver.update(inserted, values, null, null);

                // Set file modification timestamp if accessible directly
                if (targetFile.exists()) {
                    targetFile.setLastModified(creationTime.utcMs);
                }

                // Index with MediaScanner so Google Photos sees it immediately
                MediaScannerConnection.scanFile(context,
                        new String[]{targetFile.getAbsolutePath()},
                        new String[]{mimeType},
                        null);

                recordSavedItem(context, itemKey, uriKey, fileName, targetFile.getAbsolutePath());
                return true;
            } else {
                File dcimDir = getGooglePhotosDir();
                if (!dcimDir.exists() && !dcimDir.mkdirs()) {
                    Log.e(TAG, "Failed to create directory: " + dcimDir.getAbsolutePath());
                    return false;
                }

                try (InputStream in = openMediaStream(resolver, mediaUri);
                     OutputStream out = new FileOutputStream(targetFile)) {
                    if (in == null) return false;
                    byte[] buffer = new byte[16384];
                    int len;
                    while ((len = in.read(buffer)) > 0) {
                        out.write(buffer, 0, len);
                    }
                }

                targetFile.setLastModified(creationTime.utcMs);

                MediaScannerConnection.scanFile(context,
                        new String[]{targetFile.getAbsolutePath()},
                        new String[]{mimeType},
                        null);

                recordSavedItem(context, itemKey, uriKey, fileName, targetFile.getAbsolutePath());
                return true;
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error streaming creation to local storage", t);
            return false;
        }
    }

    private static void recordSavedItem(Context context, String itemKey, String uriKey, String fileName, String filePath) {
        if (context == null) return;
        try {
            SharedPreferences prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            SharedPreferences.Editor edit = prefs.edit();
            if (itemKey != null) {
                edit.putBoolean(itemKey + "_saved", true);
                edit.putString(itemKey, filePath);
            }
            if (uriKey != null) {
                edit.putBoolean(uriKey + "_saved", true);
                edit.putString(uriKey, filePath);
            }
            if (fileName != null) {
                edit.putBoolean(fileName + "_saved", true);
            }
            edit.apply();
        } catch (Throwable ignored) {}
    }

    private static InputStream openMediaStream(ContentResolver resolver, Uri uri) throws Exception {
        String scheme = uri.getScheme();
        if ("http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme)) {
            String urlStr = uri.toString();

            // Force original quality for Fife (googleusercontent) URLs.
            if (urlStr.contains("googleusercontent.com") || urlStr.contains("lh3.google")) {
                int eqPos = urlStr.lastIndexOf('=');
                int slashAfterHost = urlStr.indexOf('/', urlStr.indexOf("://") + 3);
                if (eqPos > 0 && eqPos > slashAfterHost) {
                    String suffix = urlStr.substring(eqPos);
                    if (!suffix.contains("&") && !suffix.contains("?")) {
                        urlStr = urlStr.substring(0, eqPos) + "=d";
                    } else {
                        urlStr = urlStr.replaceAll("=s\\d+", "=d").replaceAll("=w\\d+-h\\d+", "=d");
                    }
                } else {
                    urlStr = urlStr + "=d";
                }
                Log.d(TAG, "Upgraded Fife URL to original quality: " + urlStr);
            }

            java.net.HttpURLConnection conn = (java.net.HttpURLConnection) new java.net.URL(urlStr).openConnection();
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(60000);
            conn.setInstanceFollowRedirects(true);
            conn.setRequestProperty("User-Agent", "Mozilla/5.0");
            int responseCode = conn.getResponseCode();
            if (responseCode >= 400) {
                Log.w(TAG, "HTTP " + responseCode + " for URL: " + urlStr + " — falling back to original URI");
                conn.disconnect();
                conn = (java.net.HttpURLConnection) new java.net.URL(uri.toString()).openConnection();
                conn.setConnectTimeout(15000);
                conn.setReadTimeout(60000);
                conn.setInstanceFollowRedirects(true);
            }
            return conn.getInputStream();
        } else {
            return resolver.openInputStream(uri);
        }
    }

    private static Uri resolveMediaUri(Context context, Object mediaItem) {
        // Attempt 1: Photos DI Binder (bzeq / ahug) with MediaUriProvider (wiy)
        String[] binderClasses = {"bzeq", "ahug"};
        String[] providerClasses = {"wiy"};

        for (String binderName : binderClasses) {
            try {
                Class<?> binderCls = Class.forName(binderName);
                for (String provName : providerClasses) {
                    try {
                        Class<?> provCls = Class.forName(provName);
                        Object provider = null;

                        // Try static method e(Context, Class) on binder
                        try {
                            Method eMethod = binderCls.getMethod("e", Context.class, Class.class);
                            provider = eMethod.invoke(null, context, provCls);
                        } catch (Throwable ignored) {}

                        // Try static method i(Context, Class) on binder
                        if (provider == null) {
                            try {
                                Method iMethod = binderCls.getMethod("i", Context.class, Class.class);
                                provider = iMethod.invoke(null, context, provCls);
                            } catch (Throwable ignored) {}
                        }

                        // Try static method b(Context, Class) / a(Context, Class)
                        if (provider == null) {
                            try {
                                Method bMethod = binderCls.getMethod("b", Context.class, Class.class);
                                provider = bMethod.invoke(null, context, provCls);
                            } catch (Throwable ignored) {}
                        }

                        if (provider != null) {
                            // If provider is a wrapper (e.g. Component / ahtz), unwrap via a() or get()
                            try {
                                Method unwrapMethod = provider.getClass().getMethod("a");
                                Object unwrapped = unwrapMethod.invoke(provider);
                                if (unwrapped != null) {
                                    provider = unwrapped;
                                }
                            } catch (Throwable ignored) {}

                            // Call provider.a(mediaItem)
                            try {
                                for (Method pm : provider.getClass().getMethods()) {
                                    if (pm.getParameterTypes().length == 1 &&
                                        pm.getParameterTypes()[0].isInstance(mediaItem) &&
                                        Uri.class.isAssignableFrom(pm.getReturnType())) {
                                        Uri uri = (Uri) pm.invoke(provider, mediaItem);
                                        if (uri != null) return uri;
                                    }
                                }
                            } catch (Throwable ignored) {}

                            // Try wiw.d (ORIGINAL) or wiw.c (LARGE)
                            try {
                                Class<?> wiwClass = Class.forName("wiw");
                                for (Method pm : provider.getClass().getMethods()) {
                                    if (pm.getParameterTypes().length == 3 &&
                                        pm.getParameterTypes()[0].isInstance(mediaItem) &&
                                        Uri.class.isAssignableFrom(pm.getReturnType())) {
                                        try {
                                            Object origVal = wiwClass.getField("d").get(null);
                                            Uri uri = (Uri) pm.invoke(provider, mediaItem, origVal, 0);
                                            if (uri != null) return uri;
                                        } catch (Throwable ignored) {}
                                    }
                                }
                            } catch (Throwable ignored) {}
                        }
                    } catch (ClassNotFoundException ignored) {}
                }
            } catch (ClassNotFoundException ignored) {}
        }

        // Attempt 2: Check methods on mediaItem itself that return Uri
        try {
            for (Method m : mediaItem.getClass().getMethods()) {
                if (m.getParameterTypes().length == 0 && Uri.class.isAssignableFrom(m.getReturnType())) {
                    try {
                        Uri uri = (Uri) m.invoke(mediaItem);
                        if (uri != null && uri.toString().length() > 0) {
                            return uri;
                        }
                    } catch (Throwable ignored) {}
                }
            }
        } catch (Throwable ignored) {}

        // Attempt 3: Check fields on mediaItem for Uri
        try {
            for (Field f : mediaItem.getClass().getDeclaredFields()) {
                if (Uri.class.isAssignableFrom(f.getType())) {
                    try {
                        f.setAccessible(true);
                        Uri uri = (Uri) f.get(mediaItem);
                        if (uri != null && uri.toString().length() > 0) {
                            return uri;
                        }
                    } catch (Throwable ignored) {}
                }
            }
        } catch (Throwable ignored) {}

        Log.w(TAG, "Failed resolving media URI via all providers for item: " + mediaItem);
        return null;
    }

    private static Context extractContext(Object mixin) {
        for (Field f : mixin.getClass().getDeclaredFields()) {
            if (Context.class.isAssignableFrom(f.getType())) {
                try {
                    f.setAccessible(true);
                    return (Context) f.get(mixin);
                } catch (Throwable ignored) {}
            }
        }
        return null;
    }

    private static Context getApplicationContext() {
        if (sAppContext != null) return sAppContext;
        try {
            Class<?> atCls = Class.forName("android.app.ActivityThread");
            Method caMethod = atCls.getMethod("currentApplication");
            Object app = caMethod.invoke(null);
            if (app instanceof Context) {
                sAppContext = ((Context) app).getApplicationContext();
                return sAppContext;
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static void notifySaveListeners(Object mixin, Object mediaList) {
        // Direct call to Lakxr->c(Lcchb) which notifies save listeners
        try {
            for (Method m : mixin.getClass().getDeclaredMethods()) {
                if (m.getName().equals("c") && m.getParameterTypes().length == 1) {
                    m.setAccessible(true);
                    m.invoke(mixin, mediaList);
                    Log.d(TAG, "Invoked mixin.c(mediaList) directly");
                    return;
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed invoking mixin.c", t);
        }

        // Generic fallback for any 1-arg void method matching mediaList
        for (Method m : mixin.getClass().getDeclaredMethods()) {
            if (m.getReturnType() == void.class && m.getParameterTypes().length == 1) {
                if (m.getParameterTypes()[0].isInstance(mediaList) ||
                    m.getParameterTypes()[0].isAssignableFrom(mediaList.getClass())) {
                    try {
                        m.setAccessible(true);
                        m.invoke(mixin, mediaList);
                        Log.d(TAG, "Invoked notify method: " + m.getName());
                        return;
                    } catch (Throwable t) {
                        Log.w(TAG, "Failed invoking notify method", t);
                    }
                }
            }
        }
    }

    private static void notifyStoryUi(Object mixin) {
        try {
            for (Field f : mixin.getClass().getDeclaredFields()) {
                f.setAccessible(true);
                Object wrapper = f.get(mixin);
                if (wrapper != null) {
                    Method getMethod = null;
                    try {
                        getMethod = wrapper.getClass().getMethod("a");
                    } catch (NoSuchMethodException ignored) {
                        try {
                            getMethod = wrapper.getClass().getMethod("get");
                        } catch (NoSuchMethodException ignored2) {}
                    }
                    if (getMethod != null) {
                        Object target = getMethod.invoke(wrapper);
                        if (target != null) {
                            for (Method tm : target.getClass().getDeclaredMethods()) {
                                if (tm.getParameterTypes().length == 0 && tm.getReturnType() == void.class) {
                                    if (tm.getName().equals("s") || tm.getName().equals("advance")) {
                                        tm.setAccessible(true);
                                        tm.invoke(target);
                                        Log.d(TAG, "Notified story UI via " + tm.getName());
                                        return;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Could not notify story UI: " + t.getMessage());
        }
    }
}
