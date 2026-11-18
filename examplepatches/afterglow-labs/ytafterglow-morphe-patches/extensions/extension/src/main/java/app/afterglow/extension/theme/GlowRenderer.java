package app.afterglow.extension.theme;

import android.graphics.Bitmap;
import android.graphics.BlurMaskFilter;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.RadialGradient;
import android.graphics.LinearGradient;
import android.util.LruCache;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.GlowStyle;
import app.afterglow.extension.settings.ThemePalette;
import app.afterglow.extension.settings.ThemeRole;

/** Cached alpha-shaped bloom in the parent overlay, so icons stay sharp and keep their hit targets. */
public final class GlowRenderer {
    private static final Map<ImageView, Decoration> DECORATIONS = new WeakHashMap<>();
    private static final LruCache<String, Shader> SHADERS = new LruCache<>(96);
    private GlowRenderer() {}
    private static final class Decoration {
        WeakReference<ViewGroup> parent = new WeakReference<>(null);
        WeakReference<Drawable> unsupported = new WeakReference<>(null);
        BitmapDrawable drawable;
        GlowStyle style;
        int source, width, height, color;
        boolean selected, tab, overlay;
        void remove() {
            ViewGroup group = parent.get();
            if (group != null && drawable != null) group.getOverlay().remove(drawable);
            drawable = null;
        }
    }
    /** Follow native icon fades, selection and animated drawable changes without a tree walk. */
    static void frame(View root) {
        if (!InstalledTweaks.has("glow")) return;
        try {
            ThemePalette palette = NativeTheme.activePalette();
            View window = root.getRootView();
            for (Map.Entry<ImageView, Decoration> entry : DECORATIONS.entrySet()) {
                ImageView image = entry.getKey(); Decoration decoration = entry.getValue();
                if (image != null && image.getRootView() == window)
                    update(image, decoration.tab, decoration.overlay, palette);
            }
        } catch (Throwable error) { Afterglow.error("GlowRenderer.frame", error); }
    }
    static void update(ImageView image, boolean tab, boolean overlay, ThemePalette palette) {
        if (!InstalledTweaks.has("glow")) return;
        Decoration decoration = DECORATIONS.get(image);
        GlowStyle style = GlowStyle.current();
        boolean enabled = style.enabled && ((tab && style.pivot) || (overlay && style.overlay));
        if (!enabled || !NativeViews.isIcon(image, tab, overlay) || !image.isShown() || image.getDrawable() == null
                || !(image.getParent() instanceof ViewGroup)) {
            if (decoration != null) decoration.remove();
            return;
        }
        int width = image.getWidth(), height = image.getHeight();
        if (width <= 0 || height <= 0 || width > 512 || height > 512) return;
        Drawable sourceDrawable = image.getDrawable().getCurrent();
        if (decoration != null && decoration.unsupported.get() == sourceDrawable) return;
        if (decoration == null) {
            decoration = new Decoration(); DECORATIONS.put(image, decoration);
            decoration.tab = tab; decoration.overlay = overlay;
            Decoration installed = decoration;
            image.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                public void onViewAttachedToWindow(View v) {}
                public void onViewDetachedFromWindow(View v) { installed.remove(); }
            });
        }
        ViewGroup parent = host(image, tab);
        Integer roleColor = palette == null ? null : palette.color(tab ? ThemeRole.TAB_ICON : ThemeRole.OVERLAY_CONTROL);
        int color = style.color != null ? style.color : roleColor != null ? roleColor : image.getImageTintList() != null
                ? image.getImageTintList().getColorForState(image.getDrawableState(), 0xFFFFFFFF) : 0xFFFFFFFF;
        int source = System.identityHashCode(sourceDrawable);
        if (decoration.drawable == null || decoration.style != style || decoration.source != source
                || decoration.width != width || decoration.height != height || decoration.color != color
                || decoration.selected != image.isSelected() || decoration.parent.get() != parent) {
            decoration.remove();
            Bitmap mask = null, bloom = null;
            try {
                float density = image.getResources().getDisplayMetrics().density;
                int padding = Math.min(180, (int) Math.ceil(style.radius(12 * density, style.layers - 1) * 2));
                mask = Bitmap.createBitmap(width + padding * 2, height + padding * 2, Bitmap.Config.ARGB_8888);
                Canvas maskCanvas = new Canvas(mask);
                maskCanvas.translate(padding + image.getPaddingLeft(), padding + image.getPaddingTop());
                maskCanvas.concat(image.getImageMatrix());
                image.getDrawable().draw(maskCanvas);
                bloom = Bitmap.createBitmap(mask.getWidth(), mask.getHeight(), Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(bloom);
                Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
                for (int layer = style.layers - 1; layer >= 0; layer--) {
                    float radius = style.radius(12 * density, layer);
                    if (radius <= 0) continue;
                    paint.setMaskFilter(new BlurMaskFilter(radius, BlurMaskFilter.Blur.NORMAL));
                    int[] offset = new int[2]; Bitmap blurred = mask.extractAlpha(paint, offset);
                    paint.setMaskFilter(null); paint.setColor(color);
                    paint.setAlpha(Math.round((color >>> 24) * style.opacity(image.isSelected() ? .9f : .45f, layer)));
                    canvas.drawBitmap(blurred, offset[0], offset[1], paint); blurred.recycle();
                }
                decoration.drawable = new BitmapDrawable(image.getResources(), bloom);
                decoration.parent = new WeakReference<>(parent);
                decoration.style = style; decoration.source = source; decoration.width = width; decoration.height = height; decoration.color = color;
                decoration.selected = image.isSelected();
                parent.getOverlay().add(decoration.drawable);
                bloom = null; // Owned by the drawable after a successful attachment.
            } catch (Throwable error) {
                decoration.remove();
                decoration.unsupported = new WeakReference<>(sourceDrawable);
                Afterglow.error("GlowRenderer.icon: " + NativeViews.name(image), error);
                return;
            } finally {
                if (mask != null) mask.recycle();
                if (bloom != null) bloom.recycle();
            }
        }
        BitmapDrawable drawable = decoration.drawable;
        if (drawable == null) return;
        int padding = (drawable.getBitmap().getWidth() - width) / 2;
        int[] imageLocation = new int[2], parentLocation = new int[2];
        image.getLocationOnScreen(imageLocation); parent.getLocationOnScreen(parentLocation);
        int left = imageLocation[0] - parentLocation[0] - padding, top = imageLocation[1] - parentLocation[1] - padding;
        Rect bounds = drawable.getBounds();
        if (bounds.left != left || bounds.top != top || bounds.width() != width + padding*2)
            drawable.setBounds(left, top, left + width + padding*2, top + height + padding*2);
        float alpha = image.getAlpha();
        for (android.view.ViewParent ancestor = image.getParent(); ancestor instanceof View && ancestor != parent; ancestor = ancestor.getParent())
            alpha *= ((View) ancestor).getAlpha();
        drawable.setAlpha(Math.round(alpha * 255));
    }

    private static ViewGroup host(ImageView image, boolean tab) {
        ViewGroup fallback = (ViewGroup) image.getParent();
        android.view.ViewParent ancestor = fallback;
        for (int depth=0; depth<12 && ancestor instanceof ViewGroup; depth++, ancestor=ancestor.getParent()) {
            ViewGroup group = (ViewGroup) ancestor; String name = NativeViews.name(group);
            if (tab && (name.equals("pivot_bar") || name.equals("bottom_bar_container"))) return group;
            if (!tab && (name.equals("player_control_view") || name.equals("player_controls_layout") || name.equals("player_overlays"))) return group;
        }
        return fallback;
    }

    /** Cached gradients give canvas controls a continuous falloff without software layers. */
    public static void circle(Canvas canvas, float x, float y, float radius, int color, GlowStyle style, float density) {
        circle(canvas, x, y, radius, color, style, 30 * density, 1f);
    }
    public static void circle(Canvas canvas, float x, float y, float radius, int color, GlowStyle style, float baseRadius, float baseOpacity) {
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        int tint = glowColor(color, style);
        for (int layer = style.layers - 1; layer >= 0; layer--) {
            float spread = style.radius(baseRadius, layer);
            if (spread <= 0 || style.opacity == 0 || style.strength == 0) continue;
            paint.setShader(shader(tint, radius, spread, false));
            paint.setAlpha(Math.round(255 * style.opacity(baseOpacity, layer)));
            int saved = canvas.save(); canvas.translate(x, y);
            canvas.drawCircle(0, 0, radius + spread * 2, paint); canvas.restoreToCount(saved);
        }
    }

    public static void track(Canvas canvas, float left, float top, float right, float bottom, int color, GlowStyle style, float density) {
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        int tint = glowColor(color, style);
        float core = (bottom - top) / 2, center = (bottom + top) / 2;
        if (core <= 0 || right <= left) return;
        int clipped = canvas.save();
        // Leave the original played pixels and shader intact; only paint the bloom outside them.
        canvas.clipOutRect(left, top, right, bottom);
        for (int layer = style.layers - 1; layer >= 0; layer--) {
            float spread = style.radius(12 * density, layer);
            if (spread <= 0 || style.opacity == 0 || style.strength == 0) continue;
            float extent = core + spread * 2;
            paint.setAlpha(Math.round(255 * style.opacity(.72f, layer)));
            paint.setShader(shader(tint, core, spread, true));
            int saved = canvas.save(); canvas.translate(0, center);
            canvas.drawRect(left, -extent, right, extent, paint); canvas.restoreToCount(saved);
            paint.setShader(shader(tint, core, spread, false));
            saved = canvas.save(); canvas.translate(left, center);
            canvas.clipRect(-extent, -extent, 0, extent); canvas.drawCircle(0, 0, extent, paint); canvas.restoreToCount(saved);
            saved = canvas.save(); canvas.translate(right, center);
            canvas.clipRect(0, -extent, extent, extent); canvas.drawCircle(0, 0, extent, paint); canvas.restoreToCount(saved);
        }
        canvas.restoreToCount(clipped);
    }

    private static int glowColor(int surface, GlowStyle style) {
        if (style.color == null) return surface;
        int color = style.color;
        return (color & 0xFFFFFF) | ((color >>> 24) * (surface >>> 24) / 255 << 24);
    }

    private static Shader shader(int color, float core, float spread, boolean linear) {
        String key = color + ":" + core + ":" + spread + ":" + linear;
        Shader shader = SHADERS.get(key);
        if (shader != null) return shader;
        float extent = core + spread * 2;
        float[] positions = {0, core / extent, (core + spread * .35f) / extent,
                (core + spread * .7f) / extent, (core + spread * 1.25f) / extent, 1};
        float[] opacity = {1, 1, .78f, .38f, .08f, 0};
        int[] colors = new int[positions.length];
        for (int i=0; i<colors.length; i++) colors[i] = (color & 0xFFFFFF) | (Math.round((color >>> 24) * opacity[i]) << 24);
        if (linear) {
            int[] mirroredColors = new int[colors.length * 2 - 1];
            float[] mirroredPositions = new float[mirroredColors.length];
            int middle = colors.length - 1;
            for (int i=0; i<colors.length; i++) {
                mirroredColors[middle-i] = mirroredColors[middle+i] = colors[i];
                mirroredPositions[middle-i] = (1-positions[i]) / 2;
                mirroredPositions[middle+i] = (1+positions[i]) / 2;
            }
            shader = new LinearGradient(0, -extent, 0, extent, mirroredColors, mirroredPositions, Shader.TileMode.CLAMP);
        } else shader = new RadialGradient(0, 0, extent, colors, positions, Shader.TileMode.CLAMP);
        SHADERS.put(key, shader); return shader;
    }
}
