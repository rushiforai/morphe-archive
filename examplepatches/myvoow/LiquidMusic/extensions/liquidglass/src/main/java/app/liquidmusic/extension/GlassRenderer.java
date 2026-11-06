/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 *
 * The effect chain (vibrancy -> blur -> lens) follows Backdrop by Kyant (Apache License 2.0):
 * https://github.com/Kyant0/AndroidLiquidGlass
 */
package app.liquidmusic.extension;

import android.annotation.TargetApi;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RecordingCanvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.RuntimeShader;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.view.View;
import android.view.ViewTreeObserver;

import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/**
 * Draws one Liquid Glass surface in place of a BlurView.
 * <p>
 * The content behind the surface is not captured again: BlurTarget already records it in a
 * RenderNode on every frame, so this renderer only references that node, offset to the position
 * of the surface, in a node of its own with a padding of one blur radius. Like Apple's blur, the
 * node starts with the window background, so the glass is opaque: without it, everything that
 * BlurTarget leaves transparent would show the content through the glass, unbent. The effect chain
 * of the node is, as in Backdrop: saturation (vibrancy), then blur (off by default: the glass stays
 * clear), then the AGSL lens that bends the edges (Android 13+). The result is clipped to the
 * shape of the surface.
 * <p>
 * The tab bar and the mini player draw Apple's translucent material over the BlurView. Its layers
 * are faded on every frame, because Apple resets them whenever the colors of the player change,
 * and the specular rim is added to the overlay of that view, so the tint does not dim it.
 */
@TargetApi(Build.VERSION_CODES.S)
final class GlassRenderer implements ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener {

    /** Layers of Apple's bg_apple_material drawable, made more transparent so the glass shows. */
    private static final String[] TINT_LAYER_NAMES = {"material_layer", "artwork_color_scheme_layer"};

    /** The view over the tab bar's BlurView, which the liquid tab bar can replace. */
    private static final String LIQUID_TAB_BAR_CONTENT = "bottom_nav_view";

    private final WeakReference<View> hostRef;
    private final LiquidGlassPatch.Surface surface;

    private final RenderNode node = new RenderNode("LiquidGlass");
    private final int[] hostLocation = new int[2];
    private final int[] sourceLocation = new int[2];
    private final int[] rootLocation = new int[2];
    private final RectF bounds = new RectF();
    private final Path shape = new Path();

    private WeakReference<View> sourceRef = new WeakReference<>(null);
    private RenderNode sourceNode;
    private float drawnOffsetX = Float.NaN;
    private float drawnOffsetY = Float.NaN;
    private boolean listening;
    private boolean frameErrorLogged;

    // Effect cache, rebuilt only when the geometry changes.
    private RenderEffect effect;
    private int effectWidth = -1;
    private int effectHeight = -1;
    private int effectPadding = -1;
    private float effectCorner = -1f;
    private int effectRevision = -1;
    /** Settings revision the glass was last drawn with. */
    private int drawnRevision = -1;

    /**
     * The fades written on Apple's drawables, shared by all surfaces so that a drawable is never
     * faded twice. An alpha read back that differs from the one written was set by Apple, and is
     * faded in turn.
     */
    private static final WeakHashMap<Drawable, Fade> FADES = new WeakHashMap<>();

    private static final class Fade {
        final int appleAlpha;
        final int writtenAlpha;
        final int percent;

        Fade(int appleAlpha, int writtenAlpha, int percent) {
            this.appleAlpha = appleAlpha;
            this.writtenAlpha = writtenAlpha;
            this.percent = percent;
        }
    }

    // The view drawn over the glass (tab bar, mini player) and the rim, in its overlay if any.
    private WeakReference<View> contentRef = new WeakReference<>(null);
    private GlassRim rim;
    private WeakReference<View> rimHostRef = new WeakReference<>(null);

    GlassRenderer(View host, LiquidGlassPatch.Surface surface) {
        this.hostRef = new WeakReference<>(host);
        this.surface = surface;
        host.addOnAttachStateChangeListener(this);
    }

