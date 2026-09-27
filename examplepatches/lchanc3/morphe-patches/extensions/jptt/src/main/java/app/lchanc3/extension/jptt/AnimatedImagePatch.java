package app.lchanc3.extension.jptt;

import android.annotation.TargetApi;
import android.graphics.ImageDecoder;
import android.graphics.drawable.AnimatedImageDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SharedMemory;
import android.system.ErrnoException;
import android.util.Log;
import android.util.Size;
import android.view.View;
import android.view.ViewGroup;

import com.facebook.common.memory.PooledByteBuffer;
import com.facebook.common.references.CloseableReference;
import com.facebook.datasource.BaseDataSubscriber;
import com.facebook.datasource.DataSource;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.facebook.drawee.interfaces.DraweeController;
import com.facebook.drawee.interfaces.DraweeHierarchy;
import com.facebook.drawee.interfaces.SettableDraweeHierarchy;
import com.facebook.drawee.view.DraweeView;
import com.facebook.imagepipeline.request.ImageRequestBuilder;

import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;

/**
 * Plays animated GIFs and WebPs in articles, which JPTT shows as their first
 * frame.
 *
 * <p>Fresco only animates a format it has a decoder registered for, and it
 * registers the GIF and WebP ones by reflection. R8 did not know that, so in
 * the APK both decoders are empty abstract classes: the lookup fails, Fresco
 * logs a warning and decodes every GIF as a still image. The rest of Fresco's
 * animation code is gone as well, so rather than put it back this leaves
 * Fresco's still frame in place and swaps in the platform's own
 * {@link AnimatedImageDrawable}, which needs Android 9.
 *
 * <p>The bytes are the ones Fresco has already downloaded and cached, copied
 * into shared memory for the platform decoder to read from. The
 * drawable goes into the view's own drawee hierarchy, so it is scaled and
 * cropped exactly like the still frame was, and it is taken out again the
 * same way: Fresco resets the hierarchy when the view is recycled, and calls
 * back here when the still frame is put up again.
 */
@SuppressWarnings("unused")
public final class AnimatedImagePatch {

    /**
     * Bigger than the 50MB GIFs imgur hands out, small enough that one article
     * of them does not get the app killed. They are held off the Java heap.
     */
    private static final int MAX_BYTES = 64 * 1024 * 1024;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static final ExecutorService DECODER = Executors.newSingleThreadExecutor(new ThreadFactory() {
        @Override
        public Thread newThread(Runnable runnable) {
            Thread thread = new Thread(runnable, "jptt-animated-image");
            thread.setPriority(Thread.MIN_PRIORITY);
            thread.setDaemon(true);
            return thread;
        }
    });

