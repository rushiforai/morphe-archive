package app.voidhack.extension.applemusic.lyrics;

import java.util.Map;
import java.util.WeakHashMap;

/**
 * Pure Java state machine for synchronized lyrics scroll recovery and auto-return.
 *
 * <p>Addresses Apple Music Android's scroll-sync issues:
 * <ul>
 *   <li>Automatically returns to the currently playing lyric line after scrolling away
 *       once the user stops touching/scrolling while playback is running.</li>
 *   <li>Clears leaked share-touch lock flags that otherwise permanently block auto-scroll
 *       even after the user manually scrolls back to the active line.</li>
 *   <li>Resolves the active synced target even during gaps/intros/instrumentals when
 *       Apple Music's active line indices are temporarily {@code -1}.</li>
 *   <li>Realigns or catches up when a line transition occurred while the user was touching
 *       or settling a scroll, or when returning to the lyrics screen on the same line.</li>
 * </ul>
 */
final class LyricsScrollSyncPolicy {
    static final int ACTION_DOWN = 0;
    static final int ACTION_UP = 1;
    static final int ACTION_CANCEL = 3;

    static final int SCROLL_STATE_IDLE = 0;
    static final int SCROLL_STATE_DRAGGING = 1;
    static final int SCROLL_STATE_SETTLING = 2;

    static final int VIEW_TYPE_INSTRUMENTAL = 2;

    static final long AUTO_RETURN_DELAY_MS = 4000L;
    static final long REALIGN_DELAY_MS = 2000L;
    static final long SHARE_LAUNCH_GUARD_MS = 3000L;

    interface Scheduler {
        void postDelayed(Runnable task, long delayMs);

        void cancel(Runnable task);
    }

    interface Clock {
        long nowMs();
    }

    private final Scheduler scheduler;
    private final Clock clock;
    private final Map<LyricsScrollHost, State> states = new WeakHashMap<>();

    private final class State {
        final LyricsScrollHost host;
        boolean touchingTapTarget;
        boolean touchingRecycler;
        boolean userScrolled;
        boolean missedSyncWhileBusy;
        boolean shareTransitionActive;
        long shareLaunchTimeMs;
        boolean autoReturnScheduled;
        boolean touchIdleCheckScheduled;

        final Runnable autoReturnTask = new Runnable() {
            @Override
            public void run() {
                autoReturnScheduled = false;
                onAutoReturnTimer(host, State.this);
            }
        };

        final Runnable touchIdleCheckTask = new Runnable() {
            @Override
            public void run() {
                touchIdleCheckScheduled = false;
                onTouchIdleSettled(host, State.this);
            }
        };

        State(LyricsScrollHost host) {
            this.host = host;
        }

        boolean isTouching() {
            return touchingTapTarget || touchingRecycler;
        }

        void cancelAutoReturn() {
            if (autoReturnScheduled) {
                autoReturnScheduled = false;
                scheduler.cancel(autoReturnTask);
            }
        }

        void scheduleAutoReturn(long delayMs) {
            cancelAutoReturn();
            autoReturnScheduled = true;
            scheduler.postDelayed(autoReturnTask, delayMs);
        }

        void scheduleAutoReturnIfAbsent(long delayMs) {
            if (!autoReturnScheduled) {
                autoReturnScheduled = true;
                scheduler.postDelayed(autoReturnTask, delayMs);
            }
        }

        void scheduleTouchIdleCheck() {
            if (touchIdleCheckScheduled) {
                scheduler.cancel(touchIdleCheckTask);
            }
            touchIdleCheckScheduled = true;
            scheduler.postDelayed(touchIdleCheckTask, 0L);
        }

        void cancelAll() {
            cancelAutoReturn();
            if (touchIdleCheckScheduled) {
                touchIdleCheckScheduled = false;
                scheduler.cancel(touchIdleCheckTask);
            }
        }
    }

    LyricsScrollSyncPolicy(Scheduler scheduler, Clock clock) {
        this.scheduler = scheduler;
        this.clock = clock;
    }

    private State state(LyricsScrollHost host) {
        State s = states.get(host);
        if (s == null) {
            s = new State(host);
            states.put(host, s);
        }
        return s;
    }

    private boolean isShareGuarded(LyricsScrollHost host, State s) {
        if (host.voidhackIsSharePending()) return true;
        if (!s.shareTransitionActive) return false;
        if (clock.nowMs() - s.shareLaunchTimeMs > SHARE_LAUNCH_GUARD_MS) {
            s.shareTransitionActive = false;
            return false;
        }
        return true;
    }

    private void clearLeakedShareLock(LyricsScrollHost host, State s) {
        if (!s.isTouching() && !isShareGuarded(host, s) && host.voidhackIsPossibleShare()) {
            host.voidhackClearShareLock();
        }
    }

