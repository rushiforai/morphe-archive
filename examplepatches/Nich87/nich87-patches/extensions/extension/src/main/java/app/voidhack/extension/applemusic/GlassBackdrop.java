package app.voidhack.extension.applemusic;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.RecordingCanvas;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.RuntimeShader;
import android.view.View;
import android.view.ViewGroup;

final class GlassBackdrop implements LiquidGlass.Backdrop {
    private static final float SAMPLE_PADDING_DP = 64f;
    private static final float LENS_PADDING_DP = 24f;

    private final RenderNode source;
    private final View target;
    private final View navigation;
    private final RenderNode surface = new RenderNode("Apple Music glass backdrop");
    private final RenderNode indicator = new RenderNode("Apple Music optical lens");
    private final RenderNode indicatorContent = new RenderNode("Apple Music lifted tab content");
    private RuntimeShader lensOptics;
    private RuntimeShader contentOptics;
    private final RuntimeShader surfaceOptics = new RuntimeShader(GlassShaders.REGULAR);
    private final GlassPyramid pyramid;
    private float surfaceWidth;
    private float surfaceHeight;
    private float surfaceCornerRadius;
    private float surfaceParallax;
    private float surfaceEngagement;
    private boolean surfaceDark;
    private final Paint tabInk = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF bar = new RectF();
    private final PorterDuffColorFilter activeDark = new PorterDuffColorFilter(
            LiquidGlass.ACTIVE_DARK, PorterDuff.Mode.SRC_IN);
    private final PorterDuffColorFilter activeLight = new PorterDuffColorFilter(
            LiquidGlass.ACTIVE_LIGHT, PorterDuff.Mode.SRC_IN);
    private final int[] targetLocation = new int[2];
    private final int[] navigationLocation = new int[2];
    private final float density;

    GlassBackdrop(RenderNode source, View target, View navigation) {
        this.source = source;
        pyramid = new GlassPyramid(source);
        this.target = target;
        this.navigation = navigation;
        density = navigation.getResources().getDisplayMetrics().density;
    }

    @Override public boolean draw(Canvas canvas, RectF bounds, float cornerRadius, boolean dark,
                                  float parallax, float engagement, int opacity) {
        if (!canvas.isHardwareAccelerated() || !source.hasDisplayList()) return false;
        int padding = (int) Math.ceil(SAMPLE_PADDING_DP * density);
        recordBackdrop(bounds, cornerRadius, dark, padding, parallax, engagement);
        surface.setAlpha(opacity / 255f);
        drawSurface(canvas, bounds, padding);
        return true;
    }

    private void drawSurface(Canvas canvas, RectF bounds, int padding) {
        int save = canvas.save();
        canvas.translate(bounds.left - padding, bounds.top - padding);
        canvas.drawRenderNode(surface);
        canvas.restoreToCount(save);
    }

    private void recordBackdrop(RectF bounds, float cornerRadius, boolean dark, int padding, float parallax,
                                float engagement) {
        float width = bounds.width();
        float height = bounds.height();
        float sizeDp = Math.min(width, height) / density;
        float t = Math.max(0f, Math.min(1f, (sizeDp - 48f) / 112f));
        float faceRadius = (1.5f + 4.5f * t) * density * 0.4f;
        float bleedRadius = t > 0f ? Math.min(0.7f * sizeDp, 160f) * 0.5f * density * 0.4f : 0f;
        float shadowRadius = t > 0f ? 8f * density : 0f;
        float maxRadius = Math.max(faceRadius, Math.max(bleedRadius, shadowRadius));
        target.getLocationOnScreen(targetLocation);
        navigation.getLocationOnScreen(navigationLocation);
        boolean resized = pyramid.record(surface, (int) Math.ceil(width) + padding * 2, (int) Math.ceil(height) + padding * 2,
                padding - bounds.left - navigationLocation[0] + targetLocation[0],
                padding - bounds.top - navigationLocation[1] + targetLocation[1],
                dark ? Color.BLACK : Color.WHITE, maxRadius);
        if (!resized && surfaceWidth == width && surfaceHeight == height && surfaceCornerRadius == cornerRadius
                && surfaceParallax == parallax
                && surfaceEngagement == engagement && surfaceDark == dark) return;

        surfaceWidth = width;
        surfaceHeight = height;
        surfaceCornerRadius = cornerRadius;
        surfaceParallax = parallax;
        surfaceEngagement = engagement;
        surfaceDark = dark;
        pyramid.setUniforms(surfaceOptics);
        surfaceOptics.setFloatUniform("extent", width, height);
        surfaceOptics.setFloatUniform("cornerRadius", cornerRadius);
        surfaceOptics.setFloatUniform("center", padding + width / 2f, padding + height / 2f);
        surfaceOptics.setFloatUniform("density", density);
        surfaceOptics.setFloatUniform("dark", dark ? 1f : 0f);
        surfaceOptics.setFloatUniform("light", -0.35f + parallax * 0.45f, -0.85f);
        surfaceOptics.setFloatUniform("interaction", engagement);
        surfaceOptics.setFloatUniform("parallax", parallax * 8f * density);
        surface.setRenderEffect(RenderEffect.createRuntimeShaderEffect(surfaceOptics, "atlas"));
    }

