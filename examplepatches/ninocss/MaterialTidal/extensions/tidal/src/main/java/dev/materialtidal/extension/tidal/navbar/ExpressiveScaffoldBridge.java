package dev.materialtidal.extension.tidal.navbar;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;

import java.lang.ref.WeakReference;

/**
 * Bridge connecting TIDAL's obfuscated Compose {@code AppScaffoldKt}, {@code TabBarKt},
 * and {@code MiniPlayerKt} to our custom Material 3 Expressive Android Views.
 *
 * <p>All {@code native*} stubs below are replaced at patch time with fingerprinted Dalvik bytecode.
 */
@SuppressWarnings("unused")
public final class ExpressiveScaffoldBridge {

    private static final String TAG = "MaterialTidalNav";

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private static final ExpressiveViewFactory CREATE_NAVBAR_FACTORY =
            new ExpressiveViewFactory(ExpressiveViewFactory.MODE_CREATE_NAVBAR);
    private static final ExpressiveViewFactory UPDATE_NAVBAR_FACTORY =
            new ExpressiveViewFactory(ExpressiveViewFactory.MODE_UPDATE_NAVBAR);

    private static final ExpressiveViewFactory CREATE_MINI_FACTORY =
            new ExpressiveViewFactory(ExpressiveViewFactory.MODE_CREATE_MINIPLAYER);
    private static final ExpressiveViewFactory UPDATE_MINI_FACTORY =
            new ExpressiveViewFactory(ExpressiveViewFactory.MODE_UPDATE_MINIPLAYER);

    private static volatile Object scaffoldViewModel;
    private static volatile Object miniPlayerViewModel;

    private static volatile Object latestTabState;
    private static volatile Object latestTabOnEvent;

    private static volatile Object latestMiniState;
    private static volatile Object latestMiniOnEvent;
    private static volatile String latestMiniTitle = "";
    private static volatile String latestMiniArtist = "";
    private static volatile String latestMiniCoverId;
    private static volatile String latestMiniPlayState = "Paused";
    private static volatile boolean latestMiniCanSkipNext = true;
    private static volatile boolean latestMiniExplicit = false;

    private static volatile boolean pendingInstantSheetSnap;
    private static volatile long pendingInstantSheetSnapUntilUptimeMs;
    private static volatile boolean pendingMiniPlayerToFullSync;
    private static volatile long pendingMiniPlayerToFullSyncUntilUptimeMs;

    private static volatile WeakReference<ExpressiveNavbarView> activeNavbarRef =
            new WeakReference<>(null);
    private static volatile WeakReference<ExpressiveMiniPlayerView> activeMiniPlayerRef =
            new WeakReference<>(null);

    private ExpressiveScaffoldBridge() {
    }

    public static void registerScaffoldViewModel(Object vm) {
        if (vm != null) {
            scaffoldViewModel = vm;
        }
    }

    public static void registerMiniPlayerViewModel(Object vm) {
        if (vm != null) {
            miniPlayerViewModel = vm;
        }
    }

    public static void renderTabBar(
            Object tabState,
            Object onEvent,
            Object modifier,
            Object composer,
            int changed
    ) {
        latestTabState = tabState;
        latestTabOnEvent = onEvent;

        ExpressiveNavbarView current = activeNavbarRef.get();
        if (current != null) {
            applyTabStateOnUiThread(current, tabState);
        }

        try {
            nativeMountAndroidView(CREATE_NAVBAR_FACTORY, UPDATE_NAVBAR_FACTORY, composer);
        } catch (Throwable t) {
            Log.e(TAG, "Failed mounting ExpressiveNavbarView via AndroidView", t);
        }
    }

