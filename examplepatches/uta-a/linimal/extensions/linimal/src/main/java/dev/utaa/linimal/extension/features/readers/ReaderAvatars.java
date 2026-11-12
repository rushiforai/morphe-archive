package dev.utaa.linimal.extension.features.readers;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;
import android.util.LruCache;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * profile 画像の読み込み。LINE が表示に使うのと同じ公開 CDN の縮小版（{@code /preview}）を取得し、
 * プロセス内のメモリにだけ保持します。認証情報や Cookie は送りません。
 *
 * <p>取得に失敗した場合は頭文字の丸で代替し、失敗した path は同じプロセスでは再取得しません。</p>
 */
final class ReaderAvatars {
    interface Listener {
        void onAvatar(String picturePath, Bitmap bitmap);
    }

    /** LINE の既定の profile CDN。{@code picture_path} は {@code /0h...} の形で保存されています。 */
    static final String PROFILE_CDN = "https://profile.line-scdn.net";
    private static final int MAX_BYTES = 512 * 1024;
    private static final int DECODE_SIZE_PX = 160;
    /** decode 後の長辺の上限。極端に細長い画像でも Bitmap が大きくならないようにします。 */
    private static final int MAX_DECODED_SIDE_PX = 640;
    /** これより大きい寸法を宣言する画像は decode しません。 */
    private static final int MAX_SOURCE_SIDE_PX = 8192;

    /** Android API に依存するため、最初に使うときまで生成しません。 */
    private static final class Holder {
        static final ReaderAvatars SHARED = new ReaderAvatars();
    }

    private final LruCache<String, Bitmap> cache = new LruCache<String, Bitmap>(6 * 1024 * 1024) {
        @Override
        protected int sizeOf(String key, Bitmap value) {
            return value.getByteCount();
        }
    };
    private final Map<String, List<Listener>> loading = new HashMap<>();
    private final java.util.Set<String> failed = java.util.Collections.synchronizedSet(new java.util.HashSet<>());
    private final ExecutorService executor = Executors.newFixedThreadPool(2, runnable -> {
        Thread thread = new Thread(runnable, "linimal-readers-avatar");
        thread.setDaemon(true);
        return thread;
    });
    private final Handler main = new Handler(Looper.getMainLooper());

    private ReaderAvatars() {
    }

    static ReaderAvatars get() {
        return Holder.SHARED;
    }

    /** main thread から呼びます。キャッシュがなければ null を返し、取得後に listener を呼びます。 */
    Bitmap request(String picturePath, Listener listener) {
        if (!isValidPath(picturePath)) {
            return null;
        }
        Bitmap bitmap = cache.get(picturePath);
        if (bitmap != null || failed.contains(picturePath)) {
            return bitmap;
        }
        synchronized (loading) {
            List<Listener> listeners = loading.get(picturePath);
            if (listeners != null) {
                if (listener != null) {
                    listeners.add(listener);
                }
                return null;
            }
            listeners = new ArrayList<>();
            if (listener != null) {
                listeners.add(listener);
            }
            loading.put(picturePath, listeners);
        }
        executor.execute(() -> {
            Bitmap loaded = download(picturePath);
            if (loaded != null) {
                cache.put(picturePath, loaded);
            } else {
                failed.add(picturePath);
            }
            List<Listener> listeners;
            synchronized (loading) {
                listeners = loading.remove(picturePath);
            }
            if (loaded != null && listeners != null && !listeners.isEmpty()) {
                main.post(() -> {
                    for (Listener each : listeners) {
                        try {
                            each.onAvatar(picturePath, loaded);
                        } catch (Throwable ignored) {
                            // 他の表示は続けます。
                        }
                    }
                });
            }
        });
        return null;
    }

    /** {@code /} から始まる相対 path だけを受け付け、任意の URL へ接続しないようにします。 */
    static boolean isValidPath(String picturePath) {
        if (picturePath == null || picturePath.length() < 2 || picturePath.charAt(0) != '/') {
            return false;
        }
        for (int i = 1; i < picturePath.length(); i++) {
            char c = picturePath.charAt(i);
            boolean allowed = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9')
                    || c == '-' || c == '_' || c == '/' || c == '.';
            char previous = picturePath.charAt(i - 1);
            if (!allowed || (c == '.' && previous == '.') || (c == '/' && previous == '/')) {
                return false;
            }
        }
        return true;
    }

    static String previewUrl(String picturePath) {
        return PROFILE_CDN + picturePath + "/preview";
    }

    private static Bitmap download(String picturePath) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(previewUrl(picturePath)).openConnection();
            connection.setConnectTimeout(10_000);
            connection.setReadTimeout(10_000);
            connection.setInstanceFollowRedirects(false);
            // 画像はメモリにだけ保持し、HTTP キャッシュがあってもディスクへ残しません。
            connection.setUseCaches(false);
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                return null;
            }
            byte[] bytes = readLimited(connection.getInputStream());
            if (bytes == null) {
                return null;
            }
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
            if (!isDecodableSize(bounds.outWidth, bounds.outHeight)) {
                return null;
            }
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inSampleSize = sampleSize(bounds.outWidth, bounds.outHeight);
            return BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
        } catch (Throwable ignored) {
            return null;
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    static boolean isDecodableSize(int width, int height) {
        return width > 0 && height > 0 && width <= MAX_SOURCE_SIDE_PX && height <= MAX_SOURCE_SIDE_PX;
    }

    /**
     * 短辺が {@link #DECODE_SIZE_PX} を下回らない範囲で縮小し、そのうえで長辺が
     * {@link #MAX_DECODED_SIDE_PX} を超える場合はさらに縮小します。
     */
    static int sampleSize(int width, int height) {
        int sample = 1;
        int shorter = Math.min(width, height);
        int longer = Math.max(width, height);
        while (shorter / (sample * 2) >= DECODE_SIZE_PX) {
            sample *= 2;
        }
        while (longer / sample > MAX_DECODED_SIDE_PX) {
            sample *= 2;
        }
        return sample;
    }

    private static byte[] readLimited(InputStream input) throws IOException {
        try (InputStream stream = new BufferedInputStream(input)) {
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            while ((read = stream.read(buffer)) != -1) {
                output.write(buffer, 0, read);
                if (output.size() > MAX_BYTES) {
                    return null;
                }
            }
            return output.toByteArray();
        }
    }
}
