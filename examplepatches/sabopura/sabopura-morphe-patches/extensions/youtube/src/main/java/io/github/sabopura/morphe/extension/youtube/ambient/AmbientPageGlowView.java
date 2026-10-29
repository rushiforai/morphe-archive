package io.github.sabopura.morphe.extension.youtube.ambient;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorMatrix;
import android.graphics.drawable.ColorDrawable;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Build;
import android.os.Looper;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.Choreographer;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.AnimationUtils;

import java.lang.ref.WeakReference;

import io.github.sabopura.morphe.extension.youtube.shared.PlayerHooks;
import io.github.sabopura.morphe.extension.youtube.shared.Views;

/**
 * Window-level layer that lets the video's light spill out of the player onto the page,
 * the status bar area and the panels around it, like the desktop Ambient light extension.
 * It sits above the page content and below the danmaku overlay and never draws over the
 * player.
 *
 * <p>Colour levels add the light with a SCREEN blend in dark theme (the "maximum" level also
 * lays a translucent colour veil over the page). The theater level instead makes the page
 * background itself transparent ({@link SeeThroughPage}) and paints the light underneath
 * the page, so YouTube's own text, icons and thumbnails sit directly on the light in either
 * theme. Where the background hook is missing it falls back to drawing the page again on top
 * of the light with its background keyed out (Android 13+) or a LIGHTEN/DARKEN composite.
 *
 * <p>While the user scrolls or touches the page the light is toned down, and it returns
 * gradually once they have been idle for a while.
 */
final class AmbientPageGlowView extends View {
    private static final long FADE_DURATION_MS = 450L;
    /** How quickly the light gets out of the way when the user starts interacting. */
    private static final long DIM_DURATION_MS = 180L;
    /** How slowly the light returns after the idle delay. */
    private static final long RESTORE_DURATION_MS = 1_600L;
    /** Remaining light while the user is interacting. */
    private static final float INTERACTION_LEVEL = 0.25f;
    /** Light-theme pages are white; a plain tint must stay subtle there. */
    private static final float LIGHT_THEME_ALPHA = 0.45f;
    /** While paused the page copy still follows page changes at this interval. */
    private static final long IDLE_REFRESH_MS = 250L;

    private final Paint lightPaint = new Paint(Paint.FILTER_BITMAP_FLAG | Paint.DITHER_FLAG);
    private final Paint coverPaint = new Paint(Paint.FILTER_BITMAP_FLAG | Paint.DITHER_FLAG);
    private final Paint blendPaint = new Paint(Paint.FILTER_BITMAP_FLAG | Paint.DITHER_FLAG);
    private final RectF destination = new RectF();
    private final Rect hole = new Rect();
    private final Object frameLock = new Object();
    private final Runnable restoreCheck = this::requestFrame;
    /** Theater light on its own surfaces underneath the window (see {@link LightLayers}). */
    private LightLayers pageLayers;
    private final java.util.List<Rect> pageRects = new java.util.ArrayList<>();
    private final java.util.List<Rect> rectPool = new java.util.ArrayList<>();
    private final Rect playerRect = new Rect();
    private final LightLayers.Painter pagePainter = canvas -> {
        paintLight(canvas, 0, 0, getWidth());
        paintOutsidePage(canvas);
    };
    /** True once that surface shows a frame; the page background is then left transparent. */
    private boolean surfaceShowing;
    private boolean surfaceFrameScheduled;
    private final Choreographer.FrameCallback surfaceFrame = frameTimeNanos -> renderSurface();
    /** The page is only drawn when YouTube redraws it; keep it see-through on those frames. */
    private final ViewTreeObserver.OnPreDrawListener preDrawListener = () -> {
        if (surfaceShowing) SeeThroughPage.keep();
        return true;
    };
    private final ViewTreeObserver.OnScrollChangedListener scrollListener =
            this::onScrollChanged;
    /** Scrolls count as the user's only this long after they touched the page. */
    private static final long TOUCH_SCROLL_WINDOW_MS = 3_000L;
    private long lastPageTouchUptime;
    /** Values of the last drawn frame, for the status row. */
    private static volatile float shownAlpha;
    private static volatile float shownFactor = 1f;
    private static volatile long shownInteractionUptime;
    /** Compact state for the on-screen diagnostics line. */
    static volatile String debugState = "-";
    static volatile long lastDrawUptime;

    /** Current strength and dim state for the status row. */
    static String statusLight() {
        long since = shownInteractionUptime == 0 ? -1
                : (SystemClock.uptimeMillis() - shownInteractionUptime) / 1000;
        return Math.round(shownAlpha * 100) + "% (dim " + Math.round(shownFactor * 100)
                + "%, idle " + since + "s)";
    }