    public static void renderMiniPlayer(
            Object miniState,
            Object onEvent,
            Object composer,
            int changed
    ) {
        latestMiniState = miniState;
        latestMiniOnEvent = onEvent;
        if (miniState != null) {
            try {
                int flags = nativeGetMiniPlayerFlags(miniState);
                latestMiniCanSkipNext = (flags & 2) != 0;
                latestMiniExplicit = (flags & 4) != 0;
                String[] strings = nativeGetMiniPlayerStrings(miniState);
                if (strings != null) {
                    if (strings.length > 0 && strings[0] != null) {
                        latestMiniTitle = strings[0];
                    }
                    if (strings.length > 1 && strings[1] != null) {
                        latestMiniArtist = strings[1];
                    }
                    if (strings.length > 2 && strings[2] != null) {
                        latestMiniCoverId = strings[2];
                    }
                    if (strings.length > 3 && strings[3] != null) {
                        latestMiniPlayState = strings[3];
                    }
                }
            } catch (Throwable ignored) {
            }
        }

        ExpressiveMiniPlayerView current = activeMiniPlayerRef.get();
        if (current != null) {
            applyMiniStateOnUiThread(current, miniState);
        }

        try {
            nativeMountAndroidView(CREATE_MINI_FACTORY, UPDATE_MINI_FACTORY, composer);
        } catch (Throwable t) {
            Log.e(TAG, "Failed mounting ExpressiveMiniPlayerView via AndroidView", t);
        }
    }

    public static View createNavbarView(Context context) {
        ExpressiveNavbarView view = new ExpressiveNavbarView(context);
        activeNavbarRef = new WeakReference<>(view);
        applyTabState(view, latestTabState);
        view.post(() -> ExpressiveProgressiveBlurOverlayView.attachFromScaffoldDescendant(view));
        return view;
    }

    public static void updateNavbarView(View view) {
        if (view instanceof ExpressiveNavbarView) {
            ExpressiveNavbarView nav = (ExpressiveNavbarView) view;
            activeNavbarRef = new WeakReference<>(nav);
            applyTabState(nav, latestTabState);
            nav.post(() -> ExpressiveProgressiveBlurOverlayView.attachFromScaffoldDescendant(nav));
        }
    }

    public static View createMiniPlayerView(Context context) {
        ExpressiveMiniPlayerView view = new ExpressiveMiniPlayerView(context);
        activeMiniPlayerRef = new WeakReference<>(view);
        applyMiniState(view, latestMiniState);
        return view;
    }

    public static void updateMiniPlayerView(View view) {
        if (view instanceof ExpressiveMiniPlayerView) {
            ExpressiveMiniPlayerView mp = (ExpressiveMiniPlayerView) view;
            activeMiniPlayerRef = new WeakReference<>(mp);
            applyMiniState(mp, latestMiniState);
        }
    }

