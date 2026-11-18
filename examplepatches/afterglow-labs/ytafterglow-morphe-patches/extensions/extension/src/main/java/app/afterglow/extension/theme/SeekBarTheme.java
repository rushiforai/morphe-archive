package app.afterglow.extension.theme;

import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Shader;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.RectF;
import android.view.View;
import java.lang.ref.WeakReference;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.GlowStyle;
import app.afterglow.extension.settings.SeekMotion;
import app.afterglow.extension.settings.ScrubberImage;
import app.afterglow.extension.settings.ThemePalette;
import app.afterglow.extension.settings.ThemeRole;
import app.afterglow.extension.settings.ThemeStore;
import app.afterglow.extension.sponsorblock.SponsorMarkers;

/** Native seek-bar color boundary and the verified final scrubber-circle draw. */
public final class SeekBarTheme {
    private static WeakReference<View> bar = new WeakReference<>(null);
    private static final Paint SCRUBBER = new Paint(Paint.ANTI_ALIAS_FLAG);
    private static final Paint IMAGE = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private static final RectF IMAGE_BOUNDS = new RectF();
    private static final java.util.Map<View, SeekMotion> MOTION = new java.util.WeakHashMap<>();
    private static final java.util.Map<View, Frame> FRAMES = new java.util.WeakHashMap<>();
    private static final class Frame {
        final Paint paint = new Paint();
        float x, y, radius;
        boolean pending;
    }
    private SeekBarTheme() {}
    public static void begin(View view) {
        if (bar.get() != view) bar = new WeakReference<>(view);
        Frame frame = FRAMES.get(view);
        if (frame == null) { frame = new Frame(); FRAMES.put(view, frame); }
        frame.pending = false;
    }

    /** Runs after the native canvas restore, so glow follows the track's actual geometry. */
    public static void finish(View view, Canvas canvas) {
        Frame frame = FRAMES.get(view);
        try {
            GlowStyle style = GlowStyle.current();
            if (!InstalledTweaks.has("glow") || !style.enabled || !style.seekBar || !(view instanceof SeekBarHost)) return;
            SeekBarHost host = (SeekBarHost) view;
            Rect bounds = host.afterglow_trackBounds();
            if (bounds == null || bounds.isEmpty() || view.getAlpha() == 0) return;
            int alpha = frame != null && frame.pending ? frame.paint.getAlpha() : 0;
            if (alpha == 0) return;
            float right = Math.max(bounds.left, Math.min(bounds.right, host.afterglow_playedPosition()));
            Integer color = ThemeStore.snapshot().palette.color(ThemeRole.SEEK_PLAYED);
            if (right > bounds.left) GlowRenderer.track(canvas, bounds.left, bounds.centerY()-view.getResources().getDisplayMetrics().density,
                    right, bounds.centerY()+view.getResources().getDisplayMetrics().density,
                    withAlpha(color == null ? 0xFFFF0033 : color, alpha), style, view.getResources().getDisplayMetrics().density);
        } catch (Throwable error) { Afterglow.error("SeekBarTheme.trackGlow", error); }
        finally {
            SponsorMarkers.draw(view, canvas);
            // The native draw only saves/restores the canvas; it does not transform
            // coordinates. Keep the thumb above both track bloom and segment markers.
            if (frame != null && frame.pending) {
                frame.pending = false;
                renderScrubber(canvas, frame.x, frame.y, frame.radius, frame.paint);
            }
        }
    }
    private static int role(int original, ThemeRole role) {
        if (!InstalledTweaks.has("seek-bar")) return original;
        try {
            return SeekBarColorPolicy.resolve(original, ThemeStore.snapshot().palette, role, true,
                    role != ThemeRole.SEEK_BUFFERED && AfterglowPrefs.getBool("redProgressBar"));
        } catch (Throwable error) { Afterglow.error("SeekBarTheme.color", error); return original; }
    }
    public static int played(int original) { return role(original, ThemeRole.SEEK_PLAYED); }
    public static int buffered(int original) { return role(original, ThemeRole.SEEK_BUFFERED); }
    public static int live(int original) { return role(original, ThemeRole.SEEK_LIVE); }
    public static int scrubber(int original) {
        if (!InstalledTweaks.has("seek-bar")) return original;
        return role(original, SeekBarColorPolicy.scrubberRole(isCurrentVideoLive()));
    }

