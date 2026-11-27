package app.morphe.extension.music.patches.miniplayer;

import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RadialGradient;
import android.graphics.RecordingCanvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableWrapper;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.PaintDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.media.AudioManager;
import android.os.Build;
import android.os.SystemClock;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.TwoStatePreference;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.Pair;
import android.util.TypedValue;
import android.view.ActionMode;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.PathInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.regex.Pattern;

import app.morphe.extension.music.patches.ChangeMiniplayerColorPatch;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.shared.theme.ThemeUtils;
import app.morphe.extension.shared.ui.CustomDialog;
import app.morphe.extension.shared.ui.Dim;

@SuppressWarnings({"unused", "deprecation"})
public final class M3NavigationFilter {

    // Exportable Morphe Settings (OFF by default)
    public static final BooleanSetting ENABLED =
            new BooleanSetting("morphe_music_m3_navigation_enabled", false);
    public static final BooleanSetting SHOW_ALBUM_ART =
            new BooleanSetting("morphe_music_m3_navigation_show_album_art", true);
    public static final BooleanSetting SHOW_WAVE_SEEKBAR =
            new BooleanSetting("morphe_music_m3_navigation_show_wave_seekbar", true);
    public static final BooleanSetting DYNAMIC_COLOR =
            new BooleanSetting("morphe_music_m3_navigation_dynamic_color", true);
    // Album-art-driven ambient backdrop on the expanded Now Playing screen
    public static final BooleanSetting AMBIENT_MODE =
            new BooleanSetting("morphe_music_m3_navigation_ambient_mode", true);
    public static final BooleanSetting ROTATE_SEARCH =
            new BooleanSetting("morphe_music_m3_navigation_rotate_search", true);
    public static final BooleanSetting INVERT_SEARCH =
            new BooleanSetting("morphe_music_m3_navigation_invert_search", true);
    public static final BooleanSetting REPLACE_LIB_ACTION =
            new BooleanSetting("morphe_music_m3_navigation_replace_lib_action", true);
    public static final BooleanSetting HIDE_PLAYLIST_FAB =
            new BooleanSetting("morphe_music_m3_navigation_hide_playlist_fab", true);
    public static final BooleanSetting WIDE_SPLIT_LAYOUT =
            new BooleanSetting("morphe_music_m3_navigation_wide_split_layout", true);

    public static final StringSetting AUTO_HIDE_MODE =
            new StringSetting("morphe_music_m3_navigation_auto_hide_mode", "BOTH");

    public static final IntegerSetting BAR_HEIGHT_DP =
            new IntegerSetting("morphe_music_m3_navigation_bar_height_dp", 58);
    public static final IntegerSetting MAX_WIDE_WIDTH_DP =
            new IntegerSetting("morphe_music_m3_navigation_max_wide_width_dp", 365);
    public static final IntegerSetting BAR_OPACITY_PCT =
            new IntegerSetting("morphe_music_m3_navigation_bar_opacity_pct", 45);
    public static final IntegerSetting SEARCH_OPACITY_PCT =
            new IntegerSetting("morphe_music_m3_navigation_search_opacity_pct", 70);
    public static final IntegerSetting SEARCH_SCALE_PCT =
            new IntegerSetting("morphe_music_m3_navigation_search_scale_pct", 135);
    public static final IntegerSetting SEARCH_LOBE_PERMILLE =
            new IntegerSetting("morphe_music_m3_navigation_search_lobe_permille", 30);
    public static final IntegerSetting SEARCH_ROTATION_SEC =
            new IntegerSetting("morphe_music_m3_navigation_search_rotation_sec", 50);
    public static final IntegerSetting BLUR_RADIUS_DP =
            new IntegerSetting("morphe_music_m3_navigation_blur_radius_dp", 40);
    public static final IntegerSetting AMBIENT_INTENSITY_PCT =
            new IntegerSetting("morphe_music_m3_navigation_ambient_intensity_pct", 65);
    public static final IntegerSetting MINI_ART_RADIUS_DP =
            new IntegerSetting("morphe_music_m3_navigation_mini_art_radius_dp", 8);

    // Fallback track when no previously played song is stored
    private static final String DEFAULT_FALLBACK_TITLE = "Ek Pal Ka Jeena";
    private static final String DEFAULT_FALLBACK_ARTIST = "Lucky Ali";
    private static final int DEFAULT_TONAL_CONTAINER = 0xFF2B2635;

    private static final String PREFS_LAST_TRACK = "morphe_m3_last_track";
    private static final String KEY_LAST_TITLE = "last_title";
    private static final String KEY_LAST_ARTIST = "last_artist";
    private static final String KEY_LAST_COLOR = "last_color";

    private static final String PREFS_HARMONY_BACKUP = "morphe_m3_harmony_backup";
    private static final String KEY_BACKUP_ACTIVE = "backup_active";

    static boolean prefEnabled = false;
    static boolean prefShowAlbumArt = true;
    static boolean prefShowWaveSeekbar = true;
    static boolean prefDynamicColor = true;
    static boolean prefAmbientMode = true;
    static boolean prefRotateSearch = true;
    static boolean prefInvertSearch = true;
    static boolean prefReplaceLibAction = true;
    static boolean prefHidePlaylistFab = true;
    static boolean prefWideSplitLayout = true;
    static String prefAutoHideMode = "BOTH";

    static int prefBarHeightDp = 58;
    static int prefMaxWideWidthDp = 365;
    static int prefBarOpacityPct = 45;
    static int prefSearchOpacityPct = 70;
    static int prefSearchScalePct = 135;
    static int prefSearchLobePermille = 30;
    static int prefSearchRotationSec = 50;
    static int prefBlurRadiusDp = 40;
    static int prefAmbientIntensityPct = 65;
    static int prefMiniArtRadiusDp = 8;

    private static boolean officialAvailabilityHooked = false;
    private static final Map<String, Setting<?>> MANAGED_OFFICIAL_SETTINGS = new HashMap<>();

    // Verified YouTube Music Resource IDs
    private static final int MINI_PLAYER_ID = ResourceUtils.getIdentifier(ResourceType.ID, "mini_player");
    private static final int PLAYER_TOP_SECTION_ID = ResourceUtils.getIdentifier(ResourceType.ID, "player_top_section");
    private static final int PLAYER_BOTTOM_LAYER_ID = ResourceUtils.getIdentifier(ResourceType.ID, "player_page_bottom_layer");
    private static final int MINI_SPACER_ID = ResourceUtils.getIdentifier(ResourceType.ID, "mini_player_watch_fragment_spacer");
    private static final int PLAY_PAUSE_ID = ResourceUtils.getIdentifier(ResourceType.ID, "mini_player_play_pause_replay_button");
    private static final int PREV_BTN_ID = ResourceUtils.getIdentifier(ResourceType.ID, "mini_player_previous_button");
    private static final int NEXT_BTN_ID = ResourceUtils.getIdentifier(ResourceType.ID, "mini_player_next_button");
    private static final int MEDIA_ROUTE_CONTAINER_ID = ResourceUtils.getIdentifier(ResourceType.ID, "mini_player_media_route_container");
    private static final int TITLE_ID = ResourceUtils.getIdentifier(ResourceType.ID, "mini_player_title");
    private static final int SUBTITLE_ID = ResourceUtils.getIdentifier(ResourceType.ID, "mini_player_subtitle");
    private static final int PIVOT_BAR_ID = ResourceUtils.getIdentifier(ResourceType.ID, "pivot_bar");
    private static final int PLAYER_PAGE_ID = ResourceUtils.getIdentifier(ResourceType.ID, "player_page");
    private static final int WATCH_FRAGMENT_CONTAINER_ID = ResourceUtils.getIdentifier(ResourceType.ID, "watch_fragment_container");
    private static final int FAB_ID = ResourceUtils.getIdentifier(ResourceType.ID, "floating_action_button");
    private static final int OVERLAY_ELEMENTS_CONTAINER = ResourceUtils.getIdentifier(ResourceType.ID, "overlay_elements_container");
    private static final int TAB_BUTTON_ICON_ID = ResourceUtils.getIdentifier(ResourceType.ID, "icon");
    private static final int TAB_BUTTON_LABEL_ID = ResourceUtils.getIdentifier(ResourceType.ID, "text1");

    // Candidate native miniplayer progress bar / scrim / divider IDs across YT Music versions
    private static final int[] NATIVE_MINI_BAR_IDS = new int[]{
            ResourceUtils.getIdentifier(ResourceType.ID, "progress_bar"),
            ResourceUtils.getIdentifier(ResourceType.ID, "mini_player_progress_bar"),
            ResourceUtils.getIdentifier(ResourceType.ID, "player_progress_bar"),
            ResourceUtils.getIdentifier(ResourceType.ID, "mini_player_progress"),
            ResourceUtils.getIdentifier(ResourceType.ID, "mini_player_scrim"),
            ResourceUtils.getIdentifier(ResourceType.ID, "mini_player_divider")
    };

    // Geometry constants
    private static final int MARGIN_HORIZONTAL = Dim.dp(16);
    private static final int FLOATING_ROOM = Dim.dp10;
    private static final int MAX_SYSTEM_ROOM_OVERLAP = Dim.dp4;
    private static final float CONNECTED_GAP_DP = 3.5f;
    private static final float INNER_CORNER_DP = 8f;
    private static final float SEARCH_FLOATING_GAP_DP = 14f;
    private static final int WAVY_CIRCLE_LOBES = 12;
    private static final int WAVY_CIRCLE_STEPS = 216;
    private static final int MAX_LIST_DEPTH = 12;
    private static final Rect EMPTY_CLIP = new Rect(0, 0, 0, 0);
    private static final ColorMatrix FROSTED_BLUR_MATRIX = createFrostedBlurMatrix();
    private static final Pattern TIME_TEXT_PATTERN = Pattern.compile("^\\d+:\\d{2}(?::\\d{2})?$");

    private static final float SCROLL_TRIGGER_DP = 18f;
    private static final long SCROLL_ANIM_DURATION_MS = 260L;
    private static final long SCROLL_COOLDOWN_MS = 180L;

    private static WeakReference<View> currentBrowseContentRef = new WeakReference<>(null);
    private static final Map<View, int[]> bottomRoom = new WeakHashMap<>();
    private static final Map<Class<?>, Boolean> listClasses = new WeakHashMap<>();

    private static WeakReference<ViewGroup> stockMiniplayerRef = new WeakReference<>(null);
    private static WeakReference<ViewGroup> watchWhileLayoutRef = new WeakReference<>(null);
    private static WeakReference<TextView> stockTitleRef = new WeakReference<>(null);
    private static WeakReference<TextView> stockSubtitleRef = new WeakReference<>(null);
    private static WeakReference<ImageView> stockPlayPauseRef = new WeakReference<>(null);
    private static WeakReference<MiniWaveSeekBarView> waveSeekBarRef = new WeakReference<>(null);
    private static WeakReference<MiniBlurBackdropView> miniBlurViewRef = new WeakReference<>(null);
    private static WeakReference<NowPlayingAmbientView> ambientViewRef = new WeakReference<>(null);
    private static final Set<View> hiddenNativeFabs = Collections.newSetFromMap(new WeakHashMap<>());
    private static final Set<View> hiddenNativeBars = Collections.newSetFromMap(new WeakHashMap<>());
    private static final Map<Drawable, Integer> mutedMiniDrawables = new WeakHashMap<>();
    private static final Set<View> hiddenMiniOverlayViews = Collections.newSetFromMap(new WeakHashMap<>());
    private static final Set<View> disabledMiniFadingEdgeViews = Collections.newSetFromMap(new WeakHashMap<>());
    private static final Set<View> clippedMiniSwipeContainers = Collections.newSetFromMap(new WeakHashMap<>());
    private static final Set<View> hiddenMiniSubtitles = Collections.newSetFromMap(new WeakHashMap<>());
    private static final Rect tmpMiniClipRect = new Rect();

    private static WeakReference<ViewGroup> pivotBarRef = new WeakReference<>(null);
    private static WeakReference<View> homeTabRef = new WeakReference<>(null);
    private static WeakReference<View> searchTabRef = new WeakReference<>(null);
    private static WeakReference<View> libraryTabRef = new WeakReference<>(null);
    private static WeakReference<View> activeLibraryActionFabRef = new WeakReference<>(null);

    private static WeakReference<Drawable> homeIconDrawableRef = new WeakReference<>(null);
    private static WeakReference<Drawable> searchIconDrawableRef = new WeakReference<>(null);
    private static WeakReference<Drawable> libraryIconDrawableRef = new WeakReference<>(null);

    // WatchWhileLayout "bv" field + idempotent album art alignment, scaling & corner-clip state
    @Nullable private static Field wwlBvField = null;
    private static boolean wwlBvInspected = false;
    private static final PlayerPageOutlineProvider playerOutlineProvider = new PlayerPageOutlineProvider();
    private static final PlayerPageOutlineProvider artOutlineProvider = new PlayerPageOutlineProvider();
    private static boolean nativeMiniStyled = false;
    private static int origMiniHeight = -1;
    private static float restingCollapsedTop = -1f;
    private static float lastRawArtTx = Float.NaN;
    private static float lastRawArtTy = Float.NaN;
    private static float lastSetArtTx = Float.NaN;
    private static float lastSetArtTy = Float.NaN;
    private static float stockRestArtTx = 0f;
    private static float stockRestArtTy = 0f;
    private static float stockRestArtScale = 1f;
    private static boolean hasStockRestArt = false;
    private static float lastRawArtScale = 1f;
    private static float lastSetArtScale = Float.NaN;
    @Nullable private static ViewOutlineProvider origArtOutlineProvider = null;
    private static boolean origArtClipToOutline = false;
    private static WeakReference<View> origArtOutlineTargetRef = new WeakReference<>(null);

    // Miniplayer-only baked black-bar detector state (read-only; never mutates Now Playing ImageViews)
    private static final int ART_BAR_SAMPLE_SIZE = 64;
    private static final Map<Drawable, float[]> artBarBoundsCache = new WeakHashMap<>();
    private static final Map<Drawable, Integer> artBarSigCache = new WeakHashMap<>();
    @Nullable private static Bitmap artBarScratchBitmap = null;
    @Nullable private static Canvas artBarScratchCanvas = null;
    private static final int[] artBarScratchPixels = new int[ART_BAR_SAMPLE_SIZE * ART_BAR_SAMPLE_SIZE];
    private static final Rect artBarSavedBounds = new Rect();
    private static final Rect artBarDstRect = new Rect(0, 0, ART_BAR_SAMPLE_SIZE, ART_BAR_SAMPLE_SIZE);
    private static final RectF tmpArtRectF = new RectF();

    // Now Playing ambient mode album-art sampler & full-bleed nav-bar scrim state
    private static final int AMBIENT_SAMPLE_SIZE = 32;
    @Nullable private static Bitmap ambientScratchBitmap = null;
    @Nullable private static Canvas ambientScratchCanvas = null;
    private static final int[] ambientScratchPixels = new int[AMBIENT_SAMPLE_SIZE * AMBIENT_SAMPLE_SIZE];
    private static final int[] ambientBlurTemp = new int[AMBIENT_SAMPLE_SIZE * AMBIENT_SAMPLE_SIZE];
    private static final Rect ambientSavedBounds = new Rect();
    private static final Rect ambientDstRect = new Rect(0, 0, AMBIENT_SAMPLE_SIZE, AMBIENT_SAMPLE_SIZE);
    private static final Map<ViewGroup, boolean[]> origAmbientAncestorClips = new WeakHashMap<>();
    private static final Map<View, Float> suppressedNavScrims = new WeakHashMap<>();
    private static long lastNavScrimScanMs = 0L;
    private static long lastAmbientSampleMs = 0L;
    private static int lastAmbientDrawableSig = 0;
    private static String lastAmbientTrackKey = "";
    private static boolean ambientHasBitmapForTrack = false;

    // Official ChangeMiniplayerColorPatch + Lyrics reflection hooks (safe if official patch absent)
    @Nullable private static Field lastMiniplayerColorField;
    private static boolean colorFieldChecked = false;
    @Nullable private static Method lyricsGetInstanceMethod;
    @Nullable private static Method lyricsGetCurrentTrackMethod;
    @Nullable private static Method trackTitleMethod;
    @Nullable private static Method trackArtistMethod;
    @Nullable private static Field miniLyricsRawTitleField;
    @Nullable private static Field miniLyricsRawArtistField;
    @Nullable private static Field miniLyricsMirroredField;
    private static boolean lyricsReflectChecked = false;

    // Cached dynamic color & persisted last-played track
    private static int cachedNowPlayingColor = DEFAULT_TONAL_CONTAINER;
    private static boolean hasValidDynamicColor = false;
    private static boolean lastTrackLoaded = false;
    private static String persistedLastTitle = DEFAULT_FALLBACK_TITLE;
    private static String persistedLastArtist = DEFAULT_FALLBACK_ARTIST;
    private static int persistedLastColor = DEFAULT_TONAL_CONTAINER;
    private static String lastSampledTrackKey = "";

    private static float cachedTrackProgress = 0f;
    private static boolean waitingForNewTrackZero = false;
    private static long newTrackStartTimeMs = 0L;
    private static int lastParsedElapsedSec = -1;
    private static int lastParsedTotalSec = -1;
    private static long lastElapsedTickTimeMs = 0L;

    private static WeakReference<M3NavCapsulesView> overlayViewRef = new WeakReference<>(null);
    @Nullable private static RenderNode sharedBackdropBlurNode = null;
    private static int lastConfiguredBlurDp = -1;
    private static int sharedBlurTopY = 0;

    private static boolean isScrollHidden = false;
    private static float scrollHideProgress = 0f;
    private static ValueAnimator activeScrollAnimator;
    private static long lastScrollToggleTimeMs = 0L;
    private static boolean isRecordingBlur = false;

    private static final int[] tmpLoc = new int[2];
    private static final int[] tmpLoc2 = new int[2];
    private static final PathInterpolator EXPRESSIVE_INTERPOLATOR =
            new PathInterpolator(0.2f, 0f, 0f, 1f);

    static {
        initSettings(null);
    }

    private M3NavigationFilter() {}

    private static ColorMatrix createFrostedBlurMatrix() {
        ColorMatrix colors = new ColorMatrix();
        colors.setSaturation(1.45f);
        final float brightness = 12f;
        colors.postConcat(new ColorMatrix(new float[]{
                1, 0, 0, 0, brightness,
                0, 1, 0, 0, brightness,
                0, 0, 1, 0, brightness,
                0, 0, 0, 1, 0
        }));
        return colors;
    }

    static void initSettings() {
        initSettings(null);
    }

    static void initSettings(@Nullable Context context) {
        hookOfficialSettingsAvailability();
        syncFromSettings(context);
        ensureLastTrackLoaded(context);
    }

    static void syncFromSettings() {
        syncFromSettings(null);
    }

    static void syncFromSettings(@Nullable Context context) {
        prefEnabled = ENABLED.get();
        prefShowAlbumArt = SHOW_ALBUM_ART.get();
        prefShowWaveSeekbar = SHOW_WAVE_SEEKBAR.get();
        prefDynamicColor = DYNAMIC_COLOR.get();
        prefAmbientMode = AMBIENT_MODE.get();
        prefRotateSearch = ROTATE_SEARCH.get();
        prefInvertSearch = INVERT_SEARCH.get();
        prefReplaceLibAction = REPLACE_LIB_ACTION.get();
        prefHidePlaylistFab = HIDE_PLAYLIST_FAB.get();
        prefWideSplitLayout = WIDE_SPLIT_LAYOUT.get();
        prefAutoHideMode = AUTO_HIDE_MODE.get();

        prefBarHeightDp = BAR_HEIGHT_DP.get();
        prefMaxWideWidthDp = MAX_WIDE_WIDTH_DP.get();
        prefBarOpacityPct = BAR_OPACITY_PCT.get();
        prefSearchOpacityPct = SEARCH_OPACITY_PCT.get();
        prefSearchScalePct = SEARCH_SCALE_PCT.get();
        prefSearchLobePermille = SEARCH_LOBE_PERMILLE.get();
        prefSearchRotationSec = SEARCH_ROTATION_SEC.get();
        prefBlurRadiusDp = BLUR_RADIUS_DP.get();
        prefAmbientIntensityPct = AMBIENT_INTENSITY_PCT.get();
        prefMiniArtRadiusDp = MINI_ART_RADIUS_DP.get();

        if (!prefAmbientMode || prefAmbientIntensityPct <= 0) {
            NowPlayingAmbientView existingAmbient = ambientViewRef.get();
            if (existingAmbient != null) {
                existingAmbient.setVisibility(View.GONE);
                if (!prefAmbientMode && existingAmbient.getParent() instanceof ViewGroup parent) {
                    parent.removeView(existingAmbient);
                    ambientViewRef = new WeakReference<>(null);
                }
            }
            restoreAmbientSystemAndClips();
        } else {
            NowPlayingAmbientView existingAmbient = ambientViewRef.get();
            if (existingAmbient != null) {
                existingAmbient.invalidate();
            }
        }

        if (prefEnabled) {
            enforceOfficialHarmonySettings(context, false);
        }
    }

    /**
     * Called from M3NavigationPreference when the user toggles the master M3 switch.
     * Backs up official Morphe settings when turning ON, and restores them when turning OFF.
     */
    static void setM3Enabled(@Nullable Context context, boolean enable) {
        ENABLED.save(enable);
        prefEnabled = enable;
        if (enable) {
            enforceOfficialHarmonySettings(context, true);
        } else {
            restoreOfficialHarmonySettings(context);
        }
        syncFromSettings(context);
    }

    /**
     * Called from M3NavigationPreference when Dynamic Color changes while M3 is enabled.
     */
    static void onDynamicColorToggled(@Nullable Context context, boolean enabled) {
        DYNAMIC_COLOR.save(enabled);
        prefDynamicColor = enabled;
        if (prefEnabled) {
            try {
                if (Settings.CHANGE_MINIPLAYER_COLOR.get() != enabled) {
                    Settings.CHANGE_MINIPLAYER_COLOR.save(enabled);
                }
            } catch (Throwable ignored) {}
        }
    }

    /**
     * Hooks Morphe's official Setting availability rules so conflicting official toggles
     * are automatically greyed out across all Morphe Settings screens while M3 Redesign is ON.
     */
    @Nullable
    private static Setting<?> getOptionalSetting(String fieldName) {
        try {
            Field f = Settings.class.getField(fieldName);
            Object val = f.get(null);
            if (val instanceof Setting<?> s) return s;
        } catch (Throwable ignored) {}
        return null;
    }

    @Nullable
    private static BooleanSetting getOptionalBooleanSetting(String fieldName) {
        Setting<?> s = getOptionalSetting(fieldName);
        return (s instanceof BooleanSetting bs) ? bs : null;
    }

    private static void hookOfficialSettingsAvailability() {
        if (officialAvailabilityHooked) return;
        officialAvailabilityHooked = true;
        try {
            Setting<?>[] conflicting = new Setting<?>[]{
                    Settings.MINIPLAYER_NEXT_BUTTON,
                    Settings.MINIPLAYER_PREVIOUS_BUTTON,
                    Settings.CHANGE_MINIPLAYER_COLOR,
                    Settings.CHANGE_NAVIGATION_BAR_COLOR,
                    getOptionalSetting("NAVIGATION_BAR_GLASS"),
                    getOptionalSetting("NAVIGATION_BAR_GLASS_OPACITY"),
                    getOptionalSetting("NAVIGATION_BAR_GLASS_LIGHT"),
                    getOptionalSetting("NAVIGATION_BAR_GLASS_HEIGHT"),
                    getOptionalSetting("NAVIGATION_BAR_GLASS_WIDTH"),
                    getOptionalSetting("NAVIGATION_BAR_GLASS_BUTTON_SPACING"),
                    Settings.HIDE_NAVIGATION_BAR,
                    Settings.HIDE_NAVIGATION_BAR_HOME_BUTTON,
                    Settings.HIDE_NAVIGATION_BAR_SAMPLES_BUTTON,
                    Settings.HIDE_NAVIGATION_BAR_EXPLORE_BUTTON,
                    Settings.HIDE_NAVIGATION_BAR_LIBRARY_BUTTON,
                    Settings.HIDE_NAVIGATION_BAR_UPGRADE_BUTTON,
                    Settings.HIDE_NAVIGATION_BAR_LABEL
            };

            Field availabilityField = null;
            for (Field f : Setting.class.getDeclaredFields()) {
                if (Setting.Availability.class.isAssignableFrom(f.getType())) {
                    availabilityField = f;
                    break;
                }
            }
            if (availabilityField != null) {
                availabilityField.setAccessible(true);
            }

            Setting.Availability notM3 = Setting.parentNot(ENABLED);
            for (Setting<?> s : conflicting) {
                if (s == null) continue;
                MANAGED_OFFICIAL_SETTINGS.put(s.key, s);
                if (availabilityField != null) {
                    try {
                        Setting.Availability existing = (Setting.Availability) availabilityField.get(s);
                        Setting.Availability combined = (existing != null)
                                ? Setting.parentsAll(existing, notM3)
                                : notM3;
                        availabilityField.set(s, combined);
                    } catch (Throwable ignored) {}
                }
            }
        } catch (Throwable ex) {
            Logger.printException(() -> "hookOfficialSettingsAvailability failure", ex);
        }
    }

    /**
     * Walks the live Morphe PreferenceScreen so official preferences immediately reflect
     * their synced checked state and greyed-out availability without waiting for a restart.
     */
    static void syncOfficialPreferencesUi(@Nullable PreferenceGroup group) {
        if (group == null) return;
        hookOfficialSettingsAvailability();
        for (int i = 0, count = group.getPreferenceCount(); i < count; i++) {
            Preference pref = group.getPreference(i);
            if (pref == null) continue;
            String key = pref.getKey();
            if (key != null && MANAGED_OFFICIAL_SETTINGS.containsKey(key)) {
                Setting<?> setting = MANAGED_OFFICIAL_SETTINGS.get(key);
                if (setting != null) {
                    if (pref instanceof TwoStatePreference tsp && setting instanceof BooleanSetting bs) {
                        boolean val = bs.get();
                        if (tsp.isChecked() != val) {
                            tsp.setChecked(val);
                        }
                    }
                    boolean available = !ENABLED.get() && setting.isAvailable();
                    pref.setEnabled(available);
                }
            }
            if (pref instanceof PreferenceGroup childGroup) {
                syncOfficialPreferencesUi(childGroup);
            }
        }
    }

