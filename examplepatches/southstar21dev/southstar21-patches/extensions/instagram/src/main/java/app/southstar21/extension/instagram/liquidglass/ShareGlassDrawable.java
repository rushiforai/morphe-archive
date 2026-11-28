package app.southstar21.extension.instagram.liquidglass;

import android.annotation.SuppressLint;
import android.graphics.BlendMode;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.PorterDuff;
import android.graphics.RecordingCanvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.SystemClock;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;

/**
 * The share sheet's glass, iOS 26 style: a sheet of frosted glass as wide as the screen with
 * rounded top corners, its bottom running off the screen.
 * <p>
 * It is the background of the sheet's content root, the view Instagram slides up and down, so it
 * follows every open, drag and close exactly. Each time it draws, it records everything drawn
 * below the sheet (the siblings under it at every level up to the window, minus the bottom
 * sheet's dimmer) into a RenderNode at reduced resolution, blurs it strongly, lays the material
 * on top and adds a fine rim along the top edge. Only the part of the sheet on screen is drawn.
 * <p>
 * The finished glass is kept in a RenderNode ({@link #sheetNode()}) that the bottom action row's
 * {@link Band} draws again under the row, so the row sits on the same glass without a seam.
 * Android 12 gets the blurred glass, older versions an opaque material (and no glass under the
 * action row or below the container).
 */
@SuppressLint("NewApi")
final class ShareGlassDrawable extends Drawable {
    /** iOS 26's sheet corner. */
    static final float CORNER_DP = 30f;
    /** A thick frosted material: the feed behind shows as soft color only. */
    private static final float BLUR_DP = 44f;
    /** The backdrop is recorded and blurred at this fraction of the screen's resolution. */
    private static final float SCALE = 0.4f;
    /** How far down the top rim and sheen run. */
    private static final float RIM_FADE_DP = 28f;
    private static final float SHEEN_DP = 90f;

    private final View host;
    private final float density;
    private View skip;
    private boolean dark;

    private final int[] loc = new int[2];

    private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint tintPaint = new Paint();
    private final Paint sheenPaint = new Paint();
    private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();
    private final Matrix matrix = new Matrix();
    private LinearGradient sheenShader, rimShader;
    private boolean shadersDark;

    private RenderNode backdrop;
    private RenderNode sheet;
    private RenderEffect effect;
    private int effectBlur = -1;
    private final Outline outline = new Outline();
    private int outlineW = -1, outlineH = -1;
    private int drawnH;

    /** How often to look again for SurfaceViews below the sheet. */
    private static final long SURFACE_SCAN_MS = 500;
    private final java.util.ArrayList<SurfaceView> surfaces = new java.util.ArrayList<>();
    private long surfacesAt = -SURFACE_SCAN_MS;

    ShareGlassDrawable(View host, float density) {
        this.host = host;
        this.density = density;
        rimPaint.setStyle(Paint.Style.STROKE);
    }

    /** @param skip a view below the sheet that the glass must not show (the dimmer) */
    void setSkip(View skip) {
        this.skip = skip;
    }

    void setDark(boolean dark) {
        if (this.dark == dark) return;
        this.dark = dark;
        invalidateSelf();
    }

    float cornerPx() {
        return CORNER_DP * density;
    }

    /** The glass as last drawn, in the host's coordinates, or null before the first draw. */
    RenderNode sheetNode() {
        return sheet != null && drawnH > 0 ? sheet : null;
    }

    /**
     * The height of glass needed, from the sheet's top down to the bottom of the window: the
     * host draws what lies inside it, the {@link Strip} what lies below the container.
     */
    private int visibleHeight(Rect b) {
        host.getLocationInWindow(loc);
        return Math.max(0, host.getRootView().getHeight() - (loc[1] + b.top));
    }