    private static void applyTabStateOnUiThread(ExpressiveNavbarView view, Object state) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            applyTabState(view, state);
        } else {
            MAIN_HANDLER.post(() -> applyTabState(view, state));
        }
    }

    private static void applyTabState(ExpressiveNavbarView view, Object state) {
        if (view == null || state == null) {
            return;
        }
        try {
            String selected = nativeGetSelectedTabName(state);
            int flags = nativeGetTabFlags(state);
            boolean showUploads = (flags & 1) != 0;
            boolean showFeedBadge = (flags & 2) != 0;
            view.updateState(selected, showUploads, showFeedBadge);
        } catch (Throwable t) {
            Log.e(TAG, "Error extracting TabBar ViewState", t);
        }
    }

    private static void applyMiniStateOnUiThread(ExpressiveMiniPlayerView view, Object state) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            applyMiniState(view, state);
        } else {
            MAIN_HANDLER.post(() -> applyMiniState(view, state));
        }
    }

    private static void applyMiniState(ExpressiveMiniPlayerView view, Object state) {
        if (view == null || state == null) {
            return;
        }
        try {
            int flags = nativeGetMiniPlayerFlags(state);
            boolean hasMedia = (flags & 1) != 0;
            boolean canSkipNext = (flags & 2) != 0;
            boolean isExplicit = (flags & 4) != 0;
            String[] strings = nativeGetMiniPlayerStrings(state);
            String title = strings != null && strings.length > 0 && strings[0] != null ? strings[0] : "";
            String artist = strings != null && strings.length > 1 && strings[1] != null ? strings[1] : "";
            String coverId = strings != null && strings.length > 2 ? strings[2] : null;
            String playState = strings != null && strings.length > 3 && strings[3] != null ? strings[3] : "Paused";
            latestMiniTitle = title;
            latestMiniArtist = artist;
            if (coverId != null) {
                latestMiniCoverId = coverId;
            }
            latestMiniPlayState = playState;
            latestMiniCanSkipNext = canSkipNext;
            latestMiniExplicit = isExplicit;
            view.updateState(hasMedia, title, artist, coverId, playState, canSkipNext, isExplicit);
        } catch (Throwable t) {
            Log.e(TAG, "Error extracting MiniPlayer ViewState", t);
        }
    }

    // ---- Events dispatched by our custom Views ----

    public static void dispatchTabSelected(String tabName) {
        Object onEvent = latestTabOnEvent;
        if (onEvent == null || tabName == null) {
            return;
        }
        try {
            nativeDispatchTabSelected(onEvent, tabName);
        } catch (Throwable t) {
            Log.e(TAG, "Failed dispatching TabSelected: " + tabName, t);
        }
    }

    public static void dispatchMiniPlayerPlayPause() {
        Object onEvent = latestMiniOnEvent;
        if (onEvent == null) {
            return;
        }
        try {
            nativeDispatchMiniPlayerPlayPause(onEvent);
        } catch (Throwable t) {
            Log.e(TAG, "Failed dispatching PlayPauseButtonClicked", t);
        }
    }

    public static void dispatchMiniPlayerNext() {
        Object onEvent = latestMiniOnEvent;
        if (onEvent == null) {
            return;
        }
        try {
            nativeDispatchMiniPlayerNext(onEvent);
        } catch (Throwable t) {
            Log.e(TAG, "Failed dispatching NextButtonClicked", t);
        }
    }

    public static void dispatchMiniPlayerPrevious() {
        Object miniVm = miniPlayerViewModel;
        if (miniVm != null) {
            try {
                nativeDispatchMiniPlayerPrevious(miniVm);
                return;
            } catch (Throwable t) {
                Log.e(TAG, "Failed dispatching Previous via MiniPlayerViewModel", t);
            }
        }
        try {
            dev.materialtidal.extension.tidal.player.ExpressivePlayerBridge.dispatchSimpleEvent(
                    dev.materialtidal.extension.tidal.player.ExpressivePlayerBridge.ACTION_PREVIOUS);
        } catch (Throwable t) {
            Log.e(TAG, "Fallback Previous dispatch failed", t);
        }
    }

    public static void dispatchMiniPlayerOpenFull() {
        pendingInstantSheetSnap = false;
        pendingInstantSheetSnapUntilUptimeMs = 0L;
        markMiniPlayerOpeningFull();
        Object vm = scaffoldViewModel;
        if (vm == null) {
            return;
        }
        try {
            nativeDispatchMiniPlayerOpenFull(vm);
        } catch (Throwable t) {
            Log.e(TAG, "Failed dispatching MiniPlayerClicked", t);
        }
    }

    public static void dispatchMiniPlayerOpenFullInstant() {
        Object vm = scaffoldViewModel;
        if (vm == null) {
            return;
        }
        long now = SystemClock.uptimeMillis();
        pendingInstantSheetSnap = true;
        pendingInstantSheetSnapUntilUptimeMs = now + 1100L;
        markMiniPlayerOpeningFull();
        try {
            nativeDispatchMiniPlayerOpenFull(vm);
        } catch (Throwable t) {
            pendingInstantSheetSnap = false;
            pendingInstantSheetSnapUntilUptimeMs = 0L;
            Log.e(TAG, "Failed dispatching instant MiniPlayerClicked", t);
        }
    }

    private static void markMiniPlayerOpeningFull() {
        pendingMiniPlayerToFullSync = true;
        pendingMiniPlayerToFullSyncUntilUptimeMs = SystemClock.uptimeMillis() + 1400L;
    }

    /**
     * Returns {@code true} when {@code PlayerViewModel}'s initial or stale {@code StateFlow} value
     * on Frame 0 of {@code ModalBottomSheet} has not yet caught up with the live Mini-Player track.
     */
    public static boolean shouldOverridePlayerWithMiniState(String playerCoverId, String playerTitle) {
        if (latestMiniCoverId == null || latestMiniCoverId.isEmpty()) {
            return false;
        }
        if (playerCoverId == null || playerCoverId.isEmpty()
                || playerTitle == null || playerTitle.isEmpty()) {
            return true;
        }
        if (pendingMiniPlayerToFullSync) {
            if (SystemClock.uptimeMillis() > pendingMiniPlayerToFullSyncUntilUptimeMs) {
                pendingMiniPlayerToFullSync = false;
                return false;
            }
            if (!latestMiniCoverId.equals(playerCoverId)) {
                return true;
            }
            pendingMiniPlayerToFullSync = false;
        }
        return false;
    }

    public static boolean isPendingInstantSheetSnap() {
        if (!pendingInstantSheetSnap) {
            return false;
        }
        if (SystemClock.uptimeMillis() > pendingInstantSheetSnapUntilUptimeMs) {
            pendingInstantSheetSnap = false;
            return false;
        }
        return true;
    }

    public static boolean consumePendingInstantSheetSnap() {
        return isPendingInstantSheetSnap();
    }

    public static void onRealFullPlayerDrawn() {
        if (pendingInstantSheetSnap) {
            long tighten = SystemClock.uptimeMillis() + 120L;
            if (tighten < pendingInstantSheetSnapUntilUptimeMs) {
                pendingInstantSheetSnapUntilUptimeMs = tighten;
            }
        }
        ExpressiveMiniPlayerExpandOverlayView.onRealFullPlayerDrawn();
    }

    public static boolean dispatchFullPlayerCollapse() {
        Object vm = scaffoldViewModel;
        if (vm == null) {
            return false;
        }
        try {
            nativeDispatchFullPlayerCollapse(vm);
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "Failed dispatching FullPlayerDismissed", t);
            return false;
        }
    }

    public static String getLatestMiniPlayerCoverId() {
        return latestMiniCoverId;
    }

    public static String getLatestMiniPlayerTitle() {
        return latestMiniTitle;
    }

    public static String getLatestMiniPlayerArtist() {
        return latestMiniArtist;
    }

    public static String getLatestMiniPlayerPlayState() {
        return latestMiniPlayState;
    }

    public static boolean getLatestMiniPlayerCanSkipNext() {
        return latestMiniCanSkipNext;
    }

    public static boolean getLatestMiniPlayerExplicit() {
        return latestMiniExplicit;
    }

    static void notifyDockMiniPlayerPresenceChanged(boolean visible) {
        ExpressiveNavbarView nav = activeNavbarRef.get();
        if (nav != null) {
            nav.onMiniPlayerPresenceChanged(visible);
        }
        ExpressiveProgressiveBlurOverlayView.invalidateActive();
    }

    static void notifyMiniPlayerPullUp(float pullFraction) {
        ExpressiveNavbarView nav = activeNavbarRef.get();
        if (nav != null) {
            nav.onMiniPlayerPullUp(pullFraction);
        }
    }

    /**
     * Returns Compose packed Color.Transparent (0L) when the hardware progressive blur overlay
     * is active behind the AppScaffold; falls back to the Monet surfaceBase Compose color when
     * blur or progressive fade is disabled.
     */
    public static long getBottomScrimEndColorCompose() {
        if (dev.materialtidal.extension.tidal.theme.MaterialYouConfig.isMaterialYouEnabled()
                && !dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine.isEffectiveAmoledBlack()
                && dev.materialtidal.extension.tidal.theme.MaterialYouConfig.isExpressiveBlurEnabled()
                && dev.materialtidal.extension.tidal.theme.MaterialYouConfig.isNavbarProgressiveBlurEnabled()) {
            return 0L;
        }
        return dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine.getSurfaceBaseCompose();
    }

    // ---- Patch-time replaced Dalvik stubs ----

    private static void nativeMountAndroidView(Object factory, Object update, Object composer) {
    }

    private static String nativeGetSelectedTabName(Object tabState) {
        return "HOME";
    }

    private static int nativeGetTabFlags(Object tabState) {
        return 0;
    }

    private static void nativeDispatchTabSelected(Object onTabEvent, String tabTypeName) {
    }

    private static String[] nativeGetMiniPlayerStrings(Object miniState) {
        return null;
    }

    private static int nativeGetMiniPlayerFlags(Object miniState) {
        return 0;
    }

    private static void nativeDispatchMiniPlayerPlayPause(Object onMiniEvent) {
    }

    private static void nativeDispatchMiniPlayerNext(Object onMiniEvent) {
    }

    private static void nativeDispatchMiniPlayerPrevious(Object miniVm) {
    }

    private static void nativeDispatchMiniPlayerOpenFull(Object scaffoldVm) {
    }

    private static void nativeDispatchFullPlayerCollapse(Object scaffoldVm) {
    }
}
