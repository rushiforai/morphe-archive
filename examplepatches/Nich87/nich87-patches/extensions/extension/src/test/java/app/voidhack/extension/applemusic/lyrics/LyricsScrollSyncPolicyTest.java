package app.voidhack.extension.applemusic.lyrics;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

public final class LyricsScrollSyncPolicyTest {

    private static final class FakeScheduler implements LyricsScrollSyncPolicy.Scheduler, LyricsScrollSyncPolicy.Clock {
        private static final class Scheduled {
            final Runnable task;
            final long runAtMs;

            Scheduled(Runnable task, long runAtMs) {
                this.task = task;
                this.runAtMs = runAtMs;
            }
        }

        private long nowMs = 10_000L;
        private final List<Scheduled> queue = new ArrayList<>();

        @Override
        public long nowMs() {
            return nowMs;
        }

        @Override
        public void postDelayed(Runnable task, long delayMs) {
            queue.add(new Scheduled(task, nowMs + Math.max(0L, delayMs)));
            queue.sort(Comparator.comparingLong(s -> s.runAtMs));
        }

        @Override
        public void cancel(Runnable task) {
            for (Iterator<Scheduled> it = queue.iterator(); it.hasNext();) {
                if (it.next().task == task) it.remove();
            }
        }

        void advanceBy(long deltaMs) {
            long target = nowMs + deltaMs;
            while (true) {
                Scheduled next = null;
                for (Scheduled item : queue) {
                    if (item.runAtMs <= target) {
                        next = item;
                        break;
                    }
                }
                if (next == null) break;
                queue.remove(next);
                nowMs = Math.max(nowMs, next.runAtMs);
                next.task.run();
            }
            nowMs = target;
        }

        boolean hasPending() {
            return !queue.isEmpty();
        }
    }

    private static final class FakeHost implements LyricsScrollHost {
        boolean syncedLyrics = true;
        boolean playing = true;
        long playbackPositionMs = 30_000L;
        boolean uiActive = true;
        int scrollState = LyricsScrollSyncPolicy.SCROLL_STATE_IDLE;
        int firstVisible = 10;
        int lastVisible = 15;
        int activeStart = 10;
        int activeEnd = 10;
        boolean scrolledAway = false;
        boolean sharePending = false;
        boolean possibleShare = false;
        boolean forceSync = false;
        int itemCount = 40;
        int instrumentalPos = -1;
        int playbackLineIndex = 10;
        boolean alignedNearTop = true;

        int clearShareLockCount = 0;
        int ensureTimerCount = 0;
        int snapCount = 0;
        int lastSnapPos = -1;
        int lastSnapEnd = -1;
        boolean lastSnapForceSync = false;

        @Override public boolean voidhackIsSyncedLyrics() { return syncedLyrics; }
        @Override public boolean voidhackIsPlaying() { return playing; }
        @Override public long voidhackPlaybackPositionMs() { return playbackPositionMs; }
        @Override public boolean voidhackIsUiActive() { return uiActive; }
        @Override public int voidhackScrollState() { return scrollState; }
        @Override public int voidhackFirstVisiblePosition() { return firstVisible; }
        @Override public int voidhackLastVisiblePosition() { return lastVisible; }
        @Override public int voidhackActiveLineStart() { return activeStart; }
        @Override public int voidhackActiveLineEnd() { return activeEnd; }
        @Override public boolean voidhackIsScrolledAway() { return scrolledAway; }
        @Override public boolean voidhackIsSharePending() { return sharePending; }
        @Override public boolean voidhackIsPossibleShare() { return possibleShare; }

        @Override
        public void voidhackClearSharePending() {
            sharePending = false;
        }

        @Override
        public void voidhackClearShareLock() {
            possibleShare = false;
            clearShareLockCount++;
        }

        @Override
        public void voidhackSetScrolledAway(boolean value) {
            scrolledAway = value;
        }

        @Override
        public void voidhackSetForceSync(boolean value) {
            forceSync = value;
        }

        @Override
        public void voidhackSnapToSyncedPosition(int adapterPosition, int activeLineEnd, boolean setForceSync) {
            snapCount++;
            lastSnapPos = adapterPosition;
            lastSnapEnd = activeLineEnd;
            lastSnapForceSync = setForceSync;
            scrolledAway = false;
            forceSync = setForceSync;
            firstVisible = adapterPosition;
            lastVisible = Math.min(itemCount - 1, adapterPosition + 5);
            alignedNearTop = true;
        }

        @Override
        public void voidhackEnsureLyricsTimerRunning() {
            ensureTimerCount++;
        }

        @Override
        public int voidhackLineToAdapterPosition(int lineIndex) {
            if (instrumentalPos >= 0 && lineIndex >= instrumentalPos) return lineIndex + 1;
            return lineIndex;
        }

        @Override public int voidhackAdapterItemCount() { return itemCount; }

        @Override
        public int voidhackAdapterItemViewType(int position) {
            return position == instrumentalPos ? LyricsScrollSyncPolicy.VIEW_TYPE_INSTRUMENTAL : 0;
        }

