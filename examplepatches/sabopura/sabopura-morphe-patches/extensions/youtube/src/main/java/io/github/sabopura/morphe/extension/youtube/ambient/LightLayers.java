package io.github.sabopura.morphe.extension.youtube.ambient;

import android.graphics.Canvas;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import java.util.ArrayList;
import java.util.List;

/**
 * The light on a few small surfaces, one per rectangle it covers. A light frame then only
 * replaces these buffers instead of redrawing YouTube's window. The buffers are transparent
 * where nothing is drawn (the player's edge light leaves the picture clear that way), and each
 * can be a quarter of its size: the light is a blurred image of a few dozen pixels anyway, and
 * the display scales the buffer up for free.
 */
final class LightLayers {
    /** The painter draws in window coordinates; each surface shows its own rectangle of it. */
    interface Painter {
        void paint(Canvas canvas);
    }

    private static final int DOWNSCALE = 4;

    private final boolean aboveVideo;
    private final Runnable onReady;
    private final Runnable onLost;
    private final List<LightSurface> surfaces = new ArrayList<>();
    private final List<Rect> placed = new ArrayList<>();
    private final int[] parentLocation = new int[2];

    /**
     * @param aboveVideo true for the player's bars (between the video and YouTube's window),
     *                   false for the page light underneath the window
     */
    LightLayers(boolean aboveVideo, Runnable onReady, Runnable onLost) {
        this.aboveVideo = aboveVideo;
        this.onReady = onReady;
        this.onLost = onLost;
    }

    /**
     * Places one surface per rectangle (window coordinates) in {@code parent} at
     * {@code index} and draws the frame on them.
     *
     * @return true when every rectangle shows the frame; false while surfaces are still
     *         being created (they call {@code onReady} once they can draw)
     */
    boolean render(ViewGroup parent, int index, List<Rect> rects, Painter painter) {
        while (surfaces.size() > rects.size()) remove(surfaces.size() - 1);
        parent.getLocationInWindow(parentLocation);
        boolean shown = true;
        for (int i = 0; i < rects.size(); i++) {
            Rect rect = rects.get(i);
            if (i == surfaces.size()) {
                LightSurface surface = new LightSurface(parent.getContext(), onReady, onLost);
                if (aboveVideo) surface.setZOrderMediaOverlay(true);
                surfaces.add(surface);
                placed.add(new Rect());
            }
            LightSurface surface = surfaces.get(i);
            if (!place(parent, Math.min(index + i, parent.getChildCount()), surface, rect)) {
                shown = false;
                continue;
            }
            Canvas canvas = surface.lock();
            if (canvas == null) {
                shown = false;
                continue;
            }
            try {
                canvas.drawColor(0, PorterDuff.Mode.CLEAR);
                int save = canvas.save();
                canvas.scale(canvas.getWidth() / (float) rect.width(),
                        canvas.getHeight() / (float) rect.height());
                canvas.translate(-rect.left, -rect.top);
                painter.paint(canvas);
                canvas.restoreToCount(save);
            } finally {
                surface.post(canvas);
            }
        }
        return shown && !rects.isEmpty();
    }

    /** @return true once the surface sits on its rectangle with a buffer of the right size. */
    private boolean place(ViewGroup parent, int index, LightSurface surface, Rect rect) {
        int left = rect.left - parentLocation[0];
        int top = rect.top - parentLocation[1];
        int width = Math.max(1, rect.width());
        int height = Math.max(1, rect.height());
        int bufferWidth = Math.max(1, width / DOWNSCALE);
        int bufferHeight = Math.max(1, height / DOWNSCALE);
        Rect previous = placed.get(surfaces.indexOf(surface));
        if (previous.width() != bufferWidth || previous.height() != bufferHeight) {
            surface.getHolder().setFixedSize(bufferWidth, bufferHeight);
            previous.set(0, 0, bufferWidth, bufferHeight);
        }
        if (surface.getParent() != parent) {
            if (surface.getParent() instanceof ViewGroup) {
                ((ViewGroup) surface.getParent()).removeView(surface);
            }
            parent.addView(surface, index, layoutParams(parent, left, top, width, height));
            return false;
        }
        ViewGroup.LayoutParams params = surface.getLayoutParams();
        if (parent instanceof FrameLayout) {
            FrameLayout.LayoutParams frame = (FrameLayout.LayoutParams) params;
            if (frame.width != width || frame.height != height || frame.leftMargin != left
                    || frame.topMargin != top) {
                surface.setLayoutParams(layoutParams(parent, left, top, width, height));
                return false;
            }
        } else if (surface.getLeft() != left || surface.getTop() != top
                || surface.getWidth() != width || surface.getHeight() != height) {
            // YouTube's player containers only lay out the children they know.
            if (params.width != width || params.height != height) {
                params.width = width;
                params.height = height;
                surface.setLayoutParams(params);
            }
            surface.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
            surface.layout(left, top, left + width, top + height);
        }
        return surface.getWidth() == width && surface.getHeight() == height;
    }

    private static ViewGroup.LayoutParams layoutParams(ViewGroup parent, int left, int top,
                                                       int width, int height) {
        if (parent instanceof FrameLayout) {
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(width, height);
            params.leftMargin = left;
            params.topMargin = top;
            return params;
        }
        return new ViewGroup.LayoutParams(width, height);
    }

    boolean isEmpty() {
        return surfaces.isEmpty();
    }

    void release() {
        while (!surfaces.isEmpty()) remove(surfaces.size() - 1);
    }

    private void remove(int index) {
        LightSurface surface = surfaces.remove(index);
        placed.remove(index);
        if (surface.getParent() instanceof ViewGroup) {
            ((ViewGroup) surface.getParent()).removeView(surface);
        }
    }
}