    private void updateDebugState() {
        boolean hasFrame;
        synchronized (frameLock) {
            hasFrame = frontBitmap != null && frameWidth == getWidth()
                    && frameHeight == getHeight();
        }
        View watchPage = hostRef.get();
        android.graphics.drawable.Drawable hostBackground =
                watchPage == null ? null : watchPage.getBackground();
        debugState = "L" + Math.round(alpha * 100) + " d" + Math.round(interactionFactor * 100)
                + " t" + Math.round(targetAlpha * 100) + (hasFrame ? " frm" : " nofrm")
                + (behindPage ? " behind" : " over") + " host:"
                + (watchPage == null ? "none" : !watchPage.isAttachedToWindow() ? "detached"
                        : SeeThroughPage.isLightDrawable(hostBackground) ? "light"
                        : hostBackground == null ? "null"
                        : hostBackground.getClass().getSimpleName());
    }
    private boolean loggedInteracting;
    private final ViewTreeObserver.OnGlobalLayoutListener layoutListener = () -> {
        pageDirty = true;
        invalidate();
    };
    /** The keyed page copy is re-run at least this often even without scrolling. */
    private static final long PAGE_REFRESH_MS = 300L;
    private boolean pageDirty = true;
    private long lastPageRefreshUptime;
    private long lastThemeCheckUptime;
    private final PageKeyRenderer pageKey = new PageKeyRenderer();
    private WeakReference<View> pageRootRef = new WeakReference<>(null);
    /** The watch page (light is painted as its background) and the player inside it. */
    private WeakReference<View> hostRef = new WeakReference<>(null);
    private WeakReference<View> playerRef = new WeakReference<>(null);
    /** True while the light is drawn underneath a see-through page. */
    private boolean behindPage;
    private int backgroundColour = 0xFF0F0F0F;
    /** Brightest / darkest luma (0-1) of the current light frame. */
    private volatile float framePeak;
    private volatile float frameFloor = 1f;
    /** Strength of the page-coloured veil that keeps text readable over the light. */
    private float guard;
    // Scene-cut wave and breathing while paused (see AmbientLightSettings).
    private static final long WAVE_MS = 700L;
    private static final long BREATH_PERIOD_MS = 5_000L;
    private Bitmap waveFrom;
    private long waveStartUptime;
    private long waveDurationMs;
    /** 0 = the wave just started, 1 = done; computed once per frame. */
    private float waveProgress = 1f;
    private float breath = 1f;
    private final Runnable breathFrame = this::requestFrame;
    private final Paint wavePaint = new Paint();
    private final Paint falloffPaint = new Paint();
    private int falloffKey;
    /** White text needs the light below this luma; black text needs it above the other. */
    private static final float DARK_PAGE_MAX_LUMA = 0.5f;
    private static final float LIGHT_PAGE_MIN_LUMA = 0.6f;
    private final int[] hostLocation = new int[2];
    private final Rect hostRect = new Rect();

    private Bitmap frontBitmap;
    private Bitmap backBitmap;
    private final Rect frameHole = new Rect();
    /** The picture inside the player (without black bars), in window coordinates. */
    private final Rect frameContent = new Rect();
    /** Whether the bars above / below the picture may be covered (no text seen in them). */
    private boolean frameTopEdge;
    private boolean frameBottomEdge;
    /**
     * Light inside the player, between the video and YouTube's controls: it covers black bars
     * and fades the picture's edges into the light, so player and page read as one picture.
     */
    private LightLayers edgeLayers;
    private WeakReference<View> edgeAnchorRef = new WeakReference<>(null);
    private final java.util.List<Rect> edgeRects = new java.util.ArrayList<>();
    private final Rect edgePlayer = new Rect();
    private final Rect edgeContent = new Rect();
    private boolean edgeTop;
    private boolean edgeBottom;
    private final Rect featherBand = new Rect();
    private final Rect edgeClip = new Rect();
    private final Rect edgeInner = new Rect();
    /** One pixel of the light surfaces (they are a quarter of the screen's resolution). */
    private static final int EDGE_OVERLAP = 4;
    private final Paint featherPaint = new Paint();
    private final PorterDuffXfermode featherMode = new PorterDuffXfermode(PorterDuff.Mode.DST_IN);
    /** Fade masks of the bottom, left and right bands, rebuilt only when a band moves. */
    private final android.graphics.Shader[] featherShaders = new android.graphics.Shader[3];
    private final Rect[] featherKeys = {new Rect(), new Rect(), new Rect()};

    /** Depth of the fade over the picture's bottom edge (share of its height) and sides. */
    private static final float FEATHER_BOTTOM = 0.08f;
    private static final float FEATHER_SIDE = 0.05f;
    private static final int FEATHER_STRIPS = 12;
    private final LightLayers.Painter edgePainter = this::paintEdges;
    private long lastEdgeLogUptime;
    private int frameWidth;
    private int frameHeight;

    private float alpha;
    private float targetAlpha;
    private long lastAlphaUptime;
    private float interactionFactor = 1f;
    private long lastInteractionUptime;
    private long lastFactorUptime;
    private int colorFilterGeneration = -1;
    private Boolean darkTheme;
    /** Brightness (0-1) of YouTube's page background colour. */
    private float backgroundLuma = 0.059f;

