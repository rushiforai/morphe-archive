package io.github.sabopura.morphe.extension.youtube.ambient;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.PixelCopy;
import android.view.SurfaceView;
import android.view.Choreographer;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;

import java.lang.ref.WeakReference;

import io.github.sabopura.morphe.extension.youtube.shared.PlayerHooks;
import io.github.sabopura.morphe.extension.youtube.shared.Views;

/**
 * Non-interactive layer between the video and the player controls. It samples the current
 * video frame at a low resolution, builds a blurred, spread-out glow on a worker thread and
 * draws it into the area of the player not covered by the picture (letterbox, pillarbox,
 * and optionally burned-in black bars).
 */
final class AmbientLightView extends View {
    private static final String TAG = AmbientLightController.TAG;
    private static final long FADE_DURATION_MS = 350L;
    private static final int STABLE_BAR_FRAMES = 3;
    private static final float MIN_BAR_FRACTION = 0.015f;
    private static final int MAX_FAILURES_BEFORE_BACKOFF = 5;
    /** No media-time report for this long: the clock is silent, not necessarily paused. */
    private static final long CLOCK_SILENT_MS = 2_000L;
    private static final long SILENT_CAPTURE_INTERVAL_MS = 66L;
    /** A picture that has not moved for this many captures is sampled more slowly... */
    private static final int STILL_FRAMES_BEFORE_SLOWDOWN = 30;
    /** ...at this interval, until the next capture that moved. */
    private static final long STILL_CAPTURE_INTERVAL_MS = 200L;
    /** A mean colour change this large between two captures is a scene cut. */
    private static final int CUT_DIFFERENCE = 24;
    /** A bar pixel this bright is text or a logo, not black. */
    private static final int BAR_TEXT_LUMA = 48;
    /** After text was seen in a bar, it stays uncovered this long (subtitles come and go). */
    private static final long BAR_TEXT_HOLD_MS = 4_000L;
    private long lastTopTextUptime;
    private long lastBottomTextUptime;
    /** The readback is this many times larger than the colour samples. */
    private static final int PICTURE_SCALE = 4;
    /**
     * Share of the picture height the crisp light takes its colours from right under the
     * player, so it continues the picture's edge; it grows to the whole picture one player
     * height away.
     */
    private static final float NEAR_BAND = 0.08f;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static HandlerThread workerThread;
    private static Handler worker;

    private final Paint paint = new Paint(Paint.FILTER_BITMAP_FLAG | Paint.DITHER_FLAG);
    private final Rect videoRect = new Rect();
    private final Rect drawRect = new Rect();
    private final RectF drawRectF = new RectF();
    private final int[] surfaceLocation = new int[2];
    private final int[] viewLocation = new int[2];
    private final Runnable tick = this::tick;
    private final Object frameLock = new Object();

    private WeakReference<View> surfaceRef = new WeakReference<>(null);
    private WeakReference<AmbientPageGlowView> pageRef = new WeakReference<>(null);
    private final Rect pageVideoRect = new Rect();
    private final Rect pagePlayerRect = new Rect();
    private final Rect pageBounds = new Rect();
    private final int[] pageLocation = new int[2];
    private boolean barsActive;
    private boolean pageActive;
    /** The page light is on screen (read by the time bar hook on the main thread). */
    private boolean pageShown;
    private volatile boolean frameReady;

    // Capture state (main thread).
    private Bitmap captureBitmap;
    private boolean copyInFlight;
    private long lastCaptureUptime;
    private int consecutiveFailures;
    private boolean pendingFrameAfterPause = true;
    private boolean loopScheduled;

    // Worker state.
    private int[] capturePixels = new int[0];
    private int[] samplePixels = new int[0];
    private int[] previousSample = new int[0];
    private int[] glowPixels = new int[0];
    private int[] accumulatedPixels = new int[0];
    private int[] scratchPixels = new int[0];
    private int[] stableBounds;
    private int[] candidateBounds;
    private int candidateCount;
    private int staticFrames;
    /** Consecutive captures whose picture barely changed (worker writes, main thread reads). */
    private volatile int stillFrames;
    private boolean loggedStill;
    private int lastSampleWidth;
    private boolean accumulatedValid;
    private int[] pageGlowPixels = new int[0];
    private int[] pageAccumulated = new int[0];
    private int[] pageScratch = new int[0];
    private int[] pageOutput = new int[0];
    private int[] pageSoft = new int[0];
    private int[] straightScratch = new int[0];
    private boolean pageValid;

    // Published frame (guarded by frameLock).
    private Bitmap frontBitmap;
    private Bitmap backBitmap;
    private final Rect frameClip = new Rect();
    private int frameViewWidth;
    private int frameViewHeight;

    // Presentation (main thread).
    private float alpha;
    private float targetAlpha;
    private long lastAlphaUptime;
    private int colorFilterGeneration = -1;

