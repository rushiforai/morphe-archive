package io.github.sabopura.morphe.extension.youtube.ambient;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import io.github.sabopura.morphe.extension.youtube.shared.Views;

/**
 * Theater mode's see-through watch page, done where the page is painted rather than
 * afterwards: the page background colour itself becomes transparent, the same way a theme
 * swaps white for black, and the light is drawn underneath. Text, icons and thumbnails are
 * simply YouTube's own, untouched.
 *
 * <p>Two kinds of background exist. Plain views carry a background drawable, which is made
 * transparent and restored here. Litho components paint theirs through one drawable class,
 * whose paint colour is intercepted by {@link #onLithoBackground}.
 */
@SuppressWarnings("unused")
public final class SeeThroughPage {
    private static final String TAG = AmbientLightController.TAG;
    /** Sheets and scrims of the watch page that are not plain page-coloured fills. */
    private static final String[] CLEARED_IDS = {
            "watch_panel", "watch_panel_scrim", "video_info_loading_layout"
    };

    /**
     * YouTube's own ambient mode ("cinematic lighting"): a blurred copy of the video with a
     * dark gradient behind the title and comments. It sits between the page and the light
     * and would cover the light there, so it is hidden while theater is on.
     */
    private static final String[] CINEMATIC_IDS = {
            "watch_cinematic_background", "watch_cinematic_tablet_background",
            "tablet_watch_cinematic_full_background", "cinematic_image_background",
            "cinematic_scrim", "cinematic_header"
    };
    private static int[] cinematicIds;
    /** Views of YouTube's ambient mode hidden here, with their original alpha. */
    private static final IdentityHashMap<View, Float> hiddenViews = new IdentityHashMap<>();
    static volatile int statusHiddenViews;

    private static final Object LOCK = new Object();
    /** Litho background drawables that painted a neutral colour, so a switch can refresh them. */
    private static final WeakHashMap<Drawable, Boolean> lithoBackgrounds = new WeakHashMap<>();
    /** Views whose background was made transparent: {drawable, original alpha}. */
    private static final IdentityHashMap<View, Object[]> clearedViews = new IdentityHashMap<>();

    private static volatile boolean active;
    private static volatile int pageColour = 0xFF0F0F0F;
    private static volatile boolean hookSeen;
    private static Drawable hostOriginalBackground;
    private static View lightHost;
    private static int[] clearedIds;
    static volatile int statusClearedViews;

    private SeeThroughPage() {
    }

    /** True when the patch installed the Litho hook and YouTube has used it. */
    static boolean isAvailable() {
        return hookSeen;
    }

    static boolean isActive() {
        return active;
    }

    static int trackedLithoBackgrounds() {
        synchronized (LOCK) {
            return lithoBackgrounds.size();
        }
    }

    /** The drawable whose bounds are changing on this thread. */
    private static final ThreadLocal<Object> boundsOwner = new ThreadLocal<>();

    /**
     * Injection point: a Litho background drawable is about to load its paint.
     */
    public static void onLithoBounds(Object drawable) {
        boundsOwner.set(drawable);
    }

    /**
     * Injection point: right after that drawable set its paint colour.
     */
    public static void onLithoBackground(Paint paint) {
        try {
            Object drawable = boundsOwner.get();
            boundsOwner.set(null);
            if (!hookSeen) {
                hookSeen = true;
                Log.d(TAG, "See-through hook is live");
            }
            int colour = paint.getColor();
            if (!AmbientMath.isOpaqueNeutral(colour)) return;
            if (drawable instanceof Drawable) {
                synchronized (LOCK) {
                    lithoBackgrounds.put((Drawable) drawable, Boolean.TRUE);
                }
            }
            if (!active) return;
            int replacement = AmbientMath.seeThroughColour(colour, pageColour);
            // A small page-coloured fill is a button or chip (for example a white button on
            // a dark advert card), not page background: it keeps its colour.
            if (replacement == 0 && drawable instanceof Drawable
                    && isButtonSized(((Drawable) drawable).getBounds())) return;
            paint.setColor(replacement);
        } catch (Throwable ignored) {
            // Never let a cosmetic feature break YouTube's layout pass.
        }
    }