    /**
     * @return true if the glass was drawn, false to let BlurView draw its original blur.
     */
    boolean draw(View host, Canvas canvas) {
        final int width = host.getWidth();
        final int height = host.getHeight();
        if (width <= 0 || height <= 0) return false;

        // The liquid tab bar of Backdrop draws its own glass in place of this one.
        if (LIQUID_TAB_BAR_CONTENT.equals(surface.contentIdName)
                && LiquidTabBar.replace(host, contentView(host))) {
            return true;
        }

        View source = resolveSource(host);
        if (source == null) return false;
        startListening(host);

        host.getLocationInWindow(hostLocation);
        source.getLocationInWindow(sourceLocation);
        final float offsetX = hostLocation[0] - sourceLocation[0];
        final float offsetY = hostLocation[1] - sourceLocation[1];
        drawnOffsetX = offsetX;
        drawnOffsetY = offsetY;

        final float density = host.getResources().getDisplayMetrics().density;
        final float blurRadius = Math.max(0, LiquidSettings.blurRadiusDp()) * density;
        final int padding = (int) Math.ceil(blurRadius);
        final float corner = cornerRadius(host.getBackground(), width, height);

        // The window background, then the content behind the surface, with one blur radius
        // around it (if any) so the blur does not fade at the edges.
        node.setPosition(0, 0, width + 2 * padding, height + 2 * padding);
        RecordingCanvas recording = node.beginRecording();
        try {
            drawWindowBackground(host, recording, padding);
            recording.translate(padding - offsetX, padding - offsetY);
            recording.drawRenderNode(sourceNode);
        } finally {
            node.endRecording();
        }
        node.setRenderEffect(effect(width, height, padding, corner, density, blurRadius));
        drawnRevision = LiquidSettings.getRevision();

        bounds.set(0, 0, width, height);
        shape.rewind();
        shape.addRoundRect(bounds, corner, corner, Path.Direction.CW);

        final int save = canvas.save();
        canvas.clipPath(shape);
        canvas.translate(-padding, -padding);
        canvas.drawRenderNode(node);
        canvas.restoreToCount(save);

        updateContent(host, density);
        if (rimHostRef.get() == host) {
            // No view over the glass: the rim is part of the glass itself.
            rim.setBounds(0, 0, width, height);
            rim.setCornerRadius(corner);
            rim.draw(canvas);
        }
        return true;
    }

    private View resolveSource(View host) {
        View source = sourceRef.get();
        if (source != null && source.isAttachedToWindow() && sourceNode != null) return source;

        source = BlurViewAccess.findBlurTarget(host);
        if (source == null) return null;
        Object recorded = BlurViewAccess.recordedNodeOf(source);
        if (!(recorded instanceof RenderNode)) return null;

        sourceRef = new WeakReference<>(source);
        sourceNode = (RenderNode) recorded;
        return source;
    }

    /**
     * Draws what is under BlurTarget, as Apple's blur does with its "frame clear" drawable: the
     * background of the window, at its place in the window. BlurTarget only records its children,
     * so without it the glass would be transparent wherever the app draws no background.
     */
    @SuppressWarnings("deprecation") // Drawable.getOpacity() is still the way to know if it is opaque.
    private void drawWindowBackground(View host, RecordingCanvas recording, int padding) {
        final View root = host.getRootView();
        final Drawable background = root != null ? root.getBackground() : null;
        if (background == null || background.getOpacity() != PixelFormat.OPAQUE) {
            recording.drawColor(windowColor(host));
        }
        if (background != null) {
            // hostLocation was just measured by draw().
            root.getLocationInWindow(rootLocation);
            final int save = recording.save();
            recording.translate(padding + rootLocation[0] - hostLocation[0], padding + rootLocation[1] - hostLocation[1]);
            background.draw(recording);
            recording.restoreToCount(save);
        }
    }

    private static int windowColor(View host) {
        TypedArray attributes = host.getContext().obtainStyledAttributes(new int[]{android.R.attr.colorBackground});
        try {
            return attributes.getColor(0, Color.BLACK) | 0xFF000000;
        } finally {
            attributes.recycle();
        }
    }

