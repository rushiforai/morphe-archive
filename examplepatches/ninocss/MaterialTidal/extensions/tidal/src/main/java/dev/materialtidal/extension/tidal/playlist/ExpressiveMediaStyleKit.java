package dev.materialtidal.extension.tidal.playlist;

import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableWrapper;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.OvershootInterpolator;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Shared Material 3 Expressive styling toolkit used across TIDAL media detail and
 * collection pages (Playlists, Albums, Artists, My Tracks, My Albums, My Artists).
 */
public final class ExpressiveMediaStyleKit {

    private static final ExecutorService ART_COLOR_EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<View, Boolean> ROUNDED_ROW_ARTWORK = new WeakHashMap<>();
    private static final WeakHashMap<View, Integer> STYLED_CLEAN_ROW_ACCENT = new WeakHashMap<>();
    private static final WeakHashMap<View, ViewGroup> CONNECTED_PRESS_ROWS = new WeakHashMap<>();

    // Cached resource & reflection handles
    private static String cachedDlSpacePkg;
    private static int cachedIdDlSpace;

    private static Class<?> crossfadeDrawableClass;
    private static Method crossfadeGetEndMethod;
    private static Field crossfadeEndField;

    private static Method getShapeAppearanceMethod;
    private static Method setShapeAppearanceMethod;
    private static Method withCornerSizeFloatMethod;
    private static Method getTopLeftCornerSizeMethod;
    private static Method getCornerSizeRectFMethod;
    private static boolean shapeReflectionResolved;

    private static Method cardSetRadiusMethod;
    private static boolean cardReflectionResolved;

    private static Method getUseLightThemeMethod;
    private static boolean iconBtnReflectionResolved;

    private static Method getDownloadedPercentageMethod;
    private static boolean downloadBtnReflectionResolved;

    private static Method setIndicatorColorMethod;
    private static Method setTrackColorMethod;
    private static Method setIndicatorSizeMethod;
    private static Method setIndicatorInsetMethod;
    private static Method setTrackThicknessMethod;
    private static boolean progressReflectionResolved;

    private static Method switchSetThumbTintMethod;
    private static Method switchSetTrackTintMethod;
    private static boolean switchReflectionResolved;

    private ExpressiveMediaStyleKit() {
    }

    /** Drives asynchronous cover-art palette extraction and smooth 320ms transitions. */
    public static final class PaletteTransitionController {
        public final ExpressivePalette active = buildMonetPalette();
        private final ExpressivePalette start = buildMonetPalette();
        private final ExpressivePalette target = buildMonetPalette();
        private final Runnable onUpdated;
        private ValueAnimator animator;
        private Drawable lastDrawable;
        private boolean destroyed;

        public PaletteTransitionController(Runnable onUpdated) {
            this.onUpdated = onUpdated;
            copyPalette(active, target);
        }

        public void extractFromDrawable(Drawable drawable) {
            if (destroyed || drawable == null || drawable == lastDrawable) {
                return;
            }
            lastDrawable = drawable;

            if (MaterialYouConfig.getPlaylistAccentMode() == MaterialYouConfig.PLAYLIST_ACCENT_MONET) {
                animateTo(buildMonetPalette());
                return;
            }

            final Bitmap sample = createPaletteSampleBitmap(drawable);
            if (sample == null) {
                return;
            }

            ART_COLOR_EXECUTOR.execute(() -> {
                try {
                    ExpressivePalette derived = derivePaletteFromSample(sample);
                    MAIN_HANDLER.post(() -> {
                        if (!destroyed) {
                            try {
                                animateTo(derived);
                            } catch (Throwable ignored) {
                            }
                        }
                    });
                } catch (Throwable ignored) {
                } finally {
                    try {
                        if (!sample.isRecycled()) {
                            sample.recycle();
                        }
                    } catch (Throwable ignored) {
                    }
                }
            });
        }

        public void animateTo(ExpressivePalette next) {
            if (destroyed || next == null) {
                return;
            }
            if (animator != null) {
                animator.cancel();
            }
            copyPalette(active, start);
            copyPalette(next, target);

            animator = ValueAnimator.ofFloat(0f, 1f);
            animator.setDuration(320L);
            animator.setInterpolator(new DecelerateInterpolator());
            animator.addUpdateListener(anim -> {
                if (destroyed) {
                    return;
                }
                float f = (float) anim.getAnimatedValue();
                lerpPalette(start, target, f, active);
                if (onUpdated != null) {
                    try {
                        onUpdated.run();
                    } catch (Throwable ignored) {
                    }
                }
            });
            animator.start();
        }

        public void destroy() {
            destroyed = true;
            if (animator != null) {
                animator.cancel();
                animator = null;
            }
        }
    }

    /** Tonal palette container for adaptive cover or pure Monet styling. */
    public static final class ExpressivePalette {
        public int surfaceBase;
        public int surfaceContainer;
        public int surfaceContainerHigh;
        public int primaryAccent;
        public int onPrimary;
        public int shuffleBg;
        public int shuffleFg;
        public int secondaryTileBg;
        public int secondaryActiveBg;
        public int secondaryOutline;
        public int onSurface;
        public int onSurfaceVariant;
        public int outlineVariant;
        public int atmosphericTint;
    }

    /** Circular translucent scrim behind transparent-toolbar navigation and action icons. */
    public static final class ToolbarScrimDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint ringPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float radiusPx;
        private int scrimAlpha = 0x74;

        public ToolbarScrimDrawable(float radiusPx) {
            this.radiusPx = radiusPx;
            paint.setColor(0xFF000000);
            ringPaint.setStyle(Paint.Style.STROKE);
            ringPaint.setColor(0xFFFFFFFF);
        }

        public void setScrimAlpha(int alpha) {
            int clamped = Math.max(0, Math.min(255, alpha));
            if (this.scrimAlpha != clamped) {
                this.scrimAlpha = clamped;
                invalidateSelf();
            }
        }

        @Override
        public void draw(Canvas canvas) {
            if (scrimAlpha <= 0) {
                return;
            }
            boolean lightMode = MaterialYouColorEngine.isLightMode();
            int fillArgb = lightMode ? MaterialYouColorEngine.getSurfaceContainer() : 0xFF000000;
            int ringRgb = lightMode ? MaterialYouColorEngine.getOutlineVariant() : 0xFFFFFFFF;
            int fillAlpha = lightMode
                    ? Math.min(255, Math.round((scrimAlpha / (float) 0x74) * 0xCC))
                    : scrimAlpha;
            paint.setColor(MaterialYouColorEngine.withAlpha(fillArgb, fillAlpha));
            Rect b = getBounds();
            float r = Math.min(radiusPx, Math.min(b.width(), b.height()) * 0.48f);
            canvas.drawCircle(b.centerX(), b.centerY(), r, paint);
            if (MaterialYouConfig.isExpressiveBlurEnabled() && scrimAlpha > 4) {
                ringPaint.setStrokeWidth(Math.max(1f, r * 0.055f));
                int ringAlpha = lightMode
                        ? Math.min(0x66, Math.round((scrimAlpha / (float) 0x74) * 0x52))
                        : Math.min(0x38, Math.round((scrimAlpha / (float) 0x74) * 0x2C));
                ringPaint.setColor(MaterialYouColorEngine.withAlpha(ringRgb, ringAlpha));
                canvas.drawCircle(b.centerX(), b.centerY(), r - ringPaint.getStrokeWidth() * 0.5f, ringPaint);
            }
        }

