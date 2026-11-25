package app.voidhack.extension.applemusic.lyrics;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.TextView;

import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicLong;

public final class LrclibController {
    private static final String TAG = "AppleMusicLrclib";
    private static final String LRCLIB_LYRICS_ID_PREFIX = "lrclib:";
    private static final String LOCAL_LYRICS_ID_PREFIX = "local_lrc:";
    private static final String TAG_BADGE_VIEW = "voidhack_lrclib_badge";
    private static final String TAG_PILL_VIEW = "voidhack_lrclib_pill";
    private static final long PREFETCH_DEBOUNCE_MS = 450L;

    // Capsule color presets
    private static final int BADGE_BG_GREEN = 0xEB28B84C;
    private static final int BADGE_STROKE_GREEN = 0x66C7FFD4;
    private static final int BADGE_BG_LOCAL = 0xEB0A84FF;
    private static final int BADGE_STROKE_LOCAL = 0x66A8D8FF;
    private static final int BADGE_BG_LOADING = 0x99555558;
    private static final int BADGE_STROKE_LOADING = 0x44FFFFFF;

    private static final int PILL_BG_GREEN = 0x6630D158;
    private static final int PILL_STROKE_GREEN = 0xB37DFF9B;
    private static final int PILL_BG_LOCAL = 0x660A84FF;
    private static final int PILL_STROKE_LOCAL = 0xB364D2FF;
    private static final int PILL_BG_OFFICIAL = 0x33FFFFFF;
    private static final int PILL_STROKE_OFFICIAL = 0x40FFFFFF;
    private static final int PILL_BG_SEARCH = 0x4DFA2D48;
    private static final int PILL_STROKE_SEARCH = 0x88FF7A8A;
    private static final int PILL_BG_INSTRUMENTAL = 0x4DFF9F0A;
    private static final int PILL_STROKE_INSTRUMENTAL = 0x88FFD080;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "VoidhackLrclib");
        t.setDaemon(true);
        return t;
    });

    private static volatile Context appContext;
    private static volatile WeakReference<Activity> settingsOwner = new WeakReference<>(null);
    private static volatile WeakReference<Object> activeLyricsViewModel = new WeakReference<>(null);
    private static volatile Object lastPlaybackItem;
    private static volatile LrclibModels.TrackQuery lastTrackQuery;

    private static final Map<Object, Object> vmPlaybackItems =
            Collections.synchronizedMap(new WeakHashMap<Object, Object>());
    private static final Map<Object, AtomicLong> vmGenerations =
            Collections.synchronizedMap(new WeakHashMap<Object, AtomicLong>());
    private static final Map<Object, String> vmBypassOfficialTrack =
            Collections.synchronizedMap(new WeakHashMap<Object, String>());
    private static final Map<Object, String> vmBypassLocalFolderTrack =
            Collections.synchronizedMap(new WeakHashMap<Object, String>());

    // Bounded LRU of resolved per-track lyrics state.
    private static final Map<String, TrackLyricsState> trackStates =
            Collections.synchronizedMap(new LinkedHashMap<String, TrackLyricsState>(64, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, TrackLyricsState> eldest) {
                    return size() > 128;
                }
            });

    // Tracked UI views (weak references so fragments GC cleanly).
    private static final Map<View, BadgeBinding> badgeBindings = new WeakHashMap<>();
    private static final Map<Object, PillBinding> pillBindings = new WeakHashMap<>();

    private static boolean badgeRefreshScheduled = false;
    private static final Runnable BADGE_REFRESH_TASK = new Runnable() {
        @Override
        public void run() {
            badgeRefreshScheduled = false;
            refreshAllBadgesNow();
        }
    };

    private static String pendingPrefetchKey;
    private static Runnable pendingPrefetchRunnable;
    private static final java.util.Set<String> inFlightPrefetches =
            Collections.synchronizedSet(new java.util.HashSet<String>());

    private static final class PrefetchPlan {
        final boolean checkLocalFile;
        final boolean checkLocalFolder;
        final boolean requireSyncedLocal;
        final boolean checkLrclib;
        final long pinnedId;
        final boolean requireSynced;
        final boolean fallbackToOfficialOnMiss;

        PrefetchPlan(
                boolean checkLocalFile,
                boolean checkLocalFolder,
                boolean requireSyncedLocal,
                boolean checkLrclib,
                long pinnedId,
                boolean requireSynced,
                boolean fallbackToOfficialOnMiss) {
            this.checkLocalFile = checkLocalFile;
            this.checkLocalFolder = checkLocalFolder;
            this.requireSyncedLocal = requireSyncedLocal;
            this.checkLrclib = checkLrclib;
            this.pinnedId = pinnedId;
            this.requireSynced = requireSynced;
            this.fallbackToOfficialOnMiss = fallbackToOfficialOnMiss;
        }
    }

    static final class TrackLyricsState {
        final String trackKey;
        final LrclibModels.LyricsSource source;
        final long lrclibId;
        final boolean rateLimited;
        final String localLabel;
        final boolean localFromFolder;

        TrackLyricsState(String trackKey, LrclibModels.LyricsSource source, long lrclibId, boolean rateLimited) {
            this(trackKey, source, lrclibId, rateLimited, "", false);
        }

        TrackLyricsState(
                String trackKey,
                LrclibModels.LyricsSource source,
                long lrclibId,
                boolean rateLimited,
                String localLabel,
                boolean localFromFolder) {
            this.trackKey = trackKey;
            this.source = source;
            this.lrclibId = lrclibId;
            this.rateLimited = rateLimited;
            this.localLabel = localLabel == null ? "" : localLabel;
            this.localFromFolder = localFromFolder;
        }
    }

    private static final class BadgeBinding {
        final WeakReference<Object> fragmentRef;
        final WeakReference<View> buttonRef;
        final WeakReference<TextView> badgeRef;

        BadgeBinding(Object fragment, View button, TextView badge) {
            this.fragmentRef = new WeakReference<>(fragment);
            this.buttonRef = new WeakReference<>(button);
            this.badgeRef = new WeakReference<>(badge);
        }
    }

    private static final class PillBinding {
        final WeakReference<Object> fragmentRef;
        final WeakReference<View> rootRef;
        final WeakReference<TextView> pillRef;
        final WeakReference<View> controlsRef;
        int lastControlsTop = 0;
        CharSequence originalNoLyricsText;

        PillBinding(Object fragment, View root, TextView pill, View controls) {
            this.fragmentRef = new WeakReference<>(fragment);
            this.rootRef = new WeakReference<>(root);
            this.pillRef = new WeakReference<>(pill);
            this.controlsRef = new WeakReference<>(controls);
        }
    }

    private LrclibController() {}

    static Context getAppContext() {
        return appContext;
    }

    public static void captureContext(Context ctx) {
        if (ctx != null && appContext == null) {
            appContext = ctx.getApplicationContext();
        }
    }

    static TrackLyricsState getTrackState(String trackKey) {
        if (trackKey == null || trackKey.isEmpty()) return null;
        return trackStates.get(trackKey);
    }

    static LrclibModels.TrackQuery getCurrentTrackQuery(Object fragment) {
        Object item = fragment != null ? LrclibReflection.getPlaybackItemFromFragment(fragment) : null;
        if (item != null) {
            LrclibModels.TrackQuery q = LrclibReflection.extractTrackQuery(item);
            if (q != null) return q;
        }
        return lastTrackQuery;
    }

    // -------------------------------------------------------------------------
    // Hook 1: Lyrics availability gate (f1.i(PlaybackItem)Z)
    // -------------------------------------------------------------------------

    public static boolean hasLyrics(Object playbackItem, boolean nativeResult) {
        Context ctx = appContext;
        if (playbackItem == null) return nativeResult;
        if (ctx != null && !LrclibPrefs.isEnabled(ctx)) {
            return nativeResult;
        }

        LrclibModels.TrackQuery query = LrclibReflection.extractTrackQuery(playbackItem);
        if (query == null) {
            return nativeResult;
        }

        scheduleBadgeRefresh();

        if (nativeResult) {
            return true;
        }

        if (ctx != null) {
            LrclibModels.TrackOverride ov = LrclibPrefs.getOverride(ctx, query.trackKey);
            if (ov != null && ov.mode == LrclibModels.OverrideMode.FORCE_OFFICIAL) {
                return false;
            }
        }
        // Enable the Now Playing lyrics button so LRCLIB can supply lyrics for tracks missing official lyrics.
        return true;
    }

    // -------------------------------------------------------------------------
    // Hook 2: PlayerLyricsViewModel.loadLyrics(PlaybackItem)V
    // -------------------------------------------------------------------------

    public static boolean onLoadLyrics(Object viewModel, Object playbackItem) {
        if (viewModel == null || playbackItem == null) return false;
        if (appContext == null) {
            captureContext(LrclibReflection.getApplicationContext(viewModel));
        }
        activeLyricsViewModel = new WeakReference<>(viewModel);
        vmPlaybackItems.put(viewModel, playbackItem);
        lastPlaybackItem = playbackItem;

        LrclibModels.TrackQuery query = LrclibReflection.extractTrackQuery(playbackItem);
        if (query == null) return false;
        lastTrackQuery = query;

        Context ctx = appContext;
        if (ctx == null) return false;

        long gen = nextGeneration(viewModel);
        boolean lrclibEnabled = LrclibPrefs.isEnabled(ctx);
        boolean bypassLrclib = query.trackKey.equals(vmBypassOfficialTrack.remove(viewModel));
        boolean bypassLocalFolder = query.trackKey.equals(vmBypassLocalFolderTrack.remove(viewModel));
        LrclibModels.TrackOverride override = lrclibEnabled ? LrclibPrefs.getOverride(ctx, query.trackKey) : null;
        LrclibModels.FallbackMode globalMode = LrclibPrefs.getFallbackMode(ctx);
        LrclibModels.OverrideMode ovMode = override != null ? override.mode : LrclibModels.OverrideMode.AUTO;
        boolean hasLocalFolder = lrclibEnabled && !bypassLocalFolder && LrclibPrefs.hasLocalFolder(ctx);
        LrclibModels.LocalLrcPriority localPriority = LrclibPrefs.getLocalLrcPriority(ctx);
        boolean preferLocalFolderNow = hasLocalFolder
                && ovMode == LrclibModels.OverrideMode.AUTO
                && localPriority == LrclibModels.LocalLrcPriority.PREFER_LOCAL;

        boolean useCustomLyrics = !lrclibEnabled || bypassLrclib
                || ovMode == LrclibModels.OverrideMode.FORCE_OFFICIAL
                || (ovMode == LrclibModels.OverrideMode.AUTO
                    && !preferLocalFolderNow
                    && globalMode != LrclibModels.FallbackMode.PREFER_LRCLIB);
        if (useCustomLyrics && !query.hasOfficialLyrics
                && loadCustomLyrics(ctx, viewModel, playbackItem, query)) {
            return true;
        }
        if (!lrclibEnabled || bypassLrclib) return false;

        if (ovMode == LrclibModels.OverrideMode.FORCE_LOCAL_LRC) {
            loadPerSongLocalLrcAsync(ctx, viewModel, playbackItem, query, override, gen);
            return true;
        }

        if (ovMode == LrclibModels.OverrideMode.FORCE_OFFICIAL) {
            if (!query.hasOfficialLyrics && !query.hasCustomLyrics) {
                setTrackState(query.trackKey, LrclibModels.LyricsSource.NONE, -1L, false);
                return false;
            }
            return false;
        }

        if (ovMode == LrclibModels.OverrideMode.FORCE_LRCLIB_ID && override.lrclibId > 0L) {
            markLoadingIfUnresolved(query.trackKey, override.lrclibId);
            fetchPinnedLrclibAsync(ctx, viewModel, playbackItem, query, override.lrclibId, gen, false);
            return true;
        }

        if (ovMode == LrclibModels.OverrideMode.FORCE_LRCLIB_AUTO) {
            markLoadingIfUnresolved(query.trackKey, -1L);
            fetchAutoLrclibAsync(ctx, viewModel, playbackItem, query, gen, false, null, null, false, false);
            return true;
        }

        // AUTO override mode:
        if (preferLocalFolderNow) {
            if (!query.hasOfficialLyrics && !query.hasCustomLyrics) {
                markLoadingIfUnresolved(query.trackKey, -1L);
            }
            fetchLocalFolderThenAutoAsync(ctx, viewModel, playbackItem, query, gen, globalMode);
            return true;
        }

        if (!query.hasOfficialLyrics && !query.hasCustomLyrics) {
            markLoadingIfUnresolved(query.trackKey, -1L);
            if (hasLocalFolder) {
                fetchLocalFolderThenAutoAsync(ctx, viewModel, playbackItem, query, gen, globalMode);
            } else {
                fetchAutoLrclibAsync(ctx, viewModel, playbackItem, query, gen, false, null, null, false, false);
            }
            return true;
        }

        if (globalMode == LrclibModels.FallbackMode.PREFER_LRCLIB) {
            markLoadingIfUnresolved(query.trackKey, -1L);
            fetchAutoLrclibAsync(ctx, viewModel, playbackItem, query, gen, false, null, null, true, false);
            return true;
        }

        // MISSING_AND_UNSYNCED or MISSING_ONLY with official lyrics present: let Apple Music fetch official first.
        return false;
    }

    // -------------------------------------------------------------------------
    // Hook 3: PlayerLyricsViewModel$f emit interception
    // -------------------------------------------------------------------------

    public static Object prepareNativeLyrics(Object viewModel, Object songInfoPtr) {
        Context ctx = appContext;
        if (ctx == null || songInfoPtr == null) return songInfoPtr;
        LrclibModels.TrackQuery query = LrclibReflection.extractTrackQuery(vmPlaybackItems.get(viewModel));
        if (query == null || LrclibReflection.getSongInfoAdamId(songInfoPtr) != effectiveAdamId(query)) {
            return songInfoPtr;
        }
        return OfficialLyricsPronunciation.prepare(ctx, query, songInfoPtr,
                LrclibReflection.getCurrentSystemLyricsLanguage(viewModel));
    }

    public static boolean onNativeLyricsResult(Object viewModel, Object songInfoPtr, Throwable error) {
        if (viewModel == null) return false;
        if (appContext == null) {
            captureContext(LrclibReflection.getApplicationContext(viewModel));
        }
        Object playbackItem = vmPlaybackItems.get(viewModel);
        if (playbackItem == null) playbackItem = lastPlaybackItem;
        LrclibModels.TrackQuery query = LrclibReflection.extractTrackQuery(playbackItem);
        if (query == null) return false;

        Context ctx = appContext;
        if (ctx != null && songInfoPtr == null && loadCustomLyrics(ctx, viewModel, playbackItem, query)) {
            return true;
        }
        if (ctx == null || !LrclibPrefs.isEnabled(ctx)) {
            recordOfficialState(query.trackKey, songInfoPtr);
            return false;
        }

        LrclibModels.TrackOverride override = LrclibPrefs.getOverride(ctx, query.trackKey);
        LrclibModels.OverrideMode ovMode = override != null ? override.mode : LrclibModels.OverrideMode.AUTO;
        if (ovMode == LrclibModels.OverrideMode.FORCE_OFFICIAL) {
            recordOfficialState(query.trackKey, songInfoPtr);
            return false;
        }

        LrclibModels.FallbackMode mode = LrclibPrefs.getFallbackMode(ctx);
        if (mode == LrclibModels.FallbackMode.PREFER_LRCLIB) {
            // Reached here via fallback to official lyrics after LRCLIB miss.
            recordOfficialState(query.trackKey, songInfoPtr);
            return false;
        }

        boolean hasLocalFolder = ovMode == LrclibModels.OverrideMode.AUTO && LrclibPrefs.hasLocalFolder(ctx);
        LrclibModels.LocalLrcPriority localPriority = LrclibPrefs.getLocalLrcPriority(ctx);

        if (songInfoPtr == null) {
            // Apple Music failed or returned no lyrics; try local folder (if configured) then fall back to LRCLIB.
            long gen = nextGeneration(viewModel);
            setTrackState(query.trackKey, LrclibModels.LyricsSource.LOADING_LRCLIB, -1L, false);
            if (hasLocalFolder && localPriority != LrclibModels.LocalLrcPriority.PREFER_LOCAL) {
                fetchLocalFolderOnNativeFallbackAsync(
                        ctx, viewModel, playbackItem, query, gen, false, null, error, true);
            } else {
                fetchAutoLrclibAsync(ctx, viewModel, playbackItem, query, gen, false, null, error, false, false);
            }
            return true;
        }

        long timing = LrclibReflection.getSongInfoTiming(songInfoPtr);
        boolean tryLocalSyncedUpgrade = timing == 0L
                && hasLocalFolder
                && localPriority == LrclibModels.LocalLrcPriority.MISSING_AND_UNSYNCED;
        boolean tryLrclibSyncedUpgrade = timing == 0L
                && mode == LrclibModels.FallbackMode.MISSING_AND_UNSYNCED
                && !(LrclibPrefs.isRomanizationEnabled(ctx) && OfficialLyricsPronunciation.hasOfficialReading(songInfoPtr));

        if (tryLocalSyncedUpgrade) {
            long gen = nextGeneration(viewModel);
            setTrackState(query.trackKey, LrclibModels.LyricsSource.LOADING_LRCLIB, -1L, false);
            fetchLocalFolderOnNativeFallbackAsync(
                    ctx, viewModel, playbackItem, query, gen, true, songInfoPtr, error, tryLrclibSyncedUpgrade);
            return true;
        }

        if (tryLrclibSyncedUpgrade) {
            // Official lyrics are static/unsynced; try upgrading to synced LRCLIB lyrics.
            long gen = nextGeneration(viewModel);
            setTrackState(query.trackKey, LrclibModels.LyricsSource.LOADING_LRCLIB, -1L, false);
            fetchAutoLrclibAsync(ctx, viewModel, playbackItem, query, gen, true, songInfoPtr, error, false, false);
            return true;
        }

        recordOfficialState(query.trackKey, songInfoPtr);
        return false;
    }

    private static boolean loadCustomLyrics(
            Context ctx, Object viewModel, Object playbackItem, LrclibModels.TrackQuery query) {
        if (!query.hasCustomLyrics) return false;
        String lyrics = LrclibReflection.getCustomLyrics(playbackItem);
        if (lyrics == null || lyrics.trim().isEmpty()) return false;

        long gen = nextGeneration(viewModel);
        EXECUTOR.execute(() -> {
            if (!isCurrentGen(viewModel, gen)) return;
            String sysLang = LrclibReflection.getCurrentSystemLyricsLanguage(viewModel);
            long adamId = effectiveAdamId(query);
            String ttml = LrclibParser.buildCustomLyricsTtml(lyrics, query.durationSec, sysLang, null);
            String lyricsId = "custom:" + adamId;
            LyricsLineEditor.Sheet sheet = LyricsLineEditor.prepare(
                    ctx, query.trackKey, query.title, query.artist, "custom", lyrics, ttml, null, false, false);
            Object songInfoPtr = LrclibReflection.parseTtmlToSongInfoPtr(
                    sheet.displayed, adamId, query.queueId, lyricsId, sysLang);
            if (songInfoPtr == null && sheet.displayed != ttml) {
                songInfoPtr = LrclibReflection.parseTtmlToSongInfoPtr(ttml, adamId, query.queueId, lyricsId, sysLang);
                sheet = sheet.withDisplay(ttml);
            }
            LyricsLineEditor.remember(songInfoPtr, sheet);
            Object result = songInfoPtr;
            MAIN.post(() -> {
                if (!isCurrentGen(viewModel, gen)) return;
                setTrackState(query.trackKey, LrclibModels.LyricsSource.OFFICIAL_STATIC, -1L, false);
                LrclibReflection.emitLyricsToViewModel(viewModel, result, null);
            });
        });
        return true;
    }

    // -------------------------------------------------------------------------
    // Hook 4: PlayerLyricsViewFragment.w2 render gate & callback
    // -------------------------------------------------------------------------

    public static boolean shouldAllowRender(Object fragment, Object songInfoPtr, boolean hasCustomLyrics) {
        if (hasCustomLyrics) return true;
        LrclibModels.TrackQuery query = getCurrentTrackQuery(fragment);
        if (songInfoPtr == null) {
            // Allow w2(null) to reach Apple Music's native empty-lyrics branch (:cond_19),
            // which cancels R.id.message_show_lyrics_loading, hides the loading spinner,
            // clears stale lines, and shows no_lyrics_available_message.
            if (query != null) {
                TrackLyricsState state = trackStates.get(query.trackKey);
                if (state != null && (state.source == LrclibModels.LyricsSource.NONE
                        || state.source == LrclibModels.LyricsSource.LRCLIB_INSTRUMENTAL)) {
                    return true;
                }
            }
            return false;
        }
        String lyricsId = LrclibReflection.getSongInfoLyricsId(songInfoPtr);
        if (!isInjectedLyricsId(lyricsId)) return false;
        if (query == null) return true;
        // Verify this injected SongInfoPtr matches the fragment's current trackKey.
        long expectedAdam = effectiveAdamId(query);
        long actualAdam = LrclibReflection.getSongInfoAdamId(songInfoPtr);
        return actualAdam == expectedAdam;
    }

    private static boolean isInjectedLyricsId(String lyricsId) {
        return lyricsId != null
                && (lyricsId.startsWith(LRCLIB_LYRICS_ID_PREFIX) || lyricsId.startsWith(LOCAL_LYRICS_ID_PREFIX));
    }

    public static void onLyricsRendered(Object fragment, Object songInfoPtr) {
        if (fragment == null) return;
        LyricsLineEditor.bind(fragment, songInfoPtr);
        LyricsScrollSync.onLyricsRendered(fragment, songInfoPtr);
        Activity act = LrclibReflection.getActivity(fragment);
        if (act != null) captureContext(act);
        Object vm = LrclibReflection.getLyricsViewModelFromFragment(fragment);
        if (vm != null) activeLyricsViewModel = new WeakReference<>(vm);

        LrclibModels.TrackQuery query = getCurrentTrackQuery(fragment);
        if (query != null && songInfoPtr != null) {
            String lyricsId = LrclibReflection.getSongInfoLyricsId(songInfoPtr);
            if (!isInjectedLyricsId(lyricsId)) {
                recordOfficialState(query.trackKey, songInfoPtr);
            }
        }
        MAIN.post(() -> {
            refreshPillForFragment(fragment);
            refreshAllBadgesNow();
        });
    }

    public static boolean onEditTimedLyric(Object fragment, View anchor, Object nativeLine, Runnable share) {
        return LyricsLineEditor.onTimedLineHeld(fragment, anchor, nativeLine, share);
    }

    public static boolean onEditStaticLyric(Object fragment, View anchor, int displayedLyricLine) {
        return LyricsLineEditor.onStaticLineHeld(fragment, anchor, displayedLyricLine);
    }

    // -------------------------------------------------------------------------
    // Hook 5: PlayerLyricsViewFragment offline check (q2()Z)
    // -------------------------------------------------------------------------

    public static boolean hasOfflineCachedLyrics(Object fragment, boolean nativeResult) {
        if (nativeResult) return true;
        Context ctx = appContext;
        if (ctx == null || !LrclibPrefs.isEnabled(ctx)) return false;
        LrclibModels.TrackQuery query = getCurrentTrackQuery(fragment);
        if (query == null) return false;
        TrackLyricsState state = trackStates.get(query.trackKey);
        if (state != null && state.source.isLocal()) return true;
        return LrclibPrefs.hasOfflineLyricsForTrack(ctx, query.trackKey, buildAutoCacheKey(query, false))
                || LrclibPrefs.hasOfflineLyricsForTrack(ctx, query.trackKey, buildAutoCacheKey(query, true));
    }

    // -------------------------------------------------------------------------
    // Hook 6: Base player fragment onViewCreated (player_lyrics badge + pill)
    // -------------------------------------------------------------------------

    public static void onPlayerViewCreated(Object fragment, View rootView) {
        if (fragment == null || rootView == null) return;
        captureContext(rootView.getContext());

        rootView.post(() -> {
            try {
                attachLyricsButtonFeatures(fragment, rootView);
                if (fragment.getClass().getName().endsWith("PlayerLyricsViewFragment")) {
                    attachLyricsPill(fragment, rootView);
                }
            } catch (Throwable t) {
                Log.w(TAG, "Failed attaching LRCLIB player UI", t);
            }
        });
    }

    // -------------------------------------------------------------------------
    // Hook 7: PlayerLyricsViewFragment controls fade/visibility synchronization
    // -------------------------------------------------------------------------

    public static boolean shouldBlockControlsVisibilityChange(Object fragment, int visibility) {
        if (fragment == null || visibility == View.VISIBLE) return false;
        if (!fragment.getClass().getName().endsWith("PlayerLyricsViewFragment")) return false;
        Context ctx = appContext;
        if (ctx == null || !LrclibPrefs.isEnabled(ctx)) return false;
        LrclibModels.TrackQuery query = getCurrentTrackQuery(fragment);
        if (query == null) return false;
        TrackLyricsState state = trackStates.get(query.trackKey);
        if (state == null) {
            // If official lyrics are absent and LRCLIB has not finished loading yet, keep controls visible.
            return !query.hasOfficialLyrics && !query.hasCustomLyrics;
        }
        return state.source == LrclibModels.LyricsSource.NONE
                || state.source == LrclibModels.LyricsSource.LRCLIB_INSTRUMENTAL
                || state.source == LrclibModels.LyricsSource.LOADING_LRCLIB;
    }

    public static Animator wrapControlsAnimator(Object fragment, int visibility, Animator original) {
        PillBinding binding = pillBindings.get(fragment);
        if (binding == null) return original;
        TextView pill = binding.pillRef.get();
        if (pill == null || pill.getVisibility() == View.GONE) return original;

        float targetAlpha = (visibility == View.VISIBLE) ? 1.0f : 0.0f;
        ObjectAnimator pillAnim = ObjectAnimator.ofFloat(pill, View.ALPHA, targetAlpha);
        if (original == null) {
            return pillAnim;
        }
        AnimatorSet combined = new AnimatorSet();
        combined.playTogether(original, pillAnim);
        return combined;
    }

    public static void onControlsVisibilityChanged(Object fragment, int visibility, boolean skip) {
        if (skip) return;
        PillBinding binding = pillBindings.get(fragment);
        if (binding == null) return;
        TextView pill = binding.pillRef.get();
        if (pill == null) return;
        if (LrclibReflection.isHidden(fragment) || !LrclibReflection.isResumed(fragment)) return;

        Context ctx = pill.getContext();
        if (!LrclibPrefs.isEnabled(ctx) || !LrclibPrefs.isShowLyricsPill(ctx)) {
            pill.setVisibility(View.GONE);
            return;
        }
        if (visibility == View.VISIBLE) {
            if (pill.getVisibility() != View.GONE) {
                pill.setVisibility(View.VISIBLE);
                pill.setAlpha(1.0f);
            }
        } else {
            if (pill.getVisibility() == View.VISIBLE) {
                pill.setVisibility(visibility);
            }
        }
    }

    // -------------------------------------------------------------------------
    // Hook 8: Settings integration
    // -------------------------------------------------------------------------

    public static void attachSettings(Object fragment) {
        Activity act = LrclibReflection.getActivity(fragment);
        if (act != null) {
            captureContext(act);
            settingsOwner = new WeakReference<>(act);
        }
    }

    public static List<?> withSettings(List<?> items) {
        Activity act = settingsOwner.get();
        if (act == null || act.isFinishing()) return items;
        captureContext(act);
        try {
            final WeakReference<Activity> ref = settingsOwner;
            Object category = LrclibReflection.createSettingsCategory(
                    LrclibStrings.text(act, "settings_category"),
                    LrclibStrings.text(act, "settings_entry"),
                    () -> {
                        Activity current = ref.get();
                        if (current != null && !current.isFinishing()) {
                            LrclibUi.openSettings(current);
                        }
                    }
            );
            List<Object> result = new ArrayList<>(items);
            result.add(Math.min(1, result.size()), category);
            return result;
        } catch (Throwable t) {
            Log.w(TAG, "Could not add LRCLIB settings category", t);
            return items;
        }
    }

    // -------------------------------------------------------------------------
    // User actions triggered from LrclibUi
    // -------------------------------------------------------------------------

    static void reloadCurrentTrack(Context ctx, Object fragment, boolean forceNetworkRefresh) {
        Object vm = fragment != null ? LrclibReflection.getLyricsViewModelFromFragment(fragment) : null;
        if (vm == null) vm = activeLyricsViewModel.get();
        Object item = fragment != null ? LrclibReflection.getPlaybackItemFromFragment(fragment) : null;
        if (item == null && vm != null) item = vmPlaybackItems.get(vm);
        if (item == null) item = lastPlaybackItem;

        LrclibModels.TrackQuery query = LrclibReflection.extractTrackQuery(item);
        if (query != null && forceNetworkRefresh && ctx != null) {
            LrclibPrefs.deleteTrackCache(ctx, buildAutoCacheKey(query, false));
            LrclibPrefs.deleteTrackCache(ctx, buildAutoCacheKey(query, true));
            LocalLrcFolder.invalidateCache();
            trackStates.remove(query.trackKey);
        }
        if (vm != null && item != null) {
            LrclibReflection.callLoadLyrics(vm, item);
        }
        refreshAllUi();
    }

    static void clearResolvedStates() {
        trackStates.clear();
        refreshAllUi();
    }

    static void onLocalFolderChanged(Context ctx) {
        LocalLrcFolder.invalidateCache();
        trackStates.clear();
        if (ctx != null) {
            reloadCurrentTrack(ctx, null, false);
        } else {
            refreshAllUi();
        }
    }

    static boolean applyLocalLrcFile(
            Context ctx,
            Object fragment,
            LrclibModels.TrackQuery query,
            String fileName,
            String rawText,
            boolean forceUnsynced) {
        if (ctx == null || query == null || rawText == null || rawText.trim().isEmpty()) return false;
        if (!LocalLrcStore.saveTrackLrc(ctx, query.trackKey, rawText)) {
            return false;
        }
        LrclibModels.TrackOverride existing = LrclibPrefs.getOverride(ctx, query.trackKey);
        int offset = existing != null ? existing.offsetMs : 0;
        String safeName = (fileName == null || fileName.trim().isEmpty()) ? "lyrics.lrc" : fileName.trim();
        LrclibModels.TrackOverride updated = new LrclibModels.TrackOverride(
                query.trackKey,
                query.title,
                query.artist,
                LrclibModels.OverrideMode.FORCE_LOCAL_LRC,
                -1L,
                offset,
                System.currentTimeMillis(),
                safeName,
                forceUnsynced
        );
        LrclibPrefs.saveOverride(ctx, updated);
        trackStates.remove(query.trackKey);
        reloadCurrentTrack(ctx, fragment, false);
        return true;
    }

    static void applyPinnedRecord(
            Context ctx,
            Object fragment,
            LrclibModels.TrackQuery query,
            LrclibModels.LyricsRecord record) {
        if (ctx == null || query == null || record == null) return;
        LrclibPrefs.writeRecordByIdCache(ctx, record, true);
        LrclibModels.TrackOverride existing = LrclibPrefs.getOverride(ctx, query.trackKey);
        int offset = existing != null ? existing.offsetMs : 0;
        LrclibModels.TrackOverride updated = new LrclibModels.TrackOverride(
                query.trackKey,
                query.title,
                query.artist,
                LrclibModels.OverrideMode.FORCE_LRCLIB_ID,
                record.id,
                offset,
                System.currentTimeMillis()
        );
        LrclibPrefs.saveOverride(ctx, updated);
        trackStates.remove(query.trackKey);
        reloadCurrentTrack(ctx, fragment, false);
    }

    static void updateOverrideMode(
            Context ctx,
            Object fragment,
            LrclibModels.TrackQuery query,
            LrclibModels.OverrideMode mode) {
        if (ctx == null || query == null) return;
        LrclibModels.TrackOverride existing = LrclibPrefs.getOverride(ctx, query.trackKey);
        int offset = existing != null ? existing.offsetMs : 0;
        long pinnedId = (mode == LrclibModels.OverrideMode.FORCE_LRCLIB_ID && existing != null) ? existing.lrclibId : -1L;
        LrclibModels.TrackOverride updated = new LrclibModels.TrackOverride(
                query.trackKey,
                query.title,
                query.artist,
                mode,
                pinnedId,
                offset,
                System.currentTimeMillis()
        );
        LrclibPrefs.saveOverride(ctx, updated);
        trackStates.remove(query.trackKey);
        reloadCurrentTrack(ctx, fragment, false);
    }

    static void updateSongOffset(
            Context ctx,
            Object fragment,
            LrclibModels.TrackQuery query,
            int newOffsetMs) {
        if (ctx == null || query == null) return;
        int clamped = LrclibPrefs.clampOffset(newOffsetMs);
        LrclibModels.TrackOverride existing = LrclibPrefs.getOverride(ctx, query.trackKey);
        LrclibModels.OverrideMode mode = existing != null ? existing.mode : LrclibModels.OverrideMode.AUTO;
        long pinnedId = existing != null ? existing.lrclibId : -1L;
        String localFile = existing != null ? existing.localFileName : "";
        boolean localUnsynced = existing != null && existing.localForceUnsynced;
        LrclibModels.TrackOverride updated = new LrclibModels.TrackOverride(
                query.trackKey,
                query.title,
                query.artist,
                mode,
                pinnedId,
                clamped,
                System.currentTimeMillis(),
                localFile,
                localUnsynced
        );
        LrclibPrefs.saveOverride(ctx, updated);
        reloadCurrentTrack(ctx, fragment, false);
    }

    static void refreshAllUi() {
        MAIN.post(() -> {
            refreshAllBadgesNow();
            for (Object frag : new ArrayList<>(pillBindings.keySet())) {
                refreshPillForFragment(frag);
            }
        });
    }

    // -------------------------------------------------------------------------
    // Async Local LRC loading & TTML injection
    // -------------------------------------------------------------------------

    private static void loadPerSongLocalLrcAsync(
            final Context ctx,
            final Object viewModel,
            final Object playbackItem,
            final LrclibModels.TrackQuery query,
            final LrclibModels.TrackOverride override,
            final long gen) {
        EXECUTOR.execute(() -> {
            if (!isCurrentGen(viewModel, gen)) return;
            String rawText = LocalLrcStore.readTrackLrc(ctx, query.trackKey);
            String label = (override != null && !override.localFileName.isEmpty())
                    ? override.localFileName : "lyrics.lrc";
            boolean forceUnsynced = override != null && override.localForceUnsynced;
            if (rawText != null && deliverLocalLrc(
                    ctx, viewModel, query, gen, rawText, label, false, forceUnsynced)) {
                return;
            }
            MAIN.post(() -> {
                if (!isCurrentGen(viewModel, gen)) return;
                setTrackState(query.trackKey, LrclibModels.LyricsSource.NONE, -1L, false);
                LrclibReflection.emitLyricsToViewModel(viewModel, null, null);
            });
        });
    }

    private static void fetchLocalFolderThenAutoAsync(
            final Context ctx,
            final Object viewModel,
            final Object playbackItem,
            final LrclibModels.TrackQuery query,
            final long gen,
            final LrclibModels.FallbackMode globalMode) {
        EXECUTOR.execute(() -> {
            if (!isCurrentGen(viewModel, gen)) return;
            LocalLrcFolder.FolderMatch match = LocalLrcFolder.findBestMatch(ctx, query, false);
            if (!isCurrentGen(viewModel, gen)) return;
            if (match != null && deliverLocalLrc(
                    ctx, viewModel, query, gen, match.rawText, match.displayName, true, false)) {
                return;
            }

            // No match in local LRC folder -> continue with standard official / LRCLIB flow.
            if (!query.hasOfficialLyrics && !query.hasCustomLyrics) {
                fetchAutoLrclibSyncOnExecutor(
                        ctx, viewModel, playbackItem, query, gen, false, null, null, false, false);
                return;
            }
            if (globalMode == LrclibModels.FallbackMode.PREFER_LRCLIB) {
                fetchAutoLrclibSyncOnExecutor(
                        ctx, viewModel, playbackItem, query, gen, false, null, null, true, false);
                return;
            }
            MAIN.post(() -> {
                if (!isCurrentGen(viewModel, gen)) return;
                if (!query.hasOfficialLyrics && query.hasCustomLyrics
                        && loadCustomLyrics(ctx, viewModel, playbackItem, query)) {
                    return;
                }
                vmBypassLocalFolderTrack.put(viewModel, query.trackKey);
                LrclibReflection.callLoadLyrics(viewModel, playbackItem);
            });
        });
    }

    private static void fetchLocalFolderOnNativeFallbackAsync(
            final Context ctx,
            final Object viewModel,
            final Object playbackItem,
            final LrclibModels.TrackQuery query,
            final long gen,
            final boolean requireSynced,
            final Object fallbackOfficialPtr,
            final Throwable fallbackError,
            final boolean continueToLrclibOnMiss) {
        EXECUTOR.execute(() -> {
            if (!isCurrentGen(viewModel, gen)) return;
            LocalLrcFolder.FolderMatch match = LocalLrcFolder.findBestMatch(ctx, query, requireSynced);
            if (!isCurrentGen(viewModel, gen)) return;
            if (match != null && deliverLocalLrc(
                    ctx, viewModel, query, gen, match.rawText, match.displayName, true, false)) {
                return;
            }
            if (continueToLrclibOnMiss) {
                fetchAutoLrclibSyncOnExecutor(
                        ctx, viewModel, playbackItem, query, gen, requireSynced,
                        fallbackOfficialPtr, fallbackError, false, false);
                return;
            }
            if (fallbackOfficialPtr != null) {
                MAIN.post(() -> {
                    if (!isCurrentGen(viewModel, gen)) return;
                    recordOfficialState(query.trackKey, fallbackOfficialPtr);
                    LrclibReflection.emitLyricsToViewModel(viewModel, fallbackOfficialPtr, null);
                });
                return;
            }
            MAIN.post(() -> {
                if (!isCurrentGen(viewModel, gen)) return;
                setTrackState(query.trackKey, LrclibModels.LyricsSource.NONE, -1L, false);
                LrclibReflection.emitLyricsToViewModel(viewModel, null, fallbackError);
            });
        });
    }

    private static boolean deliverLocalLrc(
            final Context ctx,
            final Object viewModel,
            final LrclibModels.TrackQuery query,
            final long gen,
            final String rawText,
            final String displayName,
            final boolean fromFolder,
            final boolean forceUnsynced) {
        boolean allowWord = LrclibPrefs.isWordSyncEnabled(ctx);
        int offsetMs = computeEffectiveOffsetMs(ctx, query.trackKey);
        String sysLang = LrclibReflection.getCurrentSystemLyricsLanguage(viewModel);

        LrclibParser.PreparedRecord prepared = LocalLrcParser.prepareLocalLrc(
                rawText, query.durationSec, allowWord, forceUnsynced);
        if (prepared.parsed == null || !prepared.sourceType.isLocal()) {
            return false;
        }

        long adamId = effectiveAdamId(query);
        String safeName = (displayName == null || displayName.isEmpty()) ? "lyrics.lrc" : displayName;
        String lyricsId = LOCAL_LYRICS_ID_PREFIX + (fromFolder ? "folder:" : "song:") + safeName;
        String documentKey = LyricsEdits.documentKey(
                query.trackKey, lyricsId + ":" + prepared.sourceType, rawText);
        Map<Integer, LyricsEditTtml.Edit> edits = LyricsEdits.load(ctx, documentKey);
        boolean generateInParser = LrclibPrefs.isRomanizationEnabled(ctx) && !LyricsLineEditor.hasTextEdits(edits);

        LrclibParser.TtmlResult built = LrclibParser.renderPrepared(
                prepared, offsetMs, sysLang, generateInParser ? LrclibRomanizer::create : null);
        if (built.ttml == null) return false;

        LyricsLineEditor.Sheet sheet = LyricsLineEditor.prepare(
                ctx, query.trackKey, query.title, query.artist, documentKey, edits,
                built.baseTtml, generateInParser ? built.ttml : null,
                built.sourceType == LrclibModels.LyricsSource.LOCAL_WORD, false);
        Object parsed = LrclibReflection.parseTtmlToSongInfoPtr(
                sheet.displayed, adamId, query.queueId, lyricsId, sysLang);
        if (parsed == null && !sheet.displayed.equals(built.baseTtml)) {
            parsed = LrclibReflection.parseTtmlToSongInfoPtr(
                    built.baseTtml, adamId, query.queueId, lyricsId, sysLang);
            sheet = sheet.withDisplay(built.baseTtml);
        }
        if (parsed == null) {
            Log.w(TAG, "Native TTMLParser rejected generated TTML for local LRC: " + safeName);
            return false;
        }
        final Object songInfoPtr = parsed;
        LyricsLineEditor.remember(songInfoPtr, sheet);
        final LrclibModels.LyricsSource finalSource = built.sourceType;
        MAIN.post(() -> {
            if (!isCurrentGen(viewModel, gen)) return;
            setTrackState(query.trackKey, finalSource, -1L, false, safeName, fromFolder);
            LrclibReflection.emitLyricsToViewModel(viewModel, songInfoPtr, null);
        });
        return true;
    }

    // -------------------------------------------------------------------------
    // Async LRCLIB fetching & TTML injection
    // -------------------------------------------------------------------------

    private static void fetchPinnedLrclibAsync(
            final Context ctx,
            final Object viewModel,
            final Object playbackItem,
            final LrclibModels.TrackQuery query,
            final long lrclibId,
            final long gen,
            final boolean forceRefresh) {
        EXECUTOR.execute(() -> {
            if (!isCurrentGen(viewModel, gen)) return;
            LrclibModels.LyricsRecord record = forceRefresh ? null : LrclibPrefs.readRecordById(ctx, lrclibId);
            boolean rateLimited = false;
            if (record == null) {
                try {
                    record = LrclibApiClient.getById(lrclibId);
                    if (record != null) {
                        LrclibPrefs.writeRecordByIdCache(ctx, record, true);
                    }
                } catch (LrclibApiClient.RateLimitException e) {
                    rateLimited = true;
                    Log.w(TAG, "LRCLIB rate limited for id=" + lrclibId);
                } catch (IOException e) {
                    Log.w(TAG, "LRCLIB fetch by id failed: " + lrclibId, e);
                }
            }
            if (!isCurrentGen(viewModel, gen)) return;
            deliverLrclibRecord(ctx, viewModel, playbackItem, query, gen, record, null, null, false, rateLimited);
        });
    }

    private static void fetchAutoLrclibAsync(
            final Context ctx,
            final Object viewModel,
            final Object playbackItem,
            final LrclibModels.TrackQuery query,
            final long gen,
            final boolean requireSynced,
            final Object fallbackOfficialPtr,
            final Throwable fallbackError,
            final boolean fallbackToOfficialLoadOnMiss,
            final boolean forceRefresh) {
        EXECUTOR.execute(() -> fetchAutoLrclibSyncOnExecutor(
                ctx, viewModel, playbackItem, query, gen, requireSynced,
                fallbackOfficialPtr, fallbackError, fallbackToOfficialLoadOnMiss, forceRefresh));
    }

    private static void fetchAutoLrclibSyncOnExecutor(
            final Context ctx,
            final Object viewModel,
            final Object playbackItem,
            final LrclibModels.TrackQuery query,
            final long gen,
            final boolean requireSynced,
            final Object fallbackOfficialPtr,
            final Throwable fallbackError,
            final boolean fallbackToOfficialLoadOnMiss,
            final boolean forceRefresh) {
        if (!isCurrentGen(viewModel, gen)) return;
        String cacheKey = buildAutoCacheKey(query, requireSynced);
        LrclibModels.LyricsRecord record = null;
        boolean fromCache = false;
        boolean rateLimited = false;

        if (!forceRefresh) {
            LrclibPrefs.CacheLookup cached = LrclibPrefs.readTrackCache(ctx, cacheKey);
            if (cached.found) {
                fromCache = true;
                record = cached.hit ? cached.record : null;
            }
        }

        if (!fromCache) {
            try {
                record = LrclibApiClient.resolveAutoMatch(
                        query,
                        requireSynced,
                        LrclibPrefs.isWordSyncEnabled(ctx),
                        LrclibPrefs.isAllowPlainEnabled(ctx),
                        LrclibPrefs.isSearchFallbackEnabled(ctx)
                );
                LrclibPrefs.writeTrackCache(ctx, cacheKey, record);
            } catch (LrclibApiClient.RateLimitException e) {
                rateLimited = true;
                Log.w(TAG, "LRCLIB rate limited for " + query.title);
            } catch (IOException e) {
                Log.w(TAG, "LRCLIB auto-match network error for " + query.title, e);
            }
        }

        if (!isCurrentGen(viewModel, gen)) return;
        deliverLrclibRecord(
                ctx, viewModel, playbackItem, query, gen, record,
                fallbackOfficialPtr, fallbackError, fallbackToOfficialLoadOnMiss, rateLimited
        );
    }

    private static void deliverLrclibRecord(
            final Context ctx,
            final Object viewModel,
            final Object playbackItem,
            final LrclibModels.TrackQuery query,
            final long gen,
            final LrclibModels.LyricsRecord record,
            final Object fallbackOfficialPtr,
            final Throwable fallbackError,
            final boolean fallbackToOfficialLoadOnMiss,
            final boolean rateLimited) {
        boolean allowWord = LrclibPrefs.isWordSyncEnabled(ctx);
        boolean allowPlain = LrclibPrefs.isAllowPlainEnabled(ctx);
        int offsetMs = computeEffectiveOffsetMs(ctx, query.trackKey);
        String sysLang = LrclibReflection.getCurrentSystemLyricsLanguage(viewModel);

        LrclibParser.PreparedRecord prepared = LrclibParser.prepareRecord(
                record, query.durationSec, allowWord, allowPlain);

        // If we required synced lyrics to upgrade official static lyrics, ignore non-synced LRCLIB results.
        boolean rejectedPlainUpgrade = fallbackOfficialPtr != null
                && prepared.sourceType != LrclibModels.LyricsSource.LRCLIB_WORD
                && prepared.sourceType != LrclibModels.LyricsSource.LRCLIB_LINE;

        if (!rejectedPlainUpgrade
                && prepared.sourceType == LrclibModels.LyricsSource.LRCLIB_INSTRUMENTAL
                && record != null) {
            MAIN.post(() -> {
                if (!isCurrentGen(viewModel, gen)) return;
                setTrackState(query.trackKey, LrclibModels.LyricsSource.LRCLIB_INSTRUMENTAL, record.id, false);
                LrclibReflection.emitLyricsToViewModel(viewModel, null, null);
            });
            return;
        }

        if (!rejectedPlainUpgrade && prepared.parsed != null && record != null) {
            long adamId = effectiveAdamId(query);
            String lyricsId = LRCLIB_LYRICS_ID_PREFIX + record.id;
            String sourceLyrics = record.lyricsfile + "\u0000" + record.syncedLyrics + "\u0000" + record.plainLyrics;
            String documentKey = LyricsEdits.documentKey(query.trackKey, lyricsId + ":" + prepared.sourceType, sourceLyrics);
            Map<Integer, LyricsEditTtml.Edit> edits = LyricsEdits.load(ctx, documentKey);
            boolean generateInParser = LrclibPrefs.isRomanizationEnabled(ctx) && !LyricsLineEditor.hasTextEdits(edits);
            LrclibParser.TtmlResult built = LrclibParser.renderPrepared(
                    prepared, offsetMs, sysLang, generateInParser ? LrclibRomanizer::create : null);
            if (built.ttml != null) {
                LyricsLineEditor.Sheet sheet = LyricsLineEditor.prepare(
                        ctx, query.trackKey, query.title, query.artist, documentKey, edits,
                        built.baseTtml, generateInParser ? built.ttml : null,
                        built.sourceType == LrclibModels.LyricsSource.LRCLIB_WORD, false);
                Object parsed = LrclibReflection.parseTtmlToSongInfoPtr(
                        sheet.displayed, adamId, query.queueId, lyricsId, sysLang);
                if (parsed == null && !sheet.displayed.equals(built.baseTtml)) {
                    parsed = LrclibReflection.parseTtmlToSongInfoPtr(
                            built.baseTtml, adamId, query.queueId, lyricsId, sysLang);
                    sheet = sheet.withDisplay(built.baseTtml);
                }
                final Object songInfoPtr = parsed;
                if (songInfoPtr != null) {
                    LyricsLineEditor.remember(songInfoPtr, sheet);
                    final LrclibModels.LyricsSource finalSource = built.sourceType;
                    MAIN.post(() -> {
                        if (!isCurrentGen(viewModel, gen)) return;
                        setTrackState(query.trackKey, finalSource, record.id, false);
                        LrclibReflection.emitLyricsToViewModel(viewModel, songInfoPtr, null);
                    });
                    return;
                }
                Log.w(TAG, "Native TTMLParser rejected generated TTML for LRCLIB #" + record.id);
            }
        }

        // LRCLIB miss or parse failure -> handle graceful fallback.
        if (fallbackOfficialPtr != null) {
            MAIN.post(() -> {
                if (!isCurrentGen(viewModel, gen)) return;
                recordOfficialState(query.trackKey, fallbackOfficialPtr);
                LrclibReflection.emitLyricsToViewModel(viewModel, fallbackOfficialPtr, null);
            });
            return;
        }

        if (fallbackToOfficialLoadOnMiss && (query.hasOfficialLyrics || query.hasCustomLyrics)) {
            MAIN.post(() -> {
                if (!isCurrentGen(viewModel, gen)) return;
                vmBypassOfficialTrack.put(viewModel, query.trackKey);
                LrclibReflection.callLoadLyrics(viewModel, playbackItem);
            });
            return;
        }

        MAIN.post(() -> {
            if (!isCurrentGen(viewModel, gen)) return;
            setTrackState(query.trackKey, LrclibModels.LyricsSource.NONE, -1L, rateLimited);
            LrclibReflection.emitLyricsToViewModel(viewModel, null, fallbackError);
        });
    }

    private static void recordOfficialState(String trackKey, Object songInfoPtr) {
        if (songInfoPtr == null) {
            setTrackState(trackKey, LrclibModels.LyricsSource.NONE, -1L, false);
            return;
        }
        long timing = LrclibReflection.getSongInfoTiming(songInfoPtr);
        LrclibModels.LyricsSource src;
        if (timing == 2L) src = LrclibModels.LyricsSource.OFFICIAL_WORD;
        else if (timing == 1L) src = LrclibModels.LyricsSource.OFFICIAL_LINE;
        else src = LrclibModels.LyricsSource.OFFICIAL_STATIC;
        setTrackState(trackKey, src, -1L, false);
    }

    private static void markLoadingIfUnresolved(String trackKey, long lrclibId) {
        TrackLyricsState existing = trackStates.get(trackKey);
        if (existing == null || !existing.source.hasUsableExternalLyrics()) {
            setTrackState(trackKey, LrclibModels.LyricsSource.LOADING_LRCLIB, lrclibId, false);
        }
    }

    private static void setTrackState(String trackKey, LrclibModels.LyricsSource source, long lrclibId, boolean rateLimited) {
        setTrackState(trackKey, source, lrclibId, rateLimited, "", false);
    }

    private static void setTrackState(
            String trackKey,
            LrclibModels.LyricsSource source,
            long lrclibId,
            boolean rateLimited,
            String localLabel,
            boolean localFromFolder) {
        if (trackKey == null || trackKey.isEmpty()) return;
        trackStates.put(trackKey, new TrackLyricsState(trackKey, source, lrclibId, rateLimited, localLabel, localFromFolder));
        refreshAllUi();
    }

    private static long effectiveAdamId(LrclibModels.TrackQuery query) {
        if (query.adamId > 0L) return query.adamId;
        long hash = (query.trackKey.hashCode() & 0x7FFFFFFFL);
        return hash == 0L ? 1L : hash;
    }

    static int computeEffectiveOffsetMs(Context ctx, String trackKey) {
        int def = LrclibPrefs.getDefaultOffsetMs(ctx);
        LrclibModels.TrackOverride ov = LrclibPrefs.getOverride(ctx, trackKey);
        int song = ov != null ? ov.offsetMs : 0;
        return LrclibPrefs.clampOffset(def + song);
    }

    private static String buildAutoCacheKey(LrclibModels.TrackQuery query, boolean requireSynced) {
        return (requireSynced ? "sync|" : "any|")
                + query.trackKey + "|"
                + LrclibMatcher.normalize(query.title) + "|"
                + LrclibMatcher.normalize(query.artist) + "|"
                + query.durationSec;
    }

    private static long nextGeneration(Object viewModel) {
        AtomicLong counter = vmGenerations.get(viewModel);
        if (counter == null) {
            synchronized (vmGenerations) {
                counter = vmGenerations.get(viewModel);
                if (counter == null) {
                    counter = new AtomicLong(0L);
                    vmGenerations.put(viewModel, counter);
                }
            }
        }
        return counter.incrementAndGet();
    }

    private static boolean isCurrentGen(Object viewModel, long gen) {
        AtomicLong counter = vmGenerations.get(viewModel);
        return counter == null || counter.get() == gen;
    }

    // -------------------------------------------------------------------------
    // UI attachment: LRC corner badge on player_lyrics + frosted pill in lyrics view
    // -------------------------------------------------------------------------

    private static void attachLyricsButtonFeatures(final Object fragment, final View rootView) {
        Context ctx = rootView.getContext();
        int btnId = LrclibStrings.id(ctx, "id", "player_lyrics");
        if (btnId == 0) return;
        final View lyricsButton = rootView.findViewById(btnId);
        if (lyricsButton == null) return;

        // Long-press on player_lyrics opens the Lyrics Source & LRCLIB Override sheet from any player page.
        lyricsButton.setLongClickable(true);
        lyricsButton.setOnLongClickListener(v -> {
            v.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
            Activity act = LrclibReflection.getActivity(fragment);
            if (act != null && !act.isFinishing()) {
                LrclibUi.openSourceSheet(act, fragment);
                return true;
            }
            return false;
        });

        ViewParent parent = lyricsButton.getParent();
        if (!(parent instanceof ViewGroup)) return;
        final ViewGroup container = (ViewGroup) parent;

        TextView badge = container.findViewWithTag(TAG_BADGE_VIEW);
        if (badge == null) {
            badge = createButtonBadgeView(ctx);
            container.addView(badge, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));
            final TextView finalBadge = badge;
            View.OnLayoutChangeListener positioner = (v, l, t, r, b, ol, ot, or2, ob) ->
                    positionButtonBadge(lyricsButton, finalBadge);
            lyricsButton.addOnLayoutChangeListener(positioner);
            badge.addOnLayoutChangeListener(positioner);
        }

        badgeBindings.put(lyricsButton, new BadgeBinding(fragment, lyricsButton, badge));
        positionButtonBadge(lyricsButton, badge);
        refreshBadge(badgeBindings.get(lyricsButton));
    }

    private static TextView createButtonBadgeView(Context ctx) {
        TextView tv = new TextView(ctx);
        tv.setTag(TAG_BADGE_VIEW);
        tv.setText(LrclibStrings.text(ctx, "badge_short"));
        tv.setTextSize(8.5f);
        tv.setTextColor(Color.WHITE);
        tv.setTypeface(loadSemiboldFont(ctx));
        tv.setIncludeFontPadding(false);
        tv.setSingleLine(true);
        tv.setGravity(Gravity.CENTER);
        tv.setClickable(false);
        tv.setFocusable(false);
        tv.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        int padH = dp(ctx, 4);
        int padV = dp(ctx, 1.5f);
        tv.setPadding(padH, padV, padH, padV);

        GradientDrawable bg = makeButtonBadgeBackground(ctx, BADGE_BG_LOADING, BADGE_STROKE_LOADING);
        tv.setBackground(bg);
        tv.setElevation(dp(ctx, 2));
        tv.setVisibility(View.GONE);
        return tv;
    }

    private static GradientDrawable makeButtonBadgeBackground(Context ctx, int bgColor, int strokeColor) {
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(bgColor);
        bg.setCornerRadius(dp(ctx, 6));
        bg.setStroke(Math.max(1, dp(ctx, 0.75f)), strokeColor);
        return bg;
    }

    private static void positionButtonBadge(View button, TextView badge) {
        if (button == null || badge == null || button.getWidth() == 0 || badge.getWidth() == 0) return;
        Context ctx = button.getContext();
        float x = button.getRight() - badge.getWidth() - dp(ctx, 4);
        float y = button.getTop() + dp(ctx, 6);
        badge.setX(x);
        badge.setY(y);
    }

    private static void attachLyricsPill(final Object fragment, final View rootView) {
        if (!(rootView instanceof ViewGroup)) return;
        final ViewGroup container = (ViewGroup) rootView;
        Context ctx = container.getContext();
        int controlsId = LrclibStrings.id(ctx, "id", "controls");
        final View controls = controlsId != 0 ? container.findViewById(controlsId) : null;

        TextView pill = container.findViewWithTag(TAG_PILL_VIEW);
        if (pill == null) {
            pill = createLyricsPillView(ctx);
            container.addView(pill, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));
        }

        final PillBinding binding = new PillBinding(fragment, rootView, pill, controls);
        int noLyricsId = LrclibStrings.id(ctx, "id", "no_lyrics_available_message");
        if (noLyricsId != 0) {
            View msg = rootView.findViewById(noLyricsId);
            if (msg instanceof TextView) {
                binding.originalNoLyricsText = ((TextView) msg).getText();
            }
        }
        pillBindings.put(fragment, binding);

        pill.setOnClickListener(v -> {
            Activity act = LrclibReflection.getActivity(fragment);
            if (act != null && !act.isFinishing()) {
                LrclibUi.openSourceSheet(act, fragment);
            }
        });

        final TextView finalPill = pill;
        View.OnLayoutChangeListener layoutListener = (v, l, t, r, b, ol, ot, or2, ob) ->
                positionLyricsPill(container, controls, finalPill, binding);
        container.addOnLayoutChangeListener(layoutListener);
        if (controls != null) controls.addOnLayoutChangeListener(layoutListener);
        pill.addOnLayoutChangeListener(layoutListener);

        positionLyricsPill(container, controls, pill, binding);
        refreshPillForFragment(fragment);
    }

    private static TextView createLyricsPillView(Context ctx) {
        TextView tv = new TextView(ctx);
        tv.setTag(TAG_PILL_VIEW);
        tv.setTextSize(12f);
        tv.setTextColor(Color.WHITE);
        tv.setTypeface(loadSemiboldFont(ctx));
        tv.setIncludeFontPadding(false);
        tv.setSingleLine(true);
        tv.setEllipsize(TextUtils.TruncateAt.END);
        tv.setGravity(Gravity.CENTER);
        tv.setClickable(true);
        tv.setFocusable(true);
        int padH = dp(ctx, 12);
        int padV = dp(ctx, 6);
        tv.setPadding(padH, padV, padH, padV);
        tv.setBackground(makePillBackground(ctx, PILL_BG_OFFICIAL, PILL_STROKE_OFFICIAL));
        tv.setVisibility(View.GONE);
        return tv;
    }

    private static GradientDrawable makePillBackground(Context ctx, int fillColor, int strokeColor) {
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(fillColor);
        bg.setStroke(Math.max(1, dp(ctx, 0.75f)), strokeColor);
        bg.setCornerRadius(dp(ctx, 16));
        return bg;
    }

    private static void positionLyricsPill(ViewGroup container, View controls, TextView pill, PillBinding binding) {
        if (container == null || pill == null || container.getWidth() == 0 || pill.getWidth() == 0) return;
        Context ctx = container.getContext();
        int controlsTop = binding.lastControlsTop;
        if (controls != null && controls.getTop() > 0 && controls.getHeight() > 0) {
            controlsTop = controls.getTop();
            binding.lastControlsTop = controlsTop;
        }
        if (controlsTop <= 0) {
            controlsTop = Math.round(container.getHeight() * 0.70f);
        }
        int marginBottom = dp(ctx, 10);
        int dimenId = LrclibStrings.id(ctx, "dimen", "lyrics_vocal_attenuation_margin_bottom");
        if (dimenId != 0) {
            try {
                marginBottom = Math.max(dp(ctx, 8), ctx.getResources().getDimensionPixelSize(dimenId));
            } catch (RuntimeException ignored) {
            }
        }
        float x = (container.getWidth() - pill.getWidth()) / 2f;
        float y = controlsTop - pill.getHeight() - marginBottom;
        pill.setX(Math.max(dp(ctx, 12), x));
        pill.setY(Math.max(dp(ctx, 64), y));
    }

    private static void scheduleBadgeRefresh() {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            if (!badgeRefreshScheduled) {
                badgeRefreshScheduled = true;
                MAIN.post(BADGE_REFRESH_TASK);
            }
        } else {
            MAIN.post(() -> {
                if (!badgeRefreshScheduled) {
                    badgeRefreshScheduled = true;
                    MAIN.post(BADGE_REFRESH_TASK);
                }
            });
        }
    }

    private static void refreshAllBadgesNow() {
        Iterator<Map.Entry<View, BadgeBinding>> it = badgeBindings.entrySet().iterator();
        while (it.hasNext()) {
            BadgeBinding binding = it.next().getValue();
            if (binding == null || binding.buttonRef.get() == null || binding.badgeRef.get() == null) {
                it.remove();
                continue;
            }
            refreshBadge(binding);
        }
    }

    private static void refreshBadge(BadgeBinding binding) {
        if (binding == null) return;
        View button = binding.buttonRef.get();
        TextView badge = binding.badgeRef.get();
        Object fragment = binding.fragmentRef.get();
        if (button == null || badge == null) return;

        Context ctx = button.getContext();
        if (!LrclibPrefs.isEnabled(ctx) || button.getVisibility() != View.VISIBLE) {
            badge.setVisibility(View.GONE);
            return;
        }

        LrclibModels.TrackQuery query = getCurrentTrackQuery(fragment);
        if (query == null) {
            badge.setVisibility(View.GONE);
            return;
        }

        // Automatically start background LRCLIB fetch for eligible tracks even before opening lyrics.
        maybeSchedulePrefetch(ctx, query);

        if (!LrclibPrefs.isShowButtonBadge(ctx)) {
            badge.setVisibility(View.GONE);
            return;
        }

        TrackLyricsState state = trackStates.get(query.trackKey);
        if (state != null && state.source.isLocal()) {
            badge.setText(LrclibStrings.text(ctx, "badge_short"));
            badge.setBackground(makeButtonBadgeBackground(ctx, BADGE_BG_LOCAL, BADGE_STROKE_LOCAL));
            badge.setVisibility(View.VISIBLE);
            badge.setAlpha(Math.max(0.65f, button.getAlpha()));
            positionButtonBadge(button, badge);
            return;
        }
        if (state != null && state.source.hasUsableLrclibLyrics()) {
            badge.setText(LrclibStrings.text(ctx, "badge_short"));
            badge.setBackground(makeButtonBadgeBackground(ctx, BADGE_BG_GREEN, BADGE_STROKE_GREEN));
            badge.setVisibility(View.VISIBLE);
            badge.setAlpha(Math.max(0.65f, button.getAlpha()));
            positionButtonBadge(button, badge);
            return;
        }

        boolean loading = (state != null && state.source == LrclibModels.LyricsSource.LOADING_LRCLIB)
                || inFlightPrefetches.contains(query.trackKey)
                || (query.trackKey.equals(pendingPrefetchKey) && pendingPrefetchRunnable != null);
        if (loading) {
            badge.setText(LrclibStrings.text(ctx, "badge_short"));
            badge.setBackground(makeButtonBadgeBackground(ctx, BADGE_BG_LOADING, BADGE_STROKE_LOADING));
            badge.setVisibility(View.VISIBLE);
            badge.setAlpha(Math.max(0.45f, button.getAlpha() * 0.85f));
            positionButtonBadge(button, badge);
            return;
        }

        badge.setVisibility(View.GONE);
    }

    private static PrefetchPlan computePrefetchPlan(Context ctx, LrclibModels.TrackQuery query) {
        if (ctx == null || query == null || !LrclibPrefs.isEnabled(ctx)) return null;
        if (query.title.isEmpty()) return null;

        LrclibModels.TrackOverride ov = LrclibPrefs.getOverride(ctx, query.trackKey);
        LrclibModels.OverrideMode ovMode = ov != null ? ov.mode : LrclibModels.OverrideMode.AUTO;
        if (ovMode == LrclibModels.OverrideMode.FORCE_LOCAL_LRC) {
            return new PrefetchPlan(true, false, false, false, -1L, false, false);
        }
        if (ovMode == LrclibModels.OverrideMode.FORCE_OFFICIAL) return null;
        if (ovMode == LrclibModels.OverrideMode.FORCE_LRCLIB_ID && ov != null && ov.lrclibId > 0L) {
            return new PrefetchPlan(false, false, false, true, ov.lrclibId, false, false);
        }
        if (ovMode == LrclibModels.OverrideMode.FORCE_LRCLIB_AUTO) {
            return new PrefetchPlan(false, false, false, true, -1L, false, false);
        }

        boolean hasOfficial = query.hasOfficialLyrics || query.hasCustomLyrics;
        boolean hasLocalFolder = LrclibPrefs.hasLocalFolder(ctx);
        LrclibModels.LocalLrcPriority localPriority = LrclibPrefs.getLocalLrcPriority(ctx);
        LrclibModels.FallbackMode mode = LrclibPrefs.getFallbackMode(ctx);

        boolean checkFolder = false;
        boolean requireSyncedLocal = false;
        if (hasLocalFolder) {
            if (localPriority == LrclibModels.LocalLrcPriority.PREFER_LOCAL || !hasOfficial) {
                checkFolder = true;
            } else if (localPriority == LrclibModels.LocalLrcPriority.MISSING_AND_UNSYNCED
                    && query.hasOfficialLyrics && !query.hasCustomLyrics && !query.hasTimeSyncedLyrics) {
                checkFolder = true;
                requireSyncedLocal = true;
            }
        }

        boolean checkLrclib = false;
        boolean requireSyncedLrclib = false;
        boolean fallbackToOfficial = hasOfficial;
        if (!hasOfficial) {
            checkLrclib = true;
            fallbackToOfficial = false;
        } else if (mode == LrclibModels.FallbackMode.PREFER_LRCLIB) {
            checkLrclib = true;
        } else if (mode == LrclibModels.FallbackMode.MISSING_AND_UNSYNCED
                && query.hasOfficialLyrics && !query.hasCustomLyrics && !query.hasTimeSyncedLyrics) {
            checkLrclib = true;
            requireSyncedLrclib = true;
        }

        if (!checkFolder && !checkLrclib) return null;
        return new PrefetchPlan(
                false, checkFolder, requireSyncedLocal, checkLrclib, -1L, requireSyncedLrclib, fallbackToOfficial);
    }

    private static void maybeSchedulePrefetch(final Context ctx, final LrclibModels.TrackQuery query) {
        final PrefetchPlan plan = computePrefetchPlan(ctx, query);
        if (plan == null) return;

        TrackLyricsState existing = trackStates.get(query.trackKey);
        if (existing != null && existing.source != LrclibModels.LyricsSource.UNKNOWN) {
            return;
        }
        if (inFlightPrefetches.contains(query.trackKey)) {
            return;
        }
        if (query.trackKey.equals(pendingPrefetchKey) && pendingPrefetchRunnable != null) {
            return;
        }

        if (pendingPrefetchRunnable != null) {
            MAIN.removeCallbacks(pendingPrefetchRunnable);
        }
        pendingPrefetchKey = query.trackKey;
        pendingPrefetchRunnable = new Runnable() {
            @Override
            public void run() {
                pendingPrefetchRunnable = null;
                TrackLyricsState cur = trackStates.get(query.trackKey);
                if (cur != null && cur.source != LrclibModels.LyricsSource.UNKNOWN) return;
                if (!inFlightPrefetches.add(query.trackKey)) return;
                refreshAllBadgesNow();
                runPrefetchAsync(ctx.getApplicationContext(), query, plan);
            }
        };
        MAIN.postDelayed(pendingPrefetchRunnable, PREFETCH_DEBOUNCE_MS);
    }

    private static void runPrefetchAsync(
            final Context ctx,
            final LrclibModels.TrackQuery query,
            final PrefetchPlan plan) {
        EXECUTOR.execute(() -> {
            try {
                // Skip if lyrics view already resolved this track while waiting in the executor queue.
                TrackLyricsState cur = trackStates.get(query.trackKey);
                if (cur != null
                        && cur.source != LrclibModels.LyricsSource.UNKNOWN
                        && cur.source != LrclibModels.LyricsSource.LOADING_LRCLIB) {
                    return;
                }

                if (plan.checkLocalFile) {
                    LrclibModels.TrackOverride ov = LrclibPrefs.getOverride(ctx, query.trackKey);
                    String raw = LocalLrcStore.readTrackLrc(ctx, query.trackKey);
                    boolean forceUnsynced = ov != null && ov.localForceUnsynced;
                    String label = (ov != null && !ov.localFileName.isEmpty()) ? ov.localFileName : "lyrics.lrc";
                    LrclibParser.PreparedRecord prep = LocalLrcParser.prepareLocalLrc(
                            raw, query.durationSec, LrclibPrefs.isWordSyncEnabled(ctx), forceUnsynced);
                    final LrclibModels.LyricsSource resolvedSource = prep.sourceType.isLocal()
                            ? prep.sourceType : LrclibModels.LyricsSource.NONE;
                    final String resolvedLabel = prep.sourceType.isLocal() ? label : "";
                    MAIN.post(() -> {
                        TrackLyricsState latest = trackStates.get(query.trackKey);
                        if (latest == null
                                || latest.source == LrclibModels.LyricsSource.UNKNOWN
                                || latest.source == LrclibModels.LyricsSource.LOADING_LRCLIB) {
                            setTrackState(query.trackKey, resolvedSource, -1L, false, resolvedLabel, false);
                        } else {
                            refreshAllUi();
                        }
                    });
                    return;
                }

                if (plan.checkLocalFolder) {
                    LocalLrcFolder.FolderMatch match = LocalLrcFolder.findBestMatch(ctx, query, plan.requireSyncedLocal);
                    if (match != null) {
                        LrclibParser.PreparedRecord prep = LocalLrcParser.prepareLocalLrc(
                                match.rawText, query.durationSec, LrclibPrefs.isWordSyncEnabled(ctx), false);
                        if (prep.sourceType.isLocal()) {
                            final LrclibModels.LyricsSource resolvedSource = prep.sourceType;
                            final String resolvedLabel = match.displayName;
                            MAIN.post(() -> {
                                TrackLyricsState latest = trackStates.get(query.trackKey);
                                if (latest == null
                                        || latest.source == LrclibModels.LyricsSource.UNKNOWN
                                        || latest.source == LrclibModels.LyricsSource.LOADING_LRCLIB) {
                                    setTrackState(query.trackKey, resolvedSource, -1L, false, resolvedLabel, true);
                                } else {
                                    refreshAllUi();
                                }
                            });
                            return;
                        }
                    }
                    if (!plan.checkLrclib) {
                        final LrclibModels.LyricsSource fallbackSource = (plan.fallbackToOfficialOnMiss
                                && (query.hasOfficialLyrics || query.hasCustomLyrics))
                                ? (query.hasTimeSyncedLyrics
                                        ? LrclibModels.LyricsSource.OFFICIAL_LINE
                                        : LrclibModels.LyricsSource.OFFICIAL_STATIC)
                                : LrclibModels.LyricsSource.NONE;
                        MAIN.post(() -> {
                            TrackLyricsState latest = trackStates.get(query.trackKey);
                            if (latest == null
                                    || latest.source == LrclibModels.LyricsSource.UNKNOWN
                                    || latest.source == LrclibModels.LyricsSource.LOADING_LRCLIB) {
                                setTrackState(query.trackKey, fallbackSource, -1L, false);
                            } else {
                                refreshAllUi();
                            }
                        });
                        return;
                    }
                }

                LrclibModels.LyricsRecord record = null;
                boolean rateLimited = false;
                if (plan.pinnedId > 0L) {
                    record = LrclibPrefs.readRecordById(ctx, plan.pinnedId);
                    if (record == null) {
                        try {
                            record = LrclibApiClient.getById(plan.pinnedId);
                            if (record != null) {
                                LrclibPrefs.writeRecordByIdCache(ctx, record, true);
                            }
                        } catch (LrclibApiClient.RateLimitException e) {
                            rateLimited = true;
                        } catch (IOException e) {
                            Log.w(TAG, "LRCLIB prefetch by id failed: " + plan.pinnedId, e);
                        }
                    }
                } else {
                    String cacheKey = buildAutoCacheKey(query, plan.requireSynced);
                    LrclibPrefs.CacheLookup cached = LrclibPrefs.readTrackCache(ctx, cacheKey);
                    if (cached.found) {
                        record = cached.hit ? cached.record : null;
                    } else {
                        try {
                            record = LrclibApiClient.resolveAutoMatch(
                                    query,
                                    plan.requireSynced,
                                    LrclibPrefs.isWordSyncEnabled(ctx),
                                    LrclibPrefs.isAllowPlainEnabled(ctx),
                                    LrclibPrefs.isSearchFallbackEnabled(ctx)
                            );
                            LrclibPrefs.writeTrackCache(ctx, cacheKey, record);
                        } catch (LrclibApiClient.RateLimitException e) {
                            rateLimited = true;
                        } catch (IOException e) {
                            Log.w(TAG, "LRCLIB prefetch network error for " + query.title, e);
                        }
                    }
                }

                boolean allowWord = LrclibPrefs.isWordSyncEnabled(ctx);
                boolean allowPlain = LrclibPrefs.isAllowPlainEnabled(ctx);
                LrclibParser.TtmlResult built = LrclibParser.buildTtml(
                        record, query.durationSec, allowWord, allowPlain, 0, null
                );
                if (plan.requireSynced
                        && built.sourceType != LrclibModels.LyricsSource.LRCLIB_WORD
                        && built.sourceType != LrclibModels.LyricsSource.LRCLIB_LINE) {
                    built = LrclibParser.TtmlResult.none();
                }

                final LrclibModels.LyricsSource resolvedSource;
                final long resolvedId;
                if (built.sourceType.hasUsableLrclibLyrics() && record != null) {
                    resolvedSource = built.sourceType;
                    resolvedId = record.id;
                } else if (built.sourceType == LrclibModels.LyricsSource.LRCLIB_INSTRUMENTAL && record != null) {
                    resolvedSource = LrclibModels.LyricsSource.LRCLIB_INSTRUMENTAL;
                    resolvedId = record.id;
                } else if (plan.fallbackToOfficialOnMiss && (query.hasOfficialLyrics || query.hasCustomLyrics)) {
                    resolvedSource = query.hasTimeSyncedLyrics
                            ? LrclibModels.LyricsSource.OFFICIAL_LINE
                            : LrclibModels.LyricsSource.OFFICIAL_STATIC;
                    resolvedId = -1L;
                } else {
                    resolvedSource = LrclibModels.LyricsSource.NONE;
                    resolvedId = -1L;
                }

                final boolean finalRateLimited = rateLimited;
                MAIN.post(() -> {
                    TrackLyricsState latest = trackStates.get(query.trackKey);
                    if (latest == null
                            || latest.source == LrclibModels.LyricsSource.UNKNOWN
                            || latest.source == LrclibModels.LyricsSource.LOADING_LRCLIB) {
                        setTrackState(query.trackKey, resolvedSource, resolvedId, finalRateLimited);
                    } else {
                        refreshAllUi();
                    }
                });
            } finally {
                inFlightPrefetches.remove(query.trackKey);
                MAIN.post(LrclibController::refreshAllBadgesNow);
            }
        });
    }

    private static void refreshPillForFragment(Object fragment) {
        PillBinding binding = pillBindings.get(fragment);
        if (binding == null) return;
        TextView pill = binding.pillRef.get();
        View root = binding.rootRef.get();
        if (pill == null || root == null) return;

        Context ctx = pill.getContext();
        LrclibModels.TrackQuery query = getCurrentTrackQuery(fragment);
        TrackLyricsState state = query != null ? trackStates.get(query.trackKey) : null;
        LrclibModels.LyricsSource src = state != null ? state.source : LrclibModels.LyricsSource.UNKNOWN;

        // Synchronize loading spinner and empty-state message with LRCLIB resolution state
        // so the spinner never keeps spinning after LRCLIB finishes with no match or instrumental.
        int loadingId = LrclibStrings.id(ctx, "id", "loading_progress");
        View loadingView = loadingId != 0 ? root.findViewById(loadingId) : null;
        int noLyricsId = LrclibStrings.id(ctx, "id", "no_lyrics_available_message");
        View noLyricsView = noLyricsId != 0 ? root.findViewById(noLyricsId) : null;

        if (src == LrclibModels.LyricsSource.NONE || src == LrclibModels.LyricsSource.LRCLIB_INSTRUMENTAL) {
            LrclibReflection.cancelShowLyricsLoadingMessage(fragment, ctx);
            LrclibReflection.cancelControlsFadeTimer(fragment, ctx);
            if (loadingView != null) {
                loadingView.setVisibility(View.GONE);
            }
            View controlsForRestore = binding.controlsRef.get();
            if (controlsForRestore != null
                    && (controlsForRestore.getVisibility() != View.VISIBLE || controlsForRestore.getAlpha() < 0.99f)) {
                LrclibReflection.showPlayerControls(fragment);
            }
            if (noLyricsView instanceof TextView) {
                TextView msgTv = (TextView) noLyricsView;
                LrclibModels.TrackOverride ov = query != null ? LrclibPrefs.getOverride(ctx, query.trackKey) : null;
                boolean forcedOfficial = ov != null && ov.mode == LrclibModels.OverrideMode.FORCE_OFFICIAL;
                if (src == LrclibModels.LyricsSource.LRCLIB_INSTRUMENTAL) {
                    msgTv.setText(LrclibStrings.text(ctx, "instrumental_message"));
                } else if (state != null && state.rateLimited) {
                    msgTv.setText(LrclibStrings.text(ctx, "rate_limited"));
                } else if (forcedOfficial && binding.originalNoLyricsText != null) {
                    msgTv.setText(binding.originalNoLyricsText);
                } else {
                    msgTv.setText(LrclibStrings.text(ctx, "not_found_message"));
                }
                msgTv.setVisibility(View.VISIBLE);
                msgTv.setClickable(true);
                msgTv.setOnClickListener(v -> {
                    Activity act = LrclibReflection.getActivity(fragment);
                    if (act != null && !act.isFinishing()) {
                        LrclibUi.openSourceSheet(act, fragment);
                    }
                });
            }
        } else if (src.isLrclib() || src.isOfficial() || src.isLocal()) {
            LrclibReflection.cancelShowLyricsLoadingMessage(fragment, ctx);
            if (loadingView != null) {
                loadingView.setVisibility(View.GONE);
            }
            if (noLyricsView instanceof TextView) {
                TextView msgTv = (TextView) noLyricsView;
                if (binding.originalNoLyricsText != null) {
                    msgTv.setText(binding.originalNoLyricsText);
                }
                msgTv.setOnClickListener(null);
                msgTv.setClickable(false);
                msgTv.setVisibility(View.GONE);
            }
        } else if (src == LrclibModels.LyricsSource.LOADING_LRCLIB) {
            if (noLyricsView instanceof TextView) {
                noLyricsView.setVisibility(View.GONE);
            }
        } else if (noLyricsView instanceof TextView && binding.originalNoLyricsText != null) {
            TextView msgTv = (TextView) noLyricsView;
            msgTv.setText(binding.originalNoLyricsText);
            msgTv.setOnClickListener(null);
            msgTv.setClickable(false);
        }

        if (!LrclibPrefs.isEnabled(ctx) || !LrclibPrefs.isShowLyricsPill(ctx) || query == null) {
            pill.setVisibility(View.GONE);
            return;
        }

        String label;
        int pillBg;
        int pillStroke;
        if (src == LrclibModels.LyricsSource.LOADING_LRCLIB) {
            label = LrclibStrings.text(ctx, "pill_loading");
            pillBg = PILL_BG_OFFICIAL;
            pillStroke = PILL_STROKE_OFFICIAL;
        } else if (src.isLocal()) {
            label = LrclibStrings.text(ctx, "pill_local");
            pillBg = PILL_BG_LOCAL;
            pillStroke = PILL_STROKE_LOCAL;
        } else if (src.hasUsableLrclibLyrics()) {
            label = LrclibStrings.text(ctx, "pill_lrclib");
            pillBg = PILL_BG_GREEN;
            pillStroke = PILL_STROKE_GREEN;
        } else if (src == LrclibModels.LyricsSource.LRCLIB_INSTRUMENTAL) {
            label = LrclibStrings.text(ctx, "pill_lrclib");
            pillBg = PILL_BG_INSTRUMENTAL;
            pillStroke = PILL_STROKE_INSTRUMENTAL;
        } else if (src.isOfficial()) {
            label = LrclibStrings.text(ctx, "pill_official");
            pillBg = PILL_BG_OFFICIAL;
            pillStroke = PILL_STROKE_OFFICIAL;
        } else if (src == LrclibModels.LyricsSource.NONE) {
            label = LrclibStrings.text(ctx, "pill_search");
            pillBg = PILL_BG_SEARCH;
            pillStroke = PILL_STROKE_SEARCH;
        } else {
            // Unknown yet (e.g. fragment just created before first load finishes)
            boolean hasOff = query.hasOfficialLyrics || query.hasCustomLyrics;
            label = hasOff
                    ? LrclibStrings.text(ctx, "pill_official")
                    : LrclibStrings.text(ctx, "pill_loading");
            pillBg = PILL_BG_OFFICIAL;
            pillStroke = PILL_STROKE_OFFICIAL;
        }

        pill.setText(label);
        pill.setBackground(makePillBackground(ctx, pillBg, pillStroke));
        pill.setContentDescription(LrclibStrings.text(ctx, "sheet_title") + ": " + label);

        View controls = binding.controlsRef.get();
        boolean controlsVisible = controls == null || (controls.getVisibility() == View.VISIBLE && controls.getAlpha() > 0.05f);
        pill.setVisibility(controlsVisible ? View.VISIBLE : View.INVISIBLE);
        if (controlsVisible) {
            pill.setAlpha(controls != null ? controls.getAlpha() : 1.0f);
        }

        if (root instanceof ViewGroup) {
            positionLyricsPill((ViewGroup) root, controls, pill, binding);
        }
    }

    private static Typeface loadSemiboldFont(Context ctx) {
        int fontId = LrclibStrings.id(ctx, "font", "semibold");
        if (fontId != 0) {
            try {
                return ctx.getResources().getFont(fontId);
            } catch (RuntimeException ignored) {
            }
        }
        return Typeface.DEFAULT_BOLD;
    }

    private static int dp(Context ctx, float value) {
        return Math.round(value * ctx.getResources().getDisplayMetrics().density);
    }
}