    /** URLs known to be still images, so they are not looked at again. */
    private static final Set<String> STILL = Collections.newSetFromMap(
            new LinkedHashMap<String, Boolean>(64, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
                    return size() > 512;
                }
            });

    /**
     * Called from the method the patch adds to PictureView, once Fresco has put
     * the image up.
     */
    public static void onPictureShown(ViewGroup pictureView, String url) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.P || url == null || url.isEmpty()) {
            return;
        }
        try {
            synchronized (STILL) {
                if (STILL.contains(url)) {
                    return;
                }
            }
            DraweeView view = null;
            for (int i = 0; i < pictureView.getChildCount(); i++) {
                View child = pictureView.getChildAt(i);
                if (child instanceof DraweeView) {
                    view = (DraweeView) child;
                    break;
                }
            }
            if (view == null) {
                return;
            }
            load(view, view.getController(), url);
        } catch (Throwable ex) {
            Log.e(JpttContext.LOG_TAG, "Could not look at " + url, ex);
        }
    }

    @TargetApi(Build.VERSION_CODES.P)
    private static void load(final DraweeView view, final DraweeController controller, final String url) {
        // The largest the view can be, to decode no bigger than that.
        final int maxWidth = Math.max(view.getMaxWidth(), view.getWidth());
        final int maxHeight = Math.max(view.getMaxHeight(), view.getHeight());

        final DataSource dataSource = Fresco.getImagePipeline().fetchEncodedImage(
                ImageRequestBuilder.newBuilderWithSource(Uri.parse(url)).build(), null);

        dataSource.subscribe(new BaseDataSubscriber() {
            @Override
            protected void onNewResultImpl(DataSource source) {
                if (!source.isFinished()) {
                    return;
                }
                // A copy of the reference, which is ours to close.
                CloseableReference reference = (CloseableReference) source.getResult();
                if (reference == null) {
                    return;
                }
                final Drawable drawable;
                try {
                    drawable = decode((PooledByteBuffer) reference.get(), url, maxWidth, maxHeight);
                } catch (Throwable ex) {
                    Log.e(JpttContext.LOG_TAG, "Could not decode " + url, ex);
                    return;
                } finally {
                    CloseableReference.closeSafely(reference);
                }
                if (drawable == null) {
                    return;
                }
                MAIN.post(new Runnable() {
                    @Override
                    public void run() {
                        show(view, controller, drawable);
                    }
                });
            }

            @Override
            protected void onFailureImpl(DataSource source) {
            }

            @Override
            public void onCancellation(DataSource source) {
            }

            @Override
            public void onProgressUpdate(DataSource source) {
                // Must be declared: BaseDataSubscriber in the APK has no
                // implementation to inherit. See PreloadArticleImagesPatch.
            }
        }, DECODER);
    }

    /** The animation, or null when the image does not move. */
    @TargetApi(Build.VERSION_CODES.P)
    private static Drawable decode(PooledByteBuffer buffer, String url, final int maxWidth, final int maxHeight)
            throws Exception {
        int size = buffer.size();
        if (size > MAX_BYTES || !mayBeAnimated(buffer, size)) {
            rememberStill(url);
            return null;
        }

        ByteBuffer bytes = copyToSharedMemory(buffer, size);
        if (bytes == null) {
            return null;
        }

        // The drawable keeps reading from this buffer, one frame at a time, and
        // holds on to it until it is itself collected.
        ImageDecoder.Source source = ImageDecoder.createSource(bytes);
        Drawable drawable = ImageDecoder.decodeDrawable(source, new ImageDecoder.OnHeaderDecodedListener() {
            @Override
            public void onHeaderDecoded(ImageDecoder decoder, ImageDecoder.ImageInfo info, ImageDecoder.Source src) {
                // Halve until one more halving would make it smaller than the
                // view, so each frame costs no more memory than is shown.
                Size imageSize = info.getSize();
                int sample = 1;
                if (maxWidth > 0 && maxHeight > 0) {
                    while (imageSize.getWidth() / (sample * 2) >= maxWidth
                            && imageSize.getHeight() / (sample * 2) >= maxHeight) {
                        sample *= 2;
                    }
                }
                decoder.setTargetSampleSize(sample);
            }
        });

        if (!(drawable instanceof AnimatedImageDrawable)) {
            // A GIF of a single frame.
            rememberStill(url);
            return null;
        }
        return drawable;
    }

    /**
     * The file, copied into anonymous shared memory: off the Java heap, so a
     * big GIF does not run the app out of it, and never written to disk. The
     * mapping outlives the file descriptor and is unmapped once the buffer is
     * collected. Null when Fresco's buffer came up short.
     */
    @TargetApi(Build.VERSION_CODES.P)
    private static ByteBuffer copyToSharedMemory(PooledByteBuffer buffer, int size) throws ErrnoException {
        SharedMemory memory = SharedMemory.create("jptt-animated-image", size);
        try {
            ByteBuffer mapped = memory.mapReadWrite();
            byte[] chunk = new byte[64 * 1024];
            int read = 0;
            while (read < size) {
                int count = buffer.read(read, chunk, 0, Math.min(chunk.length, size - read));
                if (count <= 0) {
                    SharedMemory.unmap(mapped);
                    return null;
                }
                mapped.put(chunk, 0, count);
                read += count;
            }
            mapped.flip();
            return mapped;
        } finally {
            memory.close();
        }
    }

    /**
     * Whether the file is a GIF, or a WebP that says it is animated. Read from
     * the header alone, so a JPEG or PNG is never copied.
     */
    private static boolean mayBeAnimated(PooledByteBuffer buffer, int size) {
        if (size < 21) {
            return false;
        }
        if (startsWith(buffer, 0, "GIF8")) {
            return true;
        }
        // RIFF....WEBPVP8X, then the flags byte, whose bit 1 is the animation flag.
        return startsWith(buffer, 0, "RIFF") && startsWith(buffer, 8, "WEBPVP8X")
                && (buffer.read(20) & 0x02) != 0;
    }

    private static boolean startsWith(PooledByteBuffer buffer, int offset, String ascii) {
        for (int i = 0; i < ascii.length(); i++) {
            if (buffer.read(offset + i) != (byte) ascii.charAt(i)) {
                return false;
            }
        }
        return true;
    }

    @TargetApi(Build.VERSION_CODES.P)
    private static void show(DraweeView view, DraweeController controller, Drawable drawable) {
        try {
            // Loaded again, or with another image, while this was decoding.
            if (view.getController() != controller) {
                return;
            }
            DraweeHierarchy hierarchy = view.getHierarchy();
            if (!(hierarchy instanceof SettableDraweeHierarchy)) {
                return;
            }
            ((SettableDraweeHierarchy) hierarchy).setImage(drawable, 1f, true);
            ((AnimatedImageDrawable) drawable).start();
        } catch (Throwable ex) {
            Log.e(JpttContext.LOG_TAG, "Could not play an animated image", ex);
        }
    }

    private static void rememberStill(String url) {
        synchronized (STILL) {
            STILL.add(url);
        }
    }

    private AnimatedImagePatch() {
    }
}
