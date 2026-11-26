package app.bin0culars.extension.reddit;

import android.app.Activity;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RecordingCanvas;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.os.Build;
import android.view.View;
import android.view.ViewTreeObserver;
import app.bin0culars.extension.reddit.settings.BinocularsMods;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import kotlin.jvm.functions.Function1;

public final class GlassBlur {

    // Upstream Morphe found that a blur render effect redrawn every frame can crash the app on Android 12/13.
    static final int MIN_SDK = 34;
    private static final float MAX_BLUR_DP = 32f;
    static final float EDGE_DP = 1f;

    private static final Path CLIP_PATH = new Path();
    private static final WeakHashMap<View, Boolean> DECOR_VIEWS = new WeakHashMap<>();

    static ContentRecorder current;
    static ContentRecorder recording;

    private static float barLeft;
    private static float barBaseTop;
    static float barTop;
    private static float barW;
    private static float barH;
    private static float barSlide;

    private static RenderNode blurNode;
    private static float blurNodeRadius = -1f;
    static RenderNode searchBlurNode;
    private static float searchBlurNodeRadius = -1f;
    private static RenderEffect cachedBlurEffect;
    private static float cachedBlurRadius = -1f;

    private static WeakReference<GlassSearchButton> searchButtonRef;
    private static float searchLeft;
    private static float searchTop;
    private static float searchSize;

    private static Paint edgePaint;
    private static LinearGradient edgeShader;
    private static float cachedEdgeTop = -1f;
    private static float cachedEdgeHeight = -1f;
    private static boolean cachedEdgeDark;

    private GlassBlur() {}

    static boolean glassOn() {
        try {
            return BinocularsMods.isEnabled("glass_navigation");
        } catch (Throwable ignored) {
            return false;
        }
    }

    static float blurRadiusPx() {
        try {
            return BinocularsMods.getInt("glass_navigation_blur") / 100f * MAX_BLUR_DP * GlassNavPatch.getDensity();
        } catch (Throwable ignored) {
            return 0f;
        }
    }