    @Override public void drawLens(Canvas canvas, RectF bounds, boolean dark, float press, ViewGroup menu, Paint composite) {
        if (!canvas.isHardwareAccelerated() || !source.hasDisplayList() || bounds.isEmpty()) return;
        if (lensOptics == null) {
            lensOptics = new RuntimeShader(GlassShaders.LENS);
            contentOptics = new RuntimeShader(GlassShaders.LENS_CONTENT);
        }
        int padding = (int) Math.ceil(LENS_PADDING_DP * density);
        int width = (int) Math.ceil(bounds.width()) + padding * 2;
        int height = (int) Math.ceil(bounds.height()) + padding * 2;
        indicator.setPosition(0, 0, width, height);
        RecordingCanvas recording = indicator.beginRecording();
        recording.drawColor(dark ? Color.BLACK : Color.WHITE);
        recording.translate(padding - bounds.left, padding - bounds.top);
        int background = recording.save();
        recording.translate(targetLocation[0] - navigationLocation[0], targetLocation[1] - navigationLocation[1]);
        recording.drawRenderNode(source);
        recording.restoreToCount(background);
        bar.set(0f, 0f, navigation.getWidth(), navigation.getHeight());
        if (surface.hasDisplayList()) {
            drawSurface(recording, bar, (int) Math.ceil(SAMPLE_PADDING_DP * density));
        }
        indicator.endRecording();

        indicatorContent.setPosition(0, 0, width, height);
        RecordingCanvas content = indicatorContent.beginRecording();
        content.translate(padding - bounds.left, padding - bounds.top);
        tabInk.setColorFilter(dark ? activeDark : activeLight);
        int tabs = content.saveLayer(0f, 0f, navigation.getWidth(), navigation.getHeight(), tabInk);
        content.translate(menu.getLeft(), menu.getTop());
        menu.draw(content);
        content.restoreToCount(tabs);
        indicatorContent.endRecording();

        lensOptics.setFloatUniform("dark", dark ? 1f : 0f);
        indicator.setRenderEffect(lensEffect(lensOptics, bounds, press, padding, density));
        indicatorContent.setRenderEffect(lensEffect(contentOptics, bounds, press, padding, density));
        int save = canvas.saveLayer(bounds.left - padding, bounds.top - padding,
                bounds.left - padding + width, bounds.top - padding + height, composite);
        canvas.translate(bounds.left - padding, bounds.top - padding);
        canvas.drawRenderNode(indicator);
        canvas.drawRenderNode(indicatorContent);
        canvas.restoreToCount(save);
    }

    private static RenderEffect lensEffect(RuntimeShader shader, RectF bounds, float press,
                                           int padding, float density) {
        shader.setFloatUniform("extent", bounds.width(), bounds.height());
        shader.setFloatUniform("center", padding + bounds.width() / 2f, padding + bounds.height() / 2f);
        shader.setFloatUniform("density", density);
        shader.setFloatUniform("lift", press);
        return RenderEffect.createRuntimeShaderEffect(shader, "scene");
    }

    @Override public void release() {
        surface.discardDisplayList();
        pyramid.release();
        indicator.discardDisplayList();
        indicatorContent.discardDisplayList();
    }
}