        @Override
        public void setAlpha(int alpha) {
            setScrimAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    // ---- Measurement & View Helpers ----

    public static int dp(float density, float val) {
        return Math.round(val * density);
    }

    public static float dpf(float density, float val) {
        return val * density;
    }

    public static View findView(View root, int id) {
        return (root != null && id != 0) ? root.findViewById(id) : null;
    }

    public static int getId(Context ctx, String name) {
        if (ctx == null || name == null) {
            return 0;
        }
        return ctx.getResources().getIdentifier(name, "id", ctx.getPackageName());
    }

    public static float resolveStatusBarInsetPx(View rootView, float density) {
        float inset = 0f;
        Context ctx = rootView.getContext();
        int resId = Resources.getSystem().getIdentifier("status_bar_height", "dimen", "android");
        if (resId > 0) {
            try {
                inset = ctx.getResources().getDimensionPixelSize(resId);
            } catch (Throwable ignored) {
            }
        }
        if (inset <= 0f) {
            inset = dp(density, 28f);
        }
        try {
            WindowInsets existing = rootView.getRootWindowInsets();
            if (existing != null) {
                int top = existing.getInsets(WindowInsets.Type.statusBars()).top;
                if (top > 0) {
                    inset = top;
                }
            }
        } catch (Throwable ignored) {
        }
        return inset;
    }

    // ---- Dynamic Palette Derivation & Interpolation ----

    public static ExpressivePalette buildMonetPalette() {
        ExpressivePalette p = new ExpressivePalette();
        p.surfaceBase = MaterialYouColorEngine.getSurfaceBase();
        p.surfaceContainer = MaterialYouColorEngine.getSurfaceContainer();
        p.surfaceContainerHigh = MaterialYouColorEngine.getSurfaceContainerHigh();
        p.primaryAccent = MaterialYouColorEngine.getPrimaryAccent();
        p.onPrimary = MaterialYouColorEngine.getOnPrimary();
        p.shuffleBg = MaterialYouColorEngine.blendRgb(p.surfaceContainerHigh, p.primaryAccent, 0.16f);
        p.shuffleFg = MaterialYouColorEngine.getOnSurface();
        p.secondaryTileBg = p.surfaceContainer;
        p.secondaryActiveBg = MaterialYouColorEngine.blendRgb(p.surfaceContainerHigh, p.primaryAccent, 0.24f);
        p.secondaryOutline = MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.getOutlineVariant(), 0x70);
        p.onSurface = MaterialYouColorEngine.getOnSurface();
        p.onSurfaceVariant = MaterialYouColorEngine.getOnSurfaceVariant();
        p.outlineVariant = MaterialYouColorEngine.getOutlineVariant();
        p.atmosphericTint = MaterialYouColorEngine.blendRgb(p.surfaceBase, p.primaryAccent, 0.14f);
        return p;
    }

    public static Bitmap unwrapBitmap(Drawable d) {
        return unwrapBitmap(d, 0);
    }

    private static Bitmap unwrapBitmap(Drawable d, int depth) {
        if (d == null || depth > 4) {
            return null;
        }
        if (d instanceof BitmapDrawable) {
            return ((BitmapDrawable) d).getBitmap();
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && d instanceof DrawableWrapper) {
            return unwrapBitmap(((DrawableWrapper) d).getDrawable(), depth + 1);
        }
        if (d instanceof LayerDrawable) {
            LayerDrawable ld = (LayerDrawable) d;
            for (int i = ld.getNumberOfLayers() - 1; i >= 0; i--) {
                Bitmap b = unwrapBitmap(ld.getDrawable(i), depth + 1);
                if (b != null) {
                    return b;
                }
            }
        }
        if (d.getClass().getName().endsWith(".CrossfadeDrawable")) {
            Drawable end = unwrapCrossfadeEndDrawable(d);
            if (end != null && end != d) {
                return unwrapBitmap(end, depth + 1);
            }
        }
        return null;
    }

