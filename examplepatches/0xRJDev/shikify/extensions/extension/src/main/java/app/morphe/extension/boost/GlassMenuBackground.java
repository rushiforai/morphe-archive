package app.morphe.extension.boost;

import android.app.Activity;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import org.xmlpull.v1.XmlPullParser;

/**
 * Material 3 menu container for every popup menu (toolbar overflow, post/comment ⋮, context
 * menus). Inflated from {@code res/drawable/shikify_menu_background.xml} via the framework's
 * custom-drawable support (API 24+), so no bytecode hook is needed. Rounded 16dp corners and a
 * small margin from the screen edge; with "Glass pill blur" on (Android 12+) the container is
 * the same frosted glass as the navigation pill, sampling the Activity behind the popup.
 */
public final class GlassMenuBackground extends Drawable implements Drawable.Callback, View.OnAttachStateChangeListener {
    private static final String PACKAGE = "com.rubenmayayo.reddit";
    private static final float CORNER_DP = 16, INSET_DP = 6, LIST_PADDING_DP = 8;
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF shape = new RectF();
    private final Rect inner = new Rect();
    private float density = Resources.getSystem().getDisplayMetrics().density;
    private int color = 0xff2b2d31;
    private FeedPillBlur glass;
    private View host;
    private boolean glassChecked;
    private int alpha = 255;

    public GlassMenuBackground() { fill.setColor(color); }

    @Override public void inflate(Resources resources, XmlPullParser parser, AttributeSet attrs, Resources.Theme theme)
            throws org.xmlpull.v1.XmlPullParserException, java.io.IOException {
        super.inflate(resources, parser, attrs, theme);
        density = resources.getDisplayMetrics().density;
        resolve(resources, theme);
    }
    @Override public boolean canApplyTheme() { return true; }
    @Override public void applyTheme(Resources.Theme theme) { resolve(theme.getResources(), theme); }

    private void resolve(Resources resources, Resources.Theme theme) {
        if (theme == null) return;
        TypedValue value = new TypedValue();
        for (String name : new String[] {"colorSurfaceContainerHigh", "colorSurfaceContainer", "colorSurface"}) {
            int attr = resources.getIdentifier(name, "attr", PACKAGE);
            if (attr != 0 && theme.resolveAttribute(attr, value, true)) {
                color = value.resourceId != 0 && value.type < TypedValue.TYPE_FIRST_COLOR_INT
                    ? resources.getColor(value.resourceId, theme) : value.data;
                fill.setColor(color); invalidateSelf(); return;
            }
        }
    }

    @Override public boolean getPadding(Rect padding) {
        int inset = Math.round(INSET_DP * density), list = Math.round(LIST_PADDING_DP * density);
        padding.set(inset, inset + list, inset, inset + list);
        return true;
    }

    @Override protected void onBoundsChange(Rect bounds) {
        int inset = Math.round(INSET_DP * density);
        inner.set(bounds); inner.inset(inset, inset); shape.set(inner);
        if (glass != null) glass.setBounds(inner);
    }

    @Override public void getOutline(Outline outline) {
        outline.setRoundRect(inner, CORNER_DP * density);
        outline.setAlpha(glass != null ? 0.5f : 1f);
    }

    @Override public void draw(Canvas canvas) {
        if (inner.isEmpty()) return;
        if (!glassChecked) attachGlass(canvas);
        if (glass != null) { glass.setAlpha(alpha); glass.draw(canvas); }
        else { fill.setAlpha(Math.round((color >>> 24) * alpha / 255f)); canvas.drawRoundRect(shape, CORNER_DP * density, CORNER_DP * density, fill); }
    }


    private void attachGlass(Canvas canvas) {
        glassChecked = true;
        Callback callback = getCallback();
        if (!(callback instanceof View)) return;
        host = (View) callback;
        // Clip native row highlights to the rounded container.
        host.setClipToOutline(true);
        if (Build.VERSION.SDK_INT < 31 || !canvas.isHardwareAccelerated()) return;
        try {
            if (!android.preference.PreferenceManager.getDefaultSharedPreferences(host.getContext())
                    .getBoolean("shikify_feed_pill_blur", true)) return;
            Activity activity = CommentsChromeTweaks.activity(host.getContext());
            if (activity == null || activity.getWindow() == null) return;
            View source = activity.getWindow().getDecorView();
            if (source == host.getRootView()) return;
            glass = new FeedPillBlur(source, host, color, false, CORNER_DP, true, 72, 2);
            glass.setCallback(this);
            glass.setBounds(inner);
            glass.start();
            host.addOnAttachStateChangeListener(this);
            host.invalidateOutline();
        } catch (RuntimeException | LinkageError error) {
            glass = null;
        }
    }
    // Popup windows reuse their background across shows; follow the host's attachment.
    @Override public void onViewAttachedToWindow(View view) { if (glass != null) glass.start(); }
    @Override public void onViewDetachedFromWindow(View view) { if (glass != null) glass.stop(); }
    @Override public void invalidateDrawable(Drawable who) { invalidateSelf(); }
    @Override public void scheduleDrawable(Drawable who, Runnable what, long when) { scheduleSelf(what, when); }
    @Override public void unscheduleDrawable(Drawable who, Runnable what) { unscheduleSelf(what); }
    @Override public void setAlpha(int alpha) { this.alpha = alpha; invalidateSelf(); }
    @Override public int getAlpha() { return alpha; }
    @Override public void setColorFilter(ColorFilter filter) {}
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
}
