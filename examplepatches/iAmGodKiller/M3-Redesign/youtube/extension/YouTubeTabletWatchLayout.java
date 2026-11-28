package app.morphe.extension.youtube.patches.fullscreen;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.OverScroller;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Locale;
import java.util.WeakHashMap;

/**
 * Standalone YouTube tablet-landscape watch layout patch helper (v2):
 * - Strictly active only in tablet landscape two-column watch mode (dormant on phones, portrait,
 *   fullscreen player, miniplayer, and non-watch screens).
 * - Mounts a single FrameLayout overlay on android.R.id.content (never mutating NextGenWatchLayout's
 *   child list) aligned cleanly to the left-column watch metadata area below the video player.
 * - Uses semantic child View discovery (never blind index guessing or bitmap slicing) to merge
 *   Channel info + Subscribe/Bell + Like/Dislike + a native Comment pill + Share/Ask/Save/Download/Report
 *   into ONE horizontally scrollable row.
 * - Strictly verifies the Comments teaser before auto-opening comments once per video, identifies the
 *   newly opened Comments panel structurally (works even with obfuscated class names), docks it below
 *   the merged header while keeping Related Videos visible on the right, and links scrolling from
 *   Video Title through Comments as one continuous page.
 */
@SuppressWarnings("unused")
public final class YouTubeTabletWatchLayout {

    private static final String HOST_TAG = "morphe_yt_tablet_watch_host";
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<Activity, WatchState> STATES = new WeakHashMap<>();

    private static volatile boolean enabled = false;
    private static volatile boolean lifecycleRegistered = false;
    private static volatile WeakReference<Activity> currentActivityRef = new WeakReference<>(null);

    private static final String[] NON_COMMENTS_PANEL_TITLES = {
            "description",
            "ask",
            "chapters",
            "transcript",
            "live chat",
            "top chat",
            "products",
            "shopping",
            "clip",
            "playlist",
            "more videos"
    };

    private static final class WatchState {
        boolean listenersInstalled = false;
        View.OnLayoutChangeListener decorLayoutListener;
        ViewTreeObserver.OnWindowFocusChangeListener focusListener;

        WeakReference<ViewGroup> leftWatchRvRef = new WeakReference<>(null);
        View.OnLayoutChangeListener leftWatchRvListener;

        UnifiedWatchScrollHost hostView;

        // Current bound video metadata references.
        WeakReference<View> titleItemRef = new WeakReference<>(null);
        WeakReference<View> channelItemRef = new WeakReference<>(null);
        WeakReference<View> actionsItemRef = new WeakReference<>(null);
        WeakReference<View> commentsTeaserRef = new WeakReference<>(null);
        String lastVideoSignature = "";
        String lastAutoOpenedSignature = "";
        long lastCommentsAutoClickMs = 0L;
        int commentsDockRetries = 0;

        // Snapshot of right-column RecyclerViews (Related Videos) captured before opening Comments.
        final WeakHashMap<ViewGroup, Boolean> preExistingRightRvs = new WeakHashMap<>();

        // Docked Comments Engagement Panel state (restored cleanly on teardown / orientation change).
        WeakReference<ViewGroup> engagementWrapperRef = new WeakReference<>(null);
        WeakReference<ViewGroup> dockedPanelOriginalParentRef = new WeakReference<>(null);
        WeakReference<View> dockedPanelRootRef = new WeakReference<>(null);
        WeakReference<View> dockedCommentsRvRef = new WeakReference<>(null);
        WeakReference<View> dockedCommentComposerRef = new WeakReference<>(null);
        WeakReference<View> hiddenPanelHeaderRef = new WeakReference<>(null);
        int hiddenPanelHeaderPrevVis = View.VISIBLE;
        int savedComposerOrigHeight = ViewGroup.LayoutParams.WRAP_CONTENT;
        boolean composerHeightSaved = false;
        int dockedPanelOriginalIndex = -1;
        ViewGroup.LayoutParams dockedPanelOriginalLp = null;
        View.OnLayoutChangeListener wrapperMonitorListener;
        boolean wrapperHiddenByUs = false;
        int wrapperPrevVisibility = View.VISIBLE;

        boolean activityResumed = false;
        Runnable syncRunnable;
        Runnable retryCommentsRunnable;
        Runnable headerRefreshRunnable;
        Runnable watchPollRunnable;
    }

    private YouTubeTabletWatchLayout() {
    }

    // -------------------------------------------------------------------------
    // Patch entry point
    // -------------------------------------------------------------------------

    /**
     * Hooked at index 0 of YouTube's MainActivity.onCreate(Bundle) by "Tablet landscape watch layout".
     */
    public static void onTabletWatchLayoutEnabled(Activity activity) {
        enabled = true;
        if (activity == null) {
            return;
        }
        currentActivityRef = new WeakReference<>(activity);
        registerLifecycleOnce(activity);
    }

