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
import java.util.Locale;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.shared.ZaloEnv;

/** "Lưu" item for the Zalo Video (short video tab) action sheet; downloads the progressive mp4 to Movies/Zalo. */
public final class ZaloVideoSave {
    private ZaloVideoSave() { }

    private static final String TAG = SaveMedia.TAG;
    private static final int ITEM_TYPE = 9001;
    private static final int ICON_DOWNLOAD = 0x7f080c21; // vkk.ic_bottom_sheet_menu_download (26.11.01)
    private static final String TITLE = "Lưu";
    private static final String CONTENT = "com.zing.zalo.shortvideo.domain.entity.content.Content";
    private static final String VIDEO = "com.zing.zalo.shortvideo.domain.entity.content.Video";
    private static final String ITEM = "ok7"; // obfuscated action-sheet row model, pinned (checked by the patch)
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** z6() hook: appends the Save row when the current video has a progressive mp4 link. */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public static void addItem(Object sheet, ArrayList list) {
        try {
            if (list == null || mp4Url(sheet) == null) return;
            Class<?> itemClass = Class.forName(ITEM, false, sheet.getClass().getClassLoader());
            for (Constructor<?> constructor : itemClass.getDeclaredConstructors()) {
                Class<?>[] types = constructor.getParameterTypes();
                if (types.length == 6 && types[0] == int.class && types[2] == Integer.class
                    && types[3] == String.class && types[4] == String.class && types[5] == String.class) {
                    constructor.setAccessible(true);
                    list.add(constructor.newInstance(ITEM_TYPE, null, Integer.valueOf(ICON_DOWNLOAD), TITLE, null, null));
                    return;
                }
            }
            NezumiLog.w(TAG, "item constructor not found");
        } catch (Throwable failure) {
            NezumiLog.w(TAG, "addItem", failure);
        }
    }

    /** x2() hook: returns true when the click was ours (the original handler must be skipped). */
    public static boolean onItemClick(Object sheet, Object item) {
        try {
            if (item == null || !ITEM.equals(item.getClass().getName())) return false;
            Field type = item.getClass().getDeclaredField("a");
            type.setAccessible(true);
            if (type.getInt(item) != ITEM_TYPE) return false;
            String url = mp4Url(sheet);
            dismiss(sheet);
            if (url == null) {
                toast("Lưu thất bại");
                return true;
            }
            start(url);
            return true;
        } catch (Throwable failure) {
            NezumiLog.w(TAG, "onItemClick", failure);
            return false;
        }
    }

    private static void dismiss(Object sheet) {
        try {
            Method method = sheet.getClass().getMethod("w6");
            method.invoke(sheet);
        } catch (Throwable failure) {
            NezumiLog.w(TAG, "dismiss", failure);
        }
    }

    // ---- model lookup ----

    private static String mp4Url(Object sheet) {
        try {
            Object video = findVideo(sheet);
            if (video == null) return null;
            Object value = video.getClass().getField("h").get(video); // Video.h = "mp4_265"
            if (!(value instanceof String)) return null;
            String url = ((String) value).trim();
            if (url.isEmpty() || "null".equals(url) || !url.startsWith("http")) return null;
            return url;
        } catch (Throwable failure) {
            NezumiLog.w(TAG, "mp4Url", failure);
            return null;
        }
    }

    /** sheet.Q1 (action handler) holds the Content; found by type so renamed fields do not matter. */
    private static Object findVideo(Object sheet) throws ReflectiveOperationException {
        Class<?> contentClass = Class.forName(CONTENT, false, sheet.getClass().getClassLoader());
        Class<?> videoClass = Class.forName(VIDEO, false, sheet.getClass().getClassLoader());
        Object handler = null;
        for (Class<?> c = sheet.getClass(); c != null && c != Object.class && handler == null; c = c.getSuperclass()) {
            try {
                Field field = c.getDeclaredField("Q1");
                field.setAccessible(true);
                handler = field.get(sheet);
            } catch (NoSuchFieldException ignored) {
                // try superclass
            }
        }
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

    private static void start(final String url) {
        final Context context = ZaloEnv.appContext();
        if (context == null) {
            toast("Lưu thất bại");
            return;
        }
        toast("Đang lưu…");
        Thread worker = new Thread(new Runnable() {
            @Override public void run() {
                try {
                    String name = "Zalo_" + new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(new Date()) + ".mp4";
                    MediaStoreWriter.saveVideo(context, name, new MediaStoreWriter.Source() {
                        @Override public void writeTo(OutputStream out) throws IOException {
                            download(url, out);
                        }
                    });
                    toast("Đã lưu vào Thư viện");
                } catch (Throwable failure) {
                    NezumiLog.e(TAG, "save failed", failure);
                    toast("Lưu thất bại");
                }
            }
        }, "nezumi-save-video");
        worker.start();
    }

    private static void download(String address, OutputStream out) throws IOException {
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

    private static void toast(final String message) {
        final Context context = ZaloEnv.appContext();
        if (context == null) return;
        MAIN.post(new Runnable() {
            @Override public void run() {
                try {
                    Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
                } catch (Throwable ignored) {
                    // never crash the host
                }
            }
        });
    }
}
