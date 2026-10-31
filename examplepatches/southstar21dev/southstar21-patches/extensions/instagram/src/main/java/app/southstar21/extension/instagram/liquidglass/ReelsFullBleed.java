package app.southstar21.extension.instagram.liquidglass;

import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.WeakHashMap;

/**
 * iOS style Reels: the video fills the whole screen, under the status bar and behind the tab
 * bar, while the caption, buttons and header stay where Instagram put them.
 * <p>
 * Instagram stops the Reels viewer below the status bar and above the tab bar. Rather than
 * relayout its Litho items, each item's media is scaled up around a pivot that pushes it out
 * to both screen edges (cropping the sides a little, like iOS does on tall screens). Every item
 * is clipped so neighbouring reels never overlap. Their slots are a viewer height apart but each
 * picture is a screen high, so the line between two reels can't simply follow the slots: at
 * rest the current reel must cover the strips under the status bar and behind the tab bar, and
 * switching those strips to the next reel as soon as a swipe starts made them jump. Instead the
 * line moves with the swipe, from the screen bottom to the screen top, a little faster than the
 * content, so the strips change over smoothly. The caption and buttons of a reel sliding away
 * stay inside the viewer, and Instagram's caption gradient is stretched to the screen bottom so
 * it doesn't end in a line above the tab bar. Letterboxed reels (landscape, 4:5) are left alone:
 * zooming them would only crop their sides. The header's dark legibility gradient is stretched
 * up behind the status bar too, so it doesn't end in a hard line there.
 */
final class ReelsFullBleed {
    private static final long SCAN_INTERVAL_MS = 250;

    private final ViewGroup container;
    private final int pagerId;
    private final int mediaId;
    private final int actionBarId;
    private final int bottomGradientId;
    private final int[] location = new int[2];
    /** Items and media we changed, so they can be put back when Reels is left. */
    private final WeakHashMap<View, Boolean> touched = new WeakHashMap<>();
    private WeakReference<ViewGroup> pager;
    private WeakReference<View> actionBar;
    /** Our stretched copy of the header background, and how far up it reaches. */
    private Drawable stretchedHeaderBackground;
    private int stretchedBy;
    private long lastScan;

    ReelsFullBleed(ViewGroup container) {
        this.container = container;
        pagerId = container.getResources().getIdentifier("clips_viewer_view_pager", "id", "com.instagram.android");
        mediaId = container.getResources().getIdentifier("clips_media_component", "id", "com.instagram.android");
        actionBarId = container.getResources().getIdentifier("clips_viewer_action_bar", "id", "com.instagram.android");
        bottomGradientId = container.getResources().getIdentifier("clips_bottom_legibility_gradient_component", "id", "com.instagram.android");
    }

