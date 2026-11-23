package dev.materialtidal.extension.tidal.player;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;

import androidx.recyclerview.widget.RecyclerView;

import java.lang.ref.WeakReference;
import java.util.List;

import dev.materialtidal.extension.tidal.navbar.ExpressiveMiniPlayerExpandOverlayView;
import dev.materialtidal.extension.tidal.navbar.ExpressiveScaffoldBridge;
import dev.materialtidal.extension.tidal.navbar.ExpressiveViewFactory;

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

            view.updateState(
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
                    highlightedLyricIndex
            );
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

    // ---- Patch-time replaced Dalvik stubs ----

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
}
