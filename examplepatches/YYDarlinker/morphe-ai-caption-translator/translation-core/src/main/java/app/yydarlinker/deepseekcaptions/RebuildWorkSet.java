package app.yydarlinker.deepseekcaptions;

import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/** Per-block work, admission and accounting. The owning session monitor serializes access. */
final class RebuildWorkSet {
    static final class Slot implements RebuildPresentationSelection.BlockView {
        RebuildProtocol.Plan accepted, pending, provisional;
        int state, attempts, slowRetries, pageRepairCount;
        long retryAt, uncoveredSince;
        String reason = "";
        boolean cacheChecked, cacheReading;
        Attempt attempt;

        @Override public RebuildProtocol.Plan accepted() { return accepted; }
        @Override public RebuildProtocol.Plan pending() { return pending; }
        @Override public RebuildProtocol.Plan provisional() { return provisional; }
        @Override public int state() { return state; }
        @Override public String reason() { return reason; }
    }

    /** Shared by one slot and the root's real transport Job. */
    static final class Attempt {
        final int index;
        final boolean priority;
        volatile boolean cancelled, sent, dispatched;
        volatile HttpURLConnection connection;
        boolean repair, slowRetry;
        int attemptsBeforeSlowRetry;

        Attempt(int index, boolean priority) {
            this.index = index;
            this.priority = priority;
        }
    }

    /** Only changed work is returned; no per-block content snapshot is made. */
    static final class Selection {
        private static final Selection EMPTY =
                new Selection(Collections.emptyList(), Collections.emptyList(), null);
        final List<Attempt> starts;
        final List<Integer> abandoned;
        final Attempt pending;

        private Selection(List<Attempt> starts, List<Integer> abandoned, Attempt pending) {
            this.starts = starts;
            this.abandoned = abandoned;
            this.pending = pending;
        }
    }

    Slot[] slots;
    int repairCount;
    volatile long providerRetry;
    long lastSeekAt = -1, prefetchPausedUntil;
    boolean everReady;
    final Set<Integer> filteredBlocks = new HashSet<>();
    final Set<Integer> pendingHoles = new HashSet<>(), queuedHoles = new HashSet<>();
    final Set<String> pageRepairs = new HashSet<>(), queuedPages = new HashSet<>();

    void initialize(int count) {
        slots = new Slot[count];
        for (int i = 0; i < count; i++) slots[i] = new Slot();
    }

    /** The slot itself is the persistent read-only view; no per-render wrapper is allocated. */
    RebuildPresentationSelection.BlockView block(int index) { return slots[index]; }

    void adoptPending(int index) {
        Slot slot = slots[index];
        slot.accepted = slot.pending;
        slot.pending = null;
    }

    void clearUncovered(int index) { slots[index].uncoveredSince = 0; }

    void startUncovered(int index, long now) { slots[index].uncoveredSince = now; }

    void noteSeek(long now) {
        if (lastSeekAt >= 0 && now - lastSeekAt <= RebuildController.SEEK_STORM_WINDOW_MS)
            prefetchPausedUntil = now + RebuildController.SEEK_STORM_PAUSE_MS;
        lastSeekAt = now;
    }

    void resetDisplay() {
        pageRepairs.clear();
        queuedPages.clear();
        if (slots != null) for (Slot slot : slots) {
            slot.pageRepairCount = 0;
            slot.uncoveredSince = 0;
        }
    }

    boolean prefetchPaused(int index, long now) {
        return now < prefetchPausedUntil
                && !(slots[index].accepted != null && lastSeekAt >= 0
                        && now - lastSeekAt >= RebuildController.SEEK_SETTLED_MS);
    }

    void markEverReady(int index) {
        if (everReady) return;
        Slot slot = slots[index];
        if (slot.accepted != null && slot.state == RebuildController.READY) everReady = true;
    }

    boolean eligible(int index, long now) {
        return !filteredBlocks.contains(index) && now >= providerRetry && now >= slots[index].retryAt;
    }

    int dispatched(boolean focus) {
        int count = 0;
        if (slots != null) for (Slot slot : slots) {
            Attempt attempt = slot.attempt;
            if (attempt != null && attempt.dispatched && attempt.priority == focus) count++;
        }
        return count;
    }

    void markDispatched(Attempt attempt) {
        if (attempt.repair) repairCount++;
        Slot slot = slots[attempt.index];
        slot.attempts++;
        slot.state = RebuildController.RUNNING;
        attempt.dispatched = true;
    }