    // The bars' light on surfaces between the video and the window (see LightLayers).
    private LightLayers barLayers;
    private boolean barsOnSurface;
    private boolean barFrameScheduled;
    private final Choreographer.FrameCallback barFrame = frameTimeNanos -> renderBars();
    private final java.util.List<Rect> barRects = new java.util.ArrayList<>();
    private final java.util.List<Rect> rectPool = new java.util.ArrayList<>();
    private final Rect barClip = new Rect();
    private final int[] windowLocation = new int[2];
    private Bitmap barBitmap;
    private final LightLayers.Painter barPainter = canvas -> {
        updateColorFilter();
        paint.setAlpha(Math.round(alpha * 255));
        drawRectF.set(windowLocation[0], windowLocation[1],
                windowLocation[0] + getWidth(), windowLocation[1] + getHeight());
        canvas.drawBitmap(barBitmap, null, drawRectF, paint);
    };

    AmbientLightView(Context context) {
        super(context);
        setClickable(false);
        setFocusable(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        setWillNotDraw(false);
    }

    private static synchronized Handler worker() {
        if (worker == null) {
            workerThread = new HandlerThread("Ambient-Light", android.os.Process.THREAD_PRIORITY_DISPLAY);
            workerThread.start();
            worker = new Handler(workerThread.getLooper());
        }
        return worker;
    }

    void setVideoSurface(View surface) {
        if (surfaceRef.get() != surface) {
            if (Log.isLoggable(TAG, Log.DEBUG)) {
                int[] location = new int[2];
                surface.getLocationInWindow(location);
                Log.d(TAG, "Video surface " + surface.getClass().getSimpleName() + " "
                        + surface.getWidth() + "x" + surface.getHeight() + " at "
                        + location[0] + "," + location[1]);
            }
            surfaceRef = new WeakReference<>(surface);
            resetHistory();
        }
        startLoop();
    }

    void setPageGlowView(AmbientPageGlowView view) {
        pageRef = new WeakReference<>(view);
        startLoop();
    }

    void onSettingsChanged() {
        colorFilterGeneration = -1;
        AmbientPageGlowView page = pageRef.get();
        if (page != null) page.onSettingsChanged();
        resetHistory();
        startLoop();
        invalidate();
    }

    /** Media clock moved; may be called from a non-main thread. */
    void onPlaybackTick() {
        if (!loopScheduled) post(this::startLoop);
    }

    private void resetHistory() {
        worker().post(() -> {
            stableBounds = null;
            candidateBounds = null;
            candidateCount = 0;
            accumulatedValid = false;
            pageValid = false;
            staticFrames = 0;
        });
        frameReady = false;
        pendingFrameAfterPause = true;
    }

    @Override protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        startLoop();
    }

    @Override protected void onSizeChanged(int width, int height, int oldWidth, int oldHeight) {
        super.onSizeChanged(width, height, oldWidth, oldHeight);
        // Entering/leaving fullscreen while paused must still refresh the light once.
        resetHistory();
        startLoop();
    }