        @Override public int voidhackPlaybackLineIndex() { return playbackLineIndex; }
        @Override public boolean voidhackIsAlignedNearTop(int adapterPosition) { return alignedNearTop; }
    }

    @Test
    public void autoReturnsToLiveSyncedLineAfterScrollingAway() {
        FakeScheduler scheduler = new FakeScheduler();
        LyricsScrollSyncPolicy policy = new LyricsScrollSyncPolicy(scheduler, scheduler);
        FakeHost host = new FakeHost();

        // User scrolls away from line 10 to lines 25..30.
        policy.onRecyclerTouchBefore(host, LyricsScrollSyncPolicy.ACTION_DOWN);
        host.scrollState = LyricsScrollSyncPolicy.SCROLL_STATE_DRAGGING;
        policy.onScrollStateChanged(host, LyricsScrollSyncPolicy.SCROLL_STATE_DRAGGING);
        host.firstVisible = 25;
        host.lastVisible = 30;
        policy.onRecyclerTouchAfter(host, LyricsScrollSyncPolicy.ACTION_UP);
        host.scrollState = LyricsScrollSyncPolicy.SCROLL_STATE_IDLE;
        policy.onScrollStateChanged(host, LyricsScrollSyncPolicy.SCROLL_STATE_IDLE);

        assertTrue(host.scrolledAway);
        assertEquals(0, host.snapCount);

        // Playback advances to line 12 while user is still reading away; countdown must not reset.
        scheduler.advanceBy(2000L);
        host.activeStart = 12;
        host.activeEnd = 12;
        policy.beforeActiveLineUpdate(host, 12, 12);
        policy.afterActiveLineUpdate(host, 12, 12);
        assertEquals(0, host.snapCount);

        // Remaining 2 seconds elapse -> snaps directly to live line 12.
        scheduler.advanceBy(2000L);
        assertEquals(1, host.snapCount);
        assertEquals(12, host.lastSnapPos);
        assertFalse(host.scrolledAway);
        assertTrue(host.lastSnapForceSync);
    }

    @Test
    public void manualScrollBackExitsBrowseModeAndRealignsIfNeeded() {
        FakeScheduler scheduler = new FakeScheduler();
        LyricsScrollSyncPolicy policy = new LyricsScrollSyncPolicy(scheduler, scheduler);
        FakeHost host = new FakeHost();
        host.scrolledAway = true;
        host.activeStart = 10;
        host.activeEnd = 10;
        host.possibleShare = true; // Simulate leaked share lock.

        // User scrolls back so line 10 is visible near the bottom (not aligned to top).
        host.scrollState = LyricsScrollSyncPolicy.SCROLL_STATE_DRAGGING;
        policy.onScrollStateChanged(host, LyricsScrollSyncPolicy.SCROLL_STATE_DRAGGING);
        host.firstVisible = 6;
        host.lastVisible = 11;
        host.alignedNearTop = false;
        host.scrollState = LyricsScrollSyncPolicy.SCROLL_STATE_IDLE;
        policy.onScrollStateChanged(host, LyricsScrollSyncPolicy.SCROLL_STATE_IDLE);

        // Immediately exits manual browse mode and clears leaked share lock.
        assertFalse(host.scrolledAway);
        assertFalse(host.possibleShare);
        assertEquals(0, host.snapCount);

        // If the same line stays active for 2s, realigns to top highlight position.
        scheduler.advanceBy(LyricsScrollSyncPolicy.REALIGN_DELAY_MS);
        assertEquals(1, host.snapCount);
        assertEquals(10, host.lastSnapPos);
    }

    @Test
    public void leakedSharePendingFromDelayedShareIsClearedOnNextTouch() {
        FakeScheduler scheduler = new FakeScheduler();
        LyricsScrollSyncPolicy policy = new LyricsScrollSyncPolicy(scheduler, scheduler);
        FakeHost host = new FakeHost();
        host.sharePending = true; // Left over from delayed Share action.

        policy.onRecyclerTouchBefore(host, LyricsScrollSyncPolicy.ACTION_DOWN);
        assertFalse(host.sharePending);
    }

    @Test
    public void leakedPossibleShareIsSelfHealedBeforeActiveLineUpdate() {
        FakeScheduler scheduler = new FakeScheduler();
        LyricsScrollSyncPolicy policy = new LyricsScrollSyncPolicy(scheduler, scheduler);
        FakeHost host = new FakeHost();
        host.possibleShare = true;
        host.scrollState = LyricsScrollSyncPolicy.SCROLL_STATE_IDLE;

        policy.beforeActiveLineUpdate(host, 11, 11);
        assertFalse(host.possibleShare);
        assertEquals(1, host.clearShareLockCount);
    }

