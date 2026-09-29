package app.matthew.chrome.extension;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Canvas;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.StateListDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.os.Parcel;
import android.view.View;
import android.view.ViewGroup;
import android.view.inspector.WindowInspector;
import android.webkit.WebView;
import android.widget.PopupWindow;
import android.widget.ListPopupWindow;

/** Normalize dark neutral UI surfaces, preserving text, accent colors, images and web content. */
public final class BlackTheme {
    private static final java.util.WeakHashMap<View, Boolean> watchedRoots = new java.util.WeakHashMap<>();
    private static final java.util.Map<ColorStateList, java.lang.ref.WeakReference<ColorStateList>> palettes =
            java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>());
    private BlackTheme() {}
    public static int background(int color) {
        if (!PatchSettings.enabled(PatchSettings.BLACK)) return color;
        int alpha = Color.alpha(color);
        // Chrome also makes gray surfaces by compositing a pale color at low opacity over black.
        int r = Color.red(color) * alpha / 255, g = Color.green(color) * alpha / 255,
                b = Color.blue(color) * alpha / 255;
        int max = Math.max(r, Math.max(g, b)), min = Math.min(r, Math.min(g, b));
        return alpha > 0 && max <= 100 && max - min <= 28 ? Color.argb(alpha, 0, 0, 0) : color;
    }
    public static void setBackgroundColor(View view, int color) { view.setBackgroundColor(background(color)); }
    public static void setPaintColor(Paint paint, int color) { paint.setColor(background(color)); }
    public static void setGradientColor(GradientDrawable drawable, int color) { drawable.setColor(background(color)); }
    public static void setDrawableColor(ColorDrawable drawable, int color) { drawable.setColor(background(color)); }
    public static ColorStateList backgroundTint(ColorStateList colors) {
        if (colors == null || !PatchSettings.enabled(PatchSettings.BLACK)) return colors;
        if (colors.isStateful()) return statefulBackground(colors);
        int color = colors.getDefaultColor();
        return background(color) == color ? colors : ColorStateList.valueOf(background(color));
    }
    private static ColorStateList statefulBackground(ColorStateList colors) {
        java.lang.ref.WeakReference<ColorStateList> reference = palettes.get(colors);
        ColorStateList cached = reference == null ? null : reference.get();
        if (cached != null) return cached;
        // Android 16's public Parcelable representation preserves every state spec and its order.
        // Validate the format and keep the original on mismatch; never collapse selected/pressed states.
        Parcel parcel = Parcel.obtain();
        ColorStateList result = colors;
        try {
            colors.writeToParcel(parcel, 0);
            parcel.setDataPosition(0);
            int count = parcel.readInt();
            if (count < 1 || count > 128) return colors;
            int[][] states = new int[count][];
            for (int i = 0; i < count; i++) {
                states[i] = parcel.createIntArray();
                if (states[i] == null) return colors;
            }
            int[] values = parcel.createIntArray();
            if (values == null || values.length != count || parcel.dataAvail() != 0) return colors;
            boolean changed = false;
            for (int i = 0; i < count; i++) {
                int mapped = background(values[i]);
                changed |= mapped != values[i]; values[i] = mapped;
            }
            if (changed) result = new ColorStateList(states, values);
        } catch (RuntimeException ignored) {
            // An unsupported platform representation leaves the native palette intact.
        } finally { parcel.recycle(); }
        palettes.put(colors, new java.lang.ref.WeakReference<>(result));
        return result;
    }
    public static void setBackgroundTint(View view, ColorStateList colors) { view.setBackgroundTintList(backgroundTint(colors)); }
    public static void setGradientTint(GradientDrawable drawable, ColorStateList colors) { drawable.setColor(backgroundTint(colors)); }
    public static void setDrawableTint(Drawable drawable, int color) { drawable.setTint(surface(drawable) ? background(color) : color); }
    public static void setDrawableTintList(Drawable drawable, ColorStateList colors) { drawable.setTintList(surface(drawable) ? backgroundTint(colors) : colors); }
    private static boolean surface(Drawable d) {
        if (d == null) return false;
        if (d instanceof ColorDrawable || d instanceof GradientDrawable || d instanceof ShapeDrawable) return true;
        if (d instanceof LayerDrawable) {
            LayerDrawable layers = (LayerDrawable)d;
            if (layers.getNumberOfLayers() == 0) return false;
            for (int i = 0; i < layers.getNumberOfLayers(); i++)
                if (!surface(layers.getDrawable(i))) return false;
            return true;
        }
        if (d instanceof InsetDrawable) return surface(((InsetDrawable)d).getDrawable());
        if (d instanceof StateListDrawable) return surface(d.getCurrent());
        return false;
    }
    public static void watch(Activity activity) {
        View root = activity.getWindow().getDecorView();
        // Framework-created context menus do not call Chrome's PopupWindow methods.
        // WindowInspector exposes only this process's roots through the public Android API.
        root.getViewTreeObserver().addOnWindowFocusChangeListener(focused -> root.post(() -> {
            if (PatchSettings.enabled(PatchSettings.BLACK))
                for (View window : WindowInspector.getGlobalWindowViews()) watchRoot(window);
        }));
        root.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
            if (PatchSettings.enabled(PatchSettings.BLACK)) {
                apply(root);
                activity.getWindow().setStatusBarColor(Color.BLACK);
                activity.getWindow().setNavigationBarColor(Color.BLACK);
            }
        });
    }
    private static void preparePopup(PopupWindow popup) {
        if (!PatchSettings.enabled(PatchSettings.BLACK)) return;
        Drawable background = popup.getBackground();
        if (background != null) normalize(background.mutate());
        View content = popup.getContentView();
        if (content == null) return;
        watchRoot(content);
    }
    public static void showAtLocation(PopupWindow popup, View parent, int gravity, int x, int y) {
        preparePopup(popup); popup.showAtLocation(parent, gravity, x, y);
    }
    public static void showAsDropDown(PopupWindow popup, View anchor, int x, int y) {
        preparePopup(popup); popup.showAsDropDown(anchor, x, y);
    }
    public static void showAsDropDown(PopupWindow popup, View anchor, int x, int y, int gravity) {
        preparePopup(popup); popup.showAsDropDown(anchor, x, y, gravity);
    }
    public static void showListPopup(ListPopupWindow popup) {
        popup.show();
        if (!PatchSettings.enabled(PatchSettings.BLACK)) return;
        if (popup.getBackground() != null) normalize(popup.getBackground().mutate());
        if (popup.getListView() != null) watchRoot(popup.getListView().getRootView());
    }
    public static void showDialog(Dialog dialog) {
        dialog.show();
        if (PatchSettings.enabled(PatchSettings.BLACK) && dialog.getWindow() != null)
            watchRoot(dialog.getWindow().getDecorView());
    }
    private static void watchRoot(View root) {
        apply(root);
        if (watchedRoots.put(root, true) != null) return;
        root.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
            if (PatchSettings.enabled(PatchSettings.BLACK)) apply(root);
        });
    }
    public static void drawFeedBackground(Drawable drawable, Canvas canvas) {
        if (PatchSettings.enabled(PatchSettings.BLACK)) normalize(drawable.mutate());
        drawable.draw(canvas);
    }
    private static void apply(View view) {
        if (view instanceof WebView || view.getClass().getName().startsWith("org.chromium.content.")) return;
        Drawable drawable = view.getBackground();
        if (drawable != null) normalize(drawable.mutate());
        ColorStateList tint = view.getBackgroundTintList();
        ColorStateList black = backgroundTint(tint);
        if (black != tint) view.setBackgroundTintList(black);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) apply(group.getChildAt(i));
        }
    }
    private static void normalize(Drawable drawable) {
        if (drawable == null) return;
        Drawable current = drawable.getCurrent();
        if (current != null && current != drawable) { normalize(current); return; }
        if (drawable instanceof ColorDrawable) {
            ColorDrawable d = (ColorDrawable) drawable;
            int color = background(d.getColor());
            if (color != d.getColor()) d.setColor(color);
        } else if (drawable instanceof GradientDrawable) {
            GradientDrawable d = (GradientDrawable) drawable;
            ColorStateList fill = d.getColor();
            ColorStateList mapped = backgroundTint(fill);
            if (mapped != fill) d.setColor(mapped);
            int[] gradient = d.getColors();
            if (gradient != null) {
                int[] mappedGradient = gradient.clone();
                boolean changed = false;
                for (int i = 0; i < gradient.length; i++) {
                    mappedGradient[i] = background(gradient[i]);
                    changed |= mappedGradient[i] != gradient[i];
                }
                if (changed) d.setColors(mappedGradient);
            }
        } else if (drawable instanceof LayerDrawable) {
            LayerDrawable d = (LayerDrawable) drawable;
            for (int i = 0; i < d.getNumberOfLayers(); i++) normalize(d.getDrawable(i));
        } else if (drawable instanceof InsetDrawable) {
            normalize(((InsetDrawable) drawable).getDrawable());
        } else if (drawable instanceof StateListDrawable) {
            normalize(drawable.getCurrent());
        } else if (drawable instanceof ShapeDrawable) {
            Paint paint = ((ShapeDrawable)drawable).getPaint();
            int color = background(paint.getColor());
            if (color != paint.getColor()) paint.setColor(color);
        }
    }
}
