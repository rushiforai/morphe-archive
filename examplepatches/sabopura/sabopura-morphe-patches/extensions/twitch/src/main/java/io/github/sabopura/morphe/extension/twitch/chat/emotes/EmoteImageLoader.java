// Adapted from Hooman's patches, GPL-3.0; see NOTICE for source and revision.
package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.ImageDecoder;
import android.graphics.drawable.AnimatedImageDrawable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.LruCache;
import android.util.Size;

import io.github.sabopura.morphe.extension.twitch.chat.PublicApi;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Consumer;

final class EmoteImageLoader {
    private static final int MAX_IMAGE_BYTES = 4 * 1024 * 1024;
    private static final long MAX_DISK_BYTES = 32L * 1024L * 1024L;
    private static final int MAX_SOURCE_DIMENSION = 8_192;
    private static final long MAX_SOURCE_PIXELS = 32L * 1024L * 1024L;
    private static final int MAX_DECODE_DIMENSION = 512;
    private static final int MIN_DECODE_DIMENSION = 128;
    private static final long RETRY_BACKOFF_MS = 5L * 60L * 1000L;
    private static final long QUEUE_FULL_RETRY_MS = 1500;

    private final Object diskCacheLock = new Object();
    private long diskCacheBytes = -1L;
    private final Set<String> loading = ConcurrentHashMap.newKeySet();
    private final ConcurrentHashMap<String, Long> failedUntil = new ConcurrentHashMap<>();
    private final Consumer<String> onUpdated;
    private final LruCache<String, ImageData> memory =
            new LruCache<>(16 * 1024 * 1024) {
                @Override
                protected int sizeOf(String key, ImageData value) {
                    return Math.max(1, value.costBytes);
                }
            };

    EmoteImageLoader(Consumer<String> onUpdated) {
        this.onUpdated = onUpdated;
    }

    /** An image ready to draw; {@code animation} is set when it is animated and shared. */
    static final class Image {
        final Drawable drawable;
        final SharedAnimation animation;

        Image(Drawable drawable, SharedAnimation animation) {
            this.drawable = drawable;
            this.animation = animation;
        }
    }

    Image image(Resources resources, Emote emote) {
        ImageData data = memory.get(emote.url);
        if (data == null) return null;
        if (data.animation != null) return new Image(data.animation.drawable, data.animation);
        return new Image(new BitmapDrawable(resources, data.bitmap), null);
    }

    void request(Context context, Emote emote, int targetHeight) {
        Long retryAfter = failedUntil.get(emote.url);
        if (retryAfter != null && retryAfter > System.currentTimeMillis()) return;
        if (memory.get(emote.url) != null || !loading.add(emote.url)) return;
        Context applicationContext = context.getApplicationContext();
        int targetDimension =
                Math.min(MAX_DECODE_DIMENSION, Math.max(MIN_DECODE_DIMENSION, targetHeight * 2));
        if (!PublicApi.submit(() -> load(applicationContext, emote, targetDimension))) {
            // Only the queue was full, so the rows waiting for it ask again shortly.
            loading.remove(emote.url);
            PublicApi.UI.postDelayed(() -> onUpdated.accept(emote.url), QUEUE_FULL_RETRY_MS);
        }
    }

    private void load(Context context, Emote emote, int targetDimension) {
        boolean succeeded = false;
        try {
            File directory = new File(context.getCacheDir(), "morphe_emote_images");
            File cache = new File(directory, sha256(emote.url) + ".bin");
            byte[] cached = readCache(cache);
            ImageData data = null;
            if (cached != null) {
                try {
                    data = decode(cached, emote.animated, targetDimension);
                } catch (Exception ignored) {
                    deleteCache(cache);
                }
            }
            if (data == null) {
                if (!EmoteUrls.allowed(emote.url)) throw new IOException("Unexpected emote image host");
                byte[] downloaded = PublicApi.fetch(emote.url, "image/webp,image/*;q=0.8", MAX_IMAGE_BYTES);
                data = decode(downloaded, emote.animated, targetDimension);
                writeCache(directory, cache, downloaded);
            }
            memory.put(emote.url, data);
            failedUntil.remove(emote.url);
            succeeded = true;
        } catch (Throwable ignored) {
            failedUntil.put(emote.url, System.currentTimeMillis() + RETRY_BACKOFF_MS);
        } finally {
            loading.remove(emote.url);
            if (succeeded) onUpdated.accept(emote.url);
        }
    }