    @Test
    public void gapWithNegativeActiveLineStillRecognizesManualScrollBack() {
        FakeScheduler scheduler = new FakeScheduler();
        LyricsScrollSyncPolicy policy = new LyricsScrollSyncPolicy(scheduler, scheduler);
        FakeHost host = new FakeHost();
        host.activeStart = -1;
        host.activeEnd = -1;
        host.playbackLineIndex = 8;
        host.scrolledAway = true;

        host.scrollState = LyricsScrollSyncPolicy.SCROLL_STATE_DRAGGING;
        policy.onScrollStateChanged(host, LyricsScrollSyncPolicy.SCROLL_STATE_DRAGGING);
        host.firstVisible = 7;
        host.lastVisible = 12;
        host.scrollState = LyricsScrollSyncPolicy.SCROLL_STATE_IDLE;
        policy.onScrollStateChanged(host, LyricsScrollSyncPolicy.SCROLL_STATE_IDLE);

        assertFalse(host.scrolledAway);
        assertTrue(host.forceSync);
    }

    @Test
    public void doesNotAutoReturnWhilePausedOrWhileUserHoldsFinger() {
        FakeScheduler scheduler = new FakeScheduler();
        LyricsScrollSyncPolicy policy = new LyricsScrollSyncPolicy(scheduler, scheduler);
        FakeHost host = new FakeHost();
        host.playing = false;

        host.firstVisible = 30;
        host.lastVisible = 35;
        host.scrollState = LyricsScrollSyncPolicy.SCROLL_STATE_IDLE;
        policy.onScrollStateChanged(host, LyricsScrollSyncPolicy.SCROLL_STATE_IDLE);

        assertTrue(host.scrolledAway);
        assertFalse(scheduler.hasPending());
        scheduler.advanceBy(10_000L);
        assertEquals(0, host.snapCount);

        // Resume playback while holding finger down -> still must not snap until released.
        host.playing = true;
        policy.onRecyclerTouchBefore(host, LyricsScrollSyncPolicy.ACTION_DOWN);
        policy.onPlaybackStateChanged(host);
        scheduler.advanceBy(10_000L);
        assertEquals(0, host.snapCount);

        // Release finger -> snaps after 4s idle.
        policy.onRecyclerTouchAfter(host, LyricsScrollSyncPolicy.ACTION_UP);
        scheduler.advanceBy(LyricsScrollSyncPolicy.AUTO_RETURN_DELAY_MS);
        assertEquals(1, host.snapCount);
        assertEquals(10, host.lastSnapPos);
    }

    @Test
    public void missedSyncWhileHoldingFingerCatchesUpOnRelease() {
        FakeScheduler scheduler = new FakeScheduler();
        LyricsScrollSyncPolicy policy = new LyricsScrollSyncPolicy(scheduler, scheduler);
        FakeHost host = new FakeHost();

        policy.onRecyclerTouchBefore(host, LyricsScrollSyncPolicy.ACTION_DOWN);
        host.possibleShare = true;
        host.activeStart = 11;
        host.activeEnd = 11;
        policy.beforeActiveLineUpdate(host, 11, 11);
        policy.afterActiveLineUpdate(host, 11, 11);

        // User lifts finger -> should immediately catch up to line 11.
        host.possibleShare = false;
        policy.onRecyclerTouchAfter(host, LyricsScrollSyncPolicy.ACTION_UP);
        scheduler.advanceBy(1L);
        assertEquals(1, host.snapCount);
        assertEquals(11, host.lastSnapPos);
    }

    @Test
    public void becomingVisibleRestartsLyricsTimerAndSnapsIfScrolledAway() {
        FakeScheduler scheduler = new FakeScheduler();
        LyricsScrollSyncPolicy policy = new LyricsScrollSyncPolicy(scheduler, scheduler);
        FakeHost host = new FakeHost();
        host.scrolledAway = true;
        host.firstVisible = 28;
        host.lastVisible = 33;
        host.activeStart = 14;
        host.activeEnd = 14;

        policy.onBecameVisible(host);
        assertEquals(1, host.ensureTimerCount);
        assertEquals(1, host.snapCount);
        assertEquals(14, host.lastSnapPos);
        assertFalse(host.scrolledAway);
    }

    @Test
    public void pausedLyricsReloadRestoresCurrentLinePosition() {
        FakeScheduler scheduler = new FakeScheduler();
        LyricsScrollSyncPolicy policy = new LyricsScrollSyncPolicy(scheduler, scheduler);
        FakeHost host = new FakeHost();
        host.playing = false;
        host.activeStart = -1;
        host.activeEnd = -1;
        host.playbackLineIndex = 18;
        host.firstVisible = 0;
        host.lastVisible = 5;

        policy.onLyricsRendered(host, true);
        assertEquals(1, host.snapCount);
        assertEquals(18, host.lastSnapPos);
    }

    @Test
    public void instrumentalPositionDoesNotDoubleTranslateActiveAdapterPosition() {
        FakeScheduler scheduler = new FakeScheduler();
        LyricsScrollSyncPolicy policy = new LyricsScrollSyncPolicy(scheduler, scheduler);
        FakeHost host = new FakeHost();
        host.instrumentalPos = 5;
        host.activeStart = 7;
        host.activeEnd = 7;
        assertEquals(7, policy.resolveSyncTarget(host));

        host.activeStart = -1;
        host.activeEnd = -1;
        assertEquals(5, policy.resolveSyncTarget(host));
    }
}