    /** Selects and reserves ordinary focus/prefetch work; root owns actual Jobs and dispatch. */
    Selection select(List<RebuildPlanner.Block> blocks, int index, long position, long now,
                     boolean playbackAhead, int focusDispatched, int prefetchDispatched) {
        List<Attempt> starts = null;
        List<Integer> abandoned = null;
        Attempt pending = null;
        Slot landing = slots[index];
        boolean focusUnderWay = landing.accepted != null || landing.state == RebuildController.FAILED
                || landing.attempt != null && landing.attempt.sent;
        boolean allowAhead = focusUnderWay && !prefetchPaused(index, now) && playbackAhead;
        for (int i = index; i < blocks.size(); i++) {
            RebuildPlanner.Block block = blocks.get(i);
            if (block.start > position + 30000) break;
            if (i > index && !allowAhead) break;
            if (i > index && prefetchDispatched >= RebuildController.MAX_PREFETCH_CONCURRENCY) break;
            boolean focus = i == index;
            if (!focus && !everReady
                    && (i != index + 1 || block.start > position + RebuildController.BOOTSTRAP_NEXT_MS)) break;
            Slot slot = slots[i];
            if (slot.state != RebuildController.WAITING || slot.attempt != null || !eligible(i, now)) continue;
            if (slot.cacheReading || !slot.cacheChecked) continue;
            int maxAttempts = RebuildReview.hasSemanticRepairRisk(slot.accepted)
                    ? RebuildReview.MAX_SEMANTIC_ATTEMPTS
                    : slot.attempts == 2 && slot.accepted == null
                            && RebuildReview.structuralRetry(slot.reason)
                            && repairCount < RebuildReview.MAX_SESSION_REPAIRS ? 3 : 2;
            boolean slowRetry = false;
            int attemptsBeforeSlowRetry = slot.attempts;
            if (slot.attempts >= maxAttempts || slot.attempts > 0 && slot.accepted != null
                    && repairCount >= RebuildReview.MAX_SESSION_REPAIRS) {
                if (slot.accepted != null) {
                    slot.state = RebuildController.READY;
                    continue;
                }
                if (slot.slowRetries >= RebuildController.MAX_SLOW_RETRIES) {
                    slot.state = RebuildController.FAILED;
                    if (abandoned == null) abandoned = new ArrayList<>();
                    abandoned.add(i);
                    continue;
                }
                slot.slowRetries++;
                slot.attempts = Math.max(0, maxAttempts - 1);
                slowRetry = true;
            }
            Attempt attempt = new Attempt(i, focus);
            attempt.slowRetry = slowRetry;
            attempt.attemptsBeforeSlowRetry = attemptsBeforeSlowRetry;
            attempt.repair = !slowRetry && slot.attempts > 0
                    && (slot.accepted != null || RebuildReview.structuralRetry(slot.reason));
            slot.attempt = attempt;
            if (focus && focusDispatched >= RebuildController.MAX_FOCUS_CONCURRENCY) {
                slot.state = RebuildController.RUNNING;
                pending = attempt;
                break;
            }
            markDispatched(attempt);
            if (starts == null) starts = new ArrayList<>();
            starts.add(attempt);
            if (focus) focusDispatched++; else prefetchDispatched++;
        }
        if (starts == null && abandoned == null && pending == null) return Selection.EMPTY;
        return new Selection(starts == null ? Collections.emptyList() : starts,
                abandoned == null ? Collections.emptyList() : abandoned, pending);
    }

    void retirePending(Attempt pending, long now) {
        Slot slot = slots[pending.index];
        if (slot.attempt == pending) slot.attempt = null;
        if (slot.state == RebuildController.RUNNING) {
            slot.state = RebuildController.WAITING;
            deferRetry(pending.index, now, 500);
        }
    }

    void releaseGated(Attempt attempt, boolean terminal) {
        Slot slot = slots[attempt.index];
        if (slot.attempt != attempt) return;
        slot.attempt = null;
        if (attempt.dispatched) {
            slot.attempts = Math.max(0, slot.attempts - 1);
            if (attempt.repair) repairCount = Math.max(0, repairCount - 1);
        }
        if (attempt.slowRetry) {
            slot.attempts = attempt.attemptsBeforeSlowRetry;
            slot.slowRetries = Math.max(0, slot.slowRetries - 1);
        }
        boolean stopped = terminal || filteredBlocks.contains(attempt.index);
        slot.state = stopped ? (slot.accepted != null ? RebuildController.READY : RebuildController.FAILED)
                : RebuildController.WAITING;
    }

