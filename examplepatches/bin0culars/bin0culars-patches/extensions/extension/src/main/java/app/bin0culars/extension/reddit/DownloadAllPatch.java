package app.bin0culars.extension.reddit;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.view.ContextThemeWrapper;
import android.widget.Toast;
import app.bin0culars.extension.reddit.settings.BinocularsMods;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

public final class DownloadAllPatch {

    private static volatile Object storedLink;
    private static volatile boolean bypassNext;
    private static final AtomicBoolean DOWNLOAD_IN_PROGRESS = new AtomicBoolean(false);
    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static WeakReference<Activity> currentActivityRef;
    private static boolean lifecycleRegistered;

    public static void setLink(Object link) {
        storedLink = link;
    }

    public static void onActivityResumed(Activity activity) {
        if (activity == null) {
            return;
        }
        currentActivityRef = new WeakReference<>(activity);
        if (!lifecycleRegistered) {
            Application app = activity.getApplication();
            if (app != null) {
                lifecycleRegistered = true;
                app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                    @Override
                    public void onActivityResumed(Activity a) {
                        currentActivityRef = new WeakReference<>(a);
                    }

                    @Override
                    public void onActivityPaused(Activity a) {
                        WeakReference<Activity> ref = currentActivityRef;
                        if (ref != null && ref.get() == a) {
                            currentActivityRef = null;
                        }
                    }

                    @Override
                    public void onActivityCreated(Activity a, Bundle b) {
                    }

                    @Override
                    public void onActivityStarted(Activity a) {
                    }

                    @Override
                    public void onActivityStopped(Activity a) {
                    }

                    @Override
                    public void onActivitySaveInstanceState(Activity a, Bundle b) {
                    }

                    @Override
                    public void onActivityDestroyed(Activity a) {
                    }
                });
            }
        }
    }

    private static void launchOriginalDownload(Object handler, Object block) {
    }

    private static Activity getCurrentActivity() {
        WeakReference<Activity> ref = currentActivityRef;
        if (ref == null) {
            return null;
        }
        Activity a = ref.get();
        if (a == null || a.isFinishing() || a.isDestroyed()) {
            return null;
        }
        return a;
    }

    private static final class GalleryItem {
        final String url;
        final String mimeType;

        GalleryItem(String url, String mimeType) {
            this.url = url;
            this.mimeType = mimeType;
        }
    }

    private static Object resolvePost(Object link) {
        if (link == null) {
            return null;
        }
        Object post = link;
        Object crossPosts = ShareContentPatch.invokeMethod(link, "getCrossPostParentList");
        if (crossPosts instanceof List) {
            List<?> list = (List<?>) crossPosts;
            if (!list.isEmpty() && list.get(0) != null) {
                post = list.get(0);
            }
        }
        return post;
    }

    private static List<GalleryItem> getGalleryItems(Object post) {
        if (post == null) {
            return Collections.emptyList();
        }
        Object gallery = ShareContentPatch.invokeMethod(post, "getGallery");
        if (gallery == null) {
            return Collections.emptyList();
        }
        Object itemsObj = ShareContentPatch.invokeMethod(gallery, "getItems");
        if (!(itemsObj instanceof List)) {
            return Collections.emptyList();
        }
        List<?> items = (List<?>) itemsObj;
        List<GalleryItem> result = new ArrayList<>();
        for (Object item : items) {
            if (item != null) {
                Object urlObj = ShareContentPatch.invokeMethod(item, "getUrl");
                if (urlObj instanceof String) {
                    String url = ((String) urlObj).trim();
                    if (!url.isEmpty()) {
                        Object mimeObj = ShareContentPatch.invokeMethod(item, "getMimeType");
                        String mime = mimeObj instanceof String ? ((String) mimeObj).trim() : null;
                        if (mime != null && mime.isEmpty()) {
                            mime = null;
                        }
                        result.add(new GalleryItem(url, mime));
                    }
                }
            }
        }
        return result;
    }

    public static boolean onDownload(Object handler, Object block) {
        try {
            if (bypassNext) {
                bypassNext = false;
                return false;
            }
            if (!BinocularsMods.isEnabled("download_all_gallery")) {
                return false;
            }
            if (block == null || !block.getClass().getName().endsWith("$downloadMedia$1")) {
                return false;
            }
            Object link = storedLink;
            if (link == null) {
                return false;
            }
            Object post = resolvePost(link);
            if (post == null) {
                return false;
            }
            List<GalleryItem> items = getGalleryItems(post);
            if (items.size() < 2) {
                return false;
            }
            Activity activity = getCurrentActivity();
            if (activity == null) {
                return false;
            }

            Object idObj = ShareContentPatch.invokeMethod(post, "getId");
            String idStr = idObj instanceof String ? ((String) idObj).trim() : null;
            final String postId = (idStr != null && !idStr.isEmpty()) ? idStr : String.valueOf(System.currentTimeMillis());

            Runnable showDialog = () -> {
                try {
                    Activity act = getCurrentActivity();
                    if (act == null) {
                        return;
                    }
                    String title = ShareContentPatch.getString(act, "bin0culars_download_title");
                    String thisOne = ShareContentPatch.getString(act, "bin0culars_download_this");
                    String allFmt = ShareContentPatch.getString(act, "bin0culars_download_all");
                    String allN = String.format(Locale.getDefault(), allFmt, items.size());

                    final Context appContext = act.getApplicationContext();
                    new AlertDialog.Builder(new ContextThemeWrapper(act, android.R.style.Theme_DeviceDefault_DayNight))
                            .setTitle(title)
                            .setItems(new String[]{thisOne, allN}, (dialog, which) -> {
                                if (which == 0) {
                                    bypassNext = true;
                                    launchOriginalDownload(handler, block);
                                } else if (which == 1) {
                                    startBackgroundDownload(appContext, postId, items);
                                }
                            })
                            .setCancelable(true)
                            .show();
                } catch (Throwable ignored) {
                }
            };

            if (Looper.myLooper() == Looper.getMainLooper()) {
                showDialog.run();
            } else {
                MAIN_HANDLER.post(showDialog);
            }
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void startBackgroundDownload(Context context, String postId, List<GalleryItem> items) {
        if (!DOWNLOAD_IN_PROGRESS.compareAndSet(false, true)) {
            return;
        }
        Context appContext = context != null ? context.getApplicationContext() : null;
        showFormattedToast(appContext, "bin0culars_download_all_started", items.size());

        EXECUTOR.execute(() -> {
            try {
                processDownloadAll(appContext, postId, items);
            } finally {
                DOWNLOAD_IN_PROGRESS.set(false);
            }
        });
    }

    private static void processDownloadAll(Context context, String postId, List<GalleryItem> items) {
        if (context == null) {
            return;
        }
        ContentResolver resolver = context.getContentResolver();
        int successCount = 0;

        for (int i = 0; i < items.size(); i++) {
            GalleryItem item = items.get(i);
            Uri itemUri = null;
            HttpURLConnection conn = null;
            try {
                conn = ShareContentPatch.openConnectionWithRedirects(item.url);
                int responseCode = conn.getResponseCode();
                if (responseCode < 200 || responseCode >= 300) {
                    throw new IOException("HTTP error: " + responseCode);
                }

                String contentType = conn.getContentType();
                String mime = null;
                if (contentType != null) {
                    String clean = contentType.split(";")[0].trim().toLowerCase(Locale.US);
                    if (!clean.isEmpty() && !clean.equals("application/octet-stream")) {
                        mime = clean;
                    }
                }
                if (mime == null && item.mimeType != null && !item.mimeType.isEmpty()) {
                    mime = item.mimeType.toLowerCase(Locale.US);
                }

                String ext = null;
                if (mime != null) {
                    ext = ShareContentPatch.getExtensionFromMime(mime);
                }
                if (ext == null) {
                    ext = ShareContentPatch.getExtensionFromUrl(item.url);
                }
                if (ext == null) {
                    ext = (mime != null && mime.startsWith("video/")) ? "mp4" : "jpg";
                }
                if (mime == null) {
                    if ("mp4".equals(ext)) {
                        mime = "video/mp4";
                    } else if ("png".equals(ext)) {
                        mime = "image/png";
                    } else if ("gif".equals(ext)) {
                        mime = "image/gif";
                    } else if ("webp".equals(ext)) {
                        mime = "image/webp";
                    } else {
                        mime = "image/jpeg";
                    }
                }

                boolean isVideo = mime.startsWith("video/") || "mp4".equalsIgnoreCase(ext);
                Uri collectionUri = isVideo
                        ? MediaStore.Video.Media.EXTERNAL_CONTENT_URI
                        : MediaStore.Images.Media.EXTERNAL_CONTENT_URI;

                ContentValues values = new ContentValues();
                values.put(MediaStore.MediaColumns.DISPLAY_NAME, "reddit_" + postId + "_" + (i + 1) + "." + ext);
                values.put(MediaStore.MediaColumns.MIME_TYPE, mime);
                values.put(MediaStore.MediaColumns.RELATIVE_PATH, "Pictures/Reddit");
                values.put(MediaStore.MediaColumns.IS_PENDING, 1);

                itemUri = resolver.insert(collectionUri, values);
                if (itemUri == null) {
                    throw new IOException("Failed to insert MediaStore row");
                }

                try (InputStream in = conn.getInputStream();
                     OutputStream out = resolver.openOutputStream(itemUri)) {
                    if (out == null) {
                        throw new IOException("Failed to open output stream");
                    }
                    byte[] buffer = new byte[8192];
                    int read;
                    while ((read = in.read(buffer)) != -1) {
                        out.write(buffer, 0, read);
                    }
                    out.flush();
                }

                values.clear();
                values.put(MediaStore.MediaColumns.IS_PENDING, 0);
                resolver.update(itemUri, values, null, null);
                itemUri = null;
                successCount++;
            } catch (Throwable t) {
                if (itemUri != null) {
                    try {
                        resolver.delete(itemUri, null, null);
                    } catch (Throwable ignored) {
                    }
                }
            } finally {
                if (conn != null) {
                    conn.disconnect();
                }
            }
        }

        if (successCount == items.size()) {
            showFormattedToast(context, "bin0culars_download_all_done", successCount);
        } else if (successCount > 0) {
            showFormattedToast(context, "bin0culars_download_all_partial", successCount, items.size());
        } else {
            String msg = ShareContentPatch.getString(context, "bin0culars_download_all_failed");
            showToastDirect(context, msg);
        }
    }

    private static void showToastDirect(Context context, String message) {
        if (context == null || message == null || message.isEmpty()) {
            return;
        }
        Context target = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        Runnable r = () -> {
            try {
                Toast.makeText(target, message, Toast.LENGTH_SHORT).show();
            } catch (Throwable ignored) {
            }
        };
        if (Looper.myLooper() == Looper.getMainLooper()) {
            r.run();
        } else {
            MAIN_HANDLER.post(r);
        }
    }

    private static void showFormattedToast(Context context, String stringName, Object... args) {
        if (context == null) {
            return;
        }
        String template = ShareContentPatch.getString(context, stringName);
        if (template.isEmpty()) {
            return;
        }
        String message;
        try {
            message = String.format(Locale.getDefault(), template, args);
        } catch (Throwable t) {
            message = template;
        }
        showToastDirect(context, message);
    }
}
