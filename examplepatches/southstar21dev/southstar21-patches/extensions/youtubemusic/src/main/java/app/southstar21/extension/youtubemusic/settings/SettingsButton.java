package app.southstar21.extension.youtubemusic.settings;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.RippleDrawable;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

import java.lang.ref.WeakReference;

import app.southstar21.extension.youtubemusic.YouTubeMusicHooks;
import app.southstar21.extension.youtubemusic.liquidglass.LiquidGlassNavBarPatch;

/**
 * A button in YouTube Music's top bar, left of the notifications bell, that opens the
 * southstar21 Patches menu. It's a custom view of the bar (a Toolbar) placed at its end, so the
 * Toolbar lays it out next to its menu and never removes it; the menu items themselves are
 * rebuilt by YouTube Music now and then.
 */
@SuppressLint("ViewConstructor")
public final class SettingsButton extends View {
    private final Paint line = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final float density;

    private static WeakReference<ViewGroup> watchedToolbar = new WeakReference<>(null);
    private static WeakReference<SettingsButton> current = new WeakReference<>(null);

    /** The button in the top bar, or null if there's none. */
    static SettingsButton current() {
        SettingsButton button = current.get();
        return button != null && button.isAttachedToWindow() ? button : null;
    }

    private SettingsButton(Activity activity) {
        super(activity);
        density = activity.getResources().getDisplayMetrics().density;
        line.setStyle(Paint.Style.STROKE);
        line.setStrokeCap(Paint.Cap.ROUND);
        line.setStrokeWidth(2f * density);
        line.setColor(Color.WHITE);
        setContentDescription("southstar21 Patches");
        setClickable(true);
        setFocusable(true);
        setBackground(new RippleDrawable(ColorStateList.valueOf(0x33FFFFFF), null, null));
        setOnClickListener(v -> SettingsMenu.show(activity));
    }

    /** Adds the button to the top bar if it isn't there. Cheap enough to call on every layout. */
    public static void ensureInstalled(Activity activity) {
        try {
            int id = LiquidGlassNavBarPatch.id(activity, "toolbar");
            View found = id == 0 ? null : activity.findViewById(id);
            if (!(found instanceof ViewGroup)) return;
            ViewGroup toolbar = (ViewGroup) found;
            if (watchedToolbar.get() != toolbar) {
                watchedToolbar = new WeakReference<>(toolbar);
                // The bar is kept for the activity's life; put the button back if it's ever dropped.
                toolbar.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
                    @Override
                    public void onGlobalLayout() {
                        if (watchedToolbar.get() != toolbar) {
                            toolbar.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                            return;
                        }
                        if (!hasButton(toolbar)) add(activity, toolbar);
                    }
                });
            }
            if (!hasButton(toolbar)) add(activity, toolbar);
        } catch (Throwable t) {
            Log.e(YouTubeMusicHooks.TAG, "Settings button failed", t);
        }
    }

    private static boolean hasButton(ViewGroup toolbar) {
        for (int i = 0; i < toolbar.getChildCount(); i++) {
            if (toolbar.getChildAt(i) instanceof SettingsButton) return true;
        }
        return false;
    }

    private static void add(Activity activity, ViewGroup toolbar) {
        SettingsButton button = new SettingsButton(activity);
        current = new WeakReference<>(button);
        // As wide as YouTube Music's own top bar buttons (48dp).
        int size = Math.round(48 * button.density);
        toolbar.addView(button);
        ViewGroup.LayoutParams lp = button.getLayoutParams();
        lp.width = size;
        lp.height = size;
        setGravity(lp, Gravity.END | Gravity.CENTER_VERTICAL);
        button.setLayoutParams(lp);
    }

    /**
     * Toolbar.LayoutParams: at the end, next to the menu, centered vertically. YouTube Music's
     * Toolbar is obfuscated, field names included, so its gravity field is the int field that
     * holds the default a new custom view gets, START | CENTER_VERTICAL.
     */
    private static void setGravity(ViewGroup.LayoutParams lp, int gravity) {
        int start = Gravity.START | Gravity.CENTER_VERTICAL;
        for (Class<?> c = lp.getClass(); c != null && c != ViewGroup.MarginLayoutParams.class
                && c != ViewGroup.LayoutParams.class; c = c.getSuperclass()) {
            for (java.lang.reflect.Field field : c.getDeclaredFields()) {
                if (field.getType() != int.class || java.lang.reflect.Modifier.isStatic(field.getModifiers())) continue;
                try {
                    field.setAccessible(true);
                    if (field.getInt(lp) == start) {
                        field.setInt(lp, gravity);
                        return;
                    }
                } catch (Throwable ignored) {
                    // Try the next field.
                }
            }
        }
    }

    /** A "sliders" icon: three lines with a knob on each, in a 24dp box like the bar's icons. */
    @Override
    protected void onDraw(Canvas canvas) {
        float size = 22 * density;
        float left = (getWidth() - size) / 2f;
        float top = (getHeight() - size) / 2f;
        float r = 2.6f * density;
        float[] rows = {0.2f, 0.5f, 0.8f};
        float[] knobs = {0.68f, 0.32f, 0.58f};
        for (int i = 0; i < rows.length; i++) {
            float y = top + size * rows[i];
            float kx = left + size * knobs[i];
            canvas.drawLine(left + density, y, kx - r, y, line);
            canvas.drawLine(kx + r, y, left + size - density, y, line);
            canvas.drawCircle(kx, y, r, line);
        }
    }
}