    // Bound to the pinned, original VideoInformation methods by SeekBarThemePatch. The
    // original hook owns response extraction; no renderer style bit is treated as "live".
    private static String nativeCurrentVideoId() { return ""; }
    private static String nativeResponseVideoId() { return ""; }
    private static boolean nativeResponseIsLive() { return false; }
    private static boolean isCurrentVideoLive() {
        try {
            String current = nativeCurrentVideoId(), response = nativeResponseVideoId();
            return SeekBarColorPolicy.liveForVideo(current, response, nativeResponseIsLive())
                    // Background prefetch or a player transition must not color another video's thumb.
                    && current.equals(nativeCurrentVideoId()) && response.equals(nativeResponseVideoId());
        } catch (Throwable error) { Afterglow.error("SeekBarTheme.liveVideo", error); return false; }
    }
    public static LinearGradient gradient(LinearGradient original) {
        if (!InstalledTweaks.has("seek-bar")) return original;
        try {
            ThemePalette palette = ThemeStore.snapshot().palette;
            java.util.ArrayList<Integer> values = new java.util.ArrayList<>();
            boolean rainbow = ThemeStore.seekBarRainbowEnabled();
            if (rainbow) for (ThemeRole role : new ThemeRole[]{ThemeRole.GRADIENT_START, ThemeRole.OVERLAY_CONTROL,
                    ThemeRole.TAB_ICON, ThemeRole.SEEK_PLAYED, ThemeRole.ACCENT, ThemeRole.GRADIENT_END}) {
                Integer color = palette.color(role); if (color != null) values.add(color);
            }
            if (values.size() < 2) {
                Integer color = palette.color(ThemeRole.SEEK_PLAYED);
                if (color == null && !AfterglowPrefs.getBool("redProgressBar")) return original;
                int solid = color == null ? 0xFFFF0000 : color;
                values.clear(); values.add(solid); values.add(solid);
            }
            int[] colors = new int[values.size()]; for (int i=0; i<colors.length; i++) colors[i] = values.get(i);
            float density = Afterglow.context().getResources().getDisplayMetrics().density;
            return new LinearGradient(0, 0, 1200*density, 0, colors, null, Shader.TileMode.REPEAT);
        } catch (Throwable error) { Afterglow.error("SeekBarTheme.gradient", error); return original; }
    }
    public static void drawScrubber(Canvas canvas, float x, float y, float radius, Paint original) {
        View view = bar.get();
        Frame frame = view == null ? null : FRAMES.get(view);
        if (frame == null || (!InstalledTweaks.has("seek-bar") && !InstalledTweaks.has("glow")
                && !InstalledTweaks.has("sponsorblock"))) {
            canvas.drawCircle(x, y, radius, original); return;
        }
        frame.x = x; frame.y = y; frame.radius = radius; frame.paint.set(original); frame.pending = true;
    }
    private static void renderScrubber(Canvas canvas, float x, float y, float radius, Paint original) {
        final float originalX = x, originalRadius = radius;
        try {
            SCRUBBER.set(original);
            View view = bar.get();
            if (InstalledTweaks.has("seek-bar")) {
                float multiplier = 1 + Math.max(0, Math.min(100, AfterglowPrefs.getInt("seekBarScrubberSize"))) / 100f;
                radius *= multiplier;
                int color = scrubber(original.getColor());
                if (color != original.getColor()) { SCRUBBER.setColor(withAlpha(color, original.getAlpha())); SCRUBBER.setShader(null); }
                if (view != null) {
                    SeekMotion motion = MOTION.get(view);
                    if (motion == null) { motion = new SeekMotion(); MOTION.put(view, motion); }
                    long now = android.os.SystemClock.uptimeMillis();
                    x = motion.update(x, now, AfterglowPrefs.getBool("seekBarAnimated") && !view.isPressed());
                    if (motion.active(now)) view.postInvalidateOnAnimation();
                }
            }
            GlowStyle style = GlowStyle.current();
            if (InstalledTweaks.has("glow") && style.enabled && style.scrubber && radius > 0) {
                float density = Afterglow.context().getResources().getDisplayMetrics().density;
                GlowRenderer.circle(canvas, x, y, radius, SCRUBBER.getColor(), style, density);
            }
            Bitmap image = InstalledTweaks.has("seek-bar") ? ScrubberImage.current() : null;
            if (image != null && radius > 0) {
                float scale = radius * 2 / Math.max(image.getWidth(), image.getHeight());
                float halfWidth = image.getWidth()*scale/2, halfHeight = image.getHeight()*scale/2;
                IMAGE_BOUNDS.set(x-halfWidth, y-halfHeight, x+halfWidth, y+halfHeight);
                IMAGE.setAlpha(original.getAlpha()); canvas.drawBitmap(image, null, IMAGE_BOUNDS, IMAGE);
            } else canvas.drawCircle(x, y, radius, SCRUBBER);
        } catch (Throwable error) { Afterglow.error("SeekBarTheme.scrubber", error); canvas.drawCircle(originalX, y, originalRadius, original); }
    }
    private static int withAlpha(int color, int alpha) { return (color & 0xFFFFFF) | ((color >>> 24) * alpha / 255 << 24); }
}
