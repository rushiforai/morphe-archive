package dev.twitchpatches.extension.emotes;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.ImageDecoder;
import android.graphics.drawable.AnimatedImageDrawable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.LruCache;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;

final class EmoteImages {
    private final ThreadPoolExecutor workers = new ThreadPoolExecutor(2, 2, 0, TimeUnit.MILLISECONDS,
            new LinkedBlockingQueue<>(48), task -> { Thread thread = new Thread(task, "TwitchEmoteImages"); thread.setDaemon(true); return thread; });
    private final Map<String, Future<?>> pending = new HashMap<>();
    private final Map<String, Long> failed = new java.util.LinkedHashMap<>();
    private final LruCache<String, Image> memory = new LruCache<String, Image>(12 * 1024 * 1024) {
        @Override protected int sizeOf(String key, Image value) { return value.cost; }
    };
    private final Consumer<String> changed;
    private long generation;

    EmoteImages(Consumer<String> changed) { this.changed = changed; }

    synchronized Drawable drawable(android.content.res.Resources resources, String url) {
        Image image = memory.get(url);
        return image == null ? null : image.state.newDrawable(resources).mutate();
    }

    synchronized void request(Emote emote) {
        String url = emote.url;
        if (memory.get(url) != null || pending.containsKey(url) || failed.getOrDefault(url, 0L) > System.currentTimeMillis()) return;
        long ticket = generation;
        try { pending.put(url, workers.submit(() -> load(emote, ticket))); }
        catch (RejectedExecutionException error) { failed.put(url, System.currentTimeMillis() + 60_000); trimFailures(); }
    }

    synchronized void cancelPending() {
        generation++;
        pending.values().forEach(task -> task.cancel(true));
        pending.clear();
        workers.purge();
    }

    private void load(Emote emote, long ticket) {
        Image image = null;
        try { image = decode(EmoteHttp.get(emote.url, 1024 * 1024, false)); }
        catch (IOException | IllegalArgumentException error) { android.util.Log.w("TwitchPatchesEmotes", "Emote image unavailable"); }
        synchronized (this) {
            if (ticket != generation) return;
            pending.remove(emote.url);
            if (image == null) { failed.put(emote.url, System.currentTimeMillis() + 60_000); trimFailures(); return; }
            memory.put(emote.url, image);
            failed.remove(emote.url);
        }
        changed.accept(emote.url);
    }

    private void trimFailures() {
        while (failed.size() > 128) failed.remove(failed.keySet().iterator().next());
    }

    private static Image decode(byte[] bytes) throws IOException {
        Drawable drawable;
        if (Build.VERSION.SDK_INT >= 28) {
            drawable = ImageDecoder.decodeDrawable(ImageDecoder.createSource(ByteBuffer.wrap(bytes)), (decoder, info, source) -> {
                int width = info.getSize().getWidth();
                int height = info.getSize().getHeight();
                if (width <= 0 || height <= 0 || width > 2048 || height > 2048) throw new IllegalArgumentException("Emote dimensions exceed bounds.");
                decoder.setAllocator(ImageDecoder.ALLOCATOR_SOFTWARE);
                float scale = Math.min(1f, 128f / Math.max(width, height));
                decoder.setTargetSize(Math.max(1, Math.round(width * scale)), Math.max(1, Math.round(height * scale)));
            });
        } else {
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
            if (options.outWidth <= 0 || options.outHeight <= 0 || options.outWidth > 2048 || options.outHeight > 2048) throw new IOException("Emote dimensions exceed bounds.");
            options.inJustDecodeBounds = false;
            options.inSampleSize = 1;
            while (Math.max(options.outWidth, options.outHeight) / options.inSampleSize > 128) options.inSampleSize *= 2;
            Bitmap bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
            if (bitmap == null) throw new IOException("Emote image could not be decoded.");
            drawable = new BitmapDrawable(android.content.res.Resources.getSystem(), bitmap);
        }
        Drawable.ConstantState state = drawable.getConstantState();
        if (state == null) throw new IOException("Emote drawable cannot be isolated.");
        int cost = Build.VERSION.SDK_INT >= 28 && drawable instanceof AnimatedImageDrawable ? 1024 * 1024
                : Math.max(1, drawable.getIntrinsicWidth() * drawable.getIntrinsicHeight() * 4);
        return new Image(state, cost);
    }

    private static final class Image {
        final Drawable.ConstantState state;
        final int cost;
        Image(Drawable.ConstantState state, int cost) { this.state = state; this.cost = cost; }
    }
}
