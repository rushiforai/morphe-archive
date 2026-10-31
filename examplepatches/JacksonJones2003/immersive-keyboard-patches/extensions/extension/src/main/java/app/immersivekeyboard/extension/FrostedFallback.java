package app.immersivekeyboard.extension;

import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Stands in for Frosted Glass in one-handed mode, where it gives up and leaves the whole
 * keyboard solid. When the keyboard panel still has no blur a moment after one-handed mode
 * was laid out, this applies the same blur and see-through panels with Frosted Glass's own
 * settings. Everywhere else the panel is left to Frosted Glass alone, which can be slow to
 * start; getting in first there left two blurs fighting over the panel.
 */
final class FrostedFallback {
    private static final String ROOT_TAG = ".keyboard-base-area.keyboard-outline";
    private static final String FLOATING_ROOT_TAG = ".keyboard-base-area";

    /** How long Frosted Glass gets to blur a panel before this steps in. */
    private static final long GRACE_MS = 1000;

    /** Keyboard panels this has given a blur, with the background they had before. */
    private static final Map<View, Drawable[]> APPLIED = new WeakHashMap<>();
    /** When each panel was first seen without any blur. */
    private static final Map<View, Long> UNBLURRED_SINCE = new WeakHashMap<>();

    private FrostedFallback() {
    }

    /**
     * Called while the keyboard draws. Blurs the keyboard panel if Frosted Glass is on but
     * has not blurred it, and takes the blur away again if Frosted Glass is turned off.
     */
    static void ensure(View inputView, boolean frostedEnabled, int blurRadiusPx, int surfaceAlpha,
            float cornerRadiusPx) {
        View root = find(inputView, ROOT_TAG);
        if (root == null) {
            root = find(inputView, FLOATING_ROOT_TAG);
        }
        if (root == null) {
            return;
        }
        Drawable[] applied = APPLIED.get(root);
        boolean ours = applied != null && root.getBackground() == applied[1];
        if (!frostedEnabled || !isOneHanded(inputView)) {
            if (ours) {
                root.setBackground(applied[0]);
            }
            if (applied != null) {
                removeBlur(root, applied);
                APPLIED.remove(root);
            }
            UNBLURRED_SINCE.remove(root);
            return;
        }
        if (!ours) {
            if (applied != null) {
                removeBlur(root, applied);
                APPLIED.remove(root);
            }
            Drawable original = root.getBackground();
            if (containsBlur(original)) {
                // Frosted Glass has done it.
                UNBLURRED_SINCE.remove(root);
                return;
            }
            long now = SystemClock.uptimeMillis();
            Long since = UNBLURRED_SINCE.get(root);
            if (since == null) {
                UNBLURRED_SINCE.put(root, now);
                root.postDelayed(root::invalidate, GRACE_MS + 50);
                return;
            }
            if (now - since < GRACE_MS) {
                return;
            }
            Drawable blur = createBlur(root, blurRadiusPx, cornerRadiusPx);
            if (blur == null) {
                return;
            }
            Drawable layered = original == null ? new LayerDrawable(new Drawable[]{blur})
                    : new LayerDrawable(new Drawable[]{original, blur});
            root.setBackground(layered);
            APPLIED.put(root, new Drawable[]{original, layered, blur});
            UNBLURRED_SINCE.remove(root);
        }
        if (surfaceAlpha >= 0) {
            applySurfaceAlpha(inputView, surfaceAlpha);
        }
    }

    /**
     * Takes this class's blur out of the background it made. Frosted Glass may have stacked
     * that background under its own blur, or kept it to restore later, so emptying it in place
     * is what guarantees the dead blur is never found again.
     */
    private static void removeBlur(View root, Drawable[] applied) {
        LayerDrawable layers = (LayerDrawable) applied[1];
        for (int index = 0; index < layers.getNumberOfLayers(); index++) {
            if (layers.getDrawable(index) == applied[2]) {
                applied[2].setVisible(false, false);
                layers.setDrawable(index, new ColorDrawable(Color.TRANSPARENT));
                root.invalidate();
                return;
            }
        }
    }

    /** One-handed mode shrinks the keys to one side, with the side buttons beside them. */
    private static boolean isOneHanded(View view) {
        if (view.getVisibility() != View.VISIBLE) {
            return false;
        }
        if (view.getClass().getName().endsWith(".KeyboardHolder")) {
            return view.getParent() instanceof View && view.getWidth() > 0
                    && view.getWidth() < ((View) view.getParent()).getWidth() * 0.95f;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                if (isOneHanded(group.getChildAt(index))) {
                    return true;
                }
            }
        }
        return false;
    }

    /** The see-through panels Frosted Glass sets to its custom opacity. */
    private static void applySurfaceAlpha(View view, int alpha) {
        Object tag = view.getTag();
        if (tag instanceof String) {
            String text = (String) tag;
            Drawable background = view.getBackground();
            if (background != null && background.getAlpha() != alpha
                    && (text.contains(".keyboard-header-area")
                    || text.contains(".keyboard-body-area")
                    || text.startsWith(".candidates-area"))) {
                background.setAlpha(alpha);
                view.invalidate();
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                applySurfaceAlpha(group.getChildAt(index), alpha);
            }
        }
    }

    private static boolean containsBlur(Drawable drawable) {
        if (drawable == null) {
            return false;
        }
        if (drawable.getClass().getName().endsWith("BackgroundBlurDrawable")) {
            return true;
        }
        if (drawable instanceof LayerDrawable) {
            LayerDrawable layers = (LayerDrawable) drawable;
            for (int index = 0; index < layers.getNumberOfLayers(); index++) {
                if (containsBlur(layers.getDrawable(index))) {
                    return true;
                }
            }
        }
        return false;
    }

    private static Drawable createBlur(View view, int radiusPx, float cornerRadiusPx) {
        try {
            Method getViewRoot = View.class.getDeclaredMethod("getViewRootImpl");
            getViewRoot.setAccessible(true);
            Object viewRoot = getViewRoot.invoke(view);
            if (viewRoot == null) {
                return null;
            }
            Method create = viewRoot.getClass().getDeclaredMethod("createBackgroundBlurDrawable");
            create.setAccessible(true);
            Drawable blur = (Drawable) create.invoke(viewRoot);
            blur.setVisible(true, false);
            Method setRadius = blur.getClass().getDeclaredMethod("setBlurRadius", int.class);
            setRadius.setAccessible(true);
            setRadius.invoke(blur, Math.max(1, radiusPx));
            Method setCorner = blur.getClass().getDeclaredMethod("setCornerRadius", float.class);
            setCorner.setAccessible(true);
            setCorner.invoke(blur, cornerRadiusPx);
            return blur;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static View find(View view, String tag) {
        if (view.getVisibility() != View.VISIBLE) {
            return null;
        }
        if (tag.equals(view.getTag()) && view.getWidth() > 0 && view.getHeight() > 0) {
            return view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                View found = find(group.getChildAt(index), tag);
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }
}
