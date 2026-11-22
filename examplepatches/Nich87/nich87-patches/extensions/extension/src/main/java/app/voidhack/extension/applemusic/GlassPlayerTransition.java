package app.voidhack.extension.applemusic;

import android.animation.ValueAnimator;
import android.graphics.Outline;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;

/** Shapes the native Now Playing sheet using its own drag and settle progress. */
final class GlassPlayerTransition {
    private final ViewGroup sheet;
    private final ViewGroup player;
    private final View mini;
    private final GlassPlayerMetadata metadata;
    private final GlassPlayerMorph frame = new GlassPlayerMorph();
    private final Rect miniBounds = new Rect();
    private final Rect clip = new Rect();
    private final Rect surfaceBounds = new Rect();
    private final GlassDrawable surface;
    private final Drawable originalBackground;
    private final Drawable background;
    private final ViewOutlineProvider outline = new ViewOutlineProvider() {
        @Override public void getOutline(View view, Outline result) {
            result.setRoundRect(clip, radius);
        }
    };
    private ViewOutlineProvider originalOutline;
    private boolean originalClip;
    private boolean running;
    private float radius;

    GlassPlayerTransition(ViewGroup sheet, ViewGroup player, View mini, View target) {
        this.sheet = sheet;
        this.player = player;
        this.mini = mini;
        metadata = Build.VERSION.SDK_INT >= 29 ? new GlassPlayerMetadata(player, mini) : null;
        // Keep the shader and background attached across both endpoints. Changing
        // the sheet's background for the first time during a slide requests layout.
        surface = new GlassDrawable(sheet, LiquidGlass.backdrop(target, sheet));
        surface.setTransitionShape(surfaceBounds, 0f);
        surface.setAlpha(0);
        originalBackground = sheet.getBackground();
        if (originalBackground == null) {
            background = surface;
        } else {
            LayerDrawable layers = new LayerDrawable(new Drawable[]{originalBackground, surface});
            layers.setPaddingMode(LayerDrawable.PADDING_MODE_STACK);
            background = layers;
        }
        sheet.setBackground(background);
        if (background instanceof LayerDrawable layers) originalBackground.setCallback(layers);
    }

    boolean isRunning() { return running; }

    boolean canAnimate(float progress) {
        return GlassPlayerMorph.isIntermediate(progress) && ValueAnimator.areAnimatorsEnabled()
                && mini.getWidth() > 0 && mini.getHeight() > 0
                && player.getWidth() > 0 && player.getHeight() > 0;
    }

    void invalidate() {
        sheet.invalidate();
        player.invalidate();
    }

    void update(float progress, GlassDrawable miniGlass) {
        boolean animate = canAnimate(progress);
        if (animate) {
            mini.getDrawingRect(miniBounds);
            player.offsetDescendantRectToMyCoords(mini, miniBounds);
        }
        boolean moving = frame.update(progress, animate, miniBounds.left, miniBounds.top,
                miniBounds.right, miniBounds.bottom, player.getWidth(), player.getHeight());
        miniGlass.setAlpha(frame.miniAlpha);
        surface.setAlpha(frame.glassAlpha);
        if (!moving) {
            restore();
            return;
        }
        if (clip.left != frame.left || clip.top != frame.top || clip.right != frame.right
                || clip.bottom != frame.bottom || radius != frame.radius) {
            clip.set(frame.left, frame.top, frame.right, frame.bottom);
            radius = frame.radius;
            player.invalidateOutline();
        }
        if (!running) {
            running = true;
            originalOutline = player.getOutlineProvider();
            originalClip = player.getClipToOutline();
            player.setOutlineProvider(outline);
            player.setClipToOutline(true);
        }
        if (metadata != null) metadata.update(progress, frame.metadataAlpha);

        // Apple Music supplies the artwork, controls and palette. Fade the live glass
        // underneath them early so the renderer never filters a full-screen sheet.
        if (frame.glassAlpha > 0) {
            surfaceBounds.set(clip);
            sheet.offsetDescendantRectToMyCoords(player, surfaceBounds);
            surface.dark = miniGlass.dark;
            surface.setTransitionShape(surfaceBounds, radius);
        }
    }

    void release(GlassDrawable miniGlass) {
        restore();
        miniGlass.setAlpha(255);
        if (sheet.getBackground() == background) sheet.setBackground(originalBackground);
        if (surface.backdrop != null) surface.backdrop.release();
    }

    private void restore() {
        if (!running) return;
        running = false;
        if (metadata != null) metadata.release();
        player.setOutlineProvider(originalOutline);
        player.setClipToOutline(originalClip);
    }
}