    void finishCancelled(Attempt attempt, long now) {
        Slot slot = slots[attempt.index];
        slot.attempt = null;
        slot.provisional = null;
        if (!attempt.sent) {
            if (slot.attempts > 1) repairCount = Math.max(0, repairCount - 1);
            slot.attempts = Math.max(0, slot.attempts - 1);
        }
        slot.state = RebuildController.WAITING;
        deferRetry(attempt.index, now, 500);
    }

    void deferRetry(int index, long now, long delay) {
        Slot slot = slots[index];
        slot.retryAt = Math.max(slot.retryAt, RetryAfter.after(now, delay));
    }

    void applyFailure(int index, String code, String reason, boolean fatal, boolean filtered,
                      long delay, long now) {
        Slot slot = slots[index];
        slot.reason = reason;
        if (filtered) filteredBlocks.add(index);
        slot.state = slot.accepted != null ? RebuildController.READY
                : fatal || filtered ? RebuildController.FAILED : RebuildController.WAITING;
        long backoff = slot.attempts >= 3 ? 15000 : slot.attempts >= 2 ? 5000 : 1200;
        deferRetry(index, now, Math.max(backoff, delay));
        if (code.equals("http_429") || code.startsWith("http_5"))
            providerRetry = Math.max(providerRetry, RetryAfter.after(now, Math.max(5000, delay)));
    }

    static int[] largestHole(List<int[]> holes) {
        int[] best = null;
        for (int[] hole : holes)
            if (best == null || hole[1] - hole[0] > best[1] - best[0]) best = hole;
        return best;
    }

    boolean admitHole(int index, boolean eligible, boolean canWait) {
        if (!eligible) {
            if (canWait) pendingHoles.add(index);
            return false;
        }
        pendingHoles.remove(index);
        slots[index].slowRetries++;
        return true;
    }

    static final class HoleReservation {
        final int index, generation;
        final RebuildPlanner.Block parent;
        final RebuildProtocol.Plan plan;

        HoleReservation(int index, int generation, RebuildPlanner.Block parent, RebuildProtocol.Plan plan) {
            this.index = index;
            this.generation = generation;
            this.parent = parent;
            this.plan = plan;
        }
    }

    List<HoleReservation> reservePendingHoles(List<RebuildPlanner.Block> blocks, long position, long now,
                                               boolean stopped, int generation) {
        List<HoleReservation> reserved = new ArrayList<>();
        for (Iterator<Integer> iterator = pendingHoles.iterator(); iterator.hasNext();) {
            int index = iterator.next();
            Slot slot = slots[index];
            RebuildProtocol.Plan plan = slot.accepted;
            RebuildPlanner.Block parent = blocks.get(index);
            if (stopped || filteredBlocks.contains(index) || plan == null || !plan.partial
                    || plan.holes.isEmpty() || slot.slowRetries >= 1 || position >= parent.end) {
                iterator.remove();
                continue;
            }
            if (slot.attempt != null || queuedHoles.contains(index) || !eligible(index, now)) continue;
            queuedHoles.add(index);
            reserved.add(new HoleReservation(index, generation, parent, plan));
        }
        return reserved;
    }

    boolean reservePage(int index, String key, int from, int to, long now) {
        Slot slot = slots[index];
        if (slot.provisional != null || slot.attempt != null || pageRepairs.contains(key)
                || queuedPages.contains(key) || slot.pageRepairCount >= RebuildController.MAX_PAGE_REPAIRS_PER_BLOCK)
            return false;
        if (slot.accepted != null && covered(slot.accepted, from, to)) return false;
        if (slot.accepted == null && slot.uncoveredSince > 0
                && now - slot.uncoveredSince < RebuildController.PAGE_REPAIR_GRACE_MS) return false;
        if (pageRepairs.size() > 128) pageRepairs.clear();
        pageRepairs.add(key);
        queuedPages.add(key);
        slot.pageRepairCount++;
        return true;
    }

    static boolean covered(RebuildProtocol.Plan plan, int from, int to) {
        for (RebuildProtocol.Event event : plan.events)
            if (event.from <= from && event.to >= to) return true;
        return false;
    }

    void admitPage(String key) {
        queuedPages.remove(key); // Only unadmitted reservations can be refunded.
    }

    void releasePage(int index, String key) {
        if (queuedPages.remove(key)) {
            pageRepairs.remove(key);
            if (slots != null) slots[index].pageRepairCount = Math.max(0, slots[index].pageRepairCount - 1);
        }
    }
}