    void update(boolean active) {
        if (!active) {
            restore();
            return;
        }
        ViewGroup viewer = pager();
        if (viewer == null || viewer.getChildCount() == 0 || !(viewer.getChildAt(0) instanceof ViewGroup)) return;
        ViewGroup items = (ViewGroup) viewer.getChildAt(0);

        int screenHeight = container.getRootView().getHeight();
        viewer.getLocationInWindow(location);
        int viewerTop = location[1];
        int viewerBottom = viewerTop + viewer.getHeight();
        if (viewerTop < 0 || viewerBottom > screenHeight || viewer.getHeight() == 0) return;
        int extraTop = viewerTop;
        int extraBottom = screenHeight - viewerBottom;
        if (extraTop + extraBottom == 0) return;

        // Visible items from top to bottom, and the line between each pair (window rows).
        ArrayList<View> visible = new ArrayList<>();
        for (int i = 0; i < items.getChildCount(); i++) {
            View item = items.getChildAt(i);
            if (item.getVisibility() == View.VISIBLE && item.getHeight() > 0) visible.add(item);
        }
        Collections.sort(visible, (a, b) -> Integer.compare(windowTop(a), windowTop(b)));
        int[] lines = new int[Math.max(0, visible.size() - 1)];
        for (int i = 0; i < lines.length; i++) {
            View next = visible.get(i + 1);
            int nextTop = windowTop(next);
            // 0 while the next reel waits below the viewer, 1 once it fills the viewer.
            float progress = Math.max(0f, Math.min(1f, (viewerBottom - nextTop) / (float) next.getHeight()));
            lines[i] = Math.round(nextTop + extraBottom - (extraTop + extraBottom) * progress);
        }

        for (int i = 0; i < visible.size(); i++) {
            View item = visible.get(i);
            View media = mediaId == 0 ? null : item.findViewById(mediaId);
            if (media == null || media.getHeight() == 0) continue;

            float h = media.getHeight();
            float scale = fillsFrame(media, item.getHeight()) ? (h + extraTop + extraBottom) / h : 1f;
            // The pivot that moves the top edge up by extraTop and the bottom down by extraBottom.
            float pivotY = scale == 1f ? media.getPivotY() : extraTop / (scale - 1f);
            if (media.getScaleY() != scale || media.getPivotY() != pivotY) {
                media.setPivotX(media.getWidth() / 2f);
                media.setPivotY(pivotY);
                media.setScaleX(scale);
                media.setScaleY(scale);
            }
            touched.put(media, Boolean.TRUE);
            unclipUpTo(media, item);

            int top = windowTop(item);
            int from = i > 0 ? lines[i - 1] : 0;
            int to = i < lines.length ? lines[i] : screenHeight;
            int clipTop = from - top;
            int clipBottom = Math.max(clipTop, to - top);
            Rect clip = item.getClipBounds();
            if (clip == null || clip.top != clipTop || clip.bottom != clipBottom || clip.right != item.getWidth()) {
                item.setClipBounds(new Rect(0, clipTop, item.getWidth(), clipBottom));
            }
            touched.put(item, Boolean.TRUE);
            boolean stretchGradient = to > viewerBottom && scale != 1f;
            stretchBottomGradient(item, stretchGradient ? extraBottom : 0);
            clipOverlaysToViewer(media, item, viewerTop, stretchGradient ? to : viewerBottom);
        }
        unclipToScreen(items, screenHeight);
        stretchHeaderBackground();
    }

    private void stretchHeaderBackground() {
        View header = actionBar != null ? actionBar.get() : null;
        if (header == null || !header.isAttachedToWindow()) return;
        header.getLocationInWindow(location);
        int up = Math.round(location[1] - header.getTranslationY());
        Drawable bg = header.getBackground();
        if (bg == null || up <= 0 || (bg == stretchedHeaderBackground && up == stretchedBy)) return;
        Drawable original = bg == stretchedHeaderBackground ? ((InsetDrawable) bg).getDrawable() : bg;
        stretchedHeaderBackground = new InsetDrawable(original, 0, -up, 0, 0);
        stretchedBy = up;
        // setBackground() takes the drawable's padding, which the negative inset would shrink.
        int l = header.getPaddingLeft(), t = header.getPaddingTop(), r = header.getPaddingRight(), b = header.getPaddingBottom();
        header.setBackground(stretchedHeaderBackground);
        header.setPadding(l, t, r, b);
    }

    private int windowTop(View view) {
        view.getLocationInWindow(location);
        return location[1];
    }

    /** Stretches Instagram's dark caption gradient down by {@code extra}, from its top edge. */
    private void stretchBottomGradient(View item, int extra) {
        View gradient = bottomGradientId == 0 ? null : item.findViewById(bottomGradientId);
        if (gradient == null || gradient.getHeight() == 0) return;
        float scale = (gradient.getHeight() + extra) / (float) gradient.getHeight();
        if (gradient.getScaleY() != scale || gradient.getPivotY() != 0f) {
            gradient.setPivotY(0f);
            gradient.setScaleY(scale);
        }
        touched.put(gradient, Boolean.TRUE);
        if (extra > 0) unclipUpTo(gradient, item);
    }