    private static Drawable unwrapCrossfadeEndDrawable(Drawable d) {
        try {
            Class<?> cls = d.getClass();
            if (crossfadeDrawableClass != cls) {
                Method getter = null;
                Field field = null;
                try {
                    Method m = cls.getMethod("getEnd");
                    if (Drawable.class.isAssignableFrom(m.getReturnType())) {
                        getter = m;
                    }
                } catch (Throwable ignored) {
                }
                if (getter == null) {
                    Field finalDrawableField = null;
                    Field lastDrawableField = null;
                    for (Field f : cls.getDeclaredFields()) {
                        if (Drawable.class.isAssignableFrom(f.getType())) {
                            lastDrawableField = f;
                            if (Modifier.isFinal(f.getModifiers())) {
                                finalDrawableField = f;
                            }
                        }
                    }
                    field = finalDrawableField != null ? finalDrawableField : lastDrawableField;
                    if (field != null) {
                        field.setAccessible(true);
                    }
                }
                crossfadeGetEndMethod = getter;
                crossfadeEndField = field;
                crossfadeDrawableClass = cls;
            }
            if (crossfadeGetEndMethod != null) {
                Object res = crossfadeGetEndMethod.invoke(d);
                return res instanceof Drawable ? (Drawable) res : null;
            }
            if (crossfadeEndField != null) {
                Object res = crossfadeEndField.get(d);
                return res instanceof Drawable ? (Drawable) res : null;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    public static Bitmap createPaletteSampleBitmap(Drawable d) {
        Bitmap bmp = unwrapBitmap(d);
        if (bmp == null || bmp.isRecycled() || bmp.getWidth() <= 0 || bmp.getHeight() <= 0) {
            return null;
        }
        Bitmap scaled = null;
        Bitmap swFull = null;
        Bitmap result = null;
        try {
            boolean isHw = Build.VERSION.SDK_INT >= Build.VERSION_CODES.O
                    && bmp.getConfig() == Bitmap.Config.HARDWARE;
            if (isHw) {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                    try {
                        scaled = Bitmap.createScaledBitmap(bmp, 24, 24, true);
                        if (scaled != null && !scaled.isRecycled()) {
                            result = scaled.copy(Bitmap.Config.ARGB_8888, false);
                        }
                    } catch (Throwable ignored) {
                        result = null;
                    } finally {
                        if (scaled != null && scaled != bmp && scaled != result && !scaled.isRecycled()) {
                            scaled.recycle();
                        }
                        scaled = null;
                    }
                }
                if (result == null) {
                    swFull = bmp.copy(Bitmap.Config.ARGB_8888, false);
                    if (swFull != null && !swFull.isRecycled()) {
                        scaled = Bitmap.createScaledBitmap(swFull, 24, 24, true);
                        if (scaled != null && !scaled.isRecycled()) {
                            if (scaled == swFull || scaled.getConfig() != Bitmap.Config.ARGB_8888) {
                                result = scaled.copy(Bitmap.Config.ARGB_8888, false);
                            } else {
                                result = scaled;
                            }
                        }
                    }
                }
            } else {
                scaled = Bitmap.createScaledBitmap(bmp, 24, 24, true);
                if (scaled != null && !scaled.isRecycled()) {
                    if (scaled == bmp || scaled.getConfig() != Bitmap.Config.ARGB_8888) {
                        result = scaled.copy(Bitmap.Config.ARGB_8888, false);
                    } else {
                        result = scaled;
                    }
                }
            }

            if (scaled != null && scaled != bmp && scaled != result && !scaled.isRecycled()) {
                scaled.recycle();
            }
            if (swFull != null && swFull != bmp && swFull != result && !swFull.isRecycled()) {
                swFull.recycle();
            }

            if (result == null || result.isRecycled() || result == bmp) {
                return null;
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O
                    && result.getConfig() == Bitmap.Config.HARDWARE) {
                result.recycle();
                return null;
            }
            return result;
        } catch (Throwable ignored) {
            if (scaled != null && scaled != bmp && !scaled.isRecycled()) {
                try {
                    scaled.recycle();
                } catch (Throwable ignored2) {
                }
            }
            if (swFull != null && swFull != bmp && !swFull.isRecycled()) {
                try {
                    swFull.recycle();
                } catch (Throwable ignored2) {
                }
            }
            if (result != null && result != bmp && !result.isRecycled()) {
                try {
                    result.recycle();
                } catch (Throwable ignored2) {
                }
            }
            return null;
        }
    }

    public static ExpressivePalette derivePaletteFromSample(Bitmap sample) {
        ExpressivePalette base = buildMonetPalette();
        if (sample == null || sample.isRecycled() || sample.getWidth() <= 0 || sample.getHeight() <= 0) {
            return base;
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O && sample.getConfig() == Bitmap.Config.HARDWARE) {
            return base;
        }

        float[] bucketWeight = new float[24];
        float[] bucketSat = new float[24];
        float[] hsl = new float[3];

        int wMax = Math.min(24, sample.getWidth());
        int hMax = Math.min(24, sample.getHeight());
        try {
            for (int y = 0; y < hMax; y++) {
                for (int x = 0; x < wMax; x++) {
                    int c = sample.getPixel(x, y);
                    rgbToHsl(c, hsl);
                    float sat = hsl[1];
                    float light = hsl[2];
                    if (sat > 0.12f && light > 0.08f && light < 0.92f) {
                        float chromaWeight = sat * (1f - Math.abs(light * 2f - 1f) * 0.65f);
                        float w = 0.25f + chromaWeight * 2.4f;
                        int bucket = ((int) (hsl[0] / 15f)) % 24;
                        bucketWeight[bucket] += w;
                        bucketSat[bucket] += sat * w;
                    }
                }
            }
        } catch (Throwable ignored) {
            return base;
        }

        int bestBucket = -1;
        float bestW = 0f;
        for (int i = 0; i < 24; i++) {
            if (bucketWeight[i] > bestW) {
                bestW = bucketWeight[i];
                bestBucket = i;
            }
        }

        if (bestBucket < 0 || bestW <= 1.2f) {
            return base;
        }

        float domHue = bestBucket * 15f + 7.5f;
        float avgSat = bucketSat[bestBucket] / bestW;
        float expressiveSat = Math.max(0.42f, Math.min(0.76f, avgSat));

        if (MaterialYouColorEngine.isLightMode()) {
            base.primaryAccent = hslToRgb(domHue, Math.max(0.45f, Math.min(0.78f, avgSat)), 0.36f);
            base.onPrimary = 0xFFFEFFFE;
            base.shuffleBg = MaterialYouColorEngine.blendRgb(
                    base.surfaceContainerHigh,
                    hslToRgb(domHue, expressiveSat * 0.45f, 0.86f),
                    0.55f
            );
            base.shuffleFg = hslToRgb(domHue, Math.min(0.60f, expressiveSat), 0.16f);
            base.secondaryActiveBg = MaterialYouColorEngine.blendRgb(
                    base.surfaceContainerHigh,
                    hslToRgb(domHue, expressiveSat * 0.50f, 0.84f),
                    0.58f
            );
            base.atmosphericTint = hslToRgb(domHue, Math.min(0.38f, expressiveSat * 0.50f), 0.91f);
            return base;
        }

        base.primaryAccent = hslToRgb(domHue, expressiveSat, 0.78f);
        base.onPrimary = hslToRgb(domHue, Math.min(0.65f, expressiveSat), 0.11f);
        base.shuffleBg = MaterialYouColorEngine.blendRgb(
                base.surfaceContainerHigh,
                hslToRgb(domHue, expressiveSat * 0.55f, 0.24f),
                0.55f
        );
        base.shuffleFg = hslToRgb(domHue, 0.25f, 0.94f);
        base.secondaryActiveBg = MaterialYouColorEngine.blendRgb(
                base.surfaceContainerHigh,
                base.primaryAccent,
                0.24f
        );
        base.atmosphericTint = MaterialYouColorEngine.isEffectiveAmoledBlack()
                ? base.surfaceBase
                : hslToRgb(domHue, expressiveSat * 0.55f, 0.11f);
        return base;
    }

    public static void copyPalette(ExpressivePalette src, ExpressivePalette dst) {
        dst.surfaceBase = src.surfaceBase;
        dst.surfaceContainer = src.surfaceContainer;
        dst.surfaceContainerHigh = src.surfaceContainerHigh;
        dst.primaryAccent = src.primaryAccent;
        dst.onPrimary = src.onPrimary;
        dst.shuffleBg = src.shuffleBg;
        dst.shuffleFg = src.shuffleFg;
        dst.secondaryTileBg = src.secondaryTileBg;
        dst.secondaryActiveBg = src.secondaryActiveBg;
        dst.secondaryOutline = src.secondaryOutline;
        dst.onSurface = src.onSurface;
        dst.onSurfaceVariant = src.onSurfaceVariant;
        dst.outlineVariant = src.outlineVariant;
        dst.atmosphericTint = src.atmosphericTint;
    }

    public static void lerpPalette(ExpressivePalette a, ExpressivePalette b, float t, ExpressivePalette out) {
        out.surfaceBase = MaterialYouColorEngine.blendRgb(a.surfaceBase, b.surfaceBase, t);
        out.surfaceContainer = MaterialYouColorEngine.blendRgb(a.surfaceContainer, b.surfaceContainer, t);
        out.surfaceContainerHigh = MaterialYouColorEngine.blendRgb(a.surfaceContainerHigh, b.surfaceContainerHigh, t);
        out.primaryAccent = MaterialYouColorEngine.blendRgb(a.primaryAccent, b.primaryAccent, t);
        out.onPrimary = MaterialYouColorEngine.blendRgb(a.onPrimary, b.onPrimary, t);
        out.shuffleBg = MaterialYouColorEngine.blendRgb(a.shuffleBg, b.shuffleBg, t);
        out.shuffleFg = MaterialYouColorEngine.blendRgb(a.shuffleFg, b.shuffleFg, t);
        out.secondaryTileBg = MaterialYouColorEngine.blendRgb(a.secondaryTileBg, b.secondaryTileBg, t);
        out.secondaryActiveBg = MaterialYouColorEngine.blendRgb(a.secondaryActiveBg, b.secondaryActiveBg, t);
        out.secondaryOutline = MaterialYouColorEngine.blendRgb(a.secondaryOutline, b.secondaryOutline, t);
        out.onSurface = MaterialYouColorEngine.blendRgb(a.onSurface, b.onSurface, t);
        out.onSurfaceVariant = MaterialYouColorEngine.blendRgb(a.onSurfaceVariant, b.onSurfaceVariant, t);
        out.outlineVariant = MaterialYouColorEngine.blendRgb(a.outlineVariant, b.outlineVariant, t);
        out.atmosphericTint = MaterialYouColorEngine.blendRgb(a.atmosphericTint, b.atmosphericTint, t);
    }

    // ---- Reusable M3 Expressive UI Stylers ----

    public static void stylePrimaryPillButton(
            View button,
            boolean defaultPrimary,
            ExpressivePalette palette,
            float density,
            int idIcon,
            int idText
    ) {
        if (button == null || palette == null) {
            return;
        }
        boolean isPrimary = getIconAndTextUseLightTheme(button, defaultPrimary);
        boolean enabled = button.isEnabled();

        int bgColor = isPrimary ? palette.primaryAccent : palette.shuffleBg;
        int fgColor = isPrimary ? palette.onPrimary : palette.shuffleFg;
        int rippleColor = isPrimary
                ? MaterialYouColorEngine.withAlpha(palette.onPrimary, 0x26)
                : MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x2A);

        GradientDrawable shape = new GradientDrawable();
        shape.setShape(GradientDrawable.RECTANGLE);
        shape.setCornerRadius(dpf(density, 26f));
        shape.setColor(bgColor);
        if (!isPrimary) {
            shape.setStroke(Math.max(1, dp(density, 1f)), palette.secondaryOutline);
        }

        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(dpf(density, 26f));
        mask.setColor(0xFFFFFFFF);

        button.setBackground(new RippleDrawable(ColorStateList.valueOf(rippleColor), shape, mask));
        button.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        button.setPadding(dp(density, 14f), 0, dp(density, 14f), 0);
        button.setAlpha(enabled ? 1f : 0.42f);

        View icon = findView(button, idIcon);
        if (icon instanceof ImageView) {
            ImageView iv = (ImageView) icon;
            iv.setImageTintList(ColorStateList.valueOf(fgColor));
            iv.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
            ViewGroup.LayoutParams ilp = iv.getLayoutParams();
            int iconSize = dp(density, 22f);
            if (ilp != null && (ilp.width != iconSize || ilp.height != iconSize)) {
                ilp.width = iconSize;
                ilp.height = iconSize;
                iv.setLayoutParams(ilp);
            }
        }
        View text = findView(button, idText);
        if (text instanceof TextView) {
            TextView tv = (TextView) text;
            tv.setTextColor(fgColor);
            tv.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            tv.setTypeface(tv.getTypeface(), Typeface.BOLD);
            tv.setSingleLine(true);
            tv.setEllipsize(TextUtils.TruncateAt.END);
        }
    }

    public static void styleConnectedSecondaryBar(
            ViewGroup container,
            View[] candidates,
            View downloadButton,
            ExpressivePalette palette,
            float density,
            int idIcon,
            int idText,
            int idRadialGradient,
            int idDlRadialGradient,
            int idDlIconState,
            int idDlProgressBar,
            int idDlText
    ) {
        if (container == null || candidates == null || palette == null) {
            return;
        }
        List<View> visible = new ArrayList<>(candidates.length);
        for (View v : candidates) {
            if (v != null && v.getVisibility() == View.VISIBLE) {
                visible.add(v);
            }
        }

        if (visible.isEmpty()) {
            container.setVisibility(View.GONE);
            return;
        }
        container.setVisibility(View.VISIBLE);
        container.setClipChildren(false);
        container.setClipToPadding(false);

        boolean lightMode = MaterialYouColorEngine.isLightMode(container.getContext());
        float outerR = dpf(density, 20f);
        float innerR = dpf(density, 8f);
        float activeR = dpf(density, 20f);
        int tileHeightPx = dp(density, 56f);
        int hPad = dp(density, 4f);
        int tPad = dp(density, 9f);
        int bPad = dp(density, 8f);

        int count = visible.size();
        for (int i = 0; i < count; i++) {
            View btn = visible.get(i);
            boolean isFirst = i == 0;
            boolean isLast = i == count - 1;

            attachConnectedExpressivePressEffect(container, btn);
            btn.setMinimumWidth(0);
            btn.setPadding(hPad, tPad, hPad, bPad);
            btn.setElevation(0f);
            btn.setStateListAnimator(null);

            if (btn.getLayoutParams() instanceof LinearLayout.LayoutParams) {
                LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) btn.getLayoutParams();
                int marginStart = isFirst ? 0 : dp(density, 5f);
                boolean lpChanged = false;
                if (lp.getMarginStart() != marginStart) {
                    lp.setMarginStart(marginStart);
                    lpChanged = true;
                }
                if (lp.height != tileHeightPx) {
                    lp.height = tileHeightPx;
                    lpChanged = true;
                }
                if (lpChanged) {
                    btn.setLayoutParams(lp);
                }
            }

            boolean isDownload = downloadButton != null && btn == downloadButton;
            Integer dlPercent = isDownload ? getDownloadVisiblePercentage(btn) : null;
            boolean isActive = isDownload
                    ? (dlPercent != null && dlPercent == 100)
                    : btn.isSelected();
            boolean enabled = btn.isEnabled();

            float[] radii;
            if (isActive) {
                radii = new float[]{activeR, activeR, activeR, activeR, activeR, activeR, activeR, activeR};
            } else {
                float tl = isFirst ? outerR : innerR;
                float bl = isFirst ? outerR : innerR;
                float tr = isLast ? outerR : innerR;
                float br = isLast ? outerR : innerR;
                radii = new float[]{tl, tl, tr, tr, br, br, bl, bl};
            }

            int tileBg = isActive
                    ? MaterialYouColorEngine.blendRgb(palette.surfaceContainerHigh, palette.primaryAccent, lightMode ? 0.20f : 0.28f)
                    : palette.surfaceContainer;
            int strokeColor = isActive
                    ? MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x99)
                    : MaterialYouColorEngine.withAlpha(palette.outlineVariant, lightMode ? 0x4E : 0x42);
            int strokeWidthPx = Math.max(1, dp(density, 1f));

            GradientDrawable shape = new GradientDrawable();
            shape.setShape(GradientDrawable.RECTANGLE);
            shape.setCornerRadii(radii);
            shape.setColor(tileBg);
            shape.setStroke(strokeWidthPx, strokeColor);

            GradientDrawable mask = new GradientDrawable();
            mask.setShape(GradientDrawable.RECTANGLE);
            mask.setCornerRadii(radii);
            mask.setColor(0xFFFFFFFF);

            int rippleColor = MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x34);
            btn.setBackground(new RippleDrawable(ColorStateList.valueOf(rippleColor), shape, mask));
            btn.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
            btn.setAlpha(enabled ? 1f : 0.42f);