    private static boolean isButtonSized(Rect bounds) {
        android.util.DisplayMetrics metrics =
                android.content.res.Resources.getSystem().getDisplayMetrics();
        return bounds.width() < Math.min(metrics.widthPixels, metrics.heightPixels) * 0.45f
                && bounds.height() < 64 * metrics.density;
    }

    /**
     * Main thread. Makes the watch page under {@code host} see-through, or restores it.
     * Called regularly while active so backgrounds YouTube creates later are covered too.
     */
    static void update(AmbientPageGlowView light, View host, View player, boolean wanted,
                       int colour) {
        if (wanted && host != null) {
            boolean changed = !active || pageColour != colour;
            pageColour = colour;
            active = true;
            if (lightHost != host) {
                restoreHost();
                hostOriginalBackground = host.getBackground();
                lightHost = host;
                host.setBackground(new LightDrawable(light, host));
            }
            if (clearedIds == null) {
                clearedIds = new int[CLEARED_IDS.length];
                for (int i = 0; i < CLEARED_IDS.length; i++) {
                    clearedIds[i] = Views.resource(host.getContext(), "id", CLEARED_IDS[i]);
                }
            }
            clearedViews.keySet().removeIf(view -> !view.isAttachedToWindow());
            clearBackgrounds(host, player, host.getWidth() / 3, 0);
            statusClearedViews = clearedViews.size();
            if (changed) {
                refreshLithoBackgrounds();
                if (Log.isLoggable(TAG, Log.DEBUG)) {
                    Log.d(TAG, String.format("See-through on: page #%08X views=%d litho=%d",
                            colour, clearedViews.size(), trackedLithoBackgrounds()));
                }
            }
        } else if (active) {
            active = false;
            for (Map.Entry<View, Object[]> entry : clearedViews.entrySet()) {
                Object[] saved = entry.getValue();
                ((Drawable) saved[0]).setAlpha((Integer) saved[1]);
                entry.getKey().invalidate();
            }
            clearedViews.clear();
            statusClearedViews = 0;
            restoreHost();
            refreshLithoBackgrounds();
        }
    }

    /**
     * Every frame while active: YouTube animates the alpha of scrims and of its own ambient
     * mode while the page scrolls (for example when the comments leave the screen), which
     * undid the see-through state until the next one-second rescan and could fade the page
     * to black in between. The few views involved are put back right away.
     */
    static void keep() {
        for (View view : hiddenViews.keySet()) {
            if (view.getAlpha() != 0f) {
                view.setAlpha(0f);
                restoredCount++;
            }
        }
        if (!active) return;
        for (Map.Entry<View, Object[]> entry : clearedViews.entrySet()) {
            Drawable drawable = (Drawable) entry.getValue()[0];
            if (entry.getKey().getBackground() == drawable && drawable.getAlpha() != 0) {
                drawable.setAlpha(0);
                entry.getKey().invalidate();
                restoredCount++;
            }
        }
    }

    private static boolean cinematicSuppressed;

    /**
     * YouTube's own ambient mode is kept hidden whenever our light shows, in every mode, so the
     * two never stack. Its setting is left alone: once our light is off, it comes back.
     */
    static void suppressCinematic(View root, View player, boolean wanted) {
        if (wanted && root != null) {
            cinematicSuppressed = true;
            hiddenViews.keySet().removeIf(view -> !view.isAttachedToWindow());
            hideCinematic(root, player, 0);
            statusHiddenViews = hiddenViews.size();
        } else if (cinematicSuppressed) {
            cinematicSuppressed = false;
            for (Map.Entry<View, Float> entry : hiddenViews.entrySet()) {
                entry.getKey().setAlpha(entry.getValue());
            }
            hiddenViews.clear();
            statusHiddenViews = 0;
        }
    }

    static volatile int restoredCount;

