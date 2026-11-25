package dev.materialtidal.extension.tidal.player;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;

import androidx.recyclerview.widget.ListAdapter;
import androidx.recyclerview.widget.RecyclerView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import dev.materialtidal.extension.tidal.navbar.ExpressiveMiniPlayerExpandOverlayView;
import dev.materialtidal.extension.tidal.navbar.ExpressiveScaffoldBridge;
import dev.materialtidal.extension.tidal.navbar.ExpressiveViewFactory;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsFetcher;

/**
 * Bridge connecting TIDAL's Compose {@code PlayerScreenKt.PlayerScreenContent}
 * to our custom Material 3 Expressive {@link ExpressivePlayerView}.
 *
 * <p>All {@code native*} stubs below are replaced at patch time with fingerprinted Dalvik bytecode
 * inside {@code ExpressivePlayerPatch}.
 */
@SuppressWarnings("unused")
public final class ExpressivePlayerBridge {

    private static final String TAG = "MaterialTidalPlayer";

    public static final int ACTION_PLAY_PAUSE = 0;
    public static final int ACTION_NEXT = 1;
    public static final int ACTION_PREVIOUS = 2;
    public static final int ACTION_SHUFFLE = 3;
    public static final int ACTION_REPEAT = 4;
    public static final int ACTION_FAVORITE = 5;
    public static final int ACTION_REMOVE_FAVORITE_CONFIRMED = 6;
    public static final int ACTION_QUEUE = 7;
    public static final int ACTION_BROADCAST = 8;
    public static final int ACTION_LYRICS = 9;
    public static final int ACTION_CONTEXT_MENU = 10;
    public static final int ACTION_PLAYBACK_BADGE = 11;
    public static final int ACTION_TITLE = 12;
    public static final int ACTION_ARTIST = 13;
    public static final int ACTION_SOURCE_LABEL = 14;
    public static final int ACTION_SEEK_FINISHED = 15;

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private static final ExpressiveViewFactory CREATE_PLAYER_FACTORY =
            new ExpressiveViewFactory(ExpressiveViewFactory.MODE_CREATE_PLAYER);
    private static final ExpressiveViewFactory UPDATE_PLAYER_FACTORY =
            new ExpressiveViewFactory(ExpressiveViewFactory.MODE_UPDATE_PLAYER);

    private static volatile Object latestContentState;
    private static volatile Object latestProgressState;
    private static volatile Object latestOnEvent;
    private static volatile Object latestOnMaximize;
    private static volatile Object latestOnOrientation;

    private static volatile boolean lastRemoveDialogShown;

    private static volatile int lastNativePosMs = -1;
    private static volatile int lastNativeDurMs = -1;
    private static volatile long lastNativeElapsedMs = 0L;

    private static volatile WeakReference<ExpressivePlayerView> activePlayerRef =
            new WeakReference<>(null);

    private ExpressivePlayerBridge() {
    }

    public static void renderPlayerScreen(
            Object contentState,
            Object progressState,
            boolean isOrientationLocked,
            Object onEvent,
            Object onMaximize,
            Object onOrientation,
            Object composer
    ) {
        latestContentState = contentState;
        latestProgressState = progressState;
        latestOnEvent = onEvent;
        latestOnMaximize = onMaximize;
        latestOnOrientation = onOrientation;

        ExpressivePlayerView current = activePlayerRef.get();
        if (current != null) {
            applyPlayerStateOnUiThread(current, contentState, progressState);
        }

        try {
            nativeMountPlayerAndroidView(CREATE_PLAYER_FACTORY, UPDATE_PLAYER_FACTORY, composer);
        } catch (Throwable t) {
            Log.e(TAG, "Failed mounting ExpressivePlayerView via AndroidView", t);
        }
    }