    private static ImageData decode(byte[] bytes, boolean animated, int targetDimension)
            throws IOException {
        String prefix = new String(bytes, 0, Math.min(2048, bytes.length), StandardCharsets.UTF_8);
        if (prefix.contains("<svg")) {
            if (bytes.length > 128 * 1024) throw new IOException("SVG too large");
            String xml = new String(bytes, StandardCharsets.UTF_8),
                    lower = xml.toLowerCase(java.util.Locale.ROOT);
            if (lower.contains("<!doctype")
                    || lower.contains("<!entity")
                    || lower.contains("<image")
                    || lower.contains("<foreignobject")
                    || lower.contains("<script")
                    || lower.contains("url(")) throw new IOException("Unsupported SVG content");
            int nodes = 0;
            for (int i = 0; i < xml.length(); i++)
                if (xml.charAt(i) == '<' && ++nodes > 1024)
                    throw new IOException("SVG too complex");
            try {
                com.caverock.androidsvg.SVG.setInternalEntitiesEnabled(false);
                com.caverock.androidsvg.SVG svg = com.caverock.androidsvg.SVG.getFromString(xml);
                // Width/height-only SVGs use their original viewport coordinates. Changing
                // the output dimensions alone would leave their paths at the original size.
                if (svg.getDocumentViewBox() == null
                        && svg.getDocumentWidth() > 0
                        && svg.getDocumentHeight() > 0) {
                    svg.setDocumentViewBox(0, 0, svg.getDocumentWidth(), svg.getDocumentHeight());
                }
                float ratio = svg.getDocumentAspectRatio();
                if (!Float.isFinite(ratio) || ratio <= 0) ratio = 1;
                int height = Math.max(1, Math.min(512, targetDimension)),
                        width = Math.max(1, Math.min(512, Math.round(height * ratio)));
                Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
                svg.setDocumentWidth(width);
                svg.setDocumentHeight(height);
                svg.renderToCanvas(new android.graphics.Canvas(bitmap));
                return new ImageData(bitmap, null, bitmap.getByteCount());
            } catch (com.caverock.androidsvg.SVGParseException e) {
                throw new IOException("Invalid SVG", e);
            }
        }
        if (animated && Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            ImageData data = decodeAnimated(bytes, targetDimension);
            if (data != null) return data;
        }

        Bitmap bitmap = decodeBitmap(bytes, targetDimension);
        if (bitmap == null) {
            throw new IOException("Unable to decode emote image");
        }
        return new ImageData(bitmap, null, bitmap.getByteCount());
    }

    /** Null when the file turns out to have a single frame; a plain bitmap is lighter then. */
    private static ImageData decodeAnimated(byte[] bytes, int targetDimension) throws IOException {
        Drawable decoded;
        try {
            decoded =
                    ImageDecoder.decodeDrawable(
                            ImageDecoder.createSource(ByteBuffer.wrap(bytes)),
                            (decoder, info, source) -> configureDecoder(decoder, info, targetDimension));
        } catch (IllegalArgumentException failure) {
            throw new IOException("Invalid animated emote dimensions", failure);
        }
        if (!(decoded instanceof AnimatedImageDrawable)) return null;
        ((AnimatedImageDrawable) decoded).setRepeatCount(AnimatedImageDrawable.REPEAT_INFINITE);
        // The drawable keeps the compressed file and about two decoded frames in memory.
        long frames = 2L * Math.max(1, decoded.getIntrinsicWidth()) * Math.max(1, decoded.getIntrinsicHeight()) * 4L;
        return new ImageData(null, new SharedAnimation(decoded), saturatedInt(bytes.length + frames));
    }

    private static void configureDecoder(
            ImageDecoder decoder, ImageDecoder.ImageInfo info, int targetDimension) {
        Size size = info.getSize();
        validateDimensions(size.getWidth(), size.getHeight());
        int[] target = constrainedSize(size.getWidth(), size.getHeight(), targetDimension);
        if (target[0] != size.getWidth() || target[1] != size.getHeight()) {
            decoder.setTargetSize(target[0], target[1]);
        }
    }

    private static Bitmap decodeBitmap(byte[] bytes, int targetDimension) throws IOException {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
        validateDimensions(bounds.outWidth, bounds.outHeight);

        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = sampleSize(bounds.outWidth, bounds.outHeight, targetDimension);
        Bitmap decoded = BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
        if (decoded == null) {
            return null;
        }

        int[] target = constrainedSize(decoded.getWidth(), decoded.getHeight(), targetDimension);
        if (target[0] == decoded.getWidth() && target[1] == decoded.getHeight()) {
            return decoded;
        }
        Bitmap scaled = Bitmap.createScaledBitmap(decoded, target[0], target[1], true);
        if (scaled != decoded) {
            decoded.recycle();
        }
        return scaled;
    }