    static boolean blurActive() {
        try {
            return Build.VERSION.SDK_INT >= MIN_SDK
                    && glassOn()
                    && "frosted".equals(BinocularsMods.getChoice("glass_navigation_style"))
                    && blurRadiusPx() > 0f;
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static Object contentModifier(Object modifier) {
        try {
            if (Build.VERSION.SDK_INT < MIN_SDK || !glassOn()) {
                return modifier;
            }
            return drawWithContent(modifier, new ContentRecorder());
        } catch (Throwable ignored) {
            return modifier;
        }
    }

    static final class ContentRecorder implements Function1<Object, Object> {
        final RenderNode node = new RenderNode("bin0culars_glass_content");
        RecordingCanvas recCanvas;
        boolean headerPending;
        boolean holdsBar;
        int width;
        int height;

        @Override
        public Object invoke(Object scope) {
            boolean drawn = false;
            try {
                if (!blurActive()) {
                    drawn = true;
                    GlassNavPatch.drawContent(scope);
                    return null;
                }
                Object cc = composeCanvas(scope);
                Canvas real = nativeCanvas(cc);
                if (real == null || !real.isHardwareAccelerated()) {
                    drawn = true;
                    GlassNavPatch.drawContent(scope);
                    return null;
                }
                long size = GlassNavPatch.drawScopeSize(scope);
                float widthFloat = Float.intBitsToFloat((int) (size >>> 32));
                float heightFloat = Float.intBitsToFloat((int) size);
                int w = (int) Math.ceil(widthFloat);
                int h = (int) Math.ceil(heightFloat);
                if (w <= 0 || h <= 0) {
                    drawn = true;
                    GlassNavPatch.drawContent(scope);
                    return null;
                }

                node.setPosition(0, 0, w, h);
                RecordingCanvas rec = node.beginRecording(w, h);
                ContentRecorder previous = recording;
                recording = this;
                recCanvas = rec;
                headerPending = false;
                // Swap Compose's native canvas with the RenderNode's RecordingCanvas to capture content drawing.
                setNativeCanvas(cc, rec);
                try {
                    drawn = true;
                    GlassNavPatch.drawContent(scope);
                } finally {
                    setNativeCanvas(cc, real);
                    recCanvas = null;
                    node.endRecording();
                    recording = previous;
                }
                real.drawRenderNode(node);
                if (headerPending) {
                    real.save();
                    real.concat(GlassHeaderBlur.headerMatrix);
                    real.drawRenderNode(GlassHeaderBlur.headerNode);
                    real.restore();
                }
                if (!holdsBar) {
                    current = this;
                    width = w;
                    height = h;
                }
            } catch (Throwable ignored) {
                if (!drawn) {
                    try {
                        GlassNavPatch.drawContent(scope);
                    } catch (Throwable ignored2) {
                    }
                }
            }
            return null;
        }
    }

    static int liftPx() {
        try {
            if (!glassOn()) {
                return 0;
            }
            int liftDp = BinocularsMods.getInt("glass_navigation_lift_dp");
            if (liftDp <= 0) {
                return 0;
            }
            return Math.round(liftDp * GlassNavPatch.getDensity());
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private static void updateBarSlide(float slide) {
        barSlide = slide;
        if (barW > 0f) {
            barTop = barBaseTop + slide;
        }
    }

    static boolean hasBarBounds() {
        return barW > 0f;
    }

    static void setSearchButton(GlassSearchButton button) {
        if (button != null && (searchButtonRef == null || searchButtonRef.get() != button)) {
            searchButtonRef = new WeakReference<>(button);
        }
    }

    private static boolean isSearchButtonVisible(View decorView) {
        GlassSearchButton button = searchButtonRef != null ? searchButtonRef.get() : null;
        return button != null
                && button.isAttachedToWindow()
                && button.isShown()
                && button.getRootView() == decorView;
    }

    public static int adjustBarLift(int lift, float barHeight, float fraction) {
        int full = Math.max(lift, Math.round(barHeight));
        int maxLift = liftPx();
        int extra = 0;
        if (maxLift > 0) {
            float f = fraction >= 1f ? 1f : (fraction > 0f ? fraction : 0f);
            extra = Math.round(maxLift * f);
        }
        int adjusted = lift + extra;
        updateBarSlide(full - adjusted);
        GlassSearch.onBarSlide(barSlide + maxLift, fraction <= 0f || (full > 0 && adjusted <= 0));
        return adjusted;
    }

    public static int adjustBarY(int y, int height) {
        int maxLift = liftPx();
        int extra = 0;
        if (maxLift > 0) {
            float raw = height > 0 ? 1f - (float) y / height : 1f;
            float f = raw >= 1f ? 1f : (raw > 0f ? raw : 0f);
            extra = Math.round(maxLift * f);
        }
        int out = y - extra;
        updateBarSlide(out);
        GlassSearch.onBarSlide(barSlide + maxLift, height > 0 && y >= height);
        return out;
    }

    static void drawBar(Object scope, float left, float top, float cw, float ch, float radius) {
        try {
            if (recording != null) {
                recording.holdsBar = true;
                if (current == recording) {
                    current = null;
                }
                return;
            }
            if (!blurActive() || current == null) {
                return;
            }
            Canvas real = nativeCanvas(composeCanvas(scope));
            if (real == null || !real.isHardwareAccelerated()) {
                return;
            }
            long size = GlassNavPatch.drawScopeSize(scope);
            float bh = Float.intBitsToFloat((int) size);

            barLeft = left;
            barBaseTop = (current.height - bh) + top;
            barTop = barBaseTop + barSlide;
            barW = cw;
            barH = ch;

            recordBlur();

            int m = (int) Math.ceil(blurRadiusPx());
            real.save();
            try {
                CLIP_PATH.reset();
                CLIP_PATH.addRoundRect(left, top, left + cw, top + ch, radius, radius, Path.Direction.CW);
                real.clipPath(CLIP_PATH);
                real.translate(left - m, top - m);
                real.drawRenderNode(blurNode);
            } finally {
                real.restore();
            }
        } catch (Throwable ignored) {
        }
    }

    private static int pageArgb() {
        int c = (int) (GlassNavPatch.lastPageColor >>> 32);
        if (c == 0) {
            return GlassNavPatch.isDarkTheme() ? 0xFF000000 : 0xFFFFFFFF;
        }
        return c | 0xFF000000;
    }

    private static RenderEffect blurEffect(float r) {
        if (cachedBlurEffect == null || cachedBlurRadius != r) {
            ColorMatrix boost = new ColorMatrix();
            boost.setSaturation(1.4f);
            cachedBlurEffect = RenderEffect.createChainEffect(
                    RenderEffect.createBlurEffect(r, r, Shader.TileMode.CLAMP),
                    RenderEffect.createColorFilterEffect(new ColorMatrixColorFilter(boost)));
            cachedBlurRadius = r;
        }
        return cachedBlurEffect;
    }

    static float recordBlurInto(
            RenderNode node, float appliedRadius, float left, float top, float bw, float bh) {
        try {
            if (current == null || node == null) {
                return appliedRadius;
            }
            float r = blurRadiusPx();
            if (r <= 0f) {
                return appliedRadius;
            }
            int m = (int) Math.ceil(r);
            int w = (int) Math.ceil(bw) + 2 * m;
            int h = (int) Math.ceil(bh) + 2 * m;
            if (w <= 0 || h <= 0) {
                return appliedRadius;
            }
            node.setPosition(0, 0, w, h);
            if (appliedRadius != r) {
                node.setRenderEffect(blurEffect(r));
                appliedRadius = r;
            }
            RecordingCanvas rec = node.beginRecording(w, h);
            try {
                rec.drawColor(pageArgb());
                rec.translate(-(left - m), -(top - m));
                rec.drawRenderNode(current.node);
            } finally {
                node.endRecording();
            }
            return appliedRadius;
        } catch (Throwable ignored) {
            return appliedRadius;
        }
    }

    private static void recordBlur() {
        try {
            if (current == null) {
                return;
            }
            if (blurNode == null) {
                blurNode = new RenderNode("bin0culars_glass_blur");
            }
            blurNodeRadius = recordBlurInto(blurNode, blurNodeRadius, barLeft, barTop, barW, barH);
        } catch (Throwable ignored) {
        }
    }

    static void recordSearchBlur(float leftInContent, float topInContent, float size) {
        try {
            if (current == null || size <= 0f) {
                return;
            }
            searchLeft = leftInContent;
            searchTop = topInContent;
            searchSize = size;
            if (searchBlurNode == null) {
                searchBlurNode = new RenderNode("bin0culars_glass_search_blur");
            }
            searchBlurNodeRadius = recordBlurInto(
                    searchBlurNode, searchBlurNodeRadius, leftInContent, topInContent, size, size);
        } catch (Throwable ignored) {
        }
    }

    static void drawEdge(Object scope, float left, float top, float cw, float ch, float radius) {
        try {
            if (!blurActive() || recording != null) {
                return;
            }
            Canvas real = nativeCanvas(composeCanvas(scope));
            if (real == null) {
                return;
            }
            float density = GlassNavPatch.getDensity();
            float strokeWidth = EDGE_DP * density;
            if (edgePaint == null) {
                edgePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
                edgePaint.setStyle(Paint.Style.STROKE);
            }
            edgePaint.setStrokeWidth(strokeWidth);

            boolean isDark = GlassNavPatch.glassIsDark();
            if (edgeShader == null || cachedEdgeTop != top || cachedEdgeHeight != ch || cachedEdgeDark != isDark) {
                int colorStart = isDark ? 0x40FFFFFF : 0xB3FFFFFF;
                int colorEnd = isDark ? 0x0DFFFFFF : 0x14000000;
                edgeShader = new LinearGradient(0f, top, 0f, top + ch, colorStart, colorEnd, Shader.TileMode.CLAMP);
                edgePaint.setShader(edgeShader);
                cachedEdgeTop = top;
                cachedEdgeHeight = ch;
                cachedEdgeDark = isDark;
            }

            float halfStroke = strokeWidth / 2f;
            float rLeft = left + halfStroke;
            float rTop = top + halfStroke;
            float rRight = left + cw - halfStroke;
            float rBottom = top + ch - halfStroke;
            float rRadius = Math.max(0f, radius - halfStroke);
            real.drawRoundRect(rLeft, rTop, rRight, rBottom, rRadius, rRadius, edgePaint);
        } catch (Throwable ignored) {
        }
    }

    public static void onActivityResumed(Activity activity) {
        try {
            if (activity == null || activity.getWindow() == null) {
                return;
            }
            GlassSearch.onActivityResumed(activity);
            View decorView = activity.getWindow().peekDecorView();
            if (decorView == null) {
                decorView = activity.getWindow().getDecorView();
            }
            if (decorView == null || DECOR_VIEWS.containsKey(decorView)) {
                return;
            }
            final View targetDecorView = decorView;
            DECOR_VIEWS.put(targetDecorView, Boolean.TRUE);
            targetDecorView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
                @Override
                public boolean onPreDraw() {
                    try {
                        if (blurActive() && current != null) {
                            if (barW > 0f) {
                                recordBlur();
                            }
                            if (isSearchButtonVisible(targetDecorView) && searchSize > 0f) {
                                recordSearchBlur(searchLeft, barW > 0f ? barTop : searchTop, searchSize);
                            }
                            GlassHeaderBlur.reRecordSlots();
                        }
                    } catch (Throwable ignored) {
                    }
                    return true;
                }
            });
        } catch (Throwable ignored) {
        }
    }

    static Object composeCanvas(Object scope) {
        return null;
    }

    static Canvas nativeCanvas(Object composeCanvas) {
        return null;
    }

    static void setNativeCanvas(Object composeCanvas, Canvas canvas) {}

    @SuppressWarnings("rawtypes")
    static Object drawWithContent(Object modifier, Function1 block) {
        return modifier;
    }
}
