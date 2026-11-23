package dev.materialtidal.extension.tidal.navbar;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.LruCache;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewParent;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import dev.materialtidal.extension.tidal.player.ExpressivePlayerView;
import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Material 3 Expressive Floating Mini-Player Stadium Pill.
 *
 * <p>Visual and spatial companion to {@link ExpressiveNavbarView}:
 * <ul>
 *   <li>Shared {@code 64dp} stadium height, {@code 32dp} full pill radius, {@code 3dp} outer
 *       padding, and {@link ExpressiveDockGlass} directional specular frosted glass.</li>
 *   <li>Off-main-thread cover palette derivation fueling a smooth left-anchored ambient cover
 *       glow and adaptive Play/Pause button accent tint with contrast protection.</li>
 *   <li>Zero-flash artwork crossfade + Play/Pause concentric corner morph ({@code 22dp <-> 15dp})
 *       and smooth icon morph/rotation.</li>
 *   <li>Directional track-change text slide, next-arrow kick spring + circular touch halo,
 *       blooming swipe-left-to-skip preview pill, and vertical pull-up-to-open gesture coupled
 *       with the navbar below.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class ExpressiveMiniPlayerView extends View {

    private static final float CARD_HEIGHT_DP = ExpressiveDockGlass.BAR_HEIGHT_DP;
    private static final float TOP_PAD_DP = 3f;
    private static final float BOTTOM_PAD_DP = 3f;
    private static final float TOTAL_HEIGHT_DP = TOP_PAD_DP + CARD_HEIGHT_DP + BOTTOM_PAD_DP;
    private static final float HORIZ_INSET_DP = ExpressiveDockGlass.HORIZ_PAD_DP;
    private static final float CARD_RADIUS_DP = 32f;
    private static final float ART_SIZE_DP = 48f;
    private static final float PLAY_BTN_SIZE_DP = 44f;
    private static final float NEXT_BTN_SIZE_DP = 36f;
    private static final float SWIPE_TRIGGER_DP = 54f;
    private static final float PULL_UP_TRIGGER_DP = 19f;
    private static final float PULL_UP_MAX_DP = 28f;

    private static final class CachedArt {
        final Bitmap bitmap;
        final int accentRgb;
        final boolean hasAccent;

        CachedArt(Bitmap bitmap, int accentRgb, boolean hasAccent) {
            this.bitmap = bitmap;
            this.accentRgb = accentRgb;
            this.hasAccent = hasAccent;
        }
    }

    private static final LruCache<String, CachedArt> ART_CACHE = new LruCache<>(32);
    private static final ExecutorService ART_EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private final float density;
    private final float touchSlop;
    private final ExpressiveDockGlass.DockPillShaderCache pillGlass =
            new ExpressiveDockGlass.DockPillShaderCache();

    // Current bound state
    private boolean hasMedia;
    private String title = "";
    private String artist = "";
    private String coverId;
    private String playState = "Paused";
    private boolean canSkipToNext;
    private boolean isExplicit;

    // Crossfaded artwork + cover accent glow
    private Bitmap previousBitmap;
    private Bitmap currentBitmap;
    private float artFadeAlpha = 1f;
    private float artBloom = 0f;
    private float artBloomVel = 0f;

    private int prevAccentRgb = 0;
    private boolean prevHasAccent = false;
    private int targetAccentRgb = 0;
    private boolean targetHasAccent = false;
    private float glowColorProgress = 1f;

    // Directional track-change text slide
    private String activeTrackKey;
    private String outgoingTitle;
    private String outgoingArtist;
    private boolean outgoingExplicit;
    private float trackSlideProgress = 1f;
    private float trackSlideVel = 0f;
    private int trackSlideDir = -1; // -1 = swipe-left/next, +1 = swipe-right/previous
    private int pendingSlideDir = 0;

    // Entrance & Play/Pause & Control springs
    private float enterProgress = 1f;
    private float enterVel = 0f;
    private float playShapeMorph = 0f; // 0 = Paused (circle), 1 = Playing (squircle)
    private float playShapeVel = 0f;
    private float cardScale = 1f;
    private float cardScaleVel = 0f;
    private float playBtnScale = 1f;
    private float playBtnScaleVel = 0f;
    private float nextBtnScale = 1f;
    private float nextBtnScaleVel = 0f;
    private float nextArrowKickX = 0f;
    private float nextArrowKickVel = 0f;

    // Gesture drag springs
    private float dragOffsetX = 0f;
    private float dragOffsetVel = 0f;
    private float dragOffsetY = 0f;
    private float dragOffsetYVel = 0f;
    private float swipeCommitPulse = 0f;
    private float swipeCommitVel = 0f;
    private float bufferingAngleDeg = 0f;

    // Touch tracking
    private static final int HIT_NONE = 0;
    private static final int HIT_CARD = 1;
    private static final int HIT_PLAY = 2;
    private static final int HIT_NEXT = 3;

    private int activeHitTarget = HIT_NONE;
    private float downX;
    private float downY;
    private float downRawX;
    private float downRawY;
    private boolean isHorizontalSwiping;
    private boolean isVerticalPulling;
    private boolean isInteractiveOverlayDragging;
    private boolean expandOverlayActive;
    private boolean swipeThresholdCrossed;
    private boolean pullThresholdCrossed;
    private VelocityTracker velocityTracker;

    // Frame ticker
    private long lastFrameMs;
    private boolean isAnimating;
    private final Runnable frameTick = this::stepAnimations;

    // Reusable drawing primitives
    private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint artPaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final Paint prevArtPaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final TextPaint titlePaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint subtitlePaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint explicitPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final Path artClipPath = new Path();
    private final Path iconPath = new Path();

    private final RectF cardRect = new RectF();
    private final RectF artRect = new RectF();
    private final RectF playBtnRect = new RectF();
    private final RectF nextBtnRect = new RectF();
    private final RectF tempRect = new RectF();

    private final Drawable iconPlay;
    private final Drawable iconPause;
    private final Drawable iconNext;
    private final Drawable iconPrev;

    public ExpressiveMiniPlayerView(Context context) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        this.touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        setWillNotDraw(false);
        setForceDarkAllowed(false);
        setClickable(true);
        setVisibility(GONE);

        titlePaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        titlePaint.setTextSize(14.5f * density);

        subtitlePaint.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
        subtitlePaint.setTextSize(12.5f * density);

        explicitPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        explicitPaint.setTextSize(9.5f * density);
        explicitPaint.setTextAlign(Paint.Align.CENTER);

        strokePaint.setStyle(Paint.Style.STROKE);
        strokePaint.setStrokeCap(Paint.Cap.ROUND);
        strokePaint.setStrokeJoin(Paint.Join.ROUND);

        iconPlay = loadTidalIcon(context, "ic_play");
        iconPause = loadTidalIcon(context, "ic_pause");
        iconNext = loadTidalIcon(context, "ic_next");
        iconPrev = loadTidalIcon(context, "ic_previous");
    }

    public void updateState(
            boolean newHasMedia,
            String newTitle,
            String newArtist,
            String newCoverId,
            String newPlayState,
            boolean newCanSkipNext,
            boolean newExplicit
    ) {
        boolean wasVisible = this.hasMedia;
        this.hasMedia = newHasMedia;
        if (!newHasMedia) {
            setVisibility(GONE);
            removeCallbacks(frameTick);
            isAnimating = false;
            if (wasVisible) {
                ExpressiveScaffoldBridge.notifyDockMiniPlayerPresenceChanged(false);
            }
            return;
        }

        if (getVisibility() != VISIBLE) {
            setVisibility(VISIBLE);
        }

        String safeTitle = newTitle == null ? "" : newTitle;
        String safeArtist = newArtist == null ? "" : newArtist;
        String safePlayState = newPlayState == null ? "Paused" : newPlayState;
        String newTrackKey = safeTitle + "|" + safeArtist;

        boolean startedPlaying = !"Playing".equals(this.playState) && "Playing".equals(safePlayState);
        boolean coverChanged = (newCoverId != null && !newCoverId.equals(this.coverId))
                || (newCoverId == null && this.coverId != null);

        if (!wasVisible) {
            enterProgress = 0f;
            enterVel = 0f;
            playShapeMorph = "Playing".equals(safePlayState) ? 1f : 0f;
            playShapeVel = 0f;
            ExpressiveScaffoldBridge.notifyDockMiniPlayerPresenceChanged(true);
        } else if (activeTrackKey != null && !activeTrackKey.equals(newTrackKey)) {
            if (trackSlideProgress > 0.35f) {
                outgoingTitle = this.title;
                outgoingArtist = this.artist;
                outgoingExplicit = this.isExplicit;
                trackSlideProgress = 0f;
                trackSlideVel = 0f;
            }
            trackSlideDir = pendingSlideDir != 0 ? pendingSlideDir : -1;
            pendingSlideDir = 0;
        }

        if (startedPlaying) {
            artBloomVel = 0.55f;
        }

        this.activeTrackKey = newTrackKey;
        this.title = safeTitle;
        this.artist = safeArtist;
        this.coverId = newCoverId;
        this.playState = safePlayState;
        this.canSkipToNext = newCanSkipNext;
        this.isExplicit = newExplicit;

        if (coverChanged) {
            loadArtworkAsync(newCoverId);
            ExpressivePlayerView.prewarmArtwork(newCoverId);
        }

        startAnimationLoop();
        invalidate();
    }

    public static Bitmap getCachedArtwork(String resourceId) {
        if (resourceId == null || resourceId.isEmpty()) {
            return null;
        }
        CachedArt cached = ART_CACHE.get(resourceId);
        return cached != null ? cached.bitmap : null;
    }

    private void loadArtworkAsync(final String resourceId) {
        if (resourceId == null || resourceId.isEmpty()) {
            previousBitmap = currentBitmap;
            currentBitmap = null;
            artFadeAlpha = 0f;
            prevAccentRgb = resolveCurrentAccentRgb();
            prevHasAccent = isAnyAccentActive();
            targetAccentRgb = 0;
            targetHasAccent = false;
            glowColorProgress = 0f;
            startAnimationLoop();
            return;
        }
        CachedArt cached = ART_CACHE.get(resourceId);
        if (cached != null) {
            applyNewArt(cached);
            return;
        }

        final String requestedId = resourceId;
        ART_EXECUTOR.execute(() -> {
            Bitmap loaded = fetchCoverBitmap(requestedId);
            if (loaded != null) {
                int accent = 0;
                boolean hasAccent = false;
                Bitmap sample = null;
                try {
                    sample = Bitmap.createScaledBitmap(loaded, 24, 24, true);
                    ExpressiveMediaStyleKit.ExpressivePalette pal =
                            ExpressiveMediaStyleKit.derivePaletteFromSample(sample);
                    if (pal != null) {
                        accent = pal.primaryAccent;
                        hasAccent = true;
                    }
                } catch (Throwable ignored) {
                } finally {
                    if (sample != null && sample != loaded && !sample.isRecycled()) {
                        sample.recycle();
                    }
                }
                final CachedArt entry = new CachedArt(loaded, accent, hasAccent);
                ART_CACHE.put(requestedId, entry);
                MAIN_HANDLER.post(() -> {
                    if (requestedId.equals(ExpressiveMiniPlayerView.this.coverId)) {
                        applyNewArt(entry);
                    }
                });
            }
        });
    }

    private void applyNewArt(CachedArt entry) {
        prevAccentRgb = resolveCurrentAccentRgb();
        prevHasAccent = isAnyAccentActive();
        previousBitmap = currentBitmap;
        currentBitmap = entry.bitmap;
        artFadeAlpha = 0f;
        targetAccentRgb = entry.accentRgb;
        targetHasAccent = entry.hasAccent;
        glowColorProgress = 0f;
        startAnimationLoop();
    }

    private boolean isAnyAccentActive() {
        return prevHasAccent || targetHasAccent;
    }

    private int resolveCurrentAccentRgb() {
        float g = Math.max(0f, Math.min(1f, glowColorProgress));
        if (prevHasAccent && targetHasAccent) {
            return MaterialYouColorEngine.blendRgb(prevAccentRgb, targetAccentRgb, g);
        }
        if (targetHasAccent) {
            return targetAccentRgb;
        }
        return prevAccentRgb;
    }

    private float resolveCurrentAccentStrength() {
        float g = Math.max(0f, Math.min(1f, glowColorProgress));
        float prevS = prevHasAccent ? 1f : 0f;
        float targetS = targetHasAccent ? 1f : 0f;
        return prevS * (1f - g) + targetS * g;
    }

    private static Bitmap fetchCoverBitmap(String resourceId) {
        HttpURLConnection conn = null;
        try {
            String path = resourceId.trim().replace('-', '/');
            URL url = new URL("https://resources.tidal.com/images/" + path + "/160x160.jpg");
            conn = (HttpURLConnection) url.openConnection();
            conn.setConnectTimeout(4500);
            conn.setReadTimeout(4500);
            conn.setDoInput(true);
            conn.connect();
            if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                try (InputStream is = conn.getInputStream()) {
                    return BitmapFactory.decodeStream(is);
                }
            }
        } catch (Throwable ignored) {
        } finally {
            if (conn != null) {
                conn.disconnect();
            }
        }
        return null;
    }

    private void startAnimationLoop() {
        if (!isAnimating && hasMedia) {
            isAnimating = true;
            lastFrameMs = SystemClock.uptimeMillis();
            postOnAnimation(frameTick);
        }
    }

    private void stepAnimations() {
        if (!isAnimating || !hasMedia) {
            return;
        }
        long now = SystemClock.uptimeMillis();
        float dt = Math.min(0.032f, Math.max(0.004f, (now - lastFrameMs) / 1000f));
        lastFrameMs = now;

        boolean settled = true;

        // 1. Entrance spring
        if (enterProgress < 1f || Math.abs(enterVel) > 0.005f) {
            float[] eRes = stepSpring(enterProgress, enterVel, 1f, 340f, 0.72f, dt);
            enterProgress = Math.max(0f, Math.min(1.06f, eRes[0]));
            enterVel = eRes[1];
            if (isSettled(enterProgress, enterVel, 1f)) {
                enterProgress = 1f;
                enterVel = 0f;
            } else {
                settled = false;
            }
        }

        // 2. Play/Pause squircle-to-circle corner & icon morph spring
        float targetMorph = "Playing".equals(playState) ? 1f : 0f;
        float[] morphRes = stepSpring(playShapeMorph, playShapeVel, targetMorph, 380f, 0.72f, dt);
        playShapeMorph = Math.max(-0.06f, Math.min(1.08f, morphRes[0]));
        playShapeVel = morphRes[1];
        if (!isSettled(playShapeMorph, playShapeVel, targetMorph)) {
            settled = false;
        } else {
            playShapeMorph = targetMorph;
            playShapeVel = 0f;
        }

        // 3. Card press scale spring
        float targetCardScale = (activeHitTarget == HIT_CARD && !isHorizontalSwiping && !isVerticalPulling)
                ? 0.975f : 1f;
        float[] scaleRes = stepSpring(cardScale, cardScaleVel, targetCardScale, 520f, 0.78f, dt);
        cardScale = Math.max(0.92f, Math.min(1.04f, scaleRes[0]));
        cardScaleVel = scaleRes[1];
        if (!isSettled(cardScale, cardScaleVel, targetCardScale)) {
            settled = false;
        } else {
            cardScale = targetCardScale;
            cardScaleVel = 0f;
        }

        // 4. Play button press scale spring
        float targetPlayScale = (activeHitTarget == HIT_PLAY) ? 0.87f : 1f;
        float[] pScaleRes = stepSpring(playBtnScale, playBtnScaleVel, targetPlayScale, 540f, 0.68f, dt);
        playBtnScale = Math.max(0.80f, Math.min(1.08f, pScaleRes[0]));
        playBtnScaleVel = pScaleRes[1];
        if (!isSettled(playBtnScale, playBtnScaleVel, targetPlayScale)) {
            settled = false;
        } else {
            playBtnScale = targetPlayScale;
            playBtnScaleVel = 0f;
        }

        // 5. Next button scale & forward kick springs
        float targetNextScale = (activeHitTarget == HIT_NEXT) ? 0.84f : 1f;
        float[] nScaleRes = stepSpring(nextBtnScale, nextBtnScaleVel, targetNextScale, 560f, 0.66f, dt);
        nextBtnScale = Math.max(0.76f, Math.min(1.10f, nScaleRes[0]));
        nextBtnScaleVel = nScaleRes[1];
        if (!isSettled(nextBtnScale, nextBtnScaleVel, targetNextScale)) {
            settled = false;
        } else {
            nextBtnScale = targetNextScale;
            nextBtnScaleVel = 0f;
        }

        if (Math.abs(nextArrowKickX) > 0.05f || Math.abs(nextArrowKickVel) > 0.5f) {
            float[] kRes = stepSpring(nextArrowKickX, nextArrowKickVel, 0f, 440f, 0.64f, dt);
            nextArrowKickX = Math.max(-2f * density, Math.min(6f * density, kRes[0]));
            nextArrowKickVel = kRes[1];
            if (Math.abs(nextArrowKickX) < 0.05f && Math.abs(nextArrowKickVel) < 0.5f) {
                nextArrowKickX = 0f;
                nextArrowKickVel = 0f;
            } else {
                settled = false;
            }
        }

        // 6. Swipe & pull-up release spring snap-backs + commit pulse
        float targetCommitPulse = (isHorizontalSwiping && swipeThresholdCrossed) ? 1f : 0f;
        if (Math.abs(swipeCommitPulse - targetCommitPulse) > 0.005f || Math.abs(swipeCommitVel) > 0.01f) {
            float[] cpRes = stepSpring(swipeCommitPulse, swipeCommitVel, targetCommitPulse, 520f, 0.58f, dt);
            swipeCommitPulse = Math.max(-0.08f, Math.min(1.25f, cpRes[0]));
            swipeCommitVel = cpRes[1];
            if (isSettled(swipeCommitPulse, swipeCommitVel, targetCommitPulse)) {
                swipeCommitPulse = targetCommitPulse;
                swipeCommitVel = 0f;
            } else {
                settled = false;
            }
        }

        if (!isHorizontalSwiping && (Math.abs(dragOffsetX) > 0.25f || Math.abs(dragOffsetVel) > 0.5f)) {
            float[] dragRes = stepSpring(dragOffsetX, dragOffsetVel, 0f, 380f, 0.72f, dt);
            dragOffsetX = dragRes[0];
            dragOffsetVel = dragRes[1];
            settled = false;
        } else if (!isHorizontalSwiping) {
            dragOffsetX = 0f;
            dragOffsetVel = 0f;
        }

        if (!isVerticalPulling && (Math.abs(dragOffsetY) > 0.2f || Math.abs(dragOffsetYVel) > 0.5f)) {
            float[] pullRes = stepSpring(dragOffsetY, dragOffsetYVel, 0f, 380f, 0.72f, dt);
            dragOffsetY = pullRes[0];
            dragOffsetYVel = pullRes[1];
            if (!expandOverlayActive) {
                float pullFrac = Math.max(0f, Math.min(1f, -dragOffsetY / (20f * density)));
                ExpressiveScaffoldBridge.notifyMiniPlayerPullUp(pullFrac);
            }
            settled = false;
        } else if (!isVerticalPulling) {
            dragOffsetY = 0f;
            dragOffsetYVel = 0f;
        }

        // 7. Artwork crossfade, cover bloom, ambient glow color blend & text slide
        if (artFadeAlpha < 1f) {
            artFadeAlpha = Math.min(1f, artFadeAlpha + dt / 0.26f);
            if (artFadeAlpha >= 1f) {
                previousBitmap = null;
            } else {
                settled = false;
            }
        }

        if (Math.abs(artBloom) > 0.001f || Math.abs(artBloomVel) > 0.005f) {
            float[] bRes = stepSpring(artBloom, artBloomVel, 0f, 360f, 0.64f, dt);
            artBloom = Math.max(-0.02f, Math.min(0.06f, bRes[0]));
            artBloomVel = bRes[1];
            if (isSettled(artBloom, artBloomVel, 0f)) {
                artBloom = 0f;
                artBloomVel = 0f;
            } else {
                settled = false;
            }
        }

        if (glowColorProgress < 1f) {
            glowColorProgress = Math.min(1f, glowColorProgress + dt / 0.38f);
            if (glowColorProgress < 1f) {
                settled = false;
            }
        }

        if (trackSlideProgress < 1f || Math.abs(trackSlideVel) > 0.005f) {
            float[] tRes = stepSpring(trackSlideProgress, trackSlideVel, 1f, 380f, 0.84f, dt);
            trackSlideProgress = Math.max(0f, Math.min(1.03f, tRes[0]));
            trackSlideVel = tRes[1];
            if (isSettled(trackSlideProgress, trackSlideVel, 1f)) {
                trackSlideProgress = 1f;
                trackSlideVel = 0f;
                outgoingTitle = null;
                outgoingArtist = null;
            } else {
                settled = false;
            }
        }

        // 8. Buffering spinner orbit (only active while actively buffering)
        if ("Buffering".equals(playState)) {
            bufferingAngleDeg = (bufferingAngleDeg + 360f * dt) % 360f;
            settled = false;
        }

        invalidate();

        if (!settled) {
            postOnAnimation(frameTick);
        } else {
            isAnimating = false;
        }
    }

    private static float[] stepSpring(
            float pos,
            float vel,
            float target,
            float stiffness,
            float dampingRatio,
            float dt
    ) {
        float damping = 2f * dampingRatio * (float) Math.sqrt(stiffness);
        float force = -stiffness * (pos - target) - damping * vel;
        vel += force * dt;
        pos += vel * dt;
        return new float[]{pos, vel};
    }

    private static boolean isSettled(float pos, float vel, float target) {
        return Math.abs(pos - target) < 0.001f && Math.abs(vel) < 0.005f;
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        post(() -> ExpressiveMiniPlayerExpandOverlayView.ensureAttachedFromMiniPlayer(this));
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        removeCallbacks(frameTick);
        isAnimating = false;
        recycleVelocityTracker();
    }

    public String getTrackTitle() {
        return title;
    }

    public String getTrackArtist() {
        return artist;
    }

    public String getTrackCoverId() {
        return coverId;
    }

    public String getTrackPlayState() {
        return playState;
    }

    public boolean canTrackSkipToNext() {
        return canSkipToNext;
    }

    public boolean isTrackExplicit() {
        return isExplicit;
    }

    public Bitmap getCurrentArtworkBitmap() {
        return currentBitmap != null ? currentBitmap : previousBitmap;
    }

    public void getBaseCardRect(RectF out) {
        int w = getWidth();
        float insetX = HORIZ_INSET_DP * density;
        float top = TOP_PAD_DP * density;
        float cardH = CARD_HEIGHT_DP * density;
        out.set(insetX, top, Math.max(insetX + cardH, w - insetX), top + cardH);
    }

    public void getBaseArtRect(RectF out) {
        float insetX = HORIZ_INSET_DP * density;
        float top = TOP_PAD_DP * density;
        float cardH = CARD_HEIGHT_DP * density;
        float artSize = ART_SIZE_DP * density;
        float artPad = (cardH - artSize) * 0.5f;
        float artLeft = insetX + artPad;
        float artTop = top + artPad;
        out.set(artLeft, artTop, artLeft + artSize, artTop + artSize);
    }

    public float getCurrentArtCornerRadiusPx() {
        float clampedMorph = Math.max(0f, Math.min(1f, playShapeMorph));
        return (22f * (1f - clampedMorph) + 15f * clampedMorph) * density;
    }

    public void setExpandOverlayActive(boolean active) {
        if (this.expandOverlayActive != active) {
            this.expandOverlayActive = active;
            invalidate();
        }
    }

    public void drawSheetBaseGlass(Canvas canvas, RectF sheetRect, float radius) {
        int surfaceColor = MaterialYouColorEngine.getMiniPlayerSurfaceColor();
        int borderColor = MaterialYouColorEngine.getMiniPlayerBorderColor();
        int shadowBase = MaterialYouColorEngine.getNavbarShadowColor();
        boolean frostedMini = ExpressiveDockGlass.isFrostedDockEnabled();
        ExpressiveDockGlass.drawGlassPill(
                canvas,
                sheetRect,
                radius,
                density,
                surfaceColor,
                borderColor,
                shadowBase,
                frostedMini,
                resolveCurrentAccentRgb(),
                resolveCurrentAccentStrength(),
                pillGlass);
    }

    public void drawCompactSheetHeaderContent(
            Canvas canvas,
            float sheetLeft,
            float sheetTop,
            float sheetRight,
            float alpha
    ) {
        float cardH = CARD_HEIGHT_DP * density;
        float centerY = sheetTop + cardH * 0.5f;
        float artSize = ART_SIZE_DP * density;
        float artPad = (cardH - artSize) * 0.5f;
        float artRight = sheetLeft + artPad + artSize;

        float rightPad = 10f * density;
        float nextSize = NEXT_BTN_SIZE_DP * density;
        float playSize = PLAY_BTN_SIZE_DP * density;
        float btnGap = 4f * density;
        float nextCx = sheetRight - rightPad - nextSize * 0.5f;
        float playCx = nextCx - nextSize * 0.5f - btnGap - playSize * 0.5f;

        int titleColor = MaterialYouColorEngine.getMiniPlayerTitleColor();
        int subtitleColor = MaterialYouColorEngine.getMiniPlayerSubtitleColor();
        int basePlayBg = MaterialYouColorEngine.getMiniPlayerPlayBgColor();
        int basePlayIcon = MaterialYouColorEngine.getMiniPlayerPlayIconColor();
        int accentRgb = resolveCurrentAccentRgb();
        float accentStrength = resolveCurrentAccentStrength();

        int playBgColor = (accentStrength > 0.01f && !MaterialYouColorEngine.isEffectiveAmoledBlack())
                ? MaterialYouColorEngine.blendRgb(basePlayBg, accentRgb, 0.28f * accentStrength)
                : basePlayBg;
        int playIconColor = resolveContrastPlayIcon(playBgColor, basePlayIcon);

        float clampedMorph = Math.max(0f, Math.min(1f, playShapeMorph));
        float playCorner = ((playSize * 0.5f) * (1f - clampedMorph)) + ((14f * density) * clampedMorph);

        int a255 = Math.round(255f * Math.max(0f, Math.min(1f, alpha)));
        tempRect.set(playCx - playSize * 0.5f, centerY - playSize * 0.5f,
                playCx + playSize * 0.5f, centerY + playSize * 0.5f);
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(MaterialYouColorEngine.withAlpha(playBgColor, a255));
        canvas.drawRoundRect(tempRect, playCorner, playCorner, fillPaint);
        drawMorphingPlayPauseIcon(
                canvas, playCx, centerY, clampedMorph,
                MaterialYouColorEngine.withAlpha(playIconColor, a255));

        int nextCol = canSkipToNext
                ? MaterialYouColorEngine.withAlpha(titleColor, a255)
                : MaterialYouColorEngine.withAlpha(subtitleColor, Math.round(0x60 * alpha));
        drawSkipNextIcon(canvas, nextCx, centerY, 6.5f * density, nextCol);

        float textLeft = artRight + 12f * density;
        float textRight = (playCx - playSize * 0.5f) - 10f * density;
        float textMaxW = Math.max(24f * density, textRight - textLeft);
        drawTrackLabels(
                canvas,
                title,
                artist,
                isExplicit,
                textLeft,
                centerY,
                textMaxW,
                MaterialYouColorEngine.withAlpha(titleColor, a255),
                MaterialYouColorEngine.withAlpha(subtitleColor, a255));
    }

    private static int resolveContrastPlayIcon(int bgColor, int preferredIcon) {
        boolean lightMode = MaterialYouColorEngine.isLightMode();
        int darkFallback = lightMode
                ? MaterialYouColorEngine.getOnSurface()
                : MaterialYouColorEngine.getSurfaceBase();
        int lightFallback = lightMode
                ? MaterialYouColorEngine.getSurfaceBase()
                : MaterialYouColorEngine.getOnSurface();
        int darkCand = ExpressiveDockGlass.isLightColor(preferredIcon) ? darkFallback : preferredIcon;
        int lightCand = ExpressiveDockGlass.isLightColor(preferredIcon) ? preferredIcon : lightFallback;
        return ExpressiveDockGlass.pickContrastColor(bgColor, darkCand, lightCand);
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int desiredWidth = MeasureSpec.getMode(widthMeasureSpec) == MeasureSpec.UNSPECIFIED
                ? Math.round(360f * density)
                : MeasureSpec.getSize(widthMeasureSpec);
        int desiredHeight = hasMedia ? Math.round(TOTAL_HEIGHT_DP * density) : 0;
        setMeasuredDimension(desiredWidth, desiredHeight);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (!hasMedia) {
            return;
        }
        int w = getWidth();
        int h = getHeight();
        if (w <= 0 || h <= 0) {
            return;
        }

        float insetX = HORIZ_INSET_DP * density;
        float top = TOP_PAD_DP * density;
        float cardH = CARD_HEIGHT_DP * density;
        float bottom = top + cardH;
        float radius = CARD_RADIUS_DP * density;

        if (expandOverlayActive) {
            cardRect.set(insetX, top, w - insetX, bottom);
            return;
        }

        int surfaceColor = MaterialYouColorEngine.getMiniPlayerSurfaceColor();
        int borderColor = MaterialYouColorEngine.getMiniPlayerBorderColor();
        int titleColor = MaterialYouColorEngine.getMiniPlayerTitleColor();
        int subtitleColor = MaterialYouColorEngine.getMiniPlayerSubtitleColor();
        int basePlayBg = MaterialYouColorEngine.getMiniPlayerPlayBgColor();
        int basePlayIcon = MaterialYouColorEngine.getMiniPlayerPlayIconColor();
        int shadowBase = MaterialYouColorEngine.getNavbarShadowColor();
        boolean frostedMini = ExpressiveDockGlass.isFrostedDockEnabled();

        int accentRgb = resolveCurrentAccentRgb();
        float accentStrength = resolveCurrentAccentStrength();

        int activeSwipeAccentBg = (accentStrength > 0.01f && !MaterialYouColorEngine.isEffectiveAmoledBlack())
                ? MaterialYouColorEngine.blendRgb(basePlayBg, accentRgb, 0.32f * accentStrength)
                : basePlayBg;
        int activeSwipeAccentIcon = resolveContrastPlayIcon(activeSwipeAccentBg, basePlayIcon);

        // 0. Live Swipe-Left (Skip) & Swipe-Right (Previous) blooming preview pills behind leading/trailing edges
        if (dragOffsetX < -2f * density && canSkipToNext) {
            drawSwipeActionPreviewPill(
                    canvas, false, w, insetX, top, bottom, cardH,
                    surfaceColor, borderColor, activeSwipeAccentBg, activeSwipeAccentIcon, frostedMini);
        } else if (dragOffsetX > 2f * density) {
            drawSwipeActionPreviewPill(
                    canvas, true, w, insetX, top, bottom, cardH,
                    surfaceColor, borderColor, activeSwipeAccentBg, activeSwipeAccentIcon, frostedMini);
        }

        cardRect.set(insetX + dragOffsetX, top, w - insetX + dragOffsetX, bottom);

        float clampedEnter = Math.max(0f, Math.min(1.06f, enterProgress));
        float enterAlpha = Math.max(0f, Math.min(1f, clampedEnter * 1.4f));
        float pullFrac = Math.max(0f, Math.min(1f, -dragOffsetY / (20f * density)));
        float swipeStretch = 1f - 0.014f * Math.min(1f, Math.abs(dragOffsetX) / (60f * density));
        float totalScale = cardScale * swipeStretch * (0.94f + 0.06f * clampedEnter) * (1f + 0.03f * pullFrac);
        float translateY = (1f - clampedEnter) * 14f * density + dragOffsetY * 0.55f;
        float swipeTiltDeg = (dragOffsetX / (88f * density)) * 1.15f;

        int layerSave = -1;
        if (enterAlpha < 0.99f) {
            layerSave = canvas.saveLayerAlpha(0f, 0f, w, h, Math.round(255f * enterAlpha));
        } else {
            canvas.save();
        }
        canvas.translate(0f, translateY);
        if (Math.abs(swipeTiltDeg) > 0.02f) {
            canvas.rotate(swipeTiltDeg, cardRect.centerX(), cardRect.centerY());
        }
        canvas.scale(totalScale, totalScale, cardRect.centerX(), cardRect.centerY());

        // 1. Unified ExpressiveDockGlass pill (shadow + frosted fill + left cover glow + specular rim)
        ExpressiveDockGlass.drawGlassPill(
                canvas,
                cardRect,
                radius,
                density,
                surfaceColor,
                borderColor,
                shadowBase,
                frostedMini,
                accentRgb,
                accentStrength,
                pillGlass);

        // Delicate centered grab handle pill fading in while pulling up to open full player
        if (pullFrac > 0.04f) {
            float handleW = 26f * density;
            float handleH = 2.8f * density;
            tempRect.set(
                    cardRect.centerX() - handleW * 0.5f,
                    cardRect.top + 3.5f * density,
                    cardRect.centerX() + handleW * 0.5f,
                    cardRect.top + 3.5f * density + handleH);
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(
                    subtitleColor, Math.round(0x88 * pullFrac)));
            canvas.drawRoundRect(tempRect, handleH * 0.5f, handleH * 0.5f, fillPaint);
        }

        // 2. Morphing Concentric Album Art (48dp x 48dp, 22dp Paused circle <-> 15dp Playing squircle)
        float clampedMorph = Math.max(0f, Math.min(1f, playShapeMorph));
        float artSize = ART_SIZE_DP * density;
        float artPad = (cardH - artSize) * 0.5f;
        float artLeft = cardRect.left + artPad;
        float artTop = cardRect.top + artPad;
        artRect.set(artLeft, artTop, artLeft + artSize, artTop + artSize);
        float artRadius = (22f * (1f - clampedMorph) + 15f * clampedMorph) * density;

        canvas.save();
        float artScale = 1f + artBloom;
        if (Math.abs(artScale - 1f) > 0.001f) {
            canvas.scale(artScale, artScale, artRect.centerX(), artRect.centerY());
        }

        artClipPath.reset();
        artClipPath.addRoundRect(artRect, artRadius, artRadius, Path.Direction.CW);
        canvas.save();
        canvas.clipPath(artClipPath);

        if ((currentBitmap == null && previousBitmap == null) || artFadeAlpha < 0.99f) {
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(MaterialYouColorEngine.getMiniPlayerArtworkFallbackBg());
            canvas.drawRect(artRect, fillPaint);
            drawVinylFallbackIcon(
                    canvas, artRect.centerX(), artRect.centerY(), artSize * 0.28f, titleColor);
        }

        if (previousBitmap != null && !previousBitmap.isRecycled() && artFadeAlpha < 0.99f) {
            prevArtPaint.setAlpha(Math.round(255f * (1f - artFadeAlpha)));
            canvas.drawBitmap(previousBitmap, null, artRect, prevArtPaint);
        }

        if (currentBitmap != null && !currentBitmap.isRecycled() && artFadeAlpha > 0.01f) {
            float fadeEase = 1f - (1f - artFadeAlpha) * (1f - artFadeAlpha);
            float inScale = 0.90f + 0.10f * fadeEase;
            canvas.save();
            canvas.scale(inScale, inScale, artRect.centerX(), artRect.centerY());
            artPaint.setAlpha(Math.round(255f * artFadeAlpha));
            canvas.drawBitmap(currentBitmap, null, artRect, artPaint);
            canvas.restore();
        }
        canvas.restore();
        canvas.restore();

        // 3. Right Action Controls (Morphing Play/Pause + Spring Next Track)
        float rightPad = 10f * density;
        float nextSize = NEXT_BTN_SIZE_DP * density;
        float playSize = PLAY_BTN_SIZE_DP * density;
        float btnGap = 4f * density;

        float nextCx = cardRect.right - rightPad - nextSize * 0.5f;
        float playCx = nextCx - nextSize * 0.5f - btnGap - playSize * 0.5f;
        float btnCy = cardRect.centerY();

        nextBtnRect.set(nextCx - nextSize * 0.5f, btnCy - nextSize * 0.5f,
                nextCx + nextSize * 0.5f, btnCy + nextSize * 0.5f);
        playBtnRect.set(playCx - playSize * 0.5f, btnCy - playSize * 0.5f,
                playCx + playSize * 0.5f, btnCy + playSize * 0.5f);

        int playBgColor = (accentStrength > 0.01f && !MaterialYouColorEngine.isEffectiveAmoledBlack())
                ? MaterialYouColorEngine.blendRgb(basePlayBg, accentRgb, 0.28f * accentStrength)
                : basePlayBg;
        int playIconColor = resolveContrastPlayIcon(playBgColor, basePlayIcon);

        float playCorner = ((playSize * 0.5f) * (1f - clampedMorph)) + ((14f * density) * clampedMorph);

        canvas.save();
        canvas.scale(playBtnScale, playBtnScale, playCx, btnCy);
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(playBgColor);
        canvas.drawRoundRect(playBtnRect, playCorner, playCorner, fillPaint);

        if ("Buffering".equals(playState)) {
            float ringR = playSize * 0.24f;
            tempRect.set(playCx - ringR, btnCy - ringR, playCx + ringR, btnCy + ringR);
            strokePaint.setColor(playIconColor);
            strokePaint.setStrokeWidth(2.4f * density);
            canvas.drawArc(tempRect, bufferingAngleDeg, 260f, false, strokePaint);
        } else {
            drawMorphingPlayPauseIcon(canvas, playCx, btnCy, clampedMorph, playIconColor);
        }
        canvas.restore();

        // Next Track button with soft press halo & forward kick spring
        float pressHalo = Math.max(0f, Math.min(1f, (1f - nextBtnScale) / 0.16f));
        if (pressHalo > 0.03f) {
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(playBgColor, Math.round(0x2A * pressHalo)));
            canvas.drawCircle(nextCx, btnCy, nextSize * 0.5f * (0.85f + 0.15f * pressHalo), fillPaint);
        }

        int nextColor = canSkipToNext
                ? titleColor
                : MaterialYouColorEngine.withAlpha(subtitleColor, 0x60);
        canvas.save();
        canvas.translate(nextArrowKickX, 0f);
        canvas.scale(nextBtnScale, nextBtnScale, nextCx, btnCy);
        drawSkipNextIcon(canvas, nextCx, btnCy, 6.5f * density, nextColor);
        canvas.restore();

        // 4. Center Title, Explicit Badge & Artist Subtitle with Directional Track-Change Slide
        float textLeft = artRect.right + 12f * density;
        float textRight = playBtnRect.left - 10f * density;
        float textMaxW = Math.max(24f * density, textRight - textLeft);

        canvas.save();
        canvas.clipRect(textLeft - 2f * density, cardRect.top, textRight + 2f * density, cardRect.bottom);

        float sp = Math.max(0f, Math.min(1f, trackSlideProgress));
        if (outgoingTitle != null && sp < 0.99f) {
            float outAlpha = Math.max(0f, 1f - sp * 1.4f);
            float outDx = trackSlideDir * 18f * density * sp;
            drawTrackLabels(
                    canvas, outgoingTitle, outgoingArtist, outgoingExplicit,
                    textLeft + outDx, cardRect.centerY(), textMaxW,
                    MaterialYouColorEngine.withAlpha(titleColor, Math.round(255f * outAlpha)),
                    MaterialYouColorEngine.withAlpha(subtitleColor, Math.round(255f * outAlpha)));
        }

        float inAlpha = outgoingTitle != null ? Math.min(1f, sp * 1.15f) : 1f;
        float inDx = outgoingTitle != null ? (-trackSlideDir * 18f * density * (1f - sp)) : 0f;
        drawTrackLabels(
                canvas, title, artist, isExplicit,
                textLeft + inDx, cardRect.centerY(), textMaxW,
                MaterialYouColorEngine.withAlpha(titleColor, Math.round(255f * inAlpha)),
                MaterialYouColorEngine.withAlpha(subtitleColor, Math.round(255f * inAlpha)));

        canvas.restore();

        if (layerSave != -1) {
            canvas.restoreToCount(layerSave);
        } else {
            canvas.restore();
        }
    }

    private void drawSwipeActionPreviewPill(
            Canvas canvas,
            boolean isPreviousAction,
            int viewW,
            float insetX,
            float top,
            float bottom,
            float cardH,
            int surfaceColor,
            int borderColor,
            int accentColor,
            int onAccentColor,
            boolean frosted
    ) {
        float triggerPx = SWIPE_TRIGGER_DP * density;
        float dist = Math.abs(dragOffsetX);
        float peek = Math.max(0f, Math.min(1f, dist / triggerPx));
        float pulse = Math.max(0f, Math.min(1.2f, swipeCommitPulse));
        float edgeLeft = insetX;
        float edgeRight = viewW - insetX;

        float pillW = (40f + 6f * pulse) * density * (0.58f + 0.44f * peek);
        float pillH = 40f * density * (0.58f + 0.44f * peek) * (1f + 0.06f * pulse);
        float pillCx = isPreviousAction
                ? (edgeLeft + pillW * 0.5f + 4f * density)
                : (edgeRight - pillW * 0.5f - 4f * density);
        float pillCy = (top + bottom) * 0.5f;

        boolean triggered = dist >= triggerPx;
        int baseBg = MaterialYouColorEngine.blendRgb(
                surfaceColor, accentColor, Math.max(triggered ? 1f : 0f, pulse));
        float alphaFactor = triggered
                ? (245f * peek)
                : ((frosted ? 214f : 238f) * peek);
        int pillBg = MaterialYouColorEngine.withAlpha(
                baseBg, Math.max(0, Math.min(255, Math.round(alphaFactor))));
        int iconColor = MaterialYouColorEngine.blendRgb(
                MaterialYouColorEngine.getOnSurface(),
                onAccentColor,
                Math.max(triggered ? 1f : 0f, Math.min(1f, pulse)));

        // Morph from circle (radius = pillH * 0.5f) to Material 3 Expressive Squircle (13dp) when triggered
        float circleR = pillH * 0.5f;
        float squircleR = Math.min(circleR, 13.5f * density);
        float morphT = Math.max(triggered ? 1f : 0f, Math.min(1f, pulse));
        float cornerR = circleR * (1f - morphT) + squircleR * morphT;

        canvas.save();
        tempRect.set(edgeLeft, top, edgeRight, bottom);
        canvas.clipRect(tempRect);

        tempRect.set(
                pillCx - pillW * 0.5f,
                pillCy - pillH * 0.5f,
                pillCx + pillW * 0.5f,
                pillCy + pillH * 0.5f);

        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(pillBg);
        canvas.drawRoundRect(tempRect, cornerR, cornerR, fillPaint);

        if (!triggered && pulse < 0.5f) {
            strokePaint.setStrokeWidth(1f * density);
            strokePaint.setColor(MaterialYouColorEngine.withAlpha(borderColor, Math.round(160f * peek)));
            canvas.drawRoundRect(tempRect, cornerR, cornerR, strokePaint);
        }

        float iconKick = (isPreviousAction ? -1f : 1f) * 2.2f * density * pulse;
        float iconR = 5.8f * density * (0.75f + 0.25f * peek) * (1f + 0.08f * pulse);
        int tintedIcon = MaterialYouColorEngine.withAlpha(
                iconColor, Math.round(255f * Math.min(1f, peek * 1.25f)));
        if (isPreviousAction) {
            drawSkipPrevIcon(canvas, pillCx + iconKick, pillCy, iconR, tintedIcon);
        } else {
            drawSkipNextIcon(canvas, pillCx + iconKick, pillCy, iconR, tintedIcon);
        }
        canvas.restore();
    }

    private void drawMorphingPlayPauseIcon(
            Canvas canvas,
            float cx,
            float cy,
            float morph,
            int iconColor
    ) {
        float playAlpha = Math.max(0f, Math.min(1f, 1f - morph * 1.45f));
        float pauseAlpha = Math.max(0f, Math.min(1f, (morph - 0.18f) / 0.82f));

        if (playAlpha > 0.02f) {
            float pScale = 1f - 0.35f * morph;
            canvas.save();
            canvas.translate(cx + 1.2f * density * (1f - morph), cy);
            canvas.rotate(morph * 35f);
            canvas.scale(pScale, pScale);
            drawPlayTriangle(
                    canvas, 0f, 0f, 7.0f * density,
                    MaterialYouColorEngine.withAlpha(iconColor, Math.round(255f * playAlpha)));
            canvas.restore();
        }

        if (pauseAlpha > 0.02f) {
            float bScale = 0.65f + 0.35f * morph;
            canvas.save();
            canvas.translate(cx, cy);
            canvas.rotate((1f - morph) * -35f);
            canvas.scale(bScale, bScale);
            drawPauseBars(
                    canvas, 0f, 0f, 6.2f * density,
                    MaterialYouColorEngine.withAlpha(iconColor, Math.round(255f * pauseAlpha)));
            canvas.restore();
        }
    }

    private void drawTrackLabels(
            Canvas canvas,
            String trackTitle,
            String trackArtist,
            boolean explicit,
            float textLeft,
            float centerY,
            float textMaxW,
            int titleCol,
            int subCol
    ) {
        if (trackTitle == null) {
            trackTitle = "";
        }
        if (trackArtist == null) {
            trackArtist = "";
        }
        float explicitWidth = explicit ? (19f * density) : 0f;
        titlePaint.setColor(titleCol);
        String ellipsizedTitle = TextUtils.ellipsize(
                trackTitle, titlePaint, Math.max(12f * density, textMaxW - explicitWidth),
                TextUtils.TruncateAt.END).toString();
        float renderedTitleW = titlePaint.measureText(ellipsizedTitle);

        subtitlePaint.setColor(subCol);
        String ellipsizedArtist = TextUtils.ellipsize(
                trackArtist, subtitlePaint, textMaxW, TextUtils.TruncateAt.END).toString();

        float titleBaseline = centerY - 3.5f * density;
        float artistBaseline = centerY + 14.5f * density;

        canvas.drawText(ellipsizedTitle, textLeft, titleBaseline, titlePaint);

        if (explicit && !ellipsizedTitle.isEmpty()) {
            float badgeSize = 13.5f * density;
            float badgeLeft = textLeft + renderedTitleW + 5.5f * density;
            float badgeTop = titleBaseline - badgeSize * 0.85f;
            tempRect.set(badgeLeft, badgeTop, badgeLeft + badgeSize, badgeTop + badgeSize);
            int subAlpha = (subCol >>> 24) & 0xFF;
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(subCol, Math.round(subAlpha * 0.22f)));
            canvas.drawRoundRect(tempRect, 3.5f * density, 3.5f * density, fillPaint);

            explicitPaint.setColor(titleCol);
            Paint.FontMetrics fm = explicitPaint.getFontMetrics();
            float eBaseline = tempRect.centerY() - (fm.ascent + fm.descent) * 0.5f;
            canvas.drawText("E", tempRect.centerX(), eBaseline, explicitPaint);
        }

        canvas.drawText(ellipsizedArtist, textLeft, artistBaseline, subtitlePaint);
    }

    private void drawVinylFallbackIcon(Canvas canvas, float cx, float cy, float r, int color) {
        int faded = MaterialYouColorEngine.withAlpha(color, 0x80);
        strokePaint.setColor(faded);
        strokePaint.setStrokeWidth(1.8f * density);
        canvas.drawCircle(cx, cy, r, strokePaint);
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(faded);
        canvas.drawCircle(cx, cy, r * 0.30f, fillPaint);
    }

    private static Drawable loadTidalIcon(Context ctx, String name) {
        try {
            int resId = ctx.getResources().getIdentifier(name, "drawable", ctx.getPackageName());
            if (resId == 0) {
                return null;
            }
            Drawable d = ctx.getDrawable(resId);
            return d != null ? d.mutate() : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    @SuppressWarnings("deprecation")
    private static boolean drawTidalIcon(
            Canvas canvas,
            Drawable icon,
            float cx,
            float cy,
            float sizePx,
            int color
    ) {
        if (icon == null) {
            return false;
        }
        int iw = icon.getIntrinsicWidth();
        int ih = icon.getIntrinsicHeight();
        float w = sizePx;
        float h = sizePx;
        if (iw > 0 && ih > 0 && iw != ih) {
            if (iw > ih) {
                h = sizePx * (ih / (float) iw);
            } else {
                w = sizePx * (iw / (float) ih);
            }
        }
        int left = Math.round(cx - w * 0.5f);
        int top = Math.round(cy - h * 0.5f);
        int right = Math.round(cx + w * 0.5f);
        int bottom = Math.round(cy + h * 0.5f);
        icon.setBounds(left, top, Math.max(left + 1, right), Math.max(top + 1, bottom));
        icon.setAlpha(Color.alpha(color));
        icon.setColorFilter(color | 0xFF000000, PorterDuff.Mode.SRC_IN);
        icon.draw(canvas);
        return true;
    }

    private void drawPlayTriangle(Canvas canvas, float cx, float cy, float r, int color) {
        if (drawTidalIcon(canvas, iconPlay, cx - 0.35f * density, cy, r * 2.65f, color)) {
            return;
        }
        iconPath.reset();
        iconPath.moveTo(cx - r * 0.52f, cy - r * 0.80f);
        iconPath.lineTo(cx + r * 0.82f, cy);
        iconPath.lineTo(cx - r * 0.52f, cy + r * 0.80f);
        iconPath.close();
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(color);
        canvas.drawPath(iconPath, fillPaint);
    }

    private void drawPauseBars(Canvas canvas, float cx, float cy, float r, int color) {
        if (drawTidalIcon(canvas, iconPause, cx, cy, r * 2.9f, color)) {
            return;
        }
        float barW = 3.2f * density;
        float barGap = 3.2f * density;
        float halfH = r * 0.92f;
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(color);

        tempRect.set(cx - barGap * 0.5f - barW, cy - halfH, cx - barGap * 0.5f, cy + halfH);
        canvas.drawRoundRect(tempRect, 1.5f * density, 1.5f * density, fillPaint);

        tempRect.set(cx + barGap * 0.5f, cy - halfH, cx + barGap * 0.5f + barW, cy + halfH);
        canvas.drawRoundRect(tempRect, 1.5f * density, 1.5f * density, fillPaint);
    }

    private void drawSkipNextIcon(Canvas canvas, float cx, float cy, float r, int color) {
        if (drawTidalIcon(canvas, iconNext, cx, cy, r * 2.75f, color)) {
            return;
        }
        iconPath.reset();
        iconPath.moveTo(cx - r * 0.78f, cy - r * 0.76f);
        iconPath.lineTo(cx + r * 0.34f, cy);
        iconPath.lineTo(cx - r * 0.78f, cy + r * 0.76f);
        iconPath.close();
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(color);
        canvas.drawPath(iconPath, fillPaint);

        tempRect.set(cx + r * 0.42f, cy - r * 0.72f, cx + r * 0.76f, cy + r * 0.72f);
        canvas.drawRoundRect(tempRect, 1.2f * density, 1.2f * density, fillPaint);
    }

    private void drawSkipPrevIcon(Canvas canvas, float cx, float cy, float r, int color) {
        if (drawTidalIcon(canvas, iconPrev, cx, cy, r * 2.75f, color)) {
            return;
        }
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(color);
        tempRect.set(cx - r * 0.76f, cy - r * 0.72f, cx - r * 0.42f, cy + r * 0.72f);
        canvas.drawRoundRect(tempRect, 1.2f * density, 1.2f * density, fillPaint);

        iconPath.reset();
        iconPath.moveTo(cx + r * 0.78f, cy - r * 0.76f);
        iconPath.lineTo(cx - r * 0.34f, cy);
        iconPath.lineTo(cx + r * 0.78f, cy + r * 0.76f);
        iconPath.close();
        canvas.drawPath(iconPath, fillPaint);
    }

    private float computeRubberBandDragX(float rawDx) {
        float triggerPx = SWIPE_TRIGGER_DP * density;
        float tracked = rawDx * 0.86f;
        float abs = Math.abs(tracked);
        if (abs <= triggerPx) {
            return tracked;
        }
        float sign = tracked < 0f ? -1f : 1f;
        float excess = abs - triggerPx;
        float maxExcess = 56f * density;
        float dampedExcess = (excess * maxExcess) / (excess + maxExcess * 1.15f);
        return sign * (triggerPx + dampedExcess);
    }

    private void triggerDirectionalTrackSlide(int dir) {
        pendingSlideDir = dir;
        outgoingTitle = this.title;
        outgoingArtist = this.artist;
        outgoingExplicit = this.isExplicit;
        trackSlideDir = dir;
        trackSlideProgress = 0f;
        trackSlideVel = 0f;
    }

    private void requestDisallowInterceptOnAncestors() {
        ViewParent p = getParent();
        while (p != null) {
            p.requestDisallowInterceptTouchEvent(true);
            p = p.getParent();
        }
    }

    private void recycleVelocityTracker() {
        if (velocityTracker != null) {
            velocityTracker.recycle();
            velocityTracker = null;
        }
    }

    private int hitTest(float x, float y) {
        if (!cardRect.contains(x, y)) {
            return HIT_NONE;
        }
        float hitSlop = 4f * density;
        if (x >= playBtnRect.left - hitSlop && x <= playBtnRect.right + hitSlop) {
            return HIT_PLAY;
        }
        if (x >= nextBtnRect.left - hitSlop && x <= nextBtnRect.right + hitSlop) {
            return HIT_NEXT;
        }
        return HIT_CARD;
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (!hasMedia) {
            return false;
        }
        float x = event.getX();
        float y = event.getY();
        float rawX = event.getRawX();
        float rawY = event.getRawY();

        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN: {
                int hit = hitTest(x, y);
                if (hit == HIT_NONE) {
                    return false;
                }
                downX = x;
                downY = y;
                downRawX = rawX;
                downRawY = rawY;
                isHorizontalSwiping = false;
                isVerticalPulling = false;
                isInteractiveOverlayDragging = false;
                swipeThresholdCrossed = false;
                pullThresholdCrossed = false;
                activeHitTarget = hit;

                recycleVelocityTracker();
                velocityTracker = VelocityTracker.obtain();
                MotionEvent rawEv = MotionEvent.obtain(
                        event.getDownTime(), event.getEventTime(), event.getAction(), rawX, rawY, 0);
                velocityTracker.addMovement(rawEv);
                rawEv.recycle();

                startAnimationLoop();
                return true;
            }
            case MotionEvent.ACTION_MOVE: {
                if (velocityTracker != null) {
                    MotionEvent rawEv = MotionEvent.obtain(
                            event.getDownTime(), event.getEventTime(), event.getAction(), rawX, rawY, 0);
                    velocityTracker.addMovement(rawEv);
                    rawEv.recycle();
                }

                float dx = rawX - downRawX;
                float dy = rawY - downRawY;

                if (!isHorizontalSwiping
                        && !isVerticalPulling
                        && MaterialYouConfig.isMiniPlayerSwipeEnabled()
                        && Math.abs(dx) > touchSlop
                        && Math.abs(dx) > Math.abs(dy) * 1.12f) {
                    isHorizontalSwiping = true;
                    activeHitTarget = HIT_NONE;
                    requestDisallowInterceptOnAncestors();
                } else if (!isHorizontalSwiping
                        && !isVerticalPulling
                        && dy < -touchSlop
                        && -dy > Math.abs(dx) * 1.12f) {
                    isVerticalPulling = true;
                    activeHitTarget = HIT_NONE;
                    requestDisallowInterceptOnAncestors();
                    isInteractiveOverlayDragging =
                            ExpressiveMiniPlayerExpandOverlayView.beginInteractiveDrag(this);
                }

                if (isHorizontalSwiping) {
                    dragOffsetX = computeRubberBandDragX(dx);
                    float triggerPx = SWIPE_TRIGGER_DP * density;
                    boolean crossedLeft = dragOffsetX <= -triggerPx && canSkipToNext;
                    boolean crossedRight = dragOffsetX >= triggerPx;
                    boolean crossed = crossedLeft || crossedRight;
                    if (crossed && !swipeThresholdCrossed) {
                        swipeThresholdCrossed = true;
                        swipeCommitVel = 4.2f;
                        performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                        startAnimationLoop();
                    } else if (!crossed && swipeThresholdCrossed) {
                        swipeThresholdCrossed = false;
                        startAnimationLoop();
                    }
                    invalidate();
                } else if (isVerticalPulling) {
                    float dragUpPx = Math.max(0f, -dy);
                    if (isInteractiveOverlayDragging) {
                        ExpressiveMiniPlayerExpandOverlayView.updateInteractiveDrag(dragUpPx);
                        boolean crossed = dragUpPx >= 86f * density;
                        if (crossed && !pullThresholdCrossed) {
                            pullThresholdCrossed = true;
                            performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                        } else if (!crossed) {
                            pullThresholdCrossed = false;
                        }
                    } else {
                        dragOffsetY = Math.max(-PULL_UP_MAX_DP * density, Math.min(0f, dy * 0.42f));
                        float triggerPx = PULL_UP_TRIGGER_DP * density;
                        float pullFrac = Math.max(0f, Math.min(1f, -dragOffsetY / triggerPx));
                        ExpressiveScaffoldBridge.notifyMiniPlayerPullUp(pullFrac);
                        boolean crossed = -dragOffsetY >= triggerPx;
                        if (crossed && !pullThresholdCrossed) {
                            pullThresholdCrossed = true;
                            performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                        } else if (!crossed) {
                            pullThresholdCrossed = false;
                        }
                        invalidate();
                    }
                }
                return true;
            }
            case MotionEvent.ACTION_UP: {
                float vx = 0f;
                float vy = 0f;
                if (velocityTracker != null) {
                    MotionEvent rawEv = MotionEvent.obtain(
                            event.getDownTime(), event.getEventTime(), event.getAction(), rawX, rawY, 0);
                    velocityTracker.addMovement(rawEv);
                    rawEv.recycle();
                    velocityTracker.computeCurrentVelocity(1000);
                    vx = velocityTracker.getXVelocity();
                    vy = velocityTracker.getYVelocity();
                    recycleVelocityTracker();
                }

                int downTarget = activeHitTarget;
                boolean wasSwiping = isHorizontalSwiping;
                boolean wasPulling = isVerticalPulling;
                boolean wasOverlayDrag = isInteractiveOverlayDragging;
                float finalOffsetX = dragOffsetX;
                float finalOffsetY = dragOffsetY;

                activeHitTarget = HIT_NONE;
                isHorizontalSwiping = false;
                isVerticalPulling = false;
                isInteractiveOverlayDragging = false;
                swipeThresholdCrossed = false;

                if (wasSwiping) {
                    float triggerPx = SWIPE_TRIGGER_DP * density;
                    float minFlingOffsetPx = 22f * density;
                    float minFlingVelPx = 580f * density;
                    boolean commitNext = canSkipToNext && (finalOffsetX <= -triggerPx
                            || (finalOffsetX <= -minFlingOffsetPx && vx < -minFlingVelPx));
                    boolean commitPrev = !commitNext && (finalOffsetX >= triggerPx
                            || (finalOffsetX >= minFlingOffsetPx && vx > minFlingVelPx));

                    if (commitNext) {
                        performHapticFeedback(HapticFeedbackConstants.CONFIRM);
                        triggerDirectionalTrackSlide(-1);
                        nextArrowKickVel = 42f * density;
                        artBloomVel = 0.62f;
                        ExpressiveScaffoldBridge.dispatchMiniPlayerNext();
                    } else if (commitPrev) {
                        performHapticFeedback(HapticFeedbackConstants.CONFIRM);
                        triggerDirectionalTrackSlide(1);
                        artBloomVel = 0.62f;
                        ExpressiveScaffoldBridge.dispatchMiniPlayerPrevious();
                    }
                    dragOffsetVel = -finalOffsetX * 6f;
                    startAnimationLoop();
                    return true;
                }

                if (wasPulling) {
                    float dragUpPx = Math.max(0f, -(rawY - downRawY));
                    if (wasOverlayDrag) {
                        ExpressiveMiniPlayerExpandOverlayView.endInteractiveDrag(dragUpPx, vy);
                    } else {
                        ExpressiveScaffoldBridge.notifyMiniPlayerPullUp(0f);
                        if (-finalOffsetY >= PULL_UP_TRIGGER_DP * density || vy < -520f * density) {
                            performHapticFeedback(HapticFeedbackConstants.CONFIRM);
                            ExpressiveScaffoldBridge.dispatchMiniPlayerOpenFull();
                        }
                        dragOffsetYVel = -finalOffsetY * 6f;
                    }
                    startAnimationLoop();
                    return true;
                }

                int upTarget = hitTest(x, y);
                startAnimationLoop();
                if (upTarget == downTarget) {
                    switch (upTarget) {
                        case HIT_PLAY:
                            performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                            ExpressiveScaffoldBridge.dispatchMiniPlayerPlayPause();
                            break;
                        case HIT_NEXT:
                            if (canSkipToNext) {
                                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                                triggerDirectionalTrackSlide(-1);
                                nextArrowKickVel = 36f * density;
                                ExpressiveScaffoldBridge.dispatchMiniPlayerNext();
                            }
                            break;
                        case HIT_CARD:
                            ExpressiveScaffoldBridge.dispatchMiniPlayerOpenFull();
                            break;
                        default:
                            break;
                    }
                }
                return true;
            }
            case MotionEvent.ACTION_CANCEL: {
                recycleVelocityTracker();
                activeHitTarget = HIT_NONE;
                isHorizontalSwiping = false;
                swipeThresholdCrossed = false;
                if (isVerticalPulling) {
                    isVerticalPulling = false;
                    if (isInteractiveOverlayDragging) {
                        isInteractiveOverlayDragging = false;
                        ExpressiveMiniPlayerExpandOverlayView.cancelInteractiveDrag();
                    } else {
                        ExpressiveScaffoldBridge.notifyMiniPlayerPullUp(0f);
                    }
                }
                startAnimationLoop();
                return true;
            }
            default:
                return super.onTouchEvent(event);
        }
    }
}
