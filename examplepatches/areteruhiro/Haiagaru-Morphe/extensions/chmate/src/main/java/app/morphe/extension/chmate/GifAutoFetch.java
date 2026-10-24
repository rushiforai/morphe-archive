package app.morphe.extension.chmate;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;
import java.util.concurrent.*;

/** Native attachments only; never changes response links or starts playback on its own. */
final class GifAutoFetch {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ThreadPoolExecutor WORKER = new ThreadPoolExecutor(1, 1, 30, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(16), new ThreadPoolExecutor.AbortPolicy());
    private static final Map<String, String> POSTERS = new LinkedHashMap<>();
    private static final Map<String, Long> ATTEMPTS = new LinkedHashMap<>();
    private static final Map<Object, Source> MODELS = Collections.synchronizedMap(new WeakHashMap<>());
    private static final class Source {
        final String body;
        final String[] gifs;
        Source(String body) { this.body = body; gifs = GifAutoFetchPolicy.extract(body); }
    }
    static void changed() {
        MAIN.post(() -> {
            synchronized (MODELS) {
                for (Object model : MODELS.keySet()) try {
                    for (java.lang.reflect.Field field : model.getClass().getDeclaredFields()) {
                        if (field.getType() != CharSequence[].class || java.lang.reflect.Modifier.isStatic(field.getModifiers())) continue;
                        field.setAccessible(true); field.set(model, null);
                    }
                } catch (ReflectiveOperationException ignored) { }
            }
            Haiagaru.refreshImgurAttachments();
        });
    }
    static String[] project(Object model, String body, String[] original) {
        Source source;
        synchronized (MODELS) {
            source = MODELS.get(model);
            if (source == null || !Objects.equals(source.body, body)) {
                source = new Source(body);
                if (MODELS.size() >= 4096) MODELS.remove(MODELS.keySet().iterator().next());
                MODELS.put(model, source);
            }
        }
        int mode = Haiagaru.gifAutoFetchMode();
        LinkedHashSet<String> result = new LinkedHashSet<>(), gifs = new LinkedHashSet<>();
        synchronized (POSTERS) {
            for (String url : original) {
                if (GifAutoFetchPolicy.supported(url)) gifs.add(url);
                else if (!POSTERS.containsValue(url)) result.add(url);
            }
        }
        // Native arrays may already contain a previous mode's projection. Re-extract direct
        // links so changing OFF -> ON can restore them without changing the posted text.
        Collections.addAll(gifs, source.gifs);
        for (String url : gifs) {
            if (GifAutoFetchPolicy.image(mode)) {
                String poster;
                synchronized (POSTERS) { poster = POSTERS.get(url); }
                if (poster != null) result.add(poster);
                else request(url);
            }
            if (GifAutoFetchPolicy.gif(mode)) result.add(url);
        }
        String[] projected = result.toArray(new String[0]);
        return Arrays.equals(original, projected) ? original : projected;
    }
    private static void request(String url) {
        synchronized (POSTERS) {
            Long previous = ATTEMPTS.get(url);
            if (previous != null && System.currentTimeMillis() - previous < 60000) return;
            if (ATTEMPTS.size() >= 128 && !ATTEMPTS.containsKey(url)) return;
            ATTEMPTS.put(url, System.currentTimeMillis());
        }
        try { WORKER.execute(() -> generate(url)); }
        catch (RejectedExecutionException full) { synchronized (POSTERS) { ATTEMPTS.remove(url); } }
    }
    private static void generate(String url) {
        HttpURLConnection connection = null;
        Bitmap bitmap = null;
        File staging = null;
        try {
            android.content.Context context = Haiagaru.applicationContextForExtension();
            if (context == null || !GifAutoFetchPolicy.image(Haiagaru.gifAutoFetchMode())) return;
            File directory = new File(context.getCacheDir(), "haiagaru-gif-posters");
            if (!directory.isDirectory() && !directory.mkdirs()) return;
            byte[] digest = java.security.MessageDigest.getInstance("SHA-256").digest(url.getBytes("UTF-8"));
            StringBuilder key = new StringBuilder("gif-");
            for (byte b : digest) key.append(String.format(Locale.ROOT, "%02x", b & 255));
            File image = new File(directory, key + ".jpg");
            if (!image.isFile()) {
                // No redirects, original-file disk cache or UI-thread decode.
                byte[] bytes;
                int limit = 8 * 1024 * 1024;
                if (ImageVpnController.protectedPreview(url)) {
                    // Protected domains must not silently fall back to the device connection.
                    bytes = ImageVpnController.fetchPreview(url).getBody();
                    if (bytes == null || bytes.length > limit) return;
                } else {
                connection = (HttpURLConnection) new URL(url).openConnection();
                connection.setInstanceFollowRedirects(false);
                connection.setConnectTimeout(8000); connection.setReadTimeout(8000);
                if (connection.getResponseCode() != 200 || connection.getContentLengthLong() > limit) return;
                long deadline = android.os.SystemClock.elapsedRealtime() + 20000;
                ByteArrayOutputStream output = new ByteArrayOutputStream();
                try (InputStream input = connection.getInputStream()) {
                    byte[] buffer = new byte[8192]; int count;
                    while ((count = input.read(buffer)) != -1) {
                        if (!GifAutoFetchPolicy.image(Haiagaru.gifAutoFetchMode())
                                || android.os.SystemClock.elapsedRealtime() > deadline || count > limit - output.size()) return;
                        output.write(buffer, 0, count);
                    }
                }
                bytes = output.toByteArray();
                }
                if (bytes.length < 6 || bytes[0] != 'G' || bytes[1] != 'I' || bytes[2] != 'F'
                        || bytes[3] != '8' || (bytes[4] != '7' && bytes[4] != '9') || bytes[5] != 'a') return;
                BitmapFactory.Options options = new BitmapFactory.Options(); options.inJustDecodeBounds = true;
                BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
                if (options.outWidth <= 0 || options.outHeight <= 0 || options.outWidth > 16384 || options.outHeight > 16384) return;
                options.inJustDecodeBounds = false; options.inSampleSize = 1;
                while (Math.max(options.outWidth, options.outHeight) / options.inSampleSize > 480) options.inSampleSize *= 2;
                bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
                if (bitmap == null) return;
                staging = File.createTempFile("poster-", ".jpg", directory);
                try (OutputStream file = new FileOutputStream(staging)) { if (!bitmap.compress(Bitmap.CompressFormat.JPEG, 85, file)) return; }
                if (!staging.renameTo(image)) return;
            }
            String poster = VideoThumbnailServer.register(key.toString(), image);
            synchronized (POSTERS) { POSTERS.put(url, poster); }
            if (GifAutoFetchPolicy.image(Haiagaru.gifAutoFetchMode())) changed();
        } catch (Exception | OutOfMemoryError unavailable) {
            android.util.Log.w("HaiagaruMedia", "GIF poster unavailable", unavailable);
        } finally {
            if (connection != null) connection.disconnect();
            if (bitmap != null) bitmap.recycle();
            if (staging != null && staging.isFile()) staging.delete();
        }
    }
    private GifAutoFetch() { }
}