    private static void validateDimensions(int width, int height) {
        if (width <= 0
                || height <= 0
                || width > MAX_SOURCE_DIMENSION
                || height > MAX_SOURCE_DIMENSION
                || (long) width * height > MAX_SOURCE_PIXELS) {
            throw new IllegalArgumentException("Emote dimensions exceed safe decode limits");
        }
    }

    private static int sampleSize(int width, int height, int targetDimension) {
        int sample = 1;
        while (width / (sample * 2) >= targetDimension
                && height / (sample * 2) >= targetDimension) {
            sample *= 2;
        }
        return sample;
    }

    private static int[] constrainedSize(int width, int height, int maxDimension) {
        int largest = Math.max(width, height);
        if (largest <= maxDimension) {
            return new int[] {width, height};
        }
        float scale = (float) maxDimension / largest;
        return new int[] {
            Math.max(1, Math.round(width * scale)), Math.max(1, Math.round(height * scale))
        };
    }

    private static int saturatedInt(long value) {
        return value >= Integer.MAX_VALUE ? Integer.MAX_VALUE : (int) value;
    }

    private byte[] readCache(File cache) {
        synchronized (diskCacheLock) {
            if (!cache.isFile()) {
                return null;
            }
            cache.setLastModified(System.currentTimeMillis());
            try (InputStream input = new FileInputStream(cache)) {
                return readLimited(input);
            } catch (IOException ignored) {
                deleteCacheLocked(cache);
                return null;
            }
        }
    }

    private void writeCache(File directory, File cache, byte[] bytes) throws IOException {
        synchronized (diskCacheLock) {
            if (!directory.isDirectory() && !directory.mkdirs()) {
                return;
            }
            initializeDiskCacheBytes(directory);
            long oldLength = cache.isFile() ? cache.length() : 0L;
            File temporary = new File(directory, cache.getName() + ".tmp");
            try {
                try (FileOutputStream output = new FileOutputStream(temporary)) {
                    output.write(bytes);
                }
                if (!temporary.renameTo(cache)) return;
            } finally {
                //noinspection ResultOfMethodCallIgnored
                temporary.delete();
            }
            diskCacheBytes = Math.max(0L, diskCacheBytes - oldLength) + cache.length();
            trimDiskCache(directory);
        }
    }

    private void deleteCache(File cache) {
        synchronized (diskCacheLock) {
            deleteCacheLocked(cache);
        }
    }

    private void deleteCacheLocked(File cache) {
        long length = cache.length();
        if (cache.delete() && diskCacheBytes >= 0L) {
            diskCacheBytes = Math.max(0L, diskCacheBytes - length);
        }
    }

    private static byte[] readLimited(InputStream input) throws IOException {
        return PublicApi.readLimited(input, MAX_IMAGE_BYTES);
    }

    private static String sha256(String value) throws Exception {
        byte[] digest =
                MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
        StringBuilder result = new StringBuilder(digest.length * 2);
        for (byte item : digest) {
            result.append(String.format("%02x", item & 0xff));
        }
        return result.toString();
    }

    private void initializeDiskCacheBytes(File directory) {
        if (diskCacheBytes >= 0L) {
            return;
        }
        diskCacheBytes = 0L;
        File[] files = directory.listFiles((file, name) -> name.endsWith(".bin"));
        if (files == null) {
            return;
        }
        for (File file : files) {
            diskCacheBytes += file.length();
        }
    }

    private void trimDiskCache(File directory) {
        if (diskCacheBytes <= MAX_DISK_BYTES) {
            return;
        }
        File[] files = directory.listFiles((file, name) -> name.endsWith(".bin"));
        if (files == null) {
            return;
        }
        Arrays.sort(files, Comparator.comparingLong(File::lastModified));
        for (File file : files) {
            long length = file.length();
            if (file.delete()) {
                diskCacheBytes = Math.max(0L, diskCacheBytes - length);
            }
            if (diskCacheBytes <= MAX_DISK_BYTES) {
                break;
            }
        }
    }

    private static final class ImageData {
        final Bitmap bitmap;
        final SharedAnimation animation;
        final int costBytes;

        ImageData(Bitmap bitmap, SharedAnimation animation, int costBytes) {
            this.bitmap = bitmap;
            this.animation = animation;
            this.costBytes = costBytes;
        }
    }
}