    @Override protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        removeCallbacks(tick);
        loopScheduled = false;
        // Not while the parent is still removing this view.
        MAIN.post(this::releaseBars);
        AmbientPageGlowView page = pageRef.get();
        if (page != null) page.setActive(false);
    }

    private void startLoop() {
        if (loopScheduled || !isAttachedToWindow()) return;
        loopScheduled = true;
        postOnAnimation(tick);
    }

    private void tick() {
        loopScheduled = false;
        boolean active = shouldBeActive();
        logState(active);
        setTargetAlpha(active && barsActive ? 1f : 0f);
        AmbientPageGlowView page = pageRef.get();
        if (page != null) {
            page.setActive(active && pageActive);
            page.setEdgeAnchor(this);
            page.onTick();
        }
        pageShown = page != null && active && pageActive;
        if (!active) return;

        // Without media-time reports the picture itself tells whether the video moves:
        // keep capturing at a reduced rate and let the static-frame check skip the work.
        boolean clockSilent = PlayerHooks.millisSinceLastReport() > CLOCK_SILENT_MS;
        boolean playing = PlayerHooks.isPlaybackAdvancing() || clockSilent;
        boolean energySaver = AmbientLightSettings.isEnergySaverEnabled();
        long now = SystemClock.uptimeMillis();
        long interval = 1000L / Math.max(1, AmbientLightSettings.getFrameRate());
        if (clockSilent) interval = Math.max(interval, SILENT_CAPTURE_INTERVAL_MS);
        // A still picture (slides, a paused-looking stream) needs no 30 samples a second; the
        // first capture that moves returns to the full rate.
        boolean still = stillFrames >= STILL_FRAMES_BEFORE_SLOWDOWN;
        if (still) interval = Math.max(interval, STILL_CAPTURE_INTERVAL_MS);
        if (still != loggedStill && Log.isLoggable(TAG, Log.DEBUG)) {
            loggedStill = still;
            Log.d(TAG, still ? "Still picture: sampling every " + STILL_CAPTURE_INTERVAL_MS + " ms"
                    : "Picture moves again: full sampling rate");
        }
        if (consecutiveFailures >= MAX_FAILURES_BEFORE_BACKOFF) interval = Math.max(interval, 1_000L);

        if (!copyInFlight && now - lastCaptureUptime >= interval
                && (playing || !energySaver || pendingFrameAfterPause || !frameReady)) {
            if (capture()) {
                lastCaptureUptime = now;
                if (!playing) pendingFrameAfterPause = false;
            }
        }
        if (playing) pendingFrameAfterPause = true;

        // Keep ticking while playing; when paused, stop after the final frame has settled.
        if (playing || !energySaver || copyInFlight || !frameReady || alpha != targetAlpha) {
            loopScheduled = true;
            postDelayed(tick, Math.max(8L, interval - (SystemClock.uptimeMillis() - now)));
        }
    }

    private String lastStateLog = "";

    /** Compact state for the on-screen diagnostics line. */
    static volatile String debugState = "-";

    private void logState(boolean active) {
        boolean debug = Log.isLoggable(TAG, Log.DEBUG);
        if (!debug && !AmbientLightController.diagnosticsShown()) return;
        View surface = surfaceRef.get();
        getLocationInWindow(viewLocation);
        debugState = (active ? "A" : "a") + (pageActive ? "P" : "p") + (barsActive ? "B" : "b")
                + " " + getWidth() + "x" + getHeight() + "@" + viewLocation[0] + ","
                + viewLocation[1] + (isShown() ? "" : " hidden")
                + (surface == null ? " nosurf" : surface.isShown() ? "" : " surfhidden")
                + (frameReady ? "" : " nf") + (consecutiveFailures > 0
                        ? " fail" + consecutiveFailures : "");
        if (!debug) return;
        String line = "active=" + active + " bars=" + barsActive + " page=" + pageActive
                + " shown=" + isShown() + " player=" + getWidth() + "x" + getHeight()
                + " at " + viewLocation[0] + "," + viewLocation[1];
        if (line.equals(lastStateLog)) return;
        lastStateLog = line;
        Log.d(TAG, "State " + line);
    }

    /** Decides whether there is anything to light and the current mode allows it. */
    private boolean shouldBeActive() {
        if (!AmbientLightSettings.isEnabled() || !isShown() || getWidth() <= 0
                || getHeight() <= 0) return false;
        View surface = surfaceRef.get();
        if (surface == null || !surface.isAttachedToWindow() || !surface.isShown()
                || surface.getWidth() <= 0 || surface.getHeight() <= 0) return false;

        barsActive = false;
        pageActive = false;
        // Muted inline previews in feeds use the same player; they get no light.
        if (Views.isInlinePreview(this)) return false;
        // In picture-in-picture the window is the video itself: there is nothing to light.
        android.app.Activity activity = Views.findActivity(getContext());
        if (activity != null && activity.isInPictureInPictureMode()) return false;
        View root = getRootView();
        int shortSide = Math.min(root.getWidth(), root.getHeight());
        if (getWidth() < shortSide * 0.5f) return false; // miniplayer / dragging
        boolean fullscreen = getWidth() >= root.getWidth() * 0.95f
                && getHeight() >= root.getHeight() * 0.85f;
        // The miniplayer can be resized almost to the size of the regular player, so its size
        // alone does not tell them apart; its place does. The regular player starts at the
        // left edge near the top of the window, the miniplayer floats in a corner. The light
        // (and the see-through page behind it) only belongs to the open watch page.
        getLocationInWindow(viewLocation);
        boolean expanded = viewLocation[0] <= root.getWidth() * 0.02f
                && viewLocation[1] <= root.getHeight() * 0.25f;
        if (!fullscreen && !expanded) return false;

        surface.getLocationInWindow(surfaceLocation);
        getLocationInWindow(viewLocation);
        int left = surfaceLocation[0] - viewLocation[0];
        int top = surfaceLocation[1] - viewLocation[1];
        videoRect.set(left, top, left + surface.getWidth(), top + surface.getHeight());
        if (!videoRect.intersect(0, 0, getWidth(), getHeight())) return false;

        long viewArea = (long) getWidth() * getHeight();
        long barArea = viewArea - (long) videoRect.width() * videoRect.height();
        // Without visible bars there is nothing to light unless burned-in bars are filled.
        barsActive = (fullscreen ? AmbientLightSettings.isFullscreenEnabled()
                : AmbientLightSettings.isSmallPlayerEnabled())
                && (barArea >= viewArea * MIN_BAR_FRACTION || AmbientLightSettings.shouldFillBars());

        // Light spilling out of the regular player onto the page around it.
        AmbientPageGlowView page = pageRef.get();
        if (!fullscreen && AmbientLightSettings.isPageGlowEnabled() && page != null
                && page.isAttachedToWindow() && page.getWidth() > 0 && page.getHeight() > 0) {
            page.getLocationInWindow(pageLocation);
            int playerLeft = viewLocation[0] - pageLocation[0];
            int playerTop = viewLocation[1] - pageLocation[1];
            pagePlayerRect.set(playerLeft, playerTop,
                    playerLeft + getWidth(), playerTop + getHeight());
            pageVideoRect.set(videoRect);
            pageVideoRect.offset(playerLeft, playerTop);
            pageBounds.set(0, 0, page.getWidth(), page.getHeight());
            long pageArea = (long) page.getWidth() * page.getHeight();
            pageActive = Rect.intersects(pagePlayerRect, pageBounds)
                    && pageArea > viewArea * 1.05f;
        }
        // The crisp page light lights the player's bars itself, continuing the page.
        if (pageActive && AmbientLightSettings.getProfile().videoBackdrop
                && !AmbientLightSettings.isSoftLightEnabled()
                && !AmbientLightSettings.isPictureBackdropEnabled()) {
            barsActive = false;
        }
        return barsActive || pageActive;
    }

    private boolean capture() {
        View surface = surfaceRef.get();
        if (surface == null) return false;
        int quality = AmbientLightSettings.getQuality();
        int sampleWidth = quality == AmbientLightSettings.QUALITY_LOW ? 32
                : quality == AmbientLightSettings.QUALITY_HIGH ? 72 : 48;
        int sampleHeight = Math.max(6, Math.round(sampleWidth
                * videoRect.height() / (float) Math.max(1, videoRect.width())));
        sampleHeight = Math.min(sampleHeight, sampleWidth * 3);
        // Read back 4x larger and average down for stable colours.
        int copyWidth = sampleWidth * PICTURE_SCALE;
        int copyHeight = sampleHeight * PICTURE_SCALE;
        if (captureBitmap == null || captureBitmap.getWidth() != copyWidth
                || captureBitmap.getHeight() != copyHeight) {
            captureBitmap = Bitmap.createBitmap(copyWidth, copyHeight, Bitmap.Config.ARGB_8888);
        }
        AmbientPageGlowView page = pageActive ? pageRef.get() : null;
        Geometry geometry = new Geometry(getWidth(), getHeight(), new Rect(videoRect),
                sampleWidth, sampleHeight, quality, barsActive, page,
                page == null ? 0 : page.getWidth(), page == null ? 0 : page.getHeight(),
                new Rect(pageVideoRect), new Rect(pagePlayerRect));
        Bitmap target = captureBitmap;
        try {
            if (surface instanceof SurfaceView) {
                SurfaceView surfaceView = (SurfaceView) surface;
                if (surfaceView.getHolder().getSurface() == null
                        || !surfaceView.getHolder().getSurface().isValid()) return false;
                copyInFlight = true;
                PixelCopy.request(surfaceView, target, result -> {
                    if (result == PixelCopy.SUCCESS) {
                        process(target, geometry);
                    } else {
                        post(() -> onCaptureFailed(result));
                    }
                    post(() -> copyInFlight = false);
                }, worker());
                return true;
            } else if (surface instanceof TextureView) {
                TextureView textureView = (TextureView) surface;
                if (!textureView.isAvailable()) return false;
                copyInFlight = true;
                textureView.getBitmap(target);
                worker().post(() -> {
                    process(target, geometry);
                    post(() -> copyInFlight = false);
                });
                return true;
            }
        } catch (Throwable throwable) {
            copyInFlight = false;
            onCaptureFailed(-1);
            Log.d(TAG, "Frame capture unavailable: " + throwable.getClass().getSimpleName());
        }
        return false;
    }

    private void onCaptureFailed(int result) {
        consecutiveFailures++;
        AmbientLightController.statusCapture = result == 0 ? -1 : -Math.abs(result) - 1;
        if (consecutiveFailures == MAX_FAILURES_BEFORE_BACKOFF) {
            // Typically protected (DRM) content: hide the light instead of showing stale colours.
            Log.d(TAG, "Frame capture failing (" + result + "), backing off");
            synchronized (frameLock) {
                frontBitmap = null;
            }
            requestDraw();
        }
    }

    /** Worker thread: builds the glow for one captured frame. */
    private void process(Bitmap capture, Geometry geometry) {
        try {
            int copyWidth = capture.getWidth();
            int copyHeight = capture.getHeight();
            int sampleWidth = geometry.sampleWidth;
            int sampleHeight = geometry.sampleHeight;
            int copyLength = copyWidth * copyHeight;
            if (capturePixels.length != copyLength) capturePixels = new int[copyLength];
            capture.getPixels(capturePixels, 0, copyWidth, 0, 0, copyWidth, copyHeight);
            int sampleLength = sampleWidth * sampleHeight;
            if (samplePixels.length != sampleLength || sampleWidth != lastSampleWidth) {
                samplePixels = new int[sampleLength];
                previousSample = new int[sampleLength];
                accumulatedValid = false;
                // Letterbox estimates are in sample coordinates; drop them on resize.
                stableBounds = null;
                candidateBounds = null;
                candidateCount = 0;
                lastSampleWidth = sampleWidth;
            }
            AmbientMath.downsample(capturePixels, copyWidth, copyHeight,
                    samplePixels, sampleWidth, sampleHeight);

            // Skip work on static pictures once the smoothed glow has converged.
            int difference = AmbientMath.meanDifference(samplePixels, previousSample, sampleLength);
            System.arraycopy(samplePixels, 0, previousSample, 0, sampleLength);
            staticFrames = difference == 0 ? staticFrames + 1 : 0;
            stillFrames = difference <= 1 ? stillFrames + 1 : 0;
            // A scene cut skips the smoothing so the new colours arrive at once, carried
            // out from the player by the wave look.
            boolean cut = AmbientLightSettings.isSceneWaveEnabled() && frameReady
                    && difference >= CUT_DIFFERENCE;
            if (cut) pageValid = false;
            if ((accumulatedValid || !geometry.bars) && (pageValid || geometry.page == null)
                    && frameReady && staticFrames > 30) {
                post(() -> consecutiveFailures = 0);
                return;
            }

            int[] bounds = {0, 0, sampleWidth, sampleHeight};
            boolean detectBars = AmbientLightSettings.isBarDetectionEnabled()
                    || AmbientLightSettings.shouldFillBars();
            if (detectBars) {
                int[] detected = stabilizeBounds(AmbientMath.detectContentBounds(
                        samplePixels, sampleWidth, sampleHeight), sampleWidth, sampleHeight);
                if (detected != null && detected[2] <= sampleWidth
                        && detected[3] <= sampleHeight) bounds = detected;
            }

            AmbientLightController.statusCapture = 1;
            if (geometry.page != null) {
                processPageGlow(geometry, bounds, cut, capturePixels, copyWidth, copyHeight);
            }
            if (!geometry.bars) {
                frameReady = true;
                post(() -> consecutiveFailures = 0);
                return;
            }

            // Glow buffer covering the whole player at low resolution.
            int glowWidth = geometry.quality == AmbientLightSettings.QUALITY_LOW ? 48
                    : geometry.quality == AmbientLightSettings.QUALITY_HIGH ? 96 : 64;
            int glowHeight = Math.max(8, Math.round(glowWidth * geometry.viewHeight
                    / (float) Math.max(1, geometry.viewWidth)));
            glowHeight = Math.min(glowHeight, glowWidth * 3);
            int glowLength = glowWidth * glowHeight;
            if (glowPixels.length != glowLength) {
                glowPixels = new int[glowLength];
                accumulatedPixels = new int[glowLength];
                scratchPixels = new int[glowLength];
                accumulatedValid = false;
            }
            float scaleX = glowWidth / (float) geometry.viewWidth;
            float scaleY = glowHeight / (float) geometry.viewHeight;
            Rect video = geometry.videoRect;
            Rect clip = new Rect(video);
            if (AmbientLightSettings.shouldFillBars()) {
                // Map content bounds from sample space back into view space.
                float sx = video.width() / (float) sampleWidth;
                float sy = video.height() / (float) sampleHeight;
                clip.set(video.left + Math.round(bounds[0] * sx),
                        video.top + Math.round(bounds[1] * sy),
                        video.left + Math.round(bounds[2] * sx),
                        video.top + Math.round(bounds[3] * sy));
            }
            float[] glowVideo = {
                    clip.left * scaleX, clip.top * scaleY,
                    clip.right * scaleX, clip.bottom * scaleY
            };
            float spread = AmbientLightSettings.getSpread() / 100f;
            AmbientMath.composeGlow(samplePixels, sampleWidth, bounds,
                    glowPixels, glowWidth, glowHeight, glowVideo, spread);
            int radius = Math.round(AmbientLightSettings.getBlur() / 100f * glowWidth / 6f);
            AmbientMath.blur(glowPixels, glowWidth, glowHeight, radius, scratchPixels);
            AmbientMath.applyEdgeFade(glowPixels, glowWidth, glowHeight, glowVideo,
                    AmbientLightSettings.getEdgeFade() / 100f);
            AmbientMath.blendInto(accumulatedPixels, glowPixels,
                    AmbientLightSettings.getSmoothing() / 100f, !accumulatedValid);
            accumulatedValid = true;

            Bitmap back;
            synchronized (frameLock) {
                back = backBitmap;
            }
            if (back == null || back.getWidth() != glowWidth || back.getHeight() != glowHeight) {
                back = Bitmap.createBitmap(glowWidth, glowHeight, Bitmap.Config.ARGB_8888);
            }
            back.setPixels(accumulatedPixels, 0, glowWidth, 0, 0, glowWidth, glowHeight);
            synchronized (frameLock) {
                backBitmap = frontBitmap;
                frontBitmap = back;
                frameClip.set(clip);
                frameViewWidth = geometry.viewWidth;
                frameViewHeight = geometry.viewHeight;
            }
            frameReady = true;
            post(() -> consecutiveFailures = 0);
            requestDraw();
        } catch (Throwable throwable) {
            Log.w(TAG, "Ambient frame processing failed", throwable);
        }
    }

    /** Worker thread: light leaking out of the player over the surrounding page. */
    private void processPageGlow(Geometry geometry, int[] bounds, boolean cut,
                                 int[] picture, int pictureWidth, int pictureHeight) {
        int quality = geometry.quality;
        int glowWidth = quality == AmbientLightSettings.QUALITY_LOW ? 40
                : quality == AmbientLightSettings.QUALITY_HIGH ? 80 : 56;
        boolean theater = AmbientLightSettings.getProfile().videoBackdrop;
        // Theater keeps recognisable shapes of the picture around the player.
        if (theater) glowWidth += 32;
        int glowHeight = Math.max(8, Math.round(glowWidth * geometry.pageHeight
                / (float) Math.max(1, geometry.pageWidth)));
        glowHeight = Math.min(glowHeight, glowWidth * 3);
        int length = glowWidth * glowHeight;
        if (pageGlowPixels.length != length) {
            pageGlowPixels = new int[length];
            pageAccumulated = new int[length];
            pageScratch = new int[length];
            pageOutput = new int[length];
            pageSoft = new int[length];
            pageValid = false;
        }
        float scaleX = glowWidth / (float) geometry.pageWidth;
        float scaleY = glowHeight / (float) geometry.pageHeight;
        Rect video = geometry.pageVideoRect;
        Rect player = geometry.pagePlayerRect;
        float[] glowVideo = {
                video.left * scaleX, video.top * scaleY,
                video.right * scaleX, video.bottom * scaleY
        };
        float[] glowPlayer = {
                player.left * scaleX, player.top * scaleY,
                player.right * scaleX, player.bottom * scaleY
        };
        // The picture inside burned-in or player bars, measured again on the 4x readback (a
        // colour sample spans dozens of screen pixels), in readback and page coordinates.
        int[] pictureBounds = AmbientMath.refineBounds(picture, pictureWidth, pictureHeight,
                bounds, PICTURE_SCALE);
        float boundsScaleX = video.width() / (float) pictureWidth;
        float boundsScaleY = video.height() / (float) pictureHeight;
        Rect content = new Rect(video.left + Math.round(pictureBounds[0] * boundsScaleX),
                video.top + Math.round(pictureBounds[1] * boundsScaleY),
                video.left + Math.round(pictureBounds[2] * boundsScaleX),
                video.top + Math.round(pictureBounds[3] * boundsScaleY));
        boolean pictureBackdrop = AmbientLightSettings.isPictureBackdropEnabled();
        int radius;
        if (pictureBackdrop) {
            // The picture itself fills the screen, seen through frosted glass.
            AmbientMath.cover(picture, pictureWidth, pictureHeight, pageGlowPixels, glowWidth,
                    glowHeight);
            radius = Math.max(2, glowWidth / 24);
        } else if (theater && !AmbientLightSettings.isSoftLightEnabled()) {
            // Straight out of the picture, coloured from all of it, crisp next to the player
            // and soft farther away.
            int scratchLength = AmbientMath.straightScratchLength(pictureBounds);
            if (straightScratch.length < scratchLength) straightScratch = new int[scratchLength];
            // Laid out from the picture itself, so the light also continues it sideways
            // through black bars.
            float[] glowContent = {
                    content.left * scaleX, content.top * scaleY,
                    content.right * scaleX, content.bottom * scaleY
            };
            AmbientMath.composeStraight(picture, pictureWidth, pictureBounds, pageGlowPixels,
                    glowWidth, glowHeight, glowContent, NEAR_BAND,
                    glowContent[3] - glowContent[1], straightScratch);
            System.arraycopy(pageGlowPixels, 0, pageSoft, 0, length);
            AmbientMath.blur(pageSoft, glowWidth, glowHeight, Math.max(2, glowWidth / 14),
                    pageScratch);
            AmbientMath.blur(pageGlowPixels, glowWidth, glowHeight, Math.max(1, glowWidth / 40),
                    pageScratch);
            AmbientMath.blendByDistance(pageGlowPixels, pageSoft, glowWidth, glowHeight,
                    glowContent, (glowContent[3] - glowContent[1]) * 0.9f);
            radius = 0;
        } else {
            // The page light is wider and softer than the in-player bar light.
            float spread = theater ? 0.15f : 0.35f + AmbientLightSettings.getSpread() / 100f;
            AmbientMath.composeGlow(samplePixels, geometry.sampleWidth, bounds,
                    pageGlowPixels, glowWidth, glowHeight, glowVideo, spread);
            radius = theater ? Math.max(2, glowWidth / 14)
                    : Math.max(1, Math.round((0.3f + AmbientLightSettings.getBlur() / 100f)
                    * glowWidth / 6f));
        }
        if (radius > 0) AmbientMath.blur(pageGlowPixels, glowWidth, glowHeight, radius, pageScratch);
        AmbientMath.blendInto(pageAccumulated, pageGlowPixels,
                AmbientLightSettings.getSmoothing() / 100f, !pageValid);
        pageValid = true;
        System.arraycopy(pageAccumulated, 0, pageOutput, 0, length);

        ImmersionProfile profile = AmbientLightSettings.getProfile();
        float falloff = profile.wholeScreen
                ? AmbientMath.farthestDistance(glowWidth, glowHeight, glowPlayer)
                : (glowPlayer[3] - glowPlayer[1]) * profile.reach;
        int average = AmbientMath.averageColor(samplePixels, geometry.sampleWidth, bounds);
        if (pictureBackdrop) {
            AmbientMath.scaleBrightness(pageOutput, length, 0.8f);
            AmbientMath.frost(pageOutput, length, 0.1f);
        } else {
            AmbientMath.applyPageFalloff(pageOutput, glowWidth, glowHeight, glowPlayer, falloff,
                    profile.strength, profile.floor, average, profile.averageMix);
            AmbientMath.toneLight(pageOutput, profile.gain, profile.lumaCap);
            // The player covers the light behind it anyway. Kept opaque, the enlarged light
            // does not fade out towards the player and show the page colour as a dark (or
            // white) line along its bottom edge.
            if (theater) AmbientMath.makeOpaque(pageOutput, length);
        }
        Bitmap bitmap = geometry.page.obtainBackBuffer(glowWidth, glowHeight);
        bitmap.setPixels(pageOutput, 0, glowWidth, 0, 0, glowWidth, glowHeight);
        long now = SystemClock.uptimeMillis();
        if (hasBrightPixel(picture, pictureWidth, pictureBounds[0], 0, pictureBounds[2],
                pictureBounds[1])) lastTopTextUptime = now;
        if (hasBrightPixel(picture, pictureWidth, pictureBounds[0], pictureBounds[3],
                pictureBounds[2], pictureHeight)) lastBottomTextUptime = now;
        geometry.page.publish(bitmap, player, content,
                now - lastTopTextUptime > BAR_TEXT_HOLD_MS,
                now - lastBottomTextUptime > BAR_TEXT_HOLD_MS,
                geometry.pageWidth, geometry.pageHeight, cut);
    }

    /**
     * Something bright (subtitles, a logo) in a bar region of the picture, which the light
     * inside the player must then leave uncovered.
     */
    private static boolean hasBrightPixel(int[] picture, int width, int left, int top,
                                          int right, int bottom) {
        for (int y = Math.max(0, top); y < bottom; y++) {
            int row = y * width;
            for (int x = Math.max(0, left); x < Math.min(width, right); x++) {
                if (AmbientMath.luma(picture[row + x]) > BAR_TEXT_LUMA) return true;
            }
        }
        return false;
    }

    /**
     * Accepts a new letterbox estimate only after it repeats, ignoring dark scenes. A picture
     * that grows (bars gone, a dark scene ended) is accepted at once, so the light inside the
     * player never stays over the picture.
     */
    private int[] stabilizeBounds(int[] detected, int width, int height) {
        if (detected == null) return stableBounds;
        boolean significant = detected[1] >= height * 0.03f
                || height - detected[3] >= height * 0.03f
                || detected[0] >= width * 0.03f || width - detected[2] >= width * 0.03f;
        int[] value = significant ? detected : new int[]{0, 0, width, height};
        if (stableBounds != null && value[0] <= stableBounds[0] && value[1] <= stableBounds[1]
                && value[2] >= stableBounds[2] && value[3] >= stableBounds[3]) {
            candidateBounds = value;
            candidateCount = STABLE_BAR_FRAMES;
            stableBounds = value;
            return stableBounds;
        }
        if (candidateBounds != null && java.util.Arrays.equals(candidateBounds, value)) {
            candidateCount++;
        } else {
            candidateBounds = value;
            candidateCount = 1;
        }
        if (stableBounds == null || candidateCount >= STABLE_BAR_FRAMES) stableBounds = value;
        return stableBounds;
    }

    boolean isPageLightShown() {
        return pageShown;
    }

    private void setTargetAlpha(float value) {
        if (targetAlpha != value) {
            targetAlpha = value;
            lastAlphaUptime = AnimationUtils.currentAnimationTimeMillis();
            requestDraw();
        }
    }

    /**
     * Light on the player's bars outside the picture goes to surfaces between the video and
     * YouTube's window, so a light frame does not redraw the player. Filled burned-in bars lie
     * inside the picture where the danmaku surface is, and are still drawn by this view.
     */
    private boolean wantsBarSurfaces() {
        return barsActive && !AmbientLightSettings.shouldFillBars() && isAttachedToWindow()
                && getParent() instanceof ViewGroup;
    }

    /** The next frame of the bars' light: on the surfaces once they show, else on this view. */
    private void requestDraw() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            post(this::requestDraw);
            return;
        }
        if (wantsBarSurfaces()) {
            if (!barFrameScheduled) {
                barFrameScheduled = true;
                Choreographer.getInstance().postFrameCallback(barFrame);
            }
            if (barsOnSurface) return;
        } else {
            releaseBars();
        }
        postInvalidateOnAnimation();
    }

    /** Main thread: one frame of the bars' light on the surfaces. */
    private void renderBars() {
        barFrameScheduled = false;
        if (!wantsBarSurfaces()) {
            releaseBars();
            return;
        }
        stepAlpha(AnimationUtils.currentAnimationTimeMillis());
        Bitmap bitmap;
        synchronized (frameLock) {
            bitmap = frontBitmap;
            if (bitmap != null && (frameViewWidth != getWidth() || frameViewHeight != getHeight())) {
                bitmap = null;
            }
            barClip.set(frameClip);
        }
        if (bitmap == null) return;
        barBitmap = bitmap;
        getLocationInWindow(windowLocation);
        rectPool.addAll(barRects);
        barRects.clear();
        int left = windowLocation[0];
        int top = windowLocation[1];
        barClip.offset(left, top);
        addBarRect(left, top, left + getWidth(), barClip.top);
        addBarRect(left, barClip.bottom, left + getWidth(), top + getHeight());
        addBarRect(left, barClip.top, barClip.left, barClip.bottom);
        addBarRect(barClip.right, barClip.top, left + getWidth(), barClip.bottom);
        if (barLayers == null) barLayers = new LightLayers(true, this::requestDraw, this::onBarsLost);
        ViewGroup parent = (ViewGroup) getParent();
        // Right above the video, below this view and YouTube's controls.
        if (barLayers.render(parent, parent.indexOfChild(this), barRects, barPainter)
                && !barsOnSurface) {
            barsOnSurface = true;
            invalidate();
        }
    }

    private void addBarRect(int left, int top, int right, int bottom) {
        if (right - left < 2 || bottom - top < 2) return;
        Rect rect = rectPool.isEmpty() ? new Rect() : rectPool.remove(rectPool.size() - 1);
        rect.set(left, top, right, bottom);
        barRects.add(rect);
    }

    private void onBarsLost() {
        if (!barsOnSurface) return;
        barsOnSurface = false;
        invalidate();
    }

    private void releaseBars() {
        if (barLayers == null) return;
        barLayers.release();
        barLayers = null;
        if (barsOnSurface) {
            barsOnSurface = false;
            invalidate();
        }
    }

    /** Fades towards the target strength; asks for another frame while it moves. */
    private void stepAlpha(long now) {
        if (alpha == targetAlpha) return;
        float step = (now - lastAlphaUptime) / (float) FADE_DURATION_MS;
        alpha = targetAlpha > alpha ? Math.min(targetAlpha, alpha + step)
                : Math.max(targetAlpha, alpha - step);
        lastAlphaUptime = now;
        if (alpha != targetAlpha) requestDraw();
    }

    @Override protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        // The bars' light is on its surfaces.
        if (barsOnSurface) return;
        stepAlpha(AnimationUtils.currentAnimationTimeMillis());
        if (alpha <= 0f) return;
        Bitmap bitmap;
        synchronized (frameLock) {
            bitmap = frontBitmap;
            if (bitmap == null || frameViewWidth != getWidth()
                    || frameViewHeight != getHeight()) return;
            drawRect.set(frameClip);
        }
        updateColorFilter();
        paint.setAlpha(Math.round(alpha * 255));
        int save = canvas.save();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            canvas.clipOutRect(drawRect);
        } else {
            canvas.clipRect(drawRect, android.graphics.Region.Op.DIFFERENCE);
        }
        drawRectF.set(0, 0, getWidth(), getHeight());
        canvas.drawBitmap(bitmap, null, drawRectF, paint);
        canvas.restoreToCount(save);
    }

    private void updateColorFilter() {
        int generation = AmbientLightSettings.getGeneration();
        if (generation == colorFilterGeneration) return;
        colorFilterGeneration = generation;
        ColorMatrix matrix = new ColorMatrix();
        matrix.setSaturation(AmbientLightSettings.getSaturation() / 100f);
        float brightness = AmbientLightSettings.getBrightness() / 100f;
        ColorMatrix scale = new ColorMatrix();
        scale.setScale(brightness, brightness, brightness, 1f);
        matrix.postConcat(scale);
        paint.setColorFilter(new ColorMatrixColorFilter(matrix));
    }

    private static final class Geometry {
        final int viewWidth;
        final int viewHeight;
        final Rect videoRect;
        final int sampleWidth;
        final int sampleHeight;
        final int quality;
        final boolean bars;
        final AmbientPageGlowView page;
        final int pageWidth;
        final int pageHeight;
        final Rect pageVideoRect;
        final Rect pagePlayerRect;

        Geometry(int viewWidth, int viewHeight, Rect videoRect,
                 int sampleWidth, int sampleHeight, int quality, boolean bars,
                 AmbientPageGlowView page, int pageWidth, int pageHeight,
                 Rect pageVideoRect, Rect pagePlayerRect) {
            this.viewWidth = viewWidth;
            this.viewHeight = viewHeight;
            this.videoRect = videoRect;
            this.sampleWidth = sampleWidth;
            this.sampleHeight = sampleHeight;
            this.quality = quality;
            this.bars = bars;
            this.page = page;
            this.pageWidth = pageWidth;
            this.pageHeight = pageHeight;
            this.pageVideoRect = pageVideoRect;
            this.pagePlayerRect = pagePlayerRect;
        }
    }
}