    private RenderEffect effect(int width, int height, int padding, float corner, float density, float blurRadius) {
        if (effect != null && width == effectWidth && height == effectHeight
                && padding == effectPadding && corner == effectCorner
                && effectRevision == LiquidSettings.getRevision()) {
            return effect;
        }

        ColorMatrix saturation = new ColorMatrix();
        saturation.setSaturation(Math.max(0, LiquidSettings.saturationPercent()) / 100f);
        RenderEffect chain = RenderEffect.createColorFilterEffect(new ColorMatrixColorFilter(saturation));

        if (blurRadius > 0f) {
            chain = RenderEffect.createBlurEffect(blurRadius, blurRadius, chain, Shader.TileMode.CLAMP);
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            RenderEffect lens = lens(width, height, padding, corner, density);
            if (lens != null) chain = RenderEffect.createChainEffect(lens, chain);
        }

        effect = chain;
        effectWidth = width;
        effectHeight = height;
        effectPadding = padding;
        effectCorner = corner;
        effectRevision = LiquidSettings.getRevision();
        return chain;
    }

    @TargetApi(Build.VERSION_CODES.TIRAMISU)
    private static RenderEffect lens(int width, int height, int padding, float corner, float density) {
        final float refractionHeight = Math.min(
                Math.max(0, LiquidSettings.refractionHeightDp()) * density,
                Math.min(width, height) / 2f
        );
        final float refractionAmount = Math.max(0, LiquidSettings.refractionAmountDp()) * density;
        if (refractionHeight <= 0f || refractionAmount <= 0f) return null;

        final boolean dispersion = LiquidSettings.chromaticAberration();
        RuntimeShader shader = new RuntimeShader(
                dispersion ? GlassShaders.REFRACTION_WITH_DISPERSION : GlassShaders.REFRACTION
        );
        shader.setFloatUniform("size", width, height);
        shader.setFloatUniform("offset", -padding, -padding);
        shader.setFloatUniform("cornerRadii", corner, corner, corner, corner);
        shader.setFloatUniform("refractionHeight", refractionHeight);
        shader.setFloatUniform("refractionAmount", -refractionAmount);
        shader.setFloatUniform("depthEffect", 0f);
        if (dispersion) shader.setFloatUniform("chromaticAberration", 1f);
        return RenderEffect.createRuntimeShaderEffect(shader, "content");
    }

    // region View over the glass: tint and rim

    /**
     * Finds the view drawn over the glass, fades its tint and keeps the rim on top of it.
     * Called on every frame: Apple replaces the material layer and sets the alpha of the artwork
     * layer again whenever the colors of the tab bar and the mini player change.
     */
    private void updateContent(View host, float density) {
        final View content = contentView(host);

        final int intensity = clamp(LiquidSettings.highlightPercent(), 0, 100);
        if (rim != null && intensity == 0) rim.setIntensity(0);
        if (intensity > 0) {
            if (rim == null) rim = new GlassRim(density, intensity);
            rim.setIntensity(intensity);
            // Over the view drawn on the glass if there is one, otherwise in the glass itself.
            final View wanted = content != null ? content : host;
            final View current = rimHostRef.get();
            if (current != wanted) {
                if (current != null && current != host) current.getOverlay().remove(rim);
                if (wanted != host) wanted.getOverlay().add(rim);
                rimHostRef = new WeakReference<>(wanted);
            }
            if (wanted == content) {
                final int width = content.getWidth();
                final int height = content.getHeight();
                final Rect rimBounds = rim.getBounds();
                if (rimBounds.width() != width || rimBounds.height() != height) rim.setBounds(0, 0, width, height);
                // The navigation over the tablet sidebar has a plain color: use the glass's corners.
                final float radius = cornerRadiusOf(content.getBackground());
                rim.setCornerRadius(radius > 0f ? radius : cornerRadius(host.getBackground(), width, height));
            }
        }

        if (content != null) fadeTint(host, content.getBackground());
    }

    private View contentView(View host) {
        final String name = surface.contentIdName;
        if (name == null) return null;
        View content = contentRef.get();
        if (content != null && content.isAttachedToWindow()) return content;

        final int id = LiquidGlassPatch.idOf(host, name);
        if (id == 0) return null;
        content = host.getRootView().findViewById(id);
        if (content == null) return null;
        contentRef = new WeakReference<>(content);
        return content;
    }