    @Nullable
    private static Context resolveAppContext(@Nullable Context preferred) {
        if (preferred != null) return preferred.getApplicationContext();
        try {
            return Utils.getContext();
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void enforceOfficialHarmonySettings(@Nullable Context rawContext, boolean createBackupIfNeeded) {
        try {
            BooleanSetting glassNavSetting = getOptionalBooleanSetting("NAVIGATION_BAR_GLASS");
            Context ctx = resolveAppContext(rawContext);
            if (createBackupIfNeeded && ctx != null) {
                SharedPreferences sp = ctx.getSharedPreferences(PREFS_HARMONY_BACKUP, Context.MODE_PRIVATE);
                if (!sp.getBoolean(KEY_BACKUP_ACTIVE, false)) {
                    SharedPreferences.Editor editor = sp.edit()
                            .putBoolean(KEY_BACKUP_ACTIVE, true)
                            .putBoolean(Settings.MINIPLAYER_NEXT_BUTTON.key, Settings.MINIPLAYER_NEXT_BUTTON.get())
                            .putBoolean(Settings.MINIPLAYER_PREVIOUS_BUTTON.key, Settings.MINIPLAYER_PREVIOUS_BUTTON.get())
                            .putBoolean(Settings.CHANGE_MINIPLAYER_COLOR.key, Settings.CHANGE_MINIPLAYER_COLOR.get())
                            .putBoolean(Settings.CHANGE_NAVIGATION_BAR_COLOR.key, Settings.CHANGE_NAVIGATION_BAR_COLOR.get())
                            .putBoolean(Settings.HIDE_NAVIGATION_BAR.key, Settings.HIDE_NAVIGATION_BAR.get())
                            .putBoolean(Settings.HIDE_NAVIGATION_BAR_HOME_BUTTON.key, Settings.HIDE_NAVIGATION_BAR_HOME_BUTTON.get())
                            .putBoolean(Settings.HIDE_NAVIGATION_BAR_SAMPLES_BUTTON.key, Settings.HIDE_NAVIGATION_BAR_SAMPLES_BUTTON.get())
                            .putBoolean(Settings.HIDE_NAVIGATION_BAR_EXPLORE_BUTTON.key, Settings.HIDE_NAVIGATION_BAR_EXPLORE_BUTTON.get())
                            .putBoolean(Settings.HIDE_NAVIGATION_BAR_LIBRARY_BUTTON.key, Settings.HIDE_NAVIGATION_BAR_LIBRARY_BUTTON.get())
                            .putBoolean(Settings.HIDE_NAVIGATION_BAR_UPGRADE_BUTTON.key, Settings.HIDE_NAVIGATION_BAR_UPGRADE_BUTTON.get())
                            .putBoolean(Settings.HIDE_NAVIGATION_BAR_LABEL.key, Settings.HIDE_NAVIGATION_BAR_LABEL.get());
                    if (glassNavSetting != null) {
                        editor.putBoolean(glassNavSetting.key, glassNavSetting.get());
                    }
                    editor.apply();
                }
            }

            // Use official MiniplayerPreviousNextButtonsPatch to hide Next & Previous buttons
            saveIfDifferent(Settings.MINIPLAYER_NEXT_BUTTON, false);
            saveIfDifferent(Settings.MINIPLAYER_PREVIOUS_BUTTON, false);
            // Sync official ChangeMiniplayerColorPatch with M3 Dynamic Color
            saveIfDifferent(Settings.CHANGE_MINIPLAYER_COLOR, prefDynamicColor);
            saveIfDifferent(Settings.CHANGE_NAVIGATION_BAR_COLOR, false);
            // Disable conflicting official navigation bar modes
            saveIfDifferent(glassNavSetting, false);
            saveIfDifferent(Settings.HIDE_NAVIGATION_BAR, false);
            saveIfDifferent(Settings.HIDE_NAVIGATION_BAR_HOME_BUTTON, false);
            saveIfDifferent(Settings.HIDE_NAVIGATION_BAR_LIBRARY_BUTTON, false);
            saveIfDifferent(Settings.HIDE_NAVIGATION_BAR_SAMPLES_BUTTON, true);
            saveIfDifferent(Settings.HIDE_NAVIGATION_BAR_EXPLORE_BUTTON, true);
            saveIfDifferent(Settings.HIDE_NAVIGATION_BAR_UPGRADE_BUTTON, true);
        } catch (Throwable ignored) {}
    }

    private static void restoreOfficialHarmonySettings(@Nullable Context rawContext) {
        try {
            Context ctx = resolveAppContext(rawContext);
            if (ctx == null) return;
            SharedPreferences sp = ctx.getSharedPreferences(PREFS_HARMONY_BACKUP, Context.MODE_PRIVATE);
            if (!sp.getBoolean(KEY_BACKUP_ACTIVE, false)) return;

            BooleanSetting[] backedUp = new BooleanSetting[]{
                    Settings.MINIPLAYER_NEXT_BUTTON,
                    Settings.MINIPLAYER_PREVIOUS_BUTTON,
                    Settings.CHANGE_MINIPLAYER_COLOR,
                    Settings.CHANGE_NAVIGATION_BAR_COLOR,
                    getOptionalBooleanSetting("NAVIGATION_BAR_GLASS"),
                    Settings.HIDE_NAVIGATION_BAR,
                    Settings.HIDE_NAVIGATION_BAR_HOME_BUTTON,
                    Settings.HIDE_NAVIGATION_BAR_SAMPLES_BUTTON,
                    Settings.HIDE_NAVIGATION_BAR_EXPLORE_BUTTON,
                    Settings.HIDE_NAVIGATION_BAR_LIBRARY_BUTTON,
                    Settings.HIDE_NAVIGATION_BAR_UPGRADE_BUTTON,
                    Settings.HIDE_NAVIGATION_BAR_LABEL
            };
            for (BooleanSetting s : backedUp) {
                if (s != null && sp.contains(s.key)) {
                    saveIfDifferent(s, sp.getBoolean(s.key, s.defaultValue));
                }
            }
            sp.edit().putBoolean(KEY_BACKUP_ACTIVE, false).apply();
        } catch (Throwable ignored) {}
    }

    private static void saveIfDifferent(@Nullable BooleanSetting setting, boolean value) {
        if (setting != null && setting.get() != value) {
            setting.save(value);
        }
    }

    static void resetAllSettingsToDefaults(@Nullable Context context) {
        boolean wasEnabled = ENABLED.get();
        ENABLED.resetToDefault();
        SHOW_ALBUM_ART.resetToDefault();
        SHOW_WAVE_SEEKBAR.resetToDefault();
        DYNAMIC_COLOR.resetToDefault();
        AMBIENT_MODE.resetToDefault();
        ROTATE_SEARCH.resetToDefault();
        INVERT_SEARCH.resetToDefault();
        REPLACE_LIB_ACTION.resetToDefault();
        HIDE_PLAYLIST_FAB.resetToDefault();
        WIDE_SPLIT_LAYOUT.resetToDefault();
        AUTO_HIDE_MODE.resetToDefault();
        BAR_HEIGHT_DP.resetToDefault();
        MAX_WIDE_WIDTH_DP.resetToDefault();
        BAR_OPACITY_PCT.resetToDefault();
        SEARCH_OPACITY_PCT.resetToDefault();
        SEARCH_SCALE_PCT.resetToDefault();
        SEARCH_LOBE_PERMILLE.resetToDefault();
        SEARCH_ROTATION_SEC.resetToDefault();
        BLUR_RADIUS_DP.resetToDefault();
        AMBIENT_INTENSITY_PCT.resetToDefault();
        MINI_ART_RADIUS_DP.resetToDefault();
        if (wasEnabled && !ENABLED.get()) {
            restoreOfficialHarmonySettings(context);
        }
        syncFromSettings(context);
    }

    static void promptRestart(Context rawContext) {
        Activity activity = resolveActivity(rawContext);
        if (activity == null) activity = Utils.getActivity();
        final Context context = (activity != null) ? activity : rawContext;
        if (context == null) return;

        Pair<Dialog, LinearLayout> dialogPair = CustomDialog.create(
                context,
                "Restart required",
                "Restart the app for this change to take effect.",
                null,
                "Restart",
                () -> restartApp(context),
                () -> {},
                null,
                null,
                true
        );
        dialogPair.first.show();
    }

    private static void restartApp(Context context) {
        try {
            Intent intent = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
            if (intent != null && intent.getComponent() != null) {
                Intent restartIntent = Intent.makeRestartActivityTask(intent.getComponent());
                context.startActivity(restartIntent);
                Runtime.getRuntime().exit(0);
            }
        } catch (Throwable ignored) {}
    }

    // Keep native full-width miniplayer layout when enabled so capsule clipping is exact
    public static boolean useFloatingMiniplayer(boolean original) {
        return !prefEnabled && original;
    }

    public static int getContentHeight(View content, int height) {
        if (content == null) return height;
        try {
            initSettings(content.getContext());
            if (!prefEnabled || Settings.HIDE_NAVIGATION_BAR.get()) return height;

            if (currentBrowseContentRef.get() != content) {
                currentBrowseContentRef = new WeakReference<>(content);
                watchContentForListPadding(content);
            }

            final int room = getContentRoom(content);
            if (room <= 0 || isKeyboardShown(content)) return height;
            return height + room;
        } catch (Exception ex) {
            Logger.printException(() -> "M3NavigationFilter.getContentHeight failure", ex);
            return height;
        }
    }

    private static int getContentRoom(@Nullable View content) {
        View pivotBar = pivotBarRef.get();
        if (pivotBar == null && content != null && PIVOT_BAR_ID != 0) {
            View found = content.getRootView().findViewById(PIVOT_BAR_ID);
            if (found instanceof ViewGroup vg) {
                pivotBarRef = new WeakReference<>(vg);
                pivotBar = vg;
            }
        }
        if (pivotBar == null) return Dim.dp(prefBarHeightDp + 16);
        int measured = pivotBar.getMeasuredHeight();
        return measured > 0 ? measured : Dim.dp(prefBarHeightDp + 16);
    }

    private static boolean isKeyboardShown(View view) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) return false;
        WindowInsets insets = view.getRootWindowInsets();
        return insets != null && insets.isVisible(WindowInsets.Type.ime());
    }

