package app.southstar21.extension.instagram.liquidglass;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;
import java.util.HashSet;
import java.util.Set;

import app.hushgram.extension.instagram.misc.GlassTabBar;

/**
 * A sheet's glass: what's behind the sheet, the reel playing under a share sheet for one, blurred and drawn only
 * inside the sheet, under a frosted tint, a sheen down from the top and a bright rim round its rounded top. The
 * page outside the sheet stays sharp.
 *
 * <p>On Android 12 and newer the screens drawn before the sheet holder are recorded into a small node, a quarter
 * of the size, blurred there, at most every {@link GlassTabBar#RECORD_EVERY_MS}, the way the glass tab bar and the
 * top bar's glass see what's under them. A video in a SurfaceView is left out of the recording, as there; with
 * Liquid Glass's Blur videos on, Reels play in a view the recording can see. Below Android 12, or while a
 * recording fails, the glass is the tint alone.
 */
final class SheetGlass extends Drawable {
    private static final int DOWNSAMPLE = 4;
    private static final float BLUR_DP = 26f;
    private static final float CORNER_DP = 30f;

    /** Tint top and bottom, sheen and rim, dark and light. */
    private static final int DARK_TOP = 0x6b788096, DARK_BOTTOM = 0x9e181b26, DARK_SHEEN = 0x38ffffff, DARK_RIM = 0x99ffffff;
    private static final int LIGHT_TOP = 0x99ffffff, LIGHT_BOTTOM = 0xc7eef1f7, LIGHT_SHEEN = 0x66ffffff, LIGHT_RIM = 0xe6ffffff;

    private final WeakReference<View> surface;
    private final WeakReference<ViewGroup> holder;
    private final float density;
    boolean dark;

    private final Paint tint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint sheen = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint rim = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path shape = new Path();
    private final RectF box = new RectF();
    private final Set<View> paths = new HashSet<>();
    private final int[] surfaceAt = new int[2];
    private final int[] parentAt = new int[2];
    private int shapedWidth = -1, shapedHeight = -1;
    private boolean shapedDark;

    private RenderNode node;
    private boolean recorded;
    private long recordedAt;
    private float recordedX, recordedY;
    /** Throws in a row; the recording rests after a few, so a broken one isn't tried every frame. */
    private int failures;

    SheetGlass(View surface, ViewGroup holder, boolean dark, float density) {
        this.surface = new WeakReference<>(surface);
        this.holder = new WeakReference<>(holder);
        this.dark = dark;
        this.density = density;
        rim.setStyle(Paint.Style.STROKE);
        rim.setStrokeWidth(Math.max(1f, 1.5f * density));
    }