    /** Clips everything in the item except the media (and its ancestors) to the viewer. */
    private void clipOverlaysToViewer(View media, View item, int viewerTop, int viewerBottom) {
        for (View child = media; child != item && child.getParent() instanceof ViewGroup; ) {
            ViewGroup parent = (ViewGroup) child.getParent();
            for (int i = 0; i < parent.getChildCount(); i++) {
                View overlay = parent.getChildAt(i);
                if (overlay == child || overlay.getVisibility() != View.VISIBLE) continue;
                overlay.getLocationInWindow(location);
                int top = Math.max(0, viewerTop - location[1]);
                int bottom = Math.min(overlay.getHeight(), viewerBottom - location[1]);
                Rect clip = overlay.getClipBounds();
                if (top <= 0 && bottom >= overlay.getHeight()) {
                    if (clip != null) overlay.setClipBounds(null);
                } else if (clip == null || clip.top != top || clip.bottom != bottom || clip.right != overlay.getWidth()) {
                    overlay.setClipBounds(new Rect(0, top, overlay.getWidth(), Math.max(top, bottom)));
                }
                touched.put(overlay, Boolean.TRUE);
            }
            child = parent;
        }
    }

    /**
     * Whether the reel's picture covers its whole slot: the biggest video or image in it is at
     * least as tall as the item. Views taller than the item are Instagram's dimmed backdrop
     * behind letterboxed media, not the media itself.
     */
    private static boolean fillsFrame(View media, int itemHeight) {
        int best = 0;
        java.util.ArrayDeque<View> queue = new java.util.ArrayDeque<>();
        queue.add(media);
        int visited = 0;
        while (!queue.isEmpty() && visited++ < 80) {
            View v = queue.poll();
            if (v.getVisibility() != View.VISIBLE) continue;
            if ((v instanceof android.view.TextureView || v instanceof android.widget.ImageView)
                    && v.getHeight() <= itemHeight + 1) {
                best = Math.max(best, v.getHeight());
            }
            if (v instanceof ViewGroup) {
                ViewGroup g = (ViewGroup) v;
                for (int i = 0; i < g.getChildCount(); i++) queue.add(g.getChildAt(i));
            }
        }
        return best >= itemHeight - 2;
    }

    private ViewGroup pager() {
        ViewGroup viewer = pager != null ? pager.get() : null;
        if (viewer != null && viewer.isAttachedToWindow()) return viewer;
        long now = SystemClock.uptimeMillis();
        if (pagerId == 0 || now - lastScan < SCAN_INTERVAL_MS) return null;
        lastScan = now;
        View found = container.findViewById(pagerId);
        pager = found instanceof ViewGroup ? new WeakReference<>((ViewGroup) found) : null;
        View header = actionBarId == 0 ? null : container.findViewById(actionBarId);
        actionBar = header != null ? new WeakReference<>(header) : null;
        return pager != null ? pager.get() : null;
    }

    private void restore() {
        if (touched.isEmpty()) return;
        for (View v : touched.keySet()) {
            if (v == null) continue;
            v.setScaleX(1f);
            v.setScaleY(1f);
            v.setClipBounds(null);
        }
        touched.clear();
    }

    /** Lets the media draw past its parents inside the item; the item's clip bounds limit it. */
    private static void unclipUpTo(View view, View item) {
        for (ViewParent p = view.getParent(); p instanceof ViewGroup; p = p.getParent()) {
            ViewGroup g = (ViewGroup) p;
            if (g.getClipChildren()) g.setClipChildren(false);
            if (g.getClipToPadding()) g.setClipToPadding(false);
            if (g == item) return;
        }
    }

    /** Lets {@code view} draw over the whole screen height. */
    private void unclipToScreen(ViewGroup view, int screenHeight) {
        for (ViewParent p = view; p instanceof ViewGroup; p = p.getParent()) {
            ViewGroup g = (ViewGroup) p;
            if (g.getClipChildren()) g.setClipChildren(false);
            if (g.getClipToPadding()) g.setClipToPadding(false);
            g.getLocationInWindow(location);
            if (location[1] <= 0 && location[1] + g.getHeight() >= screenHeight) return;
        }
    }
}
