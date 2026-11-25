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
import android.graphics.RecordingCanvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.media.AudioManager;
import android.os.Build;
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
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import dev.materialtidal.extension.tidal.navbar.ExpressiveMiniPlayerView;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsFetcher;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.SyllableLyricsDocument;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsRenderer;
import dev.materialtidal.extension.tidal.player.lyrics.SyllablePlaybackClock;
import dev.materialtidal.extension.tidal.player.waveform.SongWaveformAnalyzer;
import dev.materialtidal.extension.tidal.player.waveform.SongWaveformBridge;
import dev.materialtidal.extension.tidal.player.waveform.SongWaveformExtractor;
import dev.materialtidal.extension.tidal.player.waveform.WaveformSeekbarRenderer;
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
    private static final ConcurrentHashMap<String, Integer> ICON_RES_ID_CACHE = new ConcurrentHashMap<>();
    private static volatile boolean iconsPrewarmed = false;
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
    private static final int HIT_SOURCE_CHIP = 20;
    private static final int HIT_DESKTOP_PANEL_TOGGLE = 21;
    private static final int HIT_DESKTOP_TAB_QUEUE = 22;
    private static final int HIT_DESKTOP_TAB_LYRICS = 23;
    private static final int HIT_DESKTOP_QUEUE_AREA = 24;
    private static final int HIT_DESKTOP_OPEN_FULL_QUEUE = 25;
    private static final int HIT_DESKTOP_VOLUME_ICON = 26;
    private static final int HIT_DESKTOP_VOLUME_SLIDER = 27;
    private static final int HIT_COUNT = 28;

    private static final int TAB_QUEUE = 0;
    private static final int TAB_LYRICS = 1;

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
    private float leftInsetPx;
    private float statusBarInsetPx;
    private float rightInsetPx;
    private float navBarInsetPx;
    private boolean isPreviewInstance;

    // Responsive Tablet / Desktop layout state
    private int layoutMode = PlayerDesktopLayoutSolver.MODE_PHONE_PORTRAIT;
    private int lastLayoutMode = -1;
    private boolean desktopCompactHeight;
    private boolean desktopShowVolume;
    private boolean desktopShowSourceChip;
    private boolean desktopPanelOpen = true;
    private float desktopPanelReveal = 1f;
    private float desktopPanelRevealVel = 0f;
    private int desktopPanelTab = TAB_QUEUE;
    private float desktopTabFrac = 0f; // 0 = Play Queue, 1 = Lyrics
    private float desktopTabVel = 0f;
    private final DesktopQueuePanelRenderer desktopQueueRenderer;
    private long lastQueueRefreshMs = 0L;
    private String audioStreamSpec = "";
    private long lastSpecRefreshMs = 0L;
    private String lastAutoLyricsRequestKey = "";

    private final AudioManager audioManager;
    private float volumeFraction = 0.7f;
    private boolean isDraggingVolume;
    private int preMuteVolumeStep = -1;
    private long lastVolumeSyncMs = 0L;

    private boolean isScrollingQueue;
    private long lastQueueMoveMs = 0L;

    private final PlayerDesktopLayoutSolver.DesktopLayoutResult desktopLayout =
            new PlayerDesktopLayoutSolver.DesktopLayoutResult();
    private final PlayerDesktopLayoutSolver.TabletPortraitMetrics tabletPortraitMetrics =
            new PlayerDesktopLayoutSolver.TabletPortraitMetrics();

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
    private long lastExpansionAnimMs = 0L;

    // Per-button press springs (0 = rest, 1 = pressed)
    private int activeHitTarget = HIT_NONE;
    private final float[] buttonPress = new float[HIT_COUNT];
    private final float[] buttonPressVel = new float[HIT_COUNT];

    // Expressive transport button expand + neighbor push-back springs (0=Prev, 1=Play, 2=Next)
    private final float[] transportExpand = new float[3];
    private final float[] transportExpandVel = new float[3];
    private final long[] transportTapHoldUntilMs = new long[3];

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
    private float[] nativeLyricBlurPx;
    private RenderNode[] nativeBlurNodes;
    private float[] nativeAppliedBlurPx;
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
    private String[] lastLayoutSourceLines;

    // Syllable-synced karaoke lyrics engine
    private final SyllablePlaybackClock syllableClock = new SyllablePlaybackClock();
    private final SyllableLyricsRenderer syllableRenderer;
    private SyllableLyricsDocument syllableDoc;
    private SyllableLyricsDocument externalLineLyricsDoc;
    private String[] extLyricLines;
    private long[] extLyricTimesMs;
    private int extHighlightedLyricIndex = -1;
    private String currentSyllableTrackKey = "";
    private String lastTrackedSongSig = "";
    private boolean isFetchingSyllables;
    private boolean localLyricsOpen;
    private float syllableCrossfade = 0f;
    private String trackId;
    private String albumTitle;
    private String trackIsrc;
    private long trackDurationMs = 0L;
    private String[] staleLyricsBeforeSkip;
    private long songChangedUptimeMs = 0L;
    private boolean staleNativeLyricsPending;

    // Song-aware waveform seekbar engine
    private final WaveformSeekbarRenderer waveformRenderer = new WaveformSeekbarRenderer();
    private String lastWaveformTrackKey = "";
    private String lastWaveformFetchedId = "";

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
    private final TextPaint sourceChipPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint tabLabelPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint dockTitlePaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint dockArtistPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
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
    private final RectF drawPrevRect = new RectF();
    private final RectF drawPlayRect = new RectF();
    private final RectF drawNextRect = new RectF();
    private final RectF tempRect = new RectF();

    // Desktop & Tablet layout rectangles
    private final RectF sourceChipRect = new RectF();
    private final RectF desktopPanelToggleRect = new RectF();
    private final RectF desktopPanelRect = new RectF();
    private final RectF desktopPanelHeaderRect = new RectF();
    private final RectF desktopTabQueueRect = new RectF();
    private final RectF desktopTabLyricsRect = new RectF();
    private final RectF desktopOpenFullQueueRect = new RectF();
    private final RectF desktopPanelBodyRect = new RectF();
    private final RectF desktopDockRect = new RectF();
    private final RectF desktopElapsedTimeRect = new RectF();
    private final RectF desktopDurationTimeRect = new RectF();
    private final RectF desktopVolumeIconRect = new RectF();
    private final RectF desktopVolumeSliderRect = new RectF();

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
    private final Drawable iconMaximize;
    private final Drawable iconMinimize;
    private final Drawable iconCloseSmall;

    public ExpressivePlayerView(Context context) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        this.scaledDensity = context.getResources().getDisplayMetrics().scaledDensity;
        this.syllableRenderer = new SyllableLyricsRenderer(this.density);
        this.desktopQueueRenderer = new DesktopQueuePanelRenderer(this.density, this::invalidate);
        AudioManager am = null;
        try {
            Object svc = context.getSystemService(Context.AUDIO_SERVICE);
            if (svc instanceof AudioManager) {
                am = (AudioManager) svc;
            }
        } catch (Throwable ignored) {
        }
        this.audioManager = am;
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

        sourceChipPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        sourceChipPaint.setTextSize(12f * density);

        tabLabelPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        tabLabelPaint.setTextSize(13f * density);
        tabLabelPaint.setTextAlign(Paint.Align.CENTER);

        dockTitlePaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        dockTitlePaint.setTextSize(15.5f * density);

        dockArtistPaint.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
        dockArtistPaint.setTextSize(13f * density);

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
        iconMaximize = loadTidalIcon(context, "ic_arrows_maximize_2_regular");
        iconMinimize = loadTidalIcon(context, "ic_arrows_minimize_2_regular");
        iconCloseSmall = loadTidalIcon(context, "ic_close_small");

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
        setWindowInsetsPx(0f, statusBarPx, 0f, navBarPx);
    }

    public void setWindowInsetsPx(float leftPx, float topPx, float rightPx, float bottomPx) {
        this.leftInsetPx = Math.max(0f, leftPx);
        this.statusBarInsetPx = Math.max(20f * density, topPx);
        this.rightInsetPx = Math.max(0f, rightPx);
        this.navBarInsetPx = Math.max(14f * density, bottomPx);
    }

    private void syncVolumeFromSystem(boolean force) {
        if (audioManager == null || isDraggingVolume) {
            return;
        }
        long now = SystemClock.uptimeMillis();
        if (!force && (now - lastVolumeSyncMs) < 500L) {
            return;
        }
        lastVolumeSyncMs = now;
        try {
            int max = audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
            int cur = audioManager.getStreamVolume(AudioManager.STREAM_MUSIC);
            if (max > 0) {
                volumeFraction = Math.max(0f, Math.min(1f, cur / (float) max));
            }
        } catch (Throwable ignored) {
        }
    }

    private void setVolumeFromFraction(float frac) {
        float clamped = Math.max(0f, Math.min(1f, frac));
        volumeFraction = clamped;
        if (audioManager == null) {
            return;
        }
        try {
            int max = audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
            if (max > 0) {
                int targetStep = Math.round(clamped * max);
                int curStep = audioManager.getStreamVolume(AudioManager.STREAM_MUSIC);
                if (targetStep != curStep) {
                    audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, targetStep, 0);
                    performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                }
                if (targetStep > 0) {
                    preMuteVolumeStep = targetStep;
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private void toggleVolumeMute() {
        if (audioManager == null) {
            return;
        }
        try {
            int max = audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
            int cur = audioManager.getStreamVolume(AudioManager.STREAM_MUSIC);
            if (max <= 0) {
                return;
            }
            if (cur > 0) {
                preMuteVolumeStep = cur;
                audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, 0, 0);
                volumeFraction = 0f;
            } else {
                int restore = preMuteVolumeStep > 0 ? Math.min(max, preMuteVolumeStep) : Math.max(1, max / 2);
                audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, restore, 0);
                volumeFraction = restore / (float) max;
            }
            performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
        } catch (Throwable ignored) {
        }
    }

    private void refreshDesktopQueueAndSpec(boolean force) {
        if (isPreviewInstance) {
            return;
        }
        long now = SystemClock.uptimeMillis();
        if (force || (now - lastQueueRefreshMs) >= 1500L) {
            lastQueueRefreshMs = now;
            DesktopQueuePanelRenderer.QueueSnapshot snap = ExpressivePlayerBridge.fetchPlayQueueSnapshot(80);
            if (snap != null) {
                desktopQueueRenderer.setSnapshot(snap, sourceName);
            }
        }
        if (force || (now - lastSpecRefreshMs) >= 1800L) {
            lastSpecRefreshMs = now;
            String rawSpec = ExpressivePlayerBridge.getAudioStreamSpecRaw();
            String formatted = PlayerDesktopLayoutSolver.formatAudioStreamSpec(rawSpec);
            audioStreamSpec = formatted != null ? formatted : "";
        }
    }

    private String getDesktopQualityLabel() {
        String badgeUpper = badgeText != null ? badgeText.trim().toUpperCase(Locale.US) : "";
        String spec = audioStreamSpec != null ? audioStreamSpec.trim() : "";
        if (!badgeUpper.isEmpty() && !spec.isEmpty()) {
            if ("DOLBY ATMOS".equals(badgeUpper)) {
                return badgeUpper;
            }
            return badgeUpper + " · " + spec;
        }
        if (!badgeUpper.isEmpty()) {
            return badgeUpper;
        }
        return spec;
    }

    private boolean isLyricsTargetOpen() {
        if (layoutMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE) {
            return desktopPanelOpen && desktopPanelTab == TAB_LYRICS;
        }
        return isEffectiveLyricsVisible();
    }

    private boolean isLyricsCanvasVisible() {
        if (layoutMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE) {
            return desktopPanelReveal > 0.02f && desktopTabFrac > 0.02f;
        }
        return lyricsReveal > 0.02f;
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
        maybeScheduleWaveformFetch();

        if (miniCoverId != null && !miniCoverId.isEmpty()) {
            this.coverId = miniCoverId;
            Bitmap hiRes = HI_RES_ART_CACHE.get(miniCoverId);
            Bitmap miniArt = ExpressiveMiniPlayerView.getCachedArtwork(miniCoverId);
            Bitmap bestCover = hiRes != null ? hiRes : miniArt;
            Bitmap blurred = BLUR_ART_CACHE.get(miniCoverId);
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
            if (hiRes == null || blurred == null) {
                if (hiRes != null && blurred == null) {
                    prewarmArtwork(miniCoverId);
                } else {
                    loadCoverAndBlurAsync(miniCoverId);
                }
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
        this.trackId = src.trackId;
        this.albumTitle = src.albumTitle;
        this.trackIsrc = src.trackIsrc;
        this.trackDurationMs = src.trackDurationMs;
        this.staleLyricsBeforeSkip = null;
        this.songChangedUptimeMs = 0L;
        this.staleNativeLyricsPending = false;
        this.syllableDoc = src.syllableDoc;
        this.externalLineLyricsDoc = src.externalLineLyricsDoc;
        this.extLyricLines = src.extLyricLines;
        this.extLyricTimesMs = src.extLyricTimesMs;
        this.extHighlightedLyricIndex = src.extHighlightedLyricIndex;
        this.currentSyllableTrackKey = src.currentSyllableTrackKey;
        this.lastTrackedSongSig = src.lastTrackedSongSig;
        this.isFetchingSyllables = src.isFetchingSyllables;
        this.localLyricsOpen = src.localLyricsOpen;
        this.syllableCrossfade = src.syllableCrossfade;
        this.syllableClock.copyFrom(src.syllableClock);
        this.syllableRenderer.setDocument(src.syllableDoc);
        this.waveformRenderer.copyStateFrom(src.waveformRenderer);
        this.lastWaveformTrackKey = src.lastWaveformTrackKey;
        this.lastWaveformFetchedId = src.lastWaveformFetchedId;

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
        this.bgBreathPhase = src.bgBreathPhase;
        this.shuffleFrac = src.shuffleFrac;
        this.repeatFrac = src.repeatFrac;
        this.favoriteFrac = src.favoriteFrac;
        this.broadcastFrac = src.broadcastFrac;
        for (int i = 0; i < 3; i++) {
            this.transportExpand[i] = 0f;
            this.transportExpandVel[i] = 0f;
            this.transportTapHoldUntilMs[i] = 0L;
        }
        this.leftInsetPx = src.leftInsetPx;
        this.statusBarInsetPx = src.statusBarInsetPx;
        this.rightInsetPx = src.rightInsetPx;
        this.navBarInsetPx = src.navBarInsetPx;
        this.desktopPanelOpen = src.desktopPanelOpen;
        this.desktopPanelReveal = src.desktopPanelReveal;
        this.desktopPanelTab = src.desktopPanelTab;
        this.desktopTabFrac = src.desktopTabFrac;
        this.audioStreamSpec = src.audioStreamSpec;
        this.volumeFraction = src.volumeFraction;

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
            leftInsetPx = Math.max(bars.left, nav.left);
            rightInsetPx = Math.max(bars.right, nav.right);
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
        updateStateInternal(
                newTitle, newArtist, newCoverId, newPlayState, newRepeatMode, newBadgeText,
                newProgressTime, newDurationTime, newSourceName, newProgress,
                newIsExplicit, newIsShuffleOn, newIsNextEnabled, newIsFavorite,
                newShowLyricsButton, newIsBroadcastConnected, newIsLyricsVisible,
                newIsLyricsLoading, newIsLyricsSynced, newLyricLines, newLyricTimesMs,
                newHighlightedLyricIndex, false, null, null, null, 0L
        );
    }

    public void updateStateWithTrackMeta(
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
            int newHighlightedLyricIndex,
            String newTrackId,
            String newAlbumTitle,
            String newIsrc,
            long newTrackDurMs
    ) {
        updateStateInternal(
                newTitle, newArtist, newCoverId, newPlayState, newRepeatMode, newBadgeText,
                newProgressTime, newDurationTime, newSourceName, newProgress,
                newIsExplicit, newIsShuffleOn, newIsNextEnabled, newIsFavorite,
                newShowLyricsButton, newIsBroadcastConnected, newIsLyricsVisible,
                newIsLyricsLoading, newIsLyricsSynced, newLyricLines, newLyricTimesMs,
                newHighlightedLyricIndex, true, newTrackId, newAlbumTitle, newIsrc, newTrackDurMs
        );
    }

    private void updateStateInternal(
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
            int newHighlightedLyricIndex,
            boolean hasTrackMeta,
            String newTrackId,
            String newAlbumTitle,
            String newIsrc,
            long newTrackDurMs
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

        String songSig = safeTitle.trim().toLowerCase(Locale.ROOT)
                + "|" + safeArtist.trim().toLowerCase(Locale.ROOT);
        boolean hasSongSig = !safeTitle.trim().isEmpty() && !safeArtist.trim().isEmpty();
        boolean trackIdWillChange = hasTrackMeta
                && newTrackId != null && !newTrackId.isEmpty()
                && this.trackId != null && !this.trackId.isEmpty()
                && !newTrackId.equals(this.trackId);
        boolean songChanged = (hasSongSig && !songSig.equals(this.lastTrackedSongSig))
                || trackIdWillChange;

        boolean prevLyricsVisible = this.isLyricsVisible;
        boolean prevLyricsLoading = this.isLyricsLoading;
        boolean prevLyricsSynced = this.isLyricsSynced;
        String[] prevLyricLines = this.lyricLines;
        boolean wasEffectiveLyricsVisible = isEffectiveLyricsVisible()
                || (layoutMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE
                && desktopPanelOpen && desktopPanelTab == TAB_LYRICS);

        if (songChanged) {
            if (hasSongSig) {
                this.lastTrackedSongSig = songSig;
            }
            // Clear stale per-track metadata immediately so previous song's ISRC can never leak.
            this.trackId = null;
            this.albumTitle = null;
            this.trackIsrc = null;
            this.trackDurationMs = 0L;

            // Clear stale external/syllable lyrics & clock immediately.
            this.syllableDoc = null;
            this.externalLineLyricsDoc = null;
            this.extLyricLines = null;
            this.extLyricTimesMs = null;
            this.extHighlightedLyricIndex = -1;
            this.syllableRenderer.setDocument(null);
            this.syllableCrossfade = 0f;
            this.currentSyllableTrackKey = "";
            this.isFetchingSyllables = false;
            this.syllableClock.resetForNewTrack();

            // Clear previous native lyrics & reset scroll for the skipped song cleanly.
            this.staleLyricsBeforeSkip = (prevLyricLines != null && prevLyricLines.length > 0)
                    ? prevLyricLines
                    : null;
            this.songChangedUptimeMs = SystemClock.uptimeMillis();
            this.staleNativeLyricsPending = this.staleLyricsBeforeSkip != null;
            this.lyricLines = null;
            this.lyricTimesMs = null;
            this.highlightedLyricIndex = -1;
            this.lyricLineFocus = null;
            this.nativeLyricBlurPx = null;
            this.nativeBlurNodes = null;
            this.nativeAppliedBlurPx = null;
            this.lastLayoutLyricsWidth = 0;
            this.lastLayoutSourceLines = null;
            this.lyricsScrollY = 0f;
            this.targetLyricsScrollY = 0f;
            this.lyricsScrollVel = 0f;
            this.lyricsFlingVel = 0f;
            this.lastUserLyricsScrollMs = 0L;
            this.lyricsBrowseBoost = 0f;
            this.tappedLyricIndex = -1;
            this.tappedLyricFlash = 0f;

            if (newIsLyricsVisible) {
                this.localLyricsOpen = false;
            } else if (wasEffectiveLyricsVisible && !newShowLyricsButton) {
                // Stay in Lyrics View across skips when the new track lacks TIDAL native lyrics.
                this.localLyricsOpen = true;
            }
        }

        boolean resolvedLyricsLoading = newIsLyricsLoading;
        String[] resolvedLyricLines = newLyricLines;
        long[] resolvedLyricTimesMs = newLyricTimesMs;
        int resolvedHighlightedIdx = newHighlightedLyricIndex;

        if (newIsLyricsVisible) {
            this.localLyricsOpen = false;
            if (resolvedLyricsLoading || resolvedLyricLines == null || resolvedLyricLines.length == 0) {
                if (resolvedLyricsLoading) {
                    this.staleLyricsBeforeSkip = null;
                    this.staleNativeLyricsPending = false;
                } else if (this.staleNativeLyricsPending
                        && (SystemClock.uptimeMillis() - this.songChangedUptimeMs) >= 1200L) {
                    this.staleLyricsBeforeSkip = null;
                    this.staleNativeLyricsPending = false;
                }
                resolvedLyricLines = null;
                resolvedLyricTimesMs = null;
                resolvedHighlightedIdx = -1;
            } else if (this.staleLyricsBeforeSkip != null
                    && arraysEqual(resolvedLyricLines, this.staleLyricsBeforeSkip)
                    && (SystemClock.uptimeMillis() - this.songChangedUptimeMs) < 1200L) {
                // Suppress transient previous-song native emission right after skipping tracks.
                this.staleNativeLyricsPending = true;
                resolvedLyricsLoading = true;
                resolvedLyricLines = null;
                resolvedLyricTimesMs = null;
                resolvedHighlightedIdx = -1;
            } else {
                this.staleLyricsBeforeSkip = null;
                this.staleNativeLyricsPending = false;
            }
        } else {
            this.staleLyricsBeforeSkip = null;
            this.staleNativeLyricsPending = false;
        }

        boolean lyricsOpening = !prevLyricsVisible && newIsLyricsVisible;
        boolean lyricsLinesChanged = newIsLyricsVisible && !arraysEqual(prevLyricLines, resolvedLyricLines);
        boolean lyricsContentChanged = prevLyricsVisible != newIsLyricsVisible
                || prevLyricsLoading != resolvedLyricsLoading
                || prevLyricsSynced != newIsLyricsSynced
                || lyricsLinesChanged;
        boolean highlightChanged = this.highlightedLyricIndex != resolvedHighlightedIdx;

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
        this.isLyricsLoading = resolvedLyricsLoading;
        this.isLyricsSynced = newIsLyricsSynced;
        if (newIsLyricsVisible) {
            this.lyricLines = resolvedLyricLines;
            this.lyricTimesMs = resolvedLyricTimesMs;
            this.highlightedLyricIndex = resolvedHighlightedIdx;
        } else if (coverChanged && !songChanged) {
            this.lyricLines = null;
            this.lyricTimesMs = null;
            this.highlightedLyricIndex = -1;
            this.lyricLineFocus = null;
            this.nativeLyricBlurPx = null;
            this.nativeBlurNodes = null;
            this.nativeAppliedBlurPx = null;
            this.lastLayoutLyricsWidth = 0;
            this.lastLayoutSourceLines = null;
        }

        if (hasTrackMeta) {
            if (newTrackId != null && !newTrackId.isEmpty()) {
                boolean tidChanged = !newTrackId.equals(this.trackId);
                this.trackId = newTrackId;
                if (tidChanged) {
                    this.albumTitle = (newAlbumTitle != null && !newAlbumTitle.isEmpty()) ? newAlbumTitle : null;
                    this.trackIsrc = (newIsrc != null && !newIsrc.isEmpty()) ? newIsrc : null;
                } else {
                    if (newAlbumTitle != null && !newAlbumTitle.isEmpty()) {
                        this.albumTitle = newAlbumTitle;
                    }
                    if (newIsrc != null && !newIsrc.isEmpty()) {
                        this.trackIsrc = newIsrc;
                    }
                }
            }
            if (newTrackDurMs > 0L) {
                this.trackDurationMs = newTrackDurMs;
            }
        }

        long elapsedNow = SystemClock.elapsedRealtime();
        long fallbackDurMs = trackDurationMs > 0L ? trackDurationMs : parseDurationTextMs(this.durationTime);
        syllableClock.onFallbackProgress(this.serverProgress, fallbackDurMs, elapsedNow);
        syllableClock.onPlayStateChanged("PLAYING".equals(this.playState), elapsedNow);
        maybeScheduleSyllableFetch();
        maybeScheduleWaveformFetch();

        if (!springsInitialized) {
            springsInitialized = true;
            boolean playing = "PLAYING".equals(playState);
            playShapeMorph = playing ? 1f : 0f;
            coverScale = playing ? 1f : 0.945f;
            coverCornerMorph = playing ? 1f : 0f;
            waveAmpMorph = (playing && MaterialYouConfig.isPlayerSquigglySeekbarEnabled()) ? 1f : 0f;
            lyricsReveal = isEffectiveLyricsVisible() ? 1f : 0f;
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
                this.nativeLyricBlurPx = new float[this.lyricLines.length];
                this.nativeBlurNodes = null;
                this.nativeAppliedBlurPx = null;
                if (this.isLyricsSynced && this.highlightedLyricIndex >= 0
                        && this.highlightedLyricIndex < this.lyricLineFocus.length) {
                    this.lyricLineFocus[this.highlightedLyricIndex] = 1f;
                }
            } else {
                this.lyricLineFocus = null;
                this.nativeLyricBlurPx = null;
                this.nativeBlurNodes = null;
                this.nativeAppliedBlurPx = null;
            }
        }
        if ((lyricsContentChanged || highlightChanged) && isLyricsTargetOpen() && isEffectiveLyricsSynced()) {
            updateAutoLyricsScrollTarget();
        }

        if (layoutMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE) {
            if (lyricsOpening) {
                desktopPanelOpen = true;
                desktopPanelTab = TAB_LYRICS;
            }
            if (!isPreviewInstance && desktopPanelOpen && desktopPanelTab == TAB_LYRICS
                    && newShowLyricsButton && !newIsLyricsVisible
                    && hasSongSig && !songSig.equals(lastAutoLyricsRequestKey)) {
                lastAutoLyricsRequestKey = songSig;
                MAIN_HANDLER.post(() -> ExpressivePlayerBridge.dispatchSimpleEvent(
                        ExpressivePlayerBridge.ACTION_LYRICS));
            }
        }

        if (songChanged || coverChanged) {
            lastQueueRefreshMs = 0L;
            lastSpecRefreshMs = 0L;
        }
        if (!isPreviewInstance && layoutMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE
                && (songChanged || coverChanged || !desktopQueueRenderer.hasSnapshot())) {
            refreshDesktopQueueAndSpec(true);
        }

        if (coverChanged) {
            loadCoverAndBlurAsync(newCoverId);
        }

        startAnimationLoop();
        invalidate();
    }

    public void onNativeProgressMs(int posMs, int durMs, long elapsedMs, boolean forceSnap) {
        if (durMs > 0) {
            this.trackDurationMs = durMs;
        }
        syllableClock.onNativeProgressTick(posMs, durMs, elapsedMs, forceSnap);
        boolean waveformNeedsAnim = MaterialYouConfig.isPlayerWaveformSeekbarEnabled() && "PLAYING".equals(playState);
        if ((lyricsReveal > 0.01f || isLyricsCanvasVisible() || waveformNeedsAnim) && !isAnimating) {
            MAIN_HANDLER.post(() -> {
                if (isAttachedToWindow()) {
                    startAnimationLoop();
                }
            });
        }
        if (MaterialYouConfig.isPlayerWaveformSeekbarEnabled()
                && !isPreviewInstance
                && !waveformRenderer.isShowingRealAudio()
                && lastWaveformTrackKey.isEmpty()) {
            maybeScheduleWaveformFetch();
        }
    }

    public void updateTrackMetaForLyrics(
            String newTrackId,
            String newAlbumTitle,
            String newIsrc,
            long newDurMs
    ) {
        boolean isrcArrived = newIsrc != null && !newIsrc.isEmpty() && !newIsrc.equals(this.trackIsrc);
        boolean trackIdChanged = newTrackId != null && !newTrackId.isEmpty() && !newTrackId.equals(this.trackId);
        if (newTrackId != null && !newTrackId.isEmpty()) {
            this.trackId = newTrackId;
        }
        if (trackIdChanged) {
            this.albumTitle = (newAlbumTitle != null && !newAlbumTitle.isEmpty()) ? newAlbumTitle : null;
            this.trackIsrc = (newIsrc != null && !newIsrc.isEmpty()) ? newIsrc : null;
        } else {
            if (newAlbumTitle != null && !newAlbumTitle.isEmpty()) {
                this.albumTitle = newAlbumTitle;
            }
            if (newIsrc != null && !newIsrc.isEmpty()) {
                this.trackIsrc = newIsrc;
            }
        }
        if (newDurMs > 0L) {
            this.trackDurationMs = newDurMs;
            long elapsedNow = SystemClock.elapsedRealtime();
            syllableClock.onFallbackProgress(this.serverProgress, newDurMs, elapsedNow);
        }
        if (trackIdChanged || isrcArrived) {
            maybeScheduleSyllableFetch();
            maybeScheduleWaveformFetch();
        }
    }

    private void maybeScheduleWaveformFetch() {
        if (!MaterialYouConfig.isPlayerWaveformSeekbarEnabled()) {
            return;
        }
        String cleanId = trackId != null ? trackId.trim() : "";
        String songSig;
        if (!cleanId.isEmpty()) {
            songSig = "id:" + cleanId;
        } else if (!title.isEmpty() || !artist.isEmpty()) {
            songSig = title.trim().toLowerCase(Locale.ROOT)
                    + "|" + artist.trim().toLowerCase(Locale.ROOT);
        } else {
            return;
        }

        boolean keyChanged = !songSig.equals(lastWaveformTrackKey);
        boolean newlyGotId = !cleanId.isEmpty() && !cleanId.equals(lastWaveformFetchedId);
        if (!keyChanged && !newlyGotId) {
            return;
        }
        lastWaveformTrackKey = songSig;
        if (!cleanId.isEmpty()) {
            lastWaveformFetchedId = cleanId;
        }

        float[] cached = SongWaveformExtractor.getCachedEnvelope(cleanId, songSig);
        if (cached != null) {
            waveformRenderer.setTrackWaveform(songSig, cached, true, !isPreviewInstance);
            if (!isPreviewInstance && !isAnimating) {
                startAnimationLoop();
            }
            return;
        }

        if (keyChanged) {
            float[] placeholder = SongWaveformAnalyzer.generateSeededPlaceholder(
                    songSig, SongWaveformAnalyzer.CANONICAL_BINS);
            waveformRenderer.setTrackWaveform(songSig, placeholder, false, !isPreviewInstance);
            if (!isPreviewInstance && !isAnimating) {
                startAnimationLoop();
            }
        }

        if (isPreviewInstance) {
            return;
        }
        final String requestedSig = songSig;
        long durMs = trackDurationMs > 0L ? trackDurationMs : parseDurationTextMs(this.durationTime);
        SongWaveformExtractor.requestWaveform(
                getContext(),
                cleanId,
                songSig,
                title,
                durMs,
                true,
                (cbKey, canonical64, isReal) -> {
                    String expectedIdKey = (trackId != null && !trackId.trim().isEmpty())
                            ? "id:" + trackId.trim()
                            : "";
                    if (requestedSig.equals(lastWaveformTrackKey)
                            || (cbKey != null && (cbKey.equals(lastWaveformTrackKey)
                                    || (!expectedIdKey.isEmpty() && cbKey.equals(expectedIdKey))))) {
                        waveformRenderer.setTrackWaveform(
                                lastWaveformTrackKey, canonical64, isReal, true);
                        startAnimationLoop();
                    }
                });
    }

    private boolean isSyllableModeActive() {
        return MaterialYouConfig.isSyllableLyricsEnabled()
                && syllableDoc != null
                && syllableDoc.hasWordOrSyllableTiming
                && !syllableDoc.lines.isEmpty();
    }

    private boolean isExternalLineLyricsActive() {
        return MaterialYouConfig.isSyllableLyricsEnabled()
                && !isSyllableModeActive()
                && extLyricLines != null
                && extLyricLines.length > 0
                && (!showLyricsButton || (isLyricsVisible && !isLyricsLoading))
                && (lyricLines == null || lyricLines.length == 0);
    }

    private String[] activeNativeLyricLines() {
        if (lyricLines != null && lyricLines.length > 0) {
            return lyricLines;
        }
        return isExternalLineLyricsActive() ? extLyricLines : null;
    }

    private long[] activeNativeLyricTimesMs() {
        if (lyricTimesMs != null && lyricTimesMs.length > 0) {
            return lyricTimesMs;
        }
        return isExternalLineLyricsActive() ? extLyricTimesMs : null;
    }

    private boolean isActiveNativeLyricsSynced() {
        if (lyricLines != null && lyricLines.length > 0) {
            return isLyricsSynced;
        }
        return isExternalLineLyricsActive();
    }

    private int activeNativeHighlightedIndex() {
        if (lyricLines != null && lyricLines.length > 0) {
            return highlightedLyricIndex;
        }
        return isExternalLineLyricsActive() ? extHighlightedLyricIndex : -1;
    }

    private static int findLineIndexForTimeMs(long[] timesMs, long posMs) {
        if (timesMs == null || timesMs.length == 0 || posMs < timesMs[0]) {
            return -1;
        }
        int lo = 0;
        int hi = timesMs.length - 1;
        int ans = 0;
        while (lo <= hi) {
            int mid = (lo + hi) >>> 1;
            if (timesMs[mid] <= posMs) {
                ans = mid;
                lo = mid + 1;
            } else {
                hi = mid - 1;
            }
        }
        return ans;
    }

    private boolean isEffectiveLyricsVisible() {
        return isLyricsVisible
                || (localLyricsOpen && (isSyllableModeActive() || isExternalLineLyricsActive() || isFetchingSyllables));
    }

    private boolean isEffectiveLyricsSynced() {
        return isSyllableModeActive() || isLyricsSynced || isExternalLineLyricsActive();
    }

    private boolean isEffectiveShowLyricsButton() {
        return showLyricsButton || isSyllableModeActive() || isExternalLineLyricsActive();
    }

    private boolean isEffectiveLyricsLoading() {
        if (isSyllableModeActive() || isExternalLineLyricsActive()) {
            return false;
        }
        boolean desktopLyricsActive = layoutMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE
                && desktopPanelTab == TAB_LYRICS;
        return isLyricsLoading || staleNativeLyricsPending
                || ((localLyricsOpen || desktopLyricsActive) && isFetchingSyllables);
    }

    private float activeTotalLyricsContentH() {
        return isSyllableModeActive() ? syllableRenderer.getTotalContentHeight() : totalLyricsContentH;
    }

    private void maybeScheduleSyllableFetch() {
        if (isPreviewInstance || !MaterialYouConfig.isSyllableLyricsEnabled()) {
            return;
        }
        if (title.isEmpty() || artist.isEmpty()) {
            return;
        }
        String songSig = title.trim().toLowerCase(Locale.ROOT)
                + "|" + artist.trim().toLowerCase(Locale.ROOT);
        boolean songChanged = !songSig.equals(lastTrackedSongSig);
        if (songChanged) {
            lastTrackedSongSig = songSig;
            trackId = null;
            albumTitle = null;
            trackIsrc = null;
            trackDurationMs = 0L;
            syllableDoc = null;
            externalLineLyricsDoc = null;
            extLyricLines = null;
            extLyricTimesMs = null;
            extHighlightedLyricIndex = -1;
            lastLayoutSourceLines = null;
            lastLayoutLyricsWidth = 0;
            syllableRenderer.setDocument(null);
            syllableCrossfade = 0f;
            syllableClock.resetForNewTrack();
            lastUserLyricsScrollMs = 0L;
            lyricsScrollY = 0f;
            targetLyricsScrollY = 0f;
            lyricsScrollVel = 0f;
            lyricsFlingVel = 0f;
        }

        long durMs = trackDurationMs > 0L ? trackDurationMs : parseDurationTextMs(durationTime);
        int durSec = durMs > 0L ? (int) Math.round(durMs / 1000.0) : -1;
        String reqKey = SyllableLyricsFetcher.buildRequestKey(trackId, title, artist, durSec);
        if (reqKey.equals(currentSyllableTrackKey)) {
            return;
        }
        currentSyllableTrackKey = reqKey;

        SyllableLyricsDocument instant = SyllableLyricsFetcher.peekCached(reqKey, title, artist, durSec);
        if (instant != null && (instant.hasWordOrSyllableTiming || trackIsrc == null || trackIsrc.isEmpty())) {
            applySyllableDocument(instant);
            return;
        }
        if (instant != null) {
            applySyllableDocument(instant);
        }

        isFetchingSyllables = true;
        final String requestedKey = reqKey;
        SyllableLyricsFetcher.fetchAsync(
                trackId,
                title,
                artist,
                albumTitle,
                trackIsrc,
                durSec,
                (cbKey, doc) -> {
                    if (!requestedKey.equals(currentSyllableTrackKey)) {
                        return;
                    }
                    isFetchingSyllables = false;
                    if (doc != null) {
                        applySyllableDocument(doc);
                    } else {
                        if (localLyricsOpen && !isLyricsVisible && !isExternalLineLyricsActive()) {
                            localLyricsOpen = false;
                        }
                        startAnimationLoop();
                        invalidate();
                    }
                }
        );
    }

    private void applySyllableDocument(SyllableLyricsDocument doc) {
        if (doc != null && doc.hasWordOrSyllableTiming && !doc.lines.isEmpty()) {
            this.syllableDoc = doc;
            this.externalLineLyricsDoc = null;
            this.extLyricLines = null;
            this.extLyricTimesMs = null;
            this.extHighlightedLyricIndex = -1;
            this.syllableRenderer.setDocument(doc);
            this.syllableCrossfade = (isLyricsTargetOpen() || isLyricsCanvasVisible()) ? 0f : 1f;
            this.lastUserLyricsScrollMs = 0L;

            if (lyricsViewportRect.width() > 10f && lyricsViewportRect.height() > 10f) {
                float padH = 24f * density;
                int contentW = Math.max(80, Math.round(lyricsViewportRect.width() - padH * 2f));
                syllableRenderer.ensureLayout(contentW, lyricsViewportRect.height());
                boolean playing = "PLAYING".equals(playState);
                long posMs = syllableClock.getInterpolatedPositionMs(
                        SystemClock.elapsedRealtime(), playing, isScrubbing, scrubProgress);
                syllableRenderer.stepPhysics(posMs, playing, lyricsBrowseBoost, 0f, 0.016f);
                syllableRenderer.consumeActiveLineChanged();
                if (!isLyricsCanvasVisible()) {
                    targetLyricsScrollY = computeAutoLyricsScrollY();
                    lyricsScrollY = targetLyricsScrollY;
                } else {
                    updateAutoLyricsScrollTarget();
                }
            }
            startAnimationLoop();
            invalidate();
            return;
        }

        if (doc != null && doc.isLineSynced && !doc.lines.isEmpty()) {
            this.syllableDoc = null;
            this.syllableRenderer.setDocument(null);
            this.externalLineLyricsDoc = doc;
            int n = doc.lines.size();
            String[] lines = new String[n];
            long[] times = new long[n];
            for (int i = 0; i < n; i++) {
                SyllableLyricsModels.LyricLineData ld = doc.lines.get(i);
                lines[i] = ld.fullText;
                times[i] = ld.startMs;
            }
            this.extLyricLines = lines;
            this.extLyricTimesMs = times;

            boolean playing = "PLAYING".equals(playState);
            long posMs = syllableClock.getInterpolatedPositionMs(
                    SystemClock.elapsedRealtime(), playing, isScrubbing, scrubProgress);
            this.extHighlightedLyricIndex = findLineIndexForTimeMs(times, posMs + 80L);
            this.lastLayoutLyricsWidth = 0;
            this.lastLayoutSourceLines = null;
            this.lyricLineFocus = new float[n];
            this.nativeLyricBlurPx = new float[n];
            this.nativeBlurNodes = null;
            this.nativeAppliedBlurPx = null;
            if (this.extHighlightedLyricIndex >= 0 && this.extHighlightedLyricIndex < n) {
                this.lyricLineFocus[this.extHighlightedLyricIndex] = 1f;
            }
            this.lastUserLyricsScrollMs = 0L;

            if (isExternalLineLyricsActive() && lyricsViewportRect.width() > 10f && lyricsViewportRect.height() > 10f) {
                float padH = 24f * density;
                int contentW = Math.max(80, Math.round(lyricsViewportRect.width() - padH * 2f));
                ensureLyricsLayouts(contentW);
            }
            startAnimationLoop();
            invalidate();
        }
    }

    private static long parseDurationTextMs(String text) {
        if (text == null) {
            return 0L;
        }
        String trimmed = text.trim();
        if (trimmed.isEmpty()) {
            return 0L;
        }
        try {
            String[] parts = trimmed.split(":");
            if (parts.length == 2) {
                long m = Long.parseLong(parts[0].trim());
                long s = Long.parseLong(parts[1].trim());
                return Math.max(0L, (m * 60L + s) * 1000L);
            }
            if (parts.length == 3) {
                long h = Long.parseLong(parts[0].trim());
                long m = Long.parseLong(parts[1].trim());
                long s = Long.parseLong(parts[2].trim());
                return Math.max(0L, (h * 3600L + m * 60L + s) * 1000L);
            }
        } catch (NumberFormatException ignored) {
        }
        return 0L;
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
        if (MaterialYouConfig.isPlayerWaveformSeekbarEnabled()) {
            if (waveformRenderer.step(dt, playing, isScrubbing, SongWaveformBridge.getLiveAudioLevel())) {
                settled = false;
            }
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

        // 5. Lyrics reveal & Desktop side-panel springs
        boolean effLyricsVis = isEffectiveLyricsVisible();
        boolean effLyricsLoad = isEffectiveLyricsLoading();
        boolean effLyricsSynced = isEffectiveLyricsSynced();
        boolean isDesktop = layoutMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE;

        float targetDesktopPanel = (isDesktop && desktopPanelOpen) ? 1f : 0f;
        res = stepSpring(desktopPanelReveal, desktopPanelRevealVel, targetDesktopPanel, 290f, 0.86f, dt);
        desktopPanelReveal = Math.max(0f, Math.min(1f, res[0]));
        desktopPanelRevealVel = res[1];
        if (!isSettled(desktopPanelReveal, desktopPanelRevealVel, targetDesktopPanel)) {
            settled = false;
        } else {
            desktopPanelReveal = targetDesktopPanel;
            desktopPanelRevealVel = 0f;
        }

        float targetDesktopTab = (desktopPanelTab == TAB_LYRICS) ? 1f : 0f;
        res = stepSpring(desktopTabFrac, desktopTabVel, targetDesktopTab, 340f, 0.84f, dt);
        desktopTabFrac = Math.max(0f, Math.min(1f, res[0]));
        desktopTabVel = res[1];
        if (!isSettled(desktopTabFrac, desktopTabVel, targetDesktopTab)) {
            settled = false;
        } else {
            desktopTabFrac = targetDesktopTab;
            desktopTabVel = 0f;
        }

        float targetLyrics = effLyricsVis ? 1f : 0f;
        res = stepSpring(lyricsReveal, lyricsRevealVel, targetLyrics, 280f, 0.86f, dt);
        lyricsReveal = Math.max(0f, Math.min(1f, res[0]));
        lyricsRevealVel = res[1];
        if (!isSettled(lyricsReveal, lyricsRevealVel, targetLyrics)) {
            settled = false;
        } else {
            lyricsReveal = targetLyrics;
            lyricsRevealVel = 0f;
            if (!effLyricsVis && (!isDesktop || desktopPanelTab != TAB_LYRICS)) {
                lyricsScrollY = 0f;
                targetLyricsScrollY = 0f;
                lyricsScrollVel = 0f;
                lyricsFlingVel = 0f;
                syncPillReveal = 0f;
                syncPillVel = 0f;
                tappedLyricIndex = -1;
                tappedLyricFlash = 0f;
                syllableRenderer.resetTransientState();
            }
        }

        boolean lyricsTargetOpen = isLyricsTargetOpen();
        boolean lyricsCanvasActive = isLyricsCanvasVisible();

        if (isDesktop && desktopPanelReveal > 0.02f && desktopTabFrac < 0.98f) {
            refreshDesktopQueueAndSpec(false);
            if (desktopQueueRenderer.stepPhysics(
                    dt, playing, isScrollingQueue, Math.max(1f, desktopPanelBodyRect.height()))) {
                settled = false;
            }
        } else if (isDesktop) {
            refreshDesktopQueueAndSpec(false);
        }
        if (isDesktop && desktopShowVolume) {
            syncVolumeFromSystem(false);
        }

        // 5b. Lyrics skeleton pulse, per-line focus transitions, syllable physics, browse boost & tap flash
        if (lyricsTargetOpen && effLyricsLoad && lyricsCanvasActive) {
            skeletonPulsePhase = (skeletonPulsePhase + 3.6f * dt) % ((float) (Math.PI * 2.0));
            settled = false;
        }

        if (isSyllableModeActive() && lyricsCanvasActive) {
            long sylPosMs = syllableClock.getInterpolatedPositionMs(
                    SystemClock.elapsedRealtime(), playing, isScrubbing, scrubProgress);
            if (syllableRenderer.stepPhysics(sylPosMs, playing, lyricsBrowseBoost, lyricsScrollVel, dt)) {
                settled = false;
            }
            if (syllableCrossfade < 1f) {
                syllableCrossfade = Math.min(1f, syllableCrossfade + dt / 0.26f);
                settled = false;
            }
            if (syllableRenderer.consumeActiveLineChanged()
                    && !isScrollingLyrics
                    && SystemClock.uptimeMillis() - lastUserLyricsScrollMs >= 2800L) {
                updateAutoLyricsScrollTarget();
            }
        }

        if (isExternalLineLyricsActive() && lyricsCanvasActive) {
            long extPosMs = syllableClock.getInterpolatedPositionMs(
                    SystemClock.elapsedRealtime(), playing, isScrubbing, scrubProgress);
            int nextIdx = findLineIndexForTimeMs(extLyricTimesMs, extPosMs + 80L);
            if (nextIdx != extHighlightedLyricIndex) {
                extHighlightedLyricIndex = nextIdx;
                if (!isScrollingLyrics
                        && SystemClock.uptimeMillis() - lastUserLyricsScrollMs >= 2800L) {
                    updateAutoLyricsScrollTarget();
                }
                settled = false;
            }
            if (playing) {
                settled = false;
            }
        }

        if (lyricLineFocus != null && lyricsCanvasActive) {
            float lineLerp = 1f - (float) Math.exp(-9.5 * dt);
            float blurSharpLerp = 1f - (float) Math.exp(-12.0 * dt);
            float blurSoftLerp = 1f - (float) Math.exp(-6.5 * dt);
            boolean nativeSynced = isActiveNativeLyricsSynced();
            int activeHilite = activeNativeHighlightedIndex();
            boolean nativeBlurOn = nativeSynced && MaterialYouConfig.isLyricsProgressiveBlurEnabled();
            float blurMult = MaterialYouConfig.getLyricsBlurMultiplier();
            float browseClear = 1f - Math.max(0f, Math.min(1f, lyricsBrowseBoost));

            if (nativeLyricBlurPx == null || nativeLyricBlurPx.length != lyricLineFocus.length) {
                nativeLyricBlurPx = new float[lyricLineFocus.length];
            }

            for (int i = 0; i < lyricLineFocus.length; i++) {
                float targetF = (nativeSynced && i == activeHilite) ? 1f : 0f;
                if (Math.abs(lyricLineFocus[i] - targetF) > 0.004f) {
                    lyricLineFocus[i] += (targetF - lyricLineFocus[i]) * lineLerp;
                    settled = false;
                } else {
                    lyricLineFocus[i] = targetF;
                }

                float targetBlur = 0f;
                if (nativeBlurOn && activeHilite >= 0) {
                    float baseDp = SyllableLyricsRenderer.computeProgressiveBlurDp(i - activeHilite);
                    targetBlur = baseDp * density * blurMult * (1f - lyricLineFocus[i]) * browseClear;
                }
                if (Math.abs(nativeLyricBlurPx[i] - targetBlur) > 0.08f) {
                    float bLerp = targetBlur < nativeLyricBlurPx[i] ? blurSharpLerp : blurSoftLerp;
                    nativeLyricBlurPx[i] += (targetBlur - nativeLyricBlurPx[i]) * bLerp;
                    settled = false;
                } else {
                    nativeLyricBlurPx[i] = targetBlur;
                }
            }
        }

        boolean userBrowsing = isScrollingLyrics
                || Math.abs(lyricsFlingVel) > 12f
                || (SystemClock.uptimeMillis() - lastUserLyricsScrollMs < 2800L);
        float targetBoost = (lyricsTargetOpen && (userBrowsing || !effLyricsSynced)) ? 1f : 0f;
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
        if (!isScrollingLyrics && lyricsCanvasActive) {
            float vpH = lyricsViewportRect.height() > 1f
                    ? lyricsViewportRect.height()
                    : Math.max(1f, getHeight() * 0.60f);
            float maxScroll = Math.max(0f, activeTotalLyricsContentH() - vpH);

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
                } else if (lyricsTargetOpen) {
                    if (effLyricsSynced && SystemClock.uptimeMillis() - lastUserLyricsScrollMs >= 2800L) {
                        updateAutoLyricsScrollTarget();
                    }
                    if (Math.abs(lyricsScrollY - targetLyricsScrollY) > 0.5f || Math.abs(lyricsScrollVel) > 1f) {
                        res = stepSpring(lyricsScrollY, lyricsScrollVel, targetLyricsScrollY, 128f, 0.86f, dt);
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
        String[] activeNativeLines = activeNativeLyricLines();
        boolean hasSyncedContent = isSyllableModeActive()
                || (isActiveNativeLyricsSynced()
                && activeNativeLines != null && activeNativeLines.length > 0
                && activeNativeHighlightedIndex() >= 0);
        boolean showSyncPill = lyricsTargetOpen
                && lyricsCanvasActive
                && effLyricsSynced
                && !effLyricsLoad
                && hasSyncedContent
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
            float targetP = (activeHitTarget == i && !isSwipingCover && !isScrollingLyrics
                    && !isScrollingQueue && !isDraggingVolume) ? 1f : 0f;
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

        // 9b. Transport button expand & neighbor push-back springs
        for (int i = 0; i < 3; i++) {
            int hitId = (i == 0) ? HIT_PREV : (i == 1 ? HIT_PLAY : HIT_NEXT);
            boolean enabled = (i != 2) || isNextEnabled;
            boolean fingerHolding = enabled && activeHitTarget == hitId
                    && !isSwipingCover && !isScrollingLyrics && !isScrollingQueue && !isDraggingVolume;
            boolean tapPeakHolding = enabled && now < transportTapHoldUntilMs[i];
            float targetExp = (fingerHolding || tapPeakHolding) ? 1f : 0f;
            if (tapPeakHolding) {
                settled = false;
            }
            if (tapPeakHolding || Math.abs(transportExpand[i] - targetExp) > 0.0015f
                    || Math.abs(transportExpandVel[i]) > 0.008f) {
                float stiff = targetExp > 0.5f ? 520f : 340f;
                float damp = targetExp > 0.5f ? 0.68f : 0.56f;
                res = stepSpring(transportExpand[i], transportExpandVel[i], targetExp, stiff, damp, dt);
                transportExpand[i] = Math.max(-0.18f, Math.min(1.22f, res[0]));
                transportExpandVel[i] = res[1];
                if (tapPeakHolding
                        || Math.abs(transportExpand[i] - targetExp) > 0.0015f
                        || Math.abs(transportExpandVel[i]) > 0.008f) {
                    settled = false;
                } else {
                    transportExpand[i] = targetExp;
                    transportExpandVel[i] = 0f;
                }
            } else {
                transportExpand[i] = targetExp;
                transportExpandVel[i] = 0f;
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

    private static float easeOutQuart(float t) {
        float inv = 1f - Math.max(0f, Math.min(1f, t));
        float sq = inv * inv;
        return 1f - sq * sq;
    }

    private static float easeOutQuint(float t) {
        float inv = 1f - Math.max(0f, Math.min(1f, t));
        float sq = inv * inv;
        return 1f - sq * sq * inv;
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
        int nextMode = PlayerDesktopLayoutSolver.resolveLayoutMode(
                w / density,
                h / density,
                MaterialYouConfig.isPlayerTabletDesktopLayoutEnabled()
        );
        layoutMode = nextMode;
        if (nextMode != lastLayoutMode) {
            if (nextMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE) {
                desktopPanelReveal = desktopPanelOpen ? 1f : 0f;
                desktopPanelRevealVel = 0f;
                if (isEffectiveLyricsVisible()) {
                    desktopPanelTab = TAB_LYRICS;
                }
                desktopTabFrac = desktopPanelTab == TAB_LYRICS ? 1f : 0f;
                desktopTabVel = 0f;
                refreshDesktopQueueAndSpec(true);
                syncVolumeFromSystem(true);
            }
            lastLayoutMode = nextMode;
            lastLayoutLyricsWidth = 0;
            syllableRenderer.invalidateLayout();
        }

        if (nextMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE) {
            computeDesktopLandscapeLayout(w, h);
        } else if (nextMode == PlayerDesktopLayoutSolver.MODE_TABLET_PORTRAIT) {
            computeTabletPortraitLayout(w, h);
        } else {
            computePhonePortraitLayout(w, h);
        }
    }

    private void computePhonePortraitLayout(int w, int h) {
        sourceChipRect.setEmpty();
        desktopShowSourceChip = false;
        desktopShowVolume = false;
        desktopCompactHeight = false;

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

        float seekTouchH = MaterialYouConfig.isPlayerWaveformSeekbarEnabled() ? 38f * density : 30f * density;
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
        if (isEffectiveShowLyricsButton()) {
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

    private void computeTabletPortraitLayout(int w, int h) {
        desktopShowVolume = false;
        desktopCompactHeight = false;

        PlayerDesktopLayoutSolver.computeTabletPortraitMetrics(
                w, h, density,
                leftInsetPx, statusBarInsetPx, rightInsetPx, navBarInsetPx,
                tabletPortraitMetrics
        );
        PlayerDesktopLayoutSolver.TabletPortraitMetrics m = tabletPortraitMetrics;

        float topY = statusBarInsetPx + 12f * density;
        float botY = h - navBarInsetPx - 18f * density;
        float usableH = Math.max(460f * density, botY - topY);
        float compact = Math.max(0.75f, Math.min(1f, usableH / (760f * density)));

        // 1. Wide centered Header Bar (up to 720dp)
        float headerH = 44f * density;
        collapseRect.set(m.headerLeft, topY, m.headerLeft + headerH, topY + headerH);

        float splitBtnW = 48f * density;
        float splitGap = 3f * density;
        queueRect.set(m.headerRight - splitBtnW, topY, m.headerRight, topY + headerH);
        castRect.set(queueRect.left - splitGap - splitBtnW, topY, queueRect.left - splitGap, topY + headerH);

        String cleanSource = sourceName != null ? sourceName.trim() : "";
        if (m.showSourceChip && !cleanSource.isEmpty()) {
            String sourceLabel = ("de".equals(Locale.getDefault().getLanguage()) ? "Aus: " : "Playing from ") + cleanSource;
            float srcLeft = collapseRect.right + 128f * density;
            float maxSrcRight = castRect.left - 12f * density;
            float availSrcW = maxSrcRight - srcLeft;
            if (availSrcW >= 96f * density) {
                float chipW = Math.min(availSrcW, Math.max(96f * density, sourceChipPaint.measureText(sourceLabel) + 26f * density));
                float chipH = 32f * density;
                sourceChipRect.set(srcLeft, collapseRect.centerY() - chipH * 0.5f,
                        srcLeft + chipW, collapseRect.centerY() + chipH * 0.5f);
                desktopShowSourceChip = true;
            } else {
                sourceChipRect.setEmpty();
                desktopShowSourceChip = false;
            }
        } else {
            sourceChipRect.setEmpty();
            desktopShowSourceChip = false;
        }

        // 2. Centered Bottom 3-Segment Floating Capsule (capped at 440dp)
        float capsuleH = 62f * density;
        bottomCapsuleRect.set(m.capsuleLeft, botY - capsuleH, m.capsuleRight, botY);
        float capPad = 4.5f * density;
        float segGap = 3.5f * density;
        float innerCapW = bottomCapsuleRect.width() - capPad * 2f;
        float segW = (innerCapW - segGap * 2f) / 3f;
        float segTop = bottomCapsuleRect.top + capPad;
        float segBot = bottomCapsuleRect.bottom - capPad;
        shuffleRect.set(bottomCapsuleRect.left + capPad, segTop, bottomCapsuleRect.left + capPad + segW, segBot);
        repeatRect.set(shuffleRect.right + segGap, segTop, shuffleRect.right + segGap + segW, segBot);
        favoriteRect.set(repeatRect.right + segGap, segTop, bottomCapsuleRect.right - capPad, segBot);

        // 3. Primary Transport Controls Row (generous tablet sizing)
        float transportGapBot = 24f * density * compact;
        float transportH = 72f * density;
        float transportBot = bottomCapsuleRect.top - transportGapBot;
        float transportTop = transportBot - transportH;
        float playW = 108f * density;
        float sideW = 90f * density;
        float transGap = 14f * density;
        float cx = (m.contentLeft + m.contentRight) * 0.5f;

        playBtnRect.set(cx - playW * 0.5f, transportTop, cx + playW * 0.5f, transportBot);
        prevBtnRect.set(playBtnRect.left - transGap - sideW, transportTop, playBtnRect.left - transGap, transportBot);
        nextBtnRect.set(playBtnRect.right + transGap, transportTop, playBtnRect.right + transGap + sideW, transportBot);

        // 4. Seekbar + Time/Quality Metadata Row (centered editorial column up to 540dp)
        float seekToTransGap = 20f * density * compact;
        float metaH = 26f * density;
        float metaBot = transportTop - seekToTransGap;
        float metaTop = metaBot - metaH;
        npMetaRect.set(m.contentLeft, metaTop, m.contentRight, metaBot);

        float seekTouchH = MaterialYouConfig.isPlayerWaveformSeekbarEnabled() ? 40f * density : 30f * density;
        float seekBot = metaTop - 2f * density;
        seekBarTouchRect.set(m.contentLeft, seekBot - seekTouchH, m.contentRight, seekBot);

        float badgeW = Math.max(92f * density, badgePaint.measureText(badgeText.toUpperCase(Locale.US)) + 26f * density);
        badgeRect.set(cx - badgeW * 0.5f, metaTop + 1f * density, cx + badgeW * 0.5f, metaBot - 1f * density);

        // 5. Track Info + [Lyrics | More] Connected Split Pills
        float infoToSeekGap = 14f * density * compact;
        float infoH = 60f * density;
        float infoBot = seekBarTouchRect.top - infoToSeekGap;
        float infoTop = infoBot - infoH;
        float infoCenterY = (infoTop + infoBot) * 0.5f;
        float midSplitH = 44f * density;

        moreBtnRect.set(m.contentRight - splitBtnW, infoCenterY - midSplitH * 0.5f,
                m.contentRight, infoCenterY + midSplitH * 0.5f);
        if (isEffectiveShowLyricsButton()) {
            lyricsBtnRect.set(moreBtnRect.left - splitGap - splitBtnW, moreBtnRect.top,
                    moreBtnRect.left - splitGap, moreBtnRect.bottom);
            titleAreaRect.set(m.contentLeft, infoTop, lyricsBtnRect.left - 12f * density, infoBot);
        } else {
            lyricsBtnRect.set(0f, 0f, 0f, 0f);
            titleAreaRect.set(m.contentLeft, infoTop, moreBtnRect.left - 12f * density, infoBot);
        }

        // 6. Hero Cover Squircle (capped at 440dp centered)
        float headerToCoverGap = 20f * density * compact;
        float coverToInfoGap = 20f * density * compact;
        float availCoverTop = collapseRect.bottom + headerToCoverGap;
        float availCoverBot = infoTop - coverToInfoGap;
        float availCoverH = Math.max(160f * density, availCoverBot - availCoverTop);
        float availCoverW = m.contentRight - m.contentLeft;
        float coverSize = Math.min(m.maxCoverSize, Math.min(availCoverW, availCoverH));
        float coverTop = availCoverTop + (availCoverH - coverSize) * 0.5f;
        coverRect.set(cx - coverSize * 0.5f, coverTop, cx + coverSize * 0.5f, coverTop + coverSize);

        // 7. Full-Screen Lyrics Target Layout (centered reading measure up to 620dp)
        float lLeft = m.lyricsColLeft;
        float lRight = m.lyricsColRight;
        float lCx = (lLeft + lRight) * 0.5f;

        float miniSize = 46f * density;
        lyricsMiniCoverRect.set(lLeft, topY + 1f * density, lLeft + miniSize, topY + 1f * density + miniSize);
        float closeSize = 42f * density;
        lyricsCloseRect.set(lRight - closeSize, topY + 3f * density, lRight, topY + 3f * density + closeSize);
        lyricsHeaderTitleRect.set(lyricsMiniCoverRect.right + 12f * density, topY,
                lyricsCloseRect.left - 12f * density, topY + 48f * density);

        float lTransH = 60f * density;
        float lTransBot = botY;
        float lTransTop = lTransBot - lTransH;
        float lPlayW = 92f * density;
        float lSideW = 76f * density;
        float lTransGap = 12f * density;
        lyricsPlayRect.set(lCx - lPlayW * 0.5f, lTransTop, lCx + lPlayW * 0.5f, lTransBot);
        lyricsPrevRect.set(lyricsPlayRect.left - lTransGap - lSideW, lTransTop, lyricsPlayRect.left - lTransGap, lTransBot);
        lyricsNextRect.set(lyricsPlayRect.right + lTransGap, lTransTop, lyricsPlayRect.right + lTransGap + lSideW, lTransBot);

        float lMetaH = 18f * density;
        float lMetaBot = lTransTop - 10f * density;
        float lMetaTop = lMetaBot - lMetaH;
        lyricsMetaRect.set(lLeft, lMetaTop, lRight, lMetaBot);

        float lSeekH = 28f * density;
        float lSeekBot = lMetaTop - 2f * density;
        lyricsSeekRect.set(lLeft, lSeekBot - lSeekH, lRight, lSeekBot);

        float vpTop = lyricsMiniCoverRect.bottom + 12f * density;
        float vpBot = lyricsSeekRect.top - 10f * density;
        lyricsViewportRect.set(lLeft, vpTop, lRight, Math.max(vpTop + 140f * density, vpBot));

        float pillW = Math.max(94f * density, syncPillPaint.measureText("Sync") + 38f * density);
        float pillH = 36f * density;
        lyricsSyncPillRect.set(
                lRight - 24f * density - pillW,
                lyricsViewportRect.bottom - 12f * density - pillH,
                lRight - 24f * density,
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

    private void computeDesktopLandscapeLayout(int w, int h) {
        String qualityLabel = getDesktopQualityLabel();
        float measuredBadgeW = qualityLabel.isEmpty()
                ? 0f
                : (badgePaint.measureText(qualityLabel) + 24f * density);

        String cleanSource = sourceName != null ? sourceName.trim() : "";
        boolean hasSource = !cleanSource.isEmpty();
        String sourceLabel = hasSource
                ? (("de".equals(Locale.getDefault().getLanguage()) ? "Aus: " : "Playing from ") + cleanSource)
                : "";
        float measuredSourceW = hasSource
                ? (sourceChipPaint.measureText(sourceLabel) + 28f * density)
                : 0f;
        float measuredSyncW = syncPillPaint.measureText("Sync") + 38f * density;

        PlayerDesktopLayoutSolver.computeDesktopLandscape(
                w, h, density,
                leftInsetPx, statusBarInsetPx, rightInsetPx, navBarInsetPx,
                easeInOutCubic(desktopPanelReveal),
                isEffectiveShowLyricsButton(),
                hasSource,
                measuredBadgeW,
                measuredSourceW,
                measuredSyncW,
                desktopLayout
        );

        copyBox(desktopLayout.collapseBox, collapseRect);
        copyBox(desktopLayout.sourceChipBox, sourceChipRect);
        copyBox(desktopLayout.panelToggleBox, desktopPanelToggleRect);
        copyBox(desktopLayout.moreBox, moreBtnRect);
        copyBox(desktopLayout.coverBox, coverRect);
        copyBox(desktopLayout.panelBox, desktopPanelRect);
        copyBox(desktopLayout.panelHeaderBox, desktopPanelHeaderRect);
        copyBox(desktopLayout.tabQueueBox, desktopTabQueueRect);
        copyBox(desktopLayout.tabLyricsBox, desktopTabLyricsRect);
        copyBox(desktopLayout.openFullQueueBox, desktopOpenFullQueueRect);
        copyBox(desktopLayout.panelBodyBox, desktopPanelBodyRect);
        copyBox(desktopLayout.syncPillBox, lyricsSyncPillRect);
        copyBox(desktopLayout.dockBox, desktopDockRect);
        copyBox(desktopLayout.titleAreaBox, titleAreaRect);
        copyBox(desktopLayout.favoriteBox, favoriteRect);
        copyBox(desktopLayout.shuffleBox, shuffleRect);
        copyBox(desktopLayout.prevBox, prevBtnRect);
        copyBox(desktopLayout.playBox, playBtnRect);
        copyBox(desktopLayout.nextBox, nextBtnRect);
        copyBox(desktopLayout.repeatBox, repeatRect);
        copyBox(desktopLayout.seekBarTrackBox, seekBarTouchRect);
        copyBox(desktopLayout.elapsedTimeBox, desktopElapsedTimeRect);
        copyBox(desktopLayout.durationTimeBox, desktopDurationTimeRect);
        copyBox(desktopLayout.badgeBox, badgeRect);
        copyBox(desktopLayout.lyricsBtnBox, lyricsBtnRect);
        copyBox(desktopLayout.queueBtnBox, queueRect);
        copyBox(desktopLayout.castBtnBox, castRect);
        copyBox(desktopLayout.volumeIconBox, desktopVolumeIconRect);
        copyBox(desktopLayout.volumeSliderBox, desktopVolumeSliderRect);

        desktopCompactHeight = desktopLayout.compactHeight;
        desktopShowVolume = desktopLayout.showVolumeSlider;
        desktopShowSourceChip = desktopLayout.showSourceChip;

        activeCoverRect.set(coverRect);
        activeSeekBarRect.set(seekBarTouchRect);
        activeMetaRect.set(
                desktopElapsedTimeRect.left,
                desktopElapsedTimeRect.top,
                desktopDurationTimeRect.right,
                desktopDurationTimeRect.bottom
        );
        activePrevRect.set(prevBtnRect);
        activePlayRect.set(playBtnRect);
        activeNextRect.set(nextBtnRect);
        lyricsViewportRect.set(desktopPanelBodyRect);

        lyricsMiniCoverRect.setEmpty();
        lyricsHeaderTitleRect.setEmpty();
        lyricsCloseRect.setEmpty();
        bottomCapsuleRect.setEmpty();
        npMetaRect.setEmpty();
    }

    private static void copyBox(PlayerDesktopLayoutSolver.RectBox box, RectF dst) {
        dst.set(box.left, box.top, box.right, box.bottom);
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

        if (layoutMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE) {
            drawDesktopTopHeader(canvas);
            drawMorphingCover(canvas);
            drawDesktopRightPanel(canvas, 1f);
            drawDesktopBottomDock(canvas, 1f);

            if (!isPreviewInstance && (currentCoverBitmap != null || coverId == null || coverId.isEmpty())) {
                dev.materialtidal.extension.tidal.navbar.ExpressiveScaffoldBridge.onRealFullPlayerDrawn();
            }
            return;
        }

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
     * ({@code expandProgress == 1f}), supporting rubber-band undershoot and elastic overshoot.
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
        drawInteractiveExpansion(
                canvas, w, h, expandProgress, startCardRect, startArtRect,
                startArtRadius, 1f, miniPlayer
        );
    }

    public void drawInteractiveExpansion(
            Canvas canvas,
            int w,
            int h,
            float expandProgress,
            RectF startCardRect,
            RectF startArtRect,
            float startArtRadius,
            float startCardScale,
            ExpressiveMiniPlayerView miniPlayer
    ) {
        if (w <= 0 || h <= 0) {
            return;
        }
        computeLayout(w, h);

        float p = Math.max(0f, Math.min(1f, expandProgress));
        float overshoot = Math.max(0f, Math.min(0.08f, expandProgress - 1f));
        float undershoot = Math.min(0f, Math.max(-0.06f, expandProgress));

        long nowMs = SystemClock.uptimeMillis();
        float dt = lastExpansionAnimMs > 0L
                ? Math.min(0.033f, Math.max(0.001f, (nowMs - lastExpansionAnimMs) / 1000f))
                : 0.016f;
        lastExpansionAnimMs = nowMs;

        if ("PLAYING".equals(playState) && MaterialYouConfig.isPlayerSquigglySeekbarEnabled()) {
            wavePhaseRad = (wavePhaseRad + 3.4f * dt) % ((float) (Math.PI * 2.0));
        }
        if (MaterialYouConfig.isPlayerWaveformSeekbarEnabled()) {
            waveformRenderer.step(dt, "PLAYING".equals(playState), isScrubbing, SongWaveformBridge.getLiveAudioLevel());
        }
        if ("BUFFERING".equals(playState)) {
            bufferingAngleDeg = (bufferingAngleDeg + 360f * dt) % 360f;
        }

        // 1. Backdrop scrim darkening behind the ascending sheet (matches ModalBottomSheet scrim)
        float scrimAlpha = 0.58f * easeOutCubic(p);
        if (scrimAlpha > 0.004f) {
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(Color.argb(Math.round(255f * scrimAlpha), 0, 0, 0));
            canvas.drawRect(0f, 0f, w, h, fillPaint);
        }

        // 2. Expressive pill-to-sheet container bounds
        float widthMorph = easeOutQuint(Math.min(1f, p / 0.34f));
        float botMorph = easeOutQuart(Math.min(1f, p / 0.30f));
        float sheetTop = Math.max(0f, startCardRect.top * (1f - p) - undershoot * 160f * density);
        float sheetLeft = startCardRect.left * (1f - widthMorph);
        float sheetRight = startCardRect.right + (w - startCardRect.right) * widthMorph;
        float sheetBottom = startCardRect.bottom - undershoot * 120f * density + (h - startCardRect.bottom) * botMorph;

        float sheetCornerDp = dev.materialtidal.extension.tidal.sheets.ExpressiveSheetsBridge.getSheetCornerRadiusDp();
        float topRadius = (32f * density) * (1f - widthMorph) + (sheetCornerDp * density) * widthMorph;
        float botRadius = (32f * density) * (1f - botMorph);

        float grabBlend = 1f - smoothstep(0f, 0.09f, p);
        float scaleX = (1f + (startCardScale - 1f) * grabBlend) * (1f - undershoot * 0.35f);
        float scaleY = (1f + (startCardScale - 1f) * grabBlend) * (1f + undershoot * 0.55f);
        boolean hasContainerScale = Math.abs(scaleX - 1f) > 0.001f || Math.abs(scaleY - 1f) > 0.001f;
        if (hasContainerScale) {
            canvas.save();
            canvas.scale(scaleX, scaleY, (sheetLeft + sheetRight) * 0.5f, (sheetTop + sheetBottom) * 0.5f);
        }

        tempRect.set(sheetLeft, sheetTop, sheetRight, sheetBottom);
        if (p < 0.96f) {
            drawSoftRectShadow(canvas, tempRect, topRadius, activePalette.shadowBase);
        }

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
        if (p < 0.36f && miniPlayer != null) {
            tempRect.set(sheetLeft, sheetTop, sheetRight, sheetBottom);
            miniPlayer.drawSheetBaseGlass(canvas, tempRect, topRadius);
        }

        // 3b. Heavily blurred cover backdrop crossfading in directly (zero offscreen saveLayer)
        float bgAlpha = smoothstep(0.02f, 0.34f, p);
        if (bgAlpha > 0.01f) {
            float bgZoom = 1f + (1f - easeOutCubic(p)) * 0.05f;
            float bgShiftY = sheetTop * 0.28f - overshoot * 10f * density;
            canvas.save();
            canvas.translate(0f, bgShiftY);
            if (bgZoom > 1.001f) {
                canvas.scale(bgZoom, bgZoom, w * 0.5f, h * 0.5f);
            }
            drawBlurredBackground(canvas, w, h, bgAlpha);
            canvas.restore();
        }

        // 3c. Compact Mini-Player row (Title/Explicit/Artist + Play/Next buttons) fading out at top of sheet
        float miniRowAlpha = 1f - smoothstep(0.00f, 0.18f, p);
        if (miniRowAlpha > 0.01f && miniPlayer != null) {
            float miniDriftY = -(1f - miniRowAlpha) * 8f * density;
            canvas.save();
            canvas.translate(0f, miniDriftY);
            miniPlayer.drawCompactSheetHeaderContent(canvas, sheetLeft, sheetTop, sheetRight, miniRowAlpha);
            canvas.restore();
        }

        // 3d. Full-Screen Player Chrome (staggered Material 3 Expressive cascade with tight layer bounds)
        if (layoutMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE) {
            float headerAlpha = smoothstep(0.30f, 0.82f, p);
            if (headerAlpha > 0.01f) {
                float hEase = easeOutCubic(headerAlpha);
                float hShiftY = sheetTop * 0.32f + (1f - hEase) * 14f * density - overshoot * 8f * density;
                canvas.save();
                canvas.translate(0f, hShiftY);
                float hRight = Math.max(moreBtnRect.right, desktopPanelToggleRect.right);
                int s = saveTightLayerAlpha(canvas, collapseRect.left, collapseRect.top,
                        hRight, collapseRect.bottom, headerAlpha, 10f * density);
                drawDesktopTopHeader(canvas);
                if (s >= 0) canvas.restoreToCount(s);
                canvas.restore();
            }

            float panelAlpha = smoothstep(0.24f, 0.78f, p);
            if (panelAlpha > 0.01f) {
                float pEase = easeOutCubic(panelAlpha);
                float pShiftY = sheetTop * 0.48f + (1f - pEase) * 20f * density - overshoot * 12f * density;
                canvas.save();
                canvas.translate(0f, pShiftY);
                drawDesktopRightPanel(canvas, panelAlpha);
                canvas.restore();
            }

            float dockAlpha = smoothstep(0.20f, 0.72f, p);
            if (dockAlpha > 0.01f) {
                float dEase = easeOutCubic(dockAlpha);
                float dShiftY = sheetTop * 0.64f + (1f - dEase) * 26f * density - overshoot * 16f * density;
                canvas.save();
                canvas.translate(0f, dShiftY);
                drawDesktopBottomDock(canvas, dockAlpha);
                canvas.restore();
            }
        } else {
            float headerAlpha = smoothstep(0.30f, 0.82f, p);
            if (headerAlpha > 0.01f) {
                float hEase = easeOutCubic(headerAlpha);
                float hShiftY = sheetTop * 0.32f + (1f - hEase) * 14f * density - overshoot * 8f * density;
                canvas.save();
                canvas.translate(0f, hShiftY);
                int s = saveTightLayerAlpha(canvas, collapseRect.left, collapseRect.top,
                        queueRect.right, collapseRect.bottom, headerAlpha, 8f * density);
                drawTopHeader(canvas);
                if (s >= 0) canvas.restoreToCount(s);
                canvas.restore();
            }

            float infoAlpha = smoothstep(0.20f, 0.68f, p);
            if (infoAlpha > 0.01f) {
                float iEase = easeOutCubic(infoAlpha);
                float iShiftY = sheetTop * 0.44f + (1f - iEase) * 20f * density - overshoot * 12f * density;
                canvas.save();
                canvas.translate(0f, iShiftY);
                float infoTopBound = Math.min(titleAreaRect.top, moreBtnRect.top);
                float infoBotBound = Math.max(titleAreaRect.bottom, moreBtnRect.bottom);
                int s = saveTightLayerAlpha(canvas, titleAreaRect.left, infoTopBound,
                        moreBtnRect.right, infoBotBound, infoAlpha, 10f * density);
                drawTrackInfoAndActions(canvas);
                if (s >= 0) canvas.restoreToCount(s);
                canvas.restore();
            }

            float seekAlpha = smoothstep(0.28f, 0.76f, p);
            if (seekAlpha > 0.01f) {
                float sEase = easeOutCubic(seekAlpha);
                float sShiftY = sheetTop * 0.52f + (1f - sEase) * 24f * density - overshoot * 14f * density;
                canvas.save();
                canvas.translate(0f, sShiftY);
                int s = saveTightLayerAlpha(canvas, activeSeekBarRect.left, activeSeekBarRect.top,
                        activeSeekBarRect.right, activeMetaRect.bottom, seekAlpha, 14f * density);
                drawSeekbarAndMeta(canvas, seekAlpha);
                if (s >= 0) canvas.restoreToCount(s);
                canvas.restore();
            }

            float transAlpha = smoothstep(0.24f, 0.72f, p);
            if (transAlpha > 0.01f) {
                float tEase = easeOutCubic(transAlpha);
                float tShiftY = sheetTop * 0.60f + (1f - tEase) * 28f * density - overshoot * 17f * density;
                float tScale = 0.86f + 0.14f * tEase + overshoot * 0.32f;
                canvas.save();
                canvas.translate(0f, tShiftY);
                canvas.scale(tScale, tScale, w * 0.5f, activePlayRect.centerY());
                int s = saveTightLayerAlpha(canvas, activePrevRect.left, activePrevRect.top,
                        activeNextRect.right, activeNextRect.bottom, transAlpha, 18f * density);
                drawTransportControls(canvas);
                if (s >= 0) canvas.restoreToCount(s);
                canvas.restore();
            }

            float capAlpha = smoothstep(0.36f, 0.86f, p);
            if (capAlpha > 0.01f) {
                float cEase = easeOutCubic(capAlpha);
                float cShiftY = sheetTop * 0.68f + (1f - cEase) * 32f * density - overshoot * 20f * density;
                float cScale = 0.93f + 0.07f * cEase + overshoot * 0.15f;
                canvas.save();
                canvas.translate(0f, cShiftY);
                canvas.scale(cScale, cScale, bottomCapsuleRect.centerX(), bottomCapsuleRect.centerY());
                int s = saveTightLayerAlpha(canvas, bottomCapsuleRect.left, bottomCapsuleRect.top,
                        bottomCapsuleRect.right, bottomCapsuleRect.bottom, capAlpha, 14f * density);
                drawBottomCapsule(canvas);
                if (s >= 0) canvas.restoreToCount(s);
                canvas.restore();
            }
        }

        // 3e. Monotonic Curved-Arc Shared-Element Hero Album Cover Morph
        float artX_T = easeOutCubic(Math.min(1f, p / 0.86f));
        float artY_T = p;
        float artSizeT = p;

        float startCx = startArtRect.centerX();
        float startCy = startArtRect.centerY() - undershoot * 160f * density;
        float startW = startArtRect.width();
        float startH = startArtRect.height();

        float endCx = coverRect.centerX();
        float endCy = coverRect.centerY() - overshoot * 14f * density;
        float endW = coverRect.width() * coverScale * (1f + overshoot * 0.26f);
        float endH = coverRect.height() * coverScale * (1f + overshoot * 0.26f);

        float curCx = startCx + (endCx - startCx) * artX_T;
        float curCy = startCy + (endCy - startCy) * artY_T;
        float curW = startW + (endW - startW) * artSizeT;
        float curH = startH + (endH - startH) * artSizeT;

        float minTopAllowed = sheetTop + 4f * density * (1f - p);
        if (curCy - curH * 0.5f < minTopAllowed) {
            curCy = minTopAllowed + curH * 0.5f;
        }

        tempRect.set(curCx - curW * 0.5f, curCy - curH * 0.5f,
                curCx + curW * 0.5f, curCy + curH * 0.5f);

        float clampedCornerMorph = Math.max(0f, Math.min(1f, coverCornerMorph));
        float endArtRadius = (34f * (1f - clampedCornerMorph) + 24f * clampedCornerMorph) * density;
        float curArtRadius = startArtRadius * (1f - artSizeT) + endArtRadius * artSizeT;

        float shadowFrac = smoothstep(0.05f, 0.75f, p);
        int baseShadowAlpha = (activePalette.shadowBase >>> 24) & 0xFF;
        int morphedShadow = MaterialYouColorEngine.withAlpha(
                activePalette.shadowBase, Math.round(baseShadowAlpha * shadowFrac));
        if (shadowFrac > 0.04f) {
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
        float handleAlpha = smoothstep(0.03f, 0.16f, p) * (1f - smoothstep(0.84f, 0.98f, p));
        if (handleAlpha > 0.01f) {
            float handleW = (26f + 14f * widthMorph) * density;
            float handleH = (3.0f + 1.4f * widthMorph) * density;
            float handleCx = (sheetLeft + sheetRight) * 0.5f;
            float handleTop = sheetTop + (4.5f + 5.5f * widthMorph) * density;
            tempRect.set(handleCx - handleW * 0.5f, handleTop,
                    handleCx + handleW * 0.5f, handleTop + handleH);
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(
                    activePalette.primaryDeep, Math.round(0x88 * handleAlpha)));
            canvas.drawRoundRect(tempRect, handleH * 0.5f, handleH * 0.5f, fillPaint);
        }

        if (widthMorph > 0.05f) {
            strokePaint.setStrokeWidth(1f * density);
            int miniBorder = MaterialYouColorEngine.getMiniPlayerBorderColor();
            int sheetBorder = MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.getOutlineVariant(), 0x48);
            int blendedBorder = MaterialYouColorEngine.blendRgb(miniBorder, sheetBorder, p);
            int miniA = Color.alpha(miniBorder);
            int sheetA = Color.alpha(sheetBorder);
            int blendedA = Math.round((miniA * (1f - p) + sheetA * p) * widthMorph);
            strokePaint.setColor(MaterialYouColorEngine.withAlpha(blendedBorder, blendedA));
            canvas.drawPath(clipPath, strokePaint);
        }

        canvas.restore();
        if (hasContainerScale) {
            canvas.restore();
        }
    }

    private static int saveTightLayerAlpha(
            Canvas canvas,
            float l,
            float t,
            float r,
            float b,
            float alpha,
            float padPx
    ) {
        if (alpha >= 0.992f || r <= l || b <= t) {
            return -1;
        }
        return canvas.saveLayerAlpha(
                l - padPx,
                t - padPx,
                r + padPx,
                b + padPx,
                Math.max(0, Math.min(255, Math.round(255f * alpha)))
        );
    }

    private void drawBlurredBackground(Canvas canvas, int w, int h) {
        drawBlurredBackground(canvas, w, h, 1f);
    }

    private void drawBlurredBackground(Canvas canvas, int w, int h, float alpha) {
        float a = Math.max(0f, Math.min(1f, alpha));
        if (a <= 0.004f) {
            return;
        }

        // Fallback tonal base fill
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(MaterialYouColorEngine.withAlpha(
                activePalette.blurWashColor | 0xFF000000, Math.round(255f * a)));
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
            blurBitmapPaint.setAlpha(Math.round(255f * a));
            drawCenterCropBitmap(canvas, prevBlurredBitmap, w, h, breathScale, blurBitmapPaint);
        }

        if (currentBlurredBitmap != null && !currentBlurredBitmap.isRecycled()) {
            blurBitmapPaint.setAlpha(Math.round(255f * a * Math.max(0f, Math.min(1f, blurFadeAlpha))));
            drawCenterCropBitmap(canvas, currentBlurredBitmap, w, h, breathScale, blurBitmapPaint);
        }

        // Soft tonal veil harmonizing foreground contrast over the heavily blurred cover
        int washA = (activePalette.blurWashColor >>> 24) & 0xFF;
        fillPaint.setColor(MaterialYouColorEngine.withAlpha(
                activePalette.blurWashColor, Math.round(washA * a)));
        canvas.drawRect(0f, 0f, w, h, fillPaint);

        // Gently enrich wash when full-screen lyrics are open for crisp typography legibility
        if (lyricsReveal > 0.01f) {
            int extraWashAlpha = Math.round(0x34 * Math.min(1f, lyricsReveal) * a);
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
        fillPaint.setAlpha(Math.round(255f * a));
        canvas.drawRect(0f, 0f, w, h, fillPaint);
        fillPaint.setShader(null);
        fillPaint.setAlpha(255);
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
        float titleMaxRight = (desktopShowSourceChip && !sourceChipRect.isEmpty())
                ? (sourceChipRect.left - 10f * density)
                : (castRect.left - 10f * density);
        float maxTitleW = Math.max(40f * density, titleMaxRight - titleX);
        String headerTitle = TextUtils.ellipsize("Now Playing", headerPaint, maxTitleW, TextUtils.TruncateAt.END).toString();
        canvas.drawText(headerTitle, titleX, titleBaseline, headerPaint);

        if (desktopShowSourceChip && !sourceChipRect.isEmpty()) {
            drawSourceChipPill(canvas);
        }

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
        float lr = (layoutMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE)
                ? 0f
                : easeInOutCubic(lyricsReveal);
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

        if (isEffectiveLyricsLoading()) {
            drawLyricsSkeleton(canvas, reveal, padH, contentW);
            return;
        }

        boolean sylMode = isSyllableModeActive();
        String[] activeNative = activeNativeLyricLines();
        if (!sylMode && (activeNative == null || activeNative.length == 0)) {
            lyricMsgPaint.setColor(MaterialYouColorEngine.withAlpha(
                    activePalette.lyricsInactiveText, Math.round(230f * reveal)));
            float slide = (1f - reveal) * 18f * density;
            canvas.drawText("No lyrics available",
                    lyricsViewportRect.centerX(),
                    lyricsViewportRect.centerY() + slide,
                    lyricMsgPaint);
            return;
        }

        if (sylMode) {
            syllableRenderer.ensureLayout(contentW, lyricsViewportRect.height());
        } else {
            ensureLyricsLayouts(contentW);
        }

        // Edge-faded layer using DST_IN vertical gradient so lines melt into blurred backdrop
        int vpLayer = canvas.saveLayer(lyricsViewportRect, null);
        float entrySlideY = (1f - easeOutCubic(reveal)) * 28f * density;
        canvas.save();
        canvas.translate(lyricsViewportRect.left + padH, lyricsViewportRect.top + entrySlideY);

        if (sylMode) {
            if (syllableCrossfade < 0.99f && activeNative != null && activeNative.length > 0) {
                ensureLyricsLayouts(contentW);
                drawNativeLyricLines(canvas, reveal * (1f - syllableCrossfade), contentW);
            }
            syllableRenderer.draw(
                    canvas,
                    contentW,
                    lyricsViewportRect.height(),
                    lyricsScrollY,
                    lyricsBrowseBoost,
                    reveal * easeOutCubic(syllableCrossfade),
                    activePalette.lyricsActiveText,
                    activePalette.lyricsInactiveText
            );
        } else {
            drawNativeLyricLines(canvas, reveal, contentW);
        }
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

    private void drawNativeLyricLines(Canvas canvas, float reveal, int contentW) {
        if (reveal <= 0.01f || lyricLayouts.isEmpty()) {
            return;
        }
        String[] activeLines = activeNativeLyricLines();
        boolean nativeSynced = isActiveNativeLyricsSynced();
        int activeHilite = activeNativeHighlightedIndex();
        float vpHeight = lyricsViewportRect.height();
        for (int i = 0; i < lyricLayouts.size(); i++) {
            float itemTop = lyricItemTops.get(i) - lyricsScrollY;
            float itemH = lyricItemHeights.get(i);
            if (itemTop + itemH < -40f * density || itemTop > vpHeight + 40f * density) {
                continue;
            }

            float focus = (lyricLineFocus != null && i < lyricLineFocus.length) ? lyricLineFocus[i] : 0f;
            float baseOpacity;
            if (!nativeSynced) {
                baseOpacity = 0.94f;
            } else {
                int dist = activeHilite >= 0 ? (i - activeHilite) : 99;
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
            int baseRgb = nativeSynced
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

            String rawText = (activeLines != null && i < activeLines.length && activeLines[i] != null)
                    ? activeLines[i].trim()
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

            float scale = 1f + 0.055f * focus;
            float blurPx = (nativeLyricBlurPx != null && i < nativeLyricBlurPx.length) ? nativeLyricBlurPx[i] : 0f;
            if (blurPx >= 0.35f && canvas.isHardwareAccelerated() && Build.VERSION.SDK_INT >= 31) {
                if (drawNativeLineWithBlur(canvas, i, sl, itemTop, itemH, contentW, scale, blurPx)) {
                    continue;
                }
            }

            canvas.save();
            canvas.translate(0f, itemTop);
            if (scale > 1.001f) {
                canvas.scale(scale, scale, 0f, itemH * 0.5f);
            }
            sl.draw(canvas);
            canvas.restore();
        }
        lyricPaint.clearShadowLayer();
    }

    private boolean drawNativeLineWithBlur(
            Canvas canvas,
            int index,
            StaticLayout sl,
            float itemTop,
            float itemH,
            int contentW,
            float scale,
            float blurPx
    ) {
        try {
            int n = lyricLayouts.size();
            if (nativeBlurNodes == null || nativeBlurNodes.length != n) {
                nativeBlurNodes = new RenderNode[n];
                nativeAppliedBlurPx = new float[n];
                for (int k = 0; k < n; k++) {
                    nativeAppliedBlurPx[k] = -1f;
                }
            }
            int pad = Math.max(
                    Math.round(12f * density),
                    (int) Math.ceil(blurPx * 2.6f) + Math.round(6f * density)
            );
            int nodeW = Math.max(1, contentW + pad * 2);
            int nodeH = Math.max(1, Math.round(itemH) + pad * 2);

            RenderNode node = nativeBlurNodes[index];
            if (node == null) {
                node = new RenderNode("mt-nat-lyr-" + index);
                nativeBlurNodes[index] = node;
            }
            node.setPosition(0, 0, nodeW, nodeH);
            node.setClipToBounds(false);
            node.setForceDarkAllowed(false);

            float qBlur = Math.max(0.5f, Math.round(blurPx * 4f) * 0.25f);
            if (Math.abs(qBlur - nativeAppliedBlurPx[index]) >= 0.20f) {
                node.setRenderEffect(RenderEffect.createBlurEffect(qBlur, qBlur, Shader.TileMode.DECAL));
                nativeAppliedBlurPx[index] = qBlur;
            }

            RecordingCanvas rc = node.beginRecording(nodeW, nodeH);
            try {
                rc.translate(pad, pad);
                if (scale > 1.001f) {
                    rc.scale(scale, scale, 0f, itemH * 0.5f);
                }
                sl.draw(rc);
            } finally {
                node.endRecording();
            }

            canvas.save();
            canvas.translate(-pad, itemTop - pad);
            canvas.drawRenderNode(node);
            canvas.restore();
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private void drawLyricsSkeleton(Canvas canvas, float reveal, float padH, int contentW) {
        float[] widthFracs = {0.78f, 0.54f, 0.86f, 0.62f, 0.44f};
        float barH = 22f * density;
        float barR = 11f * density;
        float gap = 22f * density;
        float startY = lyricsViewportRect.top + lyricsViewportRect.height() * 0.20f + (1f - reveal) * 18f * density;

        float skLeft = lyricsViewportRect.left + padH;
        fillPaint.setStyle(Paint.Style.FILL);
        for (int i = 0; i < widthFracs.length; i++) {
            float wave = 0.5f + 0.5f * (float) Math.sin(skeletonPulsePhase - i * 0.65f);
            int alpha = Math.round((46f + 62f * wave) * reveal);
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(activePalette.lyricsActiveText, alpha));
            float top = startY + i * (barH + gap);
            tempRect.set(skLeft, top, skLeft + contentW * widthFracs[i], top + barH);
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
        String[] activeLines = activeNativeLyricLines();
        if (lastLayoutLyricsWidth == widthPx && !lyricLayouts.isEmpty()
                && lastLayoutSourceLines == activeLines) {
            return;
        }
        lastLayoutLyricsWidth = widthPx;
        lastLayoutSourceLines = activeLines;
        lyricLayouts.clear();
        lyricItemTops.clear();
        lyricItemHeights.clear();
        totalLyricsContentH = 0f;

        if (activeLines == null || activeLines.length == 0) {
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

        for (String line : activeLines) {
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

        boolean nativeSynced = isActiveNativeLyricsSynced();
        int activeHilite = activeNativeHighlightedIndex();
        if (lyricLineFocus == null || lyricLineFocus.length != lyricLayouts.size()) {
            lyricLineFocus = new float[lyricLayouts.size()];
            if (nativeSynced && activeHilite >= 0 && activeHilite < lyricLineFocus.length) {
                lyricLineFocus[activeHilite] = 1f;
            }
        }
        updateAutoLyricsScrollTarget();
        if (lyricsReveal < 0.08f && nativeSynced) {
            lyricsScrollY = targetLyricsScrollY;
        }
    }

    private float computeAutoLyricsScrollY() {
        float vpH = lyricsViewportRect.height() > 1f
                ? lyricsViewportRect.height()
                : Math.max(240f * density, getHeight() * 0.58f);
        if (isSyllableModeActive()) {
            return syllableRenderer.computeAutoScrollY(vpH);
        }
        int activeHilite = activeNativeHighlightedIndex();
        if (lyricItemTops.isEmpty() || activeHilite < 0 || activeHilite >= lyricItemTops.size()) {
            return 0f;
        }
        float itemCenter = lyricItemTops.get(activeHilite) + lyricItemHeights.get(activeHilite) * 0.5f;
        float viewCenter = vpH * 0.34f;
        float maxScroll = Math.max(0f, totalLyricsContentH - vpH);
        return Math.max(0f, Math.min(maxScroll, itemCenter - viewCenter));
    }

    private void updateAutoLyricsScrollTarget() {
        if (SystemClock.uptimeMillis() - lastUserLyricsScrollMs < 2800L) {
            return;
        }
        if (isSyllableModeActive()) {
            targetLyricsScrollY = computeAutoLyricsScrollY();
            return;
        }
        int activeHilite = activeNativeHighlightedIndex();
        if (lyricItemTops.isEmpty() || activeHilite < 0 || activeHilite >= lyricItemTops.size()) {
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

        if (isEffectiveShowLyricsButton()) {
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
        float shownProgress = drawSeekbarTrackAndThumb(canvas, activeSeekBarRect);

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
            drawQualityPillBadge(canvas, badgeText.toUpperCase(Locale.US), badgeAlpha);
        }
    }

    private float drawSeekbarTrackAndThumb(Canvas canvas, RectF trackRect) {
        float trackLeft = trackRect.left + 6f * density;
        float trackRight = trackRect.right - 6f * density;
        float trackW = Math.max(1f, trackRight - trackLeft);
        float cy = trackRect.centerY();

        float shownProgress = (isScrubbing || SystemClock.uptimeMillis() < scrubHoldUntilMs)
                ? scrubProgress
                : serverProgress;
        shownProgress = Math.max(0f, Math.min(1f, shownProgress));
        if (MaterialYouConfig.isPlayerWaveformSeekbarEnabled()) {
            waveformRenderer.draw(
                    canvas,
                    trackRect,
                    shownProgress,
                    activePalette.primaryDeep,
                    density,
                    thumbScale,
                    isScrubbing,
                    "PLAYING".equals(playState));
            return shownProgress;
        }
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
        float thumbRadius = (layoutMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE ? 6.2f : 7.2f)
                * density * thumbScale;
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(activePalette.primaryDeep);
        canvas.drawCircle(thumbX, cy, thumbRadius, fillPaint);
        return shownProgress;
    }

    private void drawQualityPillBadge(Canvas canvas, String label, float alpha) {
        if (label == null || label.isEmpty() || badgeRect.width() <= 10f || alpha <= 0.02f) {
            return;
        }
        float badgeScale = 1f - 0.08f * buttonPress[HIT_BADGE];
        canvas.save();
        canvas.scale(badgeScale, badgeScale, badgeRect.centerX(), badgeRect.centerY());
        float bRad = badgeRect.height() * 0.5f;
        int bgA = Math.round(((activePalette.badgeBg >>> 24) & 0xFF) * alpha);
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(MaterialYouColorEngine.withAlpha(activePalette.badgeBg, bgA));
        canvas.drawRoundRect(badgeRect, bRad, bRad, fillPaint);

        badgePaint.setColor(MaterialYouColorEngine.withAlpha(
                activePalette.badgeText, Math.round(255f * alpha)));
        float maxW = Math.max(20f * density, badgeRect.width() - 16f * density);
        String shown = TextUtils.ellipsize(label, badgePaint, maxW, TextUtils.TruncateAt.END).toString();
        Paint.FontMetrics bfm = badgePaint.getFontMetrics();
        float bBase = badgeRect.centerY() - (bfm.ascent + bfm.descent) * 0.5f;
        canvas.drawText(shown, badgeRect.centerX(), bBase, badgePaint);
        canvas.restore();
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
        boolean isDesktop = layoutMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE;
        float lr = isDesktop
                ? (desktopCompactHeight ? 0.85f : 0.45f)
                : easeInOutCubic(lyricsReveal);
        float basePrevW = Math.max(1f, activePrevRect.width());
        float basePlayW = Math.max(1f, activePlayRect.width());
        float baseNextW = Math.max(1f, activeNextRect.width());
        float gap = Math.max(4f * density, activePlayRect.left - activePrevRect.right);
        float rowCenterX = activePlayRect.centerX();
        float top = activePlayRect.top;
        float bot = activePlayRect.bottom;

        float ePrev = transportExpand[0];
        float ePlay = transportExpand[1];
        float eNext = transportExpand[2];

        float growUnit = basePlayW * 0.24f;
        float prevW = Math.max(basePrevW * 0.68f,
                basePrevW + growUnit * (1.00f * ePrev - 0.38f * ePlay - 0.24f * eNext));
        float playW = Math.max(basePlayW * 0.68f,
                basePlayW + growUnit * (1.00f * ePlay - 0.48f * ePrev - 0.48f * eNext));
        float nextW = Math.max(baseNextW * 0.68f,
                baseNextW + growUnit * (1.00f * eNext - 0.38f * ePlay - 0.24f * ePrev));

        float maxExp = Math.min(1f, Math.max(0f, Math.max(ePrev, Math.max(ePlay, eNext))));
        float curGap = Math.max(4f * density, gap - 1.5f * density * maxExp);
        float totalW = prevW + curGap + playW + curGap + nextW;
        float groupBiasX = (eNext - ePrev) * (isDesktop ? 1.5f : 2.5f) * density;
        float leftEdge = rowCenterX - totalW * 0.5f + groupBiasX;

        float prevVertLift = 1.6f * density * Math.max(0f, ePrev);
        float playVertLift = 2.0f * density * Math.max(0f, ePlay);
        float nextVertLift = 1.6f * density * Math.max(0f, eNext);

        drawPrevRect.set(leftEdge, top - prevVertLift, leftEdge + prevW, bot + prevVertLift);
        float playLeft = drawPrevRect.right + curGap;
        drawPlayRect.set(playLeft, top - playVertLift, playLeft + playW, bot + playVertLift);
        float nextLeft = drawPlayRect.right + curGap;
        drawNextRect.set(nextLeft, top - nextVertLift, nextLeft + nextW, bot + nextVertLift);

        float iconR = isDesktop
                ? ((desktopCompactHeight ? 6.4f : 7.4f) * density)
                : ((8.5f - 1.0f * lr) * density);

        // Left: Previous Pill-Circle -> expressive squircle expand & neighbor push
        float prevExpPos = Math.max(0f, Math.min(1f, ePrev));
        float prevFullR = drawPrevRect.height() * 0.5f;
        float sideSquircleR = isDesktop
                ? Math.min(prevFullR, prevFullR * 0.56f)
                : Math.min(prevFullR, 19f * density);
        float prevR = prevFullR * (1f - prevExpPos) + sideSquircleR * prevExpPos;
        int prevBg = MaterialYouColorEngine.blendRgb(
                activePalette.sideBtnBg, activePalette.primaryDeep, 0.10f * prevExpPos);
        float prevIconShiftX = -3.2f * density * ePrev;
        float prevIconScale = 1f + 0.08f * Math.max(0f, ePrev);

        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(prevBg);
        canvas.drawRoundRect(drawPrevRect, prevR, prevR, fillPaint);
        canvas.save();
        float prevIconCx = drawPrevRect.centerX() + prevIconShiftX;
        float prevIconCy = drawPrevRect.centerY();
        canvas.scale(prevIconScale, prevIconScale, prevIconCx, prevIconCy);
        drawSkipPrevIcon(canvas, prevIconCx, prevIconCy, iconR, activePalette.sideBtnIcon);
        canvas.restore();

        // Center: Large Expressive Play/Pause Squircle (morphs on playback & expands on tap)
        float playExpPos = Math.max(0f, Math.min(1f, ePlay));
        float playFullR = drawPlayRect.height() * 0.5f;
        float clampedMorph = Math.max(0f, Math.min(1f, playShapeMorph));
        float playSquircleR = isDesktop
                ? Math.min(playFullR, playFullR * 0.62f)
                : Math.min(playFullR, (22f - 4f * lr) * density);
        float basePlayR = playFullR * (1f - clampedMorph) + playSquircleR * clampedMorph;
        float playExpandedR = isDesktop
                ? Math.min(playFullR, playFullR * 0.50f)
                : Math.min(playFullR, (18f - 2f * lr) * density);
        float playR = basePlayR * (1f - playExpPos) + playExpandedR * playExpPos;
        int playBg = MaterialYouColorEngine.blendRgb(
                activePalette.centerPlayBg, activePalette.centerPlayIcon, 0.08f * playExpPos);
        float playIconScale = 1f + 0.09f * Math.max(0f, ePlay);

        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(playBg);
        canvas.drawRoundRect(drawPlayRect, playR, playR, fillPaint);
        canvas.save();
        canvas.scale(playIconScale, playIconScale, drawPlayRect.centerX(), drawPlayRect.centerY());
        if ("BUFFERING".equals(playState)) {
            float ringR = isDesktop
                    ? ((desktopCompactHeight ? 8.2f : 9.6f) * density)
                    : ((11f - 1.2f * lr) * density);
            tempRect.set(drawPlayRect.centerX() - ringR, drawPlayRect.centerY() - ringR,
                    drawPlayRect.centerX() + ringR, drawPlayRect.centerY() + ringR);
            strokePaint.setColor(activePalette.centerPlayIcon);
            strokePaint.setStrokeWidth(2.8f * density);
            canvas.drawArc(tempRect, bufferingAngleDeg, 260f, false, strokePaint);
        } else if ("PLAYING".equals(playState)) {
            drawPauseBars(canvas, drawPlayRect.centerX(), drawPlayRect.centerY(), iconR, activePalette.centerPlayIcon);
        } else {
            float playTriR = isDesktop
                    ? ((desktopCompactHeight ? 7.2f : 8.4f) * density)
                    : ((9.5f - 1.0f * lr) * density);
            drawPlayTriangle(canvas, drawPlayRect.centerX() + 1.5f * density, drawPlayRect.centerY(),
                    playTriR, activePalette.centerPlayIcon);
        }
        canvas.restore();

        // Right: Next Pill-Circle -> expressive squircle expand & neighbor push
        float nextExpPos = Math.max(0f, Math.min(1f, eNext));
        float nextFullR = drawNextRect.height() * 0.5f;
        float nextSquircleR = isDesktop
                ? Math.min(nextFullR, nextFullR * 0.56f)
                : Math.min(nextFullR, 19f * density);
        float nextR = nextFullR * (1f - nextExpPos) + nextSquircleR * nextExpPos;
        int nextBg = isNextEnabled
                ? MaterialYouColorEngine.blendRgb(
                        activePalette.sideBtnBg, activePalette.primaryDeep, 0.10f * nextExpPos)
                : MaterialYouColorEngine.withAlpha(activePalette.sideBtnBg, 0x70);
        int nextIcon = isNextEnabled
                ? activePalette.sideBtnIcon
                : MaterialYouColorEngine.withAlpha(activePalette.sideBtnIcon, 0x80);
        float nextIconShiftX = 3.2f * density * eNext;
        float nextIconScale = 1f + 0.08f * Math.max(0f, eNext);

        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(nextBg);
        canvas.drawRoundRect(drawNextRect, nextR, nextR, fillPaint);
        canvas.save();
        float nextIconCx = drawNextRect.centerX() + nextIconShiftX;
        float nextIconCy = drawNextRect.centerY();
        canvas.scale(nextIconScale, nextIconScale, nextIconCx, nextIconCy);
        drawSkipNextIcon(canvas, nextIconCx, nextIconCy, iconR, nextIcon);
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

    private void drawSourceChipPill(Canvas canvas) {
        String cleanSource = sourceName != null ? sourceName.trim() : "";
        if (cleanSource.isEmpty() || sourceChipRect.width() <= 20f) {
            return;
        }
        String prefix = "de".equals(Locale.getDefault().getLanguage()) ? "Aus: " : "Playing from ";
        String label = prefix + cleanSource;

        float scale = 1f - 0.06f * buttonPress[HIT_SOURCE_CHIP];
        canvas.save();
        canvas.scale(scale, scale, sourceChipRect.centerX(), sourceChipRect.centerY());
        float rad = sourceChipRect.height() * 0.5f;
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(activePalette.glassPillBg);
        canvas.drawRoundRect(sourceChipRect, rad, rad, fillPaint);

        sourceChipPaint.setColor(activePalette.secondaryText);
        float maxTextW = Math.max(24f * density, sourceChipRect.width() - 22f * density);
        String ell = TextUtils.ellipsize(label, sourceChipPaint, maxTextW, TextUtils.TruncateAt.END).toString();
        Paint.FontMetrics fm = sourceChipPaint.getFontMetrics();
        float base = sourceChipRect.centerY() - (fm.ascent + fm.descent) * 0.5f;
        float textW = sourceChipPaint.measureText(ell);
        canvas.drawText(ell, sourceChipRect.centerX() - textW * 0.5f, base, sourceChipPaint);
        canvas.restore();
    }

    private void drawDesktopTopHeader(Canvas canvas) {
        // Left circular collapse button
        float collapseScale = 1f - 0.10f * buttonPress[HIT_COLLAPSE];
        canvas.save();
        canvas.scale(collapseScale, collapseScale, collapseRect.centerX(), collapseRect.centerY());
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(activePalette.glassPillBg);
        canvas.drawOval(collapseRect, fillPaint);
        drawChevronDownIcon(canvas, collapseRect.centerX(), collapseRect.centerY(),
                6.2f * density, activePalette.primaryDeep);
        canvas.restore();

        // "Now Playing" title
        headerPaint.setColor(activePalette.primaryDeep);
        Paint.FontMetrics fm = headerPaint.getFontMetrics();
        float titleBaseline = collapseRect.centerY() - (fm.ascent + fm.descent) * 0.5f;
        float titleX = desktopLayout.headerTitleX;
        float maxTitleW = Math.max(40f * density, desktopLayout.headerTitleMaxRight - titleX);
        String headerTitle = TextUtils.ellipsize("Now Playing", headerPaint, maxTitleW, TextUtils.TruncateAt.END).toString();
        canvas.drawText(headerTitle, titleX, titleBaseline, headerPaint);

        if (desktopShowSourceChip && !sourceChipRect.isEmpty()) {
            drawSourceChipPill(canvas);
        }

        // Right connected split pill: [Panel Focus Toggle | More ⋮]
        float outerR = desktopPanelToggleRect.height() * 0.5f;
        float innerR = 7f * density;
        float focusFrac = 1f - Math.max(0f, Math.min(1f, desktopPanelReveal));

        float toggleScale = 1f - 0.09f * buttonPress[HIT_DESKTOP_PANEL_TOGGLE];
        int toggleBg = MaterialYouColorEngine.blendRgb(
                activePalette.glassPillBg, activePalette.glassPillActiveBg, focusFrac);
        int toggleIcon = MaterialYouColorEngine.blendRgb(
                activePalette.primaryDeep, activePalette.glassPillActiveIcon, focusFrac);
        canvas.save();
        canvas.scale(toggleScale, toggleScale, desktopPanelToggleRect.centerX(), desktopPanelToggleRect.centerY());
        drawAsymmetricRoundRect(canvas, desktopPanelToggleRect, outerR, innerR, innerR, outerR, toggleBg);
        drawPanelToggleIcon(canvas, desktopPanelToggleRect.centerX(), desktopPanelToggleRect.centerY(),
                8.5f * density, toggleIcon, desktopPanelOpen);
        canvas.restore();

        float moreScale = 1f - 0.09f * buttonPress[HIT_MORE_BTN];
        canvas.save();
        canvas.scale(moreScale, moreScale, moreBtnRect.centerX(), moreBtnRect.centerY());
        drawAsymmetricRoundRect(canvas, moreBtnRect, innerR, outerR, outerR, innerR, activePalette.glassPillBg);
        drawMoreDotsIcon(canvas, moreBtnRect.centerX(), moreBtnRect.centerY(), activePalette.primaryDeep);
        canvas.restore();
    }

    private void drawDesktopRightPanel(Canvas canvas, float externalAlpha) {
        float pr = easeInOutCubic(desktopPanelReveal);
        float combinedAlpha = Math.max(0f, Math.min(1f, externalAlpha * pr));
        if (combinedAlpha <= 0.01f || desktopPanelRect.width() <= 20f || desktopPanelRect.height() <= 20f) {
            return;
        }

        float slideX = (1f - pr) * 36f * density;
        int panelLayer = combinedAlpha < 0.99f
                ? canvas.saveLayerAlpha(
                        desktopPanelRect.left - 18f * density + slideX,
                        desktopPanelRect.top - 18f * density,
                        desktopPanelRect.right + 18f * density + slideX,
                        desktopPanelRect.bottom + 18f * density,
                        Math.round(255f * combinedAlpha))
                : -1;

        canvas.save();
        canvas.translate(slideX, 0f);

        float panelRad = 28f * density;
        drawSoftRectShadow(canvas, desktopPanelRect, panelRad, activePalette.shadowBase);

        int panelBg = MaterialYouColorEngine.blendRgb(
                activePalette.capsuleFrameBg, activePalette.lyricsCardBg, 0.55f);
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(panelBg);
        canvas.drawRoundRect(desktopPanelRect, panelRad, panelRad, fillPaint);

        strokePaint.setStrokeWidth(1f * density);
        strokePaint.setColor(MaterialYouColorEngine.withAlpha(activePalette.primaryDeep, 0x1E));
        canvas.drawRoundRect(desktopPanelRect, panelRad, panelRad, strokePaint);

        // Segmented Pill Header: [ Play Queue | Lyrics ] + [Expand Full Queue]
        float segPad = 3f * density;
        tempRect.set(
                desktopTabQueueRect.left - segPad,
                desktopTabQueueRect.top - segPad,
                desktopTabLyricsRect.right + segPad,
                desktopTabLyricsRect.bottom + segPad
        );
        float segOuterR = tempRect.height() * 0.5f;
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(activePalette.capsuleSegmentBg);
        canvas.drawRoundRect(tempRect, segOuterR, segOuterR, fillPaint);

        float tabT = easeInOutCubic(desktopTabFrac);
        lerpRect(desktopTabQueueRect, desktopTabLyricsRect, tabT, tempRect);
        float activePillR = tempRect.height() * 0.5f;
        fillPaint.setColor(activePalette.glassPillActiveBg);
        canvas.drawRoundRect(tempRect, activePillR, activePillR, fillPaint);

        boolean de = "de".equals(Locale.getDefault().getLanguage());
        String queueLabel = de ? "Warteschlange" : "Play Queue";
        String lyricsLabel = de ? "Songtext" : "Lyrics";
        Paint.FontMetrics tfm = tabLabelPaint.getFontMetrics();

        float qScale = 1f - 0.06f * buttonPress[HIT_DESKTOP_TAB_QUEUE];
        int qTextColor = MaterialYouColorEngine.blendRgb(
                activePalette.primaryDeep, activePalette.glassPillActiveIcon, 1f - tabT);
        tabLabelPaint.setColor(qTextColor);
        canvas.save();
        canvas.scale(qScale, qScale, desktopTabQueueRect.centerX(), desktopTabQueueRect.centerY());
        String ellQ = TextUtils.ellipsize(
                queueLabel, tabLabelPaint, Math.max(24f * density, desktopTabQueueRect.width() - 12f * density),
                TextUtils.TruncateAt.END).toString();
        canvas.drawText(ellQ, desktopTabQueueRect.centerX(),
                desktopTabQueueRect.centerY() - (tfm.ascent + tfm.descent) * 0.5f, tabLabelPaint);
        canvas.restore();

        float lScale = 1f - 0.06f * buttonPress[HIT_DESKTOP_TAB_LYRICS];
        int lTextColor = MaterialYouColorEngine.blendRgb(
                activePalette.primaryDeep, activePalette.glassPillActiveIcon, tabT);
        tabLabelPaint.setColor(lTextColor);
        canvas.save();
        canvas.scale(lScale, lScale, desktopTabLyricsRect.centerX(), desktopTabLyricsRect.centerY());
        String ellL = TextUtils.ellipsize(
                lyricsLabel, tabLabelPaint, Math.max(24f * density, desktopTabLyricsRect.width() - 12f * density),
                TextUtils.TruncateAt.END).toString();
        canvas.drawText(ellL, desktopTabLyricsRect.centerX(),
                desktopTabLyricsRect.centerY() - (tfm.ascent + tfm.descent) * 0.5f, tabLabelPaint);
        canvas.restore();

        // Expand to Full Play Queue & Suggested Tracks Sheet button
        float fullScale = 1f - 0.09f * buttonPress[HIT_DESKTOP_OPEN_FULL_QUEUE];
        canvas.save();
        canvas.scale(fullScale, fullScale, desktopOpenFullQueueRect.centerX(), desktopOpenFullQueueRect.centerY());
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(activePalette.glassPillBg);
        canvas.drawOval(desktopOpenFullQueueRect, fillPaint);
        drawExpandMaximizeIcon(canvas, desktopOpenFullQueueRect.centerX(), desktopOpenFullQueueRect.centerY(),
                8.0f * density, activePalette.primaryDeep);
        canvas.restore();

        // Panel Body Content (crossfade between Play Queue and Lyrics)
        if (1f - desktopTabFrac > 0.01f) {
            desktopQueueRenderer.draw(
                    canvas,
                    desktopPanelBodyRect,
                    1f - desktopTabFrac,
                    "PLAYING".equals(playState),
                    activePalette.primaryDeep,
                    activePalette.secondaryText,
                    activePalette.glassPillBg,
                    activePalette.capsuleSegmentBg,
                    activePalette.capsuleSegmentBg,
                    activePalette.glassPillActiveBg,
                    activePalette.glassPillActiveIcon
            );
        }
        if (desktopTabFrac > 0.01f) {
            drawFullScreenLyrics(canvas, desktopTabFrac);
        }

        canvas.restore();
        if (panelLayer >= 0) {
            canvas.restoreToCount(panelLayer);
        }
    }

    private void drawDesktopBottomDock(Canvas canvas, float externalAlpha) {
        if (externalAlpha <= 0.01f || desktopDockRect.width() <= 20f || desktopDockRect.height() <= 20f) {
            return;
        }
        int dockLayer = externalAlpha < 0.99f
                ? canvas.saveLayerAlpha(
                        desktopDockRect.left - 18f * density,
                        desktopDockRect.top - 18f * density,
                        desktopDockRect.right + 18f * density,
                        desktopDockRect.bottom + 18f * density,
                        Math.round(255f * externalAlpha))
                : -1;

        float dockRad = 28f * density;
        drawSoftRectShadow(canvas, desktopDockRect, dockRad, activePalette.shadowBase);
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(activePalette.capsuleFrameBg);
        canvas.drawRoundRect(desktopDockRect, dockRad, dockRad, fillPaint);

        strokePaint.setStrokeWidth(1f * density);
        strokePaint.setColor(MaterialYouColorEngine.withAlpha(activePalette.primaryDeep, 0x1E));
        canvas.drawRoundRect(desktopDockRect, dockRad, dockRad, strokePaint);

        // 1. Left Zone: Track Title + Explicit [E] + Artist + Favorite Circle
        float left = titleAreaRect.left;
        float maxW = Math.max(24f * density, titleAreaRect.width());
        float titlePress = 1f - 0.02f * buttonPress[HIT_TITLE_AREA];
        canvas.save();
        canvas.scale(titlePress, titlePress, left + maxW * 0.35f, titleAreaRect.centerY());

        float explicitW = isExplicit ? (18f * density) : 0f;
        dockTitlePaint.setColor(activePalette.primaryDeep);
        String ellTitle = TextUtils.ellipsize(
                title, dockTitlePaint, Math.max(16f * density, maxW - explicitW),
                TextUtils.TruncateAt.END).toString();
        float renderedTitleW = dockTitlePaint.measureText(ellTitle);

        dockArtistPaint.setColor(activePalette.secondaryText);
        String ellArtist = TextUtils.ellipsize(artist, dockArtistPaint, maxW, TextUtils.TruncateAt.END).toString();

        float titleBaseline = titleAreaRect.centerY() - 2.5f * density;
        float artistBaseline = titleAreaRect.centerY() + 15.5f * density;
        canvas.drawText(ellTitle, left, titleBaseline, dockTitlePaint);

        if (isExplicit && !ellTitle.isEmpty()) {
            float badgeSize = 13.5f * density;
            float badgeLeft = left + renderedTitleW + 5f * density;
            float badgeTop = titleBaseline - badgeSize * 0.85f;
            tempRect.set(badgeLeft, badgeTop, badgeLeft + badgeSize, badgeTop + badgeSize);
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(activePalette.secondaryText, 0x36));
            canvas.drawRoundRect(tempRect, 3.5f * density, 3.5f * density, fillPaint);

            explicitPaint.setColor(activePalette.primaryDeep);
            Paint.FontMetrics efm = explicitPaint.getFontMetrics();
            canvas.drawText("E", tempRect.centerX(),
                    tempRect.centerY() - (efm.ascent + efm.descent) * 0.5f, explicitPaint);
        }
        canvas.drawText(ellArtist, left, artistBaseline, dockArtistPaint);
        canvas.restore();

        float favScale = 1f - 0.08f * buttonPress[HIT_FAVORITE];
        int favBg = MaterialYouColorEngine.blendRgb(
                activePalette.capsuleSegmentBg, activePalette.glassPillActiveBg, favoriteFrac);
        int favIcon = MaterialYouColorEngine.blendRgb(
                activePalette.primaryDeep, activePalette.glassPillActiveIcon, favoriteFrac);
        canvas.save();
        canvas.scale(favScale, favScale, favoriteRect.centerX(), favoriteRect.centerY());
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(favBg);
        canvas.drawOval(favoriteRect, fillPaint);
        canvas.save();
        canvas.scale(heartPopImpulse, heartPopImpulse, favoriteRect.centerX(), favoriteRect.centerY());
        drawHeartIcon(canvas, favoriteRect.centerX(), favoriteRect.centerY(),
                7.6f * density, favIcon, isFavorite);
        canvas.restore();
        canvas.restore();

        // 2. Center Zone: [Shuffle | Prev | Play | Next | Repeat] + Inline [Time === Seekbar === Duration]
        float auxR = 7.4f * density;
        float shufScale = 1f - 0.08f * buttonPress[HIT_SHUFFLE];
        int shufBg = MaterialYouColorEngine.blendRgb(
                activePalette.capsuleSegmentBg, activePalette.glassPillActiveBg, shuffleFrac);
        int shufIcon = MaterialYouColorEngine.blendRgb(
                activePalette.primaryDeep, activePalette.glassPillActiveIcon, shuffleFrac);
        canvas.save();
        canvas.scale(shufScale, shufScale, shuffleRect.centerX(), shuffleRect.centerY());
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(shufBg);
        canvas.drawRoundRect(shuffleRect, shuffleRect.height() * 0.5f, shuffleRect.height() * 0.5f, fillPaint);
        drawShuffleIcon(canvas, shuffleRect.centerX(), shuffleRect.centerY(), auxR, shufIcon);
        canvas.restore();

        drawTransportControls(canvas);

        float repScale = 1f - 0.08f * buttonPress[HIT_REPEAT];
        int repBg = MaterialYouColorEngine.blendRgb(
                activePalette.capsuleSegmentBg, activePalette.glassPillActiveBg, repeatFrac);
        int repIcon = MaterialYouColorEngine.blendRgb(
                activePalette.primaryDeep, activePalette.glassPillActiveIcon, repeatFrac);
        canvas.save();
        canvas.scale(repScale, repScale, repeatRect.centerX(), repeatRect.centerY());
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(repBg);
        canvas.drawRoundRect(repeatRect, repeatRect.height() * 0.5f, repeatRect.height() * 0.5f, fillPaint);
        drawRepeatIcon(canvas, repeatRect.centerX(), repeatRect.centerY(),
                auxR, repIcon, "SINGLE".equals(repeatMode));
        canvas.restore();

        float shownProgress = drawSeekbarTrackAndThumb(canvas, activeSeekBarRect);
        timePaint.setColor(activePalette.secondaryText);
        Paint.FontMetrics timeFm = timePaint.getFontMetrics();
        float timeBase = activeSeekBarRect.centerY() - (timeFm.ascent + timeFm.descent) * 0.5f;
        String shownTime = isScrubbing ? computeScrubbedTimeString(shownProgress) : progressTime;
        timePaint.setTextAlign(Paint.Align.RIGHT);
        canvas.drawText(shownTime, activeSeekBarRect.left - 6f * density, timeBase, timePaint);
        timePaint.setTextAlign(Paint.Align.LEFT);
        canvas.drawText(durationTime, activeSeekBarRect.right + 6f * density, timeBase, timePaint);

        // 3. Right Zone: Connected [Lyrics | Queue | Cast] + [Volume] + [Quality/Spec Pill]
        float pillOuterR = castRect.height() * 0.5f;
        float pillInnerR = 6f * density;
        float iconSmallR = (desktopCompactHeight ? 7.2f : 8.2f) * density;

        float lyrActive = desktopPanelOpen ? desktopTabFrac : 0f;
        float queueActive = desktopPanelOpen ? (1f - desktopTabFrac) : 0f;

        if (isEffectiveShowLyricsButton() && lyricsBtnRect.width() > 1f) {
            float lScale = 1f - 0.09f * buttonPress[HIT_LYRICS_BTN];
            int lBg = MaterialYouColorEngine.blendRgb(
                    activePalette.capsuleSegmentBg, activePalette.glassPillActiveBg, lyrActive);
            int lIcon = MaterialYouColorEngine.blendRgb(
                    activePalette.primaryDeep, activePalette.glassPillActiveIcon, lyrActive);
            canvas.save();
            canvas.scale(lScale, lScale, lyricsBtnRect.centerX(), lyricsBtnRect.centerY());
            drawAsymmetricRoundRect(canvas, lyricsBtnRect, pillOuterR, pillInnerR, pillInnerR, pillOuterR, lBg);
            drawLyricsQuoteIcon(canvas, lyricsBtnRect.centerX(), lyricsBtnRect.centerY(), iconSmallR, lIcon);
            canvas.restore();
        }

        float qScale = 1f - 0.09f * buttonPress[HIT_QUEUE];
        int qBg = MaterialYouColorEngine.blendRgb(
                activePalette.capsuleSegmentBg, activePalette.glassPillActiveBg, queueActive);
        int qIcon = MaterialYouColorEngine.blendRgb(
                activePalette.primaryDeep, activePalette.glassPillActiveIcon, queueActive);
        canvas.save();
        canvas.scale(qScale, qScale, queueRect.centerX(), queueRect.centerY());
        if (isEffectiveShowLyricsButton() && lyricsBtnRect.width() > 1f) {
            drawAsymmetricRoundRect(canvas, queueRect, pillInnerR, pillInnerR, pillInnerR, pillInnerR, qBg);
        } else {
            drawAsymmetricRoundRect(canvas, queueRect, pillOuterR, pillInnerR, pillInnerR, pillOuterR, qBg);
        }
        drawQueueMusicIcon(canvas, queueRect.centerX(), queueRect.centerY(), iconSmallR, qIcon);
        canvas.restore();

        float cScale = 1f - 0.09f * buttonPress[HIT_CAST];
        int cBg = MaterialYouColorEngine.blendRgb(
                activePalette.capsuleSegmentBg, activePalette.glassPillActiveBg, broadcastFrac);
        int cIcon = MaterialYouColorEngine.blendRgb(
                activePalette.primaryDeep, activePalette.glassPillActiveIcon, broadcastFrac);
        canvas.save();
        canvas.scale(cScale, cScale, castRect.centerX(), castRect.centerY());
        drawAsymmetricRoundRect(canvas, castRect, pillInnerR, pillOuterR, pillOuterR, pillInnerR, cBg);
        drawDeviceCastIcon(canvas, castRect.centerX(), castRect.centerY(), iconSmallR, cIcon);
        canvas.restore();

        if (desktopShowVolume) {
            float vIconScale = 1f - 0.08f * buttonPress[HIT_DESKTOP_VOLUME_ICON];
            canvas.save();
            canvas.scale(vIconScale, vIconScale, desktopVolumeIconRect.centerX(), desktopVolumeIconRect.centerY());
            drawVolumeIcon(canvas, desktopVolumeIconRect.centerX(), desktopVolumeIconRect.centerY(),
                    8.2f * density, volumeFraction, activePalette.primaryDeep);
            canvas.restore();

            float sL = desktopVolumeSliderRect.left + 5f * density;
            float sR = desktopVolumeSliderRect.right - 5f * density;
            float sCy = desktopVolumeSliderRect.centerY();
            float sW = Math.max(1f, sR - sL);
            float vThumbX = sL + sW * Math.max(0f, Math.min(1f, volumeFraction));

            strokePaint.setStrokeWidth(3.2f * density);
            strokePaint.setColor(MaterialYouColorEngine.withAlpha(activePalette.primaryDeep, 0x38));
            canvas.drawLine(sL, sCy, sR, sCy, strokePaint);

            if (vThumbX > sL + 1f) {
                strokePaint.setColor(activePalette.primaryDeep);
                canvas.drawLine(sL, sCy, vThumbX, sCy, strokePaint);
            }
            float vThumbR = (isDraggingVolume ? 7.0f : 5.4f) * density;
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(activePalette.primaryDeep);
            canvas.drawCircle(vThumbX, sCy, vThumbR, fillPaint);
        }

        String qualityLabel = getDesktopQualityLabel();
        if (!qualityLabel.isEmpty()) {
            drawQualityPillBadge(canvas, qualityLabel, 1f);
        }

        if (dockLayer >= 0) {
            canvas.restoreToCount(dockLayer);
        }
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

    public static void prewarmIconCache(Context ctx) {
        if (iconsPrewarmed || ctx == null) {
            return;
        }
        iconsPrewarmed = true;
        final String[] names = {
                "ic_chevron_down",
                "ic_close",
                "ic_media_lyric_sync_medium",
                "ic_devices_connectivity_broadcast_medium",
                "ic_queue",
                "ic_media_lyrics_medium",
                "ic_more_vertical",
                "ic_play",
                "ic_pause",
                "ic_next",
                "ic_previous",
                "ic_shuffle",
                "ic_repeat",
                "ic_repeat_one",
                "ic_favorite",
                "ic_favorite_filled",
                "ic_arrows_maximize_2_regular",
                "ic_arrows_minimize_2_regular",
                "ic_close_small"
        };
        try {
            android.content.res.Resources res = ctx.getResources();
            String pkg = ctx.getPackageName();
            for (String name : names) {
                ICON_RES_ID_CACHE.computeIfAbsent(name, n -> res.getIdentifier(n, "drawable", pkg));
            }
        } catch (Throwable ignored) {
        }
    }

    private static Drawable loadTidalIcon(Context ctx, String name) {
        try {
            Integer cachedId = ICON_RES_ID_CACHE.get(name);
            int resId;
            if (cachedId != null) {
                resId = cachedId;
            } else {
                resId = ctx.getResources().getIdentifier(name, "drawable", ctx.getPackageName());
                ICON_RES_ID_CACHE.put(name, resId);
            }
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

    private void drawPanelToggleIcon(Canvas canvas, float cx, float cy, float r, int color, boolean panelOpen) {
        Drawable d = panelOpen ? iconMinimize : iconMaximize;
        if (drawTidalIcon(canvas, d, cx, cy, r * 2.15f, color)) {
            return;
        }
        strokePaint.setColor(color);
        strokePaint.setStrokeWidth(1.8f * density);
        tempRect.set(cx - r * 0.85f, cy - r * 0.68f, cx + r * 0.85f, cy + r * 0.68f);
        canvas.drawRoundRect(tempRect, 2.6f * density, 2.6f * density, strokePaint);
        float splitX = cx + r * 0.22f;
        canvas.drawLine(splitX, tempRect.top, splitX, tempRect.bottom, strokePaint);
        if (panelOpen) {
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(color);
            tempRect.set(splitX + 1.5f * density, tempRect.top + 2f * density,
                    tempRect.right - 2f * density, tempRect.bottom - 2f * density);
            canvas.drawRoundRect(tempRect, 1.2f * density, 1.2f * density, fillPaint);
        }
    }

    private void drawExpandMaximizeIcon(Canvas canvas, float cx, float cy, float r, int color) {
        if (drawTidalIcon(canvas, iconMaximize, cx, cy, r * 2.15f, color)) {
            return;
        }
        strokePaint.setColor(color);
        strokePaint.setStrokeWidth(1.85f * density);
        float d = r * 0.68f;
        float a = r * 0.42f;
        // Top-right arrow
        canvas.drawLine(cx + 1.2f * density, cy - 1.2f * density, cx + d, cy - d, strokePaint);
        tempPath.reset();
        tempPath.moveTo(cx + d - a, cy - d);
        tempPath.lineTo(cx + d, cy - d);
        tempPath.lineTo(cx + d, cy - d + a);
        canvas.drawPath(tempPath, strokePaint);
        // Bottom-left arrow
        canvas.drawLine(cx - 1.2f * density, cy + 1.2f * density, cx - d, cy + d, strokePaint);
        tempPath.reset();
        tempPath.moveTo(cx - d + a, cy + d);
        tempPath.lineTo(cx - d, cy + d);
        tempPath.lineTo(cx - d, cy + d - a);
        canvas.drawPath(tempPath, strokePaint);
    }

    private void drawVolumeIcon(Canvas canvas, float cx, float cy, float r, float frac, int color) {
        // Speaker body + cone
        tempPath.reset();
        float left = cx - r * 0.78f;
        float bodyRight = cx - r * 0.30f;
        float coneRight = cx + r * 0.14f;
        tempPath.moveTo(left, cy - r * 0.30f);
        tempPath.lineTo(bodyRight, cy - r * 0.30f);
        tempPath.lineTo(coneRight, cy - r * 0.74f);
        tempPath.lineTo(coneRight, cy + r * 0.74f);
        tempPath.lineTo(bodyRight, cy + r * 0.30f);
        tempPath.lineTo(left, cy + r * 0.30f);
        tempPath.close();
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(color);
        canvas.drawPath(tempPath, fillPaint);

        strokePaint.setColor(color);
        strokePaint.setStrokeWidth(1.75f * density);
        if (frac <= 0.01f) {
            // Muted X
            float mx = cx + r * 0.56f;
            float xr = r * 0.28f;
            canvas.drawLine(mx - xr, cy - xr, mx + xr, cy + xr, strokePaint);
            canvas.drawLine(mx + xr, cy - xr, mx - xr, cy + xr, strokePaint);
        } else {
            float arcCx = cx + r * 0.10f;
            tempRect.set(arcCx - r * 0.42f, cy - r * 0.42f, arcCx + r * 0.42f, cy + r * 0.42f);
            canvas.drawArc(tempRect, -48f, 96f, false, strokePaint);
            if (frac > 0.45f) {
                tempRect.set(arcCx - r * 0.78f, cy - r * 0.78f, arcCx + r * 0.78f, cy + r * 0.78f);
                canvas.drawArc(tempRect, -50f, 100f, false, strokePaint);
            }
        }
    }

    // ---- Touch & Gesture Dispatch ----

    private int hitTest(float x, float y) {
        float slop = 6f * density;
        if (layoutMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE) {
            if (containsWithSlop(collapseRect, x, y, slop)) return HIT_COLLAPSE;
            if (desktopShowSourceChip && containsWithSlop(sourceChipRect, x, y, 4f * density)) return HIT_SOURCE_CHIP;
            if (containsWithSlop(desktopPanelToggleRect, x, y, 3f * density)) return HIT_DESKTOP_PANEL_TOGGLE;
            if (containsWithSlop(moreBtnRect, x, y, 3f * density)) return HIT_MORE_BTN;

            if (desktopPanelReveal > 0.5f) {
                if (containsWithSlop(desktopTabQueueRect, x, y, 3f * density)) return HIT_DESKTOP_TAB_QUEUE;
                if (containsWithSlop(desktopTabLyricsRect, x, y, 3f * density)) return HIT_DESKTOP_TAB_LYRICS;
                if (containsWithSlop(desktopOpenFullQueueRect, x, y, 4f * density)) return HIT_DESKTOP_OPEN_FULL_QUEUE;
                if (desktopPanelTab == TAB_LYRICS) {
                    if (syncPillReveal > 0.5f && containsWithSlop(lyricsSyncPillRect, x, y, 4f * density)) {
                        return HIT_LYRICS_SYNC;
                    }
                    if (containsWithSlop(desktopPanelBodyRect, x, y, 0f)) return HIT_LYRICS_AREA;
                } else {
                    if (containsWithSlop(desktopPanelBodyRect, x, y, 0f)) return HIT_DESKTOP_QUEUE_AREA;
                }
            }

            if (containsWithSlop(titleAreaRect, x, y, 4f * density)) return HIT_TITLE_AREA;
            if (containsWithSlop(favoriteRect, x, y, 4f * density)) return HIT_FAVORITE;
            if (containsWithSlop(shuffleRect, x, y, 4f * density)) return HIT_SHUFFLE;
            if (containsWithSlop(prevBtnRect, x, y, 4f * density)) return HIT_PREV;
            if (containsWithSlop(playBtnRect, x, y, 4f * density)) return HIT_PLAY;
            if (containsWithSlop(nextBtnRect, x, y, 4f * density)) return HIT_NEXT;
            if (containsWithSlop(repeatRect, x, y, 4f * density)) return HIT_REPEAT;
            if (containsWithSlop(seekBarTouchRect, x, y, 8f * density)) return HIT_SEEKBAR;
            if (isEffectiveShowLyricsButton() && containsWithSlop(lyricsBtnRect, x, y, 3f * density)) return HIT_LYRICS_BTN;
            if (containsWithSlop(queueRect, x, y, 3f * density)) return HIT_QUEUE;
            if (containsWithSlop(castRect, x, y, 3f * density)) return HIT_CAST;
            if (desktopShowVolume && containsWithSlop(desktopVolumeIconRect, x, y, 4f * density)) return HIT_DESKTOP_VOLUME_ICON;
            if (desktopShowVolume && containsWithSlop(desktopVolumeSliderRect, x, y, 8f * density)) return HIT_DESKTOP_VOLUME_SLIDER;
            if (!getDesktopQualityLabel().isEmpty() && containsWithSlop(badgeRect, x, y, 6f * density)) return HIT_BADGE;
            if (containsWithSlop(coverRect, x, y, 0f)) return HIT_COVER;
            return HIT_NONE;
        }

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
        if (desktopShowSourceChip && containsWithSlop(sourceChipRect, x, y, 4f * density)) return HIT_SOURCE_CHIP;
        if (containsWithSlop(castRect, x, y, 3f * density)) return HIT_CAST;
        if (containsWithSlop(queueRect, x, y, 3f * density)) return HIT_QUEUE;
        if (containsWithSlop(coverRect, x, y, 0f)) return HIT_COVER;
        if (isEffectiveShowLyricsButton() && containsWithSlop(lyricsBtnRect, x, y, 3f * density)) return HIT_LYRICS_BTN;
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

    private static int hitToTransportIndex(int hit) {
        if (hit == HIT_PREV) return 0;
        if (hit == HIT_PLAY) return 1;
        if (hit == HIT_NEXT) return 2;
        return -1;
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
                isScrollingQueue = false;
                isDraggingVolume = false;
                if (hit == HIT_LYRICS_AREA) {
                    lyricsFlingVel = 0f;
                    lyricsScrollVel = 0f;
                } else if (hit == HIT_DESKTOP_QUEUE_AREA) {
                    desktopQueueRenderer.cancelFling();
                }

                int tIdx = hitToTransportIndex(hit);
                if (tIdx >= 0 && (tIdx != 2 || isNextEnabled)) {
                    transportTapHoldUntilMs[tIdx] = lastMoveTimeMs + 115L;
                    transportExpandVel[tIdx] = Math.max(transportExpandVel[tIdx], 6.5f);
                }

                if (hit == HIT_SEEKBAR) {
                    isScrubbing = true;
                    updateScrubFromX(x);
                    if (getParent() != null) {
                        getParent().requestDisallowInterceptTouchEvent(true);
                    }
                    performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                } else if (hit == HIT_DESKTOP_VOLUME_SLIDER) {
                    isDraggingVolume = true;
                    updateVolumeFromX(x);
                    if (getParent() != null) {
                        getParent().requestDisallowInterceptTouchEvent(true);
                    }
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
                if (isDraggingVolume) {
                    updateVolumeFromX(x);
                    invalidate();
                    return true;
                }

                if (activeHitTarget == HIT_DESKTOP_QUEUE_AREA) {
                    if (!isScrollingQueue && Math.abs(dy) > touchSlop) {
                        isScrollingQueue = true;
                        lastTouchY = y;
                        lastQueueMoveMs = SystemClock.uptimeMillis();
                        if (getParent() != null) {
                            getParent().requestDisallowInterceptTouchEvent(true);
                        }
                    }
                    if (isScrollingQueue) {
                        long now = SystemClock.uptimeMillis();
                        float dtSec = Math.max(0.004f, Math.min(0.06f, (now - lastQueueMoveMs) / 1000f));
                        float deltaY = lastTouchY - y;
                        lastTouchY = y;
                        lastQueueMoveMs = now;
                        desktopQueueRenderer.onTouchScrollDelta(
                                deltaY, dtSec, Math.max(1f, desktopPanelBodyRect.height()));
                        startAnimationLoop();
                        invalidate();
                        return true;
                    }
                } else if (activeHitTarget == HIT_LYRICS_AREA) {
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
                        float maxScroll = Math.max(0f, activeTotalLyricsContentH() - vpH);
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
                boolean wasDraggingVol = isDraggingVolume;
                boolean wasSwiping = isSwipingCover;
                boolean wasScrollingLyrics = isScrollingLyrics;
                boolean wasScrollingQueue = isScrollingQueue;
                float finalDragX = coverDragX;

                activeHitTarget = HIT_NONE;
                isScrubbing = false;
                isDraggingVolume = false;
                isSwipingCover = false;
                isScrollingLyrics = false;
                isScrollingQueue = false;

                if (wasScrubbing) {
                    updateScrubFromX(x);
                    long durMs = syllableClock.getDurationMs() > 0L
                            ? syllableClock.getDurationMs()
                            : (trackDurationMs > 0L ? trackDurationMs : parseDurationTextMs(durationTime));
                    if (durMs > 0L) {
                        syllableClock.onUserSeek(
                                Math.round(scrubProgress * durMs),
                                SystemClock.elapsedRealtime()
                        );
                    }
                    scrubHoldUntilMs = SystemClock.uptimeMillis() + 400L;
                    ExpressivePlayerBridge.dispatchSeekFinished();
                    performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                    startAnimationLoop();
                    return true;
                }

                if (wasDraggingVol) {
                    updateVolumeFromX(x);
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

                if (wasScrollingQueue) {
                    desktopQueueRenderer.onTouchRelease(SystemClock.uptimeMillis() - lastQueueMoveMs);
                    startAnimationLoop();
                    return true;
                }

                int upTarget = hitTest(x, y);
                int tIdx = hitToTransportIndex(downTarget);
                if (tIdx >= 0 && upTarget == downTarget && (tIdx != 2 || isNextEnabled)) {
                    transportTapHoldUntilMs[tIdx] = Math.max(
                            transportTapHoldUntilMs[tIdx], SystemClock.uptimeMillis() + 70L);
                }
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
                transportTapHoldUntilMs[0] = 0L;
                transportTapHoldUntilMs[1] = 0L;
                transportTapHoldUntilMs[2] = 0L;
                isDraggingVolume = false;
                isSwipingCover = false;
                isScrollingLyrics = false;
                isScrollingQueue = false;
                lyricsFlingVel = 0f;
                desktopQueueRenderer.cancelFling();
                startAnimationLoop();
                return true;
            }
            default:
                return super.onTouchEvent(event);
        }
    }

    private void updateVolumeFromX(float x) {
        float sL = desktopVolumeSliderRect.left + 5f * density;
        float sR = desktopVolumeSliderRect.right - 5f * density;
        float frac = (x - sL) / Math.max(1f, sR - sL);
        setVolumeFromFraction(frac);
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
                localLyricsOpen = false;
                if (isLyricsVisible) {
                    ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_LYRICS);
                } else {
                    startAnimationLoop();
                }
                break;
            case HIT_LYRICS_SYNC:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                lastUserLyricsScrollMs = 0L;
                lyricsFlingVel = 0f;
                updateAutoLyricsScrollTarget();
                startAnimationLoop();
                break;
            case HIT_LYRICS_AREA:
                if ((isLyricsTargetOpen() || isEffectiveLyricsVisible()) && isSyllableModeActive()) {
                    float localY = (y - lyricsViewportRect.top) + lyricsScrollY;
                    int tappedIdx = syllableRenderer.hitTestLineIndex(localY);
                    if (tappedIdx >= 0) {
                        long targetMs = syllableRenderer.getLineStartMs(tappedIdx);
                        syllableRenderer.flashTappedLine(tappedIdx);
                        lastUserLyricsScrollMs = 0L;
                        lyricsFlingVel = 0f;
                        syllableClock.onUserSeek(targetMs, SystemClock.elapsedRealtime());
                        performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                        if (isLyricsVisible && isLyricsSynced) {
                            ExpressivePlayerBridge.dispatchLyricLineClicked(targetMs);
                        } else {
                            seekFromLocalLyricTap(targetMs);
                        }
                        startAnimationLoop();
                    }
                } else if ((isLyricsTargetOpen() || isEffectiveLyricsVisible())
                        && isActiveNativeLyricsSynced() && !lyricItemTops.isEmpty()) {
                    long[] activeTimes = activeNativeLyricTimesMs();
                    if (activeTimes != null) {
                        float localY = (y - lyricsViewportRect.top) + lyricsScrollY;
                        for (int i = 0; i < lyricItemTops.size(); i++) {
                            float top = lyricItemTops.get(i);
                            float bot = top + lyricItemHeights.get(i) + 22f * density;
                            if (localY >= top - 8f * density && localY <= bot && i < activeTimes.length) {
                                tappedLyricIndex = i;
                                tappedLyricFlash = 1f;
                                lastUserLyricsScrollMs = 0L;
                                lyricsFlingVel = 0f;
                                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                                if (isLyricsVisible && isLyricsSynced) {
                                    ExpressivePlayerBridge.dispatchLyricLineClicked(activeTimes[i]);
                                } else {
                                    extHighlightedLyricIndex = i;
                                    syllableClock.onUserSeek(activeTimes[i], SystemClock.elapsedRealtime());
                                    seekFromLocalLyricTap(activeTimes[i]);
                                }
                                startAnimationLoop();
                                break;
                            }
                        }
                    }
                }
                break;
            case HIT_SOURCE_CHIP:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_SOURCE_LABEL);
                break;
            case HIT_DESKTOP_PANEL_TOGGLE:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                desktopPanelOpen = !desktopPanelOpen;
                startAnimationLoop();
                break;
            case HIT_DESKTOP_TAB_QUEUE:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                desktopPanelOpen = true;
                desktopPanelTab = TAB_QUEUE;
                lastAutoLyricsRequestKey = "";
                localLyricsOpen = false;
                if (isLyricsVisible) {
                    ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_LYRICS);
                }
                refreshDesktopQueueAndSpec(true);
                startAnimationLoop();
                break;
            case HIT_DESKTOP_TAB_LYRICS:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                activateDesktopLyricsTab();
                break;
            case HIT_DESKTOP_OPEN_FULL_QUEUE:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_QUEUE);
                break;
            case HIT_DESKTOP_QUEUE_AREA: {
                DesktopQueuePanelRenderer.HitResult hr = desktopQueueRenderer.hitTest(
                        x - desktopPanelBodyRect.left,
                        y - desktopPanelBodyRect.top,
                        desktopPanelBodyRect.width()
                );
                if (hr.action == DesktopQueuePanelRenderer.ACTION_PLAY_TRACK) {
                    performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                    desktopQueueRenderer.flashTappedQueueIndex(hr.queueIndex);
                    ExpressivePlayerBridge.playQueuePosition(hr.queueIndex);
                    MAIN_HANDLER.postDelayed(() -> refreshDesktopQueueAndSpec(true), 220L);
                    startAnimationLoop();
                } else if (hr.action == DesktopQueuePanelRenderer.ACTION_REMOVE_TRACK) {
                    performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                    ExpressivePlayerBridge.removeQueueItem(hr.queueIndex);
                    refreshDesktopQueueAndSpec(true);
                    MAIN_HANDLER.postDelayed(() -> refreshDesktopQueueAndSpec(true), 180L);
                    startAnimationLoop();
                } else if (hr.action == DesktopQueuePanelRenderer.ACTION_OPEN_FULL_QUEUE) {
                    performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                    ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_QUEUE);
                }
                break;
            }
            case HIT_DESKTOP_VOLUME_ICON:
                toggleVolumeMute();
                startAnimationLoop();
                break;
            case HIT_DESKTOP_VOLUME_SLIDER:
                updateVolumeFromX(x);
                startAnimationLoop();
                break;
            case HIT_CAST:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_BROADCAST);
                break;
            case HIT_QUEUE:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                if (layoutMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE) {
                    if (desktopPanelOpen && desktopPanelTab == TAB_QUEUE) {
                        desktopPanelOpen = false;
                    } else {
                        desktopPanelOpen = true;
                        desktopPanelTab = TAB_QUEUE;
                        lastAutoLyricsRequestKey = "";
                        localLyricsOpen = false;
                        if (isLyricsVisible) {
                            ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_LYRICS);
                        }
                        refreshDesktopQueueAndSpec(true);
                    }
                    startAnimationLoop();
                } else {
                    ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_QUEUE);
                }
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
                if (layoutMode == PlayerDesktopLayoutSolver.MODE_DESKTOP_LANDSCAPE) {
                    if (desktopPanelOpen && desktopPanelTab == TAB_LYRICS) {
                        desktopPanelOpen = false;
                        lastAutoLyricsRequestKey = "";
                        localLyricsOpen = false;
                        if (isLyricsVisible) {
                            ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_LYRICS);
                        }
                        startAnimationLoop();
                    } else {
                        activateDesktopLyricsTab();
                    }
                } else if (localLyricsOpen && !isLyricsVisible) {
                    localLyricsOpen = false;
                    startAnimationLoop();
                } else if (showLyricsButton) {
                    ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_LYRICS);
                } else if (isSyllableModeActive() || isExternalLineLyricsActive() || isFetchingSyllables) {
                    localLyricsOpen = !localLyricsOpen;
                    lastUserLyricsScrollMs = 0L;
                    startAnimationLoop();
                }
                break;
            case HIT_MORE_BTN:
                performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                try {
                    int[] winLoc = new int[2];
                    getLocationOnScreen(winLoc);
                    MaterialYouColorEngine.recordLastTouchScreenPoint(
                            winLoc[0] + moreBtnRect.centerX(),
                            winLoc[1] + moreBtnRect.centerY()
                    );
                } catch (Throwable ignored) {
                }
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

    private void activateDesktopLyricsTab() {
        desktopPanelOpen = true;
        desktopPanelTab = TAB_LYRICS;
        lastUserLyricsScrollMs = 0L;
        if (showLyricsButton && !isLyricsVisible) {
            ExpressivePlayerBridge.dispatchSimpleEvent(ExpressivePlayerBridge.ACTION_LYRICS);
        } else if (!showLyricsButton && (isSyllableModeActive() || isExternalLineLyricsActive() || isFetchingSyllables)) {
            localLyricsOpen = true;
        }
        startAnimationLoop();
    }

    private void seekFromLocalLyricTap(long targetMs) {
        long durMs = syllableClock.getDurationMs() > 0L
                ? syllableClock.getDurationMs()
                : (trackDurationMs > 0L ? trackDurationMs : parseDurationTextMs(durationTime));
        if (durMs > 0L) {
            float frac = Math.max(0f, Math.min(1f, targetMs / (float) durMs));
            serverProgress = frac;
            scrubHoldUntilMs = SystemClock.uptimeMillis() + 450L;
            ExpressivePlayerBridge.dispatchSeekDragging(frac);
            ExpressivePlayerBridge.dispatchSeekFinished();
        }
    }
}