    AmbientPageGlowView(Context context) {
        super(context);
        setClickable(false);
        setFocusable(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        setWillNotDraw(false);
        lightPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SCREEN));
    }

    /** Worker thread: reusable buffer for the next frame. */
    Bitmap obtainBackBuffer(int width, int height) {
        synchronized (frameLock) {
            Bitmap back = backBitmap;
            if (back != null && back.getWidth() == width && back.getHeight() == height) {
                backBitmap = null;
                return back;
            }
        }
        return Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
    }

    /** Worker thread: publishes a frame computed for a page of {@code width x height}. */
    void publish(Bitmap bitmap, Rect playerHole, Rect content, boolean topEdge,
                 boolean bottomEdge, int width, int height, boolean cut) {
        // Brightest and darkest areas of the light, for the readability guard of the
        // see-through page. Sampled here on the worker thread.
        // Percentiles rather than extremes: one bright spot next to the player must not
        // darken the whole page.
        int stepX = Math.max(1, bitmap.getWidth() / 12);
        int stepY = Math.max(1, bitmap.getHeight() / 20);
        int[] lumas = new int[(bitmap.getWidth() / stepX + 1) * (bitmap.getHeight() / stepY + 1)];
        int count = 0;
        for (int y = stepY / 2; y < bitmap.getHeight(); y += stepY) {
            for (int x = stepX / 2; x < bitmap.getWidth(); x += stepX) {
                lumas[count++] = AmbientMath.luma(bitmap.getPixel(x, y));
            }
        }
        if (count > 0) {
            java.util.Arrays.sort(lumas, 0, count);
            framePeak = lumas[Math.min(count - 1, count * 85 / 100)] / 255f;
            frameFloor = lumas[count * 15 / 100] / 255f;
        }
        synchronized (frameLock) {
            if (cut && frontBitmap != null && AmbientLightSettings.isSceneWaveEnabled()) {
                // The old light stays behind while the new one spreads out from the player.
                waveFrom = frontBitmap.copy(Bitmap.Config.ARGB_8888, false);
                waveStartUptime = SystemClock.uptimeMillis();
                waveDurationMs = WAVE_MS;
            }
            backBitmap = frontBitmap;
            frontBitmap = bitmap;
            frameHole.set(playerHole);
            frameContent.set(content);
            frameTopEdge = topEdge;
            frameBottomEdge = bottomEdge;
            frameWidth = width;
            frameHeight = height;
        }
        requestFrame();
    }

    /** The player's light layer, which the edge light goes right underneath. */
    void setEdgeAnchor(View anchor) {
        if (edgeAnchorRef.get() != anchor) edgeAnchorRef = new WeakReference<>(anchor);
    }

    /** Main thread, with each surface frame: the light over the player's bars and edges. */
    private void renderEdges() {
        View anchor = edgeAnchorRef.get();
        synchronized (frameLock) {
            edgePlayer.set(frameHole);
            edgeContent.set(frameContent);
            edgeTop = frameTopEdge;
            edgeBottom = frameBottomEdge;
        }
        boolean wanted = anchor != null && anchor.isAttachedToWindow()
                && anchor.getParent() instanceof ViewGroup && targetAlpha > 0f
                && !AmbientLightSettings.isSoftLightEnabled()
                && !AmbientLightSettings.isPictureBackdropEnabled()
                && !edgeContent.isEmpty() && edgePlayer.contains(edgeContent);
        long now = SystemClock.uptimeMillis();
        if (now - lastEdgeLogUptime > 5_000L && android.util.Log.isLoggable(
                AmbientLightController.TAG, android.util.Log.DEBUG)) {
            lastEdgeLogUptime = now;
            android.util.Log.d(AmbientLightController.TAG, "Edges " + wanted
                    + " player=" + edgePlayer.toShortString()
                    + " picture=" + edgeContent.toShortString()
                    + " top=" + edgeTop + " bottom=" + edgeBottom);
        }
        if (!wanted) {
            releaseEdges();
            return;
        }
        Rect player = edgePlayer;
        Rect content = edgeContent;
        edgeRects.clear();
        // One surface around everything there is to draw: each surface costs a buffer swap on
        // every light frame, which is most of the drawing time. Its middle stays transparent.
        int side = hasSideBars() ? Math.round(content.width() * FEATHER_SIDE) : 0;
        int left = side > 0 ? player.left : content.left;
        int right = side > 0 ? player.right : content.right;
        int top = side > 0 ? player.top : edgeTop && content.top > player.top ? player.top
                : edgeBottom ? content.bottom - bottomBand() : player.bottom;
        int bottom = side > 0 || edgeBottom ? player.bottom
                : edgeTop ? content.top : player.top;
        addEdge(left, top, right, bottom);
        if (edgeRects.isEmpty()) {
            releaseEdges();
            return;
        }
        if (edgeLayers == null) edgeLayers = new LightLayers(true, this::requestFrame, () -> { });
        ViewGroup parent = (ViewGroup) anchor.getParent();
        edgeLayers.render(parent, parent.indexOfChild(anchor), edgeRects, edgePainter);
    }

    /** Height of the fade over the picture's bottom edge; 0 when that edge is left alone. */
    private int bottomBand() {
        return edgeBottom ? Math.round(edgeContent.height() * FEATHER_BOTTOM) : 0;
    }

    private boolean hasSideBars() {
        return edgeContent.left - edgePlayer.left > 2 || edgePlayer.right - edgeContent.right > 2;
    }

    private void addEdge(int left, int top, int right, int bottom) {
        if (right - left < 2 || bottom - top < 2) return;
        edgeRects.add(new Rect(left, top, right, bottom));
    }

    private void releaseEdges() {
        if (edgeLayers != null) {
            edgeLayers.release();
            edgeLayers = null;
        }
    }

    /**
     * Window coordinates: opaque light over the bars, fading light over the picture's edges.
     * Every edge surface runs this; each only keeps the part inside its own rectangle.
     */
    private void paintEdges(Canvas canvas) {
        Rect player = edgePlayer;
        Rect content = edgeContent;
        canvas.getClipBounds(edgeClip);
        // The bars' light reaches a few pixels into the picture: the light surfaces are a
        // quarter of the screen's resolution, and a gap of one of their pixels between the
        // bar and the fade showed the picture's dark edge as a line.
        edgeInner.set(content);
        if (content.left > player.left) edgeInner.left += EDGE_OVERLAP;
        if (content.right < player.right) edgeInner.right -= EDGE_OVERLAP;
        if (edgeTop && content.top > player.top) edgeInner.top += EDGE_OVERLAP;
        if (edgeBottom && content.bottom < player.bottom) edgeInner.bottom -= EDGE_OVERLAP;
        int save = canvas.save();
        canvas.clipRect(player);
        canvas.clipOutRect(edgeInner);
        // Bars with text in them (subtitles in a letterbox) stay as they are.
        if (!edgeTop) canvas.clipOutRect(content.left, player.top, content.right, content.top);
        if (!edgeBottom) {
            canvas.clipOutRect(content.left, content.bottom, content.right, player.bottom);
        }
        paintLight(canvas, 0, 0, getWidth());
        canvas.restoreToCount(save);
        int bottomBand = bottomBand();
        if (bottomBand > 0) {
            featherBand.set(content.left, content.bottom - bottomBand, content.right,
                    content.bottom);
            feather(canvas, 0, content.left, featherBand.top, content.left, featherBand.bottom);
        }
        if (hasSideBars()) {
            // Full height, so the corners blend both ways (the bottom band's surface shows
            // this part too).
            int side = Math.round(content.width() * FEATHER_SIDE);
            featherBand.set(content.left, content.top, content.left + side, content.bottom);
            feather(canvas, 1, featherBand.right, content.top, featherBand.left, content.top);
            featherBand.set(content.right - side, content.top, content.right, content.bottom);
            feather(canvas, 2, featherBand.left, content.top, featherBand.right, content.top);
        }
    }

    /** The light over {@link #featherBand}, clear at (x0, y0) and full at (x1, y1). */
    private void feather(Canvas canvas, int slot, float x0, float y0, float x1, float y1) {
        if (featherBand.width() < 2 || featherBand.height() < 2
                || !Rect.intersects(edgeClip, featherBand)) return;
        if (featherShaders[slot] == null || !featherKeys[slot].equals(featherBand)) {
            featherKeys[slot].set(featherBand);
            featherShaders[slot] = new android.graphics.LinearGradient(x0, y0, x1, y1,
                    new int[]{0x00000000, 0x59000000, 0xFF000000}, new float[]{0f, 0.55f, 1f},
                    android.graphics.Shader.TileMode.CLAMP);
        }
        if (waveProgress < 1f) {
            // The scene-change wave is drawn in several passes: fade it through a layer.
            int layer = canvas.saveLayer(featherBand.left, featherBand.top, featherBand.right,
                    featherBand.bottom, null);
            canvas.clipRect(featherBand);
            paintLight(canvas, 0, 0, getWidth());
            featherPaint.setShader(featherShaders[slot]);
            featherPaint.setXfermode(featherMode);
            canvas.drawRect(featherBand, featherPaint);
            canvas.restoreToCount(layer);
            return;
        }
        // Otherwise without an offscreen layer (layers on every light frame cost the most
        // drawing time): the light in thin strips of rising strength. The display scales the
        // small light surfaces up smoothly, so the steps do not show.
        Bitmap bitmap;
        synchronized (frameLock) {
            bitmap = frontBitmap;
            if (bitmap == null || frameWidth != getWidth() || frameHeight != getHeight()) return;
        }
        float visibility = alpha * interactionFactor * breath;
        if (visibility <= 0f) return;
        updatePaints();
        destination.set(0, 0, getWidth(), getHeight());
        boolean vertical = x0 == x1;
        float from = vertical ? y0 : x0;
        float to = vertical ? y1 : x1;
        for (int i = 0; i < FEATHER_STRIPS; i++) {
            float start = from + (to - from) * i / FEATHER_STRIPS;
            float end = from + (to - from) * (i + 1) / FEATHER_STRIPS;
            float t = (i + 0.5f) / FEATHER_STRIPS;
            // Same curve as the fade mask: 35 % at 55 % of the way, full at the edge.
            float strength = t < 0.55f ? 0.35f * t / 0.55f : 0.35f + 0.65f * (t - 0.55f) / 0.45f;
            int save = canvas.save();
            if (vertical) {
                canvas.clipRect(featherBand.left, Math.min(start, end), featherBand.right,
                        Math.max(start, end));
            } else {
                canvas.clipRect(Math.min(start, end), featherBand.top, Math.max(start, end),
                        featherBand.bottom);
            }
            coverPaint.setAlpha(Math.round(255 * strength * visibility));
            canvas.drawBitmap(bitmap, null, destination, coverPaint);
            canvas.restoreToCount(save);
        }
    }

    /**
     * Called by the capture loop for every published frame and about once a second: the
     * calm-down after scrolling must end even when nothing else redraws this view.
     */
    void onTick() {
        if (interactionFactor < 1f || alpha != targetAlpha) requestFrame();
    }

    void setActive(boolean active) {
        float value = active ? 1f : 0f;
        if (targetAlpha != value) {
            targetAlpha = value;
            lastAlphaUptime = AnimationUtils.currentAnimationTimeMillis();
            requestFrame();
            updateSeeThrough();
        }
    }

    void onSettingsChanged() {
        colorFilterGeneration = -1;
        darkTheme = null;
        requestFrame();
        updateSeeThrough();
    }

    void setWatchPage(View host, View player) {
        hostRef = new WeakReference<>(host);
        playerRef = new WeakReference<>(player);
        updateSeeThrough();
    }

    /**
     * Main thread; also called about once a second so backgrounds created later are covered.
     * Switches the watch page between its normal and its see-through state.
     */
    void updateSeeThrough() {
        if (android.os.Looper.myLooper() != android.os.Looper.getMainLooper()) {
            post(this::updateSeeThrough);
            return;
        }
        View host = hostRef.get();
        boolean wanted = host != null && host.isAttachedToWindow() && targetAlpha > 0f
                && AmbientLightSettings.getProfile().videoBackdrop
                && SeeThroughPage.isAvailable();
        // The page colour must be read before the backgrounds are cleared.
        if (wanted && !behindPage) {
            darkTheme = null;
            isDarkTheme();
        }
        SeeThroughPage.update(this, host, playerRef.get(), wanted, backgroundColour);
        SeeThroughPage.suppressCinematic(getRootView(), playerRef.get(),
                host != null && host.isAttachedToWindow() && targetAlpha > 0f);
        if (behindPage != wanted) {
            behindPage = wanted;
            pageDirty = true;
            invalidate();
        }
        syncSurface();
    }

    /** True while the light surface shows the light and the page background stays clear. */
    boolean lightOnSurface() {
        return surfaceShowing;
    }

    /** Adds the light layers while the page is see-through and removes them afterwards. */
    private void syncSurface() {
        if (behindPage && isAttachedToWindow() && getRootView() instanceof ViewGroup) {
            if (pageLayers == null) {
                pageLayers = new LightLayers(false, this::requestFrame, this::onSurfaceLost);
            }
            // Runs about once a second, like the page's own rescan.
            View host = hostRef.get();
            if (surfaceShowing && host != null) SeeThroughPage.clearAroundPage(host);
            requestFrame();
        } else if (pageLayers != null) {
            releaseEdges();
            boolean wasShowing = surfaceShowing;
            surfaceShowing = false;
            pageLayers.release();
            pageLayers = null;
            SeeThroughPage.restoreAroundPage();
            View host = hostRef.get();
            if (wasShowing && host != null) host.invalidate();
        }
    }

    /**
     * A surface lost its buffer (the app went to the background): the page paints the light
     * itself again until the surfaces show a new frame, so it never shows a hole.
     */
    private void onSurfaceLost() {
        if (!surfaceShowing) return;
        surfaceShowing = false;
        View host = hostRef.get();
        if (host != null) host.invalidate();
        invalidate();
    }

    /** The next light frame: on the light surfaces once they show, else by redrawing views. */
    private void requestFrame() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            post(this::requestFrame);
            return;
        }
        if (pageLayers != null && behindPage) {
            if (!surfaceFrameScheduled) {
                surfaceFrameScheduled = true;
                Choreographer.getInstance().postFrameCallback(surfaceFrame);
            }
            if (surfaceShowing) return;
        }
        postInvalidateOnAnimation();
    }

    /** Main thread: one frame of the theater light on the light surfaces. */
    private void renderSurface() {
        surfaceFrameScheduled = false;
        LightLayers layers = pageLayers;
        View root = getRootView();
        if (layers == null || !behindPage || !(root instanceof ViewGroup)) return;
        advanceAnimations(AnimationUtils.currentAnimationTimeMillis());
        advanceLooks();
        updateGuard();
        // First children of the window: each punches out only the window background.
        if (!layers.render((ViewGroup) root, 0, pageRects(), pagePainter)) return;
        renderEdges();
        if (!surfaceShowing) {
            surfaceShowing = true;
            View host = hostRef.get();
            if (host != null) {
                SeeThroughPage.clearAroundPage(host);
                host.invalidate();
            }
        }
    }

    /**
     * Everything but the player, in window coordinates, split where the light changes: the
     * strip above the player, the sides of the player, the page below it and the navigation
     * bar strip outside the page. No rectangle covers the video.
     */
    private java.util.List<Rect> pageRects() {
        rectPool.addAll(pageRects);
        pageRects.clear();
        int width = getWidth();
        int height = getHeight();
        View player = playerRef.get();
        playerRect.setEmpty();
        if (player != null && player.isShown() && player.getWidth() > 0) {
            player.getLocationInWindow(hostLocation);
            playerRect.set(hostLocation[0], hostLocation[1],
                    hostLocation[0] + player.getWidth(), hostLocation[1] + player.getHeight());
            if (!playerRect.intersect(0, 0, width, height)) playerRect.setEmpty();
        }
        int pageBottom = height;
        View host = hostRef.get();
        if (host != null && host.isAttachedToWindow()) {
            host.getLocationInWindow(hostLocation);
            pageBottom = Math.max(0, Math.min(height, hostLocation[1] + host.getHeight()));
        }
        if (playerRect.isEmpty()) {
            addRect(0, 0, width, pageBottom);
        } else {
            addRect(0, 0, width, playerRect.top);
            addRect(0, playerRect.top, playerRect.left, playerRect.bottom);
            addRect(playerRect.right, playerRect.top, width, playerRect.bottom);
            addRect(0, playerRect.bottom, width, pageBottom);
        }
        addRect(0, Math.max(pageBottom, playerRect.bottom), width, height);
        return pageRects;
    }

    private void addRect(int left, int top, int right, int bottom) {
        if (right <= left || bottom <= top) return;
        Rect rect = rectPool.isEmpty() ? new Rect() : rectPool.remove(rectPool.size() - 1);
        rect.set(left, top, right, bottom);
        pageRects.add(rect);
    }

    /**
     * Outside the watch page (the navigation bar strip) the light has always been drawn as it
     * is, without the page colour and readability guard of the page itself.
     */
    private void paintOutsidePage(Canvas canvas) {
        View host = hostRef.get();
        if (host == null || !host.isAttachedToWindow()) return;
        Bitmap bitmap;
        synchronized (frameLock) {
            bitmap = frontBitmap;
            if (bitmap == null || frameWidth != getWidth() || frameHeight != getHeight()) return;
        }
        host.getLocationInWindow(hostLocation);
        hostRect.set(hostLocation[0], hostLocation[1], hostLocation[0] + host.getWidth(),
                hostLocation[1] + host.getHeight());
        int save = canvas.save();
        canvas.clipOutRect(hostRect);
        canvas.drawColor(backgroundColour | 0xFF000000);
        float visibility = alpha * interactionFactor * breath;
        if (visibility > 0f) {
            coverPaint.setAlpha(Math.round(255 * visibility));
            destination.set(0, 0, getWidth(), getHeight());
            canvas.drawBitmap(bitmap, null, destination, coverPaint);
            if (AmbientLightSettings.isFalloffEnabled()) drawFalloff(canvas);
        }
        canvas.restoreToCount(save);
    }

    /**
     * Called by the watch page's background drawable: the page colour, then the light on
     * top of it at the current strength. The canvas is in the host's coordinates.
     */
    void drawBehindPage(Canvas canvas, View host) {
        if (surfaceShowing) {
            // Punch through to the light surface, also clearing whatever YouTube painted
            // under the page (a 44 % black scrim, for one). This never changes, so the page
            // is not redrawn for new light frames.
            canvas.drawColor(0, PorterDuff.Mode.CLEAR);
            return;
        }
        advanceLooks();
        updateGuard();
        host.getLocationInWindow(hostLocation);
        paintLight(canvas, hostLocation[0], hostLocation[1], host.getWidth());
    }

    /** The page colour and the light over it, for a canvas whose origin is (x, y) in the window. */
    private void paintLight(Canvas canvas, int x, int y, int width) {
        canvas.drawColor(backgroundColour | 0xFF000000);
        Bitmap bitmap;
        synchronized (frameLock) {
            bitmap = frontBitmap;
            if (bitmap == null || frameWidth != getWidth() || frameHeight != getHeight()) return;
        }
        float visibility = alpha * interactionFactor * breath;
        if (visibility <= 0f) return;
        updatePaints();
        int save = canvas.save();
        canvas.translate(-x, -y);
        destination.set(0, 0, getWidth(), getHeight());
        coverPaint.setAlpha(Math.round(255 * visibility));
        if (waveProgress < 1f) {
            drawWave(canvas, bitmap);
        } else {
            canvas.drawBitmap(bitmap, null, destination, coverPaint);
        }
        if (AmbientLightSettings.isFalloffEnabled()) drawFalloff(canvas);
        canvas.restoreToCount(save);
        boolean dark = backgroundLuma < 0.5f;
        int guardAlpha = Math.round(255 * guard * visibility);
        if (guardAlpha > 0) {
            canvas.drawColor((guardAlpha << 24) | (dark ? 0x000000 : 0xFFFFFF));
        }
        // The status bar icons above the player are white in either theme; on a light page
        // YouTube keeps that strip black, and so does this.
        int stripBottom;
        synchronized (frameLock) {
            stripBottom = frameHole.top - y;
        }
        if (!dark && stripBottom > 0) {
            int strip = canvas.save();
            canvas.clipRect(0, 0, width, stripBottom);
            canvas.drawColor(0xFF000000);
            canvas.restoreToCount(strip);
        }
        AmbientLightController.statusRenderer = Views.isJapanese()
                ? "シアター：背景そのものを透明化" : "theater: transparent page background";
    }

    /**
     * Readability guard: YouTube's text is white on a dark page and black on a light one, so
     * a light that is too bright (or too dark) is pulled towards black (or white) just enough.
     * It eases in and out so scene cuts do not make it pump. Once per frame.
     */
    private void updateGuard() {
        boolean dark = backgroundLuma < 0.5f;
        // The crisp light keeps the video's own colours in either theme, like the desktop
        // extension; only the previous, soft look keeps its guard.
        float wanted = !AmbientLightSettings.isSoftLightEnabled() ? 0f : dark
                ? (framePeak <= DARK_PAGE_MAX_LUMA ? 0f : 1f - DARK_PAGE_MAX_LUMA / framePeak)
                : (frameFloor >= LIGHT_PAGE_MIN_LUMA ? 0f
                        : 1f - (1f - LIGHT_PAGE_MIN_LUMA) / (1f - frameFloor));
        guard += (wanted - guard) * 0.12f;
    }

    /** On a scene cut the new light spreads from the bottom of the player over the old one. */
    private void drawWave(Canvas canvas, Bitmap bitmap) {
        Rect hole;
        Bitmap from;
        synchronized (frameLock) {
            hole = new Rect(frameHole);
            from = waveFrom;
        }
        if (from != null) canvas.drawBitmap(from, null, destination, coverPaint);
        float cx = hole.exactCenterX();
        float cy = hole.bottom;
        float far = (float) Math.hypot(Math.max(cx, getWidth() - cx),
                Math.max(cy, getHeight() - cy));
        float eased = 1f - (float) Math.pow(1f - waveProgress, 3);
        float radius = Math.max(1f, far * 1.15f * eased);
        int layer = canvas.saveLayer(destination, null);
        canvas.drawBitmap(bitmap, null, destination, coverPaint);
        wavePaint.setShader(new android.graphics.RadialGradient(cx, cy, radius,
                new int[]{0xFF000000, 0xFF000000, 0x00000000}, new float[]{0f, 0.75f, 1f},
                android.graphics.Shader.TileMode.CLAMP));
        wavePaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));
        canvas.drawRect(destination, wavePaint);
        canvas.restoreToCount(layer);
    }

    /** The light is strongest just below the player and fades towards the bottom. */
    private void drawFalloff(Canvas canvas) {
        int top;
        synchronized (frameLock) {
            top = frameHole.bottom;
        }
        int key = top * 31 + getHeight() * 7 + backgroundColour;
        if (key != falloffKey) {
            falloffKey = key;
            int colour = backgroundColour & 0xFFFFFF;
            falloffPaint.setShader(new android.graphics.LinearGradient(0, top, 0, getHeight(),
                    new int[]{colour, 0x4D000000 | colour, 0xB3000000 | colour,
                            0xF2000000 | colour},
                    new float[]{0f, 0.25f, 0.6f, 1f}, android.graphics.Shader.TileMode.CLAMP));
        }
        canvas.drawRect(0, top, getWidth(), getHeight(), falloffPaint);
    }

    /** Steps the looks that move by themselves: the wave and the breathing while paused. */
    private void advanceLooks() {
        long now = SystemClock.uptimeMillis();
        long start;
        long duration;
        synchronized (frameLock) {
            start = waveStartUptime;
            duration = waveDurationMs;
        }
        float progress = duration <= 0 ? 1f : Math.min(1f, (now - start) / (float) duration);
        if (progress >= 1f && waveProgress < 1f) {
            synchronized (frameLock) {
                waveFrom = null;
            }
        }
        waveProgress = progress;
        if (progress < 1f) requestFrame();
        boolean breathing = AmbientLightSettings.isBreatheEnabled() && targetAlpha > 0f
                && !PlayerHooks.isPlaybackAdvancing();
        breath = breathing
                ? 0.85f + 0.15f * (float) Math.cos(2 * Math.PI * (now % BREATH_PERIOD_MS)
                        / BREATH_PERIOD_MS)
                : 1f;
        if (breathing) {
            removeCallbacks(breathFrame);
            postDelayed(breathFrame, 50L);
        }
    }

    @Override protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        getViewTreeObserver().addOnScrollChangedListener(scrollListener);
        getViewTreeObserver().addOnGlobalLayoutListener(layoutListener);
        getViewTreeObserver().addOnPreDrawListener(preDrawListener);
    }

    @Override protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        ViewTreeObserver observer = getViewTreeObserver();
        if (observer.isAlive()) {
            observer.removeOnScrollChangedListener(scrollListener);
            observer.removeOnGlobalLayoutListener(layoutListener);
            observer.removeOnPreDrawListener(preDrawListener);
        }
        removeCallbacks(restoreCheck);
        if (surfaceFrameScheduled) Choreographer.getInstance().removeFrameCallback(surfaceFrame);
        surfaceFrameScheduled = false;
        syncSurface();
    }

    /**
     * Observes touches without consuming them: returning false lets every event continue to
     * the views underneath. Touches on the player itself are about the video, not the page.
     */
    @Override public boolean onTouchEvent(MotionEvent event) {
        if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
            boolean onPlayer;
            synchronized (frameLock) {
                onPlayer = frameHole.contains((int) event.getX(), (int) event.getY());
            }
            if (!onPlayer) {
                lastPageTouchUptime = SystemClock.uptimeMillis();
                onUserInteraction();
            }
        }
        return false;
    }

    /**
     * Scroll notifications come from every scrolling view in the window, including ones
     * that move by themselves - inline previews, carousels and tickers among the related
     * videos. Counting those as the user kept the light dimmed for good once they were on
     * screen. Only scrolls shortly after a touch on the page (a drag and its fling) count.
     */
    private void onScrollChanged() {
        if (SystemClock.uptimeMillis() - lastPageTouchUptime <= TOUCH_SCROLL_WINDOW_MS) {
            onUserInteraction();
        } else {
            // The theater fallback still has to follow the page; the light surface does not
            // move with the page.
            pageDirty = true;
            if (alpha > 0f && !surfaceShowing) requestFrame();
        }
    }

    private void onUserInteraction() {
        // The theater page copy must follow scrolling immediately.
        pageDirty = true;
        if (alpha > 0f) requestFrame();
        if (!AmbientLightSettings.isInteractionDimEnabled() || alpha <= 0f && targetAlpha <= 0f) {
            return;
        }
        long now = SystemClock.uptimeMillis();
        // Scroll callbacks arrive every frame; only reschedule occasionally.
        if (now - lastInteractionUptime < 100L) return;
        lastInteractionUptime = now;
        removeCallbacks(restoreCheck);
        postDelayed(restoreCheck, AmbientLightSettings.getIdleDelayMs());
    }

    @Override protected void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        darkTheme = null;
    }

    /** Steps the fade and the interaction dimming, asking for frames while they move. */
    private void advanceAnimations(long now) {
        if (alpha != targetAlpha) {
            float step = (now - lastAlphaUptime) / (float) FADE_DURATION_MS;
            alpha = targetAlpha > alpha ? Math.min(targetAlpha, alpha + step)
                    : Math.max(targetAlpha, alpha - step);
            lastAlphaUptime = now;
            if (alpha != targetAlpha) requestFrame();
        }
        updateInteractionFactor(now);
        lastDrawUptime = SystemClock.uptimeMillis();
        shownAlpha = alpha;
        shownFactor = interactionFactor;
        shownInteractionUptime = lastInteractionUptime;
        // Diagnostics text is only built while someone looks at it.
        if (AmbientLightController.diagnosticsShown()) updateDebugState();
    }

    @Override protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        // The light surface draws the light; this view has nothing to add then.
        if (surfaceShowing) return;
        advanceAnimations(AnimationUtils.currentAnimationTimeMillis());
        View host = behindPage ? hostRef.get() : null;
        SeeThroughPage.keep();
        // The light itself is painted by the watch page's background; this view keeps the
        // timing and covers what lies outside the watch page (the navigation bar strip).
        if (host != null) host.invalidate();
        if (alpha <= 0f) return;
        Bitmap bitmap;
        synchronized (frameLock) {
            bitmap = frontBitmap;
            if (bitmap == null || frameWidth != getWidth() || frameHeight != getHeight()) return;
            hole.set(frameHole);
        }
        updatePaints();
        boolean dark = isDarkTheme();
        ImmersionProfile profile = AmbientLightSettings.getProfile();
        float visibility = alpha * interactionFactor;

        int save = canvas.save();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            canvas.clipOutRect(hole);
        } else {
            canvas.clipRect(hole, android.graphics.Region.Op.DIFFERENCE);
        }
        destination.set(0, 0, getWidth(), getHeight());
        if (host != null) {
            host.getLocationInWindow(hostLocation);
            hostRect.set(hostLocation[0], hostLocation[1], hostLocation[0] + host.getWidth(),
                    hostLocation[1] + host.getHeight());
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                canvas.clipOutRect(hostRect);
            } else {
                canvas.clipRect(hostRect, android.graphics.Region.Op.DIFFERENCE);
            }
            coverPaint.setAlpha(Math.round(255 * visibility));
            canvas.drawBitmap(bitmap, null, destination, coverPaint);
        } else if (profile.videoBackdrop) {
            drawTheater(canvas, bitmap, visibility, dark);
        } else if (dark) {
            float cover = profile.cover;
            // Veil first (hides page content for maximum immersion), then additive light.
            if (cover > 0f) {
                coverPaint.setAlpha(Math.round(255 * cover * visibility));
                canvas.drawBitmap(bitmap, null, destination, coverPaint);
            }
            // Under a veil the additive pass only adds depth; at full strength it would
            // wash the page out to a milky pastel.
            lightPaint.setAlpha(Math.round(255 * visibility * (1f - 0.8f * cover)));
            canvas.drawBitmap(bitmap, null, destination, lightPaint);
            AmbientLightController.statusRenderer = Views.isJapanese()
                    ? "色の光をページに重ねる" : "colour light over the page";
        } else {
            float tint = Math.max(LIGHT_THEME_ALPHA, profile.cover);
            coverPaint.setAlpha(Math.round(255 * tint * visibility));
            canvas.drawBitmap(bitmap, null, destination, coverPaint);
            AmbientLightController.statusRenderer = Views.isJapanese()
                    ? "色の光をページに重ねる（ライトテーマ）" : "colour tint (light theme)";
        }
        canvas.restoreToCount(save);
    }

    /**
     * Theater: the light covers the whole screen opaquely, then the page is drawn again on
     * top with its background keyed out so only text, icons and thumbnails remain.
     */
    private void drawTheater(Canvas canvas, Bitmap light, float visibility, boolean dark) {
        View pageRoot = PageKeyRenderer.isSupported() && canvas.isHardwareAccelerated()
                ? pageRoot() : null;
        boolean japanese = Views.isJapanese();
        if (pageRoot != null && pageRoot.getWidth() > 0 && pageRoot.getHeight() > 0) {
            coverPaint.setAlpha(Math.round(255 * visibility));
            canvas.drawBitmap(light, null, destination, coverPaint);
            // Above the player there is only YouTube's status bar scrim (the system draws
            // the clock and icons itself), so the light is left uncovered there.
            int strip = canvas.save();
            if (hole.top > 0) canvas.clipRect(0, hole.top, getWidth(), getHeight());
            long uptime = SystemClock.uptimeMillis();
            boolean refresh = pageDirty || uptime - lastPageRefreshUptime >= PAGE_REFRESH_MS;
            if (uptime - lastThemeCheckUptime >= 3_000L) {
                lastThemeCheckUptime = uptime;
                darkTheme = null;
                dark = isDarkTheme();
            }
            if (refresh) {
                pageDirty = false;
                lastPageRefreshUptime = uptime;
            }
            pageKey.draw(canvas, this, pageRoot, dark, backgroundLuma, visibility, refresh);
            canvas.restoreToCount(strip);
            AmbientLightController.statusRenderer = japanese
                    ? "シアター：ページ透過（GPU）" : "theater: see-through page (GPU)";
        } else {
            // Without AGSL: the light replaces the page background wherever it is brighter
            // (dark theme) or darker (light theme) than the page.
            blendPaint.setXfermode(new PorterDuffXfermode(
                    dark ? PorterDuff.Mode.LIGHTEN : PorterDuff.Mode.DARKEN));
            blendPaint.setAlpha(Math.round(255 * visibility));
            canvas.drawBitmap(light, null, destination, blendPaint);
            AmbientLightController.statusRenderer = japanese
                    ? "シアター：簡易合成（Android 12以前）" : "theater: blend fallback (Android 12-)";
        }
        // New light frames and scrolling invalidate this view; while paused, still follow
        // page changes such as loading images at a low rate.
        if (!PlayerHooks.isPlaybackAdvancing()) postInvalidateDelayed(IDLE_REFRESH_MS);
    }

    /** YouTube's full-screen content root (the watch page and everything under it). */
    private View pageRoot() {
        View cached = pageRootRef.get();
        if (cached != null && cached.isAttachedToWindow()) return cached;
        View root = getRootView();
        int id = Views.resource(getContext(), "id", "slim_status_bar_player_container");
        View found = id == 0 ? null : root.findViewById(id);
        if (found == null) found = root.findViewById(android.R.id.content);
        pageRootRef = new WeakReference<>(found);
        return found;
    }

    /** Dims quickly while the user interacts, then restores slowly after the idle delay. */
    private void updateInteractionFactor(long now) {
        long uptime = SystemClock.uptimeMillis();
        boolean interacting = AmbientLightSettings.isInteractionDimEnabled()
                && lastInteractionUptime != 0
                && uptime - lastInteractionUptime < AmbientLightSettings.getIdleDelayMs();
        float target = interacting ? INTERACTION_LEVEL : 1f;
        if (interacting != loggedInteracting && android.util.Log.isLoggable(
                AmbientLightController.TAG, android.util.Log.DEBUG)) {
            loggedInteracting = interacting;
            android.util.Log.d(AmbientLightController.TAG, "Interacting=" + interacting
                    + " alpha=" + alpha + " target=" + targetAlpha);
        }
        long elapsed = lastFactorUptime == 0 ? 0 : Math.max(0, now - lastFactorUptime);
        lastFactorUptime = now;
        if (interactionFactor == target) return;
        float range = 1f - INTERACTION_LEVEL;
        if (target < interactionFactor) {
            interactionFactor = Math.max(target,
                    interactionFactor - range * elapsed / (float) DIM_DURATION_MS);
        } else {
            interactionFactor = Math.min(target,
                    interactionFactor + range * elapsed / (float) RESTORE_DURATION_MS);
        }
        if (interactionFactor != target) requestFrame();
    }

    private boolean isDarkTheme() {
        Boolean cached = darkTheme;
        if (cached != null) return cached;
        boolean dark = detectDarkTheme();
        darkTheme = dark;
        return dark;
    }

    /**
     * YouTube can use its own theme regardless of the system setting, and the window's
     * decor context does not always carry the activity's night mode. The page background
     * colour of YouTube's theme is the reliable signal.
     */
    private boolean detectDarkTheme() {
        // While the page is see-through its views no longer carry the colour.
        if (behindPage) return backgroundLuma < 0.5f;
        android.app.Activity activity = Views.findActivity(getContext());
        Context context = activity != null ? activity : getContext();
        // 1. The colour the watch page really paints. Other patches can restyle YouTube
        //    (pure-black themes, custom colours) without touching the theme attributes.
        View root = getRootView();
        for (String name : BACKGROUND_VIEW_IDS) {
            int id = Views.resource(context, "id", name);
            View view = id == 0 || root == null ? null : root.findViewById(id);
            if (view != null && view.getBackground() instanceof ColorDrawable) {
                int color = ((ColorDrawable) view.getBackground()).getColor();
                if ((color >>> 24) >= 0xF0) return useBackground(color, "view:" + name);
            }
        }
        // 2. YouTube's theme attribute.
        int attr = Views.resource(context, "attr", "ytBaseBackground");
        if (attr != 0) {
            TypedValue value = new TypedValue();
            if (context.getTheme().resolveAttribute(attr, value, true)
                    && value.type >= TypedValue.TYPE_FIRST_COLOR_INT
                    && value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                return useBackground(value.data, "theme");
            }
        }
        // 3. The system setting.
        boolean night = (context.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        return useBackground(night ? 0xFF0F0F0F : 0xFFFFFFFF, "system");
    }

    private static final String[] BACKGROUND_VIEW_IDS = {
            "video_info_loading_layout", "pane_fragment_container",
            "watch_while_layout_coordinator_layout"
    };

    private boolean useBackground(int color, String source) {
        int luma = (((color >> 16) & 0xFF) * 299 + ((color >> 8) & 0xFF) * 587
                + (color & 0xFF) * 114) / 1000;
        backgroundLuma = luma / 255f;
        backgroundColour = color | 0xFF000000;
        boolean dark = luma < 128;
        AmbientLightController.statusBackground = String.format("#%06X (%s, %s)",
                color & 0xFFFFFF, dark ? "dark" : "light", source);
        return dark;
    }

    private void updatePaints() {
        int generation = AmbientLightSettings.getGeneration();
        if (generation == colorFilterGeneration) return;
        colorFilterGeneration = generation;
        ColorMatrix matrix = new ColorMatrix();
        matrix.setSaturation(AmbientLightSettings.getSaturation() / 100f);
        float brightness = AmbientLightSettings.getBrightness() / 100f;
        ColorMatrix scale = new ColorMatrix();
        scale.setScale(brightness, brightness, brightness, 1f);
        matrix.postConcat(scale);
        ColorMatrixColorFilter filter = new ColorMatrixColorFilter(matrix);
        lightPaint.setColorFilter(filter);
        coverPaint.setColorFilter(filter);
        blendPaint.setColorFilter(filter);
    }
}