    private static void watchContentForListPadding(View content) {
        if (!(content instanceof ViewGroup group)) return;
        content.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override
            public void onGlobalLayout() {
                try {
                    if (currentBrowseContentRef.get() != content) {
                        content.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                        return;
                    }
                    if (!prefEnabled || Settings.HIDE_NAVIGATION_BAR.get()) return;
                    final int room = isKeyboardShown(content) ? 0 : getContentRoom(content);
                    updateListPaddingRecursive(group, group, room, 0);
                } catch (Exception ignored) {}
            }
        });
    }

    private static boolean isRecyclerView(View view) {
        final Class<?> viewClass = view.getClass();
        Boolean list = listClasses.get(viewClass);
        if (list == null) {
            list = false;
            for (Class<?> type = viewClass; type != null && type != View.class; type = type.getSuperclass()) {
                if (type.getSimpleName().equals("RecyclerView")) {
                    list = true;
                    break;
                }
            }
            listClasses.put(viewClass, list);
        }
        return list;
    }

    private static void updateListPaddingRecursive(ViewGroup content, View view, int room, int depth) {
        if (view.getVisibility() == View.GONE) return;
        final int id = view.getId();
        if (id != View.NO_ID && (id == FAB_ID || id == OVERLAY_ELEMENTS_CONTAINER)) return;

        if (view != content && isRecyclerView(view)) {
            final boolean atBottom = getBottomInAncestor(view, content) >= content.getHeight() - Dim.dp2
                    && view.getHeight() > content.getHeight() / 3;
            final ViewGroup list = (ViewGroup) view;
            View first = list.getChildCount() > 0 ? list.getChildAt(0) : null;
            final boolean pager = first != null && first.getHeight() >= view.getHeight() * 9 / 10;
            setBottomRoomPadding(view, room, atBottom && !pager && !list.getClipToPadding());
            if (!pager || depth >= MAX_LIST_DEPTH) return;
        }
        if (depth >= MAX_LIST_DEPTH || !(view instanceof ViewGroup group)) return;
        for (int i = 0, count = group.getChildCount(); i < count; i++) {
            updateListPaddingRecursive(content, group.getChildAt(i), room, depth + 1);
        }
    }

    private static void setBottomRoomPadding(View view, int room, boolean applies) {
        final int current = view.getPaddingBottom();
        int[] state = bottomRoom.get(view);
        if (state == null) {
            if (!applies || room <= 0) return;
            state = new int[]{current, current};
            bottomRoom.put(view, state);
        } else if (current != state[1]) {
            state[0] = current;
        }
        final int target = state[0] + (applies ? room : 0);
        state[1] = target;
        if (current != target) {
            view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(), target);
        }
    }

    private static int getBottomInAncestor(View view, View ancestor) {
        int top = 0;
        View current = view;
        while (current != ancestor) {
            top += current.getTop();
            ViewParent parent = current.getParent();
            if (!(parent instanceof View parentView)) break;
            current = parentView;
        }
        return top + view.getHeight();
    }

    public static void onMiniPlayerCreated(View parentView) {
        if (parentView == null) return;
        try {
            initSettings(parentView.getContext());

            Activity activity = resolveActivity(parentView.getContext());
            if (activity == null) return;

            ViewGroup miniPlayer = null;
            if (MINI_PLAYER_ID != 0) {
                View found = parentView.findViewById(MINI_PLAYER_ID);
                if (found instanceof ViewGroup vg) miniPlayer = vg;
            }
            if (miniPlayer == null && parentView instanceof ViewGroup vg) miniPlayer = vg;
            if (miniPlayer == null) return;

            bindStockMiniplayerViews(miniPlayer);
            installOverlayAndListeners(activity);
        } catch (Exception ex) {
            Logger.printException(() -> "onMiniPlayerCreated failure", ex);
        }
    }

    private static void bindStockMiniplayerViews(ViewGroup miniPlayer) {
        stockMiniplayerRef = new WeakReference<>(miniPlayer);
        if (origMiniHeight < 0 && miniPlayer.getLayoutParams() != null && miniPlayer.getLayoutParams().height > 0) {
            origMiniHeight = miniPlayer.getLayoutParams().height;
        }
        if (PLAY_PAUSE_ID != 0 && miniPlayer.findViewById(PLAY_PAUSE_ID) instanceof ImageView iv) {
            stockPlayPauseRef = new WeakReference<>(iv);
        }
        if (TITLE_ID != 0 && miniPlayer.findViewById(TITLE_ID) instanceof TextView tv) {
            stockTitleRef = new WeakReference<>(tv);
        }
        if (SUBTITLE_ID != 0 && miniPlayer.findViewById(SUBTITLE_ID) instanceof TextView tv) {
            stockSubtitleRef = new WeakReference<>(tv);
        }
    }

    private static void installOverlayAndListeners(final Activity activity) {
        final Window window = activity.getWindow();
        if (window == null) return;
        final View decorView = window.getDecorView();

        FrameLayout contentRoot = activity.findViewById(android.R.id.content);
        if (contentRoot == null && decorView instanceof FrameLayout fl) contentRoot = fl;
        if (contentRoot == null) return;

        M3NavCapsulesView existing = overlayViewRef.get();
        if (existing == null || existing.getParent() == null) {
            M3NavCapsulesView overlay = new M3NavCapsulesView(activity);
            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    Gravity.TOP | Gravity.START
            );
            overlay.setVisibility(View.GONE);
            contentRoot.addView(overlay, lp);
            overlayViewRef = new WeakReference<>(overlay);
        }

        Window.Callback currentCallback = window.getCallback();
        if (currentCallback != null && !(currentCallback instanceof PassiveScrollCallback)) {
            window.setCallback(new PassiveScrollCallback(currentCallback));
        }

        decorView.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
            try {
                if (!prefEnabled || isRecordingBlur) return;
                M3NavCapsulesView ov = overlayViewRef.get();
                if (ov != null && ov.getVisibility() == View.VISIBLE && ov.isMinimizedState) {
                    ViewGroup stockMini = stockMiniplayerRef.get();
                    ViewGroup wwl = (stockMini != null) ? resolveWatchWhileLayout(stockMini) : null;
                    View browseContent = (stockMini != null) ? getBrowseContentView(wwl, stockMini) : null;
                    captureAndSuppressNativeFabs(decorView, browseContent, ov);
                }
            } catch (Throwable ignored) {}
        });

        decorView.post(() -> decorView.getViewTreeObserver().addOnPreDrawListener(() -> {
            try {
                if (!isRecordingBlur) syncFrame(decorView);
            } catch (Throwable ignored) {}
            return true;
        }));
    }

    @Nullable
    private static ViewGroup resolveWatchWhileLayout(ViewGroup stockMini) {
        ViewGroup existing = watchWhileLayoutRef.get();
        if (existing != null && existing.isAttachedToWindow()) return existing;
        ViewParent p = stockMini.getParent();
        while (p instanceof ViewGroup vg) {
            if (vg.getClass().getName().contains("WatchWhileLayout")) {
                watchWhileLayoutRef = new WeakReference<>(vg);
                inspectWwlBvField(vg);
                return vg;
            }
            p = vg.getParent();
        }
        return null;
    }

    private static void inspectWwlBvField(ViewGroup wwl) {
        if (wwlBvInspected) return;
        wwlBvInspected = true;
        try {
            for (Class<?> c = wwl.getClass(); c != null && c != ViewGroup.class && c != View.class; c = c.getSuperclass()) {
                for (Field f : c.getDeclaredFields()) {
                    if (!Modifier.isStatic(f.getModifiers()) && f.getType() == float.class && "bv".equals(f.getName())) {
                        f.setAccessible(true);
                        wwlBvField = f;
                        return;
                    }
                }
            }
        } catch (Throwable ignored) {}
    }

    private static float readRawBv(@Nullable ViewGroup wwl) {
        if (wwl == null || wwlBvField == null) return Float.NaN;
        try {
            return wwlBvField.getFloat(wwl);
        } catch (Throwable ignored) {
            return Float.NaN;
        }
    }

    @Nullable
    private static View getBrowseContentView(@Nullable ViewGroup wwl, ViewGroup stockMini) {
        View direct = currentBrowseContentRef.get();
        if (direct != null && direct.isAttachedToWindow()) return direct;
        if (wwl != null) {
            for (int i = 0; i < wwl.getChildCount(); i++) {
                View child = wwl.getChildAt(i);
                if (child != null && child.isShown() && child != stockMini && !isDescendantOf(stockMini, child)) {
                    child.getLocationOnScreen(tmpLoc);
                    if (tmpLoc[1] < Resources.getSystem().getDisplayMetrics().heightPixels * 0.25f) {
                        return child;
                    }
                }
            }
        }
        return null;
    }

    @Nullable
    private static View getPlayerPageView(View decorView) {
        return (PLAYER_PAGE_ID != 0) ? decorView.findViewById(PLAYER_PAGE_ID) : null;
    }

    private static void ensureLastTrackLoaded(@Nullable Context context) {
        if (lastTrackLoaded) return;
        Context ctx = resolveAppContext(context);
        if (ctx == null) return;
        lastTrackLoaded = true;
        try {
            SharedPreferences sp = ctx.getSharedPreferences(PREFS_LAST_TRACK, Context.MODE_PRIVATE);
            String savedTitle = sp.getString(KEY_LAST_TITLE, null);
            String savedArtist = sp.getString(KEY_LAST_ARTIST, null);
            int savedColor = sp.getInt(KEY_LAST_COLOR, DEFAULT_TONAL_CONTAINER);
            if (!TextUtils.isEmpty(savedTitle)) {
                persistedLastTitle = savedTitle;
                persistedLastArtist = !TextUtils.isEmpty(savedArtist) ? savedArtist : "";
            } else {
                persistedLastTitle = DEFAULT_FALLBACK_TITLE;
                persistedLastArtist = DEFAULT_FALLBACK_ARTIST;
            }
            if ((savedColor & 0x00FFFFFF) != 0 && (savedColor & 0x00FFFFFF) != 0x00FFFFFF) {
                persistedLastColor = savedColor | 0xFF000000;
                if (!hasValidDynamicColor) {
                    cachedNowPlayingColor = persistedLastColor;
                }
            }
        } catch (Throwable ignored) {}
    }

    private static void saveLastPlayedTrack(@Nullable Context context, String title, String artist, int color) {
        if (TextUtils.isEmpty(title)) return;
        String cleanTitle = title.trim();
        String cleanArtist = (artist != null) ? artist.trim() : "";
        int cleanColor = ((color & 0x00FFFFFF) != 0 && (color & 0x00FFFFFF) != 0x00FFFFFF)
                ? (color | 0xFF000000) : persistedLastColor;

        if (TextUtils.equals(cleanTitle, persistedLastTitle)
                && TextUtils.equals(cleanArtist, persistedLastArtist)
                && cleanColor == persistedLastColor) {
            return;
        }
        persistedLastTitle = cleanTitle;
        persistedLastArtist = cleanArtist;
        persistedLastColor = cleanColor;

        Context ctx = resolveAppContext(context);
        if (ctx == null) return;
        try {
            ctx.getSharedPreferences(PREFS_LAST_TRACK, Context.MODE_PRIVATE).edit()
                    .putString(KEY_LAST_TITLE, persistedLastTitle)
                    .putString(KEY_LAST_ARTIST, persistedLastArtist)
                    .putInt(KEY_LAST_COLOR, persistedLastColor)
                    .apply();
        } catch (Throwable ignored) {}
    }

    /**
     * Resolves the real song title & artist (immune to MiniplayerLyrics overwriting mini_player_title).
     * Returns [title, artist] or null if unavailable.
     */
    @Nullable
    private static String[] resolveRealTrackMetadata(@Nullable TextView stockTitle, @Nullable TextView stockSubtitle) {
        if (!lyricsReflectChecked) {
            lyricsReflectChecked = true;
            try {
                Class<?> mlCls = Class.forName("app.morphe.extension.music.patches.lyrics.session.MiniplayerLyrics");
                miniLyricsRawTitleField = mlCls.getDeclaredField("rawDisplayTitle");
                miniLyricsRawTitleField.setAccessible(true);
                miniLyricsRawArtistField = mlCls.getDeclaredField("rawDisplayArtist");
                miniLyricsRawArtistField.setAccessible(true);
                miniLyricsMirroredField = mlCls.getDeclaredField("mirrored");
                miniLyricsMirroredField.setAccessible(true);
            } catch (Throwable ignored) {}
            try {
                Class<?> lmCls = Class.forName("app.morphe.extension.music.patches.lyrics.LyricsManager");
                lyricsGetInstanceMethod = lmCls.getMethod("getInstance");
                lyricsGetCurrentTrackMethod = lmCls.getMethod("getCurrentTrack");
            } catch (Throwable ignored) {}
        }

        // 1. Prefer MiniplayerLyrics untouched raw MediaSession title/artist
        if (miniLyricsRawTitleField != null) {
            try {
                Object rawT = miniLyricsRawTitleField.get(null);
                Object rawA = (miniLyricsRawArtistField != null) ? miniLyricsRawArtistField.get(null) : null;
                if (rawT instanceof String t && !t.trim().isEmpty()) {
                    return new String[]{t.trim(), (rawA instanceof String a) ? a.trim() : ""};
                }
            } catch (Throwable ignored) {}
        }

        // 2. Next prefer LyricsManager current TrackInfo
        if (lyricsGetInstanceMethod != null && lyricsGetCurrentTrackMethod != null) {
            try {
                Object mgr = lyricsGetInstanceMethod.invoke(null);
                Object track = (mgr != null) ? lyricsGetCurrentTrackMethod.invoke(mgr) : null;
                if (track != null) {
                    if (trackTitleMethod == null) {
                        trackTitleMethod = track.getClass().getMethod("title");
                        trackArtistMethod = track.getClass().getMethod("artist");
                    }
                    Object tObj = trackTitleMethod.invoke(track);
                    Object aObj = (trackArtistMethod != null) ? trackArtistMethod.invoke(track) : null;
                    if (tObj instanceof String t && !t.trim().isEmpty()) {
                        return new String[]{t.trim(), (aObj instanceof String a) ? a.trim() : ""};
                    }
                }
            } catch (Throwable ignored) {}
        }

        // 3. Fall back to native miniplayer TextViews ONLY if MiniplayerLyrics is not mirroring
        boolean lyricsMirroring = false;
        if (miniLyricsMirroredField != null) {
            try {
                lyricsMirroring = Boolean.TRUE.equals(miniLyricsMirroredField.get(null));
            } catch (Throwable ignored) {}
        }
        if (!lyricsMirroring && stockTitle != null && stockTitle.getText() != null) {
            String t = stockTitle.getText().toString().trim();
            String a = (stockSubtitle != null && stockSubtitle.getText() != null)
                    ? stockSubtitle.getText().toString().trim() : "";
            if (!t.isEmpty()) {
                return new String[]{t, a};
            }
        }
        return null;
    }

    private static int resolveNativeNowPlayingColor(View decorView, ViewGroup stockMini) {
        if (!colorFieldChecked) {
            colorFieldChecked = true;
            try {
                lastMiniplayerColorField = ChangeMiniplayerColorPatch.class.getDeclaredField("lastMiniplayerColor");
                lastMiniplayerColorField.setAccessible(true);
            } catch (Throwable ignored) {}
        }
        if (lastMiniplayerColorField != null) {
            try {
                Object val = lastMiniplayerColorField.get(null);
                if (val instanceof Integer colorInt && colorInt != 0) {
                    int opaque = colorInt | 0xFF000000;
                    if (isUsableDynamicColor(opaque)) {
                        cachedNowPlayingColor = enhanceTonalContainerColor(opaque);
                        hasValidDynamicColor = true;
                        return cachedNowPlayingColor;
                    }
                }
            } catch (Throwable ignored) {}
        }
        View playerPage = getPlayerPageView(decorView);
        if (playerPage != null) {
            int bgColor = extractBackgroundColorFromHierarchy(playerPage, 0);
            if (bgColor != 0 && isUsableDynamicColor(bgColor | 0xFF000000)) {
                cachedNowPlayingColor = enhanceTonalContainerColor(bgColor | 0xFF000000);
                hasValidDynamicColor = true;
                return cachedNowPlayingColor;
            }
        }
        int miniColor = extractBackgroundColorFromHierarchy(stockMini, 0);
        if (miniColor != 0 && isUsableDynamicColor(miniColor | 0xFF000000)) {
            cachedNowPlayingColor = enhanceTonalContainerColor(miniColor | 0xFF000000);
            hasValidDynamicColor = true;
        }
        return cachedNowPlayingColor;
    }

    private static boolean isUsableDynamicColor(int opaque) {
        int rgb = opaque & 0x00FFFFFF;
        if (rgb == 0x000000 || rgb == 0xFFFFFF) return false;
        int r = Color.red(opaque), g = Color.green(opaque), b = Color.blue(opaque);
        // Ignore pure dark greys (like stock #212121 / #1D1D1D) when another color is already known
        return (Math.max(r, Math.max(g, b)) - Math.min(r, Math.min(g, b))) >= 6 || Math.max(r, Math.max(g, b)) >= 38;
    }

    /**
     * Lifts very dark extracted colors slightly so the frosted-glass tint always shows a clear M3 hue.
     */
    private static int enhanceTonalContainerColor(int opaque) {
        float[] hsv = new float[3];
        Color.colorToHSV(opaque, hsv);
        if (hsv[2] < 0.24f) {
            hsv[2] = Math.max(0.22f, hsv[2] * 1.45f);
        }
        if (hsv[1] > 0.04f && hsv[1] < 0.28f) {
            hsv[1] = Math.min(0.32f, hsv[1] * 1.25f);
        }
        return Color.HSVToColor(hsv) | 0xFF000000;
    }

    private static int extractBackgroundColorFromHierarchy(@Nullable View view, int depth) {
        if (view == null || depth > 3) return 0;
        Drawable bg = view.getBackground();
        if (bg instanceof ColorDrawable cd) {
            int c = cd.getColor();
            if ((Color.alpha(c) > 80 || mutedMiniDrawables.containsKey(bg))
                    && (c & 0x00FFFFFF) != 0 && (c & 0x00FFFFFF) != 0x00FFFFFF) {
                return c | 0xFF000000;
            }
        } else if (bg instanceof GradientDrawable gd && Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            int[] colors = gd.getColors();
            if (colors != null && colors.length > 0) {
                int c = colors[0];
                if ((c & 0x00FFFFFF) != 0 && (c & 0x00FFFFFF) != 0x00FFFFFF) {
                    return c | 0xFF000000;
                }
            }
        }
        if (view instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                View child = vg.getChildAt(i);
                if (child instanceof MiniBlurBackdropView || child instanceof NowPlayingAmbientView) continue;
                int found = extractBackgroundColorFromHierarchy(child, depth + 1);
                if (found != 0) return found;
            }
        }
        return 0;
    }

    private static final int MINI_DEFAULT_TEXT_RES_ID =
            ResourceUtils.getIdentifier(ResourceType.STRING, "mini_player_default_text");
    private static boolean hasEverHadTrackThisSession = false;
    private static long emptyTitleSinceMs = 0L;

    private static boolean isPlaceholderMiniTitle(@Nullable String s, Context ctx) {
        if (s == null) return true;
        String t = s.trim();
        if (t.isEmpty()) return true;
        String lower = t.toLowerCase();
        if (lower.equals("nothing is playing") || lower.equals("no song playing")
                || lower.equals("not playing") || lower.equals("no media")) {
            return true;
        }
        if (MINI_DEFAULT_TEXT_RES_ID != 0) {
            try {
                String defTxt = ctx.getString(MINI_DEFAULT_TEXT_RES_ID);
                if (defTxt != null && t.equalsIgnoreCase(defTxt.trim())) return true;
            } catch (Throwable ignored) {}
        }
        return false;
    }

    private static void syncFrame(View decorView) {
        M3NavCapsulesView overlay = overlayViewRef.get();
        ViewGroup stockMini = stockMiniplayerRef.get();

        boolean patchActive = prefEnabled && !Settings.HIDE_NAVIGATION_BAR.get();
        updatePivotBarAndTabs(decorView, patchActive);

        if (overlay == null || stockMini == null || !stockMini.isAttachedToWindow()) return;
        if (stockTitleRef.get() == null || stockPlayPauseRef.get() == null || stockSubtitleRef.get() == null) {
            bindStockMiniplayerViews(stockMini);
        }

        ensureLastTrackLoaded(overlay.getContext());

        ViewGroup wwl = resolveWatchWhileLayout(stockMini);
        View browseContent = getBrowseContentView(wwl, stockMini);
        View playerPage = getPlayerPageView(decorView);
        ViewGroup pivotBar = pivotBarRef.get();

        if (!patchActive) {
            overlay.setVisibility(View.GONE);
            restoreNativeMiniplayer(playerPage, stockMini);
            restoreAllNativeFabs();
            return;
        }

        int overlayW = overlay.getWidth() > 0
                ? overlay.getWidth()
                : Resources.getSystem().getDisplayMetrics().widthPixels;
        int overlayH = overlay.getHeight() > 0
                ? overlay.getHeight()
                : Resources.getSystem().getDisplayMetrics().heightPixels;

        TextView stockTitle = stockTitleRef.get();
        TextView stockSubtitle = stockSubtitleRef.get();

        int pivotTop = (pivotBar != null && pivotBar.getTop() > overlayH * 0.5f)
                ? pivotBar.getTop()
                : (overlayH - Dim.dp(48));
        // When Now Playing is expanded or opening, never misclassify transient miniplayer height/title gaps as parked-empty
        boolean isPlayerExpandedOrOpening = (playerPage != null)
                && playerPage.getVisibility() == View.VISIBLE
                && playerPage.getTop() < (overlayH * 0.45f);
        boolean isPlayerParkedEmpty = !isPlayerExpandedOrOpening && (
                (playerPage == null)
                || playerPage.getVisibility() != View.VISIBLE
                || playerPage.getTop() >= (pivotTop - dpToPx(12f))
                || stockMini.getHeight() <= 0
        );

        // Resolve real track identity (immune to MiniplayerLyrics line changes!)
        String[] realMeta = resolveRealTrackMetadata(stockTitle, stockSubtitle);
        String rawTitle = (stockTitle != null && stockTitle.getText() != null)
                ? stockTitle.getText().toString().trim() : "";
        String metaTitle = (realMeta != null && realMeta[0] != null) ? realMeta[0].trim() : "";
        boolean hasValidMetaTitle = !isPlaceholderMiniTitle(metaTitle, overlay.getContext());
        boolean hasValidTrackTitle = hasValidMetaTitle || !isPlaceholderMiniTitle(rawTitle, overlay.getContext());

        if (!isPlayerParkedEmpty && (hasValidTrackTitle || isPlayerExpandedOrOpening)) {
            hasEverHadTrackThisSession = true;
            emptyTitleSinceMs = 0L;
        }

        boolean showFallbackMini;
        if (isPlayerExpandedOrOpening) {
            showFallbackMini = false;
        } else if (isPlayerParkedEmpty) {
            showFallbackMini = true;
        } else if (!hasValidTrackTitle) {
            if (!hasEverHadTrackThisSession) {
                showFallbackMini = true;
            } else {
                long nowMs = SystemClock.uptimeMillis();
                if (emptyTitleSinceMs == 0L) emptyTitleSinceMs = nowMs;
                showFallbackMini = (nowMs - emptyTitleSinceMs) >= 900L;
            }
        } else {
            showFallbackMini = false;
        }

        String displayFallbackTitle = isPlaceholderMiniTitle(persistedLastTitle, overlay.getContext())
                ? DEFAULT_FALLBACK_TITLE : persistedLastTitle;
        String displayFallbackArtist = isPlaceholderMiniTitle(persistedLastTitle, overlay.getContext())
                ? DEFAULT_FALLBACK_ARTIST : persistedLastArtist;

        String realTrackKey = (hasValidMetaTitle && realMeta != null) ? (metaTitle + "|" + realMeta[1]) : "";
        if (!showFallbackMini && !realTrackKey.isEmpty() && !TextUtils.equals(realTrackKey, lastSampledTrackKey)) {
            lastSampledTrackKey = realTrackKey;
            cachedTrackProgress = 0f;
            waitingForNewTrackZero = true;
            newTrackStartTimeMs = SystemClock.uptimeMillis();
            lastParsedElapsedSec = -1;
            lastParsedTotalSec = -1;
        }

        // Dynamic album color when active, or saved last-track tonal color when showing fallback
        if (!showFallbackMini) {
            resolveNativeNowPlayingColor(decorView, stockMini);
            int baseColor = prefDynamicColor ? cachedNowPlayingColor : DEFAULT_TONAL_CONTAINER;
            overlay.updatePalette(baseColor);
            if (hasValidMetaTitle && realMeta != null) {
                saveLastPlayedTrack(overlay.getContext(), metaTitle, realMeta[1], cachedNowPlayingColor);
            }
        } else {
            int fallbackColor = prefDynamicColor ? persistedLastColor : DEFAULT_TONAL_CONTAINER;
            overlay.updatePalette(fallbackColor);
        }

        float pillH = dpToPx(prefBarHeightDp);
        float connectedGap = dpToPx(CONNECTED_GAP_DP);
        float searchFloatingGap = dpToPx(SEARCH_FLOATING_GAP_DP);
        float searchSize = Math.round(pillH * (prefSearchScalePct / 100f));

        int bottomMargin = Math.max(FLOATING_ROOM, getSystemBottomRoom(decorView) - MAX_SYSTEM_ROOM_OVERLAP);
        float rowBottom = overlayH - bottomMargin;
        float rowTop = rowBottom - pillH;

        boolean isWideOrLandscape = prefWideSplitLayout && (overlayW > overlayH || overlayW >= Dim.dp(540));
        float maxBarW = dpToPx(prefMaxWideWidthDp);
        float homeL, homeR, libL, libR, miniL, miniR, searchL, searchR, searchT, searchB;

        if (isWideOrLandscape) {
            float rightReserve = searchSize + dpToPx(20f);
            float availLeftWidth = Math.max(pillH * 3.2f, overlayW - MARGIN_HORIZONTAL * 2f - rightReserve);
            float barTotalWidth = Math.min(maxBarW, availLeftWidth);
            homeL = MARGIN_HORIZONTAL;
            homeR = homeL + pillH;
            libR = homeL + barTotalWidth;
            libL = libR - pillH;
            miniL = homeR + connectedGap;
            miniR = libL - connectedGap;
            searchR = overlayW - MARGIN_HORIZONTAL;
            searchL = searchR - searchSize;
            searchB = rowBottom;
            searchT = searchB - searchSize;
        } else {
            float fullSpanW = overlayW - MARGIN_HORIZONTAL * 2f;
            float barTotalWidth = Math.min(fullSpanW, maxBarW);
            float barStartLeft = (overlayW - barTotalWidth) * 0.5f;
            homeL = barStartLeft;
            homeR = homeL + pillH;
            libR = barStartLeft + barTotalWidth;
            libL = libR - pillH;
            miniL = homeR + connectedGap;
            miniR = libL - connectedGap;
            searchB = rowTop - searchFloatingGap;
            searchT = searchB - searchSize;
            searchR = overlayW - MARGIN_HORIZONTAL;
            searchL = searchR - searchSize;
        }

        // Collapse ratio combining playerPage.getTop() and WatchWhileLayout "bv"
        float collapseRatio = 1f;
        if (playerPage != null && !showFallbackMini) {
            int pageTop = playerPage.getTop();
            float rawBv = readRawBv(wwl);
            if (pageTop <= dpToPx(4f)) {
                collapseRatio = 0f;
            } else if (!Float.isNaN(rawBv) && rawBv >= 0.9995f && pageTop > overlayH * 0.45f) {
                restingCollapsedTop = pageTop;
                collapseRatio = 1f;
            } else if (!Float.isNaN(rawBv) && rawBv >= 0f && rawBv <= 1f) {
                collapseRatio = rawBv;
            } else {
                if (pageTop > overlayH * 0.55f && restingCollapsedTop < 0f) {
                    restingCollapsedTop = pageTop;
                }
                float denom = (restingCollapsedTop > 0f) ? restingCollapsedTop : (pivotTop - pillH);
                collapseRatio = Math.max(0f, Math.min(1f, pageTop / Math.max(1f, denom)));
            }
            if (collapseRatio < 0.0005f) collapseRatio = 0f;
            if (collapseRatio > 0.9995f) collapseRatio = 1f;
        }

        boolean isMinimized = showFallbackMini || collapseRatio >= 0.99f;

        boolean hideNavOnScroll = "BOTH".equalsIgnoreCase(prefAutoHideMode)
                || "NAV_ONLY".equalsIgnoreCase(prefAutoHideMode);
        boolean hideSearchOnScroll = "BOTH".equalsIgnoreCase(prefAutoHideMode)
                || "SEARCH_ONLY".equalsIgnoreCase(prefAutoHideMode);

        float navScrollP = (hideNavOnScroll && isMinimized) ? scrollHideProgress : 0f;
        float searchScrollP = (hideSearchOnScroll && isMinimized) ? scrollHideProgress : 0f;

        float barHideDistance = (overlayH - rowTop) + Dim.dp(20);
        float searchHideDistance = (overlayH - searchT) + Dim.dp(20);

        float barScrollShiftY = navScrollP * barHideDistance;
        float barScrollAlpha = Math.max(0f, 1f - (navScrollP * 1.15f));
        float searchScrollShiftY = searchScrollP * searchHideDistance;
        float searchScrollAlpha = Math.max(0f, 1f - (searchScrollP * 1.15f));

        // Record shared frosted glass blur once per frame when bar is visible
        if (prefBlurRadiusDp > 0 && collapseRatio > 0.72f && browseContent != null && browseContent.isShown()
                && (barScrollAlpha > 0.02f || searchScrollAlpha > 0.02f)) {
            recordSharedBackdropBlur(overlay, browseContent, Math.min(rowTop + barScrollShiftY, searchT + searchScrollShiftY));
        }

        boolean isPlaying = !showFallbackMini && isMusicCurrentlyPlaying(overlay.getContext());
        float trackProgress = !showFallbackMini ? resolvePlaybackProgress(decorView, stockMini, isPlaying) : 0f;

        if (playerPage != null) {
            applyNativeMiniplayerStyling(
                    decorView, playerPage, stockMini, overlayW, overlayH,
                    miniL, miniR, rowTop, pillH, barScrollShiftY, collapseRatio,
                    overlay.currentContainerColor, overlay.currentContentColor,
                    trackProgress, isPlaying, showFallbackMini
            );
        }

        // Capsules overlay ([Home], [Library], [Wavy Search], and last-played fallback when parked empty)
        float navReveal = (!showFallbackMini)
                ? Math.max(0f, Math.min(1f, (collapseRatio - 0.72f) / 0.28f))
                : 1f;
        if (navReveal <= 0.01f) {
            overlay.setVisibility(View.GONE);
            restoreAllNativeFabs();
            return;
        }

        View homeTab = homeTabRef.get();
        View searchTab = searchTabRef.get();
        View libTab = libraryTabRef.get();
        boolean isLibSelected = libTab != null && libTab.isSelected();

        View libraryActionFab = isMinimized ? captureAndSuppressNativeFabs(decorView, browseContent, overlay) : null;
        boolean useLibraryActionInRightSlot = prefReplaceLibAction && isLibSelected && libraryActionFab != null;
        Drawable libActionIcon = useLibraryActionInRightSlot ? extractFabIconDrawable(libraryActionFab) : null;

        overlay.setVisibility(View.VISIBLE);
        overlay.setAlpha(1f);
        overlay.updateState(
                homeIconDrawableRef.get(),
                searchIconDrawableRef.get(),
                libraryIconDrawableRef.get(),
                libActionIcon,
                useLibraryActionInRightSlot,
                homeTab != null && homeTab.isSelected(),
                searchTab != null && searchTab.isSelected(),
                isLibSelected,
                !showFallbackMini,
                displayFallbackTitle,
                displayFallbackArtist,
                isMinimized,
                homeL, rowTop + barScrollShiftY, homeR, rowBottom + barScrollShiftY,
                miniL, rowTop + barScrollShiftY, miniR, rowBottom + barScrollShiftY,
                libL, rowTop + barScrollShiftY, libR, rowBottom + barScrollShiftY,
                searchL, searchT + searchScrollShiftY, searchR, searchB + searchScrollShiftY,
                barScrollAlpha * navReveal,
                searchScrollAlpha * navReveal
        );
    }

    private static void applyNativeMiniplayerStyling(
            View decorView,
            View playerPage,
            ViewGroup stockMini,
            int overlayW,
            int overlayH,
            float miniL,
            float miniR,
            float rowTop,
            float pillH,
            float barScrollShiftY,
            float collapseRatio,
            int containerColor,
            int contentColor,
            float trackProgress,
            boolean isPlaying,
            boolean isPlayerParkedEmpty
    ) {
        nativeMiniStyled = true;

        // Keep an empty parked player_page hidden so the fallback capsule draws cleanly
        if (isPlayerParkedEmpty) {
            playerPage.setAlpha(0f);
            playerPage.setTranslationY(0f);
        } else {
            playerPage.setAlpha(1f);
            float baseTop = (restingCollapsedTop > 0f) ? restingCollapsedTop : playerPage.getTop();
            float baseDeltaY = rowTop - baseTop;
            playerPage.setTranslationY((baseDeltaY + barScrollShiftY) * collapseRatio);
        }

        // 1. Smoothly clip player_page from [miniL, 0, miniR, pillH] (8dp corners) -> full screen (0dp corners)
        if (collapseRatio > 0.005f) {
            int fullPageH = Math.max(overlayH, playerPage.getHeight());
            int cl = Math.round(lerp(0f, miniL, collapseRatio));
            int cr = Math.round(lerp(overlayW, miniR, collapseRatio));
            int cb = Math.round(lerp(fullPageH, pillH, collapseRatio));
            float corner = lerp(0f, dpToPx(INNER_CORNER_DP), collapseRatio);
            playerOutlineProvider.set(cl, 0, cr, cb, corner);
            if (playerPage.getOutlineProvider() != playerOutlineProvider) {
                playerPage.setOutlineProvider(playerOutlineProvider);
            }
            if (!playerPage.getClipToOutline()) {
                playerPage.setClipToOutline(true);
            }
            playerPage.invalidateOutline();
        } else if (playerPage.getClipToOutline()) {
            playerPage.setClipToOutline(false);
            playerPage.setOutlineProvider(ViewOutlineProvider.BACKGROUND);
        }

        // 2. Fade player_page's native GradientDrawable from 0 (minimized) -> 255 (expanded)
        int barFillAlpha = Math.round(255f * (Math.max(20, Math.min(100, prefBarOpacityPct)) / 100f));
        Drawable bg = playerPage.getBackground();
        if (bg != null) {
            int targetBgAlpha = Math.round(lerp(255f, 0f, collapseRatio));
            bg.mutate().setAlpha(targetBgAlpha);
        }

        // 3. Insert MiniBlurBackdropView at index 0 of player_page (BEHIND album art & mini_player)
        if (playerPage instanceof ViewGroup ppVg) {
            int pillHPx = Math.round(pillH);
            MiniBlurBackdropView blurView = miniBlurViewRef.get();
            if (blurView == null || blurView.getParent() != ppVg) {
                if (blurView != null && blurView.getParent() instanceof ViewGroup oldParent) {
                    oldParent.removeView(blurView);
                }
                blurView = new MiniBlurBackdropView(ppVg.getContext());
                blurView.setElevation(0f);
                blurView.setTranslationZ(-1f);
                ppVg.addView(blurView, 0, new ViewGroup.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, pillHPx));
                miniBlurViewRef = new WeakReference<>(blurView);
            }
            if (blurView.getLayoutParams() != null && blurView.getLayoutParams().height != pillHPx) {
                blurView.getLayoutParams().height = pillHPx;
                blurView.requestLayout();
            }
            if (collapseRatio > 0.01f && !isPlayerParkedEmpty) {
                blurView.setVisibility(View.VISIBLE);
                blurView.setAlpha(collapseRatio);
                blurView.updateTint(withAlpha(containerColor, barFillAlpha));
            } else {
                blurView.setVisibility(View.GONE);
            }
        }

        View artContainer = (WATCH_FRAGMENT_CONTAINER_ID != 0)
                ? playerPage.findViewById(WATCH_FRAGMENT_CONTAINER_ID) : null;

        // 3b. Now Playing Ambient Mode layered edge-to-edge behind album art & controls when expanded
        updateNowPlayingAmbient(decorView, playerPage, artContainer, overlayW, overlayH, collapseRatio, isPlayerParkedEmpty, cachedNowPlayingColor);

        // 4. Reliably hide ALL native miniplayer progress bars / scrims / dividers (without touching Now Playing's time_bar)
        hideNativeMiniplayerProgressResidue(playerPage, overlayW, pillH);

        // 5. Restyle native @id/mini_player geometry, buttons, title, and injected wave seekbar
        int pillHPx = Math.round(pillH);
        ViewGroup.LayoutParams mlp = stockMini.getLayoutParams();
        if (mlp != null && mlp.height != pillHPx) {
            mlp.height = pillHPx;
            stockMini.setLayoutParams(mlp);
        }
        int expandedSidePad = Dim.dp(8);
        int padL = Math.max(0, Math.round(lerp(expandedSidePad, miniL, collapseRatio)));
        int padR = Math.max(0, Math.round(lerp(expandedSidePad, overlayW - miniR, collapseRatio)));
        if (stockMini.getPaddingLeft() != padL || stockMini.getPaddingRight() != padR
                || stockMini.getPaddingTop() != 0 || stockMini.getPaddingBottom() != 0) {
            stockMini.setPadding(padL, 0, padR, 0);
        }

        // Official MiniplayerPreviousNextButtonsPatch hides prev/next via Settings; keep defensive hide as well
        setViewVisibilityById(stockMini, MEDIA_ROUTE_CONTAINER_ID, View.GONE);
        setViewVisibilityById(stockMini, PREV_BTN_ID, View.GONE);
        setViewVisibilityById(stockMini, NEXT_BTN_ID, View.GONE);

        // Scale miniplayer album art proportionally with the configured navigation bar height
        int artInset = Math.max(Dim.dp(5), Math.round(pillH * 0.11f));
        int artSize = Math.max(Dim.dp(28), pillHPx - artInset * 2);

        boolean showArtNow = prefShowAlbumArt || collapseRatio < 0.5f;
        View spacer = (MINI_SPACER_ID != 0) ? stockMini.findViewById(MINI_SPACER_ID) : null;
        if (spacer != null) {
            spacer.setVisibility(showArtNow ? View.VISIBLE : View.GONE);
            if (spacer.getLayoutParams() instanceof ViewGroup.MarginLayoutParams slp) {
                int rightGap = Math.round(dpToPx(10f));
                if (slp.width != artSize || slp.height != artSize
                        || slp.leftMargin != artInset || slp.rightMargin != rightGap) {
                    slp.width = artSize;
                    slp.height = artSize;
                    slp.leftMargin = artInset;
                    slp.rightMargin = rightGap;
                    spacer.setLayoutParams(slp);
                }
            }
        }

        ImageView playBtn = stockPlayPauseRef.get();
        if (playBtn != null) {
            playBtn.setImageTintList(ColorStateList.valueOf(contentColor));
            int btnW = Math.round(dpToPx(44f));
            if (playBtn.getLayoutParams() instanceof ViewGroup.MarginLayoutParams plp) {
                int endM = Math.round(dpToPx(4f));
                if (plp.width != btnW || plp.height != pillHPx || plp.rightMargin != endM) {
                    plp.width = btnW;
                    plp.height = pillHPx;
                    plp.rightMargin = endM;
                    playBtn.setLayoutParams(plp);
                }
            }
        }

        TextView titleTv = stockTitleRef.get();
        if (titleTv != null) {
            titleTv.setTextColor(contentColor);
            titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            titleTv.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            titleTv.setSingleLine(true);
            titleTv.setMaxLines(1);
            titleTv.setIncludeFontPadding(false);
            titleTv.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
            if (titleTv.getEllipsize() != TextUtils.TruncateAt.MARQUEE) {
                titleTv.setEllipsize(TextUtils.TruncateAt.MARQUEE);
                titleTv.setMarqueeRepeatLimit(-1);
            }
            if (!titleTv.isSelected()) {
                titleTv.setSelected(true);
            }

            // Fixed single-line height prevents MiniplayerLyrics updates from ever bouncing or crushing the wave seekbar
            int titleHeightPx = Math.round(dpToPx(20f));
            ViewGroup.LayoutParams tlp = titleTv.getLayoutParams();
            if (tlp != null && (tlp.width != ViewGroup.LayoutParams.MATCH_PARENT || tlp.height != titleHeightPx)) {
                tlp.width = ViewGroup.LayoutParams.MATCH_PARENT;
                tlp.height = titleHeightPx;
                titleTv.setLayoutParams(tlp);
            }

            View subtitle = (SUBTITLE_ID != 0) ? stockMini.findViewById(SUBTITLE_ID) : null;
            int subVis = prefShowWaveSeekbar ? View.GONE : View.VISIBLE;
            if (subtitle != null && subtitle.getParent() instanceof View subRow && subRow != titleTv.getParent()) {
                if (subRow.getVisibility() != subVis) subRow.setVisibility(subVis);
            }
            if (subtitle != null) {
                if (subtitle.getVisibility() != subVis) subtitle.setVisibility(subVis);
                if (!prefShowWaveSeekbar && subtitle instanceof TextView stv) {
                    stv.setTextColor(withAlpha(contentColor, 190));
                    stv.setSingleLine(true);
                    stv.setMaxLines(1);
                    stv.setEllipsize(TextUtils.TruncateAt.END);
                }
            }

            if (titleTv.getParent() instanceof LinearLayout textCol) {
                textCol.setGravity(Gravity.CENTER_VERTICAL);
                ViewGroup.LayoutParams clp = textCol.getLayoutParams();
                if (clp != null && clp.height != ViewGroup.LayoutParams.MATCH_PARENT) {
                    clp.height = ViewGroup.LayoutParams.MATCH_PARENT;
                    textCol.setLayoutParams(clp);
                }
                int leftPad = showArtNow ? 0 : Math.round(dpToPx(14f));
                int rightPad = Math.round(dpToPx(6f));
                if (textCol.getPaddingLeft() != leftPad || textCol.getPaddingRight() != rightPad) {
                    textCol.setPadding(leftPad, 0, rightPad, 0);
                }
                MiniWaveSeekBarView waveView = waveSeekBarRef.get();
                if (waveView == null || waveView.getParent() != textCol) {
                    if (waveView != null && waveView.getParent() instanceof ViewGroup oldP) {
                        oldP.removeView(waveView);
                    }
                    waveView = new MiniWaveSeekBarView(textCol.getContext());
                    LinearLayout.LayoutParams wlp = new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT, Math.round(dpToPx(14f)));
                    wlp.topMargin = Math.round(dpToPx(2f));
                    textCol.addView(waveView, wlp);
                    waveSeekBarRef = new WeakReference<>(waveView);
                }
                int waveVis = prefShowWaveSeekbar ? View.VISIBLE : View.GONE;
                if (waveView.getVisibility() != waveVis) waveView.setVisibility(waveVis);
                if (prefShowWaveSeekbar) {
                    waveView.update(trackProgress, isPlaying, contentColor);
                }
            }
        }

        // 5b. Clean right-side swipe residue gradient / controls backdrop & hide all swipe-item singer names
        if (collapseRatio > 0.05f && !isPlayerParkedEmpty) {
            cleanMiniplayerSwipeArtifacts(
                    playerPage, stockMini, artContainer, playBtn, titleTv, pillH, contentColor
            );
        } else {
            restoreMiniSwipeVisualArtifacts();
        }

        // 6. Miniplayer-only album art alignment, square-crop & rounded corners (Now Playing stays 100% untouched)
        if (artContainer != null) {
            float curTx = artContainer.getTranslationX();
            float curTy = artContainer.getTranslationY();
            float curSx = artContainer.getScaleX();
            if (Float.isNaN(lastSetArtTx) || Math.abs(curTx - lastSetArtTx) > 1e-4f) {
                lastRawArtTx = curTx;
            }
            if (Float.isNaN(lastSetArtTy) || Math.abs(curTy - lastSetArtTy) > 1e-4f) {
                lastRawArtTy = curTy;
            }
            if (Float.isNaN(lastSetArtScale) || Math.abs(curSx - lastSetArtScale) > 1e-5f) {
                lastRawArtScale = curSx;
            }

            if (collapseRatio <= 0.0005f || isPlayerParkedEmpty) {
                // Leave Now Playing album art completely untouched so audio/video switching and native styling remain intact
                if (artContainer.getAlpha() != 1f) {
                    artContainer.setAlpha(1f);
                }
                if (!Float.isNaN(lastSetArtScale)) {
                    float activeScale = Float.isNaN(lastRawArtScale) ? 1f : lastRawArtScale;
                    artContainer.setScaleX(activeScale);
                    artContainer.setScaleY(activeScale);
                    lastSetArtScale = Float.NaN;
                }
                if (!Float.isNaN(lastSetArtTx)) {
                    if (Math.abs(curTx - lastSetArtTx) <= 1e-4f && !Float.isNaN(lastRawArtTx)) {
                        artContainer.setTranslationX(lastRawArtTx);
                    }
                    lastSetArtTx = Float.NaN;
                }
                if (!Float.isNaN(lastSetArtTy)) {
                    if (Math.abs(curTy - lastSetArtTy) <= 1e-4f && !Float.isNaN(lastRawArtTy)) {
                        artContainer.setTranslationY(lastRawArtTy);
                    }
                    lastSetArtTy = Float.NaN;
                }
                restoreArtOutline(artContainer);
            } else {
                artContainer.setAlpha(prefShowAlbumArt ? 1f : (1f - collapseRatio));

                int artW = artContainer.getWidth();
                int artH = artContainer.getHeight();
                int padLArt = artContainer.getPaddingLeft();
                int padTArt = artContainer.getPaddingTop();
                int padRArt = artContainer.getPaddingRight();
                int padBArt = artContainer.getPaddingBottom();
                int availArtW = Math.max(0, artW - padLArt - padRArt);
                int availArtH = Math.max(0, artH - padTArt - padBArt);
                int minSide = Math.min(availArtW, availArtH);
                int cropL = padLArt + ((availArtW > minSide) ? (availArtW - minSide) / 2 : 0);
                int cropT = padTArt + ((availArtH > minSide) ? (availArtH - minSide) / 2 : 0);

                // Compute centered non-black square crop strictly in artContainer coords (zero mutations to child ImageViews)
                int[] miniSquare = computeMiniplayerArtSquareCrop(artContainer, cropL, cropT, minSide);
                int miniCropL = miniSquare[0];
                int miniCropT = miniSquare[1];
                int miniCropR = miniSquare[2];
                int miniCropB = miniSquare[3];
                int miniSide = Math.max(0, miniCropR - miniCropL);

                float miniCornerPx = dpToPx(Math.max(0, Math.min(28, prefMiniArtRadiusDp)));

                // Always compute live target resting transform for the current track (no stale cached offsets across songs)
                float rawTx = Float.isNaN(lastRawArtTx) ? curTx : lastRawArtTx;
                float rawTy = Float.isNaN(lastRawArtTy) ? curTy : lastRawArtTy;
                float rawScale = Math.max(0.05f, lastRawArtScale);

                float targetMinScale = (miniSide > 0)
                        ? Math.max(0.08f, Math.min(4.0f, artSize / (float) miniSide))
                        : 1f;
                float visualSide = (miniSide > 0) ? (miniSide * targetMinScale) : artSize;
                float targetMinTx = miniL + artInset - artContainer.getLeft() - miniCropL * targetMinScale;
                float targetMinTy = Math.max(0f, (pillH - visualSide) * 0.5f) - artContainer.getTop() - miniCropT * targetMinScale;

                // Record WatchWhileLayout's true settled resting transform only once collapseRatio reaches 1.0
                if (collapseRatio >= 0.9995f) {
                    stockRestArtScale = rawScale;
                    stockRestArtTx = rawTx;
                    stockRestArtTy = rawTy;
                    hasStockRestArt = true;
                }

                // Single C1-continuous curve from expanded (0.0) to minimized (1.0) with zero 0.99f snap cliff
                float appliedScale;
                float appliedTx;
                float appliedTy;
                if (hasStockRestArt) {
                    float liveScaleRatio = targetMinScale / Math.max(0.05f, stockRestArtScale);
                    float liveOffsetX = targetMinTx - stockRestArtTx;
                    float liveOffsetY = targetMinTy - stockRestArtTy;

                    float baseScale = rawScale * lerp(1f, liveScaleRatio, collapseRatio);
                    float baseTx = rawTx + liveOffsetX * collapseRatio;
                    float baseTy = rawTy + liveOffsetY * collapseRatio;

                    float endBlend = smoothstep(0.94f, 1.0f, collapseRatio);
                    appliedScale = lerp(baseScale, targetMinScale, endBlend);
                    appliedTx = lerp(baseTx, targetMinTx, endBlend);
                    appliedTy = lerp(baseTy, targetMinTy, endBlend);
                } else {
                    float blend = smoothstep(0f, 1f, collapseRatio);
                    appliedScale = lerp(rawScale, targetMinScale, blend);
                    appliedTx = lerp(rawTx, targetMinTx, blend);
                    appliedTy = lerp(rawTy, targetMinTy, blend);
                }

                artContainer.setPivotX(0f);
                artContainer.setPivotY(0f);
                artContainer.setScaleX(appliedScale);
                artContainer.setScaleY(appliedScale);
                artContainer.setTranslationX(appliedTx);
                artContainer.setTranslationY(appliedTy);
                lastSetArtScale = appliedScale;
                lastSetArtTx = appliedTx;
                lastSetArtTy = appliedTy;

                if (miniSide > 0 && collapseRatio > 0.02f) {
                    int cl = Math.round(lerp(0f, miniCropL, collapseRatio));
                    int ct = Math.round(lerp(0f, miniCropT, collapseRatio));
                    int cr = Math.round(lerp(artW, miniCropR, collapseRatio));
                    int cb = Math.round(lerp(artH, miniCropB, collapseRatio));
                    float localCornerPx = miniCornerPx / Math.max(0.08f, appliedScale);
                    applyMiniArtOutline(artContainer, cl, ct, cr, cb, localCornerPx);
                } else {
                    restoreArtOutline(artContainer);
                }
            }
        }
    }

    private static void applyMiniArtOutline(View artContainer, int l, int t, int r, int b, float localCornerPx) {
        ViewOutlineProvider current = artContainer.getOutlineProvider();
        if (current != artOutlineProvider) {
            origArtOutlineTargetRef = new WeakReference<>(artContainer);
            origArtOutlineProvider = current;
            origArtClipToOutline = artContainer.getClipToOutline();
            artContainer.setOutlineProvider(artOutlineProvider);
        }
        artOutlineProvider.set(l, t, r, b, localCornerPx);
        if (!artContainer.getClipToOutline()) {
            artContainer.setClipToOutline(true);
        }
        artContainer.invalidateOutline();
    }

    // Restores YouTube Music's original Now Playing album-art outline provider and clipping state.
    private static void restoreArtOutline(@Nullable View artContainer) {
        if (artContainer == null) return;
        if (artContainer.getOutlineProvider() == artOutlineProvider) {
            if (origArtOutlineTargetRef.get() == artContainer && origArtOutlineProvider != null) {
                artContainer.setOutlineProvider(origArtOutlineProvider);
                artContainer.setClipToOutline(origArtClipToOutline);
            } else {
                artContainer.setOutlineProvider(ViewOutlineProvider.BACKGROUND);
                artContainer.setClipToOutline(false);
            }
            artContainer.invalidateOutline();
        }
    }

    @Nullable
    private static int[] computeRelativeBounds(View child, View ancestor) {
        int l = child.getLeft();
        int t = child.getTop();
        int w = child.getWidth();
        int h = child.getHeight();
        ViewParent p = child.getParent();
        int hops = 0;
        while (p instanceof View pv && pv != ancestor && hops < 12) {
            l += pv.getLeft() - pv.getScrollX();
            t += pv.getTop() - pv.getScrollY();
            p = pv.getParent();
            hops++;
        }
        if (p != ancestor) return null;
        return new int[]{l, t, l + w, t + h};
    }

    @Nullable
    private static View findLargestVideoSurface(@Nullable View view, @Nullable View best, int depth) {
        if (view == null || depth > 7 || view.getVisibility() != View.VISIBLE || view.getAlpha() <= 0.05f) {
            return best;
        }
        if (view instanceof SurfaceView || view instanceof TextureView) {
            int w = view.getWidth();
            int h = view.getHeight();
            if (w >= 64 && h >= 64) {
                long area = (long) w * (long) h;
                long bestArea = (best != null) ? ((long) best.getWidth() * (long) best.getHeight()) : 0L;
                if (best == null || area > bestArea) {
                    best = view;
                }
            }
            return best;
        }
        if (view instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                best = findLargestVideoSurface(vg.getChildAt(i), best, depth + 1);
            }
        }
        return best;
    }

    // Computes the largest centered non-black square crop in artContainer coords for the miniplayer (read-only)
    private static int[] computeMiniplayerArtSquareCrop(
            View artContainer, int defaultL, int defaultT, int defaultSide
    ) {
        int cropL = defaultL;
        int cropT = defaultT;
        int side = defaultSide;

        ImageView primaryArtIv = findLargestAlbumImageView(artContainer, null, 0);
        boolean isShowingAlbumArt = primaryArtIv != null
                && primaryArtIv.isShown()
                && primaryArtIv.getAlpha() > 0.1f
                && primaryArtIv.getWidth() > 0
                && primaryArtIv.getHeight() > 0
                && primaryArtIv.getDrawable() != null;

        if (isShowingAlbumArt) {
            int[] relBounds = computeRelativeBounds(primaryArtIv, artContainer);
            if (relBounds != null) {
                float ivL = relBounds[0] + primaryArtIv.getPaddingLeft();
                float ivT = relBounds[1] + primaryArtIv.getPaddingTop();
                float ivR = relBounds[2] - primaryArtIv.getPaddingRight();
                float ivB = relBounds[3] - primaryArtIv.getPaddingBottom();
                float cw = ivR - ivL;
                float ch = ivB - ivT;
                if (cw >= 32f && ch >= 32f) {
                    Drawable d = primaryArtIv.getDrawable();
                    int dw = resolveDrawableIntrinsicWidth(d);
                    int dh = resolveDrawableIntrinsicHeight(d);

                    float drawL = 0f, drawT = 0f, drawR = cw, drawB = ch;
                    if (dw > 0 && dh > 0) {
                        ImageView.ScaleType st = primaryArtIv.getScaleType();
                        if (st == ImageView.ScaleType.FIT_XY) {
                            drawL = 0f; drawT = 0f; drawR = cw; drawB = ch;
                        } else if (st == ImageView.ScaleType.CENTER_CROP) {
                            float s = Math.max(cw / (float) dw, ch / (float) dh);
                            float w = dw * s, h = dh * s;
                            drawL = (cw - w) * 0.5f;
                            drawT = (ch - h) * 0.5f;
                            drawR = drawL + w;
                            drawB = drawT + h;
                        } else if (st == ImageView.ScaleType.CENTER_INSIDE) {
                            float s = (dw <= cw && dh <= ch) ? 1f : Math.min(cw / (float) dw, ch / (float) dh);
                            float w = dw * s, h = dh * s;
                            drawL = (cw - w) * 0.5f;
                            drawT = (ch - h) * 0.5f;
                            drawR = drawL + w;
                            drawB = drawT + h;
                        } else if (st == ImageView.ScaleType.CENTER) {
                            drawL = (cw - dw) * 0.5f;
                            drawT = (ch - dh) * 0.5f;
                            drawR = drawL + dw;
                            drawB = drawT + dh;
                        } else if (st == ImageView.ScaleType.FIT_START) {
                            float s = Math.min(cw / (float) dw, ch / (float) dh);
                            drawL = 0f; drawT = 0f; drawR = dw * s; drawB = dh * s;
                        } else if (st == ImageView.ScaleType.FIT_END) {
                            float s = Math.min(cw / (float) dw, ch / (float) dh);
                            float w = dw * s, h = dh * s;
                            drawL = cw - w; drawT = ch - h; drawR = cw; drawB = ch;
                        } else if (st == ImageView.ScaleType.MATRIX) {
                            tmpArtRectF.set(0f, 0f, dw, dh);
                            primaryArtIv.getImageMatrix().mapRect(tmpArtRectF);
                            drawL = tmpArtRectF.left;
                            drawT = tmpArtRectF.top;
                            drawR = tmpArtRectF.right;
                            drawB = tmpArtRectF.bottom;
                        } else {
                            // FIT_CENTER (default)
                            float s = Math.min(cw / (float) dw, ch / (float) dh);
                            float w = dw * s, h = dh * s;
                            drawL = (cw - w) * 0.5f;
                            drawT = (ch - h) * 0.5f;
                            drawR = drawL + w;
                            drawB = drawT + h;
                        }
                    }

                    // Exclude any baked-in black letterbox/pillarbox bars from the active artwork region
                    float[] active = getCachedActiveArtBounds(d);
                    float drawW = Math.max(1f, drawR - drawL);
                    float drawH = Math.max(1f, drawB - drawT);
                    float visL = Math.max(0f, drawL + active[0] * drawW);
                    float visT = Math.max(0f, drawT + active[1] * drawH);
                    float visR = Math.min(cw, drawL + active[2] * drawW);
                    float visB = Math.min(ch, drawT + active[3] * drawH);

                    float visW = visR - visL;
                    float visH = visB - visT;
                    float sq = Math.min(visW, visH);
                    if (sq >= 32f) {
                        side = Math.round(sq);
                        cropL = Math.round(ivL + (visL + visR) * 0.5f - side * 0.5f);
                        cropT = Math.round(ivT + (visT + visB) * 0.5f - side * 0.5f);
                        return new int[]{cropL, cropT, cropL + side, cropT + side};
                    }
                }
            }
            return new int[]{cropL, cropT, cropL + side, cropT + side};
        }

        // Video mode: crop centered square directly inside the visible video surface
        View videoSurface = findLargestVideoSurface(artContainer, null, 0);
        if (videoSurface != null) {
            int[] vBounds = computeRelativeBounds(videoSurface, artContainer);
            if (vBounds != null) {
                int vw = vBounds[2] - vBounds[0];
                int vh = vBounds[3] - vBounds[1];
                int vSide = Math.min(vw, vh);
                if (vSide >= 32) {
                    cropL = vBounds[0] + (vw - vSide) / 2;
                    cropT = vBounds[1] + (vh - vSide) / 2;
                    return new int[]{cropL, cropT, cropL + vSide, cropT + vSide};
                }
            }
        }
        return new int[]{cropL, cropT, cropL + side, cropT + side};
    }

    private static Drawable unwrapTopDrawable(Drawable drawable) {
        Drawable cur = drawable;
        int guard = 0;
        while (cur instanceof LayerDrawable ld && ld.getNumberOfLayers() > 0 && guard < 4) {
            Drawable top = ld.getDrawable(ld.getNumberOfLayers() - 1);
            if (top == null || top == cur) break;
            cur = top;
            guard++;
        }
        return cur;
    }

    private static int resolveDrawableIntrinsicWidth(Drawable drawable) {
        int w = drawable.getIntrinsicWidth();
        if (w > 0) return w;
        Drawable top = unwrapTopDrawable(drawable);
        return top.getIntrinsicWidth();
    }

    private static int resolveDrawableIntrinsicHeight(Drawable drawable) {
        int h = drawable.getIntrinsicHeight();
        if (h > 0) return h;
        Drawable top = unwrapTopDrawable(drawable);
        return top.getIntrinsicHeight();
    }

    private static int computeDrawableContentSignature(Drawable drawable) {
        Drawable top = unwrapTopDrawable(drawable);
        int sig = System.identityHashCode(drawable) * 31
                + System.identityHashCode(top) * 17
                + top.getIntrinsicWidth() * 13
                + top.getIntrinsicHeight() * 7;
        if (top instanceof BitmapDrawable bd && bd.getBitmap() != null && !bd.getBitmap().isRecycled()) {
            Bitmap bmp = bd.getBitmap();
            sig = sig * 31 + System.identityHashCode(bmp) + bmp.getGenerationId();
        }
        return sig;
    }

    // Safely renders a Drawable (including Android 8+ Glide HARDWARE bitmaps) into a software scratch Canvas
    private static boolean drawDrawableToSoftwareCanvas(
            Drawable drawable, Canvas dstCanvas, Rect dstRect, Rect savedBounds
    ) {
        Drawable sampleTarget = unwrapTopDrawable(drawable);
        if (sampleTarget.getIntrinsicWidth() <= 0 || sampleTarget.getIntrinsicHeight() <= 0) {
            sampleTarget = drawable;
        }
        Bitmap directBmp = (sampleTarget instanceof BitmapDrawable bd) ? bd.getBitmap() : null;
        if (directBmp != null && !directBmp.isRecycled() && directBmp.getWidth() > 0 && directBmp.getHeight() > 0) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O && directBmp.getConfig() == Bitmap.Config.HARDWARE) {
                Bitmap swCopy = null;
                try {
                    swCopy = directBmp.copy(Bitmap.Config.ARGB_8888, false);
                    if (swCopy != null) {
                        dstCanvas.drawBitmap(swCopy, null, dstRect, null);
                        return true;
                    }
                } catch (Throwable ignored) {
                    return false;
                } finally {
                    if (swCopy != null && !swCopy.isRecycled()) {
                        swCopy.recycle();
                    }
                }
                return false;
            }
            dstCanvas.drawBitmap(directBmp, null, dstRect, null);
            return true;
        }
        boolean boundsMutated = false;
        try {
            savedBounds.set(sampleTarget.getBounds());
            boundsMutated = true;
            sampleTarget.setBounds(dstRect.left, dstRect.top, dstRect.right, dstRect.bottom);
            sampleTarget.draw(dstCanvas);
            sampleTarget.setBounds(savedBounds);
            boundsMutated = false;
            return true;
        } catch (Throwable ignored) {
            if (boundsMutated) {
                try {
                    sampleTarget.setBounds(savedBounds);
                } catch (Throwable ignored2) {}
            }
            return false;
        }
    }

    private static float[] getCachedActiveArtBounds(Drawable drawable) {
        int sig = computeDrawableContentSignature(drawable);
        Integer cachedSig = artBarSigCache.get(drawable);
        float[] cachedBounds = artBarBoundsCache.get(drawable);
        if (cachedSig != null && cachedSig == sig && cachedBounds != null) {
            return cachedBounds;
        }
        float[] detected = analyzeBakedBlackBars(drawable);
        if (detected != null) {
            artBarSigCache.put(drawable, sig);
            artBarBoundsCache.put(drawable, detected);
            return detected;
        }
        return new float[]{0f, 0f, 1f, 1f};
    }

    // Returns [activeL, activeT, activeR, activeB] in [0..1] normalized drawable coords, or null if drawable not yet decoded
    @Nullable
    private static float[] analyzeBakedBlackBars(Drawable drawable) {
        try {
            if (artBarScratchBitmap == null || artBarScratchCanvas == null) {
                artBarScratchBitmap = Bitmap.createBitmap(
                        ART_BAR_SAMPLE_SIZE, ART_BAR_SAMPLE_SIZE, Bitmap.Config.ARGB_8888);
                artBarScratchCanvas = new Canvas(artBarScratchBitmap);
            }
            artBarScratchBitmap.eraseColor(Color.TRANSPARENT);
            if (!drawDrawableToSoftwareCanvas(drawable, artBarScratchCanvas, artBarDstRect, artBarSavedBounds)) {
                return null;
            }

            artBarScratchBitmap.getPixels(
                    artBarScratchPixels, 0, ART_BAR_SAMPLE_SIZE,
                    0, 0, ART_BAR_SAMPLE_SIZE, ART_BAR_SAMPLE_SIZE);

            final int n = ART_BAR_SAMPLE_SIZE;
            int opaqueCount = 0;
            for (int px : artBarScratchPixels) {
                if (Color.alpha(px) >= 160) opaqueCount++;
            }
            if (opaqueCount < 256) {
                // Drawable not decoded yet; do not cache
                return null;
            }

            int maxScan = 24; // up to ~37.5% per side (handles 4:3, 16:9, and 21:9 letterboxed inside 1:1!)
            int topBars = 0;
            for (int y = 0; y < maxScan; y++) {
                if (isSampleRowBlack(artBarScratchPixels, y, n)) topBars++;
                else break;
            }
            int bottomBars = 0;
            for (int y = n - 1; y >= n - maxScan; y--) {
                if (isSampleRowBlack(artBarScratchPixels, y, n)) bottomBars++;
                else break;
            }
            int leftBars = 0;
            for (int x = 0; x < maxScan; x++) {
                if (isSampleColBlack(artBarScratchPixels, x, n)) leftBars++;
                else break;
            }
            int rightBars = 0;
            for (int x = n - 1; x >= n - maxScan; x--) {
                if (isSampleColBlack(artBarScratchPixels, x, n)) rightBars++;
                else break;
            }

            int vMin = Math.min(topBars, bottomBars);
            int hMin = Math.min(leftBars, rightBars);

            // Detect symmetric letterbox (top+bottom) OR pillarbox (left+right), never 4-sided framed covers or all-black art
            boolean hasLetterbox = vMin >= 3 && Math.abs(topBars - bottomBars) <= 4
                    && (topBars + bottomBars) <= 42 && hMin <= 1;
            boolean hasPillarbox = hMin >= 3 && Math.abs(leftBars - rightBars) <= 4
                    && (leftBars + rightBars) <= 42 && vMin <= 1;

            if (hasLetterbox) {
                // Trim 1 extra row per side to clear JPEG/scaling edge bleed
                int yStart = Math.min(n / 2 - 4, topBars + 1);
                int yEnd = Math.max(n / 2 + 4, n - bottomBars - 1);
                if (hasNonBlackInterior(artBarScratchPixels, 0, yStart, n, yEnd, n)) {
                    return new float[]{0f, yStart / (float) n, 1f, yEnd / (float) n};
                }
            } else if (hasPillarbox) {
                int xStart = Math.min(n / 2 - 4, leftBars + 1);
                int xEnd = Math.max(n / 2 + 4, n - rightBars - 1);
                if (hasNonBlackInterior(artBarScratchPixels, xStart, 0, xEnd, n, n)) {
                    return new float[]{xStart / (float) n, 0f, xEnd / (float) n, 1f};
                }
            }
            return new float[]{0f, 0f, 1f, 1f};
        } catch (Throwable ignored) {
            return new float[]{0f, 0f, 1f, 1f};
        }
    }

    private static boolean isSampleRowBlack(int[] pixels, int y, int n) {
        int black = 0;
        int total = n - 4;
        int row = y * n;
        for (int x = 2; x < n - 2; x++) {
            int px = pixels[row + x];
            if (Color.alpha(px) >= 160 && Color.red(px) <= 30 && Color.green(px) <= 30 && Color.blue(px) <= 30) {
                black++;
            }
        }
        return black >= Math.round(total * 0.88f);
    }

    private static boolean isSampleColBlack(int[] pixels, int x, int n) {
        int black = 0;
        int total = n - 4;
        for (int y = 2; y < n - 2; y++) {
            int px = pixels[y * n + x];
            if (Color.alpha(px) >= 160 && Color.red(px) <= 30 && Color.green(px) <= 30 && Color.blue(px) <= 30) {
                black++;
            }
        }
        return black >= Math.round(total * 0.88f);
    }

    private static boolean hasNonBlackInterior(int[] pixels, int x0, int y0, int x1, int y1, int n) {
        int lit = 0;
        int total = 0;
        for (int y = y0; y < y1; y++) {
            int row = y * n;
            for (int x = x0; x < x1; x++) {
                int px = pixels[row + x];
                total++;
                if (Color.red(px) > 36 || Color.green(px) > 36 || Color.blue(px) > 36) {
                    lit++;
                }
            }
        }
        return total > 0 && (lit / (float) total) >= 0.16f;
    }

    private static void hideNativeMiniplayerProgressResidue(View playerPage, int overlayW, float pillH) {
        int maxBandY = Math.round(pillH + dpToPx(28f));

        // 1. Direct known resource IDs inside player_page
        for (int id : NATIVE_MINI_BAR_IDS) {
            if (id == 0) continue;
            View v = playerPage.findViewById(id);
            if (v != null && isInsideMiniplayerBand(v, playerPage, maxBandY)) {
                suppressNativeBarView(v);
            }
        }

        // 2. Directly suppress obfuscated native miniplayer seekbar (e.g. nvf{0,0-1080,213} inside player_top_section)
        View topSection = (PLAYER_TOP_SECTION_ID != 0) ? playerPage.findViewById(PLAYER_TOP_SECTION_ID) : null;
        if (topSection instanceof ViewGroup topVg) {
            for (int i = 0; i < topVg.getChildCount(); i++) {
                View child = topVg.getChildAt(i);
                if (child == null || child instanceof ViewGroup
                        || child instanceof MiniWaveSeekBarView
                        || child instanceof MiniBlurBackdropView
                        || child instanceof NowPlayingAmbientView) {
                    continue;
                }
                int cid = child.getId();
                if (cid != View.NO_ID && (cid == MINI_SPACER_ID || cid == WATCH_FRAGMENT_CONTAINER_ID)) {
                    continue;
                }
                suppressNativeBarView(child);
            }
            suppressNativeMiniBarsRecursive(topVg, playerPage, overlayW, maxBandY, 0, 6);
        } else if (topSection != null) {
            suppressNativeMiniBarsRecursive(topSection, playerPage, overlayW, maxBandY, 0, 6);
        }
        View bottomLayer = (PLAYER_BOTTOM_LAYER_ID != 0) ? playerPage.findViewById(PLAYER_BOTTOM_LAYER_ID) : null;
        if (bottomLayer != null) {
            suppressNativeMiniBarsRecursive(bottomLayer, playerPage, overlayW, maxBandY, 0, 4);
        } else {
            suppressNativeMiniBarsRecursive(playerPage, playerPage, overlayW, maxBandY, 0, 3);
        }
    }

    private static void suppressNativeMiniBarsRecursive(
            View view, View playerPage, int overlayW, int maxBandY, int depth, int maxDepth
    ) {
        if (view == null || depth > maxDepth) return;
        if (view instanceof MiniWaveSeekBarView
                || view instanceof MiniBlurBackdropView
                || view instanceof NowPlayingAmbientView) return;
        int id = view.getId();
        if (id != View.NO_ID && (id == MINI_SPACER_ID || id == WATCH_FRAGMENT_CONTAINER_ID)) return;

        if (isNativeMiniProgressOrDivider(view, playerPage, overlayW, maxBandY)) {
            suppressNativeBarView(view);
            return;
        }
        if (view instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                suppressNativeMiniBarsRecursive(vg.getChildAt(i), playerPage, overlayW, maxBandY, depth + 1, maxDepth);
            }
        }
    }

    private static boolean isNativeMiniProgressOrDivider(View view, View playerPage, int overlayW, int maxBandY) {
        if (!isInsideMiniplayerBand(view, playerPage, maxBandY)) return false;

        String resName = "";
        if (view.getId() != View.NO_ID) {
            try {
                resName = view.getResources().getResourceEntryName(view.getId()).toLowerCase();
            } catch (Throwable ignored) {}
        }
        if (resName.contains("time_bar") || resName.contains("scrubber_time")) return false;

        if (view instanceof ProgressBar pb) {
            return !pb.isIndeterminate();
        }
        if (resName.contains("progress") || resName.contains("mini_player_scrim") || resName.contains("divider")) {
            return !(view instanceof ViewGroup);
        }
        // Thin horizontal bar view (1px..8dp tall, wide) inside the miniplayer band
        if (!(view instanceof ViewGroup) && !(view instanceof TextView) && !(view instanceof ImageView)) {
            int h = view.getHeight();
            int w = view.getWidth();
            return h >= 1 && h <= Dim.dp(8) && w >= overlayW * 0.35f;
        }
        return false;
    }

    private static boolean isInsideMiniplayerBand(View view, View playerPage, int maxBandY) {
        int top = 0;
        View cur = view;
        int hops = 0;
        while (cur != null && cur != playerPage && hops < 16) {
            top += cur.getTop();
            ViewParent p = cur.getParent();
            if (!(p instanceof View pv)) return false;
            cur = pv;
            hops++;
        }
        return cur == playerPage && top >= -Dim.dp(8) && top <= maxBandY;
    }

    private static void suppressNativeBarView(View v) {
        v.setAlpha(0f);
        v.setScaleY(0f);
        v.setClipBounds(EMPTY_CLIP);
        v.setTranslationY(10000f);
        hiddenNativeBars.add(v);
    }

    private static void restoreNativeMiniplayer(@Nullable View playerPage, ViewGroup stockMini) {
        if (!nativeMiniStyled) return;
        nativeMiniStyled = false;
        lastRawArtTx = Float.NaN;
        lastRawArtTy = Float.NaN;
        lastSetArtTx = Float.NaN;
        lastSetArtTy = Float.NaN;
        hasStockRestArt = false;
        lastRawArtScale = 1f;
        lastSetArtScale = Float.NaN;

        if (playerPage != null) {
            playerPage.setAlpha(1f);
            playerPage.setTranslationY(0f);
            playerPage.setClipToOutline(false);
            playerPage.setOutlineProvider(ViewOutlineProvider.BACKGROUND);
            if (playerPage.getBackground() != null) {
                playerPage.getBackground().mutate().setAlpha(255);
            }
            View artContainer = (WATCH_FRAGMENT_CONTAINER_ID != 0)
                    ? playerPage.findViewById(WATCH_FRAGMENT_CONTAINER_ID) : null;
            if (artContainer != null) {
                artContainer.setAlpha(1f);
                artContainer.setScaleX(1f);
                artContainer.setScaleY(1f);
                restoreArtOutline(artContainer);
            }
            artBarBoundsCache.clear();
            artBarSigCache.clear();
        }
        restoreAmbientSystemAndClips();

        for (View bar : hiddenNativeBars) {
            if (bar != null) {
                bar.setAlpha(1f);
                bar.setScaleY(1f);
                bar.setClipBounds(null);
                bar.setTranslationY(0f);
            }
        }
        hiddenNativeBars.clear();

        restoreMiniSwipeVisualArtifacts();
        restoreHiddenMiniSubtitles();

        MiniBlurBackdropView blurView = miniBlurViewRef.get();
        if (blurView != null) blurView.setVisibility(View.GONE);
        NowPlayingAmbientView ambientView = ambientViewRef.get();
        if (ambientView != null) ambientView.setVisibility(View.GONE);
        MiniWaveSeekBarView waveView = waveSeekBarRef.get();
        if (waveView != null) waveView.setVisibility(View.GONE);

        stockMini.setPadding(0, 0, 0, 0);
        if (origMiniHeight > 0 && stockMini.getLayoutParams() != null) {
            stockMini.getLayoutParams().height = origMiniHeight;
            stockMini.requestLayout();
        }
        setViewVisibilityById(stockMini, MEDIA_ROUTE_CONTAINER_ID, View.VISIBLE);
        setViewVisibilityById(stockMini, PREV_BTN_ID,
                Settings.MINIPLAYER_PREVIOUS_BUTTON.get() ? View.VISIBLE : View.GONE);
        setViewVisibilityById(stockMini, NEXT_BTN_ID,
                Settings.MINIPLAYER_NEXT_BUTTON.get() ? View.VISIBLE : View.GONE);
        View subtitle = (SUBTITLE_ID != 0) ? stockMini.findViewById(SUBTITLE_ID) : null;
        if (subtitle != null && subtitle.getParent() instanceof View subRow) {
            subRow.setVisibility(View.VISIBLE);
            subtitle.setVisibility(View.VISIBLE);
        }
    }

    private static void cleanMiniplayerSwipeArtifacts(
            View playerPage,
            ViewGroup stockMini,
            @Nullable View artContainer,
            @Nullable ImageView playBtn,
            @Nullable TextView primaryTitleTv,
            float pillH,
            int contentColor
    ) {
        int maxBandY = Math.round(pillH + dpToPx(20f));
        boolean hasPlayBounds = false;
        int playScreenL = 0;
        int playScreenR = 0;
        if (playBtn != null && playBtn.getWidth() > 0 && playBtn.getHeight() > 0 && playBtn.isShown()) {
            playBtn.getLocationOnScreen(tmpLoc);
            playScreenL = tmpLoc[0];
            playScreenR = playScreenL + playBtn.getWidth();
            hasPlayBounds = true;
        }

        // Mute any opaque/gradient backdrop on playBtn and its controls container chain up to playerPage
        View chain = playBtn;
        int chainHops = 0;
        while (chain != null && chain != playerPage && chainHops < 8) {
            muteViewBackdropsForMini(chain);
            disableSolidMiniFadingEdge(chain);
            ViewParent p = chain.getParent();
            chain = (p instanceof View pv) ? pv : null;
            chainHops++;
        }

        List<TextView> bandTextViews = new ArrayList<>();
        View topSection = (PLAYER_TOP_SECTION_ID != 0) ? playerPage.findViewById(PLAYER_TOP_SECTION_ID) : null;
        if (topSection != null) {
            scanMiniSwipeArtifactsRecursive(
                    topSection, playerPage, stockMini, artContainer, playBtn,
                    maxBandY, pillH, hasPlayBounds, playScreenL, playScreenR,
                    false, bandTextViews, 0, 10
            );
        }
        if (topSection == null || !isDescendantOf(stockMini, topSection)) {
            scanMiniSwipeArtifactsRecursive(
                    stockMini, playerPage, stockMini, artContainer, playBtn,
                    maxBandY, pillH, hasPlayBounds, playScreenL, playScreenR,
                    false, bandTextViews, 0, 10
            );
        }

        // Also check direct overlay children of playerPage in the miniplayer band (e.g. standalone gradient scrims)
        if (playerPage instanceof ViewGroup ppVg) {
            for (int i = 0; i < ppVg.getChildCount(); i++) {
                View child = ppVg.getChildAt(i);
                if (child == null || child == topSection || child == stockMini || child == artContainer
                        || child instanceof MiniBlurBackdropView
                        || child instanceof MiniWaveSeekBarView
                        || child instanceof NowPlayingAmbientView) {
                    continue;
                }
                if (isInsideMiniplayerBand(child, playerPage, maxBandY)) {
                    String resName = getSafeResEntryName(child);
                    if (isMiniGradientOrScrimName(resName)
                            || (!(child instanceof ViewGroup) && !(child instanceof TextView) && !child.isClickable())) {
                        suppressMiniOverlayView(child);
                    }
                }
            }
        }

        // Hide ALL singer/artist subtitle views across resting miniplayer and horizontal swipe transition pages
        if (!prefShowWaveSeekbar) {
            restoreHiddenMiniSubtitles();
            for (TextView tv : bandTextViews) {
                if (isExplicitMiniSubtitle(tv)) {
                    tv.setTextColor(withAlpha(contentColor, 190));
                    tv.setSingleLine(true);
                    tv.setMaxLines(1);
                    tv.setEllipsize(TextUtils.TruncateAt.END);
                }
            }
            return;
        }

        // 1. Re-enforce any previously tracked subtitle views that YouTube Music re-showed on bind/swipe
        for (View prevSub : hiddenMiniSubtitles) {
            if (prevSub != null && prevSub.getVisibility() != View.GONE) {
                prevSub.setVisibility(View.GONE);
            }
        }

        // 2. Hide all explicit subtitle/artist/byline TextViews (works before layout & across all swipe ViewHolders)
        for (TextView tv : bandTextViews) {
            if (isExplicitMiniSubtitle(tv)) {
                hideMiniSubtitleAndRow(tv, primaryTitleTv);
            }
        }

        // 3. Structural check: hide secondary TextView rows inside vertical LinearLayouts (catches obfuscated/NO_ID swipe items)
        for (TextView tv : bandTextViews) {
            if (tv.getVisibility() == View.GONE || isExplicitMiniTitle(tv)) continue;
            if (isSecondaryTextInVerticalStack(tv)) {
                hideMiniSubtitleAndRow(tv, primaryTitleTv);
            }
        }

        // 4. Coordinate check: hide any TextView positioned vertically underneath another TextView in the same column
        int count = bandTextViews.size();
        if (count >= 2) {
            int[] rects = new int[count * 4];
            boolean[] valid = new boolean[count];
            for (int i = 0; i < count; i++) {
                TextView tv = bandTextViews.get(i);
                if (tv.getVisibility() == View.VISIBLE && tv.getWidth() > 0 && tv.getHeight() > 0) {
                    tv.getLocationOnScreen(tmpLoc);
                    rects[i * 4] = tmpLoc[0];
                    rects[i * 4 + 1] = tmpLoc[1];
                    rects[i * 4 + 2] = tmpLoc[0] + tv.getWidth();
                    rects[i * 4 + 3] = tmpLoc[1] + tv.getHeight();
                    valid[i] = true;
                }
            }
            float minTopDelta = dpToPx(6f);
            float maxBottomOverlap = dpToPx(8f);
            float horizSlop = dpToPx(12f);
            for (int i = 0; i < count; i++) {
                if (!valid[i]) continue;
                TextView tvB = bandTextViews.get(i);
                if (tvB.getVisibility() == View.GONE || isExplicitMiniTitle(tvB)) continue;
                int bL = rects[i * 4];
                int bT = rects[i * 4 + 1];
                int bR = rects[i * 4 + 2];
                for (int j = 0; j < count; j++) {
                    if (i == j || !valid[j]) continue;
                    TextView tvA = bandTextViews.get(j);
                    if (tvA.getVisibility() != View.VISIBLE || TextUtils.isEmpty(tvA.getText())) continue;
                    int aL = rects[j * 4];
                    int aT = rects[j * 4 + 1];
                    int aR = rects[j * 4 + 2];
                    int aB = rects[j * 4 + 3];
                    boolean isBelow = bT >= aT + minTopDelta && bT >= aB - maxBottomOverlap;
                    boolean overlapsX = Math.min(aR, bR) > Math.max(aL, bL) - horizSlop;
                    if (isBelow && overlapsX) {
                        hideMiniSubtitleAndRow(tvB, primaryTitleTv);
                        break;
                    }
                }
            }
        }
    }

    private static void scanMiniSwipeArtifactsRecursive(
            View view,
            View playerPage,
            ViewGroup stockMini,
            @Nullable View artContainer,
            @Nullable ImageView playBtn,
            int maxBandY,
            float pillH,
            boolean hasPlayBounds,
            int playScreenL,
            int playScreenR,
            boolean hasClippedSwipeAncestor,
            List<TextView> bandTextViews,
            int depth,
            int maxDepth
    ) {
        if (view == null || depth > maxDepth) return;
        if (view instanceof MiniBlurBackdropView
                || view instanceof MiniWaveSeekBarView
                || view instanceof NowPlayingAmbientView) {
            return;
        }
        int id = view.getId();
        if (view == artContainer || (id != View.NO_ID && (id == WATCH_FRAGMENT_CONTAINER_ID || id == MINI_SPACER_ID))) {
            return;
        }

        boolean inBand = isInsideMiniplayerBand(view, playerPage, maxBandY);
        if (view instanceof ViewGroup vg) {
            boolean clippedHere = hasClippedSwipeAncestor;
            if (inBand) {
                muteViewBackdropsForMini(vg);
                disableSolidMiniFadingEdge(vg);

                // If a swipe container extends behind playBtn, clip its drawing right at playBtn's left edge
                // so track text never collides with the play icon after removing the opaque maroon backdrop
                if (!clippedHere && hasPlayBounds && playBtn != null
                        && !isDescendantOf(playBtn, vg)
                        && (artContainer == null || (vg != artContainer && !isDescendantOf(artContainer, vg)))
                        && vg.getVisibility() == View.VISIBLE && vg.getWidth() > 0 && vg.getHeight() > 0) {
                    String cls = vg.getClass().getName();
                    boolean looksLikeSwipeHost = cls.contains("RecyclerView")
                            || cls.contains("ViewPager")
                            || cls.contains("HorizontalScrollView")
                            || cls.contains("Swipe")
                            || (vg.getParent() == stockMini && containsAnyTextView(vg, 0));
                    if (looksLikeSwipeHost) {
                        vg.getLocationOnScreen(tmpLoc);
                        int vL = tmpLoc[0];
                        int vR = vL + vg.getWidth();
                        if (vL < playScreenL - dpToPx(8f) && vR > playScreenL + dpToPx(2f)) {
                            int clipW = Math.max(0, playScreenL - vL);
                            int sx = vg.getScrollX();
                            int sy = vg.getScrollY();
                            int targetR = sx + clipW;
                            int targetB = sy + vg.getHeight();
                            boolean needsUpdate = true;
                            if (vg.getClipBounds(tmpMiniClipRect)) {
                                needsUpdate = tmpMiniClipRect.left != sx || tmpMiniClipRect.top != sy
                                        || tmpMiniClipRect.right != targetR || tmpMiniClipRect.bottom != targetB;
                            }
                            if (needsUpdate) {
                                tmpMiniClipRect.set(sx, sy, targetR, targetB);
                                vg.setClipBounds(tmpMiniClipRect);
                            }
                            clippedMiniSwipeContainers.add(vg);
                            clippedHere = true;
                        } else if (clippedMiniSwipeContainers.remove(vg)) {
                            vg.setClipBounds(null);
                        }
                    }
                }
            }
            for (int i = 0; i < vg.getChildCount(); i++) {
                scanMiniSwipeArtifactsRecursive(
                        vg.getChildAt(i), playerPage, stockMini, artContainer, playBtn,
                        maxBandY, pillH, hasPlayBounds, playScreenL, playScreenR,
                        clippedHere, bandTextViews, depth + 1, maxDepth
                );
            }
            return;
        }

        if (!inBand) return;
        if (view instanceof SurfaceView || view instanceof TextureView) return;
        disableSolidMiniFadingEdge(view);

        if (view instanceof TextView tv) {
            muteViewBackdropsForMini(tv);
            bandTextViews.add(tv);
            return;
        }

        if (view == playBtn || (id != View.NO_ID && id == PLAY_PAUSE_ID)) {
            muteViewBackdropsForMini(view);
            return;
        }
        if (view instanceof ProgressBar) return;

        muteViewBackdropsForMini(view);
        String resName = getSafeResEntryName(view);
        if (isMiniGradientOrScrimName(resName)) {
            suppressMiniOverlayView(view);
            return;
        }

        if (view instanceof ImageView iv) {
            Drawable imgD = iv.getDrawable();
            if (imgD instanceof GradientDrawable
                    || imgD instanceof ColorDrawable
                    || imgD instanceof ShapeDrawable
                    || imgD instanceof PaintDrawable) {
                suppressMiniOverlayView(iv);
                return;
            }
            int w = iv.getWidth();
            int h = iv.getHeight();
            // Tall narrow vertical gradient strip (e.g. fade_right drawable next to play button)
            if (w > 0 && h > 0 && w <= Dim.dp(48) && h >= pillH * 0.55f && h >= w * 1.2f) {
                suppressMiniOverlayView(iv);
                return;
            }
            if (iv.isClickable()) return;
            // Non-art overlay ImageView sitting over/right next to playBtn (never touch swipe-item album art)
            if (hasPlayBounds && w > 0 && h > 0 && !isSiblingOfTextView(iv)) {
                iv.getLocationOnScreen(tmpLoc);
                int vL = tmpLoc[0];
                int vR = vL + w;
                if (vL >= playScreenL - Dim.dp(24) && vR >= playScreenL + Dim.dp(8) && vR <= playScreenR + Dim.dp(24)) {
                    suppressMiniOverlayView(iv);
                }
            }
        } else if (!view.isClickable()) {
            // Non-clickable plain or custom leaf View (gradient/scrim/fade overlay)
            if (view.getClass() != View.class || view.getBackground() != null
                    || (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && view.getForeground() != null)) {
                suppressMiniOverlayView(view);
            }
        }
    }

    private static void muteViewBackdropsForMini(View view) {
        Drawable bg = view.getBackground();
        if (bg != null) {
            muteDrawableForMini(bg);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            Drawable fg = view.getForeground();
            if (fg != null) {
                muteDrawableForMini(fg);
            }
        }
    }

    private static void muteDrawableForMini(@Nullable Drawable d) {
        muteDrawableForMini(d, 0);
    }

    private static void muteDrawableForMini(@Nullable Drawable d, int depth) {
        if (d == null || depth > 6) return;
        if (d instanceof RippleDrawable rd) {
            for (int i = 0; i < rd.getNumberOfLayers(); i++) {
                if (rd.getId(i) == android.R.id.mask) continue;
                muteDrawableForMini(rd.getDrawable(i), depth + 1);
            }
            return;
        }
        Drawable m = d.mutate();
        if (!mutedMiniDrawables.containsKey(m)) {
            int origAlpha = m.getAlpha();
            mutedMiniDrawables.put(m, origAlpha > 0 ? origAlpha : 255);
        }
        if (m.getAlpha() != 0) {
            m.setAlpha(0);
        }
        if (m instanceof LayerDrawable ld) {
            for (int i = 0; i < ld.getNumberOfLayers(); i++) {
                if (ld.getId(i) == android.R.id.mask) continue;
                muteDrawableForMini(ld.getDrawable(i), depth + 1);
            }
        } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && m instanceof DrawableWrapper dw) {
            muteDrawableForMini(dw.getDrawable(), depth + 1);
        } else {
            Drawable current = m.getCurrent();
            if (current != null && current != m) {
                muteDrawableForMini(current, depth + 1);
            }
        }
    }

    private static void suppressMiniOverlayView(View v) {
        muteViewBackdropsForMini(v);
        if (v instanceof ImageView iv && iv.getDrawable() != null) {
            muteDrawableForMini(iv.getDrawable());
        }
        v.setClipBounds(EMPTY_CLIP);
        hiddenMiniOverlayViews.add(v);
    }

    private static void disableSolidMiniFadingEdge(View v) {
        if (v.isHorizontalFadingEdgeEnabled() && (v instanceof ViewGroup || v.getSolidColor() != 0)) {
            v.setHorizontalFadingEdgeEnabled(false);
            disabledMiniFadingEdgeViews.add(v);
        }
    }

    private static void restoreMiniSwipeVisualArtifacts() {
        if (!mutedMiniDrawables.isEmpty()) {
            for (Map.Entry<Drawable, Integer> e : mutedMiniDrawables.entrySet()) {
                Drawable d = e.getKey();
                Integer origAlpha = e.getValue();
                if (d != null && origAlpha != null) {
                    try {
                        d.setAlpha(origAlpha);
                    } catch (Throwable ignored) {}
                }
            }
            mutedMiniDrawables.clear();
        }
        if (!hiddenMiniOverlayViews.isEmpty()) {
            for (View v : hiddenMiniOverlayViews) {
                if (v != null) v.setClipBounds(null);
            }
            hiddenMiniOverlayViews.clear();
        }
        if (!disabledMiniFadingEdgeViews.isEmpty()) {
            for (View v : disabledMiniFadingEdgeViews) {
                if (v != null) v.setHorizontalFadingEdgeEnabled(true);
            }
            disabledMiniFadingEdgeViews.clear();
        }
        if (!clippedMiniSwipeContainers.isEmpty()) {
            for (View v : clippedMiniSwipeContainers) {
                if (v != null) v.setClipBounds(null);
            }
            clippedMiniSwipeContainers.clear();
        }
    }

    private static void restoreHiddenMiniSubtitles() {
        if (!hiddenMiniSubtitles.isEmpty()) {
            for (View v : hiddenMiniSubtitles) {
                if (v != null && v.getVisibility() != View.VISIBLE) {
                    v.setVisibility(View.VISIBLE);
                }
            }
            hiddenMiniSubtitles.clear();
        }
    }

    private static String getSafeResEntryName(View view) {
        int id = view.getId();
        if (id == View.NO_ID) return "";
        try {
            return view.getResources().getResourceEntryName(id).toLowerCase();
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static boolean isMiniGradientOrScrimName(String resName) {
        if (resName.isEmpty()) return false;
        return resName.contains("gradient")
                || resName.contains("fade")
                || resName.contains("scrim")
                || resName.contains("shadow")
                || resName.contains("mask")
                || resName.contains("veil")
                || resName.contains("backdrop")
                || resName.contains("curtain")
                || resName.contains("bleed")
                || (resName.contains("overlay") && !resName.contains("overlay_elements"));
    }

    private static boolean isExplicitMiniTitle(TextView tv) {
        int id = tv.getId();
        if (TITLE_ID != 0 && id == TITLE_ID) return true;
        String name = getSafeResEntryName(tv);
        return name.contains("title") && !name.contains("sub");
    }

    private static boolean isExplicitMiniSubtitle(TextView tv) {
        int id = tv.getId();
        if (SUBTITLE_ID != 0 && id == SUBTITLE_ID) return true;
        String name = getSafeResEntryName(tv);
        return name.contains("subtitle")
                || name.contains("sub_title")
                || name.contains("artist")
                || name.contains("byline")
                || name.contains("secondary")
                || name.contains("second_line")
                || name.contains("author")
                || name.contains("channel");
    }

    private static boolean isSecondaryTextInVerticalStack(TextView tv) {
        ViewParent p = tv.getParent();
        if (p instanceof LinearLayout ll && ll.getOrientation() == LinearLayout.VERTICAL) {
            int idx = ll.indexOfChild(tv);
            for (int i = 0; i < idx; i++) {
                if (containsAnyTextView(ll.getChildAt(i), 0)) return true;
            }
        } else if (p instanceof ViewGroup row && row.getParent() instanceof LinearLayout ll
                && ll.getOrientation() == LinearLayout.VERTICAL) {
            int idx = ll.indexOfChild(row);
            for (int i = 0; i < idx; i++) {
                if (containsAnyTextView(ll.getChildAt(i), 0)) return true;
            }
        }
        return false;
    }

    private static void hideMiniSubtitleAndRow(TextView subTv, @Nullable TextView primaryTitleTv) {
        if (subTv.getVisibility() != View.GONE) {
            subTv.setVisibility(View.GONE);
        }
        hiddenMiniSubtitles.add(subTv);
        ViewParent parent = subTv.getParent();
        if (parent instanceof ViewGroup subRow) {
            int rowId = subRow.getId();
            boolean isSharedColumn = (primaryTitleTv != null && subRow == primaryTitleTv.getParent())
                    || (rowId != View.NO_ID && (rowId == MINI_PLAYER_ID || rowId == PLAYER_TOP_SECTION_ID))
                    || containsOtherTextView(subRow, subTv, 0)
                    || containsWavePlayOrArt(subRow, 0);
            if (!isSharedColumn) {
                if (subRow.getVisibility() != View.GONE) {
                    subRow.setVisibility(View.GONE);
                }
                hiddenMiniSubtitles.add(subRow);
            }
        }
    }

    private static boolean containsAnyTextView(@Nullable View v, int depth) {
        if (v == null || depth > 4) return false;
        if (v instanceof TextView) return true;
        if (v instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                if (containsAnyTextView(vg.getChildAt(i), depth + 1)) return true;
            }
        }
        return false;
    }

    private static boolean containsOtherTextView(@Nullable View v, TextView exclude, int depth) {
        if (v == null || depth > 4) return false;
        if (v instanceof TextView && v != exclude) return true;
        if (v instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                if (containsOtherTextView(vg.getChildAt(i), exclude, depth + 1)) return true;
            }
        }
        return false;
    }

    private static boolean containsWavePlayOrArt(@Nullable View v, int depth) {
        if (v == null || depth > 4) return false;
        if (v instanceof MiniWaveSeekBarView) return true;
        int id = v.getId();
        if (id != View.NO_ID && (id == PLAY_PAUSE_ID || id == WATCH_FRAGMENT_CONTAINER_ID || id == MINI_SPACER_ID)) {
            return true;
        }
        if (v instanceof ImageView && v.getWidth() >= Dim.dp(24) && v.getHeight() >= Dim.dp(24)) {
            return true;
        }
        if (v instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                if (containsWavePlayOrArt(vg.getChildAt(i), depth + 1)) return true;
            }
        }
        return false;
    }

    private static boolean isSiblingOfTextView(View v) {
        ViewParent p = v.getParent();
        if (p instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                View child = vg.getChildAt(i);
                if (child != v && containsAnyTextView(child, 0)) return true;
            }
        }
        return false;
    }

    private static void setViewVisibilityById(ViewGroup root, int id, int vis) {
        if (id == 0) return;
        View v = root.findViewById(id);
        if (v != null && v.getVisibility() != vis) v.setVisibility(vis);
    }

    private static void recordSharedBackdropBlur(View anchorView, View browseContent, float topEdge) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return;
        if (sharedBackdropBlurNode == null) {
            sharedBackdropBlurNode = new RenderNode("MorpheM3NavigationBlur");
        }
        if (prefBlurRadiusDp != lastConfiguredBlurDp) {
            lastConfiguredBlurDp = prefBlurRadiusDp;
            float px = Math.max(1f, dpToPx(prefBlurRadiusDp));
            sharedBackdropBlurNode.setRenderEffect(RenderEffect.createChainEffect(
                    RenderEffect.createColorFilterEffect(new ColorMatrixColorFilter(FROSTED_BLUR_MATRIX)),
                    RenderEffect.createBlurEffect(px, px, Shader.TileMode.CLAMP)
            ));
        }

        int w = anchorView.getWidth();
        int h = anchorView.getHeight();
        if (w <= 0 || h <= 0) return;

        sharedBlurTopY = Math.max(0, Math.round(topEdge - Dim.dp(16)));
        int blurH = h - sharedBlurTopY;
        if (blurH <= 0) return;

        anchorView.getLocationOnScreen(tmpLoc);
        browseContent.getLocationOnScreen(tmpLoc2);
        float dx = tmpLoc[0] - tmpLoc2[0];
        float dy = (tmpLoc[1] + sharedBlurTopY) - tmpLoc2[1];
        int pageBg = getPageBackgroundColor(browseContent);

        isRecordingBlur = true;
        try {
            sharedBackdropBlurNode.setPosition(0, 0, w, blurH);
            RecordingCanvas rc = sharedBackdropBlurNode.beginRecording(w, blurH);
            rc.drawColor(pageBg);
            rc.translate(-dx, -dy);
            browseContent.draw(rc);
            sharedBackdropBlurNode.endRecording();
        } catch (Throwable ignored) {
        } finally {
            isRecordingBlur = false;
        }
    }

    private static float resolvePlaybackProgress(View decorView, ViewGroup stockMini, boolean isPlaying) {
        View playerPage = getPlayerPageView(decorView);
        ViewGroup searchRoot = (playerPage instanceof ViewGroup vg) ? vg : stockMini;
        float rawProgress = -1f;

        List<ProgressBar> bars = new ArrayList<>();
        collectProgressBars(searchRoot, bars, 0, 10);
        for (ProgressBar pb : bars) {
            if (!pb.isIndeterminate() && pb.getMax() > 0) {
                float r = (float) pb.getProgress() / (float) pb.getMax();
                if (r > 0f && r <= 1f) {
                    rawProgress = r;
                    break;
                } else if (rawProgress < 0f) {
                    rawProgress = r;
                }
            }
        }

        if (rawProgress <= 0.001f && playerPage instanceof ViewGroup ppVg) {
            List<TextView> texts = new ArrayList<>();
            collectViews(ppVg, null, texts, 0, 10);
            int firstSec = -1;
            int secondSec = -1;
            for (TextView tv : texts) {
                CharSequence cs = tv.getText();
                if (cs == null || cs.length() < 4 || cs.length() > 8) continue;
                String s = cs.toString().trim();
                if (TIME_TEXT_PATTERN.matcher(s).matches()) {
                    int sec = parseTimeSeconds(s);
                    if (sec >= 0) {
                        if (firstSec < 0) firstSec = sec;
                        else if (sec >= firstSec && sec > 0) {
                            secondSec = sec;
                            break;
                        }
                    }
                }
            }
            if (firstSec >= 0 && secondSec > 0) {
                long now = SystemClock.uptimeMillis();
                if (firstSec != lastParsedElapsedSec || secondSec != lastParsedTotalSec) {
                    lastParsedElapsedSec = firstSec;
                    lastParsedTotalSec = secondSec;
                    lastElapsedTickTimeMs = now;
                }
                float subSec = isPlaying ? Math.min(1f, (now - lastElapsedTickTimeMs) / 1000f) : 0f;
                rawProgress = Math.max(0f, Math.min(1f, (firstSec + subSec) / (float) secondSec));
            }
        }

        if (rawProgress < 0f) rawProgress = 0f;
        if (waitingForNewTrackZero) {
            if (rawProgress <= 0.03f || (SystemClock.uptimeMillis() - newTrackStartTimeMs) > 3500L) {
                waitingForNewTrackZero = false;
                cachedTrackProgress = (rawProgress <= 0.03f) ? rawProgress : 0f;
            } else {
                cachedTrackProgress = 0f;
            }
            return cachedTrackProgress;
        }
        cachedTrackProgress = rawProgress;
        return cachedTrackProgress;
    }

    private static int parseTimeSeconds(String timeStr) {
        try {
            String[] parts = timeStr.split(":");
            if (parts.length == 2) return Integer.parseInt(parts[0]) * 60 + Integer.parseInt(parts[1]);
            if (parts.length == 3) return Integer.parseInt(parts[0]) * 3600 + Integer.parseInt(parts[1]) * 60 + Integer.parseInt(parts[2]);
        } catch (Throwable ignored) {}
        return -1;
    }

    private static void collectProgressBars(View view, List<ProgressBar> out, int depth, int maxDepth) {
        if (view == null || depth > maxDepth) return;
        if (view instanceof ProgressBar pb) {
            out.add(pb);
            return;
        }
        if (view instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                collectProgressBars(vg.getChildAt(i), out, depth + 1, maxDepth);
            }
        }
    }

    private static boolean isMusicCurrentlyPlaying(Context context) {
        if (context.getSystemService(Context.AUDIO_SERVICE) instanceof AudioManager am) {
            try { if (am.isMusicActive()) return true; } catch (Throwable ignored) {}
        }
        ImageView playBtn = stockPlayPauseRef.get();
        return playBtn != null && playBtn.getContentDescription() != null
                && playBtn.getContentDescription().toString().toLowerCase().contains("pause");
    }

    private static void dispatchMediaPlayKey(Context context) {
        if (context.getSystemService(Context.AUDIO_SERVICE) instanceof AudioManager am) {
            try {
                long now = SystemClock.uptimeMillis();
                am.dispatchMediaKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_MEDIA_PLAY, 0));
                am.dispatchMediaKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_UP, KeyEvent.KEYCODE_MEDIA_PLAY, 0));
            } catch (Throwable ignored) {}
        }
    }

    @Nullable
    private static View captureAndSuppressNativeFabs(View decorView, @Nullable View browseContent, View overlay) {
        List<View> fabCandidates = new ArrayList<>();
        if (FAB_ID != 0) {
            View fab = decorView.findViewById(FAB_ID);
            if (fab != null) {
                if (prefReplaceLibAction || prefHidePlaylistFab) suppressNativeFabView(fab);
                if (isFabLogicallyActive(fab)) fabCandidates.add(fab);
            }
        }
        int screenW = Resources.getSystem().getDisplayMetrics().widthPixels;
        int screenH = Resources.getSystem().getDisplayMetrics().heightPixels;
        findFloatingActionButtonsRecursive(browseContent != null ? browseContent : decorView, overlay, fabCandidates, screenW, screenH, 0);

        View libraryActionFab = null;
        for (View fab : fabCandidates) {
            if (isLibraryPlusOrShuffleFab(fab)) {
                if (prefReplaceLibAction) {
                    suppressNativeFabView(fab);
                    if (libraryActionFab == null) libraryActionFab = fab;
                } else {
                    unsuppressNativeFabView(fab);
                }
            } else {
                if (prefHidePlaylistFab) suppressNativeFabView(fab);
                else unsuppressNativeFabView(fab);
            }
        }
        activeLibraryActionFabRef = new WeakReference<>(libraryActionFab);
        return libraryActionFab;
    }

    private static boolean isLibraryPlusOrShuffleFab(View fab) {
        String tag = getTabTextOrDesc(fab);
        if (tag.contains("new") || tag.contains("create") || tag.contains("add")
                || tag.contains("shuffle") || tag.contains("+")) return true;
        if (tag.contains("play") && !tag.contains("playlist")) return false;
        return FAB_ID != 0 && fab.getId() == FAB_ID;
    }

    private static void suppressNativeFabView(View fab) {
        fab.setAlpha(0f);
        fab.setClipBounds(EMPTY_CLIP);
        fab.setTranslationX(10000f);
        hiddenNativeFabs.add(fab);
    }

    private static void unsuppressNativeFabView(View fab) {
        if (hiddenNativeFabs.remove(fab)) {
            fab.setAlpha(1f);
            fab.setClipBounds(null);
            fab.setTranslationX(0f);
        }
    }

    private static boolean isFabLogicallyActive(View fab) {
        return fab.isAttachedToWindow() && fab.isShown() && fab.getVisibility() == View.VISIBLE
                && fab.getScaleX() >= 0.1f && fab.getScaleY() >= 0.1f
                && fab.getWidth() > 0 && fab.getHeight() > 0;
    }

    private static void restoreAllNativeFabs() {
        for (View fab : hiddenNativeFabs) {
            if (fab != null) {
                fab.setAlpha(1f);
                fab.setClipBounds(null);
                fab.setTranslationX(0f);
            }
        }
        hiddenNativeFabs.clear();
        activeLibraryActionFabRef = new WeakReference<>(null);
    }

    private static void findFloatingActionButtonsRecursive(View view, View overlay, List<View> out, int screenW, int screenH, int depth) {
        if (view == null || depth > 9 || view == overlay || view.getVisibility() != View.VISIBLE || out.contains(view)) return;
        String clsName = view.getClass().getName();
        if (clsName.contains("RecyclerView") || clsName.contains("ListView")) return;

        boolean isFabClass = clsName.contains("FloatingActionButton") || clsName.contains("MaterialButton");
        boolean isFabId = false;
        if (view.getId() != View.NO_ID) {
            try {
                String resName = view.getResources().getResourceEntryName(view.getId()).toLowerCase();
                isFabId = resName.contains("floating_action") || resName.contains("fab");
            } catch (Throwable ignored) {}
        }
        if (isFabClass || isFabId) {
            if (isFabId) {
                if (isFabLogicallyActive(view)) out.add(view);
                return;
            }
            int w = view.getWidth(), h = view.getHeight();
            if (h >= Dim.dp(36) && h <= Dim.dp(80) && w >= Dim.dp(36) && w <= Dim.dp(210)) {
                view.getLocationOnScreen(tmpLoc2);
                float rawRight = tmpLoc2[0] - view.getTranslationX() + w;
                float rawBottom = tmpLoc2[1] - view.getTranslationY() + h;
                if (rawRight >= screenW * 0.65f && rawBottom >= screenH * 0.48f && rawBottom <= screenH) {
                    if (isFabLogicallyActive(view)) out.add(view);
                    return;
                }
            }
        }
        if (view instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                findFloatingActionButtonsRecursive(vg.getChildAt(i), overlay, out, screenW, screenH, depth + 1);
            }
        }
    }

    @Nullable
    private static Drawable extractFabIconDrawable(@Nullable View fab) {
        if (fab == null) return null;
        if (fab instanceof ImageView iv && iv.getDrawable() != null) return iv.getDrawable();
        if (fab instanceof TextView tv) {
            for (Drawable d : tv.getCompoundDrawablesRelative()) if (d != null) return d;
            for (Drawable d : tv.getCompoundDrawables()) if (d != null) return d;
            try {
                Object iconObj = fab.getClass().getMethod("getIcon").invoke(fab);
                if (iconObj instanceof Drawable d) return d;
            } catch (Throwable ignored) {}
        }
        if (fab instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                Drawable d = extractFabIconDrawable(vg.getChildAt(i));
                if (d != null) return d;
            }
        }
        return null;
    }

    private static void updatePivotBarAndTabs(View decorView, boolean patchActive) {
        ViewGroup pivotBar = pivotBarRef.get();
        if (pivotBar == null || !pivotBar.isAttachedToWindow()) {
            View found = (PIVOT_BAR_ID != 0) ? decorView.findViewById(PIVOT_BAR_ID) : null;
            if (found instanceof ViewGroup vg) {
                pivotBar = vg;
                pivotBarRef = new WeakReference<>(pivotBar);
            }
        }
        if (pivotBar == null) return;

        if (!patchActive) {
            pivotBar.setAlpha(1f);
            pivotBar.setClipBounds(null);
            pivotBar.setTranslationX(0f);
            return;
        }

        if (pivotBar.getChildCount() > 0 && pivotBar.getChildAt(0) instanceof ViewGroup tabs) {
            int count = tabs.getChildCount();
            View homeTab = null, searchTab = null, libraryTab = null;
            for (int i = 0; i < count; i++) {
                View tab = tabs.getChildAt(i);
                if (tab == null) continue;
                String tag = getTabTextOrDesc(tab);
                if (homeTab == null && (tag.contains("home") || i == 0)) homeTab = tab;
                else if (searchTab == null && (tag.contains("search") || tag.contains("explore"))) searchTab = tab;
                else if (libraryTab == null && (tag.contains("library") || tag.contains("bookmark"))) libraryTab = tab;
            }
            if (homeTab == null && count >= 1) homeTab = tabs.getChildAt(0);
            if (searchTab == null && count >= 2) searchTab = tabs.getChildAt(Math.min((count >= 4) ? 2 : 1, count - 1));
            if (libraryTab == null && count >= 3) libraryTab = tabs.getChildAt(Math.min((count == 5) ? 3 : (count - 1), count - 1));

            if (homeTab != null) {
                homeTabRef = new WeakReference<>(homeTab);
                Drawable d = extractTabIconDrawable(homeTab);
                if (d != null) homeIconDrawableRef = new WeakReference<>(d);
            }
            if (searchTab != null) {
                searchTabRef = new WeakReference<>(searchTab);
                Drawable d = extractTabIconDrawable(searchTab);
                if (d != null) searchIconDrawableRef = new WeakReference<>(d);
            }
            if (libraryTab != null) {
                libraryTabRef = new WeakReference<>(libraryTab);
                Drawable d = extractTabIconDrawable(libraryTab);
                if (d != null) libraryIconDrawableRef = new WeakReference<>(d);
            }
        }

        pivotBar.setBackgroundColor(Color.TRANSPARENT);
        pivotBar.setAlpha(0f);
        pivotBar.setClipBounds(EMPTY_CLIP);
        pivotBar.setTranslationX(10000f);
    }

    private static String getTabTextOrDesc(View tab) {
        StringBuilder sb = new StringBuilder();
        if (tab.getContentDescription() != null) sb.append(tab.getContentDescription().toString().toLowerCase()).append(' ');
        if (TAB_BUTTON_LABEL_ID != 0 && tab.findViewById(TAB_BUTTON_LABEL_ID) instanceof TextView tv && tv.getText() != null) {
            sb.append(tv.getText().toString().toLowerCase()).append(' ');
        }
        if (tab instanceof ViewGroup vg) {
            List<TextView> labels = new ArrayList<>();
            collectViews(vg, null, labels, 0, 8);
            for (TextView tv : labels) {
                if (tv.getText() != null) sb.append(tv.getText().toString().toLowerCase()).append(' ');
            }
        }
        return sb.toString();
    }

    @Nullable
    private static Drawable extractTabIconDrawable(View tabView) {
        if (TAB_BUTTON_ICON_ID != 0 && tabView.findViewById(TAB_BUTTON_ICON_ID) instanceof ImageView iv && iv.getDrawable() != null) {
            return iv.getDrawable();
        }
        if (tabView instanceof ViewGroup vg) {
            List<ImageView> images = new ArrayList<>();
            collectViews(vg, images, null, 0, 8);
            for (ImageView iv : images) if (iv.getDrawable() != null) return iv.getDrawable();
        }
        return null;
    }

    private static int getSystemBottomRoom(View view) {
        WindowInsets insets = view.getRootWindowInsets();
        if (insets == null) return 0;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            return insets.getInsets(WindowInsets.Type.navigationBars()).bottom;
        }
        return insets.getSystemWindowInsetBottom();
    }

    private static int getPageBackgroundColor(View source) {
        for (ViewParent parent = source.getParent(); parent instanceof View view; parent = view.getParent()) {
            if (view.getBackground() instanceof ColorDrawable color && Color.alpha(color.getColor()) == 255) {
                return color.getColor();
            }
        }
        return ThemeUtils.getAppBackgroundColor() | 0xFF000000;
    }

    private static boolean isAutoHideEnabled() {
        return !"OFF".equalsIgnoreCase(prefAutoHideMode);
    }

    private static void animateScrollHidden(final boolean hide) {
        if (!isAutoHideEnabled()) {
            isScrollHidden = false;
            scrollHideProgress = 0f;
            return;
        }
        if (isScrollHidden == hide) return;
        isScrollHidden = hide;
        lastScrollToggleTimeMs = SystemClock.uptimeMillis();

        if (activeScrollAnimator != null && activeScrollAnimator.isRunning()) activeScrollAnimator.cancel();
        activeScrollAnimator = ValueAnimator.ofFloat(scrollHideProgress, hide ? 1f : 0f);
        activeScrollAnimator.setDuration(SCROLL_ANIM_DURATION_MS);
        activeScrollAnimator.setInterpolator(EXPRESSIVE_INTERPOLATOR);
        activeScrollAnimator.addUpdateListener(anim -> {
            scrollHideProgress = (float) anim.getAnimatedValue();
            M3NavCapsulesView overlay = overlayViewRef.get();
            if (overlay != null) overlay.invalidate();
        });
        activeScrollAnimator.start();
    }

    private static void collectViews(@Nullable ViewGroup vg, @Nullable List<ImageView> images, @Nullable List<TextView> texts, int depth, int maxDepth) {
        if (vg == null || depth > maxDepth) return;
        for (int i = 0; i < vg.getChildCount(); i++) {
            View child = vg.getChildAt(i);
            if (child instanceof ImageView iv) { if (images != null) images.add(iv); }
            else if (child instanceof TextView tv) { if (texts != null) texts.add(tv); }
            else if (child instanceof ViewGroup childVg) collectViews(childVg, images, texts, depth + 1, maxDepth);
        }
    }

    private static boolean isDescendantOf(View view, View potentialParent) {
        for (ViewParent p = view.getParent(); p != null; p = p.getParent()) {
            if (p == potentialParent) return true;
        }
        return false;
    }

    @Nullable
    private static Activity resolveActivity(Context context) {
        while (context instanceof ContextWrapper cw) {
            if (cw instanceof Activity act) return act;
            context = cw.getBaseContext();
        }
        return null;
    }

    private static float dpToPx(float dp) {
        return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, dp, Resources.getSystem().getDisplayMetrics());
    }

    private static float lerp(float a, float b, float t) {
        return a + (b - a) * t;
    }

    private static float smoothstep(float edge0, float edge1, float x) {
        float t = Math.max(0f, Math.min(1f, (x - edge0) / Math.max(1e-6f, edge1 - edge0)));
        return t * t * (3f - 2f * t);
    }

    private static int withAlpha(int rgb, int alpha) {
        return (rgb & 0x00FFFFFF) | (Math.max(0, Math.min(255, alpha)) << 24);
    }

    private static int blendArgb(int from, int to, float ratio) {
        if (from == to) return to;
        float inv = 1f - ratio;
        int r = Math.round(Color.red(from) * inv + Color.red(to) * ratio);
        int g = Math.round(Color.green(from) * inv + Color.green(to) * ratio);
        int b = Math.round(Color.blue(from) * inv + Color.blue(to) * ratio);
        if (Math.abs(r - Color.red(to)) <= 1 && Math.abs(g - Color.green(to)) <= 1 && Math.abs(b - Color.blue(to)) <= 1) {
            return to;
        }
        return Color.rgb(r, g, b);
    }

    // Dynamic rounded-rect outline provider for native @id/player_page
    private static final class PlayerPageOutlineProvider extends ViewOutlineProvider {
        private int l, t, r, b;
        private float radius;

        void set(int left, int top, int right, int bottom, float cornerRadius) {
            this.l = left; this.t = top; this.r = right; this.b = bottom; this.radius = cornerRadius;
        }

        @Override
        public void getOutline(View view, Outline outline) {
            outline.setRoundRect(l, t, Math.max(l, r), Math.max(t, b), Math.max(0f, radius));
        }
    }

    private static void updateNowPlayingAmbient(
            View decorView,
            View playerPage,
            @Nullable View artContainer,
            int overlayW,
            int overlayH,
            float collapseRatio,
            boolean isPlayerParkedEmpty,
            int fallbackColor
    ) {
        if (!prefAmbientMode || prefAmbientIntensityPct <= 0 || isPlayerParkedEmpty || collapseRatio >= 0.85f) {
            NowPlayingAmbientView existing = ambientViewRef.get();
            if (existing != null && existing.getVisibility() != View.GONE) {
                existing.setVisibility(View.GONE);
            }
            restoreAmbientSystemAndClips();
            return;
        }

        if (!(playerPage instanceof ViewGroup ppVg)) return;

        NowPlayingAmbientView ambientView = ambientViewRef.get();
        ViewGroup currentParent = (ambientView != null && ambientView.getParent() instanceof ViewGroup vg && vg.isAttachedToWindow())
                ? vg : null;
        ViewGroup ambientHost = (currentParent != null && (currentParent == ppVg || isDescendantOf(currentParent, ppVg)))
                ? currentParent
                : resolveAmbientHost(ppVg, artContainer, overlayH);

        int targetIndex = resolveAmbientInsertIndex(ambientHost, artContainer);
        if (ambientView == null || ambientView.getParent() != ambientHost) {
            if (ambientView != null && ambientView.getParent() instanceof ViewGroup oldParent) {
                oldParent.removeView(ambientView);
            }
            ambientView = new NowPlayingAmbientView(ambientHost.getContext());
            ambientView.setElevation(0f);
            ambientView.setTranslationZ(-0.5f);
            ambientView.setClickable(false);
            ambientView.setFocusable(false);
            ambientView.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            ambientHost.addView(ambientView, targetIndex, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT
            ));
            ambientViewRef = new WeakReference<>(ambientView);
        }

        // Extend ambient view edge-to-edge past any paddingBottom, inner host bounds, or gesture-bar inset
        int fullW = Math.max(decorView.getWidth(), Math.max(overlayW, ppVg.getWidth()));
        int fullH = Math.max(decorView.getHeight(), Math.max(overlayH, ppVg.getHeight()));
        decorView.getLocationOnScreen(tmpLoc);
        ambientHost.getLocationOnScreen(tmpLoc2);
        int needL = Math.min(0, tmpLoc[0] - tmpLoc2[0]);
        int needT = Math.min(0, tmpLoc[1] - tmpLoc2[1]);
        int needR = Math.max(ambientHost.getWidth(), (tmpLoc[0] + fullW) - tmpLoc2[0]);
        int needB = Math.max(ambientHost.getHeight(), (tmpLoc[1] + fullH) - tmpLoc2[1]);

        if (needR > needL && needB > needT) {
            ambientView.setFullBleedBounds(needL, needT, needR, needB);
        }

        // Unclip ambientHost and any ancestor up to playerPage (and WatchWhileLayout if playerPage stops above decorBottom)
        unclipAmbientAncestor(ambientHost);
        ViewParent p = ambientHost.getParent();
        int hops = 0;
        while (p instanceof ViewGroup vg && hops < 8) {
            if (vg == ppVg) {
                unclipAmbientAncestor(vg);
                if (collapseRatio < 0.02f && vg.getParent() instanceof ViewGroup wwlParent) {
                    int decorBottom = tmpLoc[1] + fullH;
                    vg.getLocationOnScreen(tmpLoc2);
                    if (tmpLoc2[1] + vg.getHeight() < decorBottom - 1) {
                        unclipAmbientAncestor(wwlParent);
                    }
                }
                break;
            }
            unclipAmbientAncestor(vg);
            p = vg.getParent();
            hops++;
        }

        // Prevent Android / One UI / YT Music translucent navigation bar scrim from painting a 54px dark strip over Now Playing
        if (collapseRatio < 0.25f) {
            Activity act = resolveActivity(playerPage.getContext());
            if (act != null && act.getWindow() != null) {
                Window w = act.getWindow();
                WindowManager.LayoutParams wlp = w.getAttributes();
                if (wlp != null && (wlp.flags & WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION) != 0) {
                    w.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION);
                }
                if (wlp != null && (wlp.flags & WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS) == 0) {
                    w.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
                }
                if (w.getNavigationBarColor() != Color.TRANSPARENT) {
                    w.setNavigationBarColor(Color.TRANSPARENT);
                }
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q && w.isNavigationBarContrastEnforced()) {
                    w.setNavigationBarContrastEnforced(false);
                }
            }
            View sysNavBg = decorView.findViewById(android.R.id.navigationBarBackground);
            if (sysNavBg != null) {
                suppressNavScrimView(sysNavBg);
            }
            if (!suppressedNavScrims.isEmpty()) {
                for (View v : suppressedNavScrims.keySet()) {
                    if (v != null && v.getAlpha() != 0f) {
                        v.setAlpha(0f);
                    }
                }
            }
            if (collapseRatio < 0.02f) {
                long nowScan = SystemClock.uptimeMillis();
                if (suppressedNavScrims.isEmpty() || (nowScan - lastNavScrimScanMs) >= 250L) {
                    lastNavScrimScanMs = nowScan;
                    suppressBottomNavBarScrims(decorView, fullW, fullH);
                }
            }
        } else {
            restoreSuppressedNavScrims();
        }

        float ambientAlpha = Math.max(0f, Math.min(1f, (0.85f - collapseRatio) / 0.85f));
        if (ambientView.getVisibility() != View.VISIBLE) {
            ambientView.setVisibility(View.VISIBLE);
        }
        ambientView.setAlpha(ambientAlpha);

        long nowMs = SystemClock.uptimeMillis();
        if (!TextUtils.equals(lastSampledTrackKey, lastAmbientTrackKey)) {
            lastAmbientTrackKey = lastSampledTrackKey;
            ambientHasBitmapForTrack = false;
            lastAmbientDrawableSig = 0;
            lastAmbientSampleMs = 0L;
        }

        Drawable artDrawable = findPrimaryAlbumArtDrawable(artContainer);
        int drawableSig = 0;
        if (artDrawable != null) {
            drawableSig = System.identityHashCode(artDrawable) * 31
                    + artDrawable.getIntrinsicWidth() * 17
                    + artDrawable.getIntrinsicHeight();
        }

        boolean shouldSample = false;
        if (artDrawable != null) {
            if (drawableSig != lastAmbientDrawableSig) {
                shouldSample = true;
            } else if (!ambientHasBitmapForTrack && (nowMs - lastAmbientSampleMs) >= 350L) {
                shouldSample = true;
            } else if ((nowMs - newTrackStartTimeMs) <= 2500L && (nowMs - lastAmbientSampleMs) >= 500L) {
                shouldSample = true;
            }
        }

        if (shouldSample && artDrawable != null) {
            lastAmbientSampleMs = nowMs;
            if (sampleAlbumArtIntoAmbient(artDrawable, ambientView, fallbackColor)) {
                lastAmbientDrawableSig = drawableSig;
                ambientHasBitmapForTrack = true;
            } else if (!ambientHasBitmapForTrack) {
                ambientView.updateFallbackFromColor(fallbackColor);
            }
        } else if (!ambientHasBitmapForTrack) {
            ambientView.updateFallbackFromColor(fallbackColor);
        }
    }

    private static ViewGroup resolveAmbientHost(ViewGroup playerPage, @Nullable View artContainer, int overlayH) {
        if (artContainer == null) return playerPage;
        int minH = Math.max(Math.round(overlayH * 0.90f), Math.round(playerPage.getHeight() * 0.90f));
        int minW = Math.round(playerPage.getWidth() * 0.90f);
        ViewParent p = artContainer.getParent();
        int hops = 0;
        while (p instanceof ViewGroup vg && hops < 6) {
            if (vg == playerPage) break;
            // Only attach to safe full-screen FrameLayout/RelativeLayout hosts (never LinearLayout/ConstraintLayout or partial-height containers)
            if ((vg instanceof FrameLayout || vg instanceof RelativeLayout)
                    && vg.getHeight() >= minH && vg.getWidth() >= minW) {
                Drawable bg = vg.getBackground();
                if ((bg instanceof ColorDrawable || bg instanceof GradientDrawable) && bg.getAlpha() > 20) {
                    return vg;
                }
            }
            p = vg.getParent();
            hops++;
        }
        return playerPage;
    }

    private static int resolveAmbientInsertIndex(ViewGroup host, @Nullable View artContainer) {
        int minIdx = 0;
        if (host.getChildCount() > 0 && host.getChildAt(0) instanceof MiniBlurBackdropView) {
            minIdx = 1;
        }
        if (artContainer != null) {
            for (int i = minIdx; i < host.getChildCount(); i++) {
                View child = host.getChildAt(i);
                if (child == artContainer || isDescendantOf(artContainer, child)) {
                    return i;
                }
            }
        }
        return Math.min(minIdx, host.getChildCount());
    }

    @Nullable
    private static Drawable findPrimaryAlbumArtDrawable(@Nullable View artContainer) {
        if (artContainer == null) return null;
        ImageView best = findLargestAlbumImageView(artContainer, null, 0);
        return (best != null) ? best.getDrawable() : null;
    }

    @Nullable
    private static ImageView findLargestAlbumImageView(View view, @Nullable ImageView best, int depth) {
        if (view == null || depth > 7 || view.getVisibility() != View.VISIBLE) return best;
        if (view instanceof ImageView iv) {
            Drawable d = iv.getDrawable();
            if (d != null) {
                int iw = Math.max(iv.getWidth(), d.getIntrinsicWidth());
                int ih = Math.max(iv.getHeight(), d.getIntrinsicHeight());
                if (iw >= 48 && ih >= 48) {
                    long area = (long) iw * (long) ih;
                    long bestArea = 0L;
                    if (best != null && best.getDrawable() != null) {
                        int bw = Math.max(best.getWidth(), best.getDrawable().getIntrinsicWidth());
                        int bh = Math.max(best.getHeight(), best.getDrawable().getIntrinsicHeight());
                        bestArea = (long) bw * (long) bh;
                    }
                    if (best == null || area > bestArea) {
                        best = iv;
                    }
                }
            }
            return best;
        }
        if (view instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                best = findLargestAlbumImageView(vg.getChildAt(i), best, depth + 1);
            }
        }
        return best;
    }

    private static void unclipAmbientAncestor(ViewGroup vg) {
        if (!origAmbientAncestorClips.containsKey(vg)) {
            origAmbientAncestorClips.put(vg, new boolean[]{vg.getClipChildren(), vg.getClipToPadding()});
        }
        if (vg.getClipChildren()) vg.setClipChildren(false);
        if (vg.getClipToPadding()) vg.setClipToPadding(false);
    }

    private static void suppressNavScrimView(View v) {
        if (!suppressedNavScrims.containsKey(v)) {
            suppressedNavScrims.put(v, v.getAlpha());
        }
        if (v.getAlpha() != 0f) {
            v.setAlpha(0f);
        }
    }

    private static void suppressBottomNavBarScrims(View decorView, int fullW, int fullH) {
        if (fullW <= 0 || fullH <= 0) return;
        decorView.getLocationOnScreen(tmpLoc);
        int decorBottom = tmpLoc[1] + fullH;
        int navInset = getSystemBottomRoom(decorView);
        int minH = (navInset > 0) ? Math.max(8, Math.round(navInset - dpToPx(8f))) : Math.round(dpToPx(10f));
        int maxH = (navInset > 0) ? Math.round(navInset + dpToPx(12f)) : Math.round(dpToPx(32f));
        int bottomTol = Math.round(dpToPx(4f));
        int topTol = Math.round(dpToPx(6f));
        suppressBottomNavBarScrimsRecursive(decorView, fullW, decorBottom, minH, maxH, bottomTol, topTol, 0);
    }

    private static void suppressBottomNavBarScrimsRecursive(
            View view, int fullW, int decorBottom, int minH, int maxH, int bottomTol, int topTol, int depth
    ) {
        if (view == null || depth > 8 || view.getVisibility() != View.VISIBLE) return;
        if (view instanceof NowPlayingAmbientView
                || view instanceof MiniBlurBackdropView
                || view instanceof M3NavCapsulesView
                || view instanceof MiniWaveSeekBarView) {
            return;
        }
        boolean isLeafScrimCandidate = !(view instanceof ViewGroup)
                || (((ViewGroup) view).getChildCount() == 0);
        if (isLeafScrimCandidate
                && !(view instanceof TextView)
                && !(view instanceof ImageView)
                && !(view instanceof ProgressBar)
                && !(view instanceof SurfaceView)
                && !(view instanceof TextureView)
                && !view.isClickable()
                && !view.isFocusable()
                && view.getBackground() != null
                && view.getAlpha() > 0.01f) {
            int w = view.getWidth();
            int h = view.getHeight();
            if (w >= fullW * 0.90f && h >= minH && h <= maxH) {
                view.getLocationOnScreen(tmpLoc2);
                int vTop = tmpLoc2[1];
                int vBottom = vTop + h;
                if (vBottom >= decorBottom - bottomTol && vTop >= decorBottom - maxH - topTol) {
                    suppressNavScrimView(view);
                    return;
                }
            }
        }
        if (view instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                suppressBottomNavBarScrimsRecursive(vg.getChildAt(i), fullW, decorBottom, minH, maxH, bottomTol, topTol, depth + 1);
            }
        }
    }

    private static void restoreSuppressedNavScrims() {
        if (suppressedNavScrims.isEmpty()) return;
        for (Map.Entry<View, Float> e : suppressedNavScrims.entrySet()) {
            View v = e.getKey();
            Float orig = e.getValue();
            if (v != null && orig != null) {
                v.setAlpha(orig);
            }
        }
        suppressedNavScrims.clear();
        lastNavScrimScanMs = 0L;
    }

    private static void restoreAmbientSystemAndClips() {
        restoreSuppressedNavScrims();
        if (!origAmbientAncestorClips.isEmpty()) {
            for (Map.Entry<ViewGroup, boolean[]> e : origAmbientAncestorClips.entrySet()) {
                ViewGroup vg = e.getKey();
                boolean[] clips = e.getValue();
                if (vg != null && clips != null && clips.length >= 2) {
                    vg.setClipChildren(clips[0]);
                    vg.setClipToPadding(clips[1]);
                }
            }
            origAmbientAncestorClips.clear();
        }
    }

    private static boolean sampleAlbumArtIntoAmbient(
            Drawable drawable,
            NowPlayingAmbientView ambientView,
            int fallbackColor
    ) {
        try {
            if (ambientScratchBitmap == null || ambientScratchCanvas == null) {
                ambientScratchBitmap = Bitmap.createBitmap(
                        AMBIENT_SAMPLE_SIZE, AMBIENT_SAMPLE_SIZE, Bitmap.Config.ARGB_8888);
                ambientScratchCanvas = new Canvas(ambientScratchBitmap);
            }
            ambientScratchBitmap.eraseColor(Color.TRANSPARENT);
            if (!drawDrawableToSoftwareCanvas(drawable, ambientScratchCanvas, ambientDstRect, ambientSavedBounds)) {
                return false;
            }

            ambientScratchBitmap.getPixels(
                    ambientScratchPixels, 0, AMBIENT_SAMPLE_SIZE,
                    0, 0, AMBIENT_SAMPLE_SIZE, AMBIENT_SAMPLE_SIZE);

            int opaqueCount = 0;
            int nonBlackCount = 0;
            for (int px : ambientScratchPixels) {
                if (Color.alpha(px) > 120) {
                    opaqueCount++;
                    if (Color.red(px) > 8 || Color.green(px) > 8 || Color.blue(px) > 8) {
                        nonBlackCount++;
                    }
                }
            }
            if (opaqueCount < 64 || nonBlackCount < 16) return false;

            int half = AMBIENT_SAMPLE_SIZE / 2;
            int cTL = extractQuadrantAmbientColor(ambientScratchPixels, 0, 0, half, half, fallbackColor);
            int cTR = extractQuadrantAmbientColor(ambientScratchPixels, half, 0, AMBIENT_SAMPLE_SIZE, half, fallbackColor);
            int cBL = extractQuadrantAmbientColor(ambientScratchPixels, 0, half, half, AMBIENT_SAMPLE_SIZE, fallbackColor);
            int cBR = extractQuadrantAmbientColor(ambientScratchPixels, half, half, AMBIENT_SAMPLE_SIZE, AMBIENT_SAMPLE_SIZE, fallbackColor);
            int dominant = extractQuadrantAmbientColor(ambientScratchPixels, 0, 0, AMBIENT_SAMPLE_SIZE, AMBIENT_SAMPLE_SIZE, fallbackColor);

            // Fast 2-pass separable box blur on 32x32 sample for an ultra-soft ambient mesh
            boxBlurPixels(ambientScratchPixels, ambientBlurTemp, AMBIENT_SAMPLE_SIZE, AMBIENT_SAMPLE_SIZE, 3);
            boxBlurPixels(ambientScratchPixels, ambientBlurTemp, AMBIENT_SAMPLE_SIZE, AMBIENT_SAMPLE_SIZE, 2);

            Bitmap blurredCopy = Bitmap.createBitmap(
                    AMBIENT_SAMPLE_SIZE, AMBIENT_SAMPLE_SIZE, Bitmap.Config.ARGB_8888);
            blurredCopy.setPixels(
                    ambientScratchPixels, 0, AMBIENT_SAMPLE_SIZE,
                    0, 0, AMBIENT_SAMPLE_SIZE, AMBIENT_SAMPLE_SIZE);

            ambientView.updateFromAlbumArt(blurredCopy, dominant, cTL, cTR, cBL, cBR);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static int extractQuadrantAmbientColor(
            int[] pixels, int x0, int y0, int x1, int y1, int fallbackColor
    ) {
        double sumR = 0, sumG = 0, sumB = 0, sumW = 0;
        double rawR = 0, rawG = 0, rawB = 0;
        int count = 0;
        float[] hsv = new float[3];

        for (int y = y0; y < y1; y++) {
            int row = y * AMBIENT_SAMPLE_SIZE;
            for (int x = x0; x < x1; x++) {
                int px = pixels[row + x];
                if (Color.alpha(px) < 100) continue;
                int r = Color.red(px), g = Color.green(px), b = Color.blue(px);
                rawR += r; rawG += g; rawB += b; count++;
                Color.RGBToHSV(r, g, b, hsv);
                float sat = hsv[1];
                float val = hsv[2];
                // Strongly favor saturated, mid-to-bright tones while avoiding pure black/white borders
                if (val < 0.08f) continue;
                double w = 0.25 + (sat * sat * 3.5) + (val * (1.15 - Math.abs(val - 0.62)) * 0.6);
                sumR += r * w;
                sumG += g * w;
                sumB += b * w;
                sumW += w;
            }
        }
        int base;
        if (sumW > 0.01) {
            base = Color.rgb(
                    Math.min(255, (int) Math.round(sumR / sumW)),
                    Math.min(255, (int) Math.round(sumG / sumW)),
                    Math.min(255, (int) Math.round(sumB / sumW))
            );
        } else if (count > 0) {
            base = Color.rgb(
                    Math.min(255, (int) Math.round(rawR / count)),
                    Math.min(255, (int) Math.round(rawG / count)),
                    Math.min(255, (int) Math.round(rawB / count))
            );
        } else {
            base = fallbackColor | 0xFF000000;
        }
        return tuneAmbientOrbColor(base);
    }

    private static int tuneAmbientOrbColor(int color) {
        float[] hsv = new float[3];
        Color.colorToHSV(color | 0xFF000000, hsv);
        if (hsv[1] > 0.05f) {
            hsv[1] = Math.min(0.86f, Math.max(0.24f, hsv[1] * 1.22f));
        }
        hsv[2] = Math.max(0.30f, Math.min(0.76f, hsv[2] < 0.30f ? hsv[2] + 0.22f : hsv[2] * 0.92f));
        return Color.HSVToColor(hsv) | 0xFF000000;
    }

    private static int tuneAmbientBaseColor(int color) {
        float[] hsv = new float[3];
        Color.colorToHSV(color | 0xFF000000, hsv);
        hsv[1] = Math.min(0.60f, hsv[1] * 0.85f);
        hsv[2] = Math.max(0.06f, Math.min(0.14f, hsv[2] * 0.22f));
        return Color.HSVToColor(hsv) | 0xFF000000;
    }

    private static int shiftHueAmbientColor(int color, float hueDeltaDeg, float valScale) {
        float[] hsv = new float[3];
        Color.colorToHSV(color | 0xFF000000, hsv);
        hsv[0] = (hsv[0] + hueDeltaDeg + 360f) % 360f;
        hsv[1] = Math.min(0.82f, Math.max(0.26f, hsv[1] * 1.15f));
        hsv[2] = Math.max(0.28f, Math.min(0.72f, hsv[2] * valScale));
        return Color.HSVToColor(hsv) | 0xFF000000;
    }

    private static void boxBlurPixels(int[] pixels, int[] temp, int w, int h, int radius) {
        int span = radius * 2 + 1;
        // Horizontal pass
        for (int y = 0; y < h; y++) {
            int row = y * w;
            for (int x = 0; x < w; x++) {
                int r = 0, g = 0, b = 0;
                for (int dx = -radius; dx <= radius; dx++) {
                    int sx = Math.max(0, Math.min(w - 1, x + dx));
                    int px = pixels[row + sx];
                    r += Color.red(px);
                    g += Color.green(px);
                    b += Color.blue(px);
                }
                temp[row + x] = Color.rgb(r / span, g / span, b / span);
            }
        }
        // Vertical pass
        for (int x = 0; x < w; x++) {
            for (int y = 0; y < h; y++) {
                int r = 0, g = 0, b = 0;
                for (int dy = -radius; dy <= radius; dy++) {
                    int sy = Math.max(0, Math.min(h - 1, y + dy));
                    int px = temp[sy * w + x];
                    r += Color.red(px);
                    g += Color.green(px);
                    b += Color.blue(px);
                }
                pixels[y * w + x] = Color.rgb(r / span, g / span, b / span);
            }
        }
    }

    // Living album-art ambient glow backdrop rendered behind Now Playing content
    private static final class NowPlayingAmbientView extends View {
        private static final long CROSSFADE_MS = 650L;

        private final Paint basePaint = new Paint();
        private final Paint meshPaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        private final Paint orbPaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.DITHER_FLAG);
        private final Paint scrimPaint = new Paint(Paint.DITHER_FLAG);
        private final Matrix orbMatrix = new Matrix();
        private final RectF meshRect = new RectF();

        @Nullable private Bitmap currBitmap = null;
        @Nullable private Bitmap prevBitmap = null;
        private long bitmapChangeMs = 0L;

        private int currBaseColor = 0xFF100E16;
        private int targetBaseColor = 0xFF100E16;
        private final int[] currOrbColors = new int[]{0xFF4A3B76, 0xFF6B3E68, 0xFF28486B, 0xFF5A4562};
        private final int[] targetOrbColors = new int[]{0xFF4A3B76, 0xFF6B3E68, 0xFF28486B, 0xFF5A4562};

        private final RadialGradient[] orbShaders = new RadialGradient[4];
        private final int[] shaderColors = new int[4];
        private final float[] orbX = new float[4];
        private final float[] orbY = new float[4];
        private float cachedOrbRadius = -1f;
        @Nullable private LinearGradient scrimShader = null;
        private int cachedScrimH = -1;
        private int lastFallbackColor = 0;
        private boolean hasFullBleedBounds = false;
        private int fullBleedL = 0, fullBleedT = 0, fullBleedR = 0, fullBleedB = 0;

        NowPlayingAmbientView(Context context) {
            super(context);
            setWillNotDraw(false);
            basePaint.setStyle(Paint.Style.FILL);
            orbPaint.setStyle(Paint.Style.FILL);
            scrimPaint.setStyle(Paint.Style.FILL);
        }

        void setFullBleedBounds(int l, int t, int r, int b) {
            boolean changed = !hasFullBleedBounds
                    || fullBleedL != l || fullBleedT != t || fullBleedR != r || fullBleedB != b;
            hasFullBleedBounds = true;
            fullBleedL = l;
            fullBleedT = t;
            fullBleedR = r;
            fullBleedB = b;
            if (changed || getLeft() != l || getTop() != t || getRight() != r || getBottom() != b) {
                super.layout(l, t, r, b);
            }
        }

        @Override
        public void layout(int l, int t, int r, int b) {
            if (hasFullBleedBounds) {
                super.layout(
                        Math.min(l, fullBleedL),
                        Math.min(t, fullBleedT),
                        Math.max(r, fullBleedR),
                        Math.max(b, fullBleedB)
                );
            } else {
                super.layout(l, t, r, b);
            }
        }

        void updateFromAlbumArt(Bitmap blurredMesh, int dominant, int cTL, int cTR, int cBL, int cBR) {
            if (prevBitmap != null && prevBitmap != currBitmap && !prevBitmap.isRecycled()) {
                prevBitmap.recycle();
            }
            prevBitmap = currBitmap;
            currBitmap = blurredMesh;
            bitmapChangeMs = SystemClock.uptimeMillis();
            targetBaseColor = tuneAmbientBaseColor(dominant);
            targetOrbColors[0] = cTL;
            targetOrbColors[1] = cTR;
            targetOrbColors[2] = cBL;
            targetOrbColors[3] = cBR;
            invalidate();
        }

        void updateFallbackFromColor(int baseColor) {
            int opaque = baseColor | 0xFF000000;
            if (opaque == lastFallbackColor && currBitmap == null) return;
            lastFallbackColor = opaque;
            targetBaseColor = tuneAmbientBaseColor(opaque);
            targetOrbColors[0] = tuneAmbientOrbColor(opaque);
            targetOrbColors[1] = shiftHueAmbientColor(opaque, 28f, 1.08f);
            targetOrbColors[2] = shiftHueAmbientColor(opaque, -32f, 0.92f);
            targetOrbColors[3] = shiftHueAmbientColor(opaque, 14f, 1.15f);
            invalidate();
        }

        private void ensureOrbShader(int idx, int color, float radius) {
            if (orbShaders[idx] != null && shaderColors[idx] == color && Math.abs(cachedOrbRadius - radius) < 1f) {
                return;
            }
            shaderColors[idx] = color;
            orbShaders[idx] = new RadialGradient(
                    0f, 0f, Math.max(1f, radius),
                    new int[]{withAlpha(color, 185), withAlpha(color, 82), withAlpha(color, 0)},
                    new float[]{0f, 0.52f, 1f},
                    Shader.TileMode.CLAMP
            );
        }

        @Override
        protected void onDraw(@NonNull Canvas canvas) {
            int w = getWidth();
            int h = getHeight();
            if (w <= 0 || h <= 0) return;

            // Smoothly converge colors toward the active album art palette
            currBaseColor = blendArgb(currBaseColor, targetBaseColor, 0.08f);
            for (int i = 0; i < 4; i++) {
                currOrbColors[i] = blendArgb(currOrbColors[i], targetOrbColors[i], 0.08f);
            }

            float intensity = Math.max(0f, Math.min(1.0f, prefAmbientIntensityPct / 100f));
            if (intensity <= 0.001f) return;

            long now = SystemClock.uptimeMillis();
            double t = now / 1000.0;

            // 1. Deep tonal base canvas (smoothly fades in from 0% so low glow stays subtle)
            float baseFade = Math.min(1f, intensity * 1.45f);
            basePaint.setColor(withAlpha(currBaseColor, Math.round(255f * baseFade)));
            canvas.drawRect(0f, 0f, w, h, basePaint);

            // 2. Softly blurred album art mesh centered and oversized to screen diagonal so rotated edges never enter the viewport
            float fadeT = Math.max(0f, Math.min(1f, (now - bitmapChangeMs) / (float) CROSSFADE_MS));
            float meshScale = 1.65f + 0.08f * (float) Math.sin(t * 0.24);
            float meshSize = (float) Math.hypot(w, h) * meshScale;
            float driftX = w * 0.045f * (float) Math.sin(t * 0.19);
            float driftY = h * 0.035f * (float) Math.cos(t * 0.15);
            float cx = w * 0.5f + driftX;
            float cy = h * 0.5f + driftY;
            meshRect.set(cx - meshSize * 0.5f, cy - meshSize * 0.5f, cx + meshSize * 0.5f, cy + meshSize * 0.5f);
            float rotDeg = 5.5f * (float) Math.sin(t * 0.13);
            int maxMeshAlpha = Math.round(160f * intensity);

            if (prevBitmap != null && !prevBitmap.isRecycled() && fadeT < 0.99f) {
                int save = canvas.save();
                canvas.rotate(rotDeg, w * 0.5f, h * 0.5f);
                meshPaint.setAlpha(Math.round(maxMeshAlpha * (1f - fadeT)));
                canvas.drawBitmap(prevBitmap, null, meshRect, meshPaint);
                canvas.restoreToCount(save);
            }
            if (currBitmap != null && !currBitmap.isRecycled()) {
                int save = canvas.save();
                canvas.rotate(rotDeg, w * 0.5f, h * 0.5f);
                meshPaint.setAlpha(Math.round(maxMeshAlpha * fadeT));
                canvas.drawBitmap(currBitmap, null, meshRect, meshPaint);
                canvas.restoreToCount(save);
            }

            // 3. Four slowly drifting multi-quadrant ambient glow orbs (zero per-frame allocations)
            float orbRadius = Math.max(w, h) * 0.58f;
            if (Math.abs(cachedOrbRadius - orbRadius) >= 1f) {
                for (int i = 0; i < 4; i++) orbShaders[i] = null;
                cachedOrbRadius = orbRadius;
            }
            int orbAlpha = Math.round(225f * intensity);
            orbPaint.setAlpha(orbAlpha);

            orbX[0] = w * (0.20f + 0.14f * (float) Math.sin(t * 0.31));
            orbY[0] = h * (0.18f + 0.10f * (float) Math.cos(t * 0.25));
            orbX[1] = w * (0.82f + 0.14f * (float) Math.cos(t * 0.27));
            orbY[1] = h * (0.24f + 0.11f * (float) Math.sin(t * 0.29));
            orbX[2] = w * (0.24f + 0.15f * (float) Math.cos(t * 0.22 + 1.2));
            orbY[2] = h * (0.62f + 0.12f * (float) Math.sin(t * 0.26 + 0.8));
            orbX[3] = w * (0.78f + 0.13f * (float) Math.sin(t * 0.24 + 2.1));
            orbY[3] = h * (0.58f + 0.12f * (float) Math.cos(t * 0.21 + 1.7));

            for (int i = 0; i < 4; i++) {
                ensureOrbShader(i, currOrbColors[i], orbRadius);
                orbMatrix.setTranslate(orbX[i], orbY[i]);
                orbShaders[i].setLocalMatrix(orbMatrix);
                orbPaint.setShader(orbShaders[i]);
                canvas.drawCircle(orbX[i], orbY[i], orbRadius, orbPaint);
            }

            // 4. Legibility vignette scrim so white controls, title & lyrics tabs remain crisp
            if (scrimShader == null || cachedScrimH != h) {
                cachedScrimH = h;
                scrimShader = new LinearGradient(
                        0f, 0f, 0f, h,
                        new int[]{0x55000000, 0x18000000, 0x44000000, 0xA8000000},
                        new float[]{0f, 0.28f, 0.64f, 1f},
                        Shader.TileMode.CLAMP
                );
                scrimPaint.setShader(scrimShader);
            }
            scrimPaint.setAlpha(Math.round(255f * baseFade));
            canvas.drawRect(0f, 0f, w, h, scrimPaint);

            if (getVisibility() == VISIBLE && getAlpha() > 0.02f) {
                postInvalidateDelayed(33L);
            }
        }
    }

    // Shared frosted glass blur + dynamic color tint inserted at index 0 of player_page
    private static final class MiniBlurBackdropView extends View {
        private final int[] selfLoc = new int[2];
        private final int[] overlayLoc = new int[2];
        private final Paint tintPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

        MiniBlurBackdropView(Context context) {
            super(context);
            setWillNotDraw(false);
            tintPaint.setStyle(Paint.Style.FILL);
        }

        void updateTint(int colorWithAlpha) {
            tintPaint.setColor(colorWithAlpha);
            invalidate();
        }

        @Override
        protected void onDraw(@NonNull Canvas canvas) {
            if (prefBlurRadiusDp > 0
                    && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S
                    && sharedBackdropBlurNode != null
                    && sharedBackdropBlurNode.hasDisplayList()
                    && canvas.isHardwareAccelerated()) {
                M3NavCapsulesView ov = overlayViewRef.get();
                if (ov != null) {
                    getLocationOnScreen(selfLoc);
                    ov.getLocationOnScreen(overlayLoc);
                    int save = canvas.save();
                    canvas.translate(overlayLoc[0] - selfLoc[0], (overlayLoc[1] + sharedBlurTopY) - selfLoc[1]);
                    canvas.drawRenderNode(sharedBackdropBlurNode);
                    canvas.restoreToCount(save);
                }
            }
            canvas.drawRect(0f, 0f, getWidth(), getHeight(), tintPaint);
        }
    }

    // Lightweight M3 wave seekbar injected directly inside native @id/mini_player
    private static final class MiniWaveSeekBarView extends View {
        private final Path wavePath = new Path();
        private final RectF thumbRect = new RectF();
        private final Paint activePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint inactivePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint thumbPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

        private float progress = 0f;
        private boolean playing = false;
        private float ampFraction = 0f;

        MiniWaveSeekBarView(Context context) {
            super(context);
            activePaint.setStyle(Paint.Style.STROKE);
            activePaint.setStrokeWidth(dpToPx(2.2f));
            activePaint.setStrokeCap(Paint.Cap.ROUND);
            activePaint.setStrokeJoin(Paint.Join.ROUND);

            inactivePaint.setStyle(Paint.Style.STROKE);
            inactivePaint.setStrokeWidth(dpToPx(2.0f));
            inactivePaint.setStrokeCap(Paint.Cap.ROUND);

            thumbPaint.setStyle(Paint.Style.FILL);
        }

        void update(float trackProgress, boolean isPlaying, int color) {
            this.progress = Math.max(0f, Math.min(1f, trackProgress));
            this.playing = isPlaying;
            this.ampFraction += ((isPlaying ? 1f : 0f) - ampFraction) * 0.22f;
            activePaint.setColor(color);
            thumbPaint.setColor(color);
            inactivePaint.setColor(withAlpha(color, 77));
            invalidate();
        }

        @Override
        protected void onDraw(@NonNull Canvas canvas) {
            float startX = dpToPx(1f);
            float endX = getWidth() - dpToPx(2f);
            float totalW = endX - startX;
            if (totalW <= dpToPx(16f)) return;

            float cy = getHeight() * 0.5f;
            float thumbX = startX + totalW * progress;
            float activeW = thumbX - startX;

            if (activeW > dpToPx(2f)) {
                float maxAmp = dpToPx(2.2f) * ampFraction;
                if (maxAmp <= 0.15f) {
                    canvas.drawLine(startX, cy, thumbX, cy, activePaint);
                } else {
                    wavePath.reset();
                    float wavelength = dpToPx(14f);
                    float phase = (float) ((SystemClock.uptimeMillis() % 1100L) / 1100.0 * (Math.PI * 2.0));
                    float step = dpToPx(1.8f);
                    wavePath.moveTo(startX, cy + (float) Math.sin(-phase) * maxAmp);
                    for (float x = startX + step; x < thumbX; x += step) {
                        float angle = (float) (((x - startX) / wavelength) * (Math.PI * 2.0) - phase);
                        wavePath.lineTo(x, cy + (float) Math.sin(angle) * maxAmp);
                    }
                    float endAngle = (float) (((thumbX - startX) / wavelength) * (Math.PI * 2.0) - phase);
                    wavePath.lineTo(thumbX, cy + (float) Math.sin(endAngle) * maxAmp);
                    canvas.drawPath(wavePath, activePaint);
                }
            }

            float inactiveStart = thumbX + dpToPx(4.5f);
            if (inactiveStart < endX) canvas.drawLine(inactiveStart, cy, endX, cy, inactivePaint);

            float tw = dpToPx(1.5f), th = dpToPx(4.6f);
            thumbRect.set(thumbX - tw, cy - th, thumbX + tw, cy + th);
            canvas.drawRoundRect(thumbRect, tw, tw, thumbPaint);

            if (playing || ampFraction > 0.02f) postInvalidateOnAnimation();
        }
    }

    // Lightweight overlay for [Home], [Library], [Wavy Search], and last-played fallback when player is parked empty
    private static final class M3NavCapsulesView extends View {
        private static final int TARGET_NONE = 0;
        private static final int TARGET_HOME = 1;
        private static final int TARGET_LIBRARY = 2;
        private static final int TARGET_SEARCH = 3;
        private static final int TARGET_IDLE_MINI = 4;

        final RectF homeRect = new RectF();
        final RectF miniRect = new RectF();
        final RectF libRect = new RectF();
        final RectF searchRect = new RectF();

        private final Path shapePath = new Path();
        private final Path wavyCirclePath = new Path();
        private final Path playTrianglePath = new Path();
        private final float[] radii = new float[8];
        private final int[] selfLoc = new int[2];

        private final Paint containerPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint activeContainerPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint searchContainerPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fallbackPlusPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint playIconPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final TextPaint idleTitlePaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
        private final TextPaint idleArtistPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);

        int currentContainerColor = DEFAULT_TONAL_CONTAINER;
        int currentActiveContainerColor = 0xFF423A52;
        int currentContentColor = 0xFFEAE6F2;
        private int currentSearchBgColor = 0xFFEAE6F2;

        private float barAlpha = 1f;
        private float searchAlpha = 1f;
        private boolean nativeMiniVisible = false;
        private String fallbackTitle = DEFAULT_FALLBACK_TITLE;
        private String fallbackArtist = DEFAULT_FALLBACK_ARTIST;
        private boolean useLibraryActionInRightSlot = false;
        boolean isMinimizedState = true;
        private boolean homeSelected = false;
        private boolean searchSelected = false;
        private boolean libSelected = false;

        @Nullable private Drawable homeIconDrawable;
        @Nullable private Drawable searchIconDrawable;
        @Nullable private Drawable libIconDrawable;
        @Nullable private Drawable libActionIconDrawable;

        private final int touchSlop;
        private float downX, downY;
        private int activeTouchTarget = TARGET_NONE;

        M3NavCapsulesView(Context context) {
            super(context);
            this.touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
            containerPaint.setStyle(Paint.Style.FILL);
            activeContainerPaint.setStyle(Paint.Style.FILL);
            searchContainerPaint.setStyle(Paint.Style.FILL);
            fallbackPlusPaint.setStyle(Paint.Style.STROKE);
            fallbackPlusPaint.setStrokeWidth(dpToPx(2.2f));
            fallbackPlusPaint.setStrokeCap(Paint.Cap.ROUND);
            playIconPaint.setStyle(Paint.Style.FILL);

            idleTitlePaint.setTextSize(TypedValue.applyDimension(
                    TypedValue.COMPLEX_UNIT_SP, 13.5f, Resources.getSystem().getDisplayMetrics()));
            idleTitlePaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            idleTitlePaint.setTextAlign(Paint.Align.LEFT);

            idleArtistPaint.setTextSize(TypedValue.applyDimension(
                    TypedValue.COMPLEX_UNIT_SP, 11.2f, Resources.getSystem().getDisplayMetrics()));
            idleArtistPaint.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
            idleArtistPaint.setTextAlign(Paint.Align.LEFT);
        }

        void updatePalette(int baseColor) {
            float[] hsv = new float[3];
            Color.colorToHSV(baseColor, hsv);
            int targetContainer = baseColor | 0xFF000000;
            int targetActive;
            int targetContent;
            if (hsv[2] < 0.55f) {
                targetActive = Color.HSVToColor(new float[]{hsv[0], Math.max(0.14f, Math.min(0.68f, hsv[1] * 1.05f)), Math.min(0.88f, Math.max(hsv[2] + 0.14f, 0.34f))});
                targetContent = Color.HSVToColor(new float[]{hsv[0], Math.max(0.06f, Math.min(0.24f, hsv[1] * 0.32f)), 0.96f});
            } else {
                targetActive = Color.HSVToColor(new float[]{hsv[0], Math.max(0.18f, Math.min(0.55f, hsv[1] * 1.15f)), Math.max(0.25f, hsv[2] - 0.14f)});
                targetContent = Color.HSVToColor(new float[]{hsv[0], Math.max(0.35f, Math.min(0.75f, hsv[1] * 0.85f)), 0.18f});
            }
            int targetSearchBg = prefInvertSearch
                    ? targetContent
                    : (searchSelected ? targetActive : targetContainer);

            currentContainerColor = blendArgb(currentContainerColor, targetContainer, 0.35f);
            currentActiveContainerColor = blendArgb(currentActiveContainerColor, targetActive, 0.35f);
            currentContentColor = blendArgb(currentContentColor, targetContent, 0.35f);
            currentSearchBgColor = blendArgb(currentSearchBgColor, targetSearchBg, 0.35f);

            int barFillAlpha = Math.round(255f * (Math.max(20, Math.min(100, prefBarOpacityPct)) / 100f));
            int searchFillAlpha = Math.round(255f * (Math.max(20, Math.min(100, prefSearchOpacityPct)) / 100f));

            containerPaint.setColor(withAlpha(currentContainerColor, barFillAlpha));
            activeContainerPaint.setColor(withAlpha(currentActiveContainerColor, barFillAlpha));
            searchContainerPaint.setColor(withAlpha(currentSearchBgColor, searchFillAlpha));
            fallbackPlusPaint.setColor(currentContentColor);
            playIconPaint.setColor(currentContentColor);
            idleTitlePaint.setColor(currentContentColor);
            idleArtistPaint.setColor(withAlpha(currentContentColor, 190));
        }

        boolean isTouchOnVisibleCapsule(float rawX, float rawY) {
            if (getVisibility() != VISIBLE || !isMinimizedState) return false;
            getLocationOnScreen(selfLoc);
            float lx = rawX - selfLoc[0], ly = rawY - selfLoc[1];
            if (searchAlpha > 0.35f && searchRect.contains(lx, ly)) return true;
            if (barAlpha > 0.35f) {
                return homeRect.contains(lx, ly) || libRect.contains(lx, ly) || miniRect.contains(lx, ly);
            }
            return false;
        }

        void updateState(
                @Nullable Drawable homeIcon,
                @Nullable Drawable searchIcon,
                @Nullable Drawable libIcon,
                @Nullable Drawable libActionIcon,
                boolean useLibAction,
                boolean isHomeSelected,
                boolean isSearchSelected,
                boolean isLibSelected,
                boolean isNativeMiniVisible,
                String lastTitle,
                String lastArtist,
                boolean isMinimized,
                float homeL, float homeT, float homeR, float homeB,
                float miniL, float miniT, float miniR, float miniB,
                float libL, float libT, float libR, float libB,
                float searchL, float searchT, float searchR, float searchB,
                float bAlpha,
                float sAlpha
        ) {
            this.barAlpha = bAlpha;
            this.searchAlpha = sAlpha;
            this.nativeMiniVisible = isNativeMiniVisible;
            this.fallbackTitle = TextUtils.isEmpty(lastTitle) ? DEFAULT_FALLBACK_TITLE : lastTitle;
            this.fallbackArtist = (lastArtist != null) ? lastArtist : "";
            this.useLibraryActionInRightSlot = useLibAction;
            this.isMinimizedState = isMinimized;
            this.homeSelected = isHomeSelected;
            this.searchSelected = isSearchSelected;
            this.libSelected = isLibSelected;

            int searchIconTint = prefInvertSearch ? currentContainerColor : currentContentColor;
            homeIconDrawable = cloneAndTint(homeIcon, currentContentColor);
            searchIconDrawable = cloneAndTint(searchIcon, searchIconTint);
            libIconDrawable = cloneAndTint(libIcon, currentContentColor);
            libActionIconDrawable = cloneAndTint(libActionIcon, currentContentColor);

            homeRect.set(homeL, homeT, homeR, homeB);
            miniRect.set(miniL, miniT, miniR, miniB);
            libRect.set(libL, libT, libR, libB);
            searchRect.set(searchL, searchT, searchR, searchB);
            invalidate();
        }

        @Nullable
        private static Drawable cloneAndTint(@Nullable Drawable src, int tintColor) {
            if (src == null) return null;
            Drawable d = (src.getConstantState() != null)
                    ? src.getConstantState().newDrawable().mutate()
                    : src.mutate();
            d.setTint(tintColor);
            d.setAlpha(255);
            return d;
        }

        @SuppressLint("ClickableViewAccessibility")
        @Override
        public boolean onTouchEvent(MotionEvent event) {
            if (getVisibility() != VISIBLE || !isMinimizedState) return false;
            float x = event.getX(), y = event.getY();

            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    downX = event.getRawX();
                    downY = event.getRawY();
                    activeTouchTarget = TARGET_NONE;
                    if (searchAlpha > 0.35f && searchRect.contains(x, y)) {
                        activeTouchTarget = TARGET_SEARCH;
                        return true;
                    }
                    if (barAlpha > 0.35f) {
                        if (homeRect.contains(x, y)) { activeTouchTarget = TARGET_HOME; return true; }
                        if (libRect.contains(x, y)) { activeTouchTarget = TARGET_LIBRARY; return true; }
                        if (!nativeMiniVisible && miniRect.contains(x, y)) {
                            activeTouchTarget = TARGET_IDLE_MINI;
                            return true;
                        }
                    }
                    return false;

                case MotionEvent.ACTION_MOVE:
                    return activeTouchTarget != TARGET_NONE;

                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    int target = activeTouchTarget;
                    activeTouchTarget = TARGET_NONE;
                    if (target == TARGET_NONE) return false;
                    boolean isTap = event.getActionMasked() == MotionEvent.ACTION_UP
                            && Math.hypot(event.getRawX() - downX, event.getRawY() - downY) < touchSlop * 1.5f;
                    if (isTap) {
                        performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
                        if (target == TARGET_HOME) {
                            View tab = homeTabRef.get();
                            if (tab != null) tab.performClick();
                        } else if (target == TARGET_SEARCH) {
                            View tab = searchTabRef.get();
                            if (tab != null) tab.performClick();
                        } else if (target == TARGET_LIBRARY) {
                            View fab = activeLibraryActionFabRef.get();
                            if (useLibraryActionInRightSlot && fab != null) fab.performClick();
                            else {
                                View tab = libraryTabRef.get();
                                if (tab != null) tab.performClick();
                            }
                        } else if (target == TARGET_IDLE_MINI) {
                            dispatchMediaPlayKey(getContext());
                        }
                    }
                    return true;
            }
            return false;
        }

        @Override
        protected void onDraw(@NonNull Canvas canvas) {
            float rOuter = homeRect.height() * 0.5f;
            float rInner = dpToPx(INNER_CORNER_DP);

            if (barAlpha > 0.01f) {
                int save = canvas.save();
                if (barAlpha < 0.99f) {
                    canvas.saveLayerAlpha(0, Math.max(0, homeRect.top - 4), getWidth(), getHeight(), Math.round(255 * barAlpha));
                }
                if (!homeRect.isEmpty()) {
                    drawSegment(canvas, homeRect, rOuter, rInner, rInner, rOuter, homeSelected ? activeContainerPaint : containerPaint);
                    drawCenteredIcon(canvas, homeRect, homeIconDrawable, 24f);
                }
                if (!nativeMiniVisible && !miniRect.isEmpty()) {
                    drawSegment(canvas, miniRect, rInner, rInner, rInner, rInner, containerPaint);
                    drawFallbackMiniTrack(canvas, miniRect);
                }
                if (!libRect.isEmpty()) {
                    drawSegment(canvas, libRect, rInner, rOuter, rOuter, rInner, libSelected ? activeContainerPaint : containerPaint);
                    if (useLibraryActionInRightSlot) {
                        if (libActionIconDrawable != null) drawCenteredIcon(canvas, libRect, libActionIconDrawable, 24f);
                        else drawFallbackPlus(canvas, libRect);
                    } else {
                        drawCenteredIcon(canvas, libRect, libIconDrawable, 24f);
                    }
                }
                canvas.restoreToCount(save);
            }

            if (searchAlpha > 0.01f && !searchRect.isEmpty()) {
                int save = canvas.save();
                if (searchAlpha < 0.99f) {
                    canvas.saveLayerAlpha(searchRect.left - 4, searchRect.top - 4, searchRect.right + 4, searchRect.bottom + 4, Math.round(255 * searchAlpha));
                }
                drawWavySearchButton(canvas, searchRect, searchContainerPaint);
                drawCenteredIcon(canvas, searchRect, searchIconDrawable, 28.5f);
                canvas.restoreToCount(save);
            }

            if (prefRotateSearch && searchAlpha > 0.01f) postInvalidateOnAnimation();
        }

        private void drawFallbackMiniTrack(Canvas canvas, RectF rect) {
            float padL = dpToPx(14f);
            float playAreaW = dpToPx(38f);
            float availW = Math.max(dpToPx(24f), rect.width() - padL - playAreaW);

            CharSequence titleEllip = TextUtils.ellipsize(fallbackTitle, idleTitlePaint, availW, TextUtils.TruncateAt.END);
            boolean hasArtist = !TextUtils.isEmpty(fallbackArtist);

            if (hasArtist) {
                CharSequence artistEllip = TextUtils.ellipsize(fallbackArtist, idleArtistPaint, availW, TextUtils.TruncateAt.END);
                Paint.FontMetrics tfm = idleTitlePaint.getFontMetrics();
                Paint.FontMetrics afm = idleArtistPaint.getFontMetrics();
                float titleH = tfm.descent - tfm.ascent;
                float artistH = afm.descent - afm.ascent;
                float gap = dpToPx(1.5f);
                float totalH = titleH + gap + artistH;
                float topY = rect.centerY() - totalH * 0.5f;
                canvas.drawText(titleEllip, 0, titleEllip.length(), rect.left + padL, topY - tfm.ascent, idleTitlePaint);
                canvas.drawText(artistEllip, 0, artistEllip.length(), rect.left + padL, topY + titleH + gap - afm.ascent, idleArtistPaint);
            } else {
                Paint.FontMetrics tfm = idleTitlePaint.getFontMetrics();
                float baseY = rect.centerY() - (tfm.ascent + tfm.descent) * 0.5f;
                canvas.drawText(titleEllip, 0, titleEllip.length(), rect.left + padL, baseY, idleTitlePaint);
            }

            // Subtle play triangle on right edge of fallback capsule
            float px = rect.right - playAreaW * 0.5f;
            float py = rect.centerY();
            float r = dpToPx(6.5f);
            playTrianglePath.reset();
            playTrianglePath.moveTo(px - r * 0.55f, py - r * 0.85f);
            playTrianglePath.lineTo(px + r * 0.95f, py);
            playTrianglePath.lineTo(px - r * 0.55f, py + r * 0.85f);
            playTrianglePath.close();
            canvas.drawPath(playTrianglePath, playIconPaint);
        }

        private void drawClippedBlur(Canvas canvas, Path clipTarget) {
            if (prefBlurRadiusDp <= 0 || Build.VERSION.SDK_INT < Build.VERSION_CODES.S
                    || sharedBackdropBlurNode == null || !sharedBackdropBlurNode.hasDisplayList()
                    || !canvas.isHardwareAccelerated()) return;
            int save = canvas.save();
            canvas.clipPath(clipTarget);
            canvas.translate(0, sharedBlurTopY);
            canvas.drawRenderNode(sharedBackdropBlurNode);
            canvas.restoreToCount(save);
        }

        private void drawSegment(Canvas canvas, RectF rect, float tl, float tr, float br, float bl, Paint fillPaint) {
            radii[0] = tl; radii[1] = tl; radii[2] = tr; radii[3] = tr;
            radii[4] = br; radii[5] = br; radii[6] = bl; radii[7] = bl;
            shapePath.reset();
            shapePath.addRoundRect(rect, radii, Path.Direction.CW);
            drawClippedBlur(canvas, shapePath);
            canvas.drawPath(shapePath, fillPaint);
        }

        private void drawWavySearchButton(Canvas canvas, RectF rect, Paint fillPaint) {
            float cx = rect.centerX(), cy = rect.centerY();
            float outerR = Math.min(rect.width(), rect.height()) * 0.5f;
            float lobeFrac = Math.max(0f, Math.min(0.12f, prefSearchLobePermille / 1000f));
            float baseR = outerR * (1f - lobeFrac), amp = outerR * lobeFrac;
            long periodMs = Math.max(5000L, prefSearchRotationSec * 1000L);
            double rot = prefRotateSearch ? (2.0 * Math.PI * (SystemClock.uptimeMillis() % periodMs)) / (double) periodMs : 0.0;

            wavyCirclePath.reset();
            for (int i = 0; i <= WAVY_CIRCLE_STEPS; i++) {
                double theta = (2.0 * Math.PI * i) / WAVY_CIRCLE_STEPS;
                float r = baseR + (float) Math.cos(WAVY_CIRCLE_LOBES * (theta - rot)) * amp;
                float px = cx + r * (float) Math.cos(theta);
                float py = cy + r * (float) Math.sin(theta);
                if (i == 0) wavyCirclePath.moveTo(px, py); else wavyCirclePath.lineTo(px, py);
            }
            wavyCirclePath.close();
            drawClippedBlur(canvas, wavyCirclePath);
            canvas.drawPath(wavyCirclePath, fillPaint);
        }

        private void drawCenteredIcon(Canvas canvas, RectF rect, @Nullable Drawable icon, float sizeDp) {
            if (icon == null) return;
            int sz = Math.round(dpToPx(sizeDp));
            int cx = Math.round(rect.centerX()), cy = Math.round(rect.centerY());
            icon.setBounds(cx - sz / 2, cy - sz / 2, cx + sz / 2, cy + sz / 2);
            icon.draw(canvas);
        }

        private void drawFallbackPlus(Canvas canvas, RectF rect) {
            float cx = rect.centerX(), cy = rect.centerY(), arm = dpToPx(8f);
            canvas.drawLine(cx - arm, cy, cx + arm, cy, fallbackPlusPaint);
            canvas.drawLine(cx, cy - arm, cx, cy + arm, fallbackPlusPaint);
        }
    }

    private static final class PassiveScrollCallback implements Window.Callback {
        private final Window.Callback delegate;
        private final float scrollTriggerPx;
        private float anchorX, anchorY;
        private boolean tracking;

        PassiveScrollCallback(Window.Callback delegate) {
            this.delegate = delegate;
            this.scrollTriggerPx = dpToPx(SCROLL_TRIGGER_DP);
        }

        @Override
        public boolean dispatchTouchEvent(MotionEvent event) {
            if (!prefEnabled || !isAutoHideEnabled()) return delegate.dispatchTouchEvent(event);
            M3NavCapsulesView overlay = overlayViewRef.get();
            boolean canTrack = overlay != null && overlay.getVisibility() == View.VISIBLE && overlay.isMinimizedState;

            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    anchorX = event.getRawX();
                    anchorY = event.getRawY();
                    tracking = canTrack && !overlay.isTouchOnVisibleCapsule(anchorX, anchorY);
                    break;
                case MotionEvent.ACTION_MOVE:
                    if (tracking && canTrack) {
                        float dy = anchorY - event.getRawY();
                        float dx = event.getRawX() - anchorX;
                        long now = SystemClock.uptimeMillis();
                        if (Math.abs(dy) >= scrollTriggerPx && Math.abs(dy) > Math.abs(dx) * 1.25f) {
                            if (now - lastScrollToggleTimeMs >= SCROLL_COOLDOWN_MS) {
                                if (dy > 0 && !isScrollHidden) animateScrollHidden(true);
                                else if (dy < 0 && isScrollHidden) animateScrollHidden(false);
                            }
                            anchorX = event.getRawX();
                            anchorY = event.getRawY();
                        }
                    }
                    break;
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    tracking = false;
                    break;
            }
            return delegate.dispatchTouchEvent(event);
        }

        @Override public boolean dispatchKeyEvent(KeyEvent e) { return delegate.dispatchKeyEvent(e); }
        @Override public boolean dispatchKeyShortcutEvent(KeyEvent e) { return delegate.dispatchKeyShortcutEvent(e); }
        @Override public boolean dispatchTrackballEvent(MotionEvent e) { return delegate.dispatchTrackballEvent(e); }
        @Override public boolean dispatchGenericMotionEvent(MotionEvent e) { return delegate.dispatchGenericMotionEvent(e); }
        @Override public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent e) { return delegate.dispatchPopulateAccessibilityEvent(e); }
        @Override public View onCreatePanelView(int id) { return delegate.onCreatePanelView(id); }
        @Override public boolean onCreatePanelMenu(int id, Menu m) { return delegate.onCreatePanelMenu(id, m); }
        @Override public boolean onPreparePanel(int id, View v, Menu m) { return delegate.onPreparePanel(id, v, m); }
        @Override public boolean onMenuOpened(int id, Menu m) { return delegate.onMenuOpened(id, m); }
        @Override public boolean onMenuItemSelected(int id, MenuItem item) { return delegate.onMenuItemSelected(id, item); }
        @Override public void onWindowAttributesChanged(WindowManager.LayoutParams a) { delegate.onWindowAttributesChanged(a); }
        @Override public void onContentChanged() { delegate.onContentChanged(); }
        @Override public void onWindowFocusChanged(boolean f) { delegate.onWindowFocusChanged(f); }
        @Override public void onAttachedToWindow() { delegate.onAttachedToWindow(); }
        @Override public void onDetachedFromWindow() { delegate.onDetachedFromWindow(); }
        @Override public void onPanelClosed(int id, Menu m) { delegate.onPanelClosed(id, m); }
        @Override public boolean onSearchRequested() { return delegate.onSearchRequested(); }
        @Override public boolean onSearchRequested(SearchEvent e) { return delegate.onSearchRequested(e); }
        @Override public ActionMode onWindowStartingActionMode(ActionMode.Callback cb) { return delegate.onWindowStartingActionMode(cb); }
        @Override public ActionMode onWindowStartingActionMode(ActionMode.Callback cb, int t) { return delegate.onWindowStartingActionMode(cb, t); }
        @Override public void onActionModeStarted(ActionMode m) { delegate.onActionModeStarted(m); }
        @Override public void onActionModeFinished(ActionMode m) { delegate.onActionModeFinished(m); }
    }
}