    private static void registerLifecycleOnce(Activity activity) {
        if (lifecycleRegistered) {
            return;
        }
        Application app = activity.getApplication();
        if (app == null) {
            return;
        }
        synchronized (YouTubeTabletWatchLayout.class) {
            if (lifecycleRegistered) {
                return;
            }
            lifecycleRegistered = true;
            app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityCreated(Activity act, Bundle savedInstanceState) {
                    if (isTargetActivity(act)) {
                        currentActivityRef = new WeakReference<>(act);
                    }
                }

                @Override
                public void onActivityStarted(Activity act) {
                    if (isTargetActivity(act)) {
                        currentActivityRef = new WeakReference<>(act);
                        WatchState st = getState(act);
                        st.activityResumed = true;
                        attachAndSchedule(act);
                    }
                }

                @Override
                public void onActivityResumed(Activity act) {
                    if (isTargetActivity(act)) {
                        currentActivityRef = new WeakReference<>(act);
                        WatchState st = getState(act);
                        st.activityResumed = true;
                        attachAndSchedule(act);
                    }
                }

                @Override
                public void onActivityPaused(Activity act) {
                    if (isTargetActivity(act)) {
                        WatchState st;
                        synchronized (STATES) {
                            st = STATES.get(act);
                        }
                        if (st != null) {
                            st.activityResumed = false;
                            stopWatchPolling(st);
                        }
                    }
                }

                @Override
                public void onActivityStopped(Activity act) {
                    if (isTargetActivity(act)) {
                        WatchState st;
                        synchronized (STATES) {
                            st = STATES.get(act);
                        }
                        if (st != null) {
                            st.activityResumed = false;
                            stopWatchPolling(st);
                        }
                    }
                }

                @Override
                public void onActivitySaveInstanceState(Activity act, Bundle outState) {
                }

                @Override
                public void onActivityDestroyed(Activity act) {
                    detachActivity(act);
                }
            });
        }
    }

    private static boolean isTargetActivity(Activity activity) {
        if (activity == null) {
            return false;
        }
        String name = activity.getClass().getName();
        return name.endsWith(".MainActivity")
                || name.endsWith(".WatchWhileActivity")
                || name.contains("watchwhile");
    }

    private static WatchState getState(Activity activity) {
        synchronized (STATES) {
            WatchState s = STATES.get(activity);
            if (s == null) {
                s = new WatchState();
                STATES.put(activity, s);
            }
            return s;
        }
    }

    private static void attachAndSchedule(final Activity activity) {
        if (!enabled || activity == null || activity.isFinishing() || activity.isDestroyed()) {
            return;
        }
        Window window = activity.getWindow();
        if (window == null) {
            return;
        }
        final View decor = window.getDecorView();
        if (decor == null) {
            return;
        }
        final WatchState state = getState(activity);
        installDecorListeners(activity, decor, state);
        if (isTabletLandscape(activity)) {
            startWatchPolling(activity, state);
            scheduleSync(activity, state, 160L);
        }
    }

    private static void installDecorListeners(Activity activity, final View decor, final WatchState state) {
        if (state.listenersInstalled) {
            return;
        }
        final WeakReference<Activity> actRef = new WeakReference<>(activity);
        state.decorLayoutListener = new View.OnLayoutChangeListener() {
            @Override
            public void onLayoutChange(
                    View v,
                    int left, int top, int right, int bottom,
                    int oldLeft, int oldTop, int oldRight, int oldBottom
            ) {
                Activity act = actRef.get();
                if (act == null || act.isFinishing() || act.isDestroyed()) {
                    return;
                }
                if (!isTabletLandscape(act)) {
                    stopWatchPolling(state);
                    teardownWatchOverlay(state);
                    return;
                }
                if (state.activityResumed) {
                    startWatchPolling(act, state);
                }
                if (state.hostView != null && isImeOrDialogActive(act, v)) {
                    return;
                }
                scheduleSync(act, state, 140L);
            }
        };
        decor.addOnLayoutChangeListener(state.decorLayoutListener);

        ViewTreeObserver vto = decor.getViewTreeObserver();
        if (vto != null && vto.isAlive()) {
            state.focusListener = new ViewTreeObserver.OnWindowFocusChangeListener() {
                @Override
                public void onWindowFocusChanged(boolean hasFocus) {
                    if (!hasFocus) {
                        return;
                    }
                    Activity act = actRef.get();
                    if (act == null || act.isFinishing() || act.isDestroyed()) {
                        return;
                    }
                    if (isTabletLandscape(act) && state.activityResumed) {
                        startWatchPolling(act, state);
                        scheduleSync(act, state, 140L);
                    }
                }
            };
            vto.addOnWindowFocusChangeListener(state.focusListener);
        }
        state.listenersInstalled = true;
    }

    private static void startWatchPolling(Activity activity, final WatchState state) {
        if (state == null || state.watchPollRunnable != null || !enabled || !state.activityResumed) {
            return;
        }
        final WeakReference<Activity> actRef = new WeakReference<>(activity);
        state.watchPollRunnable = new Runnable() {
            @Override
            public void run() {
                Activity act = actRef.get();
                if (!enabled || act == null || act.isFinishing() || act.isDestroyed() || !state.activityResumed) {
                    state.watchPollRunnable = null;
                    return;
                }
                if (!isTabletLandscape(act)) {
                    teardownWatchOverlay(state);
                    state.watchPollRunnable = null;
                    return;
                }
                syncTabletWatchLayout(act, state);
                if (state.watchPollRunnable == this && state.activityResumed) {
                    MAIN_HANDLER.postDelayed(this, state.hostView != null ? 900L : 650L);
                }
            }
        };
        MAIN_HANDLER.postDelayed(state.watchPollRunnable, 550L);
    }

    private static void stopWatchPolling(WatchState state) {
        if (state != null && state.watchPollRunnable != null) {
            MAIN_HANDLER.removeCallbacks(state.watchPollRunnable);
            state.watchPollRunnable = null;
        }
    }

    private static void detachActivity(Activity activity) {
        if (activity == null) {
            return;
        }
        WatchState state;
        synchronized (STATES) {
            state = STATES.remove(activity);
        }
        if (state == null) {
            return;
        }
        state.activityResumed = false;
        stopWatchPolling(state);
        cancelCallbacks(state);
        teardownWatchOverlay(state);
        try {
            Window w = activity.getWindow();
            View decor = w != null ? w.peekDecorView() : null;
            if (decor != null) {
                if (state.decorLayoutListener != null) {
                    decor.removeOnLayoutChangeListener(state.decorLayoutListener);
                }
                ViewTreeObserver vto = decor.getViewTreeObserver();
                if (vto != null && vto.isAlive() && state.focusListener != null) {
                    vto.removeOnWindowFocusChangeListener(state.focusListener);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void cancelCallbacks(WatchState state) {
        if (state == null) {
            return;
        }
        if (state.syncRunnable != null) {
            MAIN_HANDLER.removeCallbacks(state.syncRunnable);
            state.syncRunnable = null;
        }
        if (state.retryCommentsRunnable != null) {
            MAIN_HANDLER.removeCallbacks(state.retryCommentsRunnable);
            state.retryCommentsRunnable = null;
        }
        if (state.headerRefreshRunnable != null) {
            MAIN_HANDLER.removeCallbacks(state.headerRefreshRunnable);
            state.headerRefreshRunnable = null;
        }
    }

    private static void scheduleSync(Activity activity, final WatchState state, long delayMs) {
        if (state.syncRunnable != null) {
            MAIN_HANDLER.removeCallbacks(state.syncRunnable);
        }
        final WeakReference<Activity> actRef = new WeakReference<>(activity);
        state.syncRunnable = new Runnable() {
            @Override
            public void run() {
                Activity act = actRef.get();
                if (act == null || act.isFinishing() || act.isDestroyed()) {
                    return;
                }
                syncTabletWatchLayout(act, state);
            }
        };
        MAIN_HANDLER.postDelayed(state.syncRunnable, delayMs);
    }

    // -------------------------------------------------------------------------
    // Tablet landscape detection & core synchronization
    // -------------------------------------------------------------------------

    private static boolean isTabletLandscape(Activity activity) {
        if (activity == null) {
            return false;
        }
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O && activity.isInPictureInPictureMode()) {
                return false;
            }
            Resources res = activity.getResources();
            if (res == null) {
                return false;
            }
            Configuration cfg = res.getConfiguration();
            DisplayMetrics dm = res.getDisplayMetrics();
            if (cfg == null || dm == null || dm.density <= 0f) {
                return false;
            }
            boolean landscape = cfg.orientation == Configuration.ORIENTATION_LANDSCAPE
                    || dm.widthPixels > dm.heightPixels;
            if (!landscape) {
                return false;
            }
            float minDimDp = Math.min(dm.widthPixels, dm.heightPixels) / dm.density;
            int swDp = cfg.smallestScreenWidthDp > 0 ? cfg.smallestScreenWidthDp : Math.round(minDimDp);
            float widthDp = dm.widthPixels / dm.density;
            return swDp >= 580 || widthDp >= 840f;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void syncTabletWatchLayout(Activity activity, WatchState state) {
        if (!enabled || activity == null || activity.isFinishing() || activity.isDestroyed()) {
            return;
        }
        if (!isTabletLandscape(activity)) {
            teardownWatchOverlay(state);
            return;
        }
        Window window = activity.getWindow();
        if (window == null) {
            return;
        }
        View rawContent = window.findViewById(android.R.id.content);
        if (!(rawContent instanceof FrameLayout)) {
            return;
        }
        FrameLayout contentRoot = (FrameLayout) rawContent;
        // Never tear down an active overlay while user is typing in the comment composer / soft keyboard or viewing a modal dialog.
        if (state.hostView != null && isImeOrDialogActive(activity, contentRoot)) {
            return;
        }
        int screenW = contentRoot.getWidth();
        int screenH = contentRoot.getHeight();
        if (screenW <= 0 || screenH <= 0) {
            return;
        }
        Resources res = activity.getResources();

        // 1. Collect all visible RecyclerViews outside our host to locate leftWatchRv & right-column Related Videos.
        ArrayList<ViewGroup> allRvs = new ArrayList<>(10);
        collectVisibleRecyclerViews(contentRoot, 0, allRvs);

        ViewGroup leftWatchRv = findLeftWatchRecyclerView(allRvs, screenW, screenH, res);
        if (leftWatchRv == null) {
            teardownWatchOverlay(state);
            return;
        }

        // Verify a right-column companion list exists (confirms two-column tablet watch screen, not browse/settings).
        boolean hasRightColumn = false;
        int[] loc = new int[2];
        for (int i = 0; i < allRvs.size(); i++) {
            ViewGroup rv = allRvs.get(i);
            if (rv == leftWatchRv || !rv.isShown()) {
                continue;
            }
            rv.getLocationInWindow(loc);
            if (loc[0] >= (int) (screenW * 0.48f) && rv.getWidth() >= (int) (screenW * 0.18f)
                    && rv.getHeight() >= (int) (screenH * 0.35f)) {
                hasRightColumn = true;
                if (!hasValidDockedComments(state)
                        && (SystemClock.uptimeMillis() - state.lastCommentsAutoClickMs) > 4000L) {
                    // Snapshot Related Videos RecyclerView before auto-opening Comments.
                    state.preExistingRightRvs.put(rv, Boolean.TRUE);
                }
            }
        }
        if (!hasRightColumn && !hasValidDockedComments(state)) {
            teardownWatchOverlay(state);
            return;
        }

        // 2. Semantically identify Title, Channel, Actions row/scroller, and verified Comments teaser inside leftWatchRv.
        WatchMetaItems items = parseWatchMetaItemsSemantically(leftWatchRv, res);
        if (items == null || items.titleItem == null || items.actionsItem == null) {
            // Still binding metadata or user scrolled away; don't thrash existing host if same RV.
            if (state.hostView != null && state.leftWatchRvRef.get() != leftWatchRv) {
                teardownWatchOverlay(state);
            }
            return;
        }

        attachLeftWatchObserver(activity, leftWatchRv, state);

        // 3. Mount UnifiedWatchScrollHost on android.R.id.content (NEVER inside NextGenWatchLayout!).
        UnifiedWatchScrollHost host = ensureContentOverlayHost(activity, contentRoot, leftWatchRv, state);
        if (host == null) {
            return;
        }
        syncHostBoundsToLeftWatchRv(host, contentRoot, leftWatchRv);

        // 4. Bind or refresh merged header ONLY when the video changes or bound views detach (zero mid-tap rebuilds!).
        String sig = extractTitleSignature(items.titleItem, items.channelItem);
        boolean videoChanged = !sig.isEmpty() && !sig.equals(state.lastVideoSignature);
        boolean needsBind = videoChanged
                || !host.hasHeaderContent()
                || !host.areBoundTargetsAttached()
                || items.titleItem != state.titleItemRef.get()
                || items.actionsItem != state.actionsItemRef.get();

        state.titleItemRef = new WeakReference<>(items.titleItem);
        state.channelItemRef = new WeakReference<>(items.channelItem);
        state.actionsItemRef = new WeakReference<>(items.actionsItem);
        state.commentsTeaserRef = new WeakReference<>(items.commentsTeaserItem);

        if (videoChanged) {
            state.lastVideoSignature = sig;
            state.commentsDockRetries = 0;
            host.resetScrollPosition();
            // Return previous video's docked panel cleanly so the new video's comments load fresh.
            if (state.dockedPanelRootRef.get() != null) {
                undockCommentsPanel(state);
            }
        }

        if (needsBind) {
            host.bindHeader(
                    activity,
                    items,
                    new Runnable() {
                        @Override
                        public void run() {
                            onCommentButtonClicked(activity, state);
                        }
                    }
            );
            scheduleHeaderVisualRefresh(activity, state);
        } else {
            host.refreshHeaderVisuals();
        }

        // 5. Ensure non-Comments panels (Description / Ask / Chapters) remain visible on the right column if opened.
        checkWrapperForNonCommentsPanel(state);

        // 6. Auto-open Comments ONLY ONCE per video using the strictly verified Comments teaser, then dock it.
        if (!hasValidDockedComments(state)) {
            if (!tryDockLiveCommentsPanel(contentRoot, allRvs, screenW, screenH, state, host)) {
                if (items.commentsTeaserItem != null
                        && !sig.isEmpty()
                        && !sig.equals(state.lastAutoOpenedSignature)) {
                    state.lastAutoOpenedSignature = sig;
                    state.lastCommentsAutoClickMs = SystemClock.uptimeMillis();
                    state.commentsDockRetries = 0;
                    clickViewDirect(items.commentsTeaserItem);
                    scheduleCommentsDockRetry(activity, state, 300L);
                }
            }
        } else {
            host.setCommentsBodyView(
                    state.dockedPanelRootRef.get(),
                    state.dockedCommentsRvRef.get()
            );
        }
    }

    private static void scheduleCommentsDockRetry(Activity activity, final WatchState state, long delayMs) {
        if (state.retryCommentsRunnable != null) {
            MAIN_HANDLER.removeCallbacks(state.retryCommentsRunnable);
        }
        final WeakReference<Activity> actRef = new WeakReference<>(activity);
        state.retryCommentsRunnable = new Runnable() {
            @Override
            public void run() {
                Activity act = actRef.get();
                if (act == null || act.isFinishing() || act.isDestroyed() || !isTabletLandscape(act)) {
                    return;
                }
                Window w = act.getWindow();
                View rawContent = w != null ? w.findViewById(android.R.id.content) : null;
                if (!(rawContent instanceof FrameLayout) || state.hostView == null) {
                    return;
                }
                FrameLayout contentRoot = (FrameLayout) rawContent;
                ArrayList<ViewGroup> allRvs = new ArrayList<>(8);
                collectVisibleRecyclerViews(contentRoot, 0, allRvs);
                boolean docked = tryDockLiveCommentsPanel(
                        contentRoot, allRvs, contentRoot.getWidth(), contentRoot.getHeight(), state, state.hostView
                );
                if (!docked && state.commentsDockRetries < 7) {
                    state.commentsDockRetries++;
                    MAIN_HANDLER.postDelayed(this, 350L);
                }
            }
        };
        MAIN_HANDLER.postDelayed(state.retryCommentsRunnable, delayMs);
    }

    private static void scheduleHeaderVisualRefresh(Activity activity, final WatchState state) {
        if (state.headerRefreshRunnable != null) {
            MAIN_HANDLER.removeCallbacks(state.headerRefreshRunnable);
        }
        final WeakReference<Activity> actRef = new WeakReference<>(activity);
        state.headerRefreshRunnable = new Runnable() {
            @Override
            public void run() {
                Activity act = actRef.get();
                if (act == null || act.isFinishing() || act.isDestroyed() || state.hostView == null) {
                    return;
                }
                state.hostView.refreshHeaderVisuals();
            }
        };
        MAIN_HANDLER.postDelayed(state.headerRefreshRunnable, 450L);
        MAIN_HANDLER.postDelayed(state.headerRefreshRunnable, 1100L);
    }

    private static void attachLeftWatchObserver(final Activity activity, ViewGroup leftWatchRv, final WatchState state) {
        ViewGroup prevRv = state.leftWatchRvRef.get();
        if (prevRv == leftWatchRv) {
            return;
        }
        if (prevRv != null && state.leftWatchRvListener != null) {
            try {
                prevRv.removeOnLayoutChangeListener(state.leftWatchRvListener);
            } catch (Throwable ignored) {
            }
        }
        final WeakReference<Activity> actRef = new WeakReference<>(activity);
        state.leftWatchRvListener = new View.OnLayoutChangeListener() {
            @Override
            public void onLayoutChange(
                    View v,
                    int left, int top, int right, int bottom,
                    int oldLeft, int oldTop, int oldRight, int oldBottom
            ) {
                Activity act = actRef.get();
                if (act == null || act.isFinishing() || act.isDestroyed()) {
                    return;
                }
                Window w = act.getWindow();
                View rawContent = w != null ? w.findViewById(android.R.id.content) : null;
                if (rawContent instanceof FrameLayout && state.hostView != null && v instanceof ViewGroup) {
                    syncHostBoundsToLeftWatchRv(state.hostView, (FrameLayout) rawContent, (ViewGroup) v);
                }
                scheduleSync(act, state, 140L);
            }
        };
        leftWatchRv.addOnLayoutChangeListener(state.leftWatchRvListener);
        state.leftWatchRvRef = new WeakReference<>(leftWatchRv);
    }

    private static UnifiedWatchScrollHost ensureContentOverlayHost(
            Activity activity,
            FrameLayout contentRoot,
            ViewGroup leftWatchRv,
            WatchState state
    ) {
        UnifiedWatchScrollHost host = state.hostView;
        if (host != null && host.getParent() == contentRoot && host.isAttachedToWindow()) {
            return host;
        }
        if (host != null && host.getParent() instanceof ViewGroup) {
            ((ViewGroup) host.getParent()).removeView(host);
        }

        host = new UnifiedWatchScrollHost(activity);
        host.setTag(HOST_TAG);
        host.setBackgroundColor(resolveWatchSurfaceColor(activity, leftWatchRv));

        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                Math.max(1, leftWatchRv.getWidth()),
                Math.max(1, leftWatchRv.getHeight()),
                Gravity.TOP | Gravity.START
        );
        contentRoot.addView(host, lp);
        state.hostView = host;
        return host;
    }

    private static void syncHostBoundsToLeftWatchRv(
            UnifiedWatchScrollHost host,
            FrameLayout contentRoot,
            ViewGroup leftWatchRv
    ) {
        if (host == null || contentRoot == null || leftWatchRv == null) {
            return;
        }
        int tw = leftWatchRv.getWidth();
        int th = leftWatchRv.getHeight();
        if (tw <= 0 || th <= 0 || !leftWatchRv.isShown()
                || getEffectiveAlpha(leftWatchRv) < 0.85f
                || Math.abs(leftWatchRv.getTranslationY()) > dpToPx(host.getResources(), 60)) {
            if (host.getVisibility() != View.GONE) {
                host.setVisibility(View.GONE);
            }
            return;
        }
        int[] contentLoc = new int[2];
        int[] rvLoc = new int[2];
        contentRoot.getLocationInWindow(contentLoc);
        leftWatchRv.getLocationInWindow(rvLoc);

        int relX = rvLoc[0] - contentLoc[0];
        int relY = rvLoc[1] - contentLoc[1];

        // Hide immediately if leftWatchRv slid off-screen (minimizing to miniplayer or entering fullscreen).
        if (relY < dpToPx(host.getResources(), 100) || relY > contentRoot.getHeight() - dpToPx(host.getResources(), 80)) {
            if (host.getVisibility() != View.GONE) {
                host.setVisibility(View.GONE);
            }
            return;
        }

        if (host.getVisibility() != View.VISIBLE) {
            host.setVisibility(View.VISIBLE);
        }

        ViewGroup.LayoutParams lp = host.getLayoutParams();
        if (lp instanceof FrameLayout.LayoutParams) {
            FrameLayout.LayoutParams flp = (FrameLayout.LayoutParams) lp;
            if (flp.width != tw || flp.height != th || flp.leftMargin != relX || flp.topMargin != relY) {
                flp.width = tw;
                flp.height = th;
                flp.leftMargin = relX;
                flp.topMargin = relY;
                host.setLayoutParams(flp);
            }
        }
    }

    private static void teardownWatchOverlay(WatchState state) {
        if (state == null) {
            return;
        }
        cancelCallbacks(state);
        undockCommentsPanel(state);

        if (state.hostView != null) {
            try {
                ViewParent p = state.hostView.getParent();
                if (p instanceof ViewGroup) {
                    ((ViewGroup) p).removeView(state.hostView);
                }
            } catch (Throwable ignored) {
            }
            state.hostView = null;
        }
        ViewGroup prevRv = state.leftWatchRvRef.get();
        if (prevRv != null && state.leftWatchRvListener != null) {
            try {
                prevRv.removeOnLayoutChangeListener(state.leftWatchRvListener);
            } catch (Throwable ignored) {
            }
        }
        state.leftWatchRvRef = new WeakReference<>(null);
        state.preExistingRightRvs.clear();
        state.lastVideoSignature = "";
        state.lastAutoOpenedSignature = "";
        state.commentsDockRetries = 0;
    }

    // -------------------------------------------------------------------------
    // Semantic Watch Metadata Discovery (zero blind child-index guessing!)
    // -------------------------------------------------------------------------

    private static ViewGroup findLeftWatchRecyclerView(
            ArrayList<ViewGroup> allRvs,
            int screenW,
            int screenH,
            Resources res
    ) {
        int minHeightPx = dpToPx(res, 110);
        int minPlayerTopPx = Math.max(dpToPx(res, 150), (int) (screenH * 0.22f));
        int maxTopPx = (int) (screenH * 0.80f);
        int[] loc = new int[2];

        ViewGroup best = null;
        int bestScore = -1;

        for (int i = 0; i < allRvs.size(); i++) {
            ViewGroup rv = allRvs.get(i);
            if (rv == null || !rv.isShown() || rv.getChildCount() < 1) {
                continue;
            }
            int w = rv.getWidth();
            int h = rv.getHeight();
            if (w < (int) (screenW * 0.45f) || w > (int) (screenW * 0.84f) || h < minHeightPx) {
                continue;
            }
            rv.getLocationInWindow(loc);
            int x = loc[0];
            int y = loc[1];
            if (x > (int) (screenW * 0.14f) || y < minPlayerTopPx || y > maxTopPx) {
                continue;
            }
            int score = 10;
            if (findHorizontalActionScroller(rv, res, 0) != null) {
                score += 100;
            }
            if (score > bestScore) {
                bestScore = score;
                best = rv;
            }
        }
        return best;
    }

    private static void collectVisibleRecyclerViews(View node, int depth, ArrayList<ViewGroup> out) {
        if (node == null || depth > 32 || !node.isShown()) {
            return;
        }
        if (HOST_TAG.equals(node.getTag())) {
            return;
        }
        if (node instanceof ViewGroup) {
            if (isRecyclerView(node)) {
                out.add((ViewGroup) node);
            }
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                collectVisibleRecyclerViews(vg.getChildAt(i), depth + 1, out);
            }
        }
    }

    private static final class WatchMetaItems {
        View titleItem;
        View channelItem;
        View actionsItem;
        ViewGroup actionsScroller; // Optional; may equal actionsItem (or inner scroller) on Litho bars.
        View commentsTeaserItem;   // Strictly verified to be Comments teaser (nullable).
    }

    private static WatchMetaItems parseWatchMetaItemsSemantically(ViewGroup leftWatchRv, Resources res) {
        ArrayList<View> sorted = collectVerticalMetadataRows(leftWatchRv, res);
        if (sorted.size() < 2) {
            return null;
        }

        // 1. Identify the Actions row via EITHER a horizontal scroller OR semantic action keywords
        //    ("share", "like", "dislike", "save", "download", "ask", "report") — works on ALL Litho versions!
        int actionsIdx = -1;
        ViewGroup actionsScroller = null;
        for (int i = 0; i < Math.min(sorted.size(), 6); i++) {
            View item = sorted.get(i);
            ViewGroup scroller = findHorizontalActionScroller(item, res, 0);
            if (scroller != null) {
                actionsIdx = i;
                actionsScroller = scroller;
                break;
            }
        }
        if (actionsIdx < 0) {
            for (int i = 1; i < Math.min(sorted.size(), 6); i++) {
                View item = sorted.get(i);
                if (isSemanticActionButtonsRow(item, res)) {
                    actionsIdx = i;
                    actionsScroller = (item instanceof ViewGroup) ? (ViewGroup) item : null;
                    break;
                }
            }
        }
        if (actionsIdx < 0) {
            return null;
        }

        WatchMetaItems out = new WatchMetaItems();
        out.actionsItem = sorted.get(actionsIdx);
        out.actionsScroller = actionsScroller != null
                ? actionsScroller
                : (out.actionsItem instanceof ViewGroup ? (ViewGroup) out.actionsItem : null);
        out.titleItem = sorted.get(0);

        // 2. Identify the Channel row (row immediately above actionsItem when actionsIdx >= 2,
        //    or scan rows [1..actionsIdx-1] for channel/subscribe semantics).
        if (actionsIdx >= 2) {
            out.channelItem = sorted.get(actionsIdx - 1);
        } else {
            out.channelItem = null;
        }

        // 3. Strictly verify the Comments teaser below actionsItem — NEVER guess blindly!
        for (int i = actionsIdx + 1; i < Math.min(sorted.size(), actionsIdx + 5); i++) {
            View candidate = sorted.get(i);
            if (isVerifiedCommentsTeaser(candidate)) {
                out.commentsTeaserItem = candidate;
                break;
            }
        }
        return out;
    }

    private static ArrayList<View> collectVerticalMetadataRows(ViewGroup leftWatchRv, Resources res) {
        int minH = dpToPx(res, 16);
        ArrayList<View> sorted = new ArrayList<>(Math.max(4, leftWatchRv.getChildCount()));
        int count = leftWatchRv.getChildCount();
        for (int i = 0; i < count; i++) {
            View c = leftWatchRv.getChildAt(i);
            if (c != null && c.getVisibility() == View.VISIBLE && c.getHeight() > minH) {
                sorted.add(c);
            }
        }
        // If leftWatchRv wraps all metadata items inside a single outer container, unwrap one level.
        if (sorted.size() == 1 && sorted.get(0) instanceof ViewGroup) {
            ViewGroup single = (ViewGroup) sorted.get(0);
            ArrayList<View> inner = new ArrayList<>(single.getChildCount());
            for (int i = 0; i < single.getChildCount(); i++) {
                View c = single.getChildAt(i);
                if (c != null && c.getVisibility() == View.VISIBLE && c.getHeight() > minH) {
                    inner.add(c);
                }
            }
            if (inner.size() >= 2) {
                sorted = inner;
            }
        }
        Collections.sort(sorted, new Comparator<View>() {
            @Override
            public int compare(View a, View b) {
                return Integer.compare(a.getTop(), b.getTop());
            }
        });
        return sorted;
    }

    private static boolean isSemanticActionButtonsRow(View item, Resources res) {
        if (item == null || !item.isShown()) {
            return false;
        }
        int h = item.getHeight();
        if (h < dpToPx(res, 24) || h > dpToPx(res, 110)) {
            return false;
        }
        StringBuilder sb = new StringBuilder();
        collectTextSnippet(item, 0, sb, 220);
        String text = sb.toString().toLowerCase(Locale.US);
        if (text.contains("comments") || text.contains("subscribe") || text.contains("unsubscribe")) {
            return false;
        }
        int hits = 0;
        if (text.contains("share")) hits++;
        if (text.contains("like")) hits++;
        if (text.contains("dislike")) hits++;
        if (text.contains("save")) hits++;
        if (text.contains("download")) hits++;
        if (text.contains("report")) hits++;
        if (text.contains("ask")) hits++;
        if (text.contains("remix") || text.contains("clip") || text.contains("thanks")) hits++;
        return hits >= 2;
    }

    private static ViewGroup findHorizontalActionScroller(View node, Resources res, int depth) {
        if (node == null || depth > 10 || !node.isShown()) {
            return null;
        }
        int minH = dpToPx(res, 24);
        int maxH = dpToPx(res, 96);
        if (node instanceof HorizontalScrollView) {
            int w = node.getWidth();
            int h = node.getHeight();
            if (w > dpToPx(res, 160) && h >= minH && h <= maxH) {
                return (ViewGroup) node;
            }
        }
        if (node instanceof ViewGroup && isRecyclerView(node)) {
            int w = node.getWidth();
            int h = node.getHeight();
            if (w > dpToPx(res, 160) && h >= minH && h <= maxH && w >= h * 2
                    && ((ViewGroup) node).getChildCount() >= 2) {
                return (ViewGroup) node;
            }
        }
        if (node instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                ViewGroup found = findHorizontalActionScroller(vg.getChildAt(i), res, depth + 1);
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }

    /**
     * Positively verifies a watch item is the Comments teaser card (never a channel card or sponsor card).
     */
    private static boolean isVerifiedCommentsTeaser(View item) {
        if (item == null || !item.isShown()) {
            return false;
        }
        StringBuilder sb = new StringBuilder();
        collectTextSnippet(item, 0, sb, 180);
        String text = sb.toString().toLowerCase(Locale.US);
        if (text.contains("subscribe") || text.contains("unsubscribe")) {
            return false;
        }
        return text.contains("comment") || hasCommentResourceName(item, 0);
    }

    private static String extractTitleSignature(View titleItem, View channelItem) {
        StringBuilder sb = new StringBuilder();
        collectTextSnippet(titleItem, 0, sb, 64);
        sb.append('|');
        collectTextSnippet(channelItem, 0, sb, 32);
        return sb.toString();
    }

    private static void collectTextSnippet(View node, int depth, StringBuilder sb, int maxLen) {
        if (node == null || depth > 8 || sb.length() >= maxLen) {
            return;
        }
        boolean foundDirect = false;
        if (node instanceof TextView) {
            CharSequence t = ((TextView) node).getText();
            if (t != null && t.length() > 0) {
                sb.append(t, 0, Math.min(t.length(), maxLen - sb.length())).append(' ');
                foundDirect = true;
            }
        }
        CharSequence cd = node.getContentDescription();
        if (cd != null && cd.length() > 0 && sb.length() < maxLen) {
            sb.append(cd, 0, Math.min(cd.length(), maxLen - sb.length())).append(' ');
            foundDirect = true;
        }
        // Litho ComponentHost renders text via TextDrawable (not TextView); read AccessibilityNodeInfo fallback!
        if (!foundDirect && sb.length() < maxLen) {
            appendAccessibilityText(node, sb, maxLen);
        }
        if (node instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count && sb.length() < maxLen; i++) {
                collectTextSnippet(vg.getChildAt(i), depth + 1, sb, maxLen);
            }
        }
    }

    private static void appendAccessibilityText(View node, StringBuilder sb, int maxLen) {
        AccessibilityNodeInfo info = null;
        try {
            info = node.createAccessibilityNodeInfo();
            if (info == null) {
                return;
            }
            CharSequence t = info.getText();
            if (t != null && t.length() > 0 && sb.length() < maxLen) {
                sb.append(t, 0, Math.min(t.length(), maxLen - sb.length())).append(' ');
            }
            CharSequence d = info.getContentDescription();
            if (d != null && d.length() > 0 && sb.length() < maxLen) {
                sb.append(d, 0, Math.min(d.length(), maxLen - sb.length())).append(' ');
            }
        } catch (Throwable ignored) {
        } finally {
            if (info != null) {
                try {
                    info.recycle();
                } catch (Throwable ignored) {
                }
            }
        }
    }

    // -------------------------------------------------------------------------
    // Docking YouTube's live Comments Engagement Panel (obfuscation-proof!)
    // -------------------------------------------------------------------------

    private static boolean hasValidDockedComments(WatchState state) {
        View panel = state.dockedPanelRootRef.get();
        View rv = state.dockedCommentsRvRef.get();
        return panel != null && panel.isAttachedToWindow()
                && panel.getVisibility() == View.VISIBLE
                && rv != null && rv.isAttachedToWindow()
                && rv.getVisibility() == View.VISIBLE
                && state.hostView != null
                && isDescendantOf(panel, state.hostView);
    }

    private static boolean tryDockLiveCommentsPanel(
            FrameLayout contentRoot,
            ArrayList<ViewGroup> allRvs,
            int screenW,
            int screenH,
            final WatchState state,
            UnifiedWatchScrollHost host
    ) {
        if (contentRoot == null || host == null) {
            return false;
        }
        ViewGroup leftWatchRv = state.leftWatchRvRef.get();
        CommentsPanelMatch match = findCommentsPanelByDiff(allRvs, leftWatchRv, screenW, screenH, state);
        if (match == null || match.panelRoot == null || match.commentsRv == null) {
            return false;
        }

        ViewParent origParent = match.panelRoot.getParent();
        if (!(origParent instanceof ViewGroup)) {
            return false;
        }
        ViewGroup origParentGroup = (ViewGroup) origParent;

        // Safety check: NEVER reparent anything that contains leftWatchRv, Related Videos, or our host.
        if (isAncestorOf(match.panelRoot, leftWatchRv) || isAncestorOf(match.panelRoot, host)) {
            return false;
        }
        for (ViewGroup relRv : state.preExistingRightRvs.keySet()) {
            if (relRv != null && isAncestorOf(match.panelRoot, relRv)) {
                return false;
            }
        }

        undockCommentsPanel(state);

        int origIndex = origParentGroup.indexOfChild(match.panelRoot);
        ViewGroup.LayoutParams origLp = match.panelRoot.getLayoutParams();

        state.engagementWrapperRef = new WeakReference<>(match.wrapperToHide);
        state.dockedPanelOriginalParentRef = new WeakReference<>(origParentGroup);
        state.dockedPanelOriginalIndex = origIndex;
        state.dockedPanelOriginalLp = origLp;
        state.dockedPanelRootRef = new WeakReference<>(match.panelRoot);
        state.dockedCommentsRvRef = new WeakReference<>(match.commentsRv);
        state.dockedCommentComposerRef = new WeakReference<>(match.composerView);

        if (match.headerToHide != null && match.headerToHide != match.commentsRv) {
            state.hiddenPanelHeaderRef = new WeakReference<>(match.headerToHide);
            state.hiddenPanelHeaderPrevVis = match.headerToHide.getVisibility();
            match.headerToHide.setVisibility(View.GONE);
        }

        if (match.composerView != null && match.composerView != match.commentsRv) {
            collapseComposerVisually(match.composerView, state);
        }

        try {
            match.panelRoot.animate().cancel();
            match.panelRoot.setTranslationX(0f);
            match.panelRoot.setTranslationY(0f);
            match.panelRoot.setScaleX(1f);
            match.panelRoot.setScaleY(1f);
            match.panelRoot.setAlpha(1f);
            origParentGroup.removeView(match.panelRoot);
            host.setCommentsBodyView(match.panelRoot, match.commentsRv);

            if (match.wrapperToHide != null
                    && !isAncestorOf(match.wrapperToHide, host)
                    && !isAncestorOf(match.wrapperToHide, leftWatchRv)) {
                boolean wrapperOwnsRelated = false;
                for (ViewGroup relRv : state.preExistingRightRvs.keySet()) {
                    if (relRv != null && isAncestorOf(match.wrapperToHide, relRv)) {
                        wrapperOwnsRelated = true;
                        break;
                    }
                }
                if (!wrapperOwnsRelated) {
                    state.wrapperPrevVisibility = match.wrapperToHide.getVisibility();
                    match.wrapperToHide.setVisibility(View.INVISIBLE);
                    state.wrapperHiddenByUs = true;
                    attachWrapperMonitor(match.wrapperToHide, state);
                }
            }
            return true;
        } catch (Throwable ignored) {
            undockCommentsPanel(state);
            return false;
        }
    }

    private static final class CommentsPanelMatch {
        ViewGroup wrapperToHide;
        View panelRoot;
        View commentsRv;
        View headerToHide;
        View composerView;
    }

    /**
     * Finds the live Comments Engagement Panel without depending on obfuscated class names:
     * looks for a visible vertical RecyclerView that is NOT leftWatchRv and NOT a pre-existing
     * Related Videos RecyclerView, then walks up to the panel root right below the shared watch ancestor.
     */
    private static CommentsPanelMatch findCommentsPanelByDiff(
            ArrayList<ViewGroup> allRvs,
            ViewGroup leftWatchRv,
            int screenW,
            int screenH,
            WatchState state
    ) {
        int[] loc = new int[2];
        boolean recentlyAutoOpened = (SystemClock.uptimeMillis() - state.lastCommentsAutoClickMs) < 4500L;

        for (int i = 0; i < allRvs.size(); i++) {
            ViewGroup rv = allRvs.get(i);
            if (rv == null || rv == leftWatchRv || !rv.isShown() || isInsideOurHost(rv)) {
                continue;
            }
            if (Boolean.TRUE.equals(state.preExistingRightRvs.get(rv))) {
                continue;
            }
            // Must be a vertical scrollable comments list of reasonable size (not a horizontal chip/button bar).
            int w = rv.getWidth();
            int h = rv.getHeight();
            if (w < (int) (screenW * 0.18f) || h < (int) (screenH * 0.25f) || w > h * 3) {
                continue;
            }

            // Walk up to find the panel root right below the common ancestor with leftWatchRv / Related Videos.
            View panelRoot = findIsolatedPanelRoot(rv, leftWatchRv, state);
            if (panelRoot == null || panelRoot == rv) {
                continue;
            }

            // Never steal Description / Ask / Chapters / Transcript / Live Chat panels.
            if (hasNonCommentsHeaderTitle(panelRoot, 0)) {
                continue;
            }

            View composer = findCommentComposerView(panelRoot, rv, 0);
            boolean confirmedComments = composer != null
                    || hasCommentsHeaderTitle(panelRoot, 0)
                    || hasCommentResourceName(panelRoot, 0);

            if (!confirmedComments && recentlyAutoOpened) {
                panelRoot.getLocationInWindow(loc);
                if (loc[0] >= (int) (screenW * 0.35f)) {
                    confirmedComments = true;
                }
            }
            if (!confirmedComments) {
                continue;
            }

            CommentsPanelMatch m = new CommentsPanelMatch();
            m.commentsRv = rv;
            m.composerView = composer;
            m.panelRoot = panelRoot;
            m.wrapperToHide = resolveSafeWrapperToHide(panelRoot, leftWatchRv, state);
            m.headerToHide = findPanelHeaderBar(panelRoot, rv);
            return m;
        }
        return null;
    }

    /**
     * Walks upward from commentsRv to find the highest View container that does NOT contain
     * leftWatchRv or any Related Videos RecyclerView, then steps down 1 level if its parent is an
     * EngagementPanel wrapper so YouTube's wrapper stays attached for Description/Ask.
     */
    private static View findIsolatedPanelRoot(View commentsRv, ViewGroup leftWatchRv, WatchState state) {
        View highestIsolated = commentsRv;
        View secondHighest = commentsRv;
        ViewParent p = commentsRv.getParent();
        int steps = 0;

        while (p instanceof ViewGroup && steps < 12) {
            ViewGroup vg = (ViewGroup) p;
            if (vg.getId() == android.R.id.content) {
                break;
            }
            if (leftWatchRv != null && isAncestorOf(vg, leftWatchRv)) {
                break;
            }
            boolean touchesRelated = false;
            for (ViewGroup relRv : state.preExistingRightRvs.keySet()) {
                if (relRv != null && isAncestorOf(vg, relRv)) {
                    touchesRelated = true;
                    break;
                }
            }
            if (touchesRelated) {
                break;
            }
            secondHighest = highestIsolated;
            highestIsolated = vg;
            p = vg.getParent();
            steps++;
        }

        // Prefer secondHighest if highestIsolated is an outer wrapper holding only 1 active panel,
        // so YouTube can still inflate Description/Ask into highestIsolated later.
        if (secondHighest != commentsRv && secondHighest.getParent() == highestIsolated) {
            return secondHighest;
        }
        return highestIsolated;
    }

    private static ViewGroup resolveSafeWrapperToHide(View panelRoot, ViewGroup leftWatchRv, WatchState state) {
        ViewParent p = panelRoot.getParent();
        if (!(p instanceof ViewGroup)) {
            return null;
        }
        ViewGroup vg = (ViewGroup) p;
        if (vg.getId() == android.R.id.content || isAncestorOf(vg, leftWatchRv)) {
            return null;
        }
        for (ViewGroup relRv : state.preExistingRightRvs.keySet()) {
            if (relRv != null && isAncestorOf(vg, relRv)) {
                return null;
            }
        }
        return vg;
    }

    private static void attachWrapperMonitor(final ViewGroup wrapper, final WatchState state) {
        if (wrapper == null) {
            return;
        }
        if (state.wrapperMonitorListener != null) {
            try {
                wrapper.removeOnLayoutChangeListener(state.wrapperMonitorListener);
            } catch (Throwable ignored) {
            }
        }
        state.wrapperMonitorListener = new View.OnLayoutChangeListener() {
            @Override
            public void onLayoutChange(
                    View v,
                    int left, int top, int right, int bottom,
                    int oldLeft, int oldTop, int oldRight, int oldBottom
            ) {
                checkWrapperForNonCommentsPanel(state);
            }
        };
        wrapper.addOnLayoutChangeListener(state.wrapperMonitorListener);
    }

    private static void checkWrapperForNonCommentsPanel(WatchState state) {
        ViewGroup wrapper = state.engagementWrapperRef.get();
        if (wrapper == null || !state.wrapperHiddenByUs) {
            return;
        }
        boolean hasOtherActiveChild = false;
        int count = wrapper.getChildCount();
        for (int i = 0; i < count; i++) {
            View child = wrapper.getChildAt(i);
            if (child != null && child.getVisibility() == View.VISIBLE && child.getWidth() > 0 && child.getHeight() > 40) {
                if (hasNonCommentsHeaderTitle(child, 0) || hasVisibleContentChildren(child)) {
                    hasOtherActiveChild = true;
                    break;
                }
            }
        }
        int targetVis = hasOtherActiveChild ? View.VISIBLE : View.INVISIBLE;
        if (wrapper.getVisibility() != targetVis) {
            wrapper.setVisibility(targetVis);
        }
    }

    private static boolean hasVisibleContentChildren(View v) {
        if (!(v instanceof ViewGroup)) {
            return false;
        }
        ViewGroup vg = (ViewGroup) v;
        for (int i = 0; i < vg.getChildCount(); i++) {
            View c = vg.getChildAt(i);
            if (c != null && c.getVisibility() == View.VISIBLE && c.getHeight() > 40) {
                return true;
            }
        }
        return false;
    }

    private static void undockCommentsPanel(WatchState state) {
        if (state == null) {
            return;
        }
        View hiddenHeader = state.hiddenPanelHeaderRef.get();
        if (hiddenHeader != null) {
            try {
                hiddenHeader.setVisibility(state.hiddenPanelHeaderPrevVis);
            } catch (Throwable ignored) {
            }
            state.hiddenPanelHeaderRef = new WeakReference<>(null);
        }

        View composer = state.dockedCommentComposerRef.get();
        if (composer != null) {
            restoreComposerVisually(composer, state);
        }

        View panelRoot = state.dockedPanelRootRef.get();
        ViewGroup origParent = state.dockedPanelOriginalParentRef.get();
        if (panelRoot != null) {
            try {
                ViewParent currentParent = panelRoot.getParent();
                if (currentParent instanceof ViewGroup && currentParent != origParent) {
                    ((ViewGroup) currentParent).removeView(panelRoot);
                }
                if (origParent != null && origParent.isAttachedToWindow() && panelRoot.getParent() == null) {
                    int idx = Math.max(0, Math.min(state.dockedPanelOriginalIndex, origParent.getChildCount()));
                    if (state.dockedPanelOriginalLp != null) {
                        origParent.addView(panelRoot, idx, state.dockedPanelOriginalLp);
                    } else {
                        origParent.addView(panelRoot, idx);
                    }
                }
            } catch (Throwable ignored) {
            }
        }

        ViewGroup wrapper = state.engagementWrapperRef.get();
        if (wrapper != null) {
            try {
                if (state.wrapperMonitorListener != null) {
                    wrapper.removeOnLayoutChangeListener(state.wrapperMonitorListener);
                }
                if (state.wrapperHiddenByUs) {
                    wrapper.setVisibility(state.wrapperPrevVisibility);
                }
            } catch (Throwable ignored) {
            }
        }

        state.wrapperHiddenByUs = false;
        state.engagementWrapperRef = new WeakReference<>(null);
        state.dockedPanelOriginalParentRef = new WeakReference<>(null);
        state.dockedPanelRootRef = new WeakReference<>(null);
        state.dockedCommentsRvRef = new WeakReference<>(null);
        state.dockedCommentComposerRef = new WeakReference<>(null);
        state.dockedPanelOriginalLp = null;
        state.dockedPanelOriginalIndex = -1;
    }

    private static View findPanelHeaderBar(View panelRoot, View commentsRv) {
        if (!(panelRoot instanceof ViewGroup)) {
            return null;
        }
        ViewGroup vg = (ViewGroup) panelRoot;
        int rvTop = getRelativeTop(commentsRv, vg);
        int count = vg.getChildCount();
        for (int i = 0; i < count; i++) {
            View c = vg.getChildAt(i);
            if (c == null || c == commentsRv || isAncestorOf(c, commentsRv) || !c.isShown()) {
                continue;
            }
            String idName = getResourceEntryNameSafe(c);
            if (idName.contains("header") || (c.getBottom() <= rvTop + 16 && c.getHeight() > 0 && c.getHeight() < 260)) {
                return c;
            }
        }
        return null;
    }

    private static View findCommentComposerView(View node, View commentsRv, int depth) {
        if (node == null || depth > 7 || node == commentsRv) {
            return null;
        }
        String idName = getResourceEntryNameSafe(node);
        if (idName.contains("comment_composer")
                || idName.contains("add_comment")
                || idName.contains("create_comment")
                || idName.contains("composer")) {
            return node;
        }
        if (node instanceof TextView) {
            CharSequence txt = ((TextView) node).getText();
            CharSequence hint = ((TextView) node).getHint();
            if (isCommentComposerText(txt) || isCommentComposerText(hint)) {
                return findClickableAncestor(node, 4);
            }
        }
        CharSequence cd = node.getContentDescription();
        if (isCommentComposerText(cd)) {
            return findClickableAncestor(node, 3);
        }
        if (node instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                View found = findCommentComposerView(vg.getChildAt(i), commentsRv, depth + 1);
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }

    private static boolean isCommentComposerText(CharSequence cs) {
        if (cs == null || cs.length() == 0) {
            return false;
        }
        String s = cs.toString().trim().toLowerCase(Locale.US);
        return s.contains("add a comment")
                || s.contains("add a public comment")
                || s.contains("comment as ")
                || s.equals("comment...");
    }

    private static boolean hasCommentsHeaderTitle(View node, int depth) {
        if (node == null || depth > 6 || !node.isShown()) {
            return false;
        }
        String s = readSingleNodeLabel(node);
        if (s.equals("comments") || s.startsWith("comments ")) {
            return true;
        }
        if (node instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                if (hasCommentsHeaderTitle(vg.getChildAt(i), depth + 1)) {
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean hasNonCommentsHeaderTitle(View node, int depth) {
        if (node == null || depth > 5 || !node.isShown()) {
            return false;
        }
        String s = readSingleNodeLabel(node);
        if (!s.isEmpty()) {
            for (int i = 0; i < NON_COMMENTS_PANEL_TITLES.length; i++) {
                if (s.equals(NON_COMMENTS_PANEL_TITLES[i])) {
                    return true;
                }
            }
        }
        if (node instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                if (hasNonCommentsHeaderTitle(vg.getChildAt(i), depth + 1)) {
                    return true;
                }
            }
        }
        return false;
    }

    private static String readSingleNodeLabel(View node) {
        if (node instanceof TextView) {
            CharSequence txt = ((TextView) node).getText();
            if (txt != null && txt.length() > 0) {
                return txt.toString().trim().toLowerCase(Locale.US);
            }
        }
        CharSequence cd = node.getContentDescription();
        if (cd != null && cd.length() > 0) {
            return cd.toString().trim().toLowerCase(Locale.US);
        }
        StringBuilder sb = new StringBuilder();
        appendAccessibilityText(node, sb, 48);
        return sb.toString().trim().toLowerCase(Locale.US);
    }

    private static boolean hasCommentResourceName(View node, int depth) {
        if (node == null || depth > 5) {
            return false;
        }
        if (getResourceEntryNameSafe(node).contains("comment")) {
            return true;
        }
        if (node instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                if (hasCommentResourceName(vg.getChildAt(i), depth + 1)) {
                    return true;
                }
            }
        }
        return false;
    }

    private static void collapseComposerVisually(View composer, WatchState state) {
        try {
            composer.setAlpha(0f);
            ViewGroup.LayoutParams lp = composer.getLayoutParams();
            if (lp != null && lp.height != 1) {
                state.savedComposerOrigHeight = lp.height;
                state.composerHeightSaved = true;
                lp.height = 1;
                composer.setLayoutParams(lp);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void restoreComposerVisually(View composer, WatchState state) {
        try {
            composer.setAlpha(1f);
            ViewGroup.LayoutParams lp = composer.getLayoutParams();
            if (state != null && state.composerHeightSaved && lp != null) {
                lp.height = state.savedComposerOrigHeight;
                composer.setLayoutParams(lp);
                state.composerHeightSaved = false;
            }
        } catch (Throwable ignored) {
        }
    }

    // -------------------------------------------------------------------------
    // Merged-row Comment button action -> triggers YouTube's comment composer + keyboard
    // -------------------------------------------------------------------------

    private static void onCommentButtonClicked(final Activity activity, final WatchState state) {
        View composer = state.dockedCommentComposerRef.get();
        View panelRoot = state.dockedPanelRootRef.get();
        View commentsRv = state.dockedCommentsRvRef.get();

        if (composer == null && panelRoot != null) {
            composer = findCommentComposerView(panelRoot, commentsRv, 0);
            if (composer != null) {
                state.dockedCommentComposerRef = new WeakReference<>(composer);
            }
        }
        if (composer == null && commentsRv instanceof ViewGroup) {
            composer = findCommentComposerView(commentsRv, null, 0);
            if (composer != null) {
                state.dockedCommentComposerRef = new WeakReference<>(composer);
            }
        }

        if (composer != null && composer.isAttachedToWindow()) {
            clickViewDirect(composer);
            return;
        }

        View teaser = state.commentsTeaserRef.get();
        if (teaser != null && teaser.isAttachedToWindow()) {
            clickViewDirect(teaser);
            MAIN_HANDLER.postDelayed(new Runnable() {
                @Override
                public void run() {
                    if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
                        return;
                    }
                    View p = state.dockedPanelRootRef.get();
                    View rv = state.dockedCommentsRvRef.get();
                    View c = state.dockedCommentComposerRef.get();
                    if (c == null && p != null) {
                        c = findCommentComposerView(p, rv, 0);
                    }
                    if (c == null && rv != null) {
                        c = findCommentComposerView(rv, null, 0);
                    }
                    if (c != null) {
                        clickViewDirect(c);
                    }
                }
            }, 420L);
        }
    }

    private static void clickViewDirect(View target) {
        if (target == null) {
            return;
        }
        try {
            View clickable = findFirstClickableDescendant(target, 0);
            View toClick = clickable != null ? clickable : target;
            if (toClick.performClick()) {
                return;
            }
            if (target != toClick && target.performClick()) {
                return;
            }
            long now = SystemClock.uptimeMillis();
            float cx = Math.max(1f, toClick.getWidth() * 0.5f);
            float cy = Math.max(1f, toClick.getHeight() * 0.5f);
            MotionEvent down = MotionEvent.obtain(now, now, MotionEvent.ACTION_DOWN, cx, cy, 0);
            MotionEvent up = MotionEvent.obtain(now, now + 20L, MotionEvent.ACTION_UP, cx, cy, 0);
            toClick.dispatchTouchEvent(down);
            toClick.dispatchTouchEvent(up);
            down.recycle();
            up.recycle();
        } catch (Throwable ignored) {
        }
    }

    private static View findFirstClickableDescendant(View node, int depth) {
        if (node == null || depth > 5) {
            return null;
        }
        if (node.isClickable()) {
            return node;
        }
        if (node instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                View found = findFirstClickableDescendant(vg.getChildAt(i), depth + 1);
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }

    private static View findClickableAncestor(View v, int maxSteps) {
        View cur = v;
        for (int i = 0; i < maxSteps && cur != null; i++) {
            if (cur.isClickable()) {
                return cur;
            }
            ViewParent p = cur.getParent();
            cur = p instanceof View ? (View) p : null;
        }
        return v;
    }

    // -------------------------------------------------------------------------
    // Direct View-based Button Extraction (ZERO bitmap slicing, ZERO cropped buttons!)
    // -------------------------------------------------------------------------

    private static final class ViewCluster {
        final View view;
        final int cropLeft;
        final int cropRight;
        final boolean fullTargetWidth;

        ViewCluster(View view, int cropLeft, int cropRight, boolean fullTargetWidth) {
            this.view = view;
            this.cropLeft = cropLeft;
            this.cropRight = cropRight;
            this.fullTargetWidth = fullTargetWidth;
        }
    }

    /**
     * Extracts the Channel info cluster (avatar + name + subs) and Subscribe/Unsubscribe/Bell button(s)
     * directly from real Android View bounds inside channelItem — no bitmap scanning.
     */
    private static ArrayList<ViewCluster> extractChannelClusters(View channelItem, Resources res) {
        ArrayList<ViewCluster> result = new ArrayList<>(3);
        if (channelItem == null) {
            return result;
        }
        int chW = channelItem.getWidth();
        if (chW <= 0) {
            return result;
        }

        ArrayList<View> clickables = new ArrayList<>(6);
        collectNonFullWidthClickables(channelItem, channelItem, chW, res, 0, clickables);

        Collections.sort(clickables, new Comparator<View>() {
            @Override
            public int compare(View a, View b) {
                return Integer.compare(getRelativeLeft(a, channelItem), getRelativeLeft(b, channelItem));
            }
        });

        if (clickables.size() >= 2) {
            // Each clickable cluster (Channel info on left, Join/Subscribe/Bell on right) maps 1:1 to its own View!
            for (int i = 0; i < clickables.size(); i++) {
                View v = clickables.get(i);
                result.add(new ViewCluster(v, 0, v.getWidth(), true));
            }
            return result;
        }

        if (clickables.size() == 1) {
            View btn = clickables.get(0);
            int btnLeft = getRelativeLeft(btn, channelItem);
            if (btnLeft >= (int) (chW * 0.40f)) {
                // Single right-side Subscribe/Bell button; left side of channelItem holds avatar + name + subs.
                int leftContentRight = measureLeftSubtreeMaxRight(channelItem, channelItem, btnLeft, 0);
                int pad = dpToPx(res, 12);
                int estimatedRight = estimateChannelLeftContentWidth(channelItem, res);
                int targetLeftRight = leftContentRight > dpToPx(res, 40)
                        ? Math.min(btnLeft, leftContentRight + pad)
                        : Math.min(btnLeft, estimatedRight);
                result.add(new ViewCluster(channelItem, 0, Math.max(dpToPx(res, 96), targetLeftRight), false));
                result.add(new ViewCluster(btn, 0, btn.getWidth(), true));
                return result;
            }
        }

        // Litho fallback: group visible leaf View bounds separated by a wide blank middle gap (> 28dp)
        // so we remove empty horizontal whitespace without ever cutting through text or icons.
        ArrayList<int[]> leafBounds = new ArrayList<>(8);
        collectLeafHorizontalBounds(channelItem, channelItem, chW, res, 0, leafBounds);
        if (leafBounds.size() >= 2) {
            Collections.sort(leafBounds, new Comparator<int[]>() {
                @Override
                public int compare(int[] a, int[] b) {
                    return Integer.compare(a[0], b[0]);
                }
            });
            int mergeGap = dpToPx(res, 28);
            int pad = dpToPx(res, 8);
            ArrayList<int[]> merged = new ArrayList<>(3);
            int curL = leafBounds.get(0)[0];
            int curR = leafBounds.get(0)[1];
            for (int i = 1; i < leafBounds.size(); i++) {
                int[] next = leafBounds.get(i);
                if (next[0] <= curR + mergeGap) {
                    curR = Math.max(curR, next[1]);
                } else {
                    merged.add(new int[]{curL, curR});
                    curL = next[0];
                    curR = next[1];
                }
            }
            merged.add(new int[]{curL, curR});
            if (merged.size() >= 2) {
                for (int i = 0; i < merged.size(); i++) {
                    int[] seg = merged.get(i);
                    int cL = Math.max(0, seg[0] - pad);
                    int cR = Math.min(chW, seg[1] + pad);
                    if (cR - cL >= dpToPx(res, 28)) {
                        result.add(new ViewCluster(channelItem, cL, cR, false));
                    }
                }
                if (!result.isEmpty()) {
                    return result;
                }
            }
        }

        // Final safe fallback: keep the entire channel row intact without clipping anything.
        result.add(new ViewCluster(channelItem, 0, chW, true));
        return result;
    }

    private static void collectLeafHorizontalBounds(
            View node,
            View root,
            int rootWidth,
            Resources res,
            int depth,
            ArrayList<int[]> out
    ) {
        if (node == null || depth > 6 || !node.isShown()) {
            return;
        }
        int w = node.getWidth();
        int h = node.getHeight();
        if (w <= 0 || h < dpToPx(res, 12)) {
            return;
        }
        boolean isLeafContent = (node instanceof TextView || node instanceof ImageView)
                || (!(node instanceof ViewGroup) && w < (int) (rootWidth * 0.72f))
                || (node instanceof ViewGroup && ((ViewGroup) node).getChildCount() == 0 && w < (int) (rootWidth * 0.72f));
        if (node != root && isLeafContent && w < (int) (rootWidth * 0.75f)) {
            int l = getRelativeLeft(node, root);
            int r = l + w;
            if (r > l && l >= 0 && r <= rootWidth + 4) {
                out.add(new int[]{l, Math.min(rootWidth, r)});
            }
            return;
        }
        if (node instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                collectLeafHorizontalBounds(vg.getChildAt(i), root, rootWidth, res, depth + 1, out);
            }
        }
    }

    private static void collectNonFullWidthClickables(
            View node,
            View root,
            int rootWidth,
            Resources res,
            int depth,
            ArrayList<View> out
    ) {
        if (node == null || depth > 6 || !node.isShown()) {
            return;
        }
        if (node != root && node.isClickable()
                && node.getWidth() >= dpToPx(res, 32)
                && node.getWidth() <= (int) (rootWidth * 0.80f)
                && node.getHeight() >= dpToPx(res, 24)) {
            out.add(node);
            return; // Keep outermost clickable cluster so we don't duplicate nested children.
        }
        if (node instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                collectNonFullWidthClickables(vg.getChildAt(i), root, rootWidth, res, depth + 1, out);
            }
        }
    }

    private static int measureLeftSubtreeMaxRight(View node, View root, int maxX, int depth) {
        if (node == null || depth > 6 || !node.isShown()) {
            return 0;
        }
        int best = 0;
        if (node != root && (node instanceof TextView || node instanceof ImageView)) {
            int l = getRelativeLeft(node, root);
            int r = l + node.getWidth();
            if (l < maxX && r <= maxX + 16) {
                best = r;
            }
        }
        if (node instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                int sub = measureLeftSubtreeMaxRight(vg.getChildAt(i), root, maxX, depth + 1);
                if (sub > best) {
                    best = sub;
                }
            }
        }
        return best;
    }

    private static int estimateChannelLeftContentWidth(View channelItem, Resources res) {
        StringBuilder sb = new StringBuilder();
        collectTextSnippet(channelItem, 0, sb, 64);
        String raw = sb.toString()
                .replaceAll("(?i)go to channel", "")
                .replaceAll("(?i)subscribe.*", "")
                .replaceAll("(?i)unsubscribe.*", "")
                .replaceAll("(?i)current setting.*", "")
                .replaceAll("(?i)notifications.*", "")
                .trim();
        if (raw.isEmpty()) {
            return dpToPx(res, 210);
        }
        Paint measurePaint = new Paint();
        measurePaint.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 15f, res.getDisplayMetrics()));
        float textW = measurePaint.measureText(raw);
        // Avatar (36dp) + left/right padding & spacing (40dp) + measured channel name & subscriber count.
        return Math.min(dpToPx(res, 320), Math.max(dpToPx(res, 140), dpToPx(res, 76) + Math.round(textW)));
    }

    /**
     * Extracts each individual action pill View (Like/Dislike, Share, Ask, Save, Download, Report...)
     * directly from YouTube's horizontal action scroller or Litho action row — every pill renders at 100% full width.
     */
    private static ArrayList<View> extractActionPillViews(View actionContainer, Resources res) {
        ArrayList<View> pills = new ArrayList<>(8);
        if (!(actionContainer instanceof ViewGroup)) {
            return pills;
        }
        ViewGroup host = (ViewGroup) actionContainer;
        // Unwrap single-child wrappers (e.g. HorizontalScrollView -> LinearLayout / LithoView).
        for (int unwrap = 0; unwrap < 6; unwrap++) {
            if (host.getChildCount() == 1 && host.getChildAt(0) instanceof ViewGroup) {
                host = (ViewGroup) host.getChildAt(0);
            } else {
                break;
            }
        }

        int minW = dpToPx(res, 28);
        int minH = dpToPx(res, 22);
        int count = host.getChildCount();
        for (int i = 0; i < count; i++) {
            View child = host.getChildAt(i);
            if (child != null && child.getVisibility() == View.VISIBLE
                    && child.getWidth() >= minW && child.getHeight() >= minH) {
                pills.add(child);
            }
        }
        if (pills.size() < 2) {
            // Litho fallback: find outermost non-full-width clickable pill nodes arranged horizontally.
            pills.clear();
            int rootW = Math.max(1, actionContainer.getWidth());
            collectNonFullWidthClickables(actionContainer, actionContainer, rootW, res, 0, pills);
        }
        Collections.sort(pills, new Comparator<View>() {
            @Override
            public int compare(View a, View b) {
                return Integer.compare(getRelativeLeft(a, actionContainer), getRelativeLeft(b, actionContainer));
            }
        });
        return pills;
    }

    // -------------------------------------------------------------------------
    // UnifiedWatchScrollHost: scrolls Video Title + Merged Single Row + Comments together
    // -------------------------------------------------------------------------

    private static final class UnifiedWatchScrollHost extends FrameLayout {

        private final LinearLayout headerContainer;
        private final FrameLayout titleSlot;
        private final HorizontalScrollView mergedRowScroll;
        private final LinearLayout mergedRowContent;
        private final View dividerLine;
        private final FrameLayout commentsBodyContainer;

        private final int touchSlop;
        private final int minFlingVel;
        private final int maxFlingVel;
        private final OverScroller scroller;
        private VelocityTracker velocityTracker;

        private int headerHeightPx = 0;
        private int headerScrollOffset = 0;
        private boolean draggingHeader = false;
        private float downX = 0f;
        private float downY = 0f;
        private float lastTouchY = 0f;
        private int lastFlingY = 0;
        private boolean flingForwardsToRv = true;

        private WeakReference<View> commentsRvRef = new WeakReference<>(null);
        private final ArrayList<LiveViewSlot> liveSlots = new ArrayList<>(12);

        private final Runnable flingTickRunnable = new Runnable() {
            @Override
            public void run() {
                if (!scroller.computeScrollOffset()) {
                    return;
                }
                int currY = scroller.getCurrY();
                int dy = currY - lastFlingY;
                lastFlingY = currY;
                if (dy != 0) {
                    if (flingForwardsToRv) {
                        applyCombinedVerticalDelta(dy);
                    } else {
                        headerScrollOffset = Math.max(0, Math.min(headerHeightPx, headerScrollOffset + dy));
                        applyScrollTranslations();
                    }
                }
                if (!scroller.isFinished()) {
                    postOnAnimation(this);
                }
            }
        };

        UnifiedWatchScrollHost(Context context) {
            super(context);
            setClipChildren(true);
            setClipToPadding(true);

            ViewConfiguration vc = ViewConfiguration.get(context);
            touchSlop = vc.getScaledTouchSlop();
            minFlingVel = vc.getScaledMinimumFlingVelocity();
            maxFlingVel = vc.getScaledMaximumFlingVelocity();
            scroller = new OverScroller(context);

            commentsBodyContainer = new FrameLayout(context);
            addView(commentsBodyContainer, new LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT
            ));

            headerContainer = new LinearLayout(context);
            headerContainer.setOrientation(LinearLayout.VERTICAL);

            titleSlot = new FrameLayout(context);
            headerContainer.addView(titleSlot, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));

            mergedRowScroll = new HorizontalScrollView(context);
            mergedRowScroll.setHorizontalScrollBarEnabled(false);
            mergedRowScroll.setOverScrollMode(OVER_SCROLL_NEVER);
            mergedRowScroll.setFillViewport(false);

            mergedRowContent = new LinearLayout(context);
            mergedRowContent.setOrientation(LinearLayout.HORIZONTAL);
            mergedRowContent.setGravity(Gravity.CENTER_VERTICAL);
            int padH = dpToPx(getResources(), 10);
            int padV = dpToPx(getResources(), 4);
            mergedRowContent.setPadding(padH, padV, padH, padV);
            mergedRowScroll.addView(mergedRowContent, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));

            headerContainer.addView(mergedRowScroll, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));

            dividerLine = new View(context);
            dividerLine.setBackgroundColor(isDarkTheme(context) ? 0x22FFFFFF : 0x18000000);
            LinearLayout.LayoutParams divLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    Math.max(1, dpToPx(getResources(), 1))
            );
            divLp.topMargin = dpToPx(getResources(), 4);
            headerContainer.addView(dividerLine, divLp);

            addView(headerContainer, new LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));
        }

        boolean hasHeaderContent() {
            return titleSlot.getChildCount() > 0 && mergedRowContent.getChildCount() > 0;
        }

        boolean areBoundTargetsAttached() {
            for (int i = 0; i < liveSlots.size(); i++) {
                if (!liveSlots.get(i).isTargetAttached()) {
                    return false;
                }
            }
            return !liveSlots.isEmpty();
        }

        void resetScrollPosition() {
            scroller.abortAnimation();
            headerScrollOffset = 0;
            mergedRowScroll.scrollTo(0, 0);
            applyScrollTranslations();
        }

        void refreshHeaderVisuals() {
            for (int i = 0; i < liveSlots.size(); i++) {
                LiveViewSlot slot = liveSlots.get(i);
                slot.syncWidthFromTarget();
                slot.invalidate();
            }
        }

        void bindHeader(Context ctx, WatchMetaItems items, Runnable onCommentClick) {
            liveSlots.clear();
            titleSlot.removeAllViews();
            mergedRowContent.removeAllViews();

            Resources res = ctx.getResources();
            int gapPx = dpToPx(res, 8);

            // 1. Video Title + views/date/...more row (full width, exact live height).
            View titleItem = items.titleItem;
            int titleW = Math.max(1, titleItem.getWidth());
            int titleH = Math.max(dpToPx(res, 40), titleItem.getHeight());
            LiveViewSlot titleProxy = new LiveViewSlot(ctx, titleItem, 0, titleW, false);
            liveSlots.add(titleProxy);
            titleSlot.addView(titleProxy, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    titleH
            ));

            // 2. Channel info + Subscribe/Unsubscribe/Bell cluster(s).
            if (items.channelItem != null) {
                ArrayList<ViewCluster> clusters = extractChannelClusters(items.channelItem, res);
                for (int i = 0; i < clusters.size(); i++) {
                    ViewCluster c = clusters.get(i);
                    int cw = Math.max(1, c.cropRight - c.cropLeft);
                    int ch = Math.max(dpToPx(res, 36), c.view.getHeight());
                    LiveViewSlot slot = new LiveViewSlot(ctx, c.view, c.cropLeft, c.cropRight, c.fullTargetWidth);
                    liveSlots.add(slot);
                    addMergedChild(slot, cw, ch, gapPx);
                }
            }

            // 3. Action pills (Like/Dislike -> NEW Comment pill -> Share, Ask, Save, Download, Report...).
            View actionSource = items.actionsScroller != null ? items.actionsScroller : items.actionsItem;
            ArrayList<View> pills = extractActionPillViews(actionSource, res);
            if (pills.size() >= 2) {
                for (int i = 0; i < pills.size(); i++) {
                    View pill = pills.get(i);
                    int pw = Math.max(1, pill.getWidth());
                    int ph = Math.max(dpToPx(res, 36), pill.getHeight());
                    LiveViewSlot slot = new LiveViewSlot(ctx, pill, 0, pw, true);
                    liveSlots.add(slot);
                    addMergedChild(slot, pw, ph, gapPx);

                    // Insert our Comment button right after the first pill (Like/Dislike), alongside Share!
                    if (i == 0) {
                        addCommentPill(ctx, res, onCommentClick, gapPx);
                    }
                }
            } else if (actionSource != null) {
                // Flattened Litho strip: place Comment pill right before the full-width inner action strip
                // (never clip to HorizontalScrollView's narrower viewport width!).
                addCommentPill(ctx, res, onCommentClick, gapPx);
                View fullActionStrip = actionSource;
                if (actionSource instanceof HorizontalScrollView
                        && ((ViewGroup) actionSource).getChildCount() > 0) {
                    View inner = ((ViewGroup) actionSource).getChildAt(0);
                    if (inner != null && inner.getWidth() >= actionSource.getWidth()) {
                        fullActionStrip = inner;
                    }
                } else if (pills.size() == 1 && pills.get(0).getWidth() >= actionSource.getWidth() * 0.7f) {
                    fullActionStrip = pills.get(0);
                }
                int aw = Math.max(1, fullActionStrip.getWidth());
                int ah = Math.max(dpToPx(res, 36), fullActionStrip.getHeight());
                LiveViewSlot slot = new LiveViewSlot(ctx, fullActionStrip, 0, aw, true);
                liveSlots.add(slot);
                addMergedChild(slot, aw, ah, gapPx);
            } else {
                addCommentPill(ctx, res, onCommentClick, gapPx);
            }

            // Show comments teaser placeholder cleanly inside commentsBodyContainer until live panel docks.
            if (commentsBodyContainer.getChildCount() == 0 && items.commentsTeaserItem != null) {
                int ctW = Math.max(1, items.commentsTeaserItem.getWidth());
                int ctH = Math.max(dpToPx(res, 64), items.commentsTeaserItem.getHeight());
                LiveViewSlot teaserProxy = new LiveViewSlot(ctx, items.commentsTeaserItem, 0, ctW, false);
                liveSlots.add(teaserProxy);
                commentsBodyContainer.addView(teaserProxy, new LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ctH
                ));
            }

            requestLayout();
        }

        private void addCommentPill(Context ctx, Resources res, Runnable onCommentClick, int rightMargin) {
            CommentPillButton commentBtn = new CommentPillButton(ctx, onCommentClick);
            LinearLayout.LayoutParams btnLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    dpToPx(res, 36)
            );
            btnLp.gravity = Gravity.CENTER_VERTICAL;
            btnLp.rightMargin = rightMargin;
            mergedRowContent.addView(commentBtn, btnLp);
        }

        private void addMergedChild(View child, int widthPx, int heightPx, int rightMargin) {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(Math.max(1, widthPx), Math.max(1, heightPx));
            lp.gravity = Gravity.CENTER_VERTICAL;
            lp.rightMargin = rightMargin;
            mergedRowContent.addView(child, lp);
        }

        void setCommentsBodyView(View panelRoot, View commentsRv) {
            commentsRvRef = new WeakReference<>(commentsRv);
            if (panelRoot == null) {
                return;
            }
            if (panelRoot.getParent() == commentsBodyContainer) {
                return;
            }
            commentsBodyContainer.removeAllViews();
            if (panelRoot.getParent() instanceof ViewGroup) {
                ((ViewGroup) panelRoot.getParent()).removeView(panelRoot);
            }
            panelRoot.setVisibility(View.VISIBLE);
            panelRoot.setAlpha(1f);
            commentsBodyContainer.addView(panelRoot, new LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT
            ));
            requestLayout();
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int w = MeasureSpec.getSize(widthMeasureSpec);
            int h = MeasureSpec.getSize(heightMeasureSpec);

            headerContainer.measure(
                    MeasureSpec.makeMeasureSpec(w, MeasureSpec.EXACTLY),
                    MeasureSpec.makeMeasureSpec(h, MeasureSpec.AT_MOST)
            );
            headerHeightPx = headerContainer.getMeasuredHeight();
            if (headerScrollOffset > headerHeightPx) {
                headerScrollOffset = headerHeightPx;
            }

            commentsBodyContainer.measure(
                    MeasureSpec.makeMeasureSpec(w, MeasureSpec.EXACTLY),
                    MeasureSpec.makeMeasureSpec(Math.max(1, h), MeasureSpec.EXACTLY)
            );
            setMeasuredDimension(w, h);
        }

        @Override
        protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
            int w = right - left;
            int h = bottom - top;
            headerHeightPx = headerContainer.getMeasuredHeight();
            headerContainer.layout(0, 0, w, headerHeightPx);
            commentsBodyContainer.layout(0, headerHeightPx, w, headerHeightPx + h);
            applyScrollTranslations();
        }

        private void applyScrollTranslations() {
            int clamped = Math.max(0, Math.min(headerHeightPx, headerScrollOffset));
            headerScrollOffset = clamped;
            headerContainer.setTranslationY(-clamped);
            commentsBodyContainer.setTranslationY(-clamped);
        }

        private void applyCombinedVerticalDelta(int dy) {
            if (dy > 0) {
                int canConsume = Math.max(0, headerHeightPx - headerScrollOffset);
                int headerDelta = Math.min(dy, canConsume);
                if (headerDelta > 0) {
                    headerScrollOffset += headerDelta;
                    applyScrollTranslations();
                }
                int rem = dy - headerDelta;
                if (rem > 0) {
                    View rv = commentsRvRef.get();
                    if (rv != null) {
                        rv.scrollBy(0, rem);
                    }
                }
            } else if (dy < 0) {
                View rv = commentsRvRef.get();
                if (rv != null && rv.canScrollVertically(-1)) {
                    rv.scrollBy(0, dy);
                } else if (headerScrollOffset > 0) {
                    int headerDelta = Math.max(dy, -headerScrollOffset);
                    headerScrollOffset += headerDelta;
                    applyScrollTranslations();
                }
            }
        }

        @Override
        public boolean onStartNestedScroll(View child, View target, int nestedScrollAxes) {
            if ((nestedScrollAxes & View.SCROLL_AXIS_VERTICAL) != 0) {
                scroller.abortAnimation();
                return true;
            }
            return false;
        }

        @Override
        public void onNestedPreScroll(View target, int dx, int dy, int[] consumed) {
            if (dy > 0 && headerScrollOffset < headerHeightPx) {
                int take = Math.min(dy, headerHeightPx - headerScrollOffset);
                headerScrollOffset += take;
                applyScrollTranslations();
                consumed[1] = take;
            } else if (dy < 0 && headerScrollOffset > 0 && !target.canScrollVertically(-1)) {
                int take = Math.max(dy, -headerScrollOffset);
                headerScrollOffset += take;
                applyScrollTranslations();
                consumed[1] = take;
            }
        }

        @Override
        public void onNestedScroll(View target, int dxConsumed, int dyConsumed, int dxUnconsumed, int dyUnconsumed) {
            if (dyUnconsumed < 0 && headerScrollOffset > 0) {
                int take = Math.max(dyUnconsumed, -headerScrollOffset);
                headerScrollOffset += take;
                applyScrollTranslations();
            } else if (dyUnconsumed > 0 && headerScrollOffset < headerHeightPx) {
                int take = Math.min(dyUnconsumed, headerHeightPx - headerScrollOffset);
                headerScrollOffset += take;
                applyScrollTranslations();
            }
        }

        @Override
        public boolean onNestedPreFling(View target, float velocityX, float velocityY) {
            if (velocityY > minFlingVel && headerScrollOffset < headerHeightPx) {
                startHeaderFling((int) velocityY, false);
                return false;
            }
            if (velocityY < -minFlingVel && headerScrollOffset > 0 && !target.canScrollVertically(-1)) {
                startHeaderFling((int) velocityY, false);
                return true;
            }
            return false;
        }

        private void startHeaderFling(int velocityY, boolean forwardToRv) {
            scroller.abortAnimation();
            flingForwardsToRv = forwardToRv;
            lastFlingY = headerScrollOffset;
            scroller.fling(0, headerScrollOffset, 0, velocityY, 0, 0, 0, Math.max(0, headerHeightPx));
            postOnAnimation(flingTickRunnable);
        }

        @Override
        public boolean onInterceptTouchEvent(MotionEvent ev) {
            int action = ev.getActionMasked();
            switch (action) {
                case MotionEvent.ACTION_DOWN:
                    scroller.abortAnimation();
                    downX = ev.getX();
                    downY = ev.getY();
                    lastTouchY = downY;
                    draggingHeader = false;
                    if (velocityTracker != null) {
                        velocityTracker.recycle();
                    }
                    velocityTracker = VelocityTracker.obtain();
                    velocityTracker.addMovement(ev);
                    return false;

                case MotionEvent.ACTION_MOVE:
                    if (velocityTracker != null) {
                        velocityTracker.addMovement(ev);
                    }
                    float visibleHeaderBottom = headerHeightPx - headerScrollOffset;
                    if (downY <= visibleHeaderBottom) {
                        float dx = Math.abs(ev.getX() - downX);
                        float dy = Math.abs(ev.getY() - downY);
                        if (dy > touchSlop && dy > dx * 1.15f) {
                            draggingHeader = true;
                            lastTouchY = ev.getY();
                            return true;
                        }
                    }
                    return false;

                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    draggingHeader = false;
                    if (velocityTracker != null) {
                        velocityTracker.recycle();
                        velocityTracker = null;
                    }
                    return false;
            }
            return false;
        }

        @Override
        public boolean onTouchEvent(MotionEvent ev) {
            if (!draggingHeader) {
                return super.onTouchEvent(ev);
            }
            if (velocityTracker != null) {
                velocityTracker.addMovement(ev);
            }
            int action = ev.getActionMasked();
            switch (action) {
                case MotionEvent.ACTION_MOVE:
                    float y = ev.getY();
                    int dy = Math.round(lastTouchY - y);
                    lastTouchY = y;
                    if (dy != 0) {
                        applyCombinedVerticalDelta(dy);
                    }
                    return true;

                case MotionEvent.ACTION_UP:
                    if (velocityTracker != null) {
                        velocityTracker.computeCurrentVelocity(1000, maxFlingVel);
                        int vy = (int) -velocityTracker.getYVelocity();
                        if (Math.abs(vy) >= minFlingVel) {
                            startHeaderFling(vy, true);
                        }
                        velocityTracker.recycle();
                        velocityTracker = null;
                    }
                    draggingHeader = false;
                    return true;

                case MotionEvent.ACTION_CANCEL:
                    if (velocityTracker != null) {
                        velocityTracker.recycle();
                        velocityTracker = null;
                    }
                    draggingHeader = false;
                    return true;
            }
            return true;
        }
    }

    // -------------------------------------------------------------------------
    // LiveViewSlot: renders an individual live YouTube View & forwards touch directly to it
    // -------------------------------------------------------------------------

    private static final class LiveViewSlot extends View {
        private final WeakReference<View> targetRef;
        private final int cropLeft;
        private final boolean fullTargetWidth;

        LiveViewSlot(Context context, View target, int cropLeft, int cropRight, boolean fullTargetWidth) {
            super(context);
            this.targetRef = new WeakReference<>(target);
            this.cropLeft = Math.max(0, cropLeft);
            this.fullTargetWidth = fullTargetWidth;
            setClickable(true);
        }

        boolean isTargetAttached() {
            View t = targetRef.get();
            return t != null && t.isAttachedToWindow();
        }

        void syncWidthFromTarget() {
            if (!fullTargetWidth || cropLeft != 0) {
                return;
            }
            View t = targetRef.get();
            if (t == null || !t.isAttachedToWindow()) {
                return;
            }
            int tw = t.getWidth();
            ViewGroup.LayoutParams lp = getLayoutParams();
            if (tw > 0 && lp != null && lp.width > 0 && Math.abs(lp.width - tw) > 2) {
                lp.width = tw;
                setLayoutParams(lp);
            }
        }

        @Override
        protected void onDraw(Canvas canvas) {
            View target = targetRef.get();
            if (target == null || !target.isAttachedToWindow()) {
                return;
            }
            int w = getWidth();
            int h = getHeight();
            if (w <= 0 || h <= 0) {
                return;
            }
            int th = target.getHeight();
            float offsetY = (th > 0 && th < h) ? (h - th) * 0.5f : 0f;

            int save = canvas.save();
            canvas.clipRect(0, 0, w, h);
            if (cropLeft != 0 || offsetY != 0f) {
                canvas.translate(-cropLeft, offsetY);
            }
            try {
                target.draw(canvas);
            } catch (Throwable ignored) {
            }
            canvas.restoreToCount(save);
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            View target = targetRef.get();
            if (target == null || !target.isAttachedToWindow()) {
                return false;
            }
            int th = Math.max(1, target.getHeight());
            float offsetY = (th < getHeight()) ? (getHeight() - th) * 0.5f : 0f;

            float mappedX = event.getX() + cropLeft;
            float mappedY = event.getY() - offsetY;
            if (event.getY() >= 0f && event.getY() <= getHeight()) {
                mappedY = Math.max(1f, Math.min(th - 1f, mappedY));
            }

            MotionEvent copy = MotionEvent.obtain(event);
            copy.setLocation(mappedX, mappedY);
            boolean handled = false;
            try {
                handled = target.dispatchTouchEvent(copy);
            } catch (Throwable ignored) {
            } finally {
                copy.recycle();
            }

            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        syncWidthFromTarget();
                        invalidate();
                    }
                }, 140L);
                postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        syncWidthFromTarget();
                        invalidate();
                    }
                }, 480L);
            }
            return handled || action == MotionEvent.ACTION_DOWN;
        }
    }

    // -------------------------------------------------------------------------
    // Native-styled "Comment" pill button (matching YouTube's dark/light action pills)
    // -------------------------------------------------------------------------

    private static final class CommentPillButton extends LinearLayout {
        CommentPillButton(Context context, final Runnable onClickAction) {
            super(context);
            Resources res = context.getResources();
            boolean dark = isDarkTheme(context);

            setOrientation(HORIZONTAL);
            setGravity(Gravity.CENTER_VERTICAL);
            setClickable(true);
            setFocusable(true);
            setPadding(dpToPx(res, 12), 0, dpToPx(res, 14), 0);

            int bgNormal = dark ? 0xFF272727 : 0xFFF2F2F2;
            int bgPressed = dark ? 0xFF3F3F3F : 0xFFE2E2E2;
            int fgColor = dark ? 0xFFF1F1F1 : 0xFF0F0F0F;
            float radius = dpToPx(res, 18);

            GradientDrawable normalBg = new GradientDrawable();
            normalBg.setColor(bgNormal);
            normalBg.setCornerRadius(radius);

            GradientDrawable pressedBg = new GradientDrawable();
            pressedBg.setColor(bgPressed);
            pressedBg.setCornerRadius(radius);

            StateListDrawable bg = new StateListDrawable();
            bg.addState(new int[]{android.R.attr.state_pressed}, pressedBg);
            bg.addState(new int[]{}, normalBg);
            setBackground(bg);

            CommentBubbleIcon icon = new CommentBubbleIcon(context, fgColor);
            int iconSize = dpToPx(res, 18);
            LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(iconSize, iconSize);
            iconLp.rightMargin = dpToPx(res, 6);
            addView(icon, iconLp);

            TextView label = new TextView(context);
            label.setText("Comment");
            label.setTextColor(fgColor);
            label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
            label.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            label.setSingleLine(true);
            addView(label);

            setOnClickListener(new OnClickListener() {
                @Override
                public void onClick(View v) {
                    if (onClickAction != null) {
                        onClickAction.run();
                    }
                }
            });
        }
    }

    private static final class CommentBubbleIcon extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();

        CommentBubbleIcon(Context context, int color) {
            super(context);
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            int w = getWidth();
            int h = getHeight();
            if (w <= 0 || h <= 0) {
                return;
            }
            float s = Math.min(w, h) / 24f;
            float ox = (w - 24f * s) * 0.5f;
            float oy = (h - 24f * s) * 0.5f;
            canvas.save();
            canvas.translate(ox, oy);

            paint.setStrokeWidth(1.7f * s);
            path.reset();
            path.moveTo(4f * s, 5.5f * s);
            path.quadTo(4f * s, 4f * s, 5.5f * s, 4f * s);
            path.lineTo(18.5f * s, 4f * s);
            path.quadTo(20f * s, 4f * s, 20f * s, 5.5f * s);
            path.lineTo(20f * s, 15.5f * s);
            path.quadTo(20f * s, 17f * s, 18.5f * s, 17f * s);
            path.lineTo(9.2f * s, 17f * s);
            path.lineTo(5.2f * s, 20.5f * s);
            path.lineTo(5.2f * s, 17f * s);
            path.lineTo(5.5f * s, 17f * s);
            path.quadTo(4f * s, 17f * s, 4f * s, 15.5f * s);
            path.close();
            canvas.drawPath(path, paint);

            canvas.drawLine(8f * s, 9f * s, 16f * s, 9f * s, paint);
            canvas.drawLine(8f * s, 12.5f * s, 13.5f * s, 12.5f * s, paint);

            canvas.restore();
        }
    }

    // -------------------------------------------------------------------------
    // Shared View & Theme utilities
    // -------------------------------------------------------------------------

    private static int resolveWatchSurfaceColor(Activity activity, View reference) {
        View cur = reference;
        for (int i = 0; i < 6 && cur != null; i++) {
            Drawable bg = cur.getBackground();
            if (bg instanceof ColorDrawable) {
                int c = ((ColorDrawable) bg).getColor();
                if (Color.alpha(c) > 220) {
                    return c;
                }
            }
            ViewParent p = cur.getParent();
            cur = p instanceof View ? (View) p : null;
        }
        return isDarkTheme(activity) ? 0xFF0F0F0F : 0xFFFFFFFF;
    }

    private static boolean isDarkTheme(Context context) {
        if (context == null || context.getResources() == null) {
            return true;
        }
        int mode = context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return mode == Configuration.UI_MODE_NIGHT_YES;
    }

    private static boolean isImeOrDialogActive(Activity activity, View anchor) {
        if (activity == null) {
            return false;
        }
        try {
            if (!activity.hasWindowFocus()) {
                return true;
            }
            View focus = activity.getCurrentFocus();
            if (focus instanceof EditText) {
                return true;
            }
            if (Build.VERSION.SDK_INT >= 30 && anchor != null) {
                WindowInsets insets = anchor.getRootWindowInsets();
                if (insets != null && insets.isVisible(WindowInsets.Type.ime())) {
                    return true;
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static float getEffectiveAlpha(View v) {
        float alpha = 1f;
        View cur = v;
        int steps = 0;
        while (cur != null && steps < 12) {
            alpha *= cur.getAlpha();
            if (alpha < 0.05f) {
                return alpha;
            }
            ViewParent p = cur.getParent();
            cur = p instanceof View ? (View) p : null;
            steps++;
        }
        return alpha;
    }

    private static boolean isRecyclerView(View v) {
        if (v == null) {
            return false;
        }
        Class<?> cls = v.getClass();
        for (int depth = 0; depth < 6 && cls != null && cls != ViewGroup.class && cls != Object.class; depth++) {
            String name = cls.getName();
            if (name.contains("RecyclerView")) {
                return true;
            }
            cls = cls.getSuperclass();
        }
        return false;
    }

    private static boolean isInsideOurHost(View v) {
        ViewParent p = v.getParent();
        while (p instanceof View) {
            if (HOST_TAG.equals(((View) p).getTag())) {
                return true;
            }
            p = p.getParent();
        }
        return false;
    }

    private static boolean isDescendantOf(View child, View potentialAncestor) {
        if (child == null || potentialAncestor == null) {
            return false;
        }
        ViewParent p = child.getParent();
        while (p instanceof View) {
            if (p == potentialAncestor) {
                return true;
            }
            p = p.getParent();
        }
        return false;
    }

    private static boolean isAncestorOf(View potentialAncestor, View child) {
        return potentialAncestor == child || isDescendantOf(child, potentialAncestor);
    }

    private static int getRelativeLeft(View child, View ancestor) {
        int left = 0;
        View cur = child;
        while (cur != null && cur != ancestor) {
            left += cur.getLeft();
            ViewParent p = cur.getParent();
            cur = p instanceof View ? (View) p : null;
        }
        return left;
    }

    private static int getRelativeTop(View child, View ancestor) {
        int top = 0;
        View cur = child;
        while (cur != null && cur != ancestor) {
            top += cur.getTop();
            ViewParent p = cur.getParent();
            cur = p instanceof View ? (View) p : null;
        }
        return top;
    }

    private static String getResourceEntryNameSafe(View v) {
        if (v == null) {
            return "";
        }
        int id = v.getId();
        if (id == View.NO_ID || id == 0) {
            return "";
        }
        try {
            Resources res = v.getResources();
            if (res != null) {
                String name = res.getResourceEntryName(id);
                return name != null ? name.toLowerCase(Locale.US) : "";
            }
        } catch (Throwable ignored) {
        }
        return "";
    }

    private static int dpToPx(Resources res, int dp) {
        if (res == null) {
            return dp * 2;
        }
        return Math.round(dp * res.getDisplayMetrics().density);
    }
}