    public static View createPlayerView(Context context) {
        ExpressivePlayerView view = new ExpressivePlayerView(context);
        activePlayerRef = new WeakReference<>(view);
        ExpressivePlayerView preview = ExpressiveMiniPlayerExpandOverlayView.getActivePreviewPlayer();
        if (preview != null) {
            view.copyVisualStateFrom(preview);
        } else {
            view.syncPreviewFromMiniPlayer(
                    ExpressiveScaffoldBridge.getLatestMiniPlayerTitle(),
                    ExpressiveScaffoldBridge.getLatestMiniPlayerArtist(),
                    ExpressiveScaffoldBridge.getLatestMiniPlayerCoverId(),
                    ExpressiveScaffoldBridge.getLatestMiniPlayerPlayState(),
                    ExpressiveScaffoldBridge.getLatestMiniPlayerCanSkipNext(),
                    ExpressiveScaffoldBridge.getLatestMiniPlayerExplicit()
            );
        }
        applyPlayerState(view, latestContentState, latestProgressState);
        return view;
    }

    public static void updatePlayerView(View view) {
        if (view instanceof ExpressivePlayerView) {
            ExpressivePlayerView pv = (ExpressivePlayerView) view;
            activePlayerRef = new WeakReference<>(pv);
            applyPlayerState(pv, latestContentState, latestProgressState);
        }
    }

    public static void applyLatestToPreview(ExpressivePlayerView preview) {
        if (preview != null && latestContentState != null) {
            applyPlayerState(preview, latestContentState, latestProgressState);
        }
    }

    public static void refreshActivePlayer() {
        MAIN_HANDLER.post(() -> {
            ExpressivePlayerView pv = activePlayerRef.get();
            if (pv != null) {
                if (latestContentState != null) {
                    applyPlayerState(pv, latestContentState, latestProgressState);
                }
                pv.requestLayout();
                pv.invalidate();
            }
        });
    }