    void onTapTargetTouchBefore(LyricsScrollHost host, int actionMasked) {
        if (host == null) return;
        State s = state(host);
        if (actionMasked == ACTION_DOWN) {
            s.touchingTapTarget = true;
            s.cancelAutoReturn();
        }
    }

    void onTapTargetTouchAfter(LyricsScrollHost host, int actionMasked) {
        if (host == null) return;
        State s = state(host);
        if (actionMasked == ACTION_UP || actionMasked == ACTION_CANCEL) {
            s.touchingTapTarget = false;
            if (!s.isTouching()) {
                s.scheduleTouchIdleCheck();
            }
        }
    }

    void onTapTargetCanceled(LyricsScrollHost host) {
        if (host == null) return;
        State s = state(host);
        s.touchingTapTarget = false;
        s.touchingRecycler = false;
        s.scheduleTouchIdleCheck();
    }

    void onRecyclerTouchBefore(LyricsScrollHost host, int actionMasked) {
        if (host == null) return;
        State s = state(host);
        if (actionMasked == ACTION_DOWN) {
            s.touchingRecycler = true;
            s.cancelAutoReturn();
            // A stale share-pending flag from an earlier delayed share must not poison this gesture.
            host.voidhackClearSharePending();
        }
    }

    void onRecyclerTouchAfter(LyricsScrollHost host, int actionMasked) {
        if (host == null) return;
        State s = state(host);
        if (actionMasked == ACTION_UP || actionMasked == ACTION_CANCEL) {
            s.touchingRecycler = false;
            if (actionMasked == ACTION_CANCEL) {
                s.touchingTapTarget = false;
            }
            if (!s.isTouching()) {
                s.scheduleTouchIdleCheck();
            }
        }
    }

    void onScrollStateChanged(LyricsScrollHost host, int scrollState) {
        if (host == null) return;
        State s = state(host);
        if (!host.voidhackIsSyncedLyrics()) {
            s.cancelAutoReturn();
            return;
        }

        if (scrollState == SCROLL_STATE_DRAGGING) {
            s.userScrolled = true;
            s.shareTransitionActive = false;
            s.cancelAutoReturn();
            if (!host.voidhackIsSharePending() && host.voidhackIsPossibleShare()) {
                host.voidhackClearShareLock();
            }
            return;
        }

        if (scrollState == SCROLL_STATE_SETTLING) {
            s.cancelAutoReturn();
            return;
        }

        if (scrollState == SCROLL_STATE_IDLE) {
            // Scroll only finishes after the user released the gesture; clear any stale touch flag.
            s.touchingTapTarget = false;
            s.touchingRecycler = false;
            clearLeakedShareLock(host, s);
            evaluateIdleAfterScroll(host, s);
        }
    }

    void beforeActiveLineUpdate(LyricsScrollHost host, int firstLine, int lastLine) {
        if (host == null || !host.voidhackIsSyncedLyrics()) return;
        State s = state(host);
        if (host.voidhackScrollState() == SCROLL_STATE_IDLE) {
            clearLeakedShareLock(host, s);
        }
    }

    void afterActiveLineUpdate(LyricsScrollHost host, int firstLine, int lastLine) {
        if (host == null || !host.voidhackIsSyncedLyrics()) return;
        State s = state(host);

        if (firstLine < 0) {
            if (host.voidhackIsScrolledAway()
                    && host.voidhackIsPlaying()
                    && host.voidhackIsUiActive()
                    && host.voidhackScrollState() == SCROLL_STATE_IDLE
                    && !s.isTouching()) {
                s.scheduleAutoReturnIfAbsent(AUTO_RETURN_DELAY_MS);
            }
            return;
        }

        if (host.voidhackIsScrolledAway()) {
            if (host.voidhackIsPlaying()
                    && host.voidhackIsUiActive()
                    && host.voidhackScrollState() == SCROLL_STATE_IDLE
                    && !s.isTouching()) {
                s.scheduleAutoReturnIfAbsent(AUTO_RETURN_DELAY_MS);
            }
            return;
        }

        if (s.isTouching() || host.voidhackScrollState() != SCROLL_STATE_IDLE || host.voidhackIsPossibleShare()) {
            s.missedSyncWhileBusy = true;
            return;
        }

        // Native auto-scroll just ran cleanly for this active line.
        s.cancelAutoReturn();
        s.userScrolled = false;
        s.missedSyncWhileBusy = false;
    }

    void onUserSeekLine(LyricsScrollHost host) {
        if (host == null) return;
        State s = state(host);
        s.cancelAutoReturn();
        s.userScrolled = false;
        s.missedSyncWhileBusy = false;
        s.shareTransitionActive = false;
        if (!host.voidhackIsSharePending() && host.voidhackIsPossibleShare()) {
            host.voidhackClearShareLock();
        }
    }