            if (isDownload) {
                styleDownloadActionButton(btn, dlPercent, palette,
                        idDlRadialGradient, idDlIconState, idDlProgressBar, idDlText);
            } else {
                styleStandardSecondaryButton(btn, isActive, enabled, palette,
                        idIcon, idText, idRadialGradient);
            }
        }
    }

    public static void styleStandardSecondaryButton(
            View btn,
            boolean isActive,
            boolean enabled,
            ExpressivePalette palette,
            int idIcon,
            int idText,
            int idRadialGradient
    ) {
        View radial = findView(btn, idRadialGradient);
        if (radial != null) {
            radial.setVisibility(View.GONE);
            radial.setAlpha(0f);
        }

        boolean lightMode = btn != null && MaterialYouColorEngine.isLightMode(btn.getContext());
        float btnDensity = btn != null ? btn.getResources().getDisplayMetrics().density : 3f;

        int activeTileBg = MaterialYouColorEngine.blendRgb(
                palette.surfaceContainerHigh, palette.primaryAccent, lightMode ? 0.20f : 0.28f);

        int iconColor;
        if (!enabled) {
            iconColor = MaterialYouColorEngine.withAlpha(palette.onSurfaceVariant, 0x66);
        } else if (isActive) {
            iconColor = ensureTextContrast(palette.primaryAccent, activeTileBg);
        } else {
            iconColor = palette.onSurface;
        }

        View icon = findView(btn, idIcon);
        if (icon instanceof ImageView) {
            ImageView iv = (ImageView) icon;
            iv.setBackground(null);
            if (iv.getPaddingLeft() != 0 || iv.getPaddingTop() != 0
                    || iv.getPaddingRight() != 0 || iv.getPaddingBottom() != 0) {
                iv.setPadding(0, 0, 0, 0);
            }
            iv.clearColorFilter();
            iv.setImageTintList(ColorStateList.valueOf(iconColor));
            iv.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
            iv.setScaleType(ImageView.ScaleType.FIT_CENTER);
            int iconSize = dp(btnDensity, 20f);
            ViewGroup.LayoutParams ilp = iv.getLayoutParams();
            if (ilp != null) {
                boolean changed = ilp.width != iconSize || ilp.height != iconSize;
                ilp.width = iconSize;
                ilp.height = iconSize;
                if (ilp instanceof ViewGroup.MarginLayoutParams) {
                    ViewGroup.MarginLayoutParams imlp = (ViewGroup.MarginLayoutParams) ilp;
                    if (imlp.topMargin != 0 || imlp.bottomMargin != 0) {
                        imlp.topMargin = 0;
                        imlp.bottomMargin = 0;
                        changed = true;
                    }
                }
                if (changed) {
                    iv.setLayoutParams(ilp);
                }
            }
        }

        View text = findView(btn, idText);
        if (text instanceof TextView) {
            int activeText = ensureTextContrast(palette.primaryAccent, activeTileBg);
            int textColor = isActive
                    ? activeText
                    : (enabled ? palette.onSurface : MaterialYouColorEngine.withAlpha(palette.onSurfaceVariant, 0x70));
            styleSecondaryTileLabel((TextView) text, textColor, isActive, btnDensity);
        }
    }

    public static void styleDownloadActionButton(
            View btn,
            Integer dlPercent,
            ExpressivePalette palette,
            int idDlRadialGradient,
            int idDlIconState,
            int idDlProgressBar,
            int idDlText
    ) {
        View radial = findView(btn, idDlRadialGradient);
        if (radial != null) {
            radial.setVisibility(View.GONE);
            radial.setAlpha(0f);
        }

        if (btn != null) {
            int spaceId = getDownloadSpaceId(btn.getContext());
            View topSpace = findView(btn, spaceId);
            if (topSpace != null) {
                topSpace.setVisibility(View.GONE);
                if (topSpace.getLayoutParams() != null && topSpace.getLayoutParams().height != 0) {
                    ViewGroup.LayoutParams slp = topSpace.getLayoutParams();
                    slp.height = 0;
                    topSpace.setLayoutParams(slp);
                }
            }
        }

        boolean lightMode = btn != null && MaterialYouColorEngine.isLightMode(btn.getContext());
        float btnDensity = btn != null ? btn.getResources().getDisplayMetrics().density : 3f;
        boolean enabled = btn == null || btn.isEnabled();
        boolean isCompleted = dlPercent != null && dlPercent == 100;
        boolean isDownloading = dlPercent != null && dlPercent > 0 && dlPercent < 100;
        boolean activeOrDownloading = isCompleted || isDownloading;

        int activeTileBg = MaterialYouColorEngine.blendRgb(
                palette.surfaceContainerHigh, palette.primaryAccent, lightMode ? 0.20f : 0.28f);

        View pb = findView(btn, idDlProgressBar);
        if (pb != null) {
            int iconSize = dp(btnDensity, 20f);
            configureCircularProgressBadgeGeometry(pb, iconSize, 0, dp(btnDensity, 2f));
            pb.setBackground(null);
            if (pb.getPaddingLeft() != 0 || pb.getPaddingTop() != 0
                    || pb.getPaddingRight() != 0 || pb.getPaddingBottom() != 0) {
                pb.setPadding(0, 0, 0, 0);
            }
            ViewGroup.LayoutParams plpRaw = pb.getLayoutParams();
            if (plpRaw != null) {
                boolean changed = plpRaw.width != iconSize || plpRaw.height != iconSize;
                plpRaw.width = iconSize;
                plpRaw.height = iconSize;
                if (plpRaw instanceof ViewGroup.MarginLayoutParams) {
                    ViewGroup.MarginLayoutParams plp = (ViewGroup.MarginLayoutParams) plpRaw;
                    if (plp.topMargin != 0 || plp.bottomMargin != 0) {
                        plp.topMargin = 0;
                        plp.bottomMargin = 0;
                        changed = true;
                    }
                }
                if (changed) {
                    pb.setLayoutParams(plpRaw);
                }
            }
            int indColor = isCompleted ? Color.TRANSPARENT : palette.primaryAccent;
            int trkColor = isCompleted
                    ? Color.TRANSPARENT
                    : (isDownloading
                    ? MaterialYouColorEngine.withAlpha(palette.onSurfaceVariant, 0x3A)
                    : MaterialYouColorEngine.withAlpha(palette.onSurface, 0x68));
            tintCircularProgressIndicator(pb, indColor, trkColor);
            pb.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        }

        View dlIcon = findView(btn, idDlIconState);
        if (dlIcon instanceof ImageView) {
            ImageView div = (ImageView) dlIcon;
            int iconColor;
            if (!enabled) {
                iconColor = MaterialYouColorEngine.withAlpha(palette.onSurfaceVariant, 0x66);
            } else if (isCompleted) {
                iconColor = pickHighContrastForeground(palette.primaryAccent, 0xFF0E1412, 0xFFFEFFFE);
            } else if (isDownloading) {
                iconColor = palette.primaryAccent;
            } else {
                iconColor = palette.onSurface;
            }
            // Must clear TIDAL's PorterDuffColorFilter and raise Z-order above ProgressBar ring/dot.
            div.clearColorFilter();
            div.setBackground(null);
            div.setImageTintList(ColorStateList.valueOf(iconColor));
            div.setScaleType(ImageView.ScaleType.FIT_CENTER);
            div.setElevation(dpf(btnDensity, 1f));
            div.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
            ViewGroup.LayoutParams ilp = div.getLayoutParams();
            int innerIconSize = dp(btnDensity, 11f);
            if (ilp != null && (ilp.width != innerIconSize || ilp.height != innerIconSize)) {
                ilp.width = innerIconSize;
                ilp.height = innerIconSize;
                div.setLayoutParams(ilp);
            }
            if (btn instanceof ViewGroup && pb != null) {
                ViewGroup vg = (ViewGroup) btn;
                if (vg.indexOfChild(div) < vg.indexOfChild(pb)) {
                    div.bringToFront();
                }
            } else {
                div.bringToFront();
            }
        }

        View text = findView(btn, idDlText);
        if (text instanceof TextView) {
            int activeText = ensureTextContrast(palette.primaryAccent, isCompleted ? activeTileBg : palette.surfaceContainer);
            int textColor = activeOrDownloading
                    ? activeText
                    : (enabled ? palette.onSurface : MaterialYouColorEngine.withAlpha(palette.onSurfaceVariant, 0x70));
            styleSecondaryTileLabel((TextView) text, textColor, activeOrDownloading, btnDensity);
        }
    }

    private static void styleSecondaryTileLabel(TextView tv, int textColor, boolean bold, float density) {
        tv.setTextColor(textColor);
        tv.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        tv.setGravity(Gravity.CENTER);
        tv.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
        tv.setIncludeFontPadding(false);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        tv.setLetterSpacing(0.01f);
        tv.setTypeface(bold ? Typeface.DEFAULT_BOLD : Typeface.create("sans-serif-medium", Typeface.NORMAL));
        tv.setMaxLines(1);
        tv.setEllipsize(TextUtils.TruncateAt.END);
        if (tv.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) tv.getLayoutParams();
            int topGap = dp(density, 4f);
            if (mlp.width != 0 || mlp.topMargin != topGap || mlp.bottomMargin != 0) {
                mlp.width = 0;
                mlp.topMargin = topGap;
                mlp.bottomMargin = 0;
                tv.setLayoutParams(mlp);
            }
        }
    }

    private static int pickHighContrastForeground(int bgArgb, int darkOption, int lightOption) {
        return relativeLuminance(bgArgb) > 0.36 ? darkOption : lightOption;
    }

    private static int ensureTextContrast(int fgArgb, int bgArgb) {
        double fgLum = relativeLuminance(fgArgb);
        double bgLum = relativeLuminance(bgArgb);
        double contrast = (Math.max(fgLum, bgLum) + 0.05) / (Math.min(fgLum, bgLum) + 0.05);
        if (contrast >= 4.2) {
            return fgArgb;
        }
        int target = bgLum > 0.36 ? 0xFF0E1412 : 0xFFFEFFFE;
        return MaterialYouColorEngine.blendRgb(fgArgb, target, 0.50f);
    }

    private static double relativeLuminance(int argb) {
        double r = linearizeChannel(Color.red(argb) / 255.0);
        double g = linearizeChannel(Color.green(argb) / 255.0);
        double b = linearizeChannel(Color.blue(argb) / 255.0);
        return 0.2126 * r + 0.7152 * g + 0.0722 * b;
    }

    private static double linearizeChannel(double c) {
        return c <= 0.04045 ? (c / 12.92) : Math.pow((c + 0.055) / 1.055, 2.4);
    }

    public static void styleToolbarChrome(
            ViewGroup toolbar,
            List<ToolbarScrimDrawable> scrimsOut,
            float collapseFraction,
            ExpressivePalette palette,
            float density
    ) {
        if (toolbar == null || palette == null) {
            return;
        }
        if (scrimsOut != null) {
            scrimsOut.clear();
        }
        float bgFrac = smoothstep(0.52f, 0.94f, collapseFraction);
        int scrimAlpha = Math.round((1f - bgFrac) * 0x74);
        int iconColor = palette.onSurface;

        tintToolbarMenuAndNav(toolbar, iconColor);
        toolbar.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);

        for (int i = 0; i < toolbar.getChildCount(); i++) {
            View child = toolbar.getChildAt(i);
            if (child instanceof ImageButton) {
                child.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
                if (scrimsOut != null) {
                    child.setBackground(createToolbarScrimRipple(scrimsOut, scrimAlpha, iconColor, density));
                }
            } else if (child instanceof ViewGroup) {
                ViewGroup menuGroup = (ViewGroup) child;
                for (int j = 0; j < menuGroup.getChildCount(); j++) {
                    View itemView = menuGroup.getChildAt(j);
                    itemView.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
                    if (itemView instanceof ImageView) {
                        ((ImageView) itemView).setImageTintList(ColorStateList.valueOf(iconColor));
                    }
                    if (scrimsOut != null) {
                        itemView.setBackground(createToolbarScrimRipple(scrimsOut, scrimAlpha, iconColor, density));
                    }
                }
            }
        }
    }

    /**
     * Watches a toolbar's layout changes and triggers {@code refreshAction} whenever asynchronously
     * inflated menu or overflow action buttons change count.
     */
    public static void attachToolbarChromeAutoRefresh(final ViewGroup toolbar, final Runnable refreshAction) {
        if (toolbar == null || refreshAction == null) {
            return;
        }
        final int[] lastCount = new int[]{-1};
        toolbar.addOnLayoutChangeListener((v, left, top, right, bottom, ol, ot, or, ob) -> {
            int count = countToolbarActionChildren(toolbar);
            if (count != lastCount[0]) {
                lastCount[0] = count;
                toolbar.post(refreshAction);
            }
        });
    }

    private static int countToolbarActionChildren(ViewGroup toolbar) {
        int count = 0;
        for (int i = 0; i < toolbar.getChildCount(); i++) {
            View child = toolbar.getChildAt(i);
            if (child instanceof ImageButton) {
                count++;
            } else if (child instanceof ViewGroup) {
                count += ((ViewGroup) child).getChildCount();
            }
        }
        return count;
    }

    public static void tintToolbarMenuAndNav(ViewGroup toolbar, int iconColor) {
        if (toolbar == null) {
            return;
        }
        try {
            Method getNav = toolbar.getClass().getMethod("getNavigationIcon");
            Drawable nav = (Drawable) getNav.invoke(toolbar);
            if (nav != null) {
                nav.mutate().setTint(iconColor);
            }
        } catch (Throwable ignored) {
        }

        try {
            Method getOverflow = toolbar.getClass().getMethod("getOverflowIcon");
            Drawable overflow = (Drawable) getOverflow.invoke(toolbar);
            if (overflow != null) {
                overflow.mutate().setTint(iconColor);
            }
        } catch (Throwable ignored) {
        }

        try {
            Method getMenu = toolbar.getClass().getMethod("getMenu");
            Menu menu = (Menu) getMenu.invoke(toolbar);
            if (menu != null) {
                for (int i = 0; i < menu.size(); i++) {
                    MenuItem item = menu.getItem(i);
                    Drawable icon = item.getIcon();
                    if (icon != null) {
                        icon.mutate().setTint(iconColor);
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }

    public static void updateToolbarScrims(List<ToolbarScrimDrawable> scrims, float collapseFraction) {
        if (scrims == null || scrims.isEmpty()) {
            return;
        }
        float bgFrac = smoothstep(0.52f, 0.94f, collapseFraction);
        int scrimAlpha = Math.round((1f - bgFrac) * 0x74);
        for (ToolbarScrimDrawable scrim : scrims) {
            scrim.setScrimAlpha(scrimAlpha);
        }
    }

    private static Drawable createToolbarScrimRipple(
            List<ToolbarScrimDrawable> scrimsOut,
            int scrimAlpha,
            int iconColor,
            float density
    ) {
        ToolbarScrimDrawable scrim = new ToolbarScrimDrawable(dpf(density, 19f));
        scrim.setScrimAlpha(scrimAlpha);
        scrimsOut.add(scrim);
        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.OVAL);
        mask.setColor(0xFFFFFFFF);
        return new RippleDrawable(
                ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(iconColor, 0x33)),
                scrim,
                mask
        );
    }

    /**
     * Styles a media track row with M3 Expressive spacing, rounded artwork, and rounded ripple,
     * deliberately leaving {@code title} text color and typeface untouched so TIDAL's default
     * active-track highlight ({@code PlaybackTitleTextView}) remains native.
     */
    public static void styleCleanTrackRow(
            View itemView,
            ExpressivePalette palette,
            float density,
            int idArtwork,
            int idArtistName,
            int idOptions
    ) {
        if (itemView == null || palette == null) {
            return;
        }

        if (!Boolean.TRUE.equals(ROUNDED_ROW_ARTWORK.get(itemView))) {
            View rowArt = findView(itemView, idArtwork);
            if (rowArt != null) {
                setShapeableImageCornerRadiusIfSquare(rowArt, dpf(density, 12f), density);
                ROUNDED_ROW_ARTWORK.put(itemView, Boolean.TRUE);
            }
        }

        ViewGroup.LayoutParams lp = itemView.getLayoutParams();
        int targetH = dp(density, 68f);
        if (lp != null && lp.height > 0 && lp.height < targetH) {
            lp.height = targetH;
            itemView.setLayoutParams(lp);
        }

        int accent = palette.primaryAccent;
        Integer prevAccent = STYLED_CLEAN_ROW_ACCENT.get(itemView);
        if (prevAccent == null || prevAccent != accent) {
            STYLED_CLEAN_ROW_ACCENT.put(itemView, accent);
            // Clear any legacy/tonal box background so default clean surface + active title stands out
            if (itemView.getBackground() != null) {
                itemView.setBackground(null);
            }
            GradientDrawable rippleMask = new GradientDrawable();
            rippleMask.setShape(GradientDrawable.RECTANGLE);
            rippleMask.setCornerRadius(dpf(density, 16f));
            rippleMask.setColor(0xFFFFFFFF);
            RippleDrawable ripple = new RippleDrawable(
                    ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(accent, 0x33)),
                    null,
                    rippleMask
            );
            itemView.setForeground(new InsetDrawable(ripple, dp(density, 8f), dp(density, 2f), dp(density, 8f), dp(density, 2f)));
        }

        View rowArtist = findView(itemView, idArtistName);
        if (rowArtist instanceof TextView) {
            TextView tv = (TextView) rowArtist;
            boolean enabled = tv.isEnabled();
            tv.setTextColor(enabled
                    ? palette.onSurfaceVariant
                    : MaterialYouColorEngine.withAlpha(palette.onSurfaceVariant, 0x5E));
        }

        View rowOpts = findView(itemView, idOptions);
        if (rowOpts instanceof ImageView) {
            ((ImageView) rowOpts).setImageTintList(
                    ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(palette.onSurfaceVariant, 0xCC))
            );
        }
    }

    /** Styles a list/grid collection view (My Albums / My Artists) with Monet surfaces & rounded square cards. */
    public static void styleCollectionListPage(
            View rootView,
            ViewGroup toolbar,
            View recyclerView,
            ProgressBar horizontalProgressBar,
            ProgressBar contentLoadingProgressBar
    ) {
        if (rootView == null) {
            return;
        }
        Context ctx = rootView.getContext();
        float density = ctx.getResources().getDisplayMetrics().density;
        ExpressivePalette palette = buildMonetPalette();

        rootView.setBackgroundColor(palette.surfaceBase);
        if (recyclerView != null) {
            recyclerView.setBackgroundColor(palette.surfaceBase);
        }
        if (toolbar != null) {
            toolbar.setBackgroundColor(palette.surfaceBase);
            tintToolbarMenuAndNav(toolbar, palette.onSurface);
            for (int i = 0; i < toolbar.getChildCount(); i++) {
                View child = toolbar.getChildAt(i);
                if (child instanceof TextView) {
                    TextView tv = (TextView) child;
                    tv.setTextColor(palette.onSurface);
                    tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22f);
                    tv.setTypeface(tv.getTypeface(), Typeface.BOLD);
                }
            }
        }
        if (horizontalProgressBar != null) {
            tintHorizontalProgressBar(
                    horizontalProgressBar,
                    palette.primaryAccent,
                    MaterialYouColorEngine.withAlpha(palette.outlineVariant, 0x44)
            );
        }
        if (contentLoadingProgressBar != null) {
            contentLoadingProgressBar.setIndeterminateTintList(ColorStateList.valueOf(palette.primaryAccent));
        }

        if (recyclerView instanceof ViewGroup) {
            final int idArtwork = getId(ctx, "artwork");
            final int idAlbumArtwork = getId(ctx, "albumArtwork");
            final int idCover = getId(ctx, "cover");
            final ViewGroup vg = (ViewGroup) recyclerView;
            vg.setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() {
                @Override
                public void onChildViewAdded(View parent, View child) {
                    if (child == null) {
                        return;
                    }
                    // Safely rounds square album artwork while leaving circular artist avatars intact
                    roundChildArtworkSafe(child, idArtwork, dpf(density, 14f), density);
                    roundChildArtworkSafe(child, idAlbumArtwork, dpf(density, 14f), density);
                    roundChildArtworkSafe(child, idCover, dpf(density, 14f), density);
                }

                @Override
                public void onChildViewRemoved(View parent, View child) {
                }
            });
        }
    }

    private static void roundChildArtworkSafe(View itemRoot, int id, float radiusPx, float density) {
        View art = findView(itemRoot, id);
        if (art != null) {
            setShapeableImageCornerRadiusIfSquare(art, radiusPx, density);
        }
    }

    // ---- Interaction & Reflection Helpers ----

    public static void attachSpringPressEffect(View view) {
        if (view == null) {
            return;
        }
        view.setOnTouchListener((v, event) -> {
            if (!v.isEnabled()) {
                return false;
            }
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                v.animate().cancel();
                v.animate()
                        .scaleX(0.955f)
                        .scaleY(0.955f)
                        .setDuration(90L)
                        .setInterpolator(new DecelerateInterpolator())
                        .start();
            } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                v.animate().cancel();
                v.animate()
                        .scaleX(1.0f)
                        .scaleY(1.0f)
                        .setDuration(220L)
                        .setInterpolator(new OvershootInterpolator(1.6f))
                        .start();
            }
            return false;
        });
    }

    /**
     * Attaches an expressive horizontal-expand press micro-pop tailored for connected
     * secondary action tiles, keeping vertical footprint compact while springing smoothly back.
     */
    public static void attachExpressiveTilePressEffect(View view) {
        if (view == null) {
            return;
        }
        ViewGroup parentRow = view.getParent() instanceof ViewGroup ? (ViewGroup) view.getParent() : null;
        attachConnectedExpressivePressEffect(parentRow, view);
    }

    /**
     * Attaches Material 3 Expressive connected button-group press physics: the pressed tile
     * expands slightly while immediate visible siblings gently yield aside, then all tiles
     * spring back with overshoot on release.
     */
    public static void attachConnectedExpressivePressEffect(ViewGroup row, View btn) {
        if (btn == null) {
            return;
        }
        ViewGroup existingRow = CONNECTED_PRESS_ROWS.get(btn);
        if (CONNECTED_PRESS_ROWS.containsKey(btn) && existingRow == row) {
            return;
        }
        CONNECTED_PRESS_ROWS.put(btn, row);
        btn.setOnTouchListener((v, event) -> {
            if (!v.isEnabled()) {
                return false;
            }
            int action = event.getActionMasked();
            ViewGroup parentRow = row != null ? row
                    : (v.getParent() instanceof ViewGroup ? (ViewGroup) v.getParent() : null);
            float density = v.getResources().getDisplayMetrics().density;
            if (action == MotionEvent.ACTION_DOWN) {
                v.animate().cancel();
                v.animate()
                        .scaleX(1.03f)
                        .scaleY(0.965f)
                        .setDuration(90L)
                        .setInterpolator(new DecelerateInterpolator(1.5f))
                        .start();
                animateTileInnerBadge(v, 1.08f, 90L);
                if (parentRow != null) {
                    animateConnectedSiblingsOnPress(parentRow, v, dpf(density, 2.0f));
                }
            } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                v.animate().cancel();
                v.animate()
                        .scaleX(1.0f)
                        .scaleY(1.0f)
                        .translationX(0f)
                        .setDuration(210L)
                        .setInterpolator(new OvershootInterpolator(1.25f))
                        .start();
                animateTileInnerBadge(v, 1.0f, 200L);
                if (parentRow != null) {
                    resetConnectedSiblings(parentRow, v);
                }
            }
            return false;
        });
    }

    private static void animateTileInnerBadge(View tile, float scale, long durationMs) {
        if (!(tile instanceof ViewGroup)) {
            return;
        }
        ViewGroup vg = (ViewGroup) tile;
        for (int i = 0; i < vg.getChildCount(); i++) {
            View c = vg.getChildAt(i);
            if (c instanceof ImageView || c instanceof ProgressBar) {
                c.animate().cancel();
                c.animate()
                        .scaleX(scale)
                        .scaleY(scale)
                        .setDuration(durationMs)
                        .setInterpolator(scale > 1f
                                ? new DecelerateInterpolator(1.5f)
                                : new OvershootInterpolator(1.3f))
                        .start();
            }
        }
    }

    private static void animateConnectedSiblingsOnPress(ViewGroup row, View pressed, float pushPx) {
        List<View> visible = new ArrayList<>(row.getChildCount());
        int pressedIdx = -1;
        for (int i = 0; i < row.getChildCount(); i++) {
            View c = row.getChildAt(i);
            if (c != null && c.getVisibility() == View.VISIBLE) {
                if (c == pressed) {
                    pressedIdx = visible.size();
                }
                visible.add(c);
            }
        }
        if (pressedIdx < 0) {
            return;
        }
        if (pressedIdx - 1 >= 0) {
            View left = visible.get(pressedIdx - 1);
            left.animate().cancel();
            left.animate()
                    .translationX(-pushPx)
                    .scaleX(0.98f)
                    .setDuration(90L)
                    .setInterpolator(new DecelerateInterpolator(1.5f))
                    .start();
        }
        if (pressedIdx + 1 < visible.size()) {
            View right = visible.get(pressedIdx + 1);
            right.animate().cancel();
            right.animate()
                    .translationX(pushPx)
                    .scaleX(0.98f)
                    .setDuration(90L)
                    .setInterpolator(new DecelerateInterpolator(1.5f))
                    .start();
        }
    }

    private static void resetConnectedSiblings(ViewGroup row, View pressed) {
        for (int i = 0; i < row.getChildCount(); i++) {
            View c = row.getChildAt(i);
            if (c != null && c != pressed && c.getVisibility() == View.VISIBLE) {
                c.animate().cancel();
                c.animate()
                        .scaleX(1.0f)
                        .scaleY(1.0f)
                        .translationX(0f)
                        .setDuration(190L)
                        .setInterpolator(new DecelerateInterpolator(2.0f))
                        .start();
            }
        }
    }

    public static void disableSlidingTextMarquee(TextView tv) {
        if (tv == null) {
            return;
        }
        tv.setSingleLine(false);
        tv.setMaxLines(2);
        tv.setHorizontallyScrolling(false);
        tv.setHorizontalFadingEdgeEnabled(false);
        tv.setEllipsize(TextUtils.TruncateAt.END);
        try {
            for (Field f : tv.getClass().getDeclaredFields()) {
                if (Runnable.class.isAssignableFrom(f.getType())) {
                    f.setAccessible(true);
                    Object r = f.get(tv);
                    if (r instanceof Runnable) {
                        tv.removeCallbacks((Runnable) r);
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }

    public static void setShapeableImageCornerRadius(View imageView, float radiusPx) {
        if (imageView == null) {
            return;
        }
        try {
            ensureShapeReflection(imageView.getClass());
            if (getShapeAppearanceMethod != null && withCornerSizeFloatMethod != null && setShapeAppearanceMethod != null) {
                Object model = getShapeAppearanceMethod.invoke(imageView);
                if (model != null) {
                    Object updated = withCornerSizeFloatMethod.invoke(model, radiusPx);
                    setShapeAppearanceMethod.invoke(imageView, updated);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * Rounds {@code ShapeableImageView} corners only if its current shape is NOT circular
     * (i.e. skips 50% {@code RelativeCornerSize} / circular artist avatars).
     */
    public static void setShapeableImageCornerRadiusIfSquare(View imageView, float radiusPx, float density) {
        if (imageView == null) {
            return;
        }
        try {
            ensureShapeReflection(imageView.getClass());
            if (getShapeAppearanceMethod == null || withCornerSizeFloatMethod == null || setShapeAppearanceMethod == null) {
                return;
            }
            Object model = getShapeAppearanceMethod.invoke(imageView);
            if (model == null) {
                return;
            }
            if (getTopLeftCornerSizeMethod != null) {
                Object cornerSize = getTopLeftCornerSizeMethod.invoke(model);
                if (cornerSize != null) {
                    if (cornerSize.getClass().getName().contains("RelativeCornerSize")) {
                        return;
                    }
                    if (getCornerSizeRectFMethod != null) {
                        float w = imageView.getWidth() > 0 ? imageView.getWidth() : dpf(density, 56f);
                        float h = imageView.getHeight() > 0 ? imageView.getHeight() : dpf(density, 56f);
                        Object szObj = getCornerSizeRectFMethod.invoke(cornerSize, new RectF(0f, 0f, w, h));
                        if (szObj instanceof Float) {
                            float existingR = (Float) szObj;
                            if (existingR >= Math.min(w, h) * 0.40f) {
                                return;
                            }
                        }
                    }
                }
            }
            Object updated = withCornerSizeFloatMethod.invoke(model, radiusPx);
            setShapeAppearanceMethod.invoke(imageView, updated);
        } catch (Throwable ignored) {
        }
    }

    private static void ensureShapeReflection(Class<?> sivCls) {
        if (shapeReflectionResolved) {
            return;
        }
        try {
            Method getM = sivCls.getMethod("getShapeAppearanceModel");
            Class<?> samCls = getM.getReturnType();
            Method setM = sivCls.getMethod("setShapeAppearanceModel", samCls);
            Method withM = samCls.getMethod("withCornerSize", float.class);
            Method topLeftM = samCls.getMethod("getTopLeftCornerSize");
            Class<?> cornerSizeCls = topLeftM.getReturnType();
            Method cornerRectM = cornerSizeCls.getMethod("getCornerSize", RectF.class);

            getShapeAppearanceMethod = getM;
            setShapeAppearanceMethod = setM;
            withCornerSizeFloatMethod = withM;
            getTopLeftCornerSizeMethod = topLeftM;
            getCornerSizeRectFMethod = cornerRectM;
            shapeReflectionResolved = true;
        } catch (Throwable ignored) {
        }
    }

    public static void setCardViewRadius(View cardView, float radiusPx) {
        if (cardView == null) {
            return;
        }
        try {
            if (!cardReflectionResolved) {
                cardSetRadiusMethod = cardView.getClass().getMethod("setRadius", float.class);
                cardReflectionResolved = true;
            }
            if (cardSetRadiusMethod != null) {
                cardSetRadiusMethod.invoke(cardView, radiusPx);
            }
        } catch (Throwable ignored) {
        }
    }

    public static boolean getIconAndTextUseLightTheme(View button, boolean fallback) {
        if (button == null) {
            return fallback;
        }
        try {
            if (!iconBtnReflectionResolved) {
                getUseLightThemeMethod = button.getClass().getMethod("getUseLightTheme");
                iconBtnReflectionResolved = true;
            }
            if (getUseLightThemeMethod != null) {
                Object res = getUseLightThemeMethod.invoke(button);
                if (res instanceof Boolean) {
                    return (Boolean) res;
                }
            }
        } catch (Throwable ignored) {
        }
        return fallback;
    }

    public static Integer getDownloadVisiblePercentage(View downloadButton) {
        if (downloadButton == null) {
            return null;
        }
        try {
            if (!downloadBtnReflectionResolved) {
                getDownloadedPercentageMethod = downloadButton.getClass().getMethod("getDownloadedPercentage");
                downloadBtnReflectionResolved = true;
            }
            if (getDownloadedPercentageMethod != null) {
                Object res = getDownloadedPercentageMethod.invoke(downloadButton);
                if (res instanceof Integer) {
                    return (Integer) res;
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static int getDownloadSpaceId(Context ctx) {
        if (ctx == null) {
            return 0;
        }
        String pkg = ctx.getPackageName();
        if (pkg != null && pkg.equals(cachedDlSpacePkg)) {
            return cachedIdDlSpace;
        }
        try {
            cachedIdDlSpace = ctx.getResources().getIdentifier("downloadSecondaryActionButton_space", "id", pkg);
            cachedDlSpacePkg = pkg;
        } catch (Throwable ignored) {
        }
        return cachedIdDlSpace;
    }

    private static void ensureProgressReflection(Class<?> cls) {
        if (progressReflectionResolved || cls == null) {
            return;
        }
        try {
            try {
                setIndicatorColorMethod = cls.getMethod("setIndicatorColor", int[].class);
            } catch (Throwable ignored) {
            }
            try {
                setTrackColorMethod = cls.getMethod("setTrackColor", int.class);
            } catch (Throwable ignored) {
            }
            try {
                setIndicatorSizeMethod = cls.getMethod("setIndicatorSize", int.class);
            } catch (Throwable ignored) {
            }
            try {
                setIndicatorInsetMethod = cls.getMethod("setIndicatorInset", int.class);
            } catch (Throwable ignored) {
            }
            try {
                setTrackThicknessMethod = cls.getMethod("setTrackThickness", int.class);
            } catch (Throwable ignored) {
            }
            progressReflectionResolved = true;
        } catch (Throwable ignored) {
        }
    }

    public static void configureCircularProgressBadgeGeometry(
            View progressBar,
            int indicatorSizePx,
            int indicatorInsetPx,
            int trackThicknessPx
    ) {
        if (progressBar == null) {
            return;
        }
        try {
            ensureProgressReflection(progressBar.getClass());
            if (setIndicatorSizeMethod != null) {
                setIndicatorSizeMethod.invoke(progressBar, indicatorSizePx);
            }
            if (setIndicatorInsetMethod != null) {
                setIndicatorInsetMethod.invoke(progressBar, indicatorInsetPx);
            }
            if (setTrackThicknessMethod != null) {
                setTrackThicknessMethod.invoke(progressBar, trackThicknessPx);
            }
        } catch (Throwable ignored) {
        }
    }

    public static void tintCircularProgressIndicator(View progressBar, int indicatorColor, int trackColor) {
        if (progressBar == null) {
            return;
        }
        try {
            ensureProgressReflection(progressBar.getClass());
            if (setIndicatorColorMethod != null) {
                setIndicatorColorMethod.invoke(progressBar, (Object) new int[]{indicatorColor});
            }
            if (setTrackColorMethod != null) {
                setTrackColorMethod.invoke(progressBar, trackColor);
            }
        } catch (Throwable ignored) {
        }
    }

    public static void tintHorizontalProgressBar(ProgressBar pb, int accent, int trackColor) {
        if (pb == null) {
            return;
        }
        pb.setProgressTintList(ColorStateList.valueOf(accent));
        pb.setIndeterminateTintList(ColorStateList.valueOf(accent));
        pb.setProgressBackgroundTintList(ColorStateList.valueOf(trackColor));
    }

    public static void tintSwitchCompat(
            View switchView,
            int primaryAccent,
            int onPrimary,
            int surfaceContainerHigh,
            int onSurfaceVariant
    ) {
        if (switchView == null) {
            return;
        }
        int[][] states = new int[][]{
                new int[]{android.R.attr.state_checked},
                new int[]{}
        };
        ColorStateList thumbTint = new ColorStateList(states, new int[]{onPrimary, onSurfaceVariant});
        ColorStateList trackTint = new ColorStateList(states, new int[]{
                primaryAccent,
                MaterialYouColorEngine.blendRgb(surfaceContainerHigh, onSurfaceVariant, 0.25f)
        });
        try {
            if (!switchReflectionResolved) {
                Class<?> cls = switchView.getClass();
                Method thumbM = cls.getMethod("setThumbTintList", ColorStateList.class);
                Method trackM = cls.getMethod("setTrackTintList", ColorStateList.class);
                switchSetThumbTintMethod = thumbM;
                switchSetTrackTintMethod = trackM;
                switchReflectionResolved = true;
            }
            if (switchSetThumbTintMethod != null) {
                switchSetThumbTintMethod.invoke(switchView, thumbTint);
            }
            if (switchSetTrackTintMethod != null) {
                switchSetTrackTintMethod.invoke(switchView, trackTint);
            }
        } catch (Throwable ignored) {
        }
    }

    // ---- Color Math Utilities ----

    public static float clamp01(float v) {
        return v < 0f ? 0f : (v > 1f ? 1f : v);
    }

    public static float smoothstep(float edge0, float edge1, float x) {
        float t = clamp01((x - edge0) / Math.max(0.0001f, edge1 - edge0));
        return t * t * (3f - 2f * t);
    }

    private static void rgbToHsl(int color, float[] outHsl) {
        float r = Color.red(color) / 255f;
        float g = Color.green(color) / 255f;
        float b = Color.blue(color) / 255f;

        float max = Math.max(r, Math.max(g, b));
        float min = Math.min(r, Math.min(g, b));
        float d = max - min;
        float h = 0f;
        float s = 0f;
        float l = (max + min) * 0.5f;

        if (d > 0.00001f) {
            s = l > 0.5f ? d / (2f - max - min) : d / (max + min);
            if (max == r) {
                h = ((g - b) / d) + (g < b ? 6f : 0f);
            } else if (max == g) {
                h = ((b - r) / d) + 2f;
            } else {
                h = ((r - g) / d) + 4f;
            }
            h *= 60f;
        }
        outHsl[0] = h;
        outHsl[1] = s;
        outHsl[2] = l;
    }

    private static int hslToRgb(float h, float s, float l) {
        float c = (1f - Math.abs(2f * l - 1f)) * s;
        float hp = (h % 360f) / 60f;
        if (hp < 0f) hp += 6f;
        float x = c * (1f - Math.abs((hp % 2f) - 1f));
        float r1 = 0f, g1 = 0f, b1 = 0f;
        if (hp < 1f) { r1 = c; g1 = x; }
        else if (hp < 2f) { r1 = x; g1 = c; }
        else if (hp < 3f) { g1 = c; b1 = x; }
        else if (hp < 4f) { g1 = x; b1 = c; }
        else if (hp < 5f) { r1 = x; b1 = c; }
        else { r1 = c; b1 = x; }
        float m = l - c * 0.5f;
        int r = Math.max(0, Math.min(255, Math.round((r1 + m) * 255f)));
        int g = Math.max(0, Math.min(255, Math.round((g1 + m) * 255f)));
        int b = Math.max(0, Math.min(255, Math.round((b1 + m) * 255f)));
        return Color.argb(255, r, g, b);
    }
}