    private static void applyPlayerStateOnUiThread(
            ExpressivePlayerView view,
            Object contentState,
            Object progressState
    ) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            applyPlayerState(view, contentState, progressState);
        } else {
            MAIN_HANDLER.post(() -> applyPlayerState(view, contentState, progressState));
        }
    }

    private static void applyPlayerState(
            ExpressivePlayerView view,
            Object contentState,
            Object progressState
    ) {
        if (view == null || contentState == null) {
            return;
        }
        try {
            String[] strings = nativeGetPlayerStrings(contentState, progressState);
            int flags = nativeGetPlayerFlags(contentState);
            float progress = progressState != null ? nativeGetPlayerProgress(progressState) : 0f;

            String title = getStr(strings, 0, "");
            String artist = getStr(strings, 1, "");
            String coverId = getStr(strings, 2, null);
            String playState = getStr(strings, 3, "PAUSED");
            String repeatMode = getStr(strings, 4, "OFF");
            String badgeText = getStr(strings, 5, "");
            String progressTime = getStr(strings, 6, "00:00");
            String durationTime = getStr(strings, 7, "00:00");
            String sourceName = getStr(strings, 8, "");

            boolean isExplicit = (flags & 1) != 0;
            boolean isShuffleOn = (flags & 2) != 0;
            boolean isNextEnabled = (flags & 4) != 0;
            boolean isFavorite = (flags & 8) != 0;
            boolean showRemoveFavoriteDialog = (flags & 16) != 0;
            boolean showLyricsButton = (flags & 32) != 0;
            boolean isBroadcastConnected = (flags & 64) != 0;
            boolean isLyricsVisible = (flags & 128) != 0;
            boolean isLyricsLoading = (flags & 256) != 0;
            boolean isLyricsSynced = (flags & 512) != 0;

            if (ExpressiveScaffoldBridge.shouldOverridePlayerWithMiniState(coverId, title)) {
                String miniCover = ExpressiveScaffoldBridge.getLatestMiniPlayerCoverId();
                if (miniCover != null && !miniCover.isEmpty()) {
                    coverId = miniCover;
                }
                String miniTitle = ExpressiveScaffoldBridge.getLatestMiniPlayerTitle();
                if (miniTitle != null && !miniTitle.isEmpty()) {
                    title = miniTitle;
                }
                String miniArtist = ExpressiveScaffoldBridge.getLatestMiniPlayerArtist();
                if (miniArtist != null && !miniArtist.isEmpty()) {
                    artist = miniArtist;
                }
                String miniPlay = ExpressiveScaffoldBridge.getLatestMiniPlayerPlayState();
                if (miniPlay != null && !miniPlay.isEmpty()) {
                    String upper = miniPlay.toUpperCase(java.util.Locale.ROOT);
                    if (upper.contains("PLAY")) {
                        playState = "PLAYING";
                    } else if (upper.contains("BUFFER")) {
                        playState = "BUFFERING";
                    } else {
                        playState = "PAUSED";
                    }
                }
                isNextEnabled = ExpressiveScaffoldBridge.getLatestMiniPlayerCanSkipNext();
                isExplicit = ExpressiveScaffoldBridge.getLatestMiniPlayerExplicit();
            } else if (coverId == null || coverId.isEmpty()) {
                coverId = ExpressiveScaffoldBridge.getLatestMiniPlayerCoverId();
            }

            if (showRemoveFavoriteDialog && !lastRemoveDialogShown) {
                lastRemoveDialogShown = true;
                MAIN_HANDLER.post(() -> dispatchSimpleEvent(ACTION_REMOVE_FAVORITE_CONFIRMED));
            } else if (!showRemoveFavoriteDialog) {
                lastRemoveDialogShown = false;
            }

            String[] lyricLines = null;
            long[] lyricTimesMs = null;
            int highlightedLyricIndex = -1;

            if (isLyricsVisible && !isLyricsLoading) {
                List<?> rawLines = nativeGetLyricsList(contentState);
                if (rawLines != null && !rawLines.isEmpty()) {
                    int n = rawLines.size();
                    lyricLines = new String[n];
                    lyricTimesMs = new long[n];
                    for (int i = 0; i < n; i++) {
                        Object item = rawLines.get(i);
                        lyricLines[i] = nativeGetSyncedLyricText(item);
                        lyricTimesMs[i] = nativeGetSyncedLyricTimeMs(item);
                    }
                    if (isLyricsSynced) {
                        highlightedLyricIndex = nativeGetSyncedHighlightIndex(contentState);
                    }
                }
            }

            String metaTrackId = null;
            String metaAlbum = null;
            String metaIsrc = null;
            long metaDurMs = 0L;
            try {
                String[] trackMeta = nativeGetCurrentTrackMeta();
                String candidateId = getStr(trackMeta, 0, null);
                String candidateAlbum = getStr(trackMeta, 1, null);
                String candidateTitle = getStr(trackMeta, 3, null);
                long candidateDurMs = 0L;
                String durStr = getStr(trackMeta, 2, null);
                if (durStr != null && !durStr.isEmpty()) {
                    try {
                        candidateDurMs = Long.parseLong(durStr);
                    } catch (NumberFormatException ignored) {
                    }
                }
                if (SyllableLyricsFetcher.isMetaTitleCompatible(candidateTitle, title)) {
                    metaTrackId = candidateId;
                    metaAlbum = candidateAlbum;
                    metaDurMs = candidateDurMs;
                    metaIsrc = SyllableLyricsFetcher.getCachedIsrc(metaTrackId);
                }
            } catch (Throwable ignored) {
            }

            view.updateStateWithTrackMeta(
                    title,
                    artist,
                    coverId,
                    playState,
                    repeatMode,
                    badgeText,
                    progressTime,
                    durationTime,
                    sourceName,
                    progress,
                    isExplicit,
                    isShuffleOn,
                    isNextEnabled,
                    isFavorite,
                    showLyricsButton,
                    isBroadcastConnected,
                    isLyricsVisible,
                    isLyricsLoading,
                    isLyricsSynced,
                    lyricLines,
                    lyricTimesMs,
                    highlightedLyricIndex,
                    metaTrackId,
                    metaAlbum,
                    metaIsrc,
                    metaDurMs
            );
            ExpressivePlayQueueController.onPlaybackStateChanged(
                    isShuffleOn,
                    repeatMode,
                    "PLAYING".equals(playState),
                    sourceName
            );

            if (lastNativePosMs >= 0 && lastNativeElapsedMs > 0L
                    && (SystemClock.elapsedRealtime() - lastNativeElapsedMs) < 1500L) {
                view.onNativeProgressMs(lastNativePosMs, lastNativeDurMs, lastNativeElapsedMs, false);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error extracting PlayerScreen ViewState", t);
        }
    }

    private static String getStr(String[] arr, int idx, String fallback) {
        if (arr != null && idx < arr.length && arr[idx] != null) {
            return arr[idx];
        }
        return fallback;
    }

    // ---- Events dispatched by ExpressivePlayerView ----

    public static void dispatchSimpleEvent(int actionId) {
        Object onEvent = latestOnEvent;
        if (onEvent == null) {
            return;
        }
        try {
            nativeDispatchSimpleEvent(onEvent, actionId);
        } catch (Throwable t) {
            Log.e(TAG, "Failed dispatching player actionId=" + actionId, t);
        }
    }

    public static void dispatchSeekDragging(float progress) {
        Object onEvent = latestOnEvent;
        if (onEvent == null) {
            return;
        }
        try {
            nativeDispatchSeekDragging(onEvent, Math.max(0f, Math.min(1f, progress)));
        } catch (Throwable t) {
            Log.e(TAG, "Failed dispatching SeekDragging", t);
        }
    }

    public static void dispatchSeekFinished() {
        dispatchSimpleEvent(ACTION_SEEK_FINISHED);
    }

    public static void dispatchLyricLineClicked(long positionMs) {
        Object onEvent = latestOnEvent;
        if (onEvent == null) {
            return;
        }
        try {
            nativeDispatchLyricLineClicked(onEvent, positionMs);
        } catch (Throwable t) {
            Log.e(TAG, "Failed dispatching LyricLineClicked", t);
        }
    }

    @SuppressWarnings("deprecation")
    public static void dispatchCollapsePlayer(Context context) {
        if (ExpressiveScaffoldBridge.dispatchFullPlayerCollapse()) {
            return;
        }
        Activity activity = findActivity(context);
        if (activity != null) {
            MAIN_HANDLER.post(() -> {
                try {
                    activity.onBackPressed();
                } catch (Throwable t) {
                    Log.e(TAG, "Fallback back press failed", t);
                }
            });
        }
    }

    private static Activity findActivity(Context ctx) {
        Context cur = ctx;
        while (cur instanceof ContextWrapper) {
            if (cur instanceof Activity) {
                return (Activity) cur;
            }
            cur = ((ContextWrapper) cur).getBaseContext();
        }
        return null;
    }

    // ---- Syllable Lyrics Clock & ISRC Hooks ----

    public static void onPlaybackProgressTickMs(int positionMs, int durationMs) {
        long now = SystemClock.elapsedRealtime();
        lastNativePosMs = positionMs;
        lastNativeDurMs = durationMs;
        lastNativeElapsedMs = now;
        ExpressivePlayerView pv = activePlayerRef.get();
        if (pv != null) {
            pv.onNativeProgressMs(positionMs, durationMs, now, false);
        }
    }

    public static void onPlaybackStartedMs(int positionMs, int durationMs) {
        long now = SystemClock.elapsedRealtime();
        lastNativePosMs = positionMs;
        lastNativeDurMs = durationMs;
        lastNativeElapsedMs = now;
        ExpressivePlayerView pv = activePlayerRef.get();
        if (pv != null) {
            pv.onNativeProgressMs(positionMs, durationMs, now, true);
        }
    }

    public static void cacheTrackIsrc(String trackId, String isrc) {
        try {
            SyllableLyricsFetcher.cacheTrackIsrc(trackId, isrc);
        } catch (Throwable ignored) {
        }
    }

    // ---- Play Queue & Suggested Tracks Hooks ----

    public static void onPlayQueueViewCreated(Object fragment, View rootView) {
        try {
            ExpressivePlayQueueController.onPlayQueueViewCreated(fragment, rootView);
        } catch (Throwable ignored) {
        }
    }

    public static void onPlayQueueDestroyView(Object fragment) {
        try {
            ExpressivePlayQueueController.onPlayQueueDestroyView(fragment);
        } catch (Throwable ignored) {
        }
    }

    public static void onPlayQueueHeaderBound(RecyclerView.ViewHolder vh) {
        try {
            View itemView = vh != null ? vh.itemView : null;
            if (itemView != null) {
                ExpressivePlayQueueController.onPlayQueueHeaderBound(itemView);
            }
        } catch (Throwable ignored) {
        }
    }

    public static void onPlayQueueItemBound(RecyclerView.ViewHolder vh) {
        try {
            View itemView = vh != null ? vh.itemView : null;
            if (itemView != null) {
                ExpressivePlayQueueController.onPlayQueueItemBound(itemView);
            }
        } catch (Throwable ignored) {
        }
    }

    public static void onPlayQueueSuggestionsViewCreated(Object fragment, View rootView) {
        try {
            ExpressivePlayQueueController.onPlayQueueSuggestionsViewCreated(fragment, rootView);
        } catch (Throwable ignored) {
        }
    }

    public static void onPlayQueueSwipeCallbackInit(Object callback) {
        try {
            ExpressivePlayQueueController.onPlayQueueSwipeCallbackInit(callback);
        } catch (Throwable ignored) {
        }
    }

    public static void onPlayQueueSyncMove(
            ListAdapter<?, ?> adapter,
            List<?> newList,
            RecyclerView.ViewHolder source,
            RecyclerView.ViewHolder target
    ) {
        try {
            ExpressivePlayQueueController.onPlayQueueSyncMove(adapter, newList, source, target);
        } catch (Throwable ignored) {
        }
    }

    public static void onPlayQueueSelectedChanged(RecyclerView.ViewHolder vh, int actionState) {
        try {
            ExpressivePlayQueueController.onPlayQueueSelectedChanged(vh, actionState);
        } catch (Throwable ignored) {
        }
    }

    public static void onPlayQueueDragClearView(RecyclerView rv, RecyclerView.ViewHolder vh) {
        try {
            ExpressivePlayQueueController.onPlayQueueDragClearView(rv, vh);
        } catch (Throwable ignored) {
        }
    }

    // ---- Play Queue bottom sheet actions ----

    private static volatile WeakReference<Object> navigatorRef = new WeakReference<>(null);
    private static volatile WeakReference<Object> sleepTimerCtrlRef = new WeakReference<>(null);
    private static java.lang.reflect.Field sleepTimerFlowField;
    private static java.lang.reflect.Method stateFlowGetValueMethod;
    private static boolean sleepTimerReflectResolved;

    public static void registerNavigator(Object navigator) {
        if (navigator != null) {
            navigatorRef = new WeakReference<>(navigator);
        }
    }

    public static void registerSleepTimerController(Object controller) {
        if (controller != null) {
            sleepTimerCtrlRef = new WeakReference<>(controller);
        }
    }

    static boolean isSleepTimerActiveNow() {
        Object ctrl = sleepTimerCtrlRef.get();
        if (ctrl == null) {
            return false;
        }
        try {
            if (!sleepTimerReflectResolved) {
                sleepTimerReflectResolved = true;
                sleepTimerFlowField = ctrl.getClass().getDeclaredField("g");
                sleepTimerFlowField.setAccessible(true);
            }
            if (sleepTimerFlowField == null) {
                return false;
            }
            Object flow = sleepTimerFlowField.get(ctrl);
            if (flow == null) {
                return false;
            }
            if (stateFlowGetValueMethod == null) {
                stateFlowGetValueMethod = flow.getClass().getMethod("getValue");
            }
            return stateFlowGetValueMethod.invoke(flow) != null;
        } catch (Throwable ignored) {
            return false;
        }
    }

    static boolean isShuffleOnNow() {
        try {
            int direct = nativeGetQueueShuffleState();
            if (direct >= 0) {
                return direct != 0;
            }
        } catch (Throwable ignored) {
        }
        try {
            Object c = latestContentState;
            return c != null && (nativeGetPlayerFlags(c) & 2) != 0;
        } catch (Throwable t) {
            return false;
        }
    }

    static String repeatModeNow() {
        try {
            String direct = nativeGetQueueRepeatMode();
            if (direct != null && !direct.isEmpty()) {
                return direct;
            }
        } catch (Throwable ignored) {
        }
        try {
            Object c = latestContentState;
            if (c == null) {
                return "OFF";
            }
            return getStr(nativeGetPlayerStrings(c, latestProgressState), 4, "OFF");
        } catch (Throwable t) {
            return "OFF";
        }
    }

    static boolean isPlayingNow() {
        try {
            Object c = latestContentState;
            if (c != null) {
                String st = getStr(nativeGetPlayerStrings(c, latestProgressState), 3, "");
                if (!st.isEmpty()) {
                    return "PLAYING".equals(st);
                }
            }
            String mini = ExpressiveScaffoldBridge.getLatestMiniPlayerPlayState();
            return mini != null && mini.toUpperCase(java.util.Locale.ROOT).contains("PLAY");
        } catch (Throwable ignored) {
            return false;
        }
    }

    static String sourceLabelNow() {
        try {
            Object c = latestContentState;
            if (c != null) {
                String src = getStr(nativeGetPlayerStrings(c, latestProgressState), 8, "");
                if (src != null && !src.trim().isEmpty()) {
                    return src.trim();
                }
            }
        } catch (Throwable ignored) {
        }
        return "";
    }

    static void toggleShuffleFromQueue() {
        if (latestOnEvent != null) {
            dispatchSimpleEvent(ACTION_SHUFFLE);
            return;
        }
        try {
            nativeToggleQueueShuffleDirect();
        } catch (Throwable t) {
            Log.e(TAG, "Direct shuffle toggle failed", t);
        }
    }

    static void cycleRepeatFromQueue() {
        if (latestOnEvent != null) {
            dispatchSimpleEvent(ACTION_REPEAT);
            return;
        }
        try {
            nativeCycleQueueRepeatDirect();
        } catch (Throwable t) {
            Log.e(TAG, "Direct repeat cycle failed", t);
        }
    }

    static void clearQueueExceptCurrent() {
        try {
            nativeClearQueue();
        } catch (Throwable t) {
            Log.e(TAG, "Clear queue failed", t);
        }
    }

    static void saveQueueAsPlaylist() {
        try {
            nativeSaveQueueAsPlaylist();
        } catch (Throwable t) {
            Log.e(TAG, "Save queue as playlist failed", t);
        }
    }

    static boolean showSleepTimer(Object activity) {
        Object nav = navigatorRef.get();
        if (nav == null || activity == null) {
            return false;
        }
        try {
            nativeShowSleepTimer(nav, activity);
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "Sleep timer failed", t);
            return false;
        }
    }

    // ---- Desktop & Tablet Play Queue + Audio Spec Helpers ----

    public static DesktopQueuePanelRenderer.QueueSnapshot fetchPlayQueueSnapshot(int maxUpcoming) {
        try {
            Object[] snap = nativeGetPlayQueueSnapshot();
            if (snap == null || snap.length < 2 || !(snap[0] instanceof List) || !(snap[1] instanceof Integer)) {
                return null;
            }
            List<?> rawItems = (List<?>) snap[0];
            int currentPos = (Integer) snap[1];
            int totalSize = rawItems.size();
            if (totalSize == 0) {
                return new DesktopQueuePanelRenderer.QueueSnapshot(
                        Collections.emptyList(), -1, 0, "empty");
            }
            int startIdx = (currentPos >= 0 && currentPos < totalSize) ? currentPos : 0;
            int endIdx = Math.min(totalSize, startIdx + Math.max(1, maxUpcoming) + 1);
            List<DesktopQueuePanelRenderer.QueueTrackItem> items = new ArrayList<>(endIdx - startIdx);
            StringBuilder sig = new StringBuilder();
            sig.append(currentPos).append(':').append(totalSize);

            for (int i = startIdx; i < endIdx; i++) {
                Object rawItem = rawItems.get(i);
                String[] strs = rawItem != null ? nativeExtractQueueItemStrings(rawItem) : null;
                String uid = getStr(strs, 0, String.valueOf(i));
                String title = getStr(strs, 1, "");
                String artist = getStr(strs, 2, "");
                String cover = getStr(strs, 3, null);
                int durSec = 0;
                String durStr = getStr(strs, 4, null);
                if (durStr != null && !durStr.isEmpty()) {
                    try {
                        durSec = Integer.parseInt(durStr);
                    } catch (NumberFormatException ignored) {
                    }
                }
                int itemFlags = 0;
                String flagStr = getStr(strs, 5, null);
                if (flagStr != null && !flagStr.isEmpty()) {
                    try {
                        itemFlags = Integer.parseInt(flagStr);
                    } catch (NumberFormatException ignored) {
                    }
                }
                boolean isExplicit = (itemFlags & 1) != 0;
                boolean isActive = (itemFlags & 2) != 0;
                boolean isCurrent = currentPos >= 0 && i == currentPos;

                items.add(new DesktopQueuePanelRenderer.QueueTrackItem(
                        i, uid, title, artist, cover, durSec, isExplicit, isActive, isCurrent
                ));
                sig.append('|').append(uid).append('#').append(isActive ? '1' : '0');
            }
            return new DesktopQueuePanelRenderer.QueueSnapshot(items, currentPos, totalSize, sig.toString());
        } catch (Throwable t) {
            Log.e(TAG, "Failed fetching play queue snapshot", t);
            return null;
        }
    }

    public static void playQueuePosition(int queueIndex) {
        if (queueIndex < 0) {
            return;
        }
        try {
            nativePlayQueuePosition(queueIndex);
        } catch (Throwable t) {
            Log.e(TAG, "Failed playing queue position " + queueIndex, t);
        }
    }

    public static void removeQueueItem(int queueIndex) {
        if (queueIndex < 0) {
            return;
        }
        try {
            nativeRemoveQueueItem(queueIndex);
        } catch (Throwable t) {
            Log.e(TAG, "Failed removing queue item " + queueIndex, t);
        }
    }

    public static String getAudioStreamSpecRaw() {
        try {
            return nativeGetAudioStreamSpec();
        } catch (Throwable ignored) {
            return null;
        }
    }

    // ---- Patch-time replaced Dalvik stubs ----

    private static void nativeClearQueue() {
    }

    private static void nativeSaveQueueAsPlaylist() {
    }

    private static void nativeShowSleepTimer(Object navigator, Object activity) {
    }

    private static int nativeGetQueueShuffleState() {
        return -1;
    }

    private static String nativeGetQueueRepeatMode() {
        return null;
    }

    private static void nativeToggleQueueShuffleDirect() {
    }

    private static void nativeCycleQueueRepeatDirect() {
    }

    private static void nativeMountPlayerAndroidView(Object factory, Object update, Object composer) {
    }

    private static String[] nativeGetPlayerStrings(Object contentState, Object progressState) {
        return null;
    }

    private static int nativeGetPlayerFlags(Object contentState) {
        return 0;
    }

    private static float nativeGetPlayerProgress(Object progressState) {
        return 0f;
    }

    private static List<?> nativeGetLyricsList(Object contentState) {
        return null;
    }

    private static int nativeGetSyncedHighlightIndex(Object contentState) {
        return -1;
    }

    private static String nativeGetSyncedLyricText(Object lyricItem) {
        return "";
    }

    private static long nativeGetSyncedLyricTimeMs(Object lyricItem) {
        return 0L;
    }

    private static void nativeDispatchSimpleEvent(Object onEvent, int actionId) {
    }

    private static void nativeDispatchSeekDragging(Object onEvent, float progress) {
    }

    private static void nativeDispatchLyricLineClicked(Object onEvent, long positionMs) {
    }

    private static String[] nativeGetCurrentTrackMeta() {
        return null;
    }

    private static Object[] nativeGetPlayQueueSnapshot() {
        return null;
    }

    private static String[] nativeExtractQueueItemStrings(Object item) {
        return null;
    }

    private static void nativePlayQueuePosition(int position) {
    }

    private static void nativeRemoveQueueItem(int position) {
    }

    private static String nativeGetAudioStreamSpec() {
        return null;
    }
}