    void onShareLaunching(LyricsScrollHost host) {
        if (host == null) return;
        State s = state(host);
        s.shareTransitionActive = true;
        s.shareLaunchTimeMs = clock.nowMs();
        s.cancelAutoReturn();
    }

    void onShareLockCleared(LyricsScrollHost host) {
        if (host == null) return;
        State s = states.get(host);
        if (s != null) {
            s.shareTransitionActive = false;
        }
    }

    void onWindowFocusChanged(LyricsScrollHost host, boolean hasFocus) {
        if (host == null) return;
        State s = state(host);
        s.touchingTapTarget = false;
        s.touchingRecycler = false;
        if (!hasFocus) {
            s.cancelAutoReturn();
            return;
        }
        clearLeakedShareLock(host, s);
        if (!host.voidhackIsSyncedLyrics()
                || !host.voidhackIsPlaying()
                || !host.voidhackIsUiActive()
                || host.voidhackScrollState() != SCROLL_STATE_IDLE) {
            return;
        }
        if (host.voidhackIsScrolledAway()) {
            s.scheduleAutoReturnIfAbsent(AUTO_RETURN_DELAY_MS);
        } else if (s.missedSyncWhileBusy) {
            snapBackNow(host, s, false);
        }
    }

    void onBecameVisible(LyricsScrollHost host) {
        if (host == null) return;
        State s = state(host);
        s.touchingTapTarget = false;
        s.touchingRecycler = false;
        s.shareTransitionActive = false;
        if (!host.voidhackIsSyncedLyrics()) {
            s.cancelAutoReturn();
            return;
        }
        clearLeakedShareLock(host, s);
        if (host.voidhackIsPlaying()) {
            host.voidhackEnsureLyricsTimerRunning();
        }
        if (host.voidhackScrollState() == SCROLL_STATE_IDLE) {
            int target = resolveSyncTarget(host);
            if (target >= 0 && (host.voidhackIsScrolledAway() || !isTargetVisible(host, target))) {
                snapBackNow(host, s, host.voidhackActiveLineStart() < 0);
            }
        }
    }

    void onBecameHidden(LyricsScrollHost host) {
        if (host == null) return;
        State s = states.get(host);
        if (s != null) {
            s.cancelAll();
            s.touchingTapTarget = false;
            s.touchingRecycler = false;
        }
    }

    void onDestroyView(LyricsScrollHost host) {
        if (host == null) return;
        State s = states.remove(host);
        if (s != null) {
            s.cancelAll();
        }
    }

    void onPlaybackStateChanged(LyricsScrollHost host) {
        if (host == null) return;
        State s = state(host);
        if (!host.voidhackIsSyncedLyrics() || !host.voidhackIsPlaying()) {
            s.cancelAutoReturn();
            return;
        }
        if (!host.voidhackIsUiActive() || host.voidhackScrollState() != SCROLL_STATE_IDLE || s.isTouching()) {
            return;
        }
        clearLeakedShareLock(host, s);
        if (host.voidhackIsScrolledAway()) {
            s.scheduleAutoReturnIfAbsent(AUTO_RETURN_DELAY_MS);
        } else if (s.missedSyncWhileBusy) {
            snapBackNow(host, s, false);
        }
    }

    void onLyricsRendered(LyricsScrollHost host, boolean hasSongInfo) {
        if (host == null) return;
        State s = state(host);
        s.cancelAll();
        s.touchingTapTarget = false;
        s.touchingRecycler = false;
        s.userScrolled = false;
        s.missedSyncWhileBusy = false;
        if (!hasSongInfo || !host.voidhackIsSyncedLyrics()) {
            return;
        }
        clearLeakedShareLock(host, s);
        if (host.voidhackIsPlaying()) {
            if (host.voidhackActiveLineStart() < 0) {
                host.voidhackSetForceSync(true);
            }
        } else if (host.voidhackScrollState() == SCROLL_STATE_IDLE) {
            int target = resolveSyncTarget(host);
            if (target > 0) {
                host.voidhackSnapToSyncedPosition(target, target, false);
            }
        }
    }

    private void onTouchIdleSettled(LyricsScrollHost host, State s) {
        if (s.isTouching() || host.voidhackScrollState() != SCROLL_STATE_IDLE) {
            return;
        }
        clearLeakedShareLock(host, s);
        if (!host.voidhackIsSyncedLyrics() || !host.voidhackIsPlaying() || !host.voidhackIsUiActive()) {
            return;
        }
        if (s.missedSyncWhileBusy && !host.voidhackIsScrolledAway()) {
            snapBackNow(host, s, host.voidhackActiveLineStart() < 0);
            return;
        }
        if (host.voidhackIsScrolledAway()) {
            s.scheduleAutoReturnIfAbsent(AUTO_RETURN_DELAY_MS);
        } else if (s.userScrolled) {
            int target = resolveSyncTarget(host);
            if (target >= 0 && !host.voidhackIsAlignedNearTop(target)) {
                s.scheduleAutoReturnIfAbsent(REALIGN_DELAY_MS);
            }
        }
    }

