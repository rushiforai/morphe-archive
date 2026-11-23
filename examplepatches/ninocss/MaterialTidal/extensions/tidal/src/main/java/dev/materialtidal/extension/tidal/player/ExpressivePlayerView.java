package dev.materialtidal.extension.tidal.player;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RadialGradient;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.LruCache;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.Window;
import android.view.WindowInsets;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import dev.materialtidal.extension.tidal.navbar.ExpressiveMiniPlayerView;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Material 3 Expressive Full-Screen Player View.
 *
 * <p>Visual architecture matching the target design:
 * <ul>
 *   <li>Heavily blurred album cover background with multi-pass separable blur, smooth
 *       crossfade on track transitions, gentle breathing motion, and tonal harmonization.</li>
 *   <li>Top bar with circular Collapse button, {@code "Now Playing"} header, and connected
 *       {@code [Cast/Output | Queue]} expressive split pills.</li>
 *   <li>1:1 squircle Cover Art (corner-morphing & scale spring on Play/Pause, horizontal
 *       swipe-to-skip with tilt & rubber-band physics) and integrated Lyrics Card overlay.</li>
 *   <li>Track Title + Explicit {@code "E"} badge + Artist subtitle + connected
 *       {@code [Lyrics | More]} expressive split pills.</li>
 *   <li>M3 Expressive squiggly/wavy seekbar (live animated sine wave while playing, flattening
 *       on pause, right-end dot, live scrub time) + centered {@code HI-RES LOSSLESS} pill badge.</li>
 *   <li>Large expressive transport shapes ({@code |<} pill, contrasting {@code || / ▶} morphing
 *       squircle, {@code >|} pill) and bottom 3-segment floating capsule
 *       ({@code [Shuffle | Repeat | Favorite]}).</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class ExpressivePlayerView extends View {

    private static final int ART_CACHE_SIZE = 16;
    private static final int BLUR_BITMAP_SIZE = 96;
    private static final int BLUR_RADIUS = 20;

    private static final LruCache<String, Bitmap> HI_RES_ART_CACHE = new LruCache<>(ART_CACHE_SIZE);
    private static final LruCache<String, Bitmap> BLUR_ART_CACHE = new LruCache<>(ART_CACHE_SIZE);
    private static final LruCache<String, PlayerPalette> PALETTE_CACHE = new LruCache<>(32);
    private static final ExecutorService ART_EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private static final int HIT_NONE = 0;
    private static final int HIT_COLLAPSE = 1;
    private static final int HIT_CAST = 2;
    private static final int HIT_QUEUE = 3;
    private static final int HIT_COVER = 4;
    private static final int HIT_TITLE_AREA = 5;
    private static final int HIT_LYRICS_BTN = 6;
    private static final int HIT_MORE_BTN = 7;
    private static final int HIT_SEEKBAR = 8;
    private static final int HIT_BADGE = 9;
    private static final int HIT_PREV = 10;
    private static final int HIT_PLAY = 11;
    private static final int HIT_NEXT = 12;
    private static final int HIT_SHUFFLE = 13;
    private static final int HIT_REPEAT = 14;
    private static final int HIT_FAVORITE = 15;
    private static final int HIT_LYRICS_CLOSE = 16;
    private static final int HIT_LYRICS_MINI_COVER = 17;
    private static final int HIT_LYRICS_AREA = 18;
    private static final int HIT_LYRICS_SYNC = 19;

    private static final class PlayerPalette {
        int blurWashColor;
        int primaryDeep;
        int secondaryText;
        int centerPlayBg;
        int centerPlayIcon;
        int sideBtnBg;
        int sideBtnIcon;
        int glassPillBg;
        int glassPillActiveBg;
        int glassPillActiveIcon;
        int capsuleFrameBg;
        int capsuleSegmentBg;
        int badgeBg;
        int badgeText;
        int lyricsCardBg;
        int lyricsActiveText;
        int lyricsInactiveText;
        int shadowBase;
    }

    private final float density;
    private final float scaledDensity;
    private final float touchSlop;

    // Insets
    private float statusBarInsetPx;
    private float navBarInsetPx;
    private boolean isPreviewInstance;

    // Bound player state
    private String title = "";
    private String artist = "";
    private String coverId;
    private String playState = "PAUSED";
    private String repeatMode = "OFF";
    private String badgeText = "";
    private String progressTime = "00:00";
    private String durationTime = "00:00";
    private String sourceName = "";
    private float serverProgress = 0f;
    private boolean isExplicit;
    private boolean isShuffleOn;
    private boolean isNextEnabled = true;
    private boolean isFavorite;
    private boolean showLyricsButton = true;
    private boolean isBroadcastConnected;
    private boolean isLyricsVisible;
    private boolean isLyricsLoading;
    private boolean isLyricsSynced;
    private String[] lyricLines;
    private long[] lyricTimesMs;
    private int highlightedLyricIndex = -1;

    // Bitmaps & crossfade
    private Bitmap prevCoverBitmap;
    private Bitmap currentCoverBitmap;
    private float coverFadeAlpha = 1f;

    private Bitmap prevBlurredBitmap;
    private Bitmap currentBlurredBitmap;
    private float blurFadeAlpha = 1f;

    // Smoothly interpolated palette
    private PlayerPalette startPalette;
    private PlayerPalette targetPalette;
    private final PlayerPalette activePalette = new PlayerPalette();
    private float paletteMorph = 1f;
    private boolean hasInitialPalette = false;

    // Expressive springs & animated properties
    private boolean springsInitialized;
    private float playShapeMorph = 0f; // 0 = Paused (pill), 1 = Playing (squircle)
    private float playShapeVel = 0f;
    private float coverScale = 0.95f;
    private float coverScaleVel = 0f;
    private float coverCornerMorph = 0f; // 0 = Paused (34dp), 1 = Playing (24dp)
    private float coverCornerVel = 0f;

    private float waveAmpMorph = 0f; // 0 = flat, 1 = wavy
    private float waveAmpVel = 0f;
    private float wavePhaseRad = 0f;

    private float thumbScale = 1f;
    private float thumbScaleVel = 0f;

    private float lyricsReveal = 0f;
    private float lyricsRevealVel = 0f;

    private float shuffleFrac = 0f;
    private float shuffleVel = 0f;
    private float repeatFrac = 0f;
    private float repeatVel = 0f;
    private float favoriteFrac = 0f;
    private float favoriteVel = 0f;
    private float heartPopImpulse = 1f;
    private float heartPopVel = 0f;
    private float broadcastFrac = 0f;
    private float broadcastVel = 0f;

    private float bufferingAngleDeg = 0f;
    private float bgBreathPhase = 0f;

    // Per-button press springs (0 = rest, 1 = pressed)
    private int activeHitTarget = HIT_NONE;
    private final float[] buttonPress = new float[20];
    private final float[] buttonPressVel = new float[20];

    // Cover swipe-to-skip
    private float coverDragX = 0f;
    private float coverDragVel = 0f;
    private boolean isSwipingCover;
    private boolean coverSwipeTriggered;

    // Seekbar scrubbing
    private boolean isScrubbing;
    private float scrubProgress = 0f;
    private long scrubHoldUntilMs = 0L;

    // Lyrics layout, focus animations, fling & scrolling
    private final List<StaticLayout> lyricLayouts = new ArrayList<>();
    private final List<Float> lyricItemTops = new ArrayList<>();
    private final List<Float> lyricItemHeights = new ArrayList<>();
    private float[] lyricLineFocus;
    private float lyricsBrowseBoost = 0f;
    private int tappedLyricIndex = -1;
    private float tappedLyricFlash = 0f;
    private float syncPillReveal = 0f;
    private float syncPillVel = 0f;
    private float skeletonPulsePhase = 0f;
    private float totalLyricsContentH = 0f;
    private float lyricsScrollY = 0f;
    private float targetLyricsScrollY = 0f;
    private float lyricsScrollVel = 0f;
    private float lyricsFlingVel = 0f;
    private boolean isScrollingLyrics;
    private long lastUserLyricsScrollMs = 0L;
    private long lastMoveTimeMs = 0L;
    private int lastLayoutLyricsWidth = 0;

    // Touch tracking
    private float downX;
    private float downY;
    private float lastTouchY;

    // Animation ticker
    private long lastFrameMs;
    private boolean isAnimating;
    private final Runnable frameTick = this::stepAnimations;

    // Reusable drawing primitives
    private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint shadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint bitmapPaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final Paint blurBitmapPaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final ColorMatrix blurColorMatrix = new ColorMatrix();
    private final TextPaint headerPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint titlePaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint artistPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint timePaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint badgePaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint explicitPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint lyricPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint lyricMsgPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint lyricsHeaderTitlePaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint lyricsHeaderArtistPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint syncPillPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint smallLabelPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final Paint lyricsMaskPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

    private final Path tempPath = new Path();
    private final Path auxPath = new Path();
    private final Path clipPath = new Path();
    private final float[] cornerRadii = new float[8];

    // Layout rectangles
    private final Rect srcBitmapRect = new Rect();
    private final RectF bgDrawRect = new RectF();
    private final RectF collapseRect = new RectF();
    private final RectF castRect = new RectF();
    private final RectF queueRect = new RectF();
    private final RectF coverRect = new RectF();
    private final RectF titleAreaRect = new RectF();
    private final RectF lyricsBtnRect = new RectF();
    private final RectF moreBtnRect = new RectF();
    private final RectF seekBarTouchRect = new RectF();
    private final RectF npMetaRect = new RectF();
    private final RectF badgeRect = new RectF();
    private final RectF prevBtnRect = new RectF();
    private final RectF playBtnRect = new RectF();
    private final RectF nextBtnRect = new RectF();
    private final RectF bottomCapsuleRect = new RectF();
    private final RectF shuffleRect = new RectF();
    private final RectF repeatRect = new RectF();
    private final RectF favoriteRect = new RectF();

    // Full-screen lyrics layout & morphed active rectangles
    private final RectF lyricsMiniCoverRect = new RectF();
    private final RectF lyricsHeaderTitleRect = new RectF();
    private final RectF lyricsCloseRect = new RectF();
    private final RectF lyricsViewportRect = new RectF();
    private final RectF lyricsSyncPillRect = new RectF();
    private final RectF lyricsSeekRect = new RectF();
    private final RectF lyricsMetaRect = new RectF();
    private final RectF lyricsPrevRect = new RectF();
    private final RectF lyricsPlayRect = new RectF();
    private final RectF lyricsNextRect = new RectF();
    private final RectF activeCoverRect = new RectF();
    private final RectF activeSeekBarRect = new RectF();
    private final RectF activeMetaRect = new RectF();
    private final RectF activePrevRect = new RectF();
    private final RectF activePlayRect = new RectF();
    private final RectF activeNextRect = new RectF();
    private final RectF tempRect = new RectF();

    private Shader vignetteShader;
    private int lastVignetteW;
    private int lastVignetteH;
    private int lastVignetteColor;
    private Shader lyricsEdgeMaskShader;
    private float lastLyricsMaskTop = -1f;
    private float lastLyricsMaskHeight = -1f;

    // Official TIDAL vector icons loaded from resources (fallback to Canvas paths if null)
    private final Drawable iconChevronDown;
    private final Drawable iconClose;
    private final Drawable iconLyricsSync;
    private final Drawable iconCast;
    private final Drawable iconQueue;
    private final Drawable iconLyrics;
    private final Drawable iconMore;
    private final Drawable iconPlay;
    private final Drawable iconPause;
    private final Drawable iconNext;
    private final Drawable iconPrev;
    private final Drawable iconShuffle;
    private final Drawable iconRepeat;
    private final Drawable iconRepeatOne;
    private final Drawable iconFavorite;
    private final Drawable iconFavoriteFilled;

    public ExpressivePlayerView(Context context) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        this.scaledDensity = context.getResources().getDisplayMetrics().scaledDensity;
        this.touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        this.statusBarInsetPx = 32f * density;
        this.navBarInsetPx = 18f * density;

        setWillNotDraw(false);
        setClickable(true);
        setFocusable(true);

        headerPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        headerPaint.setTextSize(17.5f * density);

        titlePaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        titlePaint.setTextSize(22.5f * density);

        artistPaint.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
        artistPaint.setTextSize(15.5f * density);

        timePaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        timePaint.setTextSize(12.5f * density);
        timePaint.setFontFeatureSettings("tnum");

        badgePaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        badgePaint.setTextSize(10.5f * density);
        badgePaint.setLetterSpacing(0.06f);
        badgePaint.setTextAlign(Paint.Align.CENTER);

        explicitPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        explicitPaint.setTextSize(10f * density);
        explicitPaint.setTextAlign(Paint.Align.CENTER);

        lyricPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        lyricPaint.setTextSize(26f * density);
        lyricPaint.setLetterSpacing(-0.02f);

        lyricMsgPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        lyricMsgPaint.setTextSize(17f * density);
        lyricMsgPaint.setTextAlign(Paint.Align.CENTER);

        lyricsHeaderTitlePaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        lyricsHeaderTitlePaint.setTextSize(16f * density);

        lyricsHeaderArtistPaint.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
        lyricsHeaderArtistPaint.setTextSize(13f * density);

        syncPillPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        syncPillPaint.setTextSize(12.5f * density);

        lyricsMaskPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));

        smallLabelPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        smallLabelPaint.setTextSize(9.5f * density);
        smallLabelPaint.setTextAlign(Paint.Align.CENTER);

        strokePaint.setStyle(Paint.Style.STROKE);
        strokePaint.setStrokeCap(Paint.Cap.ROUND);
        strokePaint.setStrokeJoin(Paint.Join.ROUND);

        iconChevronDown = loadTidalIcon(context, "ic_chevron_down");
        iconClose = loadTidalIcon(context, "ic_close");
        iconLyricsSync = loadTidalIcon(context, "ic_media_lyric_sync_medium");
        iconCast = loadTidalIcon(context, "ic_devices_connectivity_broadcast_medium");
        iconQueue = loadTidalIcon(context, "ic_queue");
        iconLyrics = loadTidalIcon(context, "ic_media_lyrics_medium");
        iconMore = loadTidalIcon(context, "ic_more_vertical");
        iconPlay = loadTidalIcon(context, "ic_play");
        iconPause = loadTidalIcon(context, "ic_pause");
        iconNext = loadTidalIcon(context, "ic_next");
        iconPrev = loadTidalIcon(context, "ic_previous");
        iconShuffle = loadTidalIcon(context, "ic_shuffle");
        iconRepeat = loadTidalIcon(context, "ic_repeat");
        iconRepeatOne = loadTidalIcon(context, "ic_repeat_one");
        iconFavorite = loadTidalIcon(context, "ic_favorite");
        iconFavoriteFilled = loadTidalIcon(context, "ic_favorite_filled");

        PlayerPalette initial = buildDefaultPalette();
        startPalette = initial;
        targetPalette = initial;
        copyPalette(initial, activePalette);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        requestApplyInsets();
        syncSystemBarsForPalette(targetPalette);
    }

    public void setPreviewInstance(boolean preview) {
        this.isPreviewInstance = preview;
    }

    public void setWindowInsetsPx(float statusBarPx, float navBarPx) {
        this.statusBarInsetPx = Math.max(20f * density, statusBarPx);
        this.navBarInsetPx = Math.max(14f * density, navBarPx);
    }

    private Window findHostWindow() {
        Context ctx = getContext();
        while (ctx instanceof ContextWrapper) {
            if (ctx instanceof Activity) {
                return ((Activity) ctx).getWindow();
            }
            ctx = ((ContextWrapper) ctx).getBaseContext();
        }
        return null;
    }

    private void syncSystemBarsForPalette(PlayerPalette pal) {
        if (isPreviewInstance || pal == null) {
            return;
        }
        Window window = findHostWindow();
        if (window == null) {
            return;
        }
        float textLum = (0.299f * Color.red(pal.primaryDeep)
                + 0.587f * Color.green(pal.primaryDeep)
                + 0.114f * Color.blue(pal.primaryDeep)) / 255f;
        boolean lightBackdrop = textLum < 0.50f;
        MaterialYouColorEngine.applySystemBarAppearance(window, lightBackdrop);
    }

    private static String makePaletteKey(String resourceId) {
        return resourceId + "#" + MaterialYouConfig.getPlayerColorStyle()
                + (MaterialYouColorEngine.isLightMode() ? "#L" : "#D");
    }

    public static void prewarmArtwork(final String resourceId) {
        if (resourceId == null || resourceId.isEmpty()) {
            return;
        }
        String palKey = makePaletteKey(resourceId);
        if (HI_RES_ART_CACHE.get(resourceId) != null
                && BLUR_ART_CACHE.get(resourceId) != null
                && PALETTE_CACHE.get(palKey) != null) {
            return;
        }
        ART_EXECUTOR.execute(() -> {
            try {
                Bitmap hiRes = HI_RES_ART_CACHE.get(resourceId);
                if (hiRes == null) {
                    hiRes = fetchCoverBitmap(resourceId);
                    if (hiRes != null) {
                        HI_RES_ART_CACHE.put(resourceId, hiRes);
                    }
                }
                Bitmap source = hiRes != null ? hiRes : ExpressiveMiniPlayerView.getCachedArtwork(resourceId);
                if (source == null) {
                    return;
                }
                if (BLUR_ART_CACHE.get(resourceId) == null) {
                    Bitmap blurred = createHeavyBlur(source);
                    if (blurred != null) {
                        BLUR_ART_CACHE.put(resourceId, blurred);
                    }
                }
                if (PALETTE_CACHE.get(palKey) == null) {
                    PlayerPalette pal = derivePaletteFromCover(source);
                    if (pal != null) {
                        PALETTE_CACHE.put(palKey, pal);
                    }
                }
            } catch (Throwable ignored) {
            }
        });
    }

    public void syncPreviewFromMiniPlayer(
            String miniTitle,
            String miniArtist,
            String miniCoverId,
            String miniPlayState,
            boolean miniCanSkipNext,
            boolean miniExplicit
    ) {
        ExpressivePlayerBridge.applyLatestToPreview(this);

        this.title = miniTitle != null ? miniTitle : "";
        this.artist = miniArtist != null ? miniArtist : "";
        this.isNextEnabled = miniCanSkipNext;
        this.isExplicit = miniExplicit;
        this.isLyricsVisible = false;
        this.lyricsReveal = 0f;
        this.lyricsRevealVel = 0f;

        if ("Playing".equalsIgnoreCase(miniPlayState) || "PLAYING".equalsIgnoreCase(miniPlayState)) {
            this.playState = "PLAYING";
        } else if ("Buffering".equalsIgnoreCase(miniPlayState) || "BUFFERING".equalsIgnoreCase(miniPlayState)) {
            this.playState = "BUFFERING";
        } else {
            this.playState = "PAUSED";
        }

        boolean playing = "PLAYING".equals(this.playState);
        this.playShapeMorph = playing ? 1f : 0f;
        this.playShapeVel = 0f;
        this.coverScale = playing ? 1f : 0.945f;
        this.coverScaleVel = 0f;
        this.coverCornerMorph = playing ? 1f : 0f;
        this.coverCornerVel = 0f;
        this.waveAmpMorph = (playing && MaterialYouConfig.isPlayerSquigglySeekbarEnabled()) ? 1f : 0f;
        this.waveAmpVel = 0f;
        this.springsInitialized = true;

        if (miniCoverId != null && !miniCoverId.isEmpty()) {
            this.coverId = miniCoverId;
            Bitmap hiRes = HI_RES_ART_CACHE.get(miniCoverId);
            Bitmap miniArt = ExpressiveMiniPlayerView.getCachedArtwork(miniCoverId);
            Bitmap bestCover = hiRes != null ? hiRes : miniArt;
            Bitmap blurred = BLUR_ART_CACHE.get(miniCoverId);
            if (blurred == null && bestCover != null) {
                blurred = createHeavyBlur(bestCover);
                if (blurred != null) {
                    BLUR_ART_CACHE.put(miniCoverId, blurred);
                }
            }
            String palKey = makePaletteKey(miniCoverId);
            PlayerPalette pal = PALETTE_CACHE.get(palKey);
            if (pal == null && bestCover != null) {
                pal = derivePaletteFromCover(bestCover);
                if (pal != null) {
                    PALETTE_CACHE.put(palKey, pal);
                }
            }
            if (bestCover != null) {
                this.currentCoverBitmap = bestCover;
                this.prevCoverBitmap = null;
                this.coverFadeAlpha = 1f;
            }
            if (blurred != null) {
                this.currentBlurredBitmap = blurred;
                this.prevBlurredBitmap = null;
                this.blurFadeAlpha = 1f;
            }
            if (pal != null) {
                this.hasInitialPalette = true;
                this.startPalette = pal;
                this.targetPalette = pal;
                copyPalette(pal, this.activePalette);
                this.paletteMorph = 1f;
            }
            if (hiRes == null) {
                loadCoverAndBlurAsync(miniCoverId);
            }
        }
    }

    /**
     * Copies all live artwork bitmaps, blurred backdrop, derived palette, spring positions,
     * and waveform phase from the interactive expansion preview instance so the newly mounted
     * full-screen player renders an identical Frame 0 with zero flash.
     */
    public void copyVisualStateFrom(ExpressivePlayerView src) {
        if (src == null) {
            return;
        }
        this.title = src.title;
        this.artist = src.artist;
        this.coverId = src.coverId;
        this.playState = src.playState;
        this.repeatMode = src.repeatMode;
        this.badgeText = src.badgeText;
        this.progressTime = src.progressTime;
        this.durationTime = src.durationTime;
        this.sourceName = src.sourceName;
        this.serverProgress = src.serverProgress;
        this.isExplicit = src.isExplicit;
        this.isShuffleOn = src.isShuffleOn;
        this.isNextEnabled = src.isNextEnabled;
        this.isFavorite = src.isFavorite;
        this.showLyricsButton = src.showLyricsButton;
        this.isBroadcastConnected = src.isBroadcastConnected;

        this.currentCoverBitmap = src.currentCoverBitmap;
        this.prevCoverBitmap = null;
        this.coverFadeAlpha = 1f;

        this.currentBlurredBitmap = src.currentBlurredBitmap;
        this.prevBlurredBitmap = null;
        this.blurFadeAlpha = 1f;

        this.hasInitialPalette = src.hasInitialPalette;
        this.startPalette = src.targetPalette != null ? src.targetPalette : src.activePalette;
        this.targetPalette = src.targetPalette != null ? src.targetPalette : src.activePalette;
        copyPalette(src.activePalette, this.activePalette);
        this.paletteMorph = 1f;

        this.springsInitialized = true;
        this.playShapeMorph = src.playShapeMorph;
        this.playShapeVel = 0f;
        this.coverScale = src.coverScale;
        this.coverScaleVel = 0f;
        this.coverCornerMorph = src.coverCornerMorph;
        this.coverCornerVel = 0f;
        this.waveAmpMorph = src.waveAmpMorph;
        this.waveAmpVel = 0f;
        this.wavePhaseRad = src.wavePhaseRad;
        this.bufferingAngleDeg = src.bufferingAngleDeg;
        this.shuffleFrac = src.shuffleFrac;
        this.repeatFrac = src.repeatFrac;
        this.favoriteFrac = src.favoriteFrac;
        this.broadcastFrac = src.broadcastFrac;
        this.statusBarInsetPx = src.statusBarInsetPx;
        this.navBarInsetPx = src.navBarInsetPx;

        if (this.coverId != null && !this.coverId.isEmpty()
                && (this.currentCoverBitmap == null || HI_RES_ART_CACHE.get(this.coverId) == null)) {
            loadCoverAndBlurAsync(this.coverId);
        }
    }

    @Override
    public WindowInsets onApplyWindowInsets(WindowInsets insets) {
        if (insets != null) {
            android.graphics.Insets bars = insets.getInsetsIgnoringVisibility(
                    WindowInsets.Type.statusBars() | WindowInsets.Type.displayCutout());
            android.graphics.Insets nav = insets.getInsetsIgnoringVisibility(
                    WindowInsets.Type.navigationBars());
            statusBarInsetPx = Math.max(20f * density, bars.top);
            navBarInsetPx = Math.max(14f * density, nav.bottom);
            invalidate();
        }
        return super.onApplyWindowInsets(insets);
    }

    public void updateState(
            String newTitle,
            String newArtist,
            String newCoverId,
            String newPlayState,
            String newRepeatMode,
            String newBadgeText,
            String newProgressTime,
            String newDurationTime,
            String newSourceName,
            float newProgress,
            boolean newIsExplicit,
            boolean newIsShuffleOn,
            boolean newIsNextEnabled,
            boolean newIsFavorite,
            boolean newShowLyricsButton,
            boolean newIsBroadcastConnected,
            boolean newIsLyricsVisible,
            boolean newIsLyricsLoading,
            boolean newIsLyricsSynced,
            String[] newLyricLines,
            long[] newLyricTimesMs,
            int newHighlightedLyricIndex
    ) {
        String safeTitle = newTitle != null ? newTitle : "";
        String safeArtist = newArtist != null ? newArtist : "";
        String safePlay = newPlayState != null ? newPlayState : "PAUSED";
        String safeRepeat = newRepeatMode != null ? newRepeatMode : "OFF";
        String safeBadge = newBadgeText != null ? newBadgeText : "";
        String safeProgTime = newProgressTime != null ? newProgressTime : "00:00";
        String safeDurTime = newDurationTime != null ? newDurationTime : "00:00";
        String safeSource = newSourceName != null ? newSourceName : "";

        boolean coverChanged = (newCoverId != null && !newCoverId.equals(this.coverId))
                || (newCoverId == null && this.coverId != null);
        boolean favBecameTrue = !this.isFavorite && newIsFavorite && springsInitialized;
        boolean lyricsOpening = !this.isLyricsVisible && newIsLyricsVisible;
        boolean lyricsLinesChanged = newIsLyricsVisible && !arraysEqual(this.lyricLines, newLyricLines);
        boolean lyricsContentChanged = this.isLyricsVisible != newIsLyricsVisible
                || this.isLyricsLoading != newIsLyricsLoading
                || this.isLyricsSynced != newIsLyricsSynced
                || lyricsLinesChanged;
        boolean highlightChanged = this.highlightedLyricIndex != newHighlightedLyricIndex;

        this.title = safeTitle;
        this.artist = safeArtist;
        this.coverId = newCoverId;
        this.playState = safePlay;
        this.repeatMode = safeRepeat;
        this.badgeText = safeBadge;
        this.progressTime = safeProgTime;
        this.durationTime = safeDurTime;
        this.sourceName = safeSource;
        if (!isScrubbing && SystemClock.uptimeMillis() >= scrubHoldUntilMs) {
            this.serverProgress = Math.max(0f, Math.min(1f, newProgress));
        }
        this.isExplicit = newIsExplicit;
        this.isShuffleOn = newIsShuffleOn;
        this.isNextEnabled = newIsNextEnabled;
        this.isFavorite = newIsFavorite;
        this.showLyricsButton = newShowLyricsButton;
        this.isBroadcastConnected = newIsBroadcastConnected;
        this.isLyricsVisible = newIsLyricsVisible;
        this.isLyricsLoading = newIsLyricsLoading;
        this.isLyricsSynced = newIsLyricsSynced;
        if (newIsLyricsVisible) {
            this.lyricLines = newLyricLines;
            this.lyricTimesMs = newLyricTimesMs;
            this.highlightedLyricIndex = newHighlightedLyricIndex;
        } else if (coverChanged) {
            this.lyricLines = null;
            this.lyricTimesMs = null;
            this.highlightedLyricIndex = -1;
            this.lyricLineFocus = null;
            this.lastLayoutLyricsWidth = 0;
        }

        if (!springsInitialized) {
            springsInitialized = true;
            boolean playing = "PLAYING".equals(playState);
            playShapeMorph = playing ? 1f : 0f;
            coverScale = playing ? 1f : 0.945f;
            coverCornerMorph = playing ? 1f : 0f;
            waveAmpMorph = (playing && MaterialYouConfig.isPlayerSquigglySeekbarEnabled()) ? 1f : 0f;
            lyricsReveal = isLyricsVisible ? 1f : 0f;
            shuffleFrac = isShuffleOn ? 1f : 0f;
            repeatFrac = !"OFF".equals(repeatMode) ? 1f : 0f;
            favoriteFrac = isFavorite ? 1f : 0f;
            broadcastFrac = isBroadcastConnected ? 1f : 0f;
        }

        if (favBecameTrue) {
            heartPopImpulse = 1f;
            heartPopVel = 5.4f;
        }

        if (lyricsLinesChanged || (lyricsOpening && newIsLyricsVisible)) {
            lastLayoutLyricsWidth = 0;
            tappedLyricIndex = -1;
            tappedLyricFlash = 0f;
            lyricsFlingVel = 0f;
            if (newIsLyricsVisible) {
                lastUserLyricsScrollMs = 0L;
            }
            if (this.lyricLines != null) {
                this.lyricLineFocus = new float[this.lyricLines.length];
                if (this.isLyricsSynced && this.highlightedLyricIndex >= 0
                        && this.highlightedLyricIndex < this.lyricLineFocus.length) {
                    this.lyricLineFocus[this.highlightedLyricIndex] = 1f;
                }
            } else {
                this.lyricLineFocus = null;
            }
        }
        if ((lyricsContentChanged || highlightChanged) && isLyricsVisible && isLyricsSynced) {
            updateAutoLyricsScrollTarget();
        }

        if (coverChanged) {
            loadCoverAndBlurAsync(newCoverId);
        }

        startAnimationLoop();
        invalidate();
    }

    private static boolean arraysEqual(String[] a, String[] b) {
        if (a == b) return true;
        if (a == null || b == null || a.length != b.length) return false;
        for (int i = 0; i < a.length; i++) {
            if (!TextUtils.equals(a[i], b[i])) return false;
        }
        return true;
    }

    private void loadCoverAndBlurAsync(final String resourceId) {
        if (resourceId == null || resourceId.isEmpty()) {
            prevCoverBitmap = currentCoverBitmap;
            currentCoverBitmap = null;
            prevBlurredBitmap = currentBlurredBitmap;
            currentBlurredBitmap = null;
            transitionToPalette(buildDefaultPalette());
            startAnimationLoop();
            return;
        }

        Bitmap cachedHiRes = HI_RES_ART_CACHE.get(resourceId);
        Bitmap cachedBlur = BLUR_ART_CACHE.get(resourceId);
        PlayerPalette cachedPal = PALETTE_CACHE.get(makePaletteKey(resourceId));

        if (cachedHiRes != null && cachedBlur != null && cachedPal != null) {
            applyNewArtAndBlur(cachedHiRes, cachedBlur, cachedPal, false);
            return;
        }

        // Instant zero-latency seed from MiniPlayer's 160x160 cache while 640x640 downloads
        Bitmap miniSeed = ExpressiveMiniPlayerView.getCachedArtwork(resourceId);
        if (miniSeed != null) {
            Bitmap quickBlur = cachedBlur != null ? cachedBlur : createHeavyBlur(miniSeed);
            if (cachedBlur == null && quickBlur != null) {
                BLUR_ART_CACHE.put(resourceId, quickBlur);
            }
            String palKey = makePaletteKey(resourceId);
            PlayerPalette quickPal = cachedPal != null ? cachedPal : derivePaletteFromCover(miniSeed);
            if (cachedPal == null && quickPal != null) {
                PALETTE_CACHE.put(palKey, quickPal);
            }
            applyNewArtAndBlur(miniSeed, quickBlur, quickPal, false);
        }

        final String requestedId = resourceId;
        ART_EXECUTOR.execute(() -> {
            Bitmap hiRes = cachedHiRes != null ? cachedHiRes : fetchCoverBitmap(requestedId);
            if (hiRes == null) {
                return;
            }
            HI_RES_ART_CACHE.put(requestedId, hiRes);

            Bitmap blurred = BLUR_ART_CACHE.get(requestedId);
            if (blurred == null) {
                blurred = createHeavyBlur(hiRes);
                if (blurred != null) {
                    BLUR_ART_CACHE.put(requestedId, blurred);
                }
            }

            String palKey = makePaletteKey(requestedId);
            PlayerPalette pal = PALETTE_CACHE.get(palKey);
            if (pal == null) {
                pal = derivePaletteFromCover(hiRes);
                PALETTE_CACHE.put(palKey, pal);
            }

            final Bitmap finalBlur = blurred;
            final PlayerPalette finalPal = pal;
            MAIN_HANDLER.post(() -> {
                if (requestedId.equals(ExpressivePlayerView.this.coverId)) {
                    applyNewArtAndBlur(hiRes, finalBlur, finalPal, miniSeed != null);
                }
            });
        });
    }

    private void applyNewArtAndBlur(
            Bitmap cover,
            Bitmap blurred,
            PlayerPalette pal,
            boolean isUpgradeFromSeed
    ) {
        if (isUpgradeFromSeed && cover != null) {
            // Sharp crisp swap from 160px seed to 640px high-res without fading out
            currentCoverBitmap = cover;
            coverFadeAlpha = 1f;
            if (blurred != null) {
                currentBlurredBitmap = blurred;
                blurFadeAlpha = 1f;
            }
            if (pal != null) {
                transitionToPalette(pal);
            }
            startAnimationLoop();
            invalidate();
            return;
        }

        if (currentCoverBitmap != cover) {
            prevCoverBitmap = currentCoverBitmap;
            currentCoverBitmap = cover;
            coverFadeAlpha = (prevCoverBitmap != null && !isPreviewInstance) ? 0f : 1f;
        }
        if (currentBlurredBitmap != blurred && blurred != null) {
            prevBlurredBitmap = currentBlurredBitmap;
            currentBlurredBitmap = blurred;
            blurFadeAlpha = (prevBlurredBitmap != null && !isPreviewInstance) ? 0f : 1f;
        }
        if (pal != null) {
            transitionToPalette(pal);
        }
        startAnimationLoop();
        invalidate();
    }

    private void transitionToPalette(PlayerPalette next) {
        if (next == null) {
            return;
        }
        if (!hasInitialPalette || isPreviewInstance || targetPalette == next) {
            hasInitialPalette = true;
            startPalette = next;
            targetPalette = next;
            copyPalette(next, activePalette);
            paletteMorph = 1f;
            if (isAttachedToWindow()) {
                syncSystemBarsForPalette(next);
            }
            return;
        }
        PlayerPalette snapshot = new PlayerPalette();
        copyPalette(activePalette, snapshot);
        startPalette = snapshot;
        targetPalette = next;
        paletteMorph = 0f;
        if (isAttachedToWindow()) {
            syncSystemBarsForPalette(next);
        }
    }

    private static Bitmap fetchCoverBitmap(String resourceId) {
        HttpURLConnection conn = null;
        try {
            String path = resourceId.trim().replace('-', '/');
            URL url = new URL("https://resources.tidal.com/images/" + path + "/640x640.jpg");
            conn = (HttpURLConnection) url.openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);
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

    /**
     * Generates a silky, heavily blurred cover art bitmap via downscale + 3-pass separable box blur
     * (approximating a large-radius Gaussian blur cleanly with zero native RenderScript dependencies).
     */
    private static Bitmap createHeavyBlur(Bitmap src) {
        if (src == null || src.isRecycled()) {
            return null;
        }
        try {
            int size = BLUR_BITMAP_SIZE;
            Bitmap scaled = Bitmap.createScaledBitmap(src, size, size, true);
            Bitmap out = scaled.copy(Bitmap.Config.ARGB_8888, true);
            if (scaled != src && scaled != out) {
                scaled.recycle();
            }

            int[] pixels = new int[size * size];
            int[] temp = new int[size * size];
            out.getPixels(pixels, 0, size, 0, 0, size, size);

            for (int pass = 0; pass < 3; pass++) {
                boxBlurHorizontal(pixels, temp, size, size, BLUR_RADIUS);
                boxBlurVertical(temp, pixels, size, size, BLUR_RADIUS);
            }

            out.setPixels(pixels, 0, size, 0, 0, size, size);
            return out;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void boxBlurHorizontal(int[] src, int[] dst, int w, int h, int radius) {
        int div = radius * 2 + 1;
        for (int y = 0; y < h; y++) {
            int rowOffset = y * w;
            int rSum = 0;
            int gSum = 0;
            int bSum = 0;

            for (int i = -radius; i <= radius; i++) {
                int c = src[rowOffset + clampInt(i, 0, w - 1)];
                rSum += (c >> 16) & 0xFF;
                gSum += (c >> 8) & 0xFF;
                bSum += c & 0xFF;
            }

            for (int x = 0; x < w; x++) {
                dst[rowOffset + x] = 0xFF000000
                        | ((rSum / div) << 16)
                        | ((gSum / div) << 8)
                        | (bSum / div);

                int nextIdx = clampInt(x + radius + 1, 0, w - 1);
                int prevIdx = clampInt(x - radius, 0, w - 1);
                int cNext = src[rowOffset + nextIdx];
                int cPrev = src[rowOffset + prevIdx];

                rSum += ((cNext >> 16) & 0xFF) - ((cPrev >> 16) & 0xFF);
                gSum += ((cNext >> 8) & 0xFF) - ((cPrev >> 8) & 0xFF);
                bSum += (cNext & 0xFF) - (cPrev & 0xFF);
            }
        }
    }

    private static void boxBlurVertical(int[] src, int[] dst, int w, int h, int radius) {
        int div = radius * 2 + 1;
        for (int x = 0; x < w; x++) {
            int rSum = 0;
            int gSum = 0;
            int bSum = 0;

            for (int i = -radius; i <= radius; i++) {
                int c = src[clampInt(i, 0, h - 1) * w + x];
                rSum += (c >> 16) & 0xFF;
                gSum += (c >> 8) & 0xFF;
                bSum += c & 0xFF;
            }

            for (int y = 0; y < h; y++) {
                dst[y * w + x] = 0xFF000000
                        | ((rSum / div) << 16)
                        | ((gSum / div) << 8)
                        | (bSum / div);

                int nextIdx = clampInt(y + radius + 1, 0, h - 1);
                int prevIdx = clampInt(y - radius, 0, h - 1);
                int cNext = src[nextIdx * w + x];
                int cPrev = src[prevIdx * w + x];

                rSum += ((cNext >> 16) & 0xFF) - ((cPrev >> 16) & 0xFF);
                gSum += ((cNext >> 8) & 0xFF) - ((cPrev >> 8) & 0xFF);
                bSum += (cNext & 0xFF) - (cPrev & 0xFF);
            }
        }
    }

    private static int clampInt(int v, int min, int max) {
        return v < min ? min : (v > max ? max : v);
    }

    private static PlayerPalette buildDefaultPalette() {
        int style = MaterialYouConfig.getPlayerColorStyle();
        int monetSeed = MaterialYouColorEngine.getNavbarActivePillColor();
        float[] hsl = new float[3];
        rgbToHsl(monetSeed, hsl);
        return buildPaletteForHsl(hsl[0], Math.max(0.45f, hsl[1]), 0.40f, style);
    }

    private static PlayerPalette derivePaletteFromCover(Bitmap bmp) {
        int style = MaterialYouConfig.getPlayerColorStyle();
        if (bmp == null || bmp.isRecycled()) {
            return buildDefaultPalette();
        }
        Bitmap small = Bitmap.createScaledBitmap(bmp, 24, 24, true);
        float[] bucketWeight = new float[24];
        float[] bucketSat = new float[24];
        float[] hsl = new float[3];
        double totalLuma = 0;
        int count = 0;

        // Track secondary vibrant accent for harmonious contrast button (like pink/blue/gold)
        float secondHue = -1f;
        float secondScore = 0f;

        for (int y = 0; y < 24; y++) {
            for (int x = 0; x < 24; x++) {
                int c = small.getPixel(x, y);
                int r = Color.red(c);
                int g = Color.green(c);
                int b = Color.blue(c);
                double luma = (0.299 * r + 0.587 * g + 0.114 * b) / 255.0;
                totalLuma += luma;
                count++;

                rgbToHsl(c, hsl);
                float sat = hsl[1];
                float light = hsl[2];
                // Weight mid-tone chromatic pixels highest; ignore near-black/white
                float chromaWeight = sat * (1f - Math.abs(light * 2f - 1f) * 0.7f);
                if (sat > 0.10f && light > 0.08f && light < 0.93f) {
                    int bucket = ((int) (hsl[0] / 15f)) % 24;
                    float w = 0.25f + chromaWeight * 2.4f;
                    bucketWeight[bucket] += w;
                    bucketSat[bucket] += sat * w;
                }
            }
        }
        if (small != bmp) {
            small.recycle();
        }

        float avgLuma = (float) (totalLuma / Math.max(1, count));
        int bestBucket = -1;
        float bestW = 0f;
        for (int i = 0; i < 24; i++) {
            if (bucketWeight[i] > bestW) {
                bestW = bucketWeight[i];
                bestBucket = i;
            }
        }

        float domHue;
        float domSat;
        if (bestBucket >= 0 && bestW > 1.5f) {
            domHue = bestBucket * 15f + 7.5f;
            domSat = Math.max(0.28f, Math.min(0.85f, bucketSat[bestBucket] / bestW));
        } else {
            float[] monetHsl = new float[3];
            rgbToHsl(MaterialYouColorEngine.getNavbarActivePillColor(), monetHsl);
            domHue = monetHsl[0];
            domSat = Math.max(0.32f, monetHsl[1]);
        }

        // Find distinct secondary color if present in cover (e.g. warm gold on red, pink on teal)
        for (int i = 0; i < 24; i++) {
            float h = i * 15f + 7.5f;
            float diff = Math.abs(h - domHue);
            if (diff > 180f) diff = 360f - diff;
            if (diff >= 40f && bucketWeight[i] > secondScore) {
                secondScore = bucketWeight[i];
                secondHue = h;
            }
        }

        PlayerPalette pal = buildPaletteForHsl(domHue, domSat, avgLuma, style);
        if (secondHue >= 0f && secondScore > bestW * 0.18f) {
            // Harmonize center play/pause squircle with cover's own secondary accent
            if (style == MaterialYouConfig.PLAYER_STYLE_DARK_BLUR && MaterialYouColorEngine.isLightMode()) {
                pal.centerPlayBg = hslToRgb(secondHue, 0.58f, 0.36f);
            } else if (style == MaterialYouConfig.PLAYER_STYLE_COVER_PASTEL) {
                pal.centerPlayBg = hslToRgb(secondHue, 0.52f, 0.83f);
            } else {
                pal.centerPlayBg = hslToRgb(secondHue, 0.58f, 0.82f);
            }
        }
        return pal;
    }

    private static PlayerPalette buildPaletteForHsl(float hue, float sat, float avgLuma, int style) {
        PlayerPalette p = new PlayerPalette();
        float compHue = (hue + 48f) % 360f;

        if (style == MaterialYouConfig.PLAYER_STYLE_DARK_BLUR) {
            if (MaterialYouColorEngine.isLightMode()) {
                p.blurWashColor = MaterialYouColorEngine.withAlpha(hslToRgb(hue, sat * 0.30f, 0.90f), 0xBA);
                p.primaryDeep = hslToRgb(hue, Math.min(0.45f, sat * 0.60f), 0.14f);
                p.secondaryText = hslToRgb(hue, Math.min(0.36f, sat * 0.52f), 0.30f);
                p.sideBtnBg = hslToRgb(hue, Math.min(0.68f, sat * 0.85f), 0.24f);
                p.sideBtnIcon = 0xFFFEFFFE;
                p.centerPlayBg = hslToRgb(compHue, 0.58f, 0.36f);
                p.centerPlayIcon = 0xFFFEFFFE;
                p.glassPillBg = MaterialYouColorEngine.withAlpha(hslToRgb(hue, sat * 0.24f, 0.94f), 0xC8);
                p.glassPillActiveBg = p.sideBtnBg;
                p.glassPillActiveIcon = 0xFFFEFFFE;
                p.capsuleFrameBg = MaterialYouColorEngine.withAlpha(hslToRgb(hue, sat * 0.22f, 0.96f), 0xDC);
                p.capsuleSegmentBg = MaterialYouColorEngine.withAlpha(hslToRgb(hue, sat * 0.26f, 0.89f), 0xD4);
                p.badgeBg = MaterialYouColorEngine.withAlpha(hslToRgb(hue, sat * 0.28f, 0.88f), 0xB8);
                p.badgeText = p.secondaryText;
                p.lyricsCardBg = MaterialYouColorEngine.withAlpha(hslToRgb(hue, sat * 0.25f, 0.93f), 0xD6);
                p.lyricsActiveText = p.primaryDeep;
                p.lyricsInactiveText = MaterialYouColorEngine.withAlpha(p.secondaryText, 0x8E);
                p.shadowBase = 0x38000000;
                return p;
            }
            p.blurWashColor = MaterialYouColorEngine.withAlpha(hslToRgb(hue, sat * 0.45f, 0.10f), 0x86);
            p.primaryDeep = hslToRgb(hue, Math.min(0.30f, sat * 0.45f), 0.95f);
            p.secondaryText = hslToRgb(hue, Math.min(0.28f, sat * 0.45f), 0.78f);
            p.sideBtnBg = hslToRgb(hue, Math.min(0.75f, sat * 0.90f), 0.25f);
            p.sideBtnIcon = hslToRgb(hue, Math.min(0.35f, sat * 0.50f), 0.94f);
            p.centerPlayBg = hslToRgb(compHue, 0.62f, 0.80f);
            p.centerPlayIcon = hslToRgb(compHue, 0.55f, 0.12f);
            p.glassPillBg = MaterialYouColorEngine.withAlpha(hslToRgb(hue, sat * 0.40f, 0.26f), 0xB8);
            p.glassPillActiveBg = hslToRgb(hue, Math.min(0.72f, sat * 0.95f), 0.78f);
            p.glassPillActiveIcon = hslToRgb(hue, 0.55f, 0.12f);
            p.capsuleFrameBg = MaterialYouColorEngine.withAlpha(hslToRgb(hue, sat * 0.30f, 0.24f), 0xCC);
            p.capsuleSegmentBg = MaterialYouColorEngine.withAlpha(hslToRgb(hue, sat * 0.30f, 0.34f), 0xD8);
            p.badgeBg = MaterialYouColorEngine.withAlpha(hslToRgb(hue, sat * 0.35f, 0.28f), 0xBF);
            p.badgeText = p.secondaryText;
            p.lyricsCardBg = MaterialYouColorEngine.withAlpha(hslToRgb(hue, sat * 0.40f, 0.14f), 0xBF);
            p.lyricsActiveText = 0xFFFFFFFF;
            p.lyricsInactiveText = MaterialYouColorEngine.withAlpha(p.secondaryText, 0x99);
            p.shadowBase = 0x7A000000;
            return p;
        }

        if (style == MaterialYouConfig.PLAYER_STYLE_RAW_COVER_BLUR) {
            boolean lightBg = avgLuma > 0.56f;
            p.blurWashColor = lightBg ? 0x26FFFFFF : 0x44000000;
            p.primaryDeep = lightBg ? hslToRgb(hue, 0.68f, 0.15f) : 0xFFF8FAFC;
            p.secondaryText = lightBg ? hslToRgb(hue, 0.52f, 0.28f) : 0xFFD4D8DE;
            p.sideBtnBg = lightBg
                    ? hslToRgb(hue, Math.min(0.85f, sat * 1.1f), 0.22f)
                    : hslToRgb(hue, Math.min(0.72f, sat * 0.9f), 0.28f);
            p.sideBtnIcon = 0xFFFFFFFF;
            p.centerPlayBg = hslToRgb(compHue, 0.58f, 0.83f);
            p.centerPlayIcon = hslToRgb(compHue, 0.55f, 0.13f);
            p.glassPillBg = lightBg ? 0x99FFFFFF : 0x55FFFFFF;
            p.glassPillActiveBg = p.sideBtnBg;
            p.glassPillActiveIcon = 0xFFFFFFFF;
            p.capsuleFrameBg = lightBg ? 0xB8FFFFFF : 0x4DFFFFFF;
            p.capsuleSegmentBg = lightBg ? 0xD8F2F6F4 : 0x66FFFFFF;
            p.badgeBg = lightBg ? 0x80FFFFFF : 0x44FFFFFF;
            p.badgeText = p.primaryDeep;
            p.lyricsCardBg = lightBg ? 0xB8FFFFFF : 0x88101214;
            p.lyricsActiveText = p.primaryDeep;
            p.lyricsInactiveText = MaterialYouColorEngine.withAlpha(p.secondaryText, 0xA0);
            p.shadowBase = 0x52000000;
            return p;
        }

        // PLAYER_STYLE_COVER_PASTEL (Default — matches the screenshot + strongly blurred cover)
        // Soft luminous pastel glaze over the heavily blurred cover so blurred shapes shine through
        // while deep saturated cover-tinted text & transport pills maintain crisp high contrast.
        p.blurWashColor = MaterialYouColorEngine.withAlpha(hslToRgb(hue, Math.min(0.68f, sat * 0.95f), 0.72f), 0x82);
        p.primaryDeep = hslToRgb(hue, Math.min(0.86f, sat * 1.05f), 0.16f);
        p.secondaryText = hslToRgb(hue, Math.min(0.62f, sat * 0.85f), 0.26f);
        p.sideBtnBg = hslToRgb(hue, Math.min(0.88f, sat * 1.10f), 0.21f);
        p.sideBtnIcon = hslToRgb(hue, 0.30f, 0.96f);
        p.centerPlayBg = hslToRgb(compHue, 0.54f, 0.84f);
        p.centerPlayIcon = hslToRgb(hue, 0.65f, 0.13f);
        p.glassPillBg = MaterialYouColorEngine.withAlpha(hslToRgb(hue, 0.34f, 0.92f), 0xB5);
        p.glassPillActiveBg = p.sideBtnBg;
        p.glassPillActiveIcon = 0xFFFFFFFF;
        p.capsuleFrameBg = MaterialYouColorEngine.withAlpha(hslToRgb(hue, 0.25f, 0.97f), 0xD8);
        p.capsuleSegmentBg = MaterialYouColorEngine.withAlpha(hslToRgb(hue, 0.30f, 0.89f), 0xCC);
        p.badgeBg = MaterialYouColorEngine.withAlpha(hslToRgb(hue, 0.32f, 0.88f), 0x9E);
        p.badgeText = p.secondaryText;
        p.lyricsCardBg = MaterialYouColorEngine.withAlpha(hslToRgb(hue, 0.38f, 0.90f), 0xCC);
        p.lyricsActiveText = p.primaryDeep;
        p.lyricsInactiveText = MaterialYouColorEngine.withAlpha(p.secondaryText, 0x88);
        p.shadowBase = 0x3D000000;
        return p;
    }

    private static void copyPalette(PlayerPalette src, PlayerPalette dst) {
        dst.blurWashColor = src.blurWashColor;
        dst.primaryDeep = src.primaryDeep;
        dst.secondaryText = src.secondaryText;
        dst.centerPlayBg = src.centerPlayBg;
        dst.centerPlayIcon = src.centerPlayIcon;
        dst.sideBtnBg = src.sideBtnBg;
        dst.sideBtnIcon = src.sideBtnIcon;
        dst.glassPillBg = src.glassPillBg;
        dst.glassPillActiveBg = src.glassPillActiveBg;
        dst.glassPillActiveIcon = src.glassPillActiveIcon;
        dst.capsuleFrameBg = src.capsuleFrameBg;
        dst.capsuleSegmentBg = src.capsuleSegmentBg;
        dst.badgeBg = src.badgeBg;
        dst.badgeText = src.badgeText;
        dst.lyricsCardBg = src.lyricsCardBg;
        dst.lyricsActiveText = src.lyricsActiveText;
        dst.lyricsInactiveText = src.lyricsInactiveText;
        dst.shadowBase = src.shadowBase;
    }

    private static void interpolatePalette(PlayerPalette a, PlayerPalette b, float t, PlayerPalette out) {
        out.blurWashColor = MaterialYouColorEngine.blendRgb(a.blurWashColor, b.blurWashColor, t);
        out.primaryDeep = MaterialYouColorEngine.blendRgb(a.primaryDeep, b.primaryDeep, t);
        out.secondaryText = MaterialYouColorEngine.blendRgb(a.secondaryText, b.secondaryText, t);
        out.centerPlayBg = MaterialYouColorEngine.blendRgb(a.centerPlayBg, b.centerPlayBg, t);
        out.centerPlayIcon = MaterialYouColorEngine.blendRgb(a.centerPlayIcon, b.centerPlayIcon, t);
        out.sideBtnBg = MaterialYouColorEngine.blendRgb(a.sideBtnBg, b.sideBtnBg, t);
        out.sideBtnIcon = MaterialYouColorEngine.blendRgb(a.sideBtnIcon, b.sideBtnIcon, t);
        out.glassPillBg = MaterialYouColorEngine.blendRgb(a.glassPillBg, b.glassPillBg, t);
        out.glassPillActiveBg = MaterialYouColorEngine.blendRgb(a.glassPillActiveBg, b.glassPillActiveBg, t);
        out.glassPillActiveIcon = MaterialYouColorEngine.blendRgb(a.glassPillActiveIcon, b.glassPillActiveIcon, t);
        out.capsuleFrameBg = MaterialYouColorEngine.blendRgb(a.capsuleFrameBg, b.capsuleFrameBg, t);
        out.capsuleSegmentBg = MaterialYouColorEngine.blendRgb(a.capsuleSegmentBg, b.capsuleSegmentBg, t);
        out.badgeBg = MaterialYouColorEngine.blendRgb(a.badgeBg, b.badgeBg, t);
        out.badgeText = MaterialYouColorEngine.blendRgb(a.badgeText, b.badgeText, t);
        out.lyricsCardBg = MaterialYouColorEngine.blendRgb(a.lyricsCardBg, b.lyricsCardBg, t);
        out.lyricsActiveText = MaterialYouColorEngine.blendRgb(a.lyricsActiveText, b.lyricsActiveText, t);
        out.lyricsInactiveText = MaterialYouColorEngine.blendRgb(a.lyricsInactiveText, b.lyricsInactiveText, t);
        out.shadowBase = MaterialYouColorEngine.blendRgb(a.shadowBase, b.shadowBase, t);
    }

    private static void rgbToHsl(int color, float[] hsl) {
        float r = Color.red(color) / 255f;
        float g = Color.green(color) / 255f;
        float b = Color.blue(color) / 255f;
        float max = Math.max(r, Math.max(g, b));
        float min = Math.min(r, Math.min(g, b));
        float l = (max + min) * 0.5f;
        float h;
        float s;
        if (max == min) {
            h = 0f;
            s = 0f;
        } else {
            float d = max - min;
            s = l > 0.5f ? d / (2f - max - min) : d / (max + min);
            if (max == r) {
                h = (g - b) / d + (g < b ? 6f : 0f);
            } else if (max == g) {
                h = (b - r) / d + 2f;
            } else {
                h = (r - g) / d + 4f;
            }
            h *= 60f;
        }
        hsl[0] = h;
        hsl[1] = s;
        hsl[2] = l;
    }

    private static int hslToRgb(float h, float s, float l) {
        h = ((h % 360f) + 360f) % 360f;
        s = Math.max(0f, Math.min(1f, s));
        l = Math.max(0f, Math.min(1f, l));
        float c = (1f - Math.abs(2f * l - 1f)) * s;
        float x = c * (1f - Math.abs((h / 60f) % 2f - 1f));
        float m = l - c * 0.5f;
        float r, g, b;
        if (h < 60f) {
            r = c; g = x; b = 0f;
        } else if (h < 120f) {
            r = x; g = c; b = 0f;
        } else if (h < 180f) {
            r = 0f; g = c; b = x;
        } else if (h < 240f) {
            r = 0f; g = x; b = c;
        } else if (h < 300f) {
            r = x; g = 0f; b = c;
        } else {
            r = c; g = 0f; b = x;
        }
        return Color.argb(
                255,
                clampInt(Math.round((r + m) * 255f), 0, 255),
                clampInt(Math.round((g + m) * 255f), 0, 255),
                clampInt(Math.round((b + m) * 255f), 0, 255)
        );
    }

    // ---- Spring Animation Loop ----

    private void startAnimationLoop() {
        if (!isAnimating) {
            isAnimating = true;
            lastFrameMs = SystemClock.uptimeMillis();
            postOnAnimation(frameTick);
        }
    }

    private void stepAnimations() {
        if (!isAnimating) {
            return;
        }
        long now = SystemClock.uptimeMillis();
        float dt = Math.min(0.032f, Math.max(0.004f, (now - lastFrameMs) / 1000f));
        lastFrameMs = now;

        boolean settled = true;
        boolean playing = "PLAYING".equals(playState);
        boolean buffering = "BUFFERING".equals(playState);

        // 1. Center Play/Pause morph spring
        float targetPlayMorph = playing ? 1f : 0f;
        float[] res = stepSpring(playShapeMorph, playShapeVel, targetPlayMorph, 380f, 0.72f, dt);
        playShapeMorph = Math.max(-0.08f, Math.min(1.08f, res[0]));
        playShapeVel = res[1];
        if (!isSettled(playShapeMorph, playShapeVel, targetPlayMorph)) {
            settled = false;
        } else {
            playShapeMorph = targetPlayMorph;
            playShapeVel = 0f;
        }

        // 2. Hero Cover scale & corner morph on Play/Pause
        float targetCoverScale = playing ? 1f : 0.945f;
        res = stepSpring(coverScale, coverScaleVel, targetCoverScale, 310f, 0.74f, dt);
        coverScale = Math.max(0.88f, Math.min(1.04f, res[0]));
        coverScaleVel = res[1];
        if (!isSettled(coverScale, coverScaleVel, targetCoverScale)) {
            settled = false;
        } else {
            coverScale = targetCoverScale;
            coverScaleVel = 0f;
        }

        float targetCorner = playing ? 1f : 0f;
        res = stepSpring(coverCornerMorph, coverCornerVel, targetCorner, 340f, 0.78f, dt);
        coverCornerMorph = Math.max(-0.05f, Math.min(1.06f, res[0]));
        coverCornerVel = res[1];
        if (!isSettled(coverCornerMorph, coverCornerVel, targetCorner)) {
            settled = false;
        } else {
            coverCornerMorph = targetCorner;
            coverCornerVel = 0f;
        }

        // 3. Squiggly Seekbar wave amplitude & continuous phase drift while playing
        float targetWaveAmp = (playing && MaterialYouConfig.isPlayerSquigglySeekbarEnabled()) ? 1f : 0f;
        res = stepSpring(waveAmpMorph, waveAmpVel, targetWaveAmp, 300f, 0.78f, dt);
        waveAmpMorph = Math.max(0f, Math.min(1.12f, res[0]));
        waveAmpVel = res[1];
        if (!isSettled(waveAmpMorph, waveAmpVel, targetWaveAmp)) {
            settled = false;
        } else {
            waveAmpMorph = targetWaveAmp;
            waveAmpVel = 0f;
        }

        if (playing && waveAmpMorph > 0.02f) {
            wavePhaseRad = (wavePhaseRad + 2.35f * dt) % ((float) (Math.PI * 2.0));
            bgBreathPhase = (bgBreathPhase + 0.42f * dt) % ((float) (Math.PI * 2.0));
            settled = false;
        }

        // 4. Seekbar thumb spring
        float targetThumb = isScrubbing ? 1.42f : 1f;
        res = stepSpring(thumbScale, thumbScaleVel, targetThumb, 520f, 0.68f, dt);
        thumbScale = Math.max(0.8f, Math.min(1.65f, res[0]));
        thumbScaleVel = res[1];
        if (!isSettled(thumbScale, thumbScaleVel, targetThumb)) {
            settled = false;
        } else {
            thumbScale = targetThumb;
            thumbScaleVel = 0f;
        }

        // 5. Lyrics reveal spring (smooth full-screen morph)
        float targetLyrics = isLyricsVisible ? 1f : 0f;
        res = stepSpring(lyricsReveal, lyricsRevealVel, targetLyrics, 280f, 0.86f, dt);
        lyricsReveal = Math.max(0f, Math.min(1f, res[0]));
        lyricsRevealVel = res[1];
        if (!isSettled(lyricsReveal, lyricsRevealVel, targetLyrics)) {
            settled = false;
        } else {
            lyricsReveal = targetLyrics;
            lyricsRevealVel = 0f;
            if (!isLyricsVisible) {
                lyricsScrollY = 0f;
                targetLyricsScrollY = 0f;
                lyricsScrollVel = 0f;
                lyricsFlingVel = 0f;
                syncPillReveal = 0f;
                syncPillVel = 0f;
                tappedLyricIndex = -1;
                tappedLyricFlash = 0f;
            }
        }

        // 5b. Lyrics skeleton pulse, per-line focus transitions, browse boost & tap flash
        if (isLyricsVisible && isLyricsLoading && lyricsReveal > 0.02f) {
            skeletonPulsePhase = (skeletonPulsePhase + 3.6f * dt) % ((float) (Math.PI * 2.0));
            settled = false;
        }

        if (lyricLineFocus != null && lyricsReveal > 0.01f) {
            float lineLerp = 1f - (float) Math.exp(-9.5 * dt);
            for (int i = 0; i < lyricLineFocus.length; i++) {
                float targetF = (isLyricsSynced && i == highlightedLyricIndex) ? 1f : 0f;
                if (Math.abs(lyricLineFocus[i] - targetF) > 0.004f) {
                    lyricLineFocus[i] += (targetF - lyricLineFocus[i]) * lineLerp;
                    settled = false;
                } else {
                    lyricLineFocus[i] = targetF;
                }
            }
        }

        boolean userBrowsing = isScrollingLyrics
                || Math.abs(lyricsFlingVel) > 12f
                || (SystemClock.uptimeMillis() - lastUserLyricsScrollMs < 2800L);
        float targetBoost = (isLyricsVisible && (userBrowsing || !isLyricsSynced)) ? 1f : 0f;
        if (Math.abs(lyricsBrowseBoost - targetBoost) > 0.005f) {
            float stepB = dt * 7.5f;
            lyricsBrowseBoost = lyricsBrowseBoost < targetBoost
                    ? Math.min(targetBoost, lyricsBrowseBoost + stepB)
                    : Math.max(targetBoost, lyricsBrowseBoost - stepB);
            settled = false;
        } else {
            lyricsBrowseBoost = targetBoost;
        }

        if (tappedLyricFlash > 0f) {
            tappedLyricFlash = Math.max(0f, tappedLyricFlash - dt / 0.32f);
            settled = false;
        }

        // 6. Lyrics scroll fling, rubber-band edge snap & smooth synced auto-scroll
        if (!isScrollingLyrics && lyricsReveal > 0.02f) {
            float vpH = lyricsViewportRect.height() > 1f
                    ? lyricsViewportRect.height()
                    : Math.max(1f, getHeight() * 0.60f);
            float maxScroll = Math.max(0f, totalLyricsContentH - vpH);

            if (Math.abs(lyricsFlingVel) > 12f) {
                lyricsScrollY += lyricsFlingVel * dt;
                float drag = (lyricsScrollY < 0f || lyricsScrollY > maxScroll) ? 14.0f : 3.4f;
                lyricsFlingVel *= (float) Math.exp(-drag * dt);
                float maxOver = 48f * density;
                if (lyricsScrollY < -maxOver) {
                    lyricsScrollY = -maxOver;
                    lyricsFlingVel = 0f;
                } else if (lyricsScrollY > maxScroll + maxOver) {
                    lyricsScrollY = maxScroll + maxOver;
                    lyricsFlingVel = 0f;
                }
                lastUserLyricsScrollMs = SystemClock.uptimeMillis();
                targetLyricsScrollY = Math.max(0f, Math.min(maxScroll, lyricsScrollY));
                settled = false;
            } else {
                lyricsFlingVel = 0f;
                if (lyricsScrollY < 0f || lyricsScrollY > maxScroll) {
                    float edge = Math.max(0f, Math.min(maxScroll, lyricsScrollY));
                    res = stepSpring(lyricsScrollY, lyricsScrollVel, edge, 260f, 0.84f, dt);
                    lyricsScrollY = res[0];
                    lyricsScrollVel = res[1];
                    if (!isSettled(lyricsScrollY, lyricsScrollVel, edge)) {
                        settled = false;
                    } else {
                        lyricsScrollY = edge;
                        lyricsScrollVel = 0f;
                    }
                } else if (isLyricsVisible) {
                    if (isLyricsSynced && SystemClock.uptimeMillis() - lastUserLyricsScrollMs >= 2800L) {
                        updateAutoLyricsScrollTarget();
                    }
                    if (Math.abs(lyricsScrollY - targetLyricsScrollY) > 0.5f || Math.abs(lyricsScrollVel) > 1f) {
                        res = stepSpring(lyricsScrollY, lyricsScrollVel, targetLyricsScrollY, 170f, 0.88f, dt);
                        lyricsScrollY = res[0];
                        lyricsScrollVel = res[1];
                        settled = false;
                    } else {
                        lyricsScrollY = targetLyricsScrollY;
                        lyricsScrollVel = 0f;
                    }
                }
            }
        }

        // 6b. Floating "Sync" pill reveal when user scrolled away from active synced line
        float desiredAutoY = computeAutoLyricsScrollY();
        boolean showSyncPill = isLyricsVisible
                && isLyricsSynced
                && !isLyricsLoading
                && lyricLines != null
                && lyricLines.length > 0
                && highlightedLyricIndex >= 0
                && Math.abs(lyricsScrollY - desiredAutoY) > 90f * density
                && (isScrollingLyrics || Math.abs(lyricsFlingVel) > 12f
                        || SystemClock.uptimeMillis() - lastUserLyricsScrollMs < 2800L);
        float targetSyncPill = showSyncPill ? 1f : 0f;
        res = stepSpring(syncPillReveal, syncPillVel, targetSyncPill, 340f, 0.82f, dt);
        syncPillReveal = Math.max(0f, Math.min(1f, res[0]));
        syncPillVel = res[1];
        if (!isSettled(syncPillReveal, syncPillVel, targetSyncPill)) {
            settled = false;
        } else {
            syncPillReveal = targetSyncPill;
            syncPillVel = 0f;
        }

        // 7. Toggle state highlights (Shuffle, Repeat, Favorite, Broadcast)
        float[] targets = {
                isShuffleOn ? 1f : 0f,
                !"OFF".equals(repeatMode) ? 1f : 0f,
                isFavorite ? 1f : 0f,
                isBroadcastConnected ? 1f : 0f
        };
        float[] curVals = {shuffleFrac, repeatFrac, favoriteFrac, broadcastFrac};
        float[] curVels = {shuffleVel, repeatVel, favoriteVel, broadcastVel};
        for (int i = 0; i < 4; i++) {
            res = stepSpring(curVals[i], curVels[i], targets[i], 420f, 0.78f, dt);
            curVals[i] = Math.max(0f, Math.min(1f, res[0]));
            curVels[i] = res[1];
            if (!isSettled(curVals[i], curVels[i], targets[i])) {
                settled = false;
            } else {
                curVals[i] = targets[i];
                curVels[i] = 0f;
            }
        }
        shuffleFrac = curVals[0]; shuffleVel = curVels[0];
        repeatFrac = curVals[1]; repeatVel = curVels[1];
        favoriteFrac = curVals[2]; favoriteVel = curVels[2];
        broadcastFrac = curVals[3]; broadcastVel = curVels[3];

        // 8. Heart pop overshoot spring
        res = stepSpring(heartPopImpulse, heartPopVel, 1f, 380f, 0.56f, dt);
        heartPopImpulse = Math.max(0.8f, Math.min(1.42f, res[0]));
        heartPopVel = res[1];
        if (!isSettled(heartPopImpulse, heartPopVel, 1f)) {
            settled = false;
        } else {
            heartPopImpulse = 1f;
            heartPopVel = 0f;
        }

        // 9. Per-button press springs
        for (int i = 1; i < buttonPress.length; i++) {
            float targetP = (activeHitTarget == i && !isSwipingCover && !isScrollingLyrics) ? 1f : 0f;
            if (Math.abs(buttonPress[i] - targetP) > 0.002f || Math.abs(buttonPressVel[i]) > 0.01f) {
                res = stepSpring(buttonPress[i], buttonPressVel[i], targetP, 580f, 0.72f, dt);
                buttonPress[i] = Math.max(-0.08f, Math.min(1.12f, res[0]));
                buttonPressVel[i] = res[1];
                settled = false;
            } else {
                buttonPress[i] = targetP;
                buttonPressVel[i] = 0f;
            }
        }

        // 10. Cover horizontal swipe spring snap-back
        if (!isSwipingCover && (Math.abs(coverDragX) > 0.4f || Math.abs(coverDragVel) > 1f)) {
            res = stepSpring(coverDragX, coverDragVel, 0f, 360f, 0.74f, dt);
            coverDragX = res[0];
            coverDragVel = res[1];
            settled = false;
        } else if (!isSwipingCover) {
            coverDragX = 0f;
            coverDragVel = 0f;
        }

        // 11. Cover, blur & palette crossfades
        if (coverFadeAlpha < 1f) {
            coverFadeAlpha = Math.min(1f, coverFadeAlpha + dt / 0.24f);
            if (coverFadeAlpha >= 1f) {
                prevCoverBitmap = null;
            }
            settled = false;
        }
        if (blurFadeAlpha < 1f) {
            blurFadeAlpha = Math.min(1f, blurFadeAlpha + dt / 0.38f);
            if (blurFadeAlpha >= 1f) {
                prevBlurredBitmap = null;
            }
            settled = false;
        }
        if (paletteMorph < 1f) {
            paletteMorph = Math.min(1f, paletteMorph + dt / 0.36f);
            interpolatePalette(startPalette, targetPalette, easeOutCubic(paletteMorph), activePalette);
            settled = false;
        }

        // 12. Buffering ring orbit
        if (buffering) {
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

    private static float easeOutCubic(float t) {
        float inv = 1f - Math.max(0f, Math.min(1f, t));
        return 1f - inv * inv * inv;
    }

    private static float easeInOutCubic(float t) {
        float c = Math.max(0f, Math.min(1f, t));
        return c < 0.5f
                ? 4f * c * c * c
                : 1f - (float) Math.pow(-2f * c + 2f, 3) * 0.5f;
    }

    private static float smoothstep(float edge0, float edge1, float x) {
        if (edge1 <= edge0) return x >= edge1 ? 1f : 0f;
        float t = Math.max(0f, Math.min(1f, (x - edge0) / (edge1 - edge0)));
        return t * t * (3f - 2f * t);
    }

    private static void lerpRect(RectF a, RectF b, float t, RectF out) {
        out.set(
                a.left + (b.left - a.left) * t,
                a.top + (b.top - a.top) * t,
                a.right + (b.right - a.right) * t,
                a.bottom + (b.bottom - a.bottom) * t
        );
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
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        removeCallbacks(frameTick);
        isAnimating = false;
        if (!isPreviewInstance) {
            MaterialYouColorEngine.applySystemBarAppearance(
                    findHostWindow(), MaterialYouColorEngine.isLightMode(getContext()));
        }
    }

    // ---- Layout Computation ----

    private void computeLayout(int w, int h) {
        float sidePad = 20f * density;
        float topY = statusBarInsetPx + 10f * density;
        float botY = h - navBarInsetPx - 14f * density;
        float usableH = Math.max(420f * density, botY - topY);
        float compact = Math.max(0.70f, Math.min(1f, usableH / (690f * density)));

        // 1. Top Header Bar (44dp height)
        float headerH = 42f * density;
        collapseRect.set(sidePad, topY, sidePad + headerH, topY + headerH);

        float splitBtnW = 46f * density;
        float splitGap = 3f * density;
        float queueRight = w - sidePad;
        queueRect.set(queueRight - splitBtnW, topY, queueRight, topY + headerH);
        castRect.set(queueRect.left - splitGap - splitBtnW, topY, queueRect.left - splitGap, topY + headerH);

        // 2. Bottom 3-Segment Floating Capsule (62dp)
        float capsuleH = 62f * density;
        bottomCapsuleRect.set(sidePad, botY - capsuleH, w - sidePad, botY);
        float capPad = 4.5f * density;
        float segGap = 3.5f * density;
        float innerCapW = bottomCapsuleRect.width() - capPad * 2f;
        float segW = (innerCapW - segGap * 2f) / 3f;
        float segTop = bottomCapsuleRect.top + capPad;
        float segBot = bottomCapsuleRect.bottom - capPad;
        shuffleRect.set(bottomCapsuleRect.left + capPad, segTop, bottomCapsuleRect.left + capPad + segW, segBot);
        repeatRect.set(shuffleRect.right + segGap, segTop, shuffleRect.right + segGap + segW, segBot);
        favoriteRect.set(repeatRect.right + segGap, segTop, bottomCapsuleRect.right - capPad, segBot);

        // 3. Primary Transport Controls Row (68dp height)
        float transportGapBot = 24f * density * compact;
        float transportH = 68f * density;
        float transportBot = bottomCapsuleRect.top - transportGapBot;
        float transportTop = transportBot - transportH;
        float playW = 98f * density;
        float sideW = 82f * density;
        float transGap = 12f * density;
        float cx = w * 0.5f;

        playBtnRect.set(cx - playW * 0.5f, transportTop, cx + playW * 0.5f, transportBot);
        prevBtnRect.set(playBtnRect.left - transGap - sideW, transportTop, playBtnRect.left - transGap, transportBot);
        nextBtnRect.set(playBtnRect.right + transGap, transportTop, playBtnRect.right + transGap + sideW, transportBot);

        // 4. Seekbar + Time/Quality Metadata Row
        float seekToTransGap = 20f * density * compact;
        float metaH = 26f * density;
        float metaBot = transportTop - seekToTransGap;
        float metaTop = metaBot - metaH;
        npMetaRect.set(sidePad, metaTop, w - sidePad, metaBot);

        float seekTouchH = 30f * density;
        float seekBot = metaTop - 2f * density;
        seekBarTouchRect.set(sidePad, seekBot - seekTouchH, w - sidePad, seekBot);

        // Centered quality pill badge
        float badgeW = Math.max(92f * density, badgePaint.measureText(badgeText.toUpperCase(Locale.US)) + 26f * density);
        badgeRect.set(cx - badgeW * 0.5f, metaTop + 1f * density, cx + badgeW * 0.5f, metaBot - 1f * density);

        // 5. Track Info + [Lyrics | More] Connected Split Pills
        float infoToSeekGap = 14f * density * compact;
        float infoH = 60f * density;
        float infoBot = seekBarTouchRect.top - infoToSeekGap;
        float infoTop = infoBot - infoH;
        float infoCenterY = (infoTop + infoBot) * 0.5f;
        float midSplitH = 42f * density;

        moreBtnRect.set(w - sidePad - splitBtnW, infoCenterY - midSplitH * 0.5f,
                w - sidePad, infoCenterY + midSplitH * 0.5f);
        if (showLyricsButton) {
            lyricsBtnRect.set(moreBtnRect.left - splitGap - splitBtnW, moreBtnRect.top,
                    moreBtnRect.left - splitGap, moreBtnRect.bottom);
            titleAreaRect.set(sidePad, infoTop, lyricsBtnRect.left - 12f * density, infoBot);
        } else {
            lyricsBtnRect.set(0f, 0f, 0f, 0f);
            titleAreaRect.set(sidePad, infoTop, moreBtnRect.left - 12f * density, infoBot);
        }

        // 6. Hero Cover Squircle (centered in remaining middle viewport)
        float headerToCoverGap = 18f * density * compact;
        float coverToInfoGap = 18f * density * compact;
        float availCoverTop = collapseRect.bottom + headerToCoverGap;
        float availCoverBot = infoTop - coverToInfoGap;
        float availCoverH = Math.max(150f * density, availCoverBot - availCoverTop);
        float maxCoverW = w - sidePad * 2f;
        float coverSize = Math.min(maxCoverW, availCoverH);
        float coverTop = availCoverTop + (availCoverH - coverSize) * 0.5f;
        coverRect.set(cx - coverSize * 0.5f, coverTop, cx + coverSize * 0.5f, coverTop + coverSize);

        // 7. Full-Screen Lyrics Target Layout & Morph Interpolation
        float miniSize = 46f * density;
        lyricsMiniCoverRect.set(sidePad, topY + 1f * density, sidePad + miniSize, topY + 1f * density + miniSize);
        float closeSize = 42f * density;
        lyricsCloseRect.set(w - sidePad - closeSize, topY + 3f * density, w - sidePad, topY + 3f * density + closeSize);
        lyricsHeaderTitleRect.set(lyricsMiniCoverRect.right + 12f * density, topY,
                lyricsCloseRect.left - 12f * density, topY + 48f * density);

        float lTransH = 58f * density;
        float lTransBot = botY;
        float lTransTop = lTransBot - lTransH;
        float lPlayW = 86f * density;
        float lSideW = 72f * density;
        float lTransGap = 12f * density;
        lyricsPlayRect.set(cx - lPlayW * 0.5f, lTransTop, cx + lPlayW * 0.5f, lTransBot);
        lyricsPrevRect.set(lyricsPlayRect.left - lTransGap - lSideW, lTransTop, lyricsPlayRect.left - lTransGap, lTransBot);
        lyricsNextRect.set(lyricsPlayRect.right + lTransGap, lTransTop, lyricsPlayRect.right + lTransGap + lSideW, lTransBot);

        float lMetaH = 18f * density;
        float lMetaBot = lTransTop - 10f * density;
        float lMetaTop = lMetaBot - lMetaH;
        lyricsMetaRect.set(sidePad, lMetaTop, w - sidePad, lMetaBot);

        float lSeekH = 28f * density;
        float lSeekBot = lMetaTop - 2f * density;
        lyricsSeekRect.set(sidePad, lSeekBot - lSeekH, w - sidePad, lSeekBot);

        float vpTop = lyricsMiniCoverRect.bottom + 10f * density;
        float vpBot = lyricsSeekRect.top - 8f * density;
        lyricsViewportRect.set(0f, vpTop, w, Math.max(vpTop + 120f * density, vpBot));

        float pillW = Math.max(94f * density, syncPillPaint.measureText("Sync") + 38f * density);
        float pillH = 36f * density;
        lyricsSyncPillRect.set(
                w - sidePad - pillW,
                lyricsViewportRect.bottom - 12f * density - pillH,
                w - sidePad,
                lyricsViewportRect.bottom - 12f * density
        );

        float lr = easeInOutCubic(lyricsReveal);
        lerpRect(coverRect, lyricsMiniCoverRect, lr, activeCoverRect);
        lerpRect(seekBarTouchRect, lyricsSeekRect, lr, activeSeekBarRect);
        lerpRect(npMetaRect, lyricsMetaRect, lr, activeMetaRect);
        lerpRect(prevBtnRect, lyricsPrevRect, lr, activePrevRect);
        lerpRect(playBtnRect, lyricsPlayRect, lr, activePlayRect);
        lerpRect(nextBtnRect, lyricsNextRect, lr, activeNextRect);
    }

    // ---- Drawing ----

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int w = getWidth();
        int h = getHeight();
        if (w <= 0 || h <= 0) {
            return;
        }

        computeLayout(w, h);

        // 1. Strongly Blurred Cover Background + Harmonized Tonal Wash
        drawBlurredBackground(canvas, w, h);

        float npChromeAlpha = 1f - smoothstep(0f, 0.55f, lyricsReveal);
        float lyrChromeAlpha = smoothstep(0.30f, 0.95f, lyricsReveal);

        // 2. Now Playing Chrome (fades/slides cleanly out during lyrics morph)
        if (npChromeAlpha > 0.01f) {
            int npSave = npChromeAlpha < 0.99f
                    ? canvas.saveLayerAlpha(0f, 0f, w, h, Math.round(255f * npChromeAlpha))
                    : -1;
            canvas.save();
            canvas.translate(0f, -lyricsReveal * 16f * density);
            drawTopHeader(canvas);
            canvas.restore();

            canvas.save();
            canvas.translate(0f, lyricsReveal * 14f * density);
            drawTrackInfoAndActions(canvas);
            canvas.restore();

            canvas.save();
            canvas.translate(0f, lyricsReveal * 28f * density);
            drawBottomCapsule(canvas);
            canvas.restore();

            if (npSave >= 0) {
                canvas.restoreToCount(npSave);
            }
        }

        // 3. Full-Screen Lyrics Viewport (behind morphed mini cover for crisp layering)
        if (lyricsReveal > 0.02f) {
            drawFullScreenLyrics(canvas, lyricsReveal);
        }

        // 4. Shared-Element Cover Art Morph (Hero Squircle <-> Top-Left Compact Thumbnail)
        drawMorphingCover(canvas);

        // 5. Lyrics Top Header Bar (Title, Explicit Badge, Artist & Close Pill)
        if (lyrChromeAlpha > 0.01f) {
            drawLyricsTopHeader(canvas, lyrChromeAlpha, (1f - lyrChromeAlpha) * 10f * density);
        }

        // 6. Morphed Seekbar + Time & Quality Pill Badge
        drawSeekbarAndMeta(canvas, npChromeAlpha);

        // 7. Morphed Primary Transport Row (Previous, Play/Pause Squircle, Next)
        drawTransportControls(canvas);

        if (!isPreviewInstance && (currentCoverBitmap != null || coverId == null || coverId.isEmpty())) {
            dev.materialtidal.extension.tidal.navbar.ExpressiveScaffoldBridge.onRealFullPlayerDrawn();
        }
    }

    /**
     * Renders the 1:1 finger-tracked Material 3 Expressive transition from the floating
     * Mini-Player stadium pill ({@code expandProgress == 0f}) to the Full-Screen Player sheet
     * ({@code expandProgress == 1f}).
     */
    public void drawInteractiveExpansion(
            Canvas canvas,
            int w,
            int h,
            float expandProgress,
            RectF startCardRect,
            RectF startArtRect,
            float startArtRadius,
            ExpressiveMiniPlayerView miniPlayer
    ) {
        if (w <= 0 || h <= 0) {
            return;
        }
        computeLayout(w, h);

        float p = Math.max(0f, Math.min(1f, expandProgress));
        if ("PLAYING".equals(playState) && MaterialYouConfig.isPlayerSquigglySeekbarEnabled()) {
            wavePhaseRad = (wavePhaseRad + 0.085f) % ((float) (Math.PI * 2.0));
        }
        if ("BUFFERING".equals(playState)) {
            bufferingAngleDeg = (bufferingAngleDeg + 5.8f) % 360f;
        }

        // 1. Backdrop scrim darkening behind the ascending sheet (matches ModalBottomSheet scrim)
        float scrimAlpha = 0.64f * easeOutCubic(p);
        if (scrimAlpha > 0.004f) {
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(Color.argb(Math.round(255f * scrimAlpha), 0, 0, 0));
            canvas.drawRect(0f, 0f, w, h, fillPaint);
        }

        // 2. Sheet container bounds: top edge tracks the finger 1:1 from startCardRect.top -> 0
        float sheetTop = startCardRect.top * (1f - p);
        float containerMorph = easeOutCubic(Math.min(1f, p / 0.28f));
        float sheetLeft = startCardRect.left * (1f - containerMorph);
        float sheetRight = startCardRect.right + (w - startCardRect.right) * containerMorph;
        float sheetBottom = startCardRect.bottom + (h - startCardRect.bottom) * containerMorph;

        float sheetCornerDp = dev.materialtidal.extension.tidal.sheets.ExpressiveSheetsBridge.getSheetCornerRadiusDp();
        float topRadius = (32f * density) * (1f - containerMorph) + (sheetCornerDp * density) * containerMorph;
        float botRadius = (32f * density) * (1f - containerMorph);

        tempRect.set(sheetLeft, sheetTop, sheetRight, sheetBottom);
        drawSoftRectShadow(canvas, tempRect, topRadius, activePalette.shadowBase);

        // 3. Clipped ascending sheet surface
        cornerRadii[0] = topRadius;
        cornerRadii[1] = topRadius;
        cornerRadii[2] = topRadius;
        cornerRadii[3] = topRadius;
        cornerRadii[4] = botRadius;
        cornerRadii[5] = botRadius;
        cornerRadii[6] = botRadius;
        cornerRadii[7] = botRadius;
        clipPath.reset();
        clipPath.addRoundRect(tempRect, cornerRadii, Path.Direction.CW);

        canvas.save();
        canvas.clipPath(clipPath);

        // 3a. Base Mini-Player frosted dock surface during initial lift
        float miniSurfaceAlpha = 1f - smoothstep(0.08f, 0.36f, p);
        if (miniSurfaceAlpha > 0.01f && miniPlayer != null) {
            tempRect.set(sheetLeft, sheetTop, sheetRight, sheetBottom);
            miniPlayer.drawSheetBaseGlass(canvas, tempRect, topRadius);
        }

        // 3b. Heavily blurred cover backdrop crossfading in and gliding upward with the sheet
        float bgAlpha = smoothstep(0.02f, 0.32f, p);
        if (bgAlpha > 0.01f) {
            int bgSave = bgAlpha < 0.99f
                    ? canvas.saveLayerAlpha(sheetLeft, sheetTop, sheetRight, sheetBottom, Math.round(255f * bgAlpha))
                    : -1;
            canvas.save();
            canvas.translate(0f, sheetTop * 0.38f);
            drawBlurredBackground(canvas, w, h);
            canvas.restore();
            if (bgSave >= 0) {
                canvas.restoreToCount(bgSave);
            }
        }

        // 3c. Compact Mini-Player row (Title/Explicit/Artist + Play/Next buttons) fading out at top of sheet
        float miniRowAlpha = 1f - smoothstep(0.01f, 0.21f, p);
        if (miniRowAlpha > 0.01f && miniPlayer != null) {
            miniPlayer.drawCompactSheetHeaderContent(canvas, sheetLeft, sheetTop, sheetRight, miniRowAlpha);
        }

        // 3d. Full-Screen Player Chrome (staggered Material 3 Expressive cascade)
        float headerAlpha = smoothstep(0.24f, 0.76f, p);
        if (headerAlpha > 0.01f) {
            float hEase = easeOutCubic(headerAlpha);
            float hShiftY = sheetTop * 0.46f + (1f - hEase) * 14f * density;
            int s = headerAlpha < 0.99f
                    ? canvas.saveLayerAlpha(0f, 0f, w, h, Math.round(255f * headerAlpha))
                    : -1;
            canvas.save();
            canvas.translate(0f, hShiftY);
            drawTopHeader(canvas);
            canvas.restore();
            if (s >= 0) canvas.restoreToCount(s);
        }

        float infoAlpha = smoothstep(0.14f, 0.62f, p);
        if (infoAlpha > 0.01f) {
            float iEase = easeOutCubic(infoAlpha);
            float iShiftY = sheetTop * 0.60f + (1f - iEase) * 18f * density;
            int s = infoAlpha < 0.99f
                    ? canvas.saveLayerAlpha(0f, 0f, w, h, Math.round(255f * infoAlpha))
                    : -1;
            canvas.save();
            canvas.translate(0f, iShiftY);
            drawTrackInfoAndActions(canvas);
            canvas.restore();
            if (s >= 0) canvas.restoreToCount(s);
        }

        float seekAlpha = smoothstep(0.20f, 0.70f, p);
        if (seekAlpha > 0.01f) {
            float sEase = easeOutCubic(seekAlpha);
            float sShiftY = sheetTop * 0.68f + (1f - sEase) * 22f * density;
            int s = seekAlpha < 0.99f
                    ? canvas.saveLayerAlpha(0f, 0f, w, h, Math.round(255f * seekAlpha))
                    : -1;
            canvas.save();
            canvas.translate(0f, sShiftY);
            drawSeekbarAndMeta(canvas, seekAlpha);
            canvas.restore();
            if (s >= 0) canvas.restoreToCount(s);
        }

        float transAlpha = smoothstep(0.16f, 0.66f, p);
        if (transAlpha > 0.01f) {
            float tEase = easeOutCubic(transAlpha);
            float tShiftY = sheetTop * 0.76f + (1f - tEase) * 26f * density;
            float tScale = 0.91f + 0.09f * tEase;
            int s = transAlpha < 0.99f
                    ? canvas.saveLayerAlpha(0f, 0f, w, h, Math.round(255f * transAlpha))
                    : -1;
            canvas.save();
            canvas.translate(0f, tShiftY);
            canvas.scale(tScale, tScale, w * 0.5f, activePlayRect.centerY());
            drawTransportControls(canvas);
            canvas.restore();
            if (s >= 0) canvas.restoreToCount(s);
        }

        float capAlpha = smoothstep(0.28f, 0.84f, p);
        if (capAlpha > 0.01f) {
            float cEase = easeOutCubic(capAlpha);
            float cShiftY = sheetTop * 0.85f + (1f - cEase) * 30f * density;
            int s = capAlpha < 0.99f
                    ? canvas.saveLayerAlpha(0f, 0f, w, h, Math.round(255f * capAlpha))
                    : -1;
            canvas.save();
            canvas.translate(0f, cShiftY);
            drawBottomCapsule(canvas);
            canvas.restore();
            if (s >= 0) canvas.restoreToCount(s);
        }

        // 3e. Shared-Element Hero Album Cover Morph (48dp Mini-Player Thumbnail -> Large Centered Hero Squircle)
        float artT = easeInOutCubic(Math.min(1f, p / 0.82f));
        float deltaTop = sheetTop - startCardRect.top;
        float startL = startArtRect.left;
        float startT = startArtRect.top + deltaTop;
        float startR = startArtRect.right;
        float startB = startArtRect.bottom + deltaTop;

        float endCx = coverRect.centerX();
        float endCy = coverRect.centerY() + sheetTop * 0.52f;
        float endHalfW = coverRect.width() * 0.5f * coverScale;
        float endHalfH = coverRect.height() * 0.5f * coverScale;
        float endL = endCx - endHalfW;
        float endT = endCy - endHalfH;
        float endR = endCx + endHalfW;
        float endB = endCy + endHalfH;

        tempRect.set(
                startL + (endL - startL) * artT,
                startT + (endT - startT) * artT,
                startR + (endR - startR) * artT,
                startB + (endB - startB) * artT
        );

        float clampedCornerMorph = Math.max(0f, Math.min(1f, coverCornerMorph));
        float endArtRadius = (34f * (1f - clampedCornerMorph) + 24f * clampedCornerMorph) * density;
        float curArtRadius = startArtRadius * (1f - artT) + endArtRadius * artT;

        int baseShadowAlpha = (activePalette.shadowBase >>> 24) & 0xFF;
        int morphedShadow = MaterialYouColorEngine.withAlpha(
                activePalette.shadowBase, Math.round(baseShadowAlpha * artT));
        if (artT > 0.04f) {
            drawSoftRectShadow(canvas, tempRect, curArtRadius, morphedShadow);
        }

        auxPath.reset();
        auxPath.addRoundRect(tempRect, curArtRadius, curArtRadius, Path.Direction.CW);
        canvas.save();
        canvas.clipPath(auxPath);

        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(activePalette.capsuleSegmentBg);
        canvas.drawRect(tempRect, fillPaint);

        Bitmap coverBmp = currentCoverBitmap;
        if ((coverBmp == null || coverBmp.isRecycled()) && miniPlayer != null) {
            coverBmp = miniPlayer.getCurrentArtworkBitmap();
        }
        if (coverBmp != null && !coverBmp.isRecycled()) {
            bitmapPaint.setAlpha(255);
            canvas.drawBitmap(coverBmp, null, tempRect, bitmapPaint);
        }
        canvas.restore();

        // 3f. Expressive Top Pill Drag Handle & 1dp Sheet Shoulder Rim
        float handleAlpha = smoothstep(0.02f, 0.14f, p) * (1f - smoothstep(0.88f, 0.99f, p));
        if (handleAlpha > 0.01f) {
            float handleW = (26f + 14f * containerMorph) * density;
            float handleH = (3.0f + 1.4f * containerMorph) * density;
            float handleCx = (sheetLeft + sheetRight) * 0.5f;
            float handleTop = sheetTop + (4.5f + 5.5f * containerMorph) * density;
            tempRect.set(handleCx - handleW * 0.5f, handleTop,
                    handleCx + handleW * 0.5f, handleTop + handleH);
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(
                    activePalette.primaryDeep, Math.round(0x88 * handleAlpha)));
            canvas.drawRoundRect(tempRect, handleH * 0.5f, handleH * 0.5f, fillPaint);
        }

        if (containerMorph > 0.05f) {
            tempRect.set(sheetLeft + 0.5f * density, sheetTop + 0.5f * density,
                    sheetRight - 0.5f * density, sheetBottom - 0.5f * density);
            strokePaint.setStrokeWidth(1f * density);
            int borderCol = MaterialYouColorEngine.getMiniPlayerBorderColor();
            int bAlpha = Math.round(Color.alpha(borderCol) * containerMorph);
            strokePaint.setColor(MaterialYouColorEngine.withAlpha(borderCol, bAlpha));
            canvas.drawPath(clipPath, strokePaint);
        }

        canvas.restore();
    }

    private void drawBlurredBackground(Canvas canvas, int w, int h) {
        // Fallback tonal base fill
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(activePalette.blurWashColor | 0xFF000000);
        canvas.drawRect(0f, 0f, w, h, fillPaint);

        int style = MaterialYouConfig.getPlayerColorStyle();
        float breathScale = 1.07f + 0.025f * (float) Math.sin(bgBreathPhase);

        // Lift brightness/softness slightly in Screenshot Pastel mode while keeping heavy cover blur vivid
        if (style == MaterialYouConfig.PLAYER_STYLE_COVER_PASTEL) {
            blurColorMatrix.set(new float[]{
                    0.82f, 0f, 0f, 0f, 38f,
                    0f, 0.82f, 0f, 0f, 38f,
                    0f, 0f, 0.82f, 0f, 38f,
                    0f, 0f, 0f, 1f, 0f
            });
            blurBitmapPaint.setColorFilter(new ColorMatrixColorFilter(blurColorMatrix));
        } else {
            blurBitmapPaint.setColorFilter(null);
        }

        if (prevBlurredBitmap != null && !prevBlurredBitmap.isRecycled()) {
            blurBitmapPaint.setAlpha(255);
            drawCenterCropBitmap(canvas, prevBlurredBitmap, w, h, breathScale, blurBitmapPaint);
        }

        if (currentBlurredBitmap != null && !currentBlurredBitmap.isRecycled()) {
            blurBitmapPaint.setAlpha(Math.round(255f * Math.max(0f, Math.min(1f, blurFadeAlpha))));
            drawCenterCropBitmap(canvas, currentBlurredBitmap, w, h, breathScale, blurBitmapPaint);
        }

        // Soft tonal veil harmonizing foreground contrast over the heavily blurred cover
        fillPaint.setColor(activePalette.blurWashColor);
        canvas.drawRect(0f, 0f, w, h, fillPaint);

        // Gently enrich wash when full-screen lyrics are open for crisp typography legibility
        if (lyricsReveal > 0.01f) {
            int extraWashAlpha = Math.round(0x34 * Math.min(1f, lyricsReveal));
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(activePalette.blurWashColor, extraWashAlpha));
            canvas.drawRect(0f, 0f, w, h, fillPaint);
        }

        // Subtle vertical depth gradient for clean legibility near top/bottom system bars
        if (vignetteShader == null || lastVignetteW != w || lastVignetteH != h
                || lastVignetteColor != activePalette.blurWashColor) {
            lastVignetteW = w;
            lastVignetteH = h;
            lastVignetteColor = activePalette.blurWashColor;
            int edgeTint = MaterialYouColorEngine.withAlpha(activePalette.blurWashColor,
                    style == MaterialYouConfig.PLAYER_STYLE_RAW_COVER_BLUR ? 0x35 : 0x48);
            int midTint = MaterialYouColorEngine.withAlpha(activePalette.blurWashColor, 0x00);
            vignetteShader = new LinearGradient(
                    0f, 0f, 0f, h,
                    new int[]{edgeTint, midTint, midTint, edgeTint},
                    new float[]{0f, 0.22f, 0.72f, 1f},
                    Shader.TileMode.CLAMP
            );
        }
        fillPaint.setShader(vignetteShader);
        canvas.drawRect(0f, 0f, w, h, fillPaint);
        fillPaint.setShader(null);
    }

    private void drawCenterCropBitmap(
            Canvas canvas,
            Bitmap bmp,
            int viewW,
            int viewH,
            float extraScale,
            Paint paint
    ) {
        int bw = bmp.getWidth();
        int bh = bmp.getHeight();
        if (bw <= 0 || bh <= 0) return;

        float scale = Math.max((float) viewW / bw, (float) viewH / bh) * extraScale;
        float drawW = bw * scale;
        float drawH = bh * scale;
        float left = (viewW - drawW) * 0.5f;
        float top = (viewH - drawH) * 0.5f;
        srcBitmapRect.set(0, 0, bw, bh);
        bgDrawRect.set(left, top, left + drawW, top + drawH);
        canvas.drawBitmap(bmp, srcBitmapRect, bgDrawRect, paint);
    }

    private void drawTopHeader(Canvas canvas) {
        // Left circular collapse button
        float collapseScale = 1f - 0.10f * buttonPress[HIT_COLLAPSE];
        canvas.save();
        canvas.scale(collapseScale, collapseScale, collapseRect.centerX(), collapseRect.centerY());
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(activePalette.glassPillBg);
        canvas.drawOval(collapseRect, fillPaint);
        drawChevronDownIcon(canvas, collapseRect.centerX(), collapseRect.centerY(),
                6.5f * density, activePalette.primaryDeep);
        canvas.restore();

        // "Now Playing" title
        headerPaint.setColor(activePalette.primaryDeep);
        Paint.FontMetrics fm = headerPaint.getFontMetrics();
        float titleBaseline = collapseRect.centerY() - (fm.ascent + fm.descent) * 0.5f;
        float titleX = collapseRect.right + 14f * density;
        float maxTitleW = Math.max(40f * density, castRect.left - titleX - 10f * density);
        String headerTitle = TextUtils.ellipsize("Now Playing", headerPaint, maxTitleW, TextUtils.TruncateAt.END).toString();
        canvas.drawText(headerTitle, titleX, titleBaseline, headerPaint);

        // Connected M3 Expressive Split Buttons: [Cast/Device | Queue]
        float outerR = 21f * density;
        float innerR = 7f * density;

        // Cast / Output button
        float castScale = 1f - 0.09f * buttonPress[HIT_CAST];
        int castBg = MaterialYouColorEngine.blendRgb(
                activePalette.glassPillBg, activePalette.glassPillActiveBg, broadcastFrac);
        int castIconColor = MaterialYouColorEngine.blendRgb(
                activePalette.primaryDeep, activePalette.glassPillActiveIcon, broadcastFrac);
        canvas.save();
        canvas.scale(castScale, castScale, castRect.centerX(), castRect.centerY());
        drawAsymmetricRoundRect(canvas, castRect, outerR, innerR, innerR, outerR, castBg);
        drawDeviceCastIcon(canvas, castRect.centerX(), castRect.centerY(), 9.5f * density, castIconColor);
        canvas.restore();

        // Queue button
        float queueScale = 1f - 0.09f * buttonPress[HIT_QUEUE];
        canvas.save();
        canvas.scale(queueScale, queueScale, queueRect.centerX(), queueRect.centerY());
        drawAsymmetricRoundRect(canvas, queueRect, innerR, outerR, outerR, innerR, activePalette.glassPillBg);
        drawQueueMusicIcon(canvas, queueRect.centerX(), queueRect.centerY(), 9.5f * density, activePalette.primaryDeep);
        canvas.restore();
    }

    private void drawMorphingCover(Canvas canvas) {
        float lr = easeInOutCubic(lyricsReveal);
        float clampedMorph = Math.max(0f, Math.min(1f, coverCornerMorph));
        float npRadius = (34f * (1f - clampedMorph) + 24f * clampedMorph) * density;
        float radius = npRadius * (1f - lr) + (12f * density) * lr;
        float press = Math.max(buttonPress[HIT_COVER], buttonPress[HIT_LYRICS_MINI_COVER]);
        float pressDip = 1f - 0.028f * press;
        float morphedBaseScale = coverScale * (1f - lr) + 1f * lr;
        float totalScale = morphedBaseScale * pressDip;
        float dragX = coverDragX * (1f - lr);
        float tiltDeg = dragX * 0.022f;

        canvas.save();
        canvas.translate(dragX, 0f);
        canvas.rotate(tiltDeg, activeCoverRect.centerX(), activeCoverRect.centerY());
        canvas.scale(totalScale, totalScale, activeCoverRect.centerX(), activeCoverRect.centerY());

        // Soft multi-layer elevation shadow (scales down cleanly into compact header thumbnail)
        int baseShadowAlpha = (activePalette.shadowBase >>> 24) & 0xFF;
        int morphedShadow = MaterialYouColorEngine.withAlpha(
                activePalette.shadowBase, Math.round(baseShadowAlpha * (1f - lr * 0.65f)));
        drawSoftRectShadow(canvas, activeCoverRect, radius, morphedShadow);

        // Artwork surface
        clipPath.reset();
        clipPath.addRoundRect(activeCoverRect, radius, radius, Path.Direction.CW);
        canvas.save();
        canvas.clipPath(clipPath);

        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(activePalette.capsuleSegmentBg);
        canvas.drawRect(activeCoverRect, fillPaint);

        if (prevCoverBitmap != null && !prevCoverBitmap.isRecycled()) {
            bitmapPaint.setAlpha(255);
            canvas.drawBitmap(prevCoverBitmap, null, activeCoverRect, bitmapPaint);
        }
        if (currentCoverBitmap != null && !currentCoverBitmap.isRecycled()) {
            bitmapPaint.setAlpha(Math.round(255f * Math.max(0f, Math.min(1f, coverFadeAlpha))));
            canvas.drawBitmap(currentCoverBitmap, null, activeCoverRect, bitmapPaint);
        }

        canvas.restore();
        canvas.restore();
    }

    private void drawLyricsTopHeader(Canvas canvas, float alpha, float slideY) {
        int saveLayer = alpha < 0.99f
                ? canvas.saveLayerAlpha(0f, Math.max(0f, lyricsHeaderTitleRect.top - 12f * density),
                getWidth(), lyricsHeaderTitleRect.bottom + 18f * density, Math.round(255f * alpha))
                : -1;

        // Track title + Explicit badge + Artist next to compact thumbnail
        float left = lyricsHeaderTitleRect.left;
        float maxW = Math.max(40f * density, lyricsHeaderTitleRect.width());
        float titlePress = 1f - 0.025f * buttonPress[HIT_LYRICS_MINI_COVER];

        canvas.save();
        canvas.translate(0f, slideY);
        canvas.scale(titlePress, titlePress, left + maxW * 0.3f, lyricsHeaderTitleRect.centerY());

        float explicitW = isExplicit ? (18f * density) : 0f;
        lyricsHeaderTitlePaint.setColor(activePalette.primaryDeep);
        String ellipsizedTitle = TextUtils.ellipsize(
                title, lyricsHeaderTitlePaint, Math.max(24f * density, maxW - explicitW),
                TextUtils.TruncateAt.END).toString();
        float renderedTitleW = lyricsHeaderTitlePaint.measureText(ellipsizedTitle);

        lyricsHeaderArtistPaint.setColor(activePalette.secondaryText);
        String ellipsizedArtist = TextUtils.ellipsize(
                artist, lyricsHeaderArtistPaint, maxW, TextUtils.TruncateAt.END).toString();

        float titleBaseline = lyricsHeaderTitleRect.centerY() - 2.5f * density;
        float artistBaseline = lyricsHeaderTitleRect.centerY() + 15.5f * density;
        canvas.drawText(ellipsizedTitle, left, titleBaseline, lyricsHeaderTitlePaint);

        if (isExplicit && !ellipsizedTitle.isEmpty()) {
            float badgeSize = 13f * density;
            float badgeLeft = left + renderedTitleW + 5f * density;
            float badgeTop = titleBaseline - badgeSize * 0.85f;
            tempRect.set(badgeLeft, badgeTop, badgeLeft + badgeSize, badgeTop + badgeSize);
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(activePalette.secondaryText, 0x36));
            canvas.drawRoundRect(tempRect, 3.5f * density, 3.5f * density, fillPaint);

            explicitPaint.setColor(activePalette.primaryDeep);
            Paint.FontMetrics efm = explicitPaint.getFontMetrics();
            float eBase = tempRect.centerY() - (efm.ascent + efm.descent) * 0.5f;
            canvas.drawText("E", tempRect.centerX(), eBase, explicitPaint);
        }

        canvas.drawText(ellipsizedArtist, left, artistBaseline, lyricsHeaderArtistPaint);
        canvas.restore();

        // Circular Close Lyrics button on right
        float closeScale = 1f - 0.10f * buttonPress[HIT_LYRICS_CLOSE];
        canvas.save();
        canvas.translate(0f, slideY);
        canvas.scale(closeScale, closeScale, lyricsCloseRect.centerX(), lyricsCloseRect.centerY());
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(activePalette.glassPillBg);
        canvas.drawOval(lyricsCloseRect, fillPaint);
        drawCloseXIcon(canvas, lyricsCloseRect.centerX(), lyricsCloseRect.centerY(),
                6.2f * density, activePalette.primaryDeep);
        canvas.restore();

        if (saveLayer >= 0) {
            canvas.restoreToCount(saveLayer);
        }
    }

    private void drawFullScreenLyrics(Canvas canvas, float reveal) {
        if (reveal < 0.02f || lyricsViewportRect.height() <= 10f) {
            return;
        }

        float padH = 24f * density;
        int contentW = Math.max(80, Math.round(lyricsViewportRect.width() - padH * 2f));

        if (isLyricsLoading) {
            drawLyricsSkeleton(canvas, reveal, padH, contentW);
            return;
        }

        if (lyricLines == null || lyricLines.length == 0) {
            lyricMsgPaint.setColor(MaterialYouColorEngine.withAlpha(
                    activePalette.lyricsInactiveText, Math.round(230f * reveal)));
            float slide = (1f - reveal) * 18f * density;
            canvas.drawText("No lyrics available",
                    lyricsViewportRect.centerX(),
                    lyricsViewportRect.centerY() + slide,
                    lyricMsgPaint);
            return;
        }

        ensureLyricsLayouts(contentW);

        // Edge-faded layer using DST_IN vertical gradient so lines melt into blurred backdrop
        int vpLayer = canvas.saveLayer(lyricsViewportRect, null);
        float entrySlideY = (1f - easeOutCubic(reveal)) * 28f * density;
        canvas.save();
        canvas.translate(padH, lyricsViewportRect.top + entrySlideY);

        float vpHeight = lyricsViewportRect.height();
        for (int i = 0; i < lyricLayouts.size(); i++) {
            float itemTop = lyricItemTops.get(i) - lyricsScrollY;
            float itemH = lyricItemHeights.get(i);
            if (itemTop + itemH < -40f * density || itemTop > vpHeight + 40f * density) {
                continue;
            }

            float focus = (lyricLineFocus != null && i < lyricLineFocus.length) ? lyricLineFocus[i] : 0f;
            float baseOpacity;
            if (!isLyricsSynced) {
                baseOpacity = 0.94f;
            } else {
                int dist = highlightedLyricIndex >= 0 ? (i - highlightedLyricIndex) : 99;
                if (dist == 0) {
                    baseOpacity = 1.0f;
                } else if (dist == 1) {
                    baseOpacity = 0.58f;
                } else if (dist == 2) {
                    baseOpacity = 0.44f;
                } else {
                    baseOpacity = 0.32f;
                }
                baseOpacity = Math.min(0.95f, baseOpacity + lyricsBrowseBoost * 0.28f);
            }
            float finalOpacity = baseOpacity * (1f - focus) + 1.0f * focus;
            int baseRgb = isLyricsSynced
                    ? MaterialYouColorEngine.blendRgb(activePalette.lyricsInactiveText, activePalette.lyricsActiveText, focus)
                    : activePalette.lyricsActiveText;
            int lineColor = MaterialYouColorEngine.withAlpha(baseRgb, Math.round(255f * finalOpacity * reveal));

            if (i == tappedLyricIndex && tappedLyricFlash > 0.01f) {
                tempRect.set(-10f * density, itemTop - 6f * density,
                        contentW + 10f * density, itemTop + itemH + 6f * density);
                fillPaint.setStyle(Paint.Style.FILL);
                fillPaint.setColor(MaterialYouColorEngine.withAlpha(
                        activePalette.lyricsActiveText, Math.round(0x28 * tappedLyricFlash * reveal)));
                canvas.drawRoundRect(tempRect, 14f * density, 14f * density, fillPaint);
            }

            String rawText = (lyricLines != null && i < lyricLines.length && lyricLines[i] != null)
                    ? lyricLines[i].trim()
                    : "";
            if (rawText.isEmpty() || "♪".equals(rawText) || "...".equals(rawText)) {
                drawInstrumentalDots(canvas, itemTop + itemH * 0.5f, focus, lineColor);
                continue;
            }

            StaticLayout sl = lyricLayouts.get(i);
            lyricPaint.setColor(lineColor);
            if (focus > 0.15f) {
                int glowColor = MaterialYouColorEngine.withAlpha(
                        activePalette.lyricsActiveText, Math.round(0x2E * focus * reveal));
                lyricPaint.setShadowLayer(8f * density * focus, 0f, 1.5f * density, glowColor);
            } else {
                lyricPaint.clearShadowLayer();
            }

            canvas.save();
            canvas.translate(0f, itemTop);
            float scale = 1f + 0.055f * focus;
            if (scale > 1.001f) {
                canvas.scale(scale, scale, 0f, itemH * 0.5f);
            }
            sl.draw(canvas);
            canvas.restore();
        }
        lyricPaint.clearShadowLayer();
        canvas.restore();

        // Apply top & bottom vertical fade-out mask
        if (lyricsEdgeMaskShader == null
                || Math.abs(lastLyricsMaskTop - lyricsViewportRect.top) > 0.5f
                || Math.abs(lastLyricsMaskHeight - lyricsViewportRect.height()) > 0.5f) {
            lastLyricsMaskTop = lyricsViewportRect.top;
            lastLyricsMaskHeight = lyricsViewportRect.height();
            lyricsEdgeMaskShader = new LinearGradient(
                    0f, lyricsViewportRect.top,
                    0f, lyricsViewportRect.bottom,
                    new int[]{0x00000000, 0xFF000000, 0xFF000000, 0x00000000},
                    new float[]{0f, 0.11f, 0.84f, 1f},
                    Shader.TileMode.CLAMP
            );
        }
        lyricsMaskPaint.setShader(lyricsEdgeMaskShader);
        canvas.drawRect(lyricsViewportRect, lyricsMaskPaint);
        canvas.restoreToCount(vpLayer);

        // Floating "Sync" pill when scrolled away from active synced line
        if (syncPillReveal > 0.02f) {
            drawLyricsSyncPill(canvas, syncPillReveal * reveal);
        }
    }

    private void drawLyricsSkeleton(Canvas canvas, float reveal, float padH, int contentW) {
        float[] widthFracs = {0.78f, 0.54f, 0.86f, 0.62f, 0.44f};
        float barH = 22f * density;
        float barR = 11f * density;
        float gap = 22f * density;
        float startY = lyricsViewportRect.top + lyricsViewportRect.height() * 0.20f + (1f - reveal) * 18f * density;

        fillPaint.setStyle(Paint.Style.FILL);
        for (int i = 0; i < widthFracs.length; i++) {
            float wave = 0.5f + 0.5f * (float) Math.sin(skeletonPulsePhase - i * 0.65f);
            int alpha = Math.round((46f + 62f * wave) * reveal);
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(activePalette.lyricsActiveText, alpha));
            float top = startY + i * (barH + gap);
            tempRect.set(padH, top, padH + contentW * widthFracs[i], top + barH);
            canvas.drawRoundRect(tempRect, barR, barR, fillPaint);
        }
    }

    private void drawInstrumentalDots(Canvas canvas, float cy, float focus, int baseColor) {
        fillPaint.setStyle(Paint.Style.FILL);
        int baseAlpha = (baseColor >>> 24) & 0xFF;
        float baseR = 4.2f * density;
        for (int d = 0; d < 3; d++) {
            float pulse = focus > 0.1f
                    ? (0.5f + 0.5f * (float) Math.sin(bgBreathPhase * 3.5f - d * 0.95f))
                    : 0.35f;
            float r = baseR * (0.85f + 0.30f * pulse * Math.max(0.25f, focus));
            int a = Math.round(baseAlpha * (0.55f + 0.45f * pulse));
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(baseColor, a));
            canvas.drawCircle(10f * density + d * 15f * density, cy, r, fillPaint);
        }
    }

    private void drawLyricsSyncPill(Canvas canvas, float alpha) {
        float pressScale = 1f - 0.08f * buttonPress[HIT_LYRICS_SYNC];
        float pillScale = (0.86f + 0.14f * alpha) * pressScale;
        float pillR = lyricsSyncPillRect.height() * 0.5f;

        canvas.save();
        canvas.scale(pillScale, pillScale, lyricsSyncPillRect.centerX(), lyricsSyncPillRect.centerY());

        int bgColor = MaterialYouColorEngine.withAlpha(
                activePalette.glassPillActiveBg, Math.round(235f * alpha));
        int fgColor = MaterialYouColorEngine.withAlpha(
                activePalette.glassPillActiveIcon, Math.round(255f * alpha));

        drawSoftRectShadow(canvas, lyricsSyncPillRect, pillR,
                MaterialYouColorEngine.withAlpha(activePalette.shadowBase, Math.round(64f * alpha)));
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(bgColor);
        canvas.drawRoundRect(lyricsSyncPillRect, pillR, pillR, fillPaint);

        float iconCx = lyricsSyncPillRect.left + 20f * density;
        float iconCy = lyricsSyncPillRect.centerY();
        drawSyncBackIcon(canvas, iconCx, iconCy, 6.2f * density, fgColor);

        syncPillPaint.setColor(fgColor);
        Paint.FontMetrics fm = syncPillPaint.getFontMetrics();
        float textBase = lyricsSyncPillRect.centerY() - (fm.ascent + fm.descent) * 0.5f;
        canvas.drawText("Sync", lyricsSyncPillRect.left + 32f * density, textBase, syncPillPaint);
        canvas.restore();
    }

    private void ensureLyricsLayouts(int widthPx) {
        if (lastLayoutLyricsWidth == widthPx && !lyricLayouts.isEmpty()) {
            return;
        }
        lastLayoutLyricsWidth = widthPx;
        lyricLayouts.clear();
        lyricItemTops.clear();
        lyricItemHeights.clear();
        totalLyricsContentH = 0f;

        if (lyricLines == null || lyricLines.length == 0) {
            return;
        }

        float vpH = lyricsViewportRect.height() > 1f
                ? lyricsViewportRect.height()
                : Math.max(240f * density, getHeight() * 0.58f);
        float topPad = vpH * 0.28f;
        float bottomPad = vpH * 0.48f;

        lyricPaint.setTextAlign(Paint.Align.LEFT);
        lyricPaint.setTextSize(26f * density);
        float y = topPad;
        float lineSpacing = 24f * density;

        for (String line : lyricLines) {
            String text = line == null ? "" : line;
            StaticLayout sl = StaticLayout.Builder.obtain(text, 0, text.length(), lyricPaint, widthPx)
                    .setAlignment(Layout.Alignment.ALIGN_NORMAL)
                    .setLineSpacing(3f * density, 1.10f)
                    .build();
            float h = sl.getHeight();
            lyricLayouts.add(sl);
            lyricItemTops.add(y);
            lyricItemHeights.add(h);
            y += h + lineSpacing;
        }
        totalLyricsContentH = y + bottomPad;

        if (lyricLineFocus == null || lyricLineFocus.length != lyricLayouts.size()) {
            lyricLineFocus = new float[lyricLayouts.size()];
            if (isLyricsSynced && highlightedLyricIndex >= 0 && highlightedLyricIndex < lyricLineFocus.length) {
                lyricLineFocus[highlightedLyricIndex] = 1f;
            }
        }
        updateAutoLyricsScrollTarget();
        if (lyricsReveal < 0.08f && isLyricsSynced) {
            lyricsScrollY = targetLyricsScrollY;
        }
    }

    private float computeAutoLyricsScrollY() {
        if (lyricItemTops.isEmpty() || highlightedLyricIndex < 0 || highlightedLyricIndex >= lyricItemTops.size()) {
            return 0f;
        }
        float vpH = lyricsViewportRect.height() > 1f
                ? lyricsViewportRect.height()
                : Math.max(240f * density, getHeight() * 0.58f);
        float itemCenter = lyricItemTops.get(highlightedLyricIndex) + lyricItemHeights.get(highlightedLyricIndex) * 0.5f;
        float viewCenter = vpH * 0.34f;
        float maxScroll = Math.max(0f, totalLyricsContentH - vpH);
        return Math.max(0f, Math.min(maxScroll, itemCenter - viewCenter));
    }

    private void updateAutoLyricsScrollTarget() {
        if (lyricItemTops.isEmpty() || highlightedLyricIndex < 0 || highlightedLyricIndex >= lyricItemTops.size()) {
            return;
        }
        if (SystemClock.uptimeMillis() - lastUserLyricsScrollMs < 2800L) {
            return;
        }
        targetLyricsScrollY = computeAutoLyricsScrollY();
    }

    private void drawTrackInfoAndActions(Canvas canvas) {
        // Left: Title + Explicit badge + Artist
        float left = titleAreaRect.left;
        float maxW = Math.max(40f * density, titleAreaRect.width());
        float titlePress = 1f - 0.02f * buttonPress[HIT_TITLE_AREA];

        canvas.save();
        canvas.scale(titlePress, titlePress, left + maxW * 0.35f, titleAreaRect.centerY());

        float explicitW = isExplicit ? (20f * density) : 0f;
        titlePaint.setColor(activePalette.primaryDeep);
        String ellipsizedTitle = TextUtils.ellipsize(
                title, titlePaint, Math.max(24f * density, maxW - explicitW), TextUtils.TruncateAt.END).toString();
        float renderedTitleW = titlePaint.measureText(ellipsizedTitle);

        artistPaint.setColor(activePalette.secondaryText);
        String ellipsizedArtist = TextUtils.ellipsize(
                artist, artistPaint, maxW, TextUtils.TruncateAt.END).toString();

        float titleBaseline = titleAreaRect.centerY() - 3f * density;
        float artistBaseline = titleAreaRect.centerY() + 19f * density;

        canvas.drawText(ellipsizedTitle, left, titleBaseline, titlePaint);

        if (isExplicit && !ellipsizedTitle.isEmpty()) {
            float badgeSize = 14.5f * density;
            float badgeLeft = left + renderedTitleW + 6f * density;
            float badgeTop = titleBaseline - badgeSize * 0.85f;
            tempRect.set(badgeLeft, badgeTop, badgeLeft + badgeSize, badgeTop + badgeSize);
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(activePalette.secondaryText, 0x36));
            canvas.drawRoundRect(tempRect, 3.8f * density, 3.8f * density, fillPaint);

            explicitPaint.setColor(activePalette.primaryDeep);
            Paint.FontMetrics efm = explicitPaint.getFontMetrics();
            float eBase = tempRect.centerY() - (efm.ascent + efm.descent) * 0.5f;
            canvas.drawText("E", tempRect.centerX(), eBase, explicitPaint);
        }

        canvas.drawText(ellipsizedArtist, left, artistBaseline, artistPaint);
        canvas.restore();

        // Right: Connected [Lyrics | More (⋮)] Split Pills
        float outerR = 21f * density;
        float innerR = 7f * density;

        if (showLyricsButton) {
            float lyrScale = 1f - 0.09f * buttonPress[HIT_LYRICS_BTN];
            int lyrBg = MaterialYouColorEngine.blendRgb(
                    activePalette.glassPillBg, activePalette.glassPillActiveBg, lyricsReveal);
            int lyrIconColor = MaterialYouColorEngine.blendRgb(
                    activePalette.primaryDeep, activePalette.glassPillActiveIcon, lyricsReveal);
            canvas.save();
            canvas.scale(lyrScale, lyrScale, lyricsBtnRect.centerX(), lyricsBtnRect.centerY());
            drawAsymmetricRoundRect(canvas, lyricsBtnRect, outerR, innerR, innerR, outerR, lyrBg);
            drawLyricsQuoteIcon(canvas, lyricsBtnRect.centerX(), lyricsBtnRect.centerY(), 9f * density, lyrIconColor);
            canvas.restore();

            float moreScale = 1f - 0.09f * buttonPress[HIT_MORE_BTN];
            canvas.save();
            canvas.scale(moreScale, moreScale, moreBtnRect.centerX(), moreBtnRect.centerY());
            drawAsymmetricRoundRect(canvas, moreBtnRect, innerR, outerR, outerR, innerR, activePalette.glassPillBg);
            drawMoreDotsIcon(canvas, moreBtnRect.centerX(), moreBtnRect.centerY(), activePalette.primaryDeep);
            canvas.restore();
        } else {
            float moreScale = 1f - 0.09f * buttonPress[HIT_MORE_BTN];
            canvas.save();
            canvas.scale(moreScale, moreScale, moreBtnRect.centerX(), moreBtnRect.centerY());
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(activePalette.glassPillBg);
            canvas.drawRoundRect(moreBtnRect, outerR, outerR, fillPaint);
            drawMoreDotsIcon(canvas, moreBtnRect.centerX(), moreBtnRect.centerY(), activePalette.primaryDeep);
            canvas.restore();
        }
    }

    private void drawSeekbarAndMeta(Canvas canvas, float badgeAlpha) {
        float trackLeft = activeSeekBarRect.left + 6f * density;
        float trackRight = activeSeekBarRect.right - 6f * density;
        float trackW = Math.max(1f, trackRight - trackLeft);
        float cy = activeSeekBarRect.centerY();

        float shownProgress = (isScrubbing || SystemClock.uptimeMillis() < scrubHoldUntilMs)
                ? scrubProgress
                : serverProgress;
        shownProgress = Math.max(0f, Math.min(1f, shownProgress));
        float thumbX = trackLeft + trackW * shownProgress;

        // 1. Inactive right track (straight line + signature right-end dot)
        int inactiveTrackColor = MaterialYouColorEngine.withAlpha(activePalette.primaryDeep, 0x3A);
        strokePaint.setColor(inactiveTrackColor);
        strokePaint.setStrokeWidth(3.0f * density);
        float inactiveStart = Math.min(trackRight, thumbX + 4f * density);
        if (inactiveStart < trackRight) {
            canvas.drawLine(inactiveStart, cy, trackRight, cy, strokePaint);
        }
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(activePalette.primaryDeep);
        canvas.drawCircle(trackRight, cy, 2.4f * density, fillPaint);

        // 2. Active left track (Expressive Sine Wave when Playing, straight line when Paused)
        float activeEnd = Math.max(trackLeft, thumbX - 3f * density);
        float activeLen = activeEnd - trackLeft;
        if (activeLen > 1f) {
            strokePaint.setColor(activePalette.primaryDeep);
            strokePaint.setStrokeWidth(3.4f * density);

            float waveAmpPx = 4.0f * density * Math.max(0f, waveAmpMorph);
            if (waveAmpPx < 0.15f) {
                canvas.drawLine(trackLeft, cy, activeEnd, cy, strokePaint);
            } else {
                tempPath.reset();
                float wavelength = 26f * density;
                float twoPiOverLambda = (float) (Math.PI * 2.0 / wavelength);
                float step = 2.5f * density;
                // Smooth taper to 0 amplitude near thumb for clean connection
                float taperZone = 10f * density;

                tempPath.moveTo(trackLeft, cy + waveAmpPx * (float) Math.sin(wavePhaseRad));
                for (float dx = step; dx < activeLen; dx += step) {
                    float distFromEnd = activeLen - dx;
                    float endTaper = distFromEnd < taperZone ? (distFromEnd / taperZone) : 1f;
                    float y = cy + waveAmpPx * endTaper * (float) Math.sin(dx * twoPiOverLambda + wavePhaseRad);
                    tempPath.lineTo(trackLeft + dx, y);
                }
                tempPath.lineTo(activeEnd, cy);
                canvas.drawPath(tempPath, strokePaint);
            }
        }

        // 3. Thumb Circle
        float thumbRadius = 7.2f * density * thumbScale;
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(activePalette.primaryDeep);
        canvas.drawCircle(thumbX, cy, thumbRadius, fillPaint);

        // 4. Time Labels & Quality Pill Badge
        timePaint.setColor(activePalette.secondaryText);
        Paint.FontMetrics tfm = timePaint.getFontMetrics();
        float timeBaseline = activeMetaRect.centerY() - (tfm.ascent + tfm.descent) * 0.5f;

        String shownTime = isScrubbing ? computeScrubbedTimeString(shownProgress) : progressTime;
        timePaint.setTextAlign(Paint.Align.LEFT);
        canvas.drawText(shownTime, activeSeekBarRect.left, timeBaseline, timePaint);

        timePaint.setTextAlign(Paint.Align.RIGHT);
        canvas.drawText(durationTime, activeSeekBarRect.right, timeBaseline, timePaint);

        if (!badgeText.isEmpty() && badgeAlpha > 0.02f) {
            float badgeScale = 1f - 0.08f * buttonPress[HIT_BADGE];
            canvas.save();
            canvas.scale(badgeScale, badgeScale, badgeRect.centerX(), badgeRect.centerY());
            float bRad = badgeRect.height() * 0.5f;
            int bgA = Math.round(((activePalette.badgeBg >>> 24) & 0xFF) * badgeAlpha);
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(activePalette.badgeBg, bgA));
            canvas.drawRoundRect(badgeRect, bRad, bRad, fillPaint);

            badgePaint.setColor(MaterialYouColorEngine.withAlpha(
                    activePalette.badgeText, Math.round(255f * badgeAlpha)));
            Paint.FontMetrics bfm = badgePaint.getFontMetrics();
            float bBase = badgeRect.centerY() - (bfm.ascent + bfm.descent) * 0.5f;
            canvas.drawText(badgeText.toUpperCase(Locale.US), badgeRect.centerX(), bBase, badgePaint);
            canvas.restore();
        }
    }

    private String computeScrubbedTimeString(float progress) {
        int totalSec = parseDurationSeconds(durationTime);
        if (totalSec <= 0) {
            return progressTime;
        }
        int curSec = Math.round(totalSec * Math.max(0f, Math.min(1f, progress)));
        int hours = curSec / 3600;
        int mins = (curSec % 3600) / 60;
        int secs = curSec % 60;
        if (hours > 0) {
            return String.format(Locale.US, "%d:%02d:%02d", hours, mins, secs);
        }
        return String.format(Locale.US, "%02d:%02d", mins, secs);
    }

    private static int parseDurationSeconds(String formatted) {
        if (formatted == null || formatted.isEmpty()) return 0;
        try {
            String[] parts = formatted.trim().split(":");
            if (parts.length == 2) {
                return Integer.parseInt(parts[0]) * 60 + Integer.parseInt(parts[1]);
            }
            if (parts.length == 3) {
                return Integer.parseInt(parts[0]) * 3600
                        + Integer.parseInt(parts[1]) * 60
                        + Integer.parseInt(parts[2]);
            }
        } catch (Throwable ignored) {
        }
        return 0;
    }

    private void drawTransportControls(Canvas canvas) {
        float lr = easeInOutCubic(lyricsReveal);
        float fullPillR = activePrevRect.height() * 0.5f;
        float pressedR = Math.min(fullPillR, 18f * density);
        float iconR = (8.5f - 1.0f * lr) * density;

        // Left: Previous Pill-Circle
        float prevP = Math.max(0f, buttonPress[HIT_PREV]);
        float prevScale = 1f - 0.085f * prevP;
        float prevR = fullPillR * (1f - prevP) + pressedR * prevP;
        canvas.save();
        canvas.scale(prevScale, prevScale, activePrevRect.centerX(), activePrevRect.centerY());
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(activePalette.sideBtnBg);
        canvas.drawRoundRect(activePrevRect, prevR, prevR, fillPaint);
        drawSkipPrevIcon(canvas, activePrevRect.centerX(), activePrevRect.centerY(), iconR, activePalette.sideBtnIcon);
        canvas.restore();

        // Center: Large Expressive Play/Pause Squircle (morphs between Playing squircle and Paused pill)
        float playP = Math.max(0f, buttonPress[HIT_PLAY]);
        float playScale = 1f - 0.085f * playP;
        float clampedMorph = Math.max(0f, Math.min(1f, playShapeMorph));
        float playSquircleR = Math.min(fullPillR, (22f - 4f * lr) * density);
        float playR = fullPillR * (1f - clampedMorph) + playSquircleR * clampedMorph;

        canvas.save();
        canvas.scale(playScale, playScale, activePlayRect.centerX(), activePlayRect.centerY());
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(activePalette.centerPlayBg);
        canvas.drawRoundRect(activePlayRect, playR, playR, fillPaint);

        if ("BUFFERING".equals(playState)) {
            float ringR = (11f - 1.2f * lr) * density;
            tempRect.set(activePlayRect.centerX() - ringR, activePlayRect.centerY() - ringR,
                    activePlayRect.centerX() + ringR, activePlayRect.centerY() + ringR);
            strokePaint.setColor(activePalette.centerPlayIcon);
            strokePaint.setStrokeWidth(2.8f * density);
            canvas.drawArc(tempRect, bufferingAngleDeg, 260f, false, strokePaint);
        } else if ("PLAYING".equals(playState)) {
            drawPauseBars(canvas, activePlayRect.centerX(), activePlayRect.centerY(), iconR, activePalette.centerPlayIcon);
        } else {
            drawPlayTriangle(canvas, activePlayRect.centerX() + 1.5f * density, activePlayRect.centerY(),
                    (9.5f - 1.0f * lr) * density, activePalette.centerPlayIcon);
        }
        canvas.restore();

        // Right: Next Pill-Circle
        float nextP = Math.max(0f, buttonPress[HIT_NEXT]);
        float nextScale = 1f - 0.085f * nextP;
        float nextR = fullPillR * (1f - nextP) + pressedR * nextP;
        int nextBg = isNextEnabled
                ? activePalette.sideBtnBg
                : MaterialYouColorEngine.withAlpha(activePalette.sideBtnBg, 0x70);
        int nextIcon = isNextEnabled
                ? activePalette.sideBtnIcon
                : MaterialYouColorEngine.withAlpha(activePalette.sideBtnIcon, 0x80);
        canvas.save();
        canvas.scale(nextScale, nextScale, activeNextRect.centerX(), activeNextRect.centerY());
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(nextBg);
        canvas.drawRoundRect(activeNextRect, nextR, nextR, fillPaint);
        drawSkipNextIcon(canvas, activeNextRect.centerX(), activeNextRect.centerY(), iconR, nextIcon);
        canvas.restore();
    }

    private void drawBottomCapsule(Canvas canvas) {
        // Outer floating capsule frame
        float capR = bottomCapsuleRect.height() * 0.5f;
        drawSoftRectShadow(canvas, bottomCapsuleRect, capR, activePalette.shadowBase);
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(activePalette.capsuleFrameBg);
        canvas.drawRoundRect(bottomCapsuleRect, capR, capR, fillPaint);

        float outerR = shuffleRect.height() * 0.5f;
        float innerR = 7f * density;

        // Left Segment: Shuffle
        float shufScale = 1f - 0.08f * buttonPress[HIT_SHUFFLE];
        int shufBg = MaterialYouColorEngine.blendRgb(
                activePalette.capsuleSegmentBg, activePalette.glassPillActiveBg, shuffleFrac);
        int shufIcon = MaterialYouColorEngine.blendRgb(
                activePalette.primaryDeep, activePalette.glassPillActiveIcon, shuffleFrac);
        canvas.save();
        canvas.scale(shufScale, shufScale, shuffleRect.centerX(), shuffleRect.centerY());
        drawAsymmetricRoundRect(canvas, shuffleRect, outerR, innerR, innerR, outerR, shufBg);
        drawShuffleIcon(canvas, shuffleRect.centerX(), shuffleRect.centerY(), 8.8f * density, shufIcon);
        canvas.restore();

        // Center Segment: Repeat
        float repScale = 1f - 0.08f * buttonPress[HIT_REPEAT];
        int repBg = MaterialYouColorEngine.blendRgb(
                activePalette.capsuleSegmentBg, activePalette.glassPillActiveBg, repeatFrac);
        int repIcon = MaterialYouColorEngine.blendRgb(
                activePalette.primaryDeep, activePalette.glassPillActiveIcon, repeatFrac);
        canvas.save();
        canvas.scale(repScale, repScale, repeatRect.centerX(), repeatRect.centerY());
        drawAsymmetricRoundRect(canvas, repeatRect, innerR, innerR, innerR, innerR, repBg);
        drawRepeatIcon(canvas, repeatRect.centerX(), repeatRect.centerY(),
                8.8f * density, repIcon, "SINGLE".equals(repeatMode));
        canvas.restore();

        // Right Segment: Favorite Heart
        float favScale = (1f - 0.08f * buttonPress[HIT_FAVORITE]);
        int favBg = MaterialYouColorEngine.blendRgb(
                activePalette.capsuleSegmentBg, activePalette.glassPillActiveBg, favoriteFrac);
        int favIcon = MaterialYouColorEngine.blendRgb(
                activePalette.primaryDeep, activePalette.glassPillActiveIcon, favoriteFrac);
        canvas.save();
        canvas.scale(favScale, favScale, favoriteRect.centerX(), favoriteRect.centerY());
        drawAsymmetricRoundRect(canvas, favoriteRect, innerR, outerR, outerR, innerR, favBg);
        canvas.save();
        canvas.scale(heartPopImpulse, heartPopImpulse, favoriteRect.centerX(), favoriteRect.centerY());
        drawHeartIcon(canvas, favoriteRect.centerX(), favoriteRect.centerY(),
                9.2f * density, favIcon, isFavorite);
        canvas.restore();
        canvas.restore();
    }

    // ---- Vector Icon & Shape Helpers ----

    private void drawAsymmetricRoundRect(
            Canvas canvas,
            RectF rect,
            float tl,
            float tr,
            float br,
            float bl,
            int color
    ) {
        cornerRadii[0] = tl; cornerRadii[1] = tl;
        cornerRadii[2] = tr; cornerRadii[3] = tr;
        cornerRadii[4] = br; cornerRadii[5] = br;
        cornerRadii[6] = bl; cornerRadii[7] = bl;
        tempPath.reset();
        tempPath.addRoundRect(rect, cornerRadii, Path.Direction.CW);
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(color);
        canvas.drawPath(tempPath, fillPaint);
    }

    private void drawSoftRectShadow(Canvas canvas, RectF rect, float radius, int baseShadowColor) {
        int baseAlpha = (baseShadowColor >>> 24) & 0xFF;
        float[] spreads = {8.5f, 4.8f, 2.0f};
        float[] dys = {5.0f, 3.0f, 1.4f};
        float[] factors = {0.16f, 0.24f, 0.30f};
        for (int i = 0; i < spreads.length; i++) {
            float exp = spreads[i] * density;
            float dy = dys[i] * density;
            tempRect.set(rect.left - exp * 0.4f, rect.top + dy - exp * 0.3f,
                    rect.right + exp * 0.4f, rect.bottom + dy + exp * 0.6f);
            shadowPaint.setStyle(Paint.Style.FILL);
            shadowPaint.setColor(MaterialYouColorEngine.withAlpha(
                    baseShadowColor, Math.round(baseAlpha * factors[i])));
            canvas.drawRoundRect(tempRect, radius + exp * 0.35f, radius + exp * 0.35f, shadowPaint);
        }
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

    private void drawChevronDownIcon(Canvas canvas, float cx, float cy, float r, int color) {
        if (drawTidalIcon(canvas, iconChevronDown, cx, cy, r * 2.75f, color)) {
            return;
        }
        strokePaint.setColor(color);
        strokePaint.setStrokeWidth(2.1f * density);
        tempPath.reset();
        tempPath.moveTo(cx - r * 0.72f, cy - r * 0.28f);
        tempPath.lineTo(cx, cy + r * 0.42f);
        tempPath.lineTo(cx + r * 0.72f, cy - r * 0.28f);
        canvas.drawPath(tempPath, strokePaint);
    }

    private void drawCloseXIcon(Canvas canvas, float cx, float cy, float r, int color) {
        if (drawTidalIcon(canvas, iconClose, cx, cy, r * 2.65f, color)) {
            return;
        }
        strokePaint.setColor(color);
        strokePaint.setStrokeWidth(2.1f * density);
        canvas.drawLine(cx - r * 0.72f, cy - r * 0.72f, cx + r * 0.72f, cy + r * 0.72f, strokePaint);
        canvas.drawLine(cx + r * 0.72f, cy - r * 0.72f, cx - r * 0.72f, cy + r * 0.72f, strokePaint);
    }

    private void drawSyncBackIcon(Canvas canvas, float cx, float cy, float r, int color) {
        if (drawTidalIcon(canvas, iconLyricsSync, cx, cy, r * 2.45f, color)) {
            return;
        }
        strokePaint.setColor(color);
        strokePaint.setStrokeWidth(1.9f * density);
        tempRect.set(cx - r * 0.78f, cy - r * 0.78f, cx + r * 0.78f, cy + r * 0.78f);
        canvas.drawArc(tempRect, -40f, 265f, false, strokePaint);

        float ax = cx + r * 0.60f;
        float ay = cy - r * 0.50f;
        tempPath.reset();
        tempPath.moveTo(ax - r * 0.36f, ay + r * 0.04f);
        tempPath.lineTo(ax + r * 0.04f, ay + r * 0.04f);
        tempPath.lineTo(ax + r * 0.04f, ay - r * 0.36f);
        canvas.drawPath(tempPath, strokePaint);
    }

    private void drawDeviceCastIcon(Canvas canvas, float cx, float cy, float r, int color) {
        if (drawTidalIcon(canvas, iconCast, cx, cy, r * 2.15f, color)) {
            return;
        }
        strokePaint.setColor(color);
        strokePaint.setStrokeWidth(1.85f * density);
        // Phone outline on left-top + mini speaker/waves
        tempRect.set(cx - r * 0.62f, cy - r * 0.76f, cx + r * 0.28f, cy + r * 0.76f);
        canvas.drawRoundRect(tempRect, 2.0f * density, 2.0f * density, strokePaint);

        // Mini speaker/cast waves on right
        tempPath.reset();
        tempPath.moveTo(cx + r * 0.48f, cy - r * 0.32f);
        tempPath.quadTo(cx + r * 0.85f, cy, cx + r * 0.48f, cy + r * 0.32f);
        canvas.drawPath(tempPath, strokePaint);

        // Small play/audio triangle inside phone
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(color);
        canvas.drawCircle(cx - r * 0.17f, cy + r * 0.35f, 1.4f * density, fillPaint);
    }

    private void drawQueueMusicIcon(Canvas canvas, float cx, float cy, float r, int color) {
        if (drawTidalIcon(canvas, iconQueue, cx, cy, r * 2.15f, color)) {
            return;
        }
        strokePaint.setColor(color);
        strokePaint.setStrokeWidth(1.9f * density);
        // 3 horizontal queue bars
        float left = cx - r * 0.78f;
        canvas.drawLine(left, cy - r * 0.48f, cx + r * 0.12f, cy - r * 0.48f, strokePaint);
        canvas.drawLine(left, cy, cx + r * 0.02f, cy, strokePaint);
        canvas.drawLine(left, cy + r * 0.48f, cx - r * 0.12f, cy + r * 0.48f, strokePaint);

        // Eighth note on right
        float noteX = cx + r * 0.42f;
        float noteY = cy + r * 0.32f;
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(color);
        canvas.drawCircle(noteX - 1.2f * density, noteY, 2.2f * density, fillPaint);
        tempPath.reset();
        tempPath.moveTo(noteX + 0.5f * density, noteY);
        tempPath.lineTo(noteX + 0.5f * density, cy - r * 0.55f);
        tempPath.lineTo(noteX + 3.6f * density, cy - r * 0.35f);
        canvas.drawPath(tempPath, strokePaint);
    }

    private void drawLyricsQuoteIcon(Canvas canvas, float cx, float cy, float r, int color) {
        if (drawTidalIcon(canvas, iconLyrics, cx, cy, r * 2.25f, color)) {
            return;
        }
        strokePaint.setColor(color);
        strokePaint.setStrokeWidth(1.85f * density);
        // Speech bubble + music note
        tempPath.reset();
        float bLeft = cx - r * 0.72f;
        float bTop = cy - r * 0.65f;
        float bRight = cx + r * 0.32f;
        float bBot = cy + r * 0.38f;
        tempPath.moveTo(bLeft + 2f * density, bTop);
        tempPath.lineTo(bRight - 2f * density, bTop);
        tempPath.quadTo(bRight, bTop, bRight, bTop + 2f * density);
        tempPath.lineTo(bRight, bBot - 2f * density);
        tempPath.quadTo(bRight, bBot, bRight - 2f * density, bBot);
        tempPath.lineTo(bLeft + r * 0.30f, bBot);
        tempPath.lineTo(bLeft, bBot + r * 0.36f);
        tempPath.lineTo(bLeft, bTop + 2f * density);
        tempPath.quadTo(bLeft, bTop, bLeft + 2f * density, bTop);
        canvas.drawPath(tempPath, strokePaint);

        // Lines inside bubble
        canvas.drawLine(bLeft + 2.5f * density, cy - r * 0.25f, bRight - 2.5f * density, cy - r * 0.25f, strokePaint);
        canvas.drawLine(bLeft + 2.5f * density, cy + r * 0.08f, bRight - 4.0f * density, cy + r * 0.08f, strokePaint);

        // Small note next to bubble
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(color);
        canvas.drawCircle(cx + r * 0.58f, cy + r * 0.24f, 1.8f * density, fillPaint);
        canvas.drawLine(cx + r * 0.72f, cy + r * 0.24f, cx + r * 0.72f, cy - r * 0.55f, strokePaint);
    }

    private void drawMoreDotsIcon(Canvas canvas, float cx, float cy, int color) {
        if (drawTidalIcon(canvas, iconMore, cx, cy, 21f * density, color)) {
            return;
        }
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(color);
        float dotR = 1.9f * density;
        float step = 5.4f * density;
        canvas.drawCircle(cx, cy - step, dotR, fillPaint);
        canvas.drawCircle(cx, cy, dotR, fillPaint);
        canvas.drawCircle(cx, cy + step, dotR, fillPaint);
    }

    private void drawPlayTriangle(Canvas canvas, float cx, float cy, float r, int color) {
        if (drawTidalIcon(canvas, iconPlay, cx - 0.5f * density, cy, r * 2.75f, color)) {
            return;
        }
        tempPath.reset();
        tempPath.moveTo(cx - r * 0.55f, cy - r * 0.82f);
        tempPath.lineTo(cx + r * 0.82f, cy);
        tempPath.lineTo(cx - r * 0.55f, cy + r * 0.82f);
        tempPath.close();
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(color);
        canvas.drawPath(tempPath, fillPaint);
    }

    private void drawPauseBars(Canvas canvas, float cx, float cy, float r, int color) {
        if (drawTidalIcon(canvas, iconPause, cx, cy, r * 3.0f, color)) {
            return;
        }
        float barW = 4.0f * density;
        float barGap = 4.2f * density;
        float halfH = r * 0.96f;
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(color);

        tempRect.set(cx - barGap * 0.5f - barW, cy - halfH, cx - barGap * 0.5f, cy + halfH);
        canvas.drawRoundRect(tempRect, 2.0f * density, 2.0f * density, fillPaint);

        tempRect.set(cx + barGap * 0.5f, cy - halfH, cx + barGap * 0.5f + barW, cy + halfH);
        canvas.drawRoundRect(tempRect, 2.0f * density, 2.0f * density, fillPaint);
    }

    private void drawSkipNextIcon(Canvas canvas, float cx, float cy, float r, int color) {
        if (drawTidalIcon(canvas, iconNext, cx, cy, r * 2.65f, color)) {
            return;
        }
        tempPath.reset();
        tempPath.moveTo(cx - r * 0.78f, cy - r * 0.76f);
        tempPath.lineTo(cx + r * 0.34f, cy);
        tempPath.lineTo(cx - r * 0.78f, cy + r * 0.76f);
        tempPath.close();
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(color);
        canvas.drawPath(tempPath, fillPaint);

        tempRect.set(cx + r * 0.42f, cy - r * 0.72f, cx + r * 0.76f, cy + r * 0.72f);
        canvas.drawRoundRect(tempRect, 1.4f * density, 1.4f * density, fillPaint);
    }

    private void drawSkipPrevIcon(Canvas canvas, float cx, float cy, float r, int color) {
        if (drawTidalIcon(canvas, iconPrev, cx, cy, r * 2.65f, color)) {
            return;
        }
        tempPath.reset();
        tempPath.moveTo(cx + r * 0.78f, cy - r * 0.76f);
        tempPath.lineTo(cx - r * 0.34f, cy);
        tempPath.lineTo(cx + r * 0.78f, cy + r * 0.76f);
        tempPath.close();
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(color);
        canvas.drawPath(tempPath, fillPaint);

        tempRect.set(cx - r * 0.76f, cy - r * 0.72f, cx - r * 0.42f, cy + r * 0.72f);
        canvas.drawRoundRect(tempRect, 1.4f * density, 1.4f * density, fillPaint);
    }

    private void drawShuffleIcon(Canvas canvas, float cx, float cy, float r, int color) {
        if (drawTidalIcon(canvas, iconShuffle, cx, cy, r * 2.4f, color)) {
            return;
        }
        strokePaint.setColor(color);
        strokePaint.setStrokeWidth(2.0f * density);
        float left = cx - r * 0.80f;
        float right = cx + r * 0.75f;
        float top = cy - r * 0.52f;
        float bot = cy + r * 0.52f;

        // Crossing curved tracks
        tempPath.reset();
        tempPath.moveTo(left, top);
        tempPath.cubicTo(cx - r * 0.1f, top, cx + r * 0.1f, bot, right, bot);
        canvas.drawPath(tempPath, strokePaint);

        tempPath.reset();
        tempPath.moveTo(left, bot);
        tempPath.cubicTo(cx - r * 0.1f, bot, cx + r * 0.1f, top, right, top);
        canvas.drawPath(tempPath, strokePaint);

        // Arrowheads
        float a = r * 0.28f;
        tempPath.reset();
        tempPath.moveTo(right - a, top - a);
        tempPath.lineTo(right + 0.5f * density, top);
        tempPath.lineTo(right - a, top + a);
        canvas.drawPath(tempPath, strokePaint);

        tempPath.reset();
        tempPath.moveTo(right - a, bot - a);
        tempPath.lineTo(right + 0.5f * density, bot);
        tempPath.lineTo(right - a, bot + a);
        canvas.drawPath(tempPath, strokePaint);
    }

    private void drawRepeatIcon(Canvas canvas, float cx, float cy, float r, int color, boolean single) {
        Drawable rep = single && iconRepeatOne != null ? iconRepeatOne : iconRepeat;
        if (drawTidalIcon(canvas, rep, cx, cy, r * 2.4f, color)) {
            return;
        }
        strokePaint.setColor(color);
        strokePaint.setStrokeWidth(2.0f * density);
        float left = cx - r * 0.72f;
        float right = cx + r * 0.72f;
        float top = cy - r * 0.50f;
        float bot = cy + r * 0.50f;
        float cr = r * 0.30f;

        // Top loop right
        tempPath.reset();
        tempPath.moveTo(left, cy);
        tempPath.lineTo(left, top + cr);
        tempPath.quadTo(left, top, left + cr, top);
        tempPath.lineTo(right - r * 0.15f, top);
        canvas.drawPath(tempPath, strokePaint);

        // Top arrowhead
        float a = r * 0.25f;
        tempPath.reset();
        tempPath.moveTo(right - r * 0.15f - a, top - a);
        tempPath.lineTo(right - r * 0.05f, top);
        tempPath.lineTo(right - r * 0.15f - a, top + a);
        canvas.drawPath(tempPath, strokePaint);

        // Bottom loop left
        tempPath.reset();
        tempPath.moveTo(right, cy);
        tempPath.lineTo(right, bot - cr);
        tempPath.quadTo(right, bot, right - cr, bot);
        tempPath.lineTo(left + r * 0.15f, bot);
        canvas.drawPath(tempPath, strokePaint);

        // Bottom arrowhead
        tempPath.reset();
        tempPath.moveTo(left + r * 0.15f + a, bot - a);
        tempPath.lineTo(left + r * 0.05f, bot);
        tempPath.lineTo(left + r * 0.15f + a, bot + a);
        canvas.drawPath(tempPath, strokePaint);

        if (single) {
            smallLabelPaint.setColor(color);
            Paint.FontMetrics fm = smallLabelPaint.getFontMetrics();
            float base = cy - (fm.ascent + fm.descent) * 0.5f;
            canvas.drawText("1", cx, base, smallLabelPaint);
        }
    }

    private void drawHeartIcon(Canvas canvas, float cx, float cy, float r, int color, boolean filled) {
        Drawable heart = filled ? iconFavoriteFilled : iconFavorite;
        if (drawTidalIcon(canvas, heart, cx, cy, r * 2.4f, color)) {
            return;
        }
        tempPath.reset();
        float topDip = cy - r * 0.28f;
        float botTip = cy + r * 0.76f;
        tempPath.moveTo(cx, botTip);
        tempPath.cubicTo(cx - r * 1.15f, cy + r * 0.05f, cx - r * 0.95f, cy - r * 0.92f, cx, topDip);
        tempPath.cubicTo(cx + r * 0.95f, cy - r * 0.92f, cx + r * 1.15f, cy + r * 0.05f, cx, botTip);
        tempPath.close();

        if (filled) {
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(color);
            canvas.drawPath(tempPath, fillPaint);
        } else {
            strokePaint.setColor(color);
            strokePaint.setStrokeWidth(2.0f * density);
            canvas.drawPath(tempPath, strokePaint);
        }
    }

    // ---- Touch & Gesture Dispatch ----

    private int hitTest(float x, float y) {
        float slop = 6f * density;
        if (lyricsReveal > 0.5f) {
            if (containsWithSlop(lyricsCloseRect, x, y, slop)) return HIT_LYRICS_CLOSE;
            if (containsWithSlop(lyricsMiniCoverRect, x, y, 4f * density)
                    || containsWithSlop(lyricsHeaderTitleRect, x, y, 4f * density)) return HIT_LYRICS_MINI_COVER;
            if (syncPillReveal > 0.5f && containsWithSlop(lyricsSyncPillRect, x, y, 4f * density)) return HIT_LYRICS_SYNC;
            if (containsWithSlop(activeSeekBarRect, x, y, 8f * density)) return HIT_SEEKBAR;
            if (containsWithSlop(activePrevRect, x, y, 4f * density)) return HIT_PREV;
            if (containsWithSlop(activePlayRect, x, y, 4f * density)) return HIT_PLAY;
            if (containsWithSlop(activeNextRect, x, y, 4f * density)) return HIT_NEXT;
            if (containsWithSlop(lyricsViewportRect, x, y, 0f)) return HIT_LYRICS_AREA;
            return HIT_NONE;
        }
        if (containsWithSlop(collapseRect, x, y, slop)) return HIT_COLLAPSE;
        if (containsWithSlop(castRect, x, y, 3f * density)) return HIT_CAST;
        if (containsWithSlop(queueRect, x, y, 3f * density)) return HIT_QUEUE;
        if (containsWithSlop(coverRect, x, y, 0f)) return HIT_COVER;
        if (showLyricsButton && containsWithSlop(lyricsBtnRect, x, y, 3f * density)) return HIT_LYRICS_BTN;
        if (containsWithSlop(moreBtnRect, x, y, 3f * density)) return HIT_MORE_BTN;
        if (containsWithSlop(titleAreaRect, x, y, 4f * density)) return HIT_TITLE_AREA;
        if (containsWithSlop(seekBarTouchRect, x, y, 8f * density)) return HIT_SEEKBAR;
        if (!badgeText.isEmpty() && containsWithSlop(badgeRect, x, y, 6f * density)) return HIT_BADGE;
        if (containsWithSlop(prevBtnRect, x, y, 4f * density)) return HIT_PREV;
        if (containsWithSlop(playBtnRect, x, y, 4f * density)) return HIT_PLAY;
        if (containsWithSlop(nextBtnRect, x, y, 4f * density)) return HIT_NEXT;
        if (containsWithSlop(shuffleRect, x, y, 3f * density)) return HIT_SHUFFLE;
        if (containsWithSlop(repeatRect, x, y, 3f * density)) return HIT_REPEAT;
        if (containsWithSlop(favoriteRect, x, y, 3f * density)) return HIT_FAVORITE;
        return HIT_NONE;
    }

    private static boolean containsWithSlop(RectF rect, float x, float y, float slop) {
        if (rect.width() <= 0f || rect.height() <= 0f) return false;
        return x >= rect.left - slop && x <= rect.right + slop
                && y >= rect.top - slop && y <= rect.bottom + slop;
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        float x = event.getX();
        float y = event.getY();

        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN: {
                int hit = hitTest(x, y);
                downX = x;
                downY = y;
                lastTouchY = y;
                lastMoveTimeMs = SystemClock.uptimeMillis();
                activeHitTarget = hit;
                isSwipingCover = false;
                coverSwipeTriggered = false;
                isScrollingLyrics = false;
                if (hit == HIT_LYRICS_AREA) {
                    lyricsFlingVel = 0f;
                    lyricsScrollVel = 0f;
                }

                if (hit == HIT_SEEKBAR) {
                    isScrubbing = true;
                    updateScrubFromX(x);
                    if (getParent() != null) {
                        getParent().requestDisallowInterceptTouchEvent(true);
                    }
                    performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                }
                if (hit != HIT_NONE) {
                    startAnimationLoop();
                }
                return true;
            }
            case MotionEvent.ACTION_MOVE: {
                float dx = x - downX;
                float dy = y - downY;

                if (isScrubbing) {
                    updateScrubFromX(x);
                    invalidate();
                    return true;
                }

                if (activeHitTarget == HIT_LYRICS_AREA) {
                    if (!isScrollingLyrics && Math.abs(dy) > touchSlop) {
                        isScrollingLyrics = true;
                        lastTouchY = y;
                        lastMoveTimeMs = SystemClock.uptimeMillis();
                        if (getParent() != null) {
                            getParent().requestDisallowInterceptTouchEvent(true);
                        }
                    }
                    if (isScrollingLyrics) {
                        long now = SystemClock.uptimeMillis();
                        float dtSec = Math.max(0.004f, Math.min(0.06f, (now - lastMoveTimeMs) / 1000f));
                        float deltaY = lastTouchY - y;
                        lastTouchY = y;
                        lastMoveTimeMs = now;
                        lastUserLyricsScrollMs = now;

                        float vpH = Math.max(1f, lyricsViewportRect.height());
                        float maxScroll = Math.max(0f, totalLyricsContentH - vpH);
                        float nextScroll = lyricsScrollY + deltaY;
                        // Gentle rubber-band resistance past ends
                        if (nextScroll < 0f || nextScroll > maxScroll) {
                            nextScroll = lyricsScrollY + deltaY * 0.35f;
                        }
                        float maxOver = 48f * density;
                        lyricsScrollY = Math.max(-maxOver, Math.min(maxScroll + maxOver, nextScroll));
                        targetLyricsScrollY = Math.max(0f, Math.min(maxScroll, lyricsScrollY));

                        float instVel = deltaY / dtSec;
                        lyricsFlingVel = lyricsFlingVel * 0.35f + instVel * 0.65f;
                        startAnimationLoop();
                        invalidate();
                        return true;
                    }
                } else if (activeHitTarget == HIT_COVER) {
                    if (!isSwipingCover
                            && MaterialYouConfig.isPlayerCoverSwipeEnabled()
                            && Math.abs(dx) > touchSlop && Math.abs(dx) > Math.abs(dy) * 1.1f) {
                        isSwipingCover = true;
                        if (getParent() != null) {
                            getParent().requestDisallowInterceptTouchEvent(true);
                        }
                    }

                    if (isSwipingCover) {
                        coverDragX = dx * 0.56f;
                        float triggerPx = 68f * density;
                        boolean crossed = Math.abs(coverDragX) >= triggerPx
                                && (coverDragX < 0 ? isNextEnabled : true);
                        if (crossed && !coverSwipeTriggered) {
                            coverSwipeTriggered = true;
                            performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                        } else if (!crossed) {
                            coverSwipeTriggered = false;
                        }
                        invalidate();
                        return true;
                    }
                }
                return true;
            }
            case MotionEvent.ACTION_UP: {
                int downTarget = activeHitTarget;
                boolean wasScrubbing = isScrubbing;
                boolean wasSwiping = isSwipingCover;
                boolean wasScrollingLyrics = isScrollingLyrics;
                float finalDragX = coverDragX;

                activeHitTarget = HIT_NONE;
                isScrubbing = false;
                isSwipingCover = false;
                isScrollingLyrics = false;

                if (wasScrubbing) {
                    updateScrubFromX(x);
                    scrubHoldUntilMs = SystemClock.uptimeMillis() + 400L;
                    ExpressivePlayerBridge.dispatchSeekFinished();
                    performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                    startAnimationLoop();
                    return true;
                }

                if (wasSwiping) {
                    float triggerPx = 68f * density;
                    if (finalDragX <= -triggerPx && isNextEnabled) {
                        performHapticFeedback(HapticFeedbackConstants.CONFIRM);
                        ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_NEXT);
                    } else if (finalDragX >= triggerPx) {
                        performHapticFeedback(HapticFeedbackConstants.CONFIRM);
                        ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_PREVIOUS);
                    }
                    coverDragVel = -finalDragX * 5.5f;
                    startAnimationLoop();
                    return true;
                }

                if (wasScrollingLyrics) {
                    if (SystemClock.uptimeMillis() - lastMoveTimeMs > 80L) {
                        lyricsFlingVel = 0f;
                    }
                    startAnimationLoop();
                    return true;
                }

                int upTarget = hitTest(x, y);
                startAnimationLoop();

                if (upTarget == downTarget) {
                    handleTargetClick(upTarget, x, y);
                }
                return true;
            }
            case MotionEvent.ACTION_CANCEL: {
                if (isScrubbing) {
                    isScrubbing = false;
                    ExpressivePlayerBridge.dispatchSeekFinished();
                }
                activeHitTarget = HIT_NONE;
                isSwipingCover = false;
                isScrollingLyrics = false;
                lyricsFlingVel = 0f;
                startAnimationLoop();
                return true;
            }
            default:
                return super.onTouchEvent(event);
        }
    }

    private void updateScrubFromX(float x) {
        float trackLeft = activeSeekBarRect.left + 6f * density;
        float trackRight = activeSeekBarRect.right - 6f * density;
        float frac = (x - trackLeft) / Math.max(1f, trackRight - trackLeft);
        scrubProgress = Math.max(0f, Math.min(1f, frac));
        ExpressivePlayerBridge.dispatchSeekDragging(scrubProgress);
    }

    private void handleTargetClick(int target, float x, float y) {
        switch (target) {
            case HIT_COLLAPSE:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                ExpressivePlayerBridge.dispatchCollapsePlayer(getContext());
                break;
            case HIT_LYRICS_CLOSE:
            case HIT_LYRICS_MINI_COVER:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_LYRICS);
                break;
            case HIT_LYRICS_SYNC:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                lastUserLyricsScrollMs = 0L;
                lyricsFlingVel = 0f;
                updateAutoLyricsScrollTarget();
                startAnimationLoop();
                break;
            case HIT_LYRICS_AREA:
                if (isLyricsVisible && isLyricsSynced && lyricTimesMs != null && !lyricItemTops.isEmpty()) {
                    float localY = (y - lyricsViewportRect.top) + lyricsScrollY;
                    for (int i = 0; i < lyricItemTops.size(); i++) {
                        float top = lyricItemTops.get(i);
                        float bot = top + lyricItemHeights.get(i) + 22f * density;
                        if (localY >= top - 8f * density && localY <= bot && i < lyricTimesMs.length) {
                            tappedLyricIndex = i;
                            tappedLyricFlash = 1f;
                            lastUserLyricsScrollMs = 0L;
                            lyricsFlingVel = 0f;
                            performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                            ExpressivePlayerBridge.dispatchLyricLineClicked(lyricTimesMs[i]);
                            startAnimationLoop();
                            break;
                        }
                    }
                }
                break;
            case HIT_CAST:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_BROADCAST);
                break;
            case HIT_QUEUE:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_QUEUE);
                break;
            case HIT_COVER:
                break;
            case HIT_TITLE_AREA:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                if (y < titleAreaRect.centerY() + 6f * density) {
                    ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_TITLE);
                } else {
                    ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_ARTIST);
                }
                break;
            case HIT_LYRICS_BTN:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_LYRICS);
                break;
            case HIT_MORE_BTN:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_CONTEXT_MENU);
                break;
            case HIT_BADGE:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_PLAYBACK_BADGE);
                break;
            case HIT_PREV:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_PREVIOUS);
                break;
            case HIT_PLAY:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_PLAY_PAUSE);
                break;
            case HIT_NEXT:
                if (isNextEnabled) {
                    performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                    ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_NEXT);
                }
                break;
            case HIT_SHUFFLE:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_SHUFFLE);
                break;
            case HIT_REPEAT:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_REPEAT);
                break;
            case HIT_FAVORITE:
                performHapticFeedback(HapticFeedbackConstants.CONFIRM);
                if (!isFavorite) {
                    heartPopImpulse = 1f;
                    heartPopVel = 5.4f;
                }
                ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_FAVORITE);
                break;
            default:
                break;
        }
    }
}