    private static void fadeTint(View host, Drawable background) {
        final int percent = clamp(LiquidSettings.tintOpacityPercent(), 0, 100);
        if (background == null) return;

        if (background instanceof LayerDrawable) {
            final LayerDrawable layers = (LayerDrawable) background;
            boolean found = false;
            for (String layerName : TINT_LAYER_NAMES) {
                final int id = LiquidGlassPatch.idOf(host, layerName);
                final Drawable layer = id != 0 ? layers.findDrawableByLayerId(id) : null;
                if (layer == null) continue;
                found = true;
                fade(layer, percent);
            }
            if (found) return;
        }
        fade(background, percent);
    }

    private static void fade(Drawable drawable, int percent) {
        final int alpha = drawable.getAlpha();
        final Fade fade = FADES.get(drawable);
        final int appleAlpha;
        if (fade != null && fade.writtenAlpha == alpha) {
            if (fade.percent == percent) return;
            appleAlpha = fade.appleAlpha; // The opacity setting changed.
        } else {
            if (percent >= 100) return; // Never faded, nothing to do.
            appleAlpha = alpha;
        }
        final Drawable mutable = drawable.mutate();
        final int faded = Math.round(appleAlpha * percent / 100f);
        mutable.setAlpha(faded);
        FADES.put(mutable, new Fade(appleAlpha, faded, percent));
    }

    // endregion

    private static float cornerRadius(Drawable background, int width, int height) {
        final float max = Math.min(width, height) / 2f;
        final float radius = cornerRadiusOf(background);
        return radius > 0f ? Math.min(radius, max) : max;
    }

    private static float cornerRadiusOf(Drawable drawable) {
        if (drawable instanceof GradientDrawable) {
            return ((GradientDrawable) drawable).getCornerRadius();
        }
        if (drawable instanceof LayerDrawable) {
            final LayerDrawable layers = (LayerDrawable) drawable;
            for (int i = 0, count = layers.getNumberOfLayers(); i < count; i++) {
                final float radius = cornerRadiusOf(layers.getDrawable(i));
                if (radius > 0f) return radius;
            }
        }
        return 0f;
    }

    private static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }

    // region Frame tracking

    private void startListening(View host) {
        if (listening) return;
        host.getViewTreeObserver().addOnPreDrawListener(this);
        listening = true;
    }

    private void stopListening(View host) {
        if (!listening) return;
        host.getViewTreeObserver().removeOnPreDrawListener(this);
        listening = false;
    }

    /**
     * Runs before every frame. The content behind updates by itself (the node references
     * BlurTarget's node), but a move of the surface, such as the mini player animating, needs the
     * offset to be recorded again, and Apple may have reset the tint since the last frame.
     */
    @Override
    public boolean onPreDraw() {
        try {
            View host = hostRef.get();
            View source = sourceRef.get();
            if (host == null || source == null || !host.isShown()) return true;
            host.getLocationInWindow(hostLocation);
            source.getLocationInWindow(sourceLocation);
            if (hostLocation[0] - sourceLocation[0] != drawnOffsetX
                    || hostLocation[1] - sourceLocation[1] != drawnOffsetY
                    || drawnRevision != LiquidSettings.getRevision()) {
                host.invalidate();
            }
            updateContent(host, host.getResources().getDisplayMetrics().density);
        } catch (Throwable t) {
            // Runs on every frame: report the first failure only.
            if (!frameErrorLogged) android.util.Log.e(LiquidGlassPatch.TAG, "Frame update failed", t);
            frameErrorLogged = true;
        }
        return true;
    }

    @Override
    public void onViewAttachedToWindow(View view) {
    }

    @Override
    public void onViewDetachedFromWindow(View view) {
        stopListening(view);
        node.discardDisplayList();
        sourceRef = new WeakReference<>(null);
        sourceNode = null;
        final View rimHost = rimHostRef.get();
        if (rim != null && rimHost != null && rimHost != view) rimHost.getOverlay().remove(rim);
        rimHostRef = new WeakReference<>(null);
        contentRef = new WeakReference<>(null);
    }

    // endregion
}
