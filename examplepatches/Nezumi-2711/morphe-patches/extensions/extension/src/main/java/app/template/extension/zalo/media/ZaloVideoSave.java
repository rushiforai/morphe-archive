package app.template.extension.zalo.media;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;
import app.template.extension.zalo.shared.ZaloEnv;

/**
 * "Tải video về máy" / "Download video" item for the Zalo Video (short video tab) action sheet; saves the video to Movies/Zalo.
 * Uses the progressive mp4 ("mp4_265") when present, else downloads the HLS stream and remuxes it to mp4.
 */
public final class ZaloVideoSave {
    private ZaloVideoSave() { }

    private static final String TAG = "ZaloVideoSave";
    private static final int ITEM_TYPE = 9001;
    private static final int ICON_DOWNLOAD = 0x7f080c21; // vkk.ic_bottom_sheet_menu_download (26.11.01)
    private static final String CONTENT = "com.zing.zalo.shortvideo.domain.entity.content.Content";
    private static final String VIDEO = "com.zing.zalo.shortvideo.domain.entity.content.Video";
    private static final String ITEM = "ok7"; // obfuscated action-sheet row model, pinned (checked by the patch)
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** z6() hook: appends the Save row when the current video has an mp4 or HLS link. */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public static void addItem(Object sheet, ArrayList list) {
        try {
            if (list == null) {
                NezumiLog.w(Patch.SAVE_MEDIA, TAG, "addItem: row list is null, nothing added");
                return;
            }
            if (!isDownloadable(findVideoSafe(sheet))) {
                explainMissing(sheet);
                return;
            }
            Class<?> itemClass = Class.forName(ITEM, false, sheet.getClass().getClassLoader());
            for (Constructor<?> constructor : itemClass.getDeclaredConstructors()) {
                Class<?>[] types = constructor.getParameterTypes();
                if (types.length == 6 && types[0] == int.class && types[2] == Integer.class
                    && types[3] == String.class && types[4] == String.class && types[5] == String.class) {
                    constructor.setAccessible(true);
                    list.add(constructor.newInstance(ITEM_TYPE, null, Integer.valueOf(ICON_DOWNLOAD), text("Tải video về máy", "Download video"), null, null));
                    return;
                }
            }
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "item constructor not found");
        } catch (Throwable failure) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "addItem", failure);
        }
    }

    /** x2() hook: returns true when the click was ours (the original handler must be skipped). */
    public static boolean onItemClick(Object sheet, Object item) {
        try {
            if (item == null || !ITEM.equals(item.getClass().getName())) return false;
            Field type = item.getClass().getDeclaredField("a");
            type.setAccessible(true);
            if (type.getInt(item) != ITEM_TYPE) return false;
            Object video = findVideoSafe(sheet);
            String mp4 = videoMp4(video);
            String hls = mp4 == null ? videoHls(video) : null;
            dismiss(sheet);
            if (mp4 == null && hls == null) {
                toast(text("Tải video thất bại", "Video download failed"));
                return true;
            }
            start(mp4, hls);
            return true;
        } catch (Throwable failure) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "onItemClick", failure);
            return false;
        }
    }

    private static void dismiss(Object sheet) {
        try {
            Method method = sheet.getClass().getMethod("w6");
            method.invoke(sheet);
        } catch (Throwable failure) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "dismiss", failure);
        }
    }

    // ---- model lookup ----

    private static Object findVideoSafe(Object sheet) {
        try {
            return findVideo(sheet);
        } catch (Throwable failure) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "findVideo", failure);
            return null;
        }
    }

    /** A Save row is offered for any video with an mp4 or an HLS link. */
    private static boolean isDownloadable(Object video) {
        try {
            return videoMp4(video) != null || videoHls(video) != null;
        } catch (Throwable failure) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "isDownloadable", failure);
            return false;
        }
    }

    /** Video.g ("hls" / "hls_url") when it is a usable http(s) link, else null. */
    private static String videoHls(Object video) throws ReflectiveOperationException {
        if (video == null) return null;
        Object value = video.getClass().getField("g").get(video);
        if (!(value instanceof String)) return null;
        String url = ((String) value).trim();
        if (url.isEmpty() || "null".equals(url) || !url.startsWith("http")) return null;
        return url;
    }

    /** Video.h ("mp4_265") when it is a usable http(s) link, else null. */
    private static String videoMp4(Object video) throws ReflectiveOperationException {
        if (video == null) return null;
        Object value = video.getClass().getField("h").get(video); // Video.h = "mp4_265"
        if (!(value instanceof String)) return null;
        String url = ((String) value).trim();
        if (url.isEmpty() || "null".equals(url) || !url.startsWith("http")) return null;
        return url;
    }

    /**
     * c1s.l hook (long-press / share gate of the Zalo Video player): true forces the native VideoActionBottomSheet
     * (which carries our download row) instead of the server Zinstant sheet. Only for the long-press kind (b59.SHARE_MORE)
     * and only when the video has an mp4 or HLS link; anything else (share arrow, no link, Photo, failure) keeps
     * the original Zinstant sheet.
     */
    public static boolean forceNativeSheet(Object kind, Object content) {
        try {
            String kindName = kind instanceof Enum ? ((Enum<?>) kind).name() : String.valueOf(kind);
            if (!"SHARE_MORE".equals(kindName)) return false;
            if (content == null) {
                NezumiLog.w(Patch.SAVE_MEDIA, TAG, "forceNativeSheet: kind=SHARE_MORE, content null -> keep Zinstant sheet");
                return false;
            }
            Class<?> videoClass = Class.forName(VIDEO, false, content.getClass().getClassLoader());
            if (!videoClass.isInstance(content)) {
                NezumiLog.w(Patch.SAVE_MEDIA, TAG, "forceNativeSheet: kind=SHARE_MORE, content " + content.getClass().getName()
                    + " is not a Video -> keep Zinstant sheet");
                return false;
            }
            boolean mp4 = videoMp4(content) != null;
            boolean hls = videoHls(content) != null;
            boolean force = mp4 || hls;
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "forceNativeSheet: kind=SHARE_MORE, mp4 " + (mp4 ? "present" : "missing")
                + ", hls " + (hls ? "present" : "missing") + (force ? " -> native sheet" : " -> keep Zinstant sheet"));
            return force;
        } catch (Throwable failure) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "forceNativeSheet: failed -> keep Zinstant sheet", failure);
            return false;
        }
    }

    /**
     * Diagnostics only (no behavior change): explains why no Save row was added, so a device log can tell
     * "HLS-only video" apart from "handler/field layout differs" and "no video entity".
     */
    private static void explainMissing(Object sheet) {
        try {
            if (sheet == null) {
                NezumiLog.w(Patch.SAVE_MEDIA, TAG, "addItem: no row, sheet is null");
                return;
            }
            Object handler = findHandler(sheet);
            if (handler == null) {
                NezumiLog.w(Patch.SAVE_MEDIA, TAG, "addItem: no row, action handler Q1 missing/null on " + sheet.getClass().getName());
                return;
            }
            Object video = findVideo(sheet);
            if (video == null) {
                NezumiLog.w(Patch.SAVE_MEDIA, TAG, "addItem: no row, no Video entity found in handler " + handler.getClass().getName());
                return;
            }
            Object mp4 = video.getClass().getField("h").get(video); // Video.h = "mp4_265"
            Object hls = video.getClass().getField("g").get(video); // Video.g = "hls" / "hls_url"
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "addItem: no row, mp4 (Video.h) " + describe(mp4) + ", hls (Video.g) " + describe(hls)
                + " -> no usable link");
        } catch (Throwable failure) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "addItem: no row, diagnostics failed", failure);
        }
    }

    private static String describe(Object value) {
        if (value == null) return "null";
        if (!(value instanceof String)) return "non-string " + value.getClass().getName();
        String text = ((String) value).trim();
        if (text.isEmpty() || "null".equals(text)) return "empty";
        return text.startsWith("http") ? "present" : "present but not http";
    }

    /** sheet.Q1: the action handler that holds the Content. */
    private static Object findHandler(Object sheet) throws ReflectiveOperationException {
        for (Class<?> c = sheet.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            try {
                Field field = c.getDeclaredField("Q1");
                field.setAccessible(true);
                Object handler = field.get(sheet);
                if (handler != null) return handler;
            } catch (NoSuchFieldException notHere) {
                // Expected while walking up the hierarchy; logcat only.
                NezumiLog.d(Patch.SAVE_MEDIA, TAG, "Q1 not declared on " + c.getName() + ", trying superclass");
            }
        }
        return null;
    }

    /** sheet.Q1 (action handler) holds the Content; found by type so renamed fields do not matter. */
    private static Object findVideo(Object sheet) throws ReflectiveOperationException {
        Class<?> contentClass = Class.forName(CONTENT, false, sheet.getClass().getClassLoader());
        Class<?> videoClass = Class.forName(VIDEO, false, sheet.getClass().getClassLoader());
        Object handler = findHandler(sheet);
        if (handler == null) return null;
        for (Class<?> c = handler.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field field : c.getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(field.getModifiers())) continue;
                if (!contentClass.isAssignableFrom(field.getType()) && field.getType() != Object.class) continue;
                field.setAccessible(true);
                Object value = field.get(handler);
                if (value != null && videoClass.isInstance(value)) return value;
            }
        }
        return null;
    }

    // ---- download ----

    private static void start(String url, String hls) {
        List<String[]> videos = new ArrayList<>(1);
        videos.add(new String[] { url, hls });
        saveVideos(videos);
    }

    /**
     * Downloads each {mp4, hls} pair sequentially on one worker thread into Movies/Zalo. Each video tries its
     * progressive mp4 first and falls back to the HLS stream (remuxed to mp4) when the mp4 is missing or fails.
     * One start toast and one result toast for the whole batch.
     */
    static void saveVideos(final List<String[]> videos) {
        final int total = videos == null ? 0 : videos.size();
        final Context context = ZaloEnv.appContext(Patch.SAVE_MEDIA);
        if (context == null || total == 0) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "saveVideos: " + (context == null ? "no app context" : "no videos"));
            toast(text("Tải video thất bại", "Video download failed"));
            return;
        }
        toast(total == 1
            ? text("Đang tải video…", "Downloading video…")
            : text("Đang tải " + total + " video…", "Downloading " + total + " videos…"));
        final List<String[]> batch = new ArrayList<>(videos);
        Thread worker = new Thread(new Runnable() {
            @Override public void run() {
                String stamp = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(new Date());
                int saved = 0;
                for (int i = 0; i < total; i++) {
                    String[] video = batch.get(i);
                    String mp4 = video == null || video.length < 1 ? null : video[0];
                    String hls = video == null || video.length < 2 ? null : video[1];
                    String name = "Zalo_" + stamp + (total == 1 ? "" : "_" + (i + 1)) + ".mp4";
                    if (saveOne(context, name, mp4, hls, (i + 1) + "/" + total)) saved++;
                }
                NezumiLog.i(Patch.SAVE_MEDIA, TAG, "saveVideos: saved " + saved + "/" + total);
                if (saved == total) {
                    toast(total == 1
                        ? text("Đã tải video vào Thư viện", "Video saved to Gallery")
                        : text("Đã tải " + total + " video vào Thư viện", total + " videos saved to Gallery"));
                } else if (saved == 0) {
                    toast(text("Tải video thất bại", "Video download failed"));
                } else {
                    toast(text("Đã tải " + saved + "/" + total + " video vào Thư viện",
                        saved + " of " + total + " videos saved to Gallery"));
                }
            }
        }, "nezumi-save-video");
        worker.start();
    }

    /** One video: mp4 first, HLS fallback. Never throws. */
    private static boolean saveOne(final Context context, String name, final String mp4, final String hls, String label) {
        if (mp4 != null) {
            try {
                MediaStoreWriter.saveVideo(context, name, new MediaStoreWriter.Source() {
                    @Override public void writeTo(OutputStream out) throws IOException {
                        download(mp4, out);
                    }
                });
                NezumiLog.i(Patch.SAVE_MEDIA, TAG, "save " + label + ": mp4 saved as " + name);
                return true;
            } catch (Throwable failure) {
                NezumiLog.e(Patch.SAVE_MEDIA, TAG, "save " + label + ": mp4 failed" + (hls != null ? ", trying HLS" : ""), failure);
            }
        }
        if (hls != null) {
            try {
                if (mp4 == null) NezumiLog.w(Patch.SAVE_MEDIA, TAG, "save " + label + ": HLS-only video, downloading stream");
                MediaStoreWriter.saveVideo(context, name, new MediaStoreWriter.Source() {
                    @Override public void writeTo(OutputStream out) throws IOException {
                        HlsDownloader.download(hls, context.getCacheDir(), out);
                    }
                });
                NezumiLog.i(Patch.SAVE_MEDIA, TAG, "save " + label + ": HLS saved as " + name);
                return true;
            } catch (Throwable failure) {
                NezumiLog.e(Patch.SAVE_MEDIA, TAG, "save " + label + ": HLS failed", failure);
            }
        }
        if (mp4 == null && hls == null) NezumiLog.w(Patch.SAVE_MEDIA, TAG, "save " + label + ": no mp4 or HLS link");
        return false;
    }

    /** Plain HTTP GET with manual redirects (max 6 hops); throws on non-200 or an empty body. Shared with {@link PostPhotoSave}. */
    static void download(String address, OutputStream out) throws IOException {
        String current = address;
        for (int hops = 0; hops < 6; hops++) {
            HttpURLConnection connection = (HttpURLConnection) new URL(current).openConnection();
            connection.setInstanceFollowRedirects(false);
            connection.setConnectTimeout(15000);
            connection.setReadTimeout(30000);
            try {
                int code = connection.getResponseCode();
                if (code == 301 || code == 302 || code == 303 || code == 307 || code == 308) {
                    String location = connection.getHeaderField("Location");
                    if (location == null) throw new IOException("redirect without location");
                    current = new URL(new URL(current), location).toString();
                    continue;
                }
                if (code != 200) throw new IOException("HTTP " + code);
                try (InputStream in = connection.getInputStream()) {
                    byte[] buffer = new byte[64 * 1024];
                    long total = 0;
                    int read;
                    while ((read = in.read(buffer)) != -1) {
                        out.write(buffer, 0, read);
                        total += read;
                    }
                    if (total == 0) throw new IOException("empty body");
                }
                return;
            } finally {
                connection.disconnect();
            }
        }
        throw new IOException("too many redirects");
    }

    /** Picks the label for Zalo's current UI language (Vietnamese or English). */
    static String text(String vietnamese, String english) {
        Context context = ZaloEnv.appContext(Patch.SAVE_MEDIA);
        return context == null || ZaloEnv.isVietnamese(Patch.SAVE_MEDIA, context) ? vietnamese : english;
    }

    static void toast(final String message) {
        final Context context = ZaloEnv.appContext(Patch.SAVE_MEDIA);
        if (context == null) return;
        MAIN.post(new Runnable() {
            @Override public void run() {
                try {
                    Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
                } catch (Throwable failure) {
                    // Never crash the host.
                    NezumiLog.swallowedOnce(Patch.SAVE_MEDIA, TAG, "toast failed", failure);
                }
            }
        });
    }
}