    private void evaluateIdleAfterScroll(LyricsScrollHost host, State s) {
        int target = resolveSyncTarget(host);
        boolean visible = isSyncRegionVisible(host, target);

        if (visible) {
            host.voidhackSetScrolledAway(false);
            if (host.voidhackActiveLineStart() < 0) {
                // During a gap/intro/instrumental where activeLineStart == -1, ensure the upcoming
                // line transition immediately tracks once it begins.
                host.voidhackSetForceSync(true);
            }
            if (host.voidhackIsPlaying() && host.voidhackIsUiActive()) {
                if (target >= 0 && !host.voidhackIsAlignedNearTop(target)) {
                    s.scheduleAutoReturn(REALIGN_DELAY_MS);
                } else {
                    s.cancelAutoReturn();
                    s.userScrolled = false;
                    s.missedSyncWhileBusy = false;
                }
            } else {
                s.cancelAutoReturn();
            }
            return;
        }

        host.voidhackSetScrolledAway(true);
        if (host.voidhackIsPlaying() && host.voidhackIsUiActive()) {
            s.scheduleAutoReturn(AUTO_RETURN_DELAY_MS);
        } else {
            s.cancelAutoReturn();
        }
    }

    private void onAutoReturnTimer(LyricsScrollHost host, State s) {
        if (!host.voidhackIsSyncedLyrics()
                || !host.voidhackIsPlaying()
                || !host.voidhackIsUiActive()
                || host.voidhackScrollState() != SCROLL_STATE_IDLE
                || s.isTouching()
                || isShareGuarded(host, s)) {
            return;
        }
        snapBackNow(host, s, true);
    }

    private void snapBackNow(LyricsScrollHost host, State s, boolean forceNextSync) {
        if (host.voidhackIsPossibleShare() && !isShareGuarded(host, s)) {
            host.voidhackClearShareLock();
        }
        int target = resolveSyncTarget(host);
        int activeEnd = host.voidhackActiveLineEnd();
        if (activeEnd < 0) {
            activeEnd = target;
        }
        s.cancelAutoReturn();
        s.userScrolled = false;
        s.missedSyncWhileBusy = false;
        if (target >= 0) {
            host.voidhackSnapToSyncedPosition(target, activeEnd, forceNextSync);
        } else {
            host.voidhackSetScrolledAway(false);
            if (forceNextSync) {
                host.voidhackSetForceSync(true);
            }
        }
    }

    int resolveSyncTarget(LyricsScrollHost host) {
        int activeStart = host.voidhackActiveLineStart();
        if (activeStart >= 0) {
            // PlayerLyricsViewFragment.G0/H0 already hold adapter positions (passed directly to e2/u1).
            return clampPosition(host, activeStart);
        }
        int instrumental = findInstrumentalPosition(host);
        if (instrumental >= 0) {
            return instrumental;
        }
        int lineIndex = host.voidhackPlaybackLineIndex();
        if (lineIndex >= 0) {
            return clampPosition(host, host.voidhackLineToAdapterPosition(lineIndex));
        }
        return -1;
    }

    private boolean isSyncRegionVisible(LyricsScrollHost host, int targetPos) {
        if (isTargetVisible(host, targetPos)) return true;
        int activeEnd = host.voidhackActiveLineEnd();
        if (activeEnd >= 0) {
            int endPos = clampPosition(host, activeEnd);
            if (isTargetVisible(host, endPos)) return true;
        }
        int first = host.voidhackFirstVisiblePosition();
        int last = host.voidhackLastVisiblePosition();
        if (first >= 0 && last >= first) {
            for (int pos = first; pos <= last; pos++) {
                if (host.voidhackAdapterItemViewType(pos) == VIEW_TYPE_INSTRUMENTAL) {
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean isTargetVisible(LyricsScrollHost host, int position) {
        if (position < 0) return false;
        int first = host.voidhackFirstVisiblePosition();
        int last = host.voidhackLastVisiblePosition();
        return first >= 0 && last >= first && position >= first && position <= last;
    }

    private static int findInstrumentalPosition(LyricsScrollHost host) {
        int count = host.voidhackAdapterItemCount();
        for (int i = 0; i < count; i++) {
            if (host.voidhackAdapterItemViewType(i) == VIEW_TYPE_INSTRUMENTAL) {
                return i;
            }
        }
        return -1;
    }

    private static int clampPosition(LyricsScrollHost host, int position) {
        int count = host.voidhackAdapterItemCount();
        if (count <= 0) return position;
        if (position < 0) return -1;
        return Math.min(position, count - 1);
    }
}