    /**
     * Diagnostics: the views whose painting reaches the point (x, y) of the window, top-most
     * first, with what they paint. Used to name whatever covers the light on a device.
     */
    static String paintersAt(View root, int x, int y) {
        java.util.ArrayList<String> found = new java.util.ArrayList<>();
        collectPainters(root, x, y, new int[2], found, 0);
        // Top-most first, one per line; our own layers are left out.
        StringBuilder out = new StringBuilder();
        int lines = 0;
        for (int i = found.size() - 1; i >= 0 && lines < 4; i--) {
            String name = found.get(i);
            if (name.startsWith("DanmakuOverlayView") || name.startsWith("AmbientPageGlowView")
                    || name.startsWith("AmbientLightView")) continue;
            if (out.length() > 0) out.append('\n');
            out.append(lines + 1).append(") ").append(name);
            lines++;
        }
        return out.length() == 0 ? "-" : out.toString();
    }

    private static void collectPainters(View view, int x, int y, int[] location,
                                        java.util.List<String> found, int depth) {
        if (view == null || depth > 60 || view.getVisibility() != View.VISIBLE
                || view.getAlpha() <= 0f) return;
        view.getLocationInWindow(location);
        if (x < location[0] || y < location[1] || x >= location[0] + view.getWidth()
                || y >= location[1] + view.getHeight()) return;
        Drawable background = view.getBackground();
        if (background instanceof LightDrawable) {
            found.add("LIGHT");
        } else if (background != null && background.getAlpha() > 0) {
            String paint;
            if (background instanceof ColorDrawable) {
                paint = String.format("#%08X", ((ColorDrawable) background).getColor());
            } else {
                paint = background.getClass().getSimpleName() + "@" + background.getAlpha();
            }
            found.add(describe(view) + ":" + paint
                    + (view.getAlpha() < 1f ? " a" + Math.round(view.getAlpha() * 100) : ""));
        } else if (!view.willNotDraw() && !(view instanceof ViewGroup)) {
            found.add(describe(view));
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                collectPainters(group.getChildAt(i), x, y, location, found, depth + 1);
            }
        }
    }

    private static String describe(View view) {
        if (view.getId() != View.NO_ID) {
            try {
                return view.getResources().getResourceEntryName(view.getId());
            } catch (Throwable ignored) {
                // Generated id.
            }
        }
        return view.getClass().getSimpleName();
    }

    private static void hideCinematic(View view, View player, int depth) {
        if (view == null || view == player || depth > 48) return;
        if (cinematicIds == null) {
            cinematicIds = new int[CINEMATIC_IDS.length];
            for (int i = 0; i < CINEMATIC_IDS.length; i++) {
                cinematicIds[i] = Views.resource(view.getContext(), "id", CINEMATIC_IDS[i]);
            }
        }
        if (isCinematic(view)) {
            // YouTube animates this view's alpha itself, so it is re-applied on every scan.
            if (!hiddenViews.containsKey(view)) hiddenViews.put(view, view.getAlpha());
            if (view.getAlpha() != 0f) view.setAlpha(0f);
            return;
        }
        if (view.getVisibility() != View.VISIBLE) return;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                hideCinematic(group.getChildAt(i), player, depth + 1);
            }
        }
    }

    private static boolean isCinematic(View view) {
        int id = view.getId();
        if (id != View.NO_ID) {
            for (int cinematic : cinematicIds) {
                if (cinematic != 0 && cinematic == id) return true;
            }
        }
        return view.getClass().getSimpleName().contains("Cinematic");
    }

    private static void restoreHost() {
        View host = lightHost;
        if (host != null && host.getBackground() instanceof LightDrawable) {
            host.setBackground(hostOriginalBackground);
        }
        lightHost = null;
        hostOriginalBackground = null;
    }

    /** Backgrounds outside the watch page cleared for the light surface: {drawable, alpha}. */
    private static final IdentityHashMap<View, Object[]> clearedAncestors = new IdentityHashMap<>();
    private static final String[] SYSTEM_BAR_BACKGROUND_IDS = {
            "statusBarBackground", "navigationBarBackground"
    };

    /**
     * With the light on a surface underneath the window, everything the window paints below
     * the watch page would hide it: the views around the page and the system bar strips.
     */
    static void clearAroundPage(View host) {
        for (android.view.ViewParent parent = host.getParent(); parent instanceof View;
             parent = parent.getParent()) {
            clearAncestor((View) parent);
        }
        View root = host.getRootView();
        if (systemBarIds == null) {
            systemBarIds = new int[SYSTEM_BAR_BACKGROUND_IDS.length];
            for (int i = 0; i < systemBarIds.length; i++) {
                systemBarIds[i] = root.getResources()
                        .getIdentifier(SYSTEM_BAR_BACKGROUND_IDS[i], "id", "android");
            }
        }
        for (int id : systemBarIds) {
            if (id != 0) clearAncestor(root.findViewById(id));
        }
    }

    private static int[] systemBarIds;

    private static void clearAncestor(View view) {
        Drawable background = view == null ? null : view.getBackground();
        if (background == null) return;
        Object[] saved = clearedAncestors.get(view);
        if (saved != null && saved[0] == background) {
            if (background.getAlpha() != 0) background.setAlpha(0);
            return;
        }
        Drawable mutable = background.mutate();
        clearedAncestors.put(view, new Object[]{mutable, mutable.getAlpha()});
        mutable.setAlpha(0);
        view.invalidate();
    }

    static void restoreAroundPage() {
        for (Map.Entry<View, Object[]> entry : clearedAncestors.entrySet()) {
            Object[] saved = entry.getValue();
            ((Drawable) saved[0]).setAlpha((Integer) saved[1]);
            entry.getKey().invalidate();
        }
        clearedAncestors.clear();
    }

    private static void clearBackgrounds(View view, View player, int minWidth, int depth) {
        if (view == null || view == player || depth > 48
                || view.getVisibility() != View.VISIBLE) return;
        Drawable background = view.getBackground();
        if (background != null && !(background instanceof LightDrawable)
                && view.getWidth() >= minWidth) {
            Object[] saved = clearedViews.get(view);
            if (saved == null || saved[0] != background) {
                boolean pageFill = background instanceof ColorDrawable
                        && AmbientMath.seeThroughColour(
                                ((ColorDrawable) background).getColor(), pageColour) == 0;
                if (pageFill || isClearedId(view.getId())) {
                    Drawable mutable = background.mutate();
                    clearedViews.put(view, new Object[]{mutable, mutable.getAlpha()});
                    mutable.setAlpha(0);
                    view.invalidate();
                }
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                clearBackgrounds(group.getChildAt(i), player, minWidth, depth + 1);
            }
        }
    }

    private static boolean isClearedId(int id) {
        if (id == View.NO_ID || clearedIds == null) return false;
        for (int cleared : clearedIds) {
            if (cleared != 0 && cleared == id) return true;
        }
        return false;
    }

    /**
     * A Litho background only takes its colour when its bounds change, so nudge the bounds
     * of every drawable seen so far to make it pick the colour up again.
     */
    private static void refreshLithoBackgrounds() {
        List<Drawable> drawables;
        synchronized (LOCK) {
            drawables = new ArrayList<>(lithoBackgrounds.keySet());
        }
        Rect bounds = new Rect();
        for (Drawable drawable : drawables) {
            if (drawable == null) continue;
            try {
                drawable.copyBounds(bounds);
                if (bounds.isEmpty()) continue;
                drawable.setBounds(bounds.left, bounds.top, bounds.right, bounds.bottom + 1);
                drawable.setBounds(bounds);
                drawable.invalidateSelf();
            } catch (Throwable ignored) {
                // A recycled drawable is refreshed by YouTube when it is used again.
            }
        }
    }

    static boolean isLightDrawable(Drawable drawable) {
        return drawable instanceof LightDrawable;
    }

    /** The light, painted as the background of the whole watch page. */
    private static final class LightDrawable extends Drawable {
        private final AmbientPageGlowView light;
        private final View host;

        LightDrawable(AmbientPageGlowView light, View host) {
            this.light = light;
            this.host = host;
        }

        @Override public void draw(Canvas canvas) {
            light.drawBehindPage(canvas, host);
        }

        @Override public void setAlpha(int alpha) {
        }

        @Override public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override public int getOpacity() {
            return light.lightOnSurface() ? PixelFormat.TRANSLUCENT : PixelFormat.OPAQUE;
        }
    }

    /**
     * Diagnostics: lists who paints large opaque fills inside {@code view}, with the calling
     * classes, by replaying its drawing into a recording canvas.
     */
    static void probe(View view, StringBuilder out) {
        if (view == null || view.getWidth() <= 0 || view.getHeight() <= 0) return;
        try {
            Bitmap bitmap = Bitmap.createBitmap(view.getWidth(), view.getHeight(),
                    Bitmap.Config.ALPHA_8);
            ProbeCanvas canvas = new ProbeCanvas(bitmap, out, view.getWidth() / 2);
            view.draw(canvas);
            bitmap.recycle();
        } catch (Throwable throwable) {
            out.append("probe failed: ").append(throwable).append('\n');
        }
    }

    private static final class ProbeCanvas extends Canvas {
        private final StringBuilder out;
        private final int minWidth;
        private final RectF scratch = new RectF();
        private int count;

        ProbeCanvas(Bitmap bitmap, StringBuilder out, int minWidth) {
            super(bitmap);
            this.out = out;
            this.minWidth = minWidth;
        }

        private void log(String op, float left, float top, float right, float bottom,
                         int colour) {
            if ((colour >>> 24) < 0xC0 || count >= 40) return;
            scratch.set(left, top, right, bottom);
            getMatrix().mapRect(scratch);
            if (scratch.width() < minWidth || scratch.height() < 24) return;
            count++;
            out.append(op).append(' ').append((int) scratch.left).append(',')
                    .append((int) scratch.top).append(' ').append((int) scratch.width())
                    .append('x').append((int) scratch.height())
                    .append(String.format(" #%08X", colour)).append(" by");
            int frames = 0;
            for (StackTraceElement element : new Throwable().getStackTrace()) {
                String name = element.getClassName();
                if (name.startsWith("io.github.sabopura.") || name.startsWith("android.")
                        || name.startsWith("java.")) continue;
                out.append(' ').append(name).append('.').append(element.getMethodName());
                if (++frames >= 4) break;
            }
            out.append('\n');
        }

        @Override public void drawRect(float left, float top, float right, float bottom,
                                       Paint paint) {
            log("rect", left, top, right, bottom, paint.getColor());
        }

        @Override public void drawRect(RectF rect, Paint paint) {
            log("rect", rect.left, rect.top, rect.right, rect.bottom, paint.getColor());
        }

        @Override public void drawRect(Rect rect, Paint paint) {
            log("rect", rect.left, rect.top, rect.right, rect.bottom, paint.getColor());
        }

        @Override public void drawRoundRect(RectF rect, float rx, float ry, Paint paint) {
            log("roundRect", rect.left, rect.top, rect.right, rect.bottom, paint.getColor());
        }

        @Override public void drawRoundRect(float left, float top, float right, float bottom,
                                            float rx, float ry, Paint paint) {
            log("roundRect", left, top, right, bottom, paint.getColor());
        }

        @Override public void drawPath(Path path, Paint paint) {
            RectF bounds = new RectF();
            path.computeBounds(bounds, true);
            log("path", bounds.left, bounds.top, bounds.right, bounds.bottom, paint.getColor());
        }

        @Override public void drawPaint(Paint paint) {
            log("paint", 0, 0, getWidth(), getHeight(), paint.getColor());
        }

        @Override public void drawColor(int colour) {
            log("color", 0, 0, getWidth(), getHeight(), colour);
        }

        @Override public void drawColor(int colour, PorterDuff.Mode mode) {
            log("color", 0, 0, getWidth(), getHeight(), colour);
        }

        @Override public void drawBitmap(Bitmap bitmap, float left, float top, Paint paint) {
        }

        @Override public void drawBitmap(Bitmap bitmap, Rect src, RectF dst, Paint paint) {
        }

        @Override public void drawBitmap(Bitmap bitmap, Rect src, Rect dst, Paint paint) {
        }

        @Override public void drawBitmap(Bitmap bitmap, android.graphics.Matrix matrix,
                                         Paint paint) {
        }
    }
}