    /** Records what's behind the sheet again when it's due. Called before each frame while the sheet is up. */
    void refresh() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S || failures > 5) return;
        long now = SystemClock.uptimeMillis();
        if (now - recordedAt < GlassTabBar.RECORD_EVERY_MS) return;
        View sheet = surface.get();
        ViewGroup sheets = holder.get();
        if (sheet == null || sheets == null || !(sheets.getParent() instanceof ViewGroup)) return;
        int width = sheet.getWidth(), height = sheet.getHeight();
        if (width <= 0 || height <= 0) return;
        recordedAt = now;
        ViewGroup parent = (ViewGroup) sheets.getParent();
        try {
            sheet.getLocationInWindow(surfaceAt);
            parent.getLocationInWindow(parentAt);
            float x = surfaceAt[0] - parentAt[0];
            float y = surfaceAt[1] - parentAt[1];
            float scale = 1f / DOWNSAMPLE;
            RenderNode backdrop = node;
            if (backdrop == null) {
                backdrop = new RenderNode("hushgram-sheet-glass");
                float blur = BLUR_DP * density * scale;
                ColorMatrix saturate = new ColorMatrix();
                saturate.setSaturation(1.6f);
                backdrop.setRenderEffect(RenderEffect.createChainEffect(
                        RenderEffect.createColorFilterEffect(new ColorMatrixColorFilter(saturate)),
                        RenderEffect.createBlurEffect(blur, blur, Shader.TileMode.CLAMP)));
                node = backdrop;
            }
            int nodeWidth = Math.max(1, (int) Math.ceil(width * scale));
            int nodeHeight = Math.max(1, (int) Math.ceil(height * scale));
            backdrop.setPosition(0, 0, nodeWidth, nodeHeight);
            int index = parent.indexOfChild(sheets);
            Canvas recording = backdrop.beginRecording(nodeWidth, nodeHeight);
            try {
                recording.scale(scale, scale);
                recording.translate(-x, -y);
                recording.clipRect(x, y, x + width, y + height);
                recording.drawColor(dark ? 0xff101218 : 0xfff4f5f8);
                GlassTabBar.surfacePaths(parent, index, paths);
                for (int i = 0; i < index; i++) {
                    View screen = parent.getChildAt(i);
                    if (screen.getVisibility() != View.VISIBLE || screen.getWidth() <= 0) continue;
                    if (screen.getBottom() <= y || screen.getTop() >= y + height) continue;
                    GlassTabBar.drawLeavingOutSurfaces(recording, screen, paths, 0);
                }
            } finally {
                backdrop.endRecording();
            }
            recorded = true;
            recordedX = x;
            recordedY = y;
            failures = 0;
            invalidateSelf();
        } catch (Throwable failure) {
            recorded = false;
            failures++;
        }
    }

    @Override
    public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        if (bounds.isEmpty()) return;
        shape(bounds);
        int saved = canvas.save();
        try {
            canvas.clipPath(shape);
            if (recorded && node != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && canvas.isHardwareAccelerated()) {
                int inner = canvas.save();
                canvas.translate(bounds.left, bounds.top);
                canvas.scale(DOWNSAMPLE, DOWNSAMPLE);
                canvas.drawRenderNode(node);
                canvas.restoreToCount(inner);
            }
            canvas.drawRect(bounds, tint);
            canvas.drawRect(bounds.left, bounds.top, bounds.right, bounds.top + Math.min(bounds.height(), 140 * density), sheen);
        } finally {
            canvas.restoreToCount(saved);
        }
        canvas.drawPath(shape, rim);
    }

    /** The rounded top, the paints' gradients, made again only when the size or the theme changed. */
    private void shape(Rect bounds) {
        if (bounds.width() == shapedWidth && bounds.height() == shapedHeight && dark == shapedDark) return;
        shapedWidth = bounds.width();
        shapedHeight = bounds.height();
        shapedDark = dark;
        float corner = CORNER_DP * density;
        float inset = rim.getStrokeWidth() / 2f;
        box.set(bounds.left + inset, bounds.top + inset, bounds.right - inset, bounds.bottom + corner);
        shape.reset();
        shape.addRoundRect(box, new float[]{corner, corner, corner, corner, 0, 0, 0, 0}, Path.Direction.CW);
        tint.setShader(new LinearGradient(0, bounds.top, 0, bounds.bottom,
                dark ? DARK_TOP : LIGHT_TOP, dark ? DARK_BOTTOM : LIGHT_BOTTOM, Shader.TileMode.CLAMP));
        sheen.setShader(new LinearGradient(0, bounds.top, 0, bounds.top + 140 * density,
                dark ? DARK_SHEEN : LIGHT_SHEEN, 0x00ffffff, Shader.TileMode.CLAMP));
        rim.setShader(new LinearGradient(0, bounds.top, 0, bounds.top + 90 * density,
                dark ? DARK_RIM : LIGHT_RIM, 0x14ffffff, Shader.TileMode.CLAMP));
    }

    @Override public void setAlpha(int alpha) { }
    @Override public void setColorFilter(ColorFilter filter) { }
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
}
