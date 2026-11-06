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
import java.util.Map;
import java.util.function.Consumer;

final class EmoteImages {
    private final EmoteImageRequests requests;
    private final Map<String, Long> failed = new java.util.LinkedHashMap<>();
    private final LruCache<String, Image> memory;
    private final Consumer<String> changed;

    EmoteImages(Consumer<String> changed) { this(changed, 2, 12); }

    EmoteImages(Consumer<String> changed, int threads, int megabytes) {
        this.changed = changed;
        requests = new EmoteImageRequests(threads);
        memory = new LruCache<String, Image>(megabytes * 1024 * 1024) {
            @Override protected int sizeOf(String key, Image value) { return value.cost; }
        };
    }

    synchronized Drawable drawable(android.content.res.Resources resources, String url) {
        Image image = memory.get(url);
        return image == null ? null : image.animation != null ? image.animation.newDrawable() : image.state.newDrawable(resources).mutate();
    }

    synchronized void request(Emote emote) {
        String url = emote.url;
        if (memory.get(url) != null || failed.getOrDefault(url, 0L) > System.currentTimeMillis()) return;
        requests.submit(url, ticket -> load(emote, ticket));
    }

    synchronized void cancelPending() {
        requests.cancel();
    }

    synchronized void retainRequests(java.util.Set<String> visible) {
        requests.retain(visible);
    }

    synchronized int pendingCount() { return requests.size(); }

    private void load(Emote emote, EmoteImageRequests.Ticket ticket) {
        Image image = null;
        try { image = decode(EmoteHttp.get(emote.url, 8 * 1024 * 1024, false)); }
        catch (IOException | IllegalArgumentException error) { android.util.Log.w("TwitchPatchesEmotes", "Emote image unavailable"); }
        synchronized (this) {
            if (!requests.complete(emote.url, ticket)) return;
            if (image == null) { failed.put(emote.url, System.currentTimeMillis() + 60_000); trimFailures(); return; }
            memory.put(emote.url, image);
            failed.remove(emote.url);
        }
        changed.accept(emote.url);
    }

    private void trimFailures() {
        while (failed.size() > 128) failed.remove(failed.keySet().iterator().next());
    }

    static Image decode(byte[] bytes) throws IOException {
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
        boolean animated = Build.VERSION.SDK_INT >= 28 && drawable instanceof AnimatedImageDrawable;
        if (state == null && !animated) throw new IOException("Emote drawable cannot be isolated.");
        int cost = animated ? Math.max(bytes.length, 1024 * 1024)
                : Math.max(1, drawable.getIntrinsicWidth() * drawable.getIntrinsicHeight() * 4);
        return new Image(state, animated ? new AnimatedEmoteImage(drawable) : null, cost);
    }

    static final class Image {
        final Drawable.ConstantState state;
        final AnimatedEmoteImage animation;
        final int cost;
        Image(Drawable.ConstantState state, AnimatedEmoteImage animation, int cost) {
            this.state = state; this.animation = animation; this.cost = cost;
        }
    }
}
