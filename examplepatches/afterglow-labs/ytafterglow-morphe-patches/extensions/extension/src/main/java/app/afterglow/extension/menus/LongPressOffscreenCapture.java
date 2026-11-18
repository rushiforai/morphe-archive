package app.afterglow.extension.menus;

import android.graphics.Bitmap;
import android.graphics.ColorSpace;
import android.graphics.HardwareRenderer;
import android.graphics.PixelFormat;
import android.graphics.PorterDuff;
import android.graphics.RecordingCanvas;
import android.graphics.RenderNode;
import android.hardware.HardwareBuffer;
import android.media.Image;
import android.media.ImageReader;
import android.os.Build;
import android.os.Looper;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;

import java.util.ArrayDeque;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.BooleanSupplier;

/**
 * Exact offscreen native-root capture using public Android 29 APIs; no window pixel read.
 * The caller owns the exact mounted-row identity, current text and cancellation guard.
 * Work and dimensions are bounded. Platform rendering/readback is synchronous
 * and has no cancellable timeout; only the newly owned renderer is modified.
 */
final class LongPressOffscreenCapture {
    private static final AtomicBoolean BUSY = new AtomicBoolean();
    private static final int MAX_SIDE = 8192;
    private static final long MAX_PIXELS = 8L * 1024 * 1024;
    private static final long USAGE = HardwareBuffer.USAGE_GPU_SAMPLED_IMAGE
            | HardwareBuffer.USAGE_GPU_COLOR_OUTPUT;

    private LongPressOffscreenCapture() {}

    /** Returns an independently owned software bitmap, or throws for caller fallback. */
    public static Bitmap capture(View root, int backgroundColor, BooleanSupplier current) {
        if (Build.VERSION.SDK_INT < 29 || Looper.myLooper() != Looper.getMainLooper())
            throw new IllegalStateException("Hardware capture requires the main thread on API 29");
        if (!BUSY.compareAndSet(false, true)) throw new IllegalStateException("Capture already active");
        ImageReader reader = null;
        HardwareRenderer renderer = null;
        RenderNode node = null;
        Image image = null;
        HardwareBuffer buffer = null;
        Bitmap hardware = null;
        Bitmap output = null;
        try {
            if (root == null || current == null || !current.getAsBoolean()
                    || !root.isAttachedToWindow() || !root.isShown())
                throw new IllegalStateException("Row no longer current");
            int width = root.getWidth(), height = root.getHeight();
            if (width <= 0 || height <= 0 || width > MAX_SIDE || height > MAX_SIDE
                    || (long) width * height > MAX_PIXELS)
                throw new IllegalArgumentException("Capture dimensions unavailable");
            rejectExternalSurfaces(root);
            if (!HardwareBuffer.isSupported(width, height, HardwareBuffer.RGBA_8888, 1, USAGE))
                throw new IllegalStateException("Capture buffer unsupported");

            // Two acquired slots permit prompt draining without retaining a buffer pool.
            reader = ImageReader.newInstance(width, height, PixelFormat.RGBA_8888, 2, USAGE);
            node = new RenderNode("Afterglow exact row capture");
            node.setPosition(0, 0, width, height);
            node.setClipToBounds(true);
            RecordingCanvas canvas = node.beginRecording(width, height);
            try {
                if (!canvas.isHardwareAccelerated()
                        || width > canvas.getMaximumBitmapWidth()
                        || height > canvas.getMaximumBitmapHeight())
                    throw new IllegalStateException("Capture exceeds renderer limits");
                canvas.drawColor(backgroundColor, PorterDuff.Mode.SRC);
                canvas.clipRect(0, 0, width, height);
                // Never measure/layout/scroll the row or change layer/mount policies.
                root.draw(canvas);
            } finally {
                node.endRecording();
            }
            if (!current.getAsBoolean() || root.getWidth() != width || root.getHeight() != height)
                throw new IllegalStateException("Row changed during recording");

            renderer = new HardwareRenderer();
            renderer.setName("Afterglow exact row capture");
            renderer.setOpaque(false);
            renderer.setSurface(reader.getSurface());
            renderer.setContentRoot(node);
            int result = renderer.createRenderRequest().setWaitForPresent(true).syncAndDraw();
            int rejected = HardwareRenderer.SYNC_LOST_SURFACE_REWARD_IF_FOUND
                    | HardwareRenderer.SYNC_CONTEXT_IS_STOPPED | HardwareRenderer.SYNC_FRAME_DROPPED;
            if ((result & rejected) != 0) throw new IllegalStateException("Capture frame unavailable");
            image = reader.acquireNextImage();
            if (image == null) throw new IllegalStateException("Capture image unavailable");
            buffer = image.getHardwareBuffer();
            if (buffer == null) throw new IllegalStateException("Capture buffer unavailable");
            hardware = Bitmap.wrapHardwareBuffer(buffer, ColorSpace.get(ColorSpace.Named.SRGB));
            if (hardware == null) throw new IllegalStateException("Capture bitmap unavailable");
            // Finish readback while the Image still owns this buffer: never return a
            // wrapped bitmap whose producer can recycle/overwrite the buffer.
            output = hardware.copy(Bitmap.Config.ARGB_8888, false);
            if (output == null) throw new IllegalStateException("Capture readback unavailable");
            if (output.getConfig() != Bitmap.Config.ARGB_8888 || output.getWidth() != width
                    || output.getHeight() != height || !current.getAsBoolean()
                    || !root.isAttachedToWindow() || root.getWidth() != width || root.getHeight() != height)
                throw new IllegalStateException("Row changed during capture");
            Bitmap completed = output;
            output = null;
            return completed;
        } finally {
            try {
                // Each release is independent: a failed allocation/cleanup must
                // not skip the remaining resources or permanently latch BUSY.
                try { if (output != null) output.recycle(); } catch (RuntimeException | OutOfMemoryError ignored) {}
                try { if (hardware != null) hardware.recycle(); } catch (RuntimeException | OutOfMemoryError ignored) {}
                try { if (buffer != null) buffer.close(); } catch (RuntimeException | OutOfMemoryError ignored) {}
                try { if (image != null) image.close(); } catch (RuntimeException | OutOfMemoryError ignored) {}
                // Discard only the newly owned recording. Never call clearContent()
                // on the app renderer or discard a native child's RenderNode.
                try { if (node != null) node.discardDisplayList(); } catch (RuntimeException | OutOfMemoryError ignored) {}
                try { if (renderer != null) renderer.setContentRoot(null); } catch (RuntimeException | OutOfMemoryError ignored) {}
                try { if (renderer != null) renderer.destroy(); } catch (RuntimeException | OutOfMemoryError ignored) {}
                try { if (reader != null) reader.close(); } catch (RuntimeException | OutOfMemoryError ignored) {}
            } finally {
                BUSY.set(false);
            }
        }
    }

    private static void rejectExternalSurfaces(View root) {
        ArrayDeque<View> queue = new ArrayDeque<>();
        queue.add(root);
        int visited = 0;
        while (!queue.isEmpty()) {
            View child = queue.removeFirst();
            if (++visited > 4096 || child instanceof SurfaceView || child instanceof TextureView
                    || child instanceof WebView)
                throw new IllegalArgumentException("External or unsupported row surface");
            if (child instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) child;
                for (int i = 0; i < group.getChildCount(); i++) queue.addLast(group.getChildAt(i));
            }
        }
    }
}