    @Override
    public void draw(Canvas canvas) {
        Rect b = getBounds();
        if (b.isEmpty()) return;
        int h = visibleHeight(b);
        if (h <= 0) {
            drawnH = 0;
            return;
        }
        int w = b.width();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && canvas.isHardwareAccelerated()
                && host.getParent() instanceof ViewGroup) {
            record(w, h);
            int save = canvas.save();
            canvas.translate(b.left, b.top);
            canvas.drawRenderNode(sheet);
            canvas.restoreToCount(save);
            return;
        }
        // No blur: an opaque material with the same shape.
        float r = cornerPx();
        fillPaint.setColor(NavbarStyle.get().material(dark, 0xF6));
        rect.set(b.left, b.top, b.right, b.top + h + r);
        int save = canvas.save();
        canvas.clipRect(b.left, b.top, b.right, b.top + h);
        canvas.drawRoundRect(rect, r, r, fillPaint);
        canvas.restoreToCount(save);
    }

    private int materialAlpha() {
        return dark ? 0xB8 : 0xC4;
    }

    /** Records the blurred backdrop and the finished glass, {@code w} by {@code h} at the host's top. */
    private void record(int w, int h) {
        if (backdrop == null) {
            backdrop = new RenderNode("ShareGlassBackdrop");
            sheet = new RenderNode("ShareGlass");
        }
        float blur = BLUR_DP * density;
        // What the blur reaches past the sheet's edges, limited to the window.
        View root = host.getRootView();
        float left = Math.max(-blur, -loc[0]);
        float top = Math.max(-blur, -loc[1]);
        float right = Math.min(w + blur, root.getWidth() - loc[0]);
        float bottom = Math.min(h + blur, root.getHeight() - loc[1]);
        if (right <= left || bottom <= top) {
            left = 0;
            top = 0;
            right = w;
            bottom = h;
        }
        int nw = Math.max(1, (int) Math.ceil((right - left) * SCALE));
        int nh = Math.max(1, (int) Math.ceil((bottom - top) * SCALE));

        backdrop.setPosition(0, 0, nw, nh);
        RecordingCanvas rc = backdrop.beginRecording(nw, nh);
        try {
            rc.scale(SCALE, SCALE);
            rc.translate(-left, -top);
            recordBelow(rc, left, top, right, bottom);
            rc.drawColor(dark ? Color.BLACK : Color.WHITE, PorterDuff.Mode.DST_OVER);
        } finally {
            backdrop.endRecording();
        }
        int blurPx = Math.max(1, Math.round(blur * SCALE));
        if (effect == null || effectBlur != blurPx) {
            effectBlur = blurPx;
            ColorMatrix saturation = new ColorMatrix();
            saturation.setSaturation(1.6f);
            effect = RenderEffect.createColorFilterEffect(new ColorMatrixColorFilter(saturation),
                    RenderEffect.createBlurEffect(blurPx, blurPx, Shader.TileMode.CLAMP));
        }
        backdrop.setRenderEffect(effect);

        float r = cornerPx();
        sheet.setPosition(0, 0, w, h);
        if (w != outlineW || h != outlineH) {
            outlineW = w;
            outlineH = h;
            // Rounded at the top only: the bottom corners are past the node's bottom edge.
            outline.setRoundRect(0, 0, w, Math.round(h + r), r);
            sheet.setOutline(outline);
            sheet.setClipToOutline(true);
        }
        RecordingCanvas sc = sheet.beginRecording(w, h);
        try {
            int save = sc.save();
            sc.translate(left, top);
            sc.scale(1f / SCALE, 1f / SCALE);
            sc.drawRenderNode(backdrop);
            sc.restoreToCount(save);

            NavbarStyle style = NavbarStyle.get();
            tintPaint.setColor(style.material(dark, materialAlpha()));
            sc.drawRect(0, 0, w, h, tintPaint);
            drawSheenAndRim(sc, w, h, r);
        } finally {
            sheet.endRecording();
        }
        drawnH = h;
    }

    private void drawSheenAndRim(Canvas c, int w, int h, float r) {
        if (sheenShader == null || shadersDark != dark) {
            shadersDark = dark;
            sheenShader = new LinearGradient(0, 0, 0, 1,
                    Color.argb(dark ? 0x10 : 0x30, 0xFF, 0xFF, 0xFF), Color.TRANSPARENT, Shader.TileMode.CLAMP);
            rimShader = new LinearGradient(0, 0, 0, 1,
                    Color.argb(dark ? 0x60 : 0xF0, 0xFF, 0xFF, 0xFF), Color.TRANSPARENT, Shader.TileMode.CLAMP);
            sheenPaint.setShader(sheenShader);
            rimPaint.setShader(rimShader);
        }
        float sheen = SHEEN_DP * density;
        matrix.setScale(1f, sheen);
        sheenShader.setLocalMatrix(matrix);
        c.drawRect(0, 0, w, Math.min(h, sheen), sheenPaint);

        float stroke = Math.max(1f, 0.8f * density);
        rimPaint.setStrokeWidth(stroke);
        float fade = RIM_FADE_DP * density;
        matrix.setScale(1f, fade);
        rimShader.setLocalMatrix(matrix);
        float half = stroke / 2f;
        rect.set(half, half, w - half, h + r);
        c.drawRoundRect(rect, r - half, r - half, rimPaint);
    }

    /**
     * Draws, in the host's coordinates, every sibling drawn below the host or below one of its
     * ancestors, up to the window, that overlaps the recorded area.
     */
    private void recordBelow(RecordingCanvas rc, float minX, float minY, float maxX, float maxY) {
        findSurfaces();
        View path = host;
        // The host's top left in the current parent's coordinates.
        float px = host.getLeft() + host.getTranslationX();
        float py = host.getTop() + host.getTranslationY();
        while (path.getParent() instanceof ViewGroup) {
            ViewGroup p = (ViewGroup) path.getParent();
            int idx = p.indexOfChild(path);
            for (int i = 0; i < idx; i++) {
                View child = p.getChildAt(i);
                if (child == skip || child instanceof EdgeBlurView) continue;
                if (child.getVisibility() != View.VISIBLE || child.getAlpha() == 0f) continue;
                float left = child.getLeft() + child.getTranslationX() - px;
                float top = child.getTop() + child.getTranslationY() - py;
                if (left >= maxX || left + child.getWidth() <= minX
                        || top >= maxY || top + child.getHeight() <= minY) continue;
                int save;
                float alpha = child.getAlpha();
                if (alpha < 1f) {
                    save = rc.saveLayerAlpha(left, top, left + child.getWidth(), top + child.getHeight(),
                            Math.round(alpha * 255f));
                } else {
                    save = rc.save();
                }
                rc.translate(left, top);
                drawWithoutSurfaces(rc, child);
                rc.restoreToCount(save);
            }
            // Up a level: the host's position in the grandparent's coordinates.
            px += p.getLeft() + p.getTranslationX() - p.getScrollX();
            py += p.getTop() + p.getTranslationY() - p.getScrollY();
            path = p;
        }
    }

    /**
     * The SurfaceViews in the window (a reel playing in Instagram's SurfaceView player), looked
     * for again at most every {@link #SURFACE_SCAN_MS}.
     */
    private void findSurfaces() {
        long now = SystemClock.uptimeMillis();
        if (now - surfacesAt < SURFACE_SCAN_MS) return;
        surfacesAt = now;
        surfaces.clear();
        collectSurfaces(host.getRootView());
    }

    private void collectSurfaces(View v) {
        if (v == host || v.getVisibility() != View.VISIBLE) return;
        if (v instanceof SurfaceView) {
            surfaces.add((SurfaceView) v);
            return;
        }
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0, n = g.getChildCount(); i < n; i++) collectSurfaces(g.getChildAt(i));
        }
    }

    /** Whether {@code v} is one of the SurfaceViews found, or holds one. */
    private boolean holdsSurface(View v) {
        for (int i = 0, n = surfaces.size(); i < n; i++) {
            for (Object p = surfaces.get(i); p instanceof View; p = ((View) p).getParent()) {
                if (p == v) return true;
            }
        }
        return false;
    }

    /**
     * Draws {@code v}, at the canvas origin, without the SurfaceViews in it. A SurfaceView draws a
     * hole down to its video layer, and recorded into the glass that hole would cut through the
     * whole sheet: the video showed through it sharp, around a stray square of backdrop (issue
     * #23). Views holding one are drawn piece by piece instead (background, then children), and
     * the video's place is left to the material's base color.
     */
    private void drawWithoutSurfaces(RecordingCanvas rc, View v) {
        if (v instanceof SurfaceView) return;
        if (surfaces.isEmpty() || !(v instanceof ViewGroup) || !holdsSurface(v)) {
            v.draw(rc);
            return;
        }
        Drawable bg = v.getBackground();
        if (bg != null) {
            bg.setBounds(0, 0, v.getWidth(), v.getHeight());
            bg.draw(rc);
        }
        ViewGroup g = (ViewGroup) v;
        int save = rc.save();
        if (g.getClipChildren()) rc.clipRect(0, 0, g.getWidth(), g.getHeight());
        rc.translate(-g.getScrollX(), -g.getScrollY());
        for (int i = 0, n = g.getChildCount(); i < n; i++) {
            View c = g.getChildAt(i);
            if (c.getVisibility() != View.VISIBLE || c.getAlpha() == 0f) continue;
            int s = c.getAlpha() < 1f
                    ? rc.saveLayerAlpha(c.getLeft(), c.getTop(), c.getRight(), c.getBottom(),
                    Math.round(c.getAlpha() * 255f))
                    : rc.save();
            rc.translate(c.getLeft(), c.getTop());
            if (!c.getMatrix().isIdentity()) rc.concat(c.getMatrix());
            drawWithoutSurfaces(rc, c);
            rc.restoreToCount(s);
        }
        rc.restoreToCount(save);
    }

    @Override
    public void getOutline(Outline out) {
        Rect b = getBounds();
        float r = cornerPx();
        out.setRoundRect(b.left, b.top, b.right, Math.round(b.bottom + r), r);
        out.setAlpha(0f);
    }

    @Override
    public void setAlpha(int alpha) {
    }

    @Override
    public void setColorFilter(ColorFilter colorFilter) {
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }

    @Override
    public boolean getPadding(Rect padding) {
        padding.set(0, 0, 0, 0);
        return false;
    }

    /**
     * Background of the bottom action row. The row stays at the bottom of the screen while the
     * sheet is half open, over the recipients. It shows the sheet's own glass again, exactly
     * where it lies under the row (so there is no seam), and fades in over its top edge, so the
     * people scrolling under the row soften away instead of being cut off.
     */
    static final class Band extends Drawable {
        private static final float FADE_DP = 22f;

        private final View view;
        private final View sheetHost;
        private final ShareGlassDrawable glass;
        private final float density;
        private final Paint maskPaint = new Paint();
        private final Matrix matrix = new Matrix();
        private final float[] off = new float[2];
        private LinearGradient mask;

        Band(View view, View sheetHost, ShareGlassDrawable glass, float density) {
            this.view = view;
            this.sheetHost = sheetHost;
            this.glass = glass;
            this.density = density;
            maskPaint.setBlendMode(BlendMode.DST_IN);
        }

        /** {@code v}'s top left in {@code ancestor}'s coordinates, or false if it isn't inside it. */
        static boolean offsetIn(View v, View ancestor, float[] out) {
            float x = 0f, y = 0f;
            while (v != ancestor) {
                x += v.getLeft() + v.getTranslationX();
                y += v.getTop() + v.getTranslationY();
                if (!(v.getParent() instanceof View)) return false;
                v = (View) v.getParent();
                if (v != ancestor) {
                    x -= v.getScrollX();
                    y -= v.getScrollY();
                }
            }
            out[0] = x;
            out[1] = y;
            return true;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty() || Build.VERSION.SDK_INT < Build.VERSION_CODES.S
                    || !canvas.isHardwareAccelerated()) return;
            RenderNode sheet = glass.sheetNode();
            if (sheet == null || !offsetIn(view, sheetHost, off)) return;
            float fade = Math.min(b.height() / 3f, FADE_DP * density);

            int save = canvas.saveLayer(b.left, b.top, b.right, b.bottom, null);
            int s = canvas.save();
            canvas.translate(-off[0], -off[1]);
            canvas.drawRenderNode(sheet);
            canvas.restoreToCount(s);

            if (mask == null) {
                mask = new LinearGradient(0, 0, 0, 1, Color.TRANSPARENT, Color.BLACK, Shader.TileMode.CLAMP);
                maskPaint.setShader(mask);
            }
            matrix.setScale(1f, fade);
            matrix.postTranslate(0f, b.top);
            mask.setLocalMatrix(matrix);
            canvas.drawRect(b.left, b.top, b.right, b.top + fade, maskPaint);
            canvas.restoreToCount(save);
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }

        @Override
        public boolean getPadding(Rect padding) {
            padding.set(0, 0, 0, 0);
            return false;
        }
    }

    /**
     * The glass below the bottom sheet container, over the gesture bar, drawn in the window's
     * overlay: the same glass, continued down to the bottom of the screen.
     */
    static final class Strip extends Drawable {
        private final ShareGlassDrawable glass;
        private final View container;
        private final View sheet;
        private final int[] containerLoc = new int[2];
        private final int[] sheetLoc = new int[2];

        Strip(ShareGlassDrawable glass, View container, View sheet) {
            this.glass = glass;
            this.container = container;
            this.sheet = sheet;
        }

        @Override
        public void draw(Canvas canvas) {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S || !canvas.isHardwareAccelerated()
                    || !sheet.isAttachedToWindow()) return;
            RenderNode node = glass.sheetNode();
            if (node == null) return;
            Rect b = getBounds();
            container.getLocationInWindow(containerLoc);
            sheet.getLocationInWindow(sheetLoc);
            int top = Math.max(containerLoc[1] + container.getHeight(), sheetLoc[1]);
            if (top >= b.bottom) return;
            int save = canvas.save();
            canvas.clipRect(b.left, top, b.right, b.bottom);
            canvas.translate(sheetLoc[0], sheetLoc[1]);
            canvas.drawRenderNode(node);
            canvas.restoreToCount(save);
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
