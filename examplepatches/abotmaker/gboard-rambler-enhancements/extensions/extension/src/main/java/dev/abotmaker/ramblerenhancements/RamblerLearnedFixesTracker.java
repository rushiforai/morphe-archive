package dev.abotmaker.ramblerenhancements;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.InputType;
import android.util.Log;
import android.view.inputmethod.EditorInfo;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Anchor-based post-dictation edit tracker and runtime hook bridge for Auto "Learn From My Fixes".
 *
 * <p>Ported from Hex by Anomaly's {@code DictationTracker.kt} (MIT License) and wired cleanly into
 * Gboard's {@code AgenticDictationExtension} commit pipeline and {@code AppInputContext} change
 * listener. Follows each inserted dictation in memory for 60 seconds using 32-character before/after
 * text anchors (never in password/sensitive fields), detects manual word corrections as well as
 * delete-and-redictate within 20 seconds, promotes repeated fixes into {@link RamblerLearnedFixes},
 * syncs newly learned words to {@code MUSE_STATS} when available, and displays a concise Toast
 * confirmation whenever a fix is automatically learned.</p>
 */
public final class RamblerLearnedFixesTracker {
    private static final String TAG = "RamblerEnhancements";
    public static final long EDIT_WINDOW_MS = 60_000L;
    public static final long REDICTATION_WINDOW_MS = 20_000L;
    public static final int ANCHOR_LENGTH = 32;
    public static final long CHECK_INTERVAL_MS = 10_000L;

    public static final class SurroundingText {
        public final String before;
        public final String after;

        public SurroundingText(String before, String after) {
            this.before = before;
            this.after = after;
        }
    }

    public interface TextTarget {
        SurroundingText readSurrounding(int reach);
    }

    public interface Clock {
        long elapsedRealtime();

        long currentTimeMillis();
    }

    public interface EditListener {
        void onEditSettled(RamblerLearnedFixes.DictationEdit edit);
    }

    public interface ToastNotifier {
        void showToast(Context context, String message);
    }

    private static final Clock SYSTEM_CLOCK = new Clock() {
        @Override
        public long elapsedRealtime() {
            return SystemClock.elapsedRealtime();
        }

        @Override
        public long currentTimeMillis() {
            return System.currentTimeMillis();
        }
    };

    private static final ToastNotifier SYSTEM_TOAST = new ToastNotifier() {
        @Override
        public void showToast(Context context, String message) {
            if (context == null || message == null || message.isEmpty()) {
                return;
            }
            final Context app = context.getApplicationContext() != null
                    ? context.getApplicationContext()
                    : context;
            Runnable show = new Runnable() {
                @Override
                public void run() {
                    try {
                        Toast.makeText(app, message, Toast.LENGTH_SHORT).show();
                    } catch (Throwable err) {
                        logWarningSafely("Failed to show auto-learned fix toast", err);
                    }
                }
            };
            if (Looper.myLooper() == Looper.getMainLooper()) {
                show.run();
            } else {
                new Handler(Looper.getMainLooper()).post(show);
            }
        }
    };

    /**
     * Pure, unit-testable state machine matching Hex Android's {@code DictationTracker}.
     */
    public static final class Tracker {
        private static final class Tracked {
            final String heard;
            final String inserted;
            final String anchorBefore;
            final String anchorAfter;
            final long insertedAt;
            String latest;
            boolean located;
            Long emptiedAt;
            boolean cleared;
            boolean byPerson;
            boolean undone;

            Tracked(
                    String heard,
                    String inserted,
                    String anchorBefore,
                    String anchorAfter,
                    long insertedAt) {
                this.heard = heard;
                this.inserted = inserted;
                this.anchorBefore = anchorBefore;
                this.anchorAfter = anchorAfter;
                this.insertedAt = insertedAt;
                this.latest = inserted;
            }
        }

        private final TextTarget target;
        private final Clock clock;
        private final EditListener listener;
        private Tracked tracked;
        private Tracked removed;
        private long removedAt;

        public Tracker(TextTarget target, Clock clock, EditListener listener) {
            this.target = target;
            this.clock = clock;
            this.listener = listener;
        }

        public boolean isTracking() {
            return tracked != null || removed != null;
        }

        public void inserted(String heard, String insertedText, String before, String after) {
            Tracked previous = tracked;
            tracked = null;
            if (previous != null) {
                settle(previous, clock.elapsedRealtime());
            }
            long at = clock.elapsedRealtime();
            int words = RamblerLearnedFixes.tokenizeWords(insertedText).size();
            if (words == 0 || words > RamblerLearnedFixes.MAX_WORDS) {
                return;
            }
            if (removed != null) {
                Tracked pending = removed;
                long pendingAt = removedAt;
                removed = null;
                removedAt = 0L;
                if (at - pendingAt > REDICTATION_WINDOW_MS) {
                    emitRemoval(pending);
                } else {
                    RamblerLearnedFixes.DictationEdit edit =
                            RamblerLearnedFixes.classifyRedictation(
                                    pending.heard, pending.inserted, insertedText);
                    if (edit != null) {
                        listener.onEditSettled(edit);
                    }
                }
            }
            String safeBefore = before == null ? "" : before;
            String safeAfter = after == null ? "" : after;
            String anchorBefore = safeBefore.length() > ANCHOR_LENGTH
                    ? safeBefore.substring(safeBefore.length() - ANCHOR_LENGTH)
                    : safeBefore;
            String anchorAfter = safeAfter.length() > ANCHOR_LENGTH
                    ? safeAfter.substring(0, ANCHOR_LENGTH)
                    : safeAfter;
            tracked = new Tracked(heard, insertedText, anchorBefore, anchorAfter, at);
        }

        public void observe() {
            long at = clock.elapsedRealtime();
            if (removed != null && at - removedAt > REDICTATION_WINDOW_MS) {
                Tracked pending = removed;
                removed = null;
                removedAt = 0L;
                emitRemoval(pending);
            }
            Tracked current = tracked;
            if (current == null) {
                return;
            }
            if (current.emptiedAt == null && at - current.insertedAt >= EDIT_WINDOW_MS) {
                tracked = null;
                settle(current, at);
                return;
            }
            if (!update(current)) {
                tracked = null;
                settle(current, at);
                return;
            }
            if (current.cleared) {
                tracked = null;
                settle(current, at);
                return;
            }
            if (current.emptiedAt != null && at - current.emptiedAt.longValue() > REDICTATION_WINDOW_MS) {
                tracked = null;
                settle(current, at);
            }
        }

        public void settleNow() {
            Tracked current = tracked;
            if (current == null) {
                return;
            }
            tracked = null;
            long at = clock.elapsedRealtime();
            if (update(current)) {
                settle(current, at);
            }
        }

        public void finish() {
            Tracked current = tracked;
            tracked = null;
            if (current != null) {
                settle(current, clock.elapsedRealtime());
            }
            if (removed != null) {
                Tracked pending = removed;
                removed = null;
                removedAt = 0L;
                emitRemoval(pending);
            }
        }

        public void keyboardRemoved() {
            if (tracked != null) {
                tracked.byPerson = true;
            }
        }

        public void sent() {
            Tracked current = tracked;
            tracked = null;
            removed = null;
            removedAt = 0L;
            if (current == null || !current.located) {
                return;
            }
            if (!RamblerLearnedFixes.tokenizeWords(current.latest).isEmpty()) {
                RamblerLearnedFixes.DictationEdit edit = RamblerLearnedFixes.classifyEdit(
                        current.heard, current.inserted, current.latest, current.undone);
                if (edit != null) {
                    listener.onEditSettled(edit);
                }
            } else {
                emitRemoval(current);
            }
        }

        private boolean update(Tracked current) {
            boolean expired = clock.elapsedRealtime() - current.insertedAt >= EDIT_WINDOW_MS;
            if (expired && current.emptiedAt == null) {
                return true;
            }
            int reach = current.inserted.length() + ANCHOR_LENGTH + 200;
            SurroundingText surrounding = target.readSurrounding(reach);
            if (surrounding == null || (surrounding.before == null && surrounding.after == null)) {
                return !current.located;
            }
            String currentBefore = surrounding.before == null ? "" : surrounding.before;
            String currentAfter = surrounding.after == null ? "" : surrounding.after;
            boolean startEdge = surrounding.before != null && currentBefore.length() < reach;
            boolean endEdge = surrounding.after != null && currentAfter.length() < reach;
            if (currentBefore.isEmpty() && currentAfter.isEmpty()) {
                if (!current.located) {
                    return true;
                }
                if (current.emptiedAt == null) {
                    current.emptiedAt = Long.valueOf(clock.elapsedRealtime());
                }
                current.cleared = !current.undone && !current.byPerson;
                if (!current.cleared) {
                    current.latest = "";
                }
                return true;
            }
            String text = currentBefore + currentAfter;
            List<Integer> starts;
            if (!current.anchorBefore.isEmpty()) {
                List<Integer> occ = occurrences(text, current.anchorBefore);
                starts = new ArrayList<Integer>(occ.size());
                int anchorLen = current.anchorBefore.length();
                for (Integer idx : occ) {
                    starts.add(Integer.valueOf(idx.intValue() + anchorLen));
                }
            } else if (startEdge) {
                starts = Collections.singletonList(Integer.valueOf(0));
            } else {
                starts = Collections.emptyList();
            }

            List<Integer> ends;
            if (!current.anchorAfter.isEmpty()) {
                ends = occurrences(text, current.anchorAfter);
            } else if (endEdge) {
                ends = Collections.singletonList(Integer.valueOf(text.length()));
            } else {
                ends = Collections.emptyList();
            }

            int bestStart = -1;
            int bestEnd = -1;
            int bestMiss = Integer.MAX_VALUE;
            for (Integer sObj : starts) {
                int start = sObj.intValue();
                int targetEnd = start + current.latest.length();
                int found = Collections.binarySearch(ends, Integer.valueOf(targetEnd));
                int at = found >= 0 ? found : (-found - 1);
                int lo = Math.max(0, at - 2);
                int hi = Math.min(ends.size() - 1, at + 2);
                for (int index = lo; index <= hi; index++) {
                    int end = ends.get(index).intValue();
                    if (end < start) {
                        continue;
                    }
                    int miss = Math.abs(end - targetEnd);
                    if (miss < bestMiss) {
                        bestMiss = miss;
                        bestStart = start;
                        bestEnd = end;
                    }
                }
            }
            if (bestStart < 0 || bestEnd - bestStart > current.inserted.length() * 4 + 200) {
                return !current.located;
            }
            String span = text.substring(bestStart, bestEnd);
            boolean hasWords = !RamblerLearnedFixes.tokenizeWords(span).isEmpty();
            if (hasWords) {
                if (expired) {
                    return true;
                }
                current.latest = span;
                current.located = true;
                current.emptiedAt = null;
                current.cleared = false;
                current.byPerson = false;
                current.undone = false;
            } else if (current.located) {
                current.latest = span;
                if (current.emptiedAt == null) {
                    current.emptiedAt = Long.valueOf(clock.elapsedRealtime());
                }
            }
            return true;
        }

        private void settle(Tracked current, long at) {
            if (!current.located) {
                return;
            }
            if (!RamblerLearnedFixes.tokenizeWords(current.latest).isEmpty()) {
                RamblerLearnedFixes.DictationEdit edit = RamblerLearnedFixes.classifyEdit(
                        current.heard, current.inserted, current.latest, current.undone);
                if (edit != null) {
                    listener.onEditSettled(edit);
                }
                return;
            }
            if (current.cleared) {
                emitRemoval(current);
                return;
            }
            long emptiedAt = current.emptiedAt != null ? current.emptiedAt.longValue() : at;
            if (at - emptiedAt > REDICTATION_WINDOW_MS) {
                emitRemoval(current);
            } else {
                removed = current;
                removedAt = emptiedAt;
            }
        }

        private void emitRemoval(Tracked current) {
            RamblerLearnedFixes.DictationEdit edit = RamblerLearnedFixes.classifyEdit(
                    current.heard, current.inserted, "", current.undone);
            if (edit != null) {
                listener.onEditSettled(edit);
            }
        }

        private static List<Integer> occurrences(String text, String anchor) {
            List<Integer> starts = new ArrayList<Integer>();
            int from = 0;
            while (true) {
                int at = text.indexOf(anchor, from);
                if (at < 0) {
                    return starts;
                }
                starts.add(Integer.valueOf(at));
                from = at + 1;
            }
        }
    }

    // ---- Live Gboard Runtime Integration ----

    private static final Object TRACKER_LOCK = new Object();
    private static volatile Clock activeClock = SYSTEM_CLOCK;
    private static volatile ToastNotifier toastNotifier = SYSTEM_TOAST;
    private static volatile WeakReference<Object> activePcnRef;
    private static volatile SurroundingText latestAppInputContextSnapshot;
    private static volatile String activeFieldKey;
    private static Tracker liveTracker;
    private static Handler pollHandler;
    private static Runnable pollRunnable;

    // Reflection caches for pcn / pdx / pdg / pdl
    private static volatile Class<?> cachedPcnClass;
    private static volatile Method cachedPcnSurroundingMethod;
    private static volatile Class<?> cachedPdxClass;
    private static volatile Method cachedPdxBeforeMethod;
    private static volatile Method cachedPdxAfterMethod;
    private static volatile Class<?> cachedPdgClass;
    private static volatile Field cachedPdgPdxField;
    private static volatile Field cachedPdgReasonHolderField;
    private static volatile Class<?> cachedPdlClass;
    private static volatile Field cachedPdlReasonEnumField;

    private RamblerLearnedFixesTracker() {
    }

    static void setClockForTesting(Clock clock) {
        synchronized (TRACKER_LOCK) {
            activeClock = clock == null ? SYSTEM_CLOCK : clock;
            liveTracker = null;
        }
    }

    static void setToastNotifierForTesting(ToastNotifier notifier) {
        toastNotifier = notifier == null ? SYSTEM_TOAST : notifier;
    }

    static void clearForTesting() {
        synchronized (TRACKER_LOCK) {
            cancelPollLocked();
            liveTracker = null;
            activePcnRef = null;
            latestAppInputContextSnapshot = null;
            activeFieldKey = null;
            activeClock = SYSTEM_CLOCK;
            toastNotifier = SYSTEM_TOAST;
            cachedPcnClass = null;
            cachedPcnSurroundingMethod = null;
            cachedPdxClass = null;
            cachedPdxBeforeMethod = null;
            cachedPdxAfterMethod = null;
            cachedPdgClass = null;
            cachedPdgPdxField = null;
            cachedPdgReasonHolderField = null;
            cachedPdlClass = null;
            cachedPdlReasonEnumField = null;
        }
    }

    /**
     * Returns {@code true} when {@code editorInfo} indicates a password or incognito/no-learning
     * input field where text must never be tracked.
     */
    public static boolean isSensitiveOrPasswordField(EditorInfo editorInfo) {
        if (editorInfo == null) {
            return false;
        }
        if ((editorInfo.imeOptions & EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING) != 0) {
            return true;
        }
        int inputType = editorInfo.inputType;
        int cls = inputType & InputType.TYPE_MASK_CLASS;
        int variation = inputType & InputType.TYPE_MASK_VARIATION;
        if (cls == InputType.TYPE_CLASS_TEXT) {
            return variation == InputType.TYPE_TEXT_VARIATION_PASSWORD
                    || variation == InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD
                    || variation == InputType.TYPE_TEXT_VARIATION_WEB_PASSWORD;
        }
        if (cls == InputType.TYPE_CLASS_NUMBER) {
            return variation == InputType.TYPE_NUMBER_VARIATION_PASSWORD;
        }
        return false;
    }

    /**
     * Reads pre-commit surrounding anchors right before Gboard commits dictated text.
     */
    public static SurroundingText readAnchorsBeforeCommit(Object pcn) {
        if (pcn == null) {
            return null;
        }
        return readSurroundingFromPcn(pcn, ANCHOR_LENGTH);
    }

    /**
     * Called right after {@code RamblerTextPipeline.processCommitText} transforms a dictation.
     */
    public static void onDictationCommitted(
            Context context,
            Object pcn,
            EditorInfo editorInfo,
            String heardBeforeFixes,
            String committedText,
            SurroundingText preCommitAnchors,
            boolean immediatelySubmitted) {
        if (context == null || !RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS) {
            return;
        }
        try {
            if (!RamblerEnhancementsSettings.readAutoLearnFixesEnabled(context)) {
                return;
            }
            if (isSensitiveOrPasswordField(editorInfo)) {
                finishTracking();
                return;
            }
            synchronized (TRACKER_LOCK) {
                activePcnRef = pcn == null ? null : new WeakReference<Object>(pcn);
                activeFieldKey = fieldKeyOf(editorInfo);
                latestAppInputContextSnapshot = null;
                Tracker tracker = ensureTrackerLocked();
                if (immediatelySubmitted) {
                    tracker.sent();
                    cancelPollLocked();
                    return;
                }
                String before = preCommitAnchors == null ? "" : preCommitAnchors.before;
                String after = preCommitAnchors == null ? "" : preCommitAnchors.after;
                tracker.inserted(heardBeforeFixes, committedText, before, after);
                if (tracker.isTracking()) {
                    schedulePollLocked();
                } else {
                    cancelPollLocked();
                }
            }
        } catch (Throwable err) {
            logWarningSafely("onDictationCommitted failed in learned-fixes tracker", err);
        }
    }

    /**
     * Called when a new Rambler dictation starts ({@code AgenticDictationExtension.onVoiceStart}).
     */
    public static void onVoiceStart() {
        if (!RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS) {
            return;
        }
        try {
            synchronized (TRACKER_LOCK) {
                if (liveTracker != null && liveTracker.isTracking()) {
                    liveTracker.settleNow();
                    if (!liveTracker.isTracking()) {
                        cancelPollLocked();
                    }
                }
            }
        } catch (Throwable err) {
            logWarningSafely("onVoiceStart settle failed in learned-fixes tracker", err);
        }
    }

    /**
     * Called from {@code AgenticDictationExtension.onActivateInternal(EditorInfo)} when the
     * active editor changes.
     */
    public static void onFieldChanged(Context context, EditorInfo editorInfo) {
        if (!RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS) {
            return;
        }
        try {
            String nextKey = fieldKeyOf(editorInfo);
            synchronized (TRACKER_LOCK) {
                boolean switched = activeFieldKey != null
                        && (!activeFieldKey.equals(nextKey) || isSensitiveOrPasswordField(editorInfo));
                if (switched && liveTracker != null && liveTracker.isTracking()) {
                    liveTracker.finish();
                    cancelPollLocked();
                }
                activeFieldKey = nextKey;
                latestAppInputContextSnapshot = null;
            }
        } catch (Throwable err) {
            logWarningSafely("onFieldChanged failed in learned-fixes tracker", err);
        }
    }

    /**
     * Hook called at entry of {@code AgenticDictationExtension.onDeactivate()V} when the keyboard
     * hides or leaves the field.
     */
    public static void onExtensionDeactivate() {
        if (!RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS) {
            return;
        }
        try {
            finishTracking();
        } catch (Throwable err) {
            logWarningSafely("onExtensionDeactivate failed in learned-fixes tracker", err);
        }
    }

    /**
     * Hook called at entry of {@code AgenticDictationExtension$4.onAppInputContextChanged(pdg)}
     * whenever text, deletions, or cursor position change in the focused field.
     */
    public static void onAppInputContextChanged(Object appInputContext) {
        if (appInputContext == null || !RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS) {
            return;
        }
        try {
            synchronized (TRACKER_LOCK) {
                if (liveTracker == null || !liveTracker.isTracking()) {
                    return;
                }
                Context ctx = RamblerFlagRuntime.resolveContext();
                if (ctx != null && !RamblerEnhancementsSettings.readAutoLearnFixesEnabled(ctx)) {
                    return;
                }
                String reason = extractReasonName(appInputContext);
                if ("DELETE".equals(reason)) {
                    liveTracker.keyboardRemoved();
                }
                SurroundingText snap = extractSurroundingFromPdg(appInputContext);
                if (snap != null) {
                    latestAppInputContextSnapshot = snap;
                }
                liveTracker.observe();
                if (!liveTracker.isTracking()) {
                    cancelPollLocked();
                }
            }
        } catch (Throwable err) {
            logWarningSafely("onAppInputContextChanged failed in learned-fixes tracker", err);
        }
    }

    public static void finishTracking() {
        synchronized (TRACKER_LOCK) {
            if (liveTracker != null && liveTracker.isTracking()) {
                liveTracker.finish();
            }
            cancelPollLocked();
            latestAppInputContextSnapshot = null;
        }
    }

    /**
     * Formats the user-visible toast message when one or more fixes are auto-learned.
     */
    public static String formatAutoLearnedToast(List<RamblerLearnedFixes.FixRecord> newlyLearned) {
        if (newlyLearned == null || newlyLearned.isEmpty()) {
            return null;
        }
        RamblerLearnedFixes.FixRecord first = newlyLearned.get(0);
        if (newlyLearned.size() == 1) {
            return "Rambler learned: \"" + first.heard + "\" \u2192 \"" + first.meant + "\"";
        }
        return "Rambler learned: \"" + first.heard + "\" \u2192 \"" + first.meant
                + "\" (+" + (newlyLearned.size() - 1) + " more)";
    }

    // ---- Internal runtime wiring ----

    private static Tracker ensureTrackerLocked() {
        if (liveTracker != null) {
            return liveTracker;
        }
        TextTarget target = new TextTarget() {
            @Override
            public SurroundingText readSurrounding(int reach) {
                Object pcn = activePcnRef == null ? null : activePcnRef.get();
                if (pcn != null) {
                    SurroundingText live = readSurroundingFromPcn(pcn, reach);
                    if (live != null) {
                        return live;
                    }
                }
                return latestAppInputContextSnapshot;
            }
        };
        EditListener listener = new EditListener() {
            @Override
            public void onEditSettled(RamblerLearnedFixes.DictationEdit edit) {
                handleSettledEdit(edit);
            }
        };
        liveTracker = new Tracker(target, activeClock, listener);
        return liveTracker;
    }

    private static void handleSettledEdit(RamblerLearnedFixes.DictationEdit edit) {
        Context ctx = RamblerFlagRuntime.resolveContext();
        if (ctx == null || edit == null) {
            return;
        }
        if (!RamblerEnhancementsSettings.readAutoLearnFixesEnabled(ctx)) {
            return;
        }
        RamblerLearnedFixes.RecordOutcome outcome =
                RamblerLearnedFixes.recordEdit(ctx, edit, activeClock.currentTimeMillis());
        if (!outcome.newlyLearned.isEmpty()) {
            // Also seed newly learned words into MUSE_STATS Personal Dictionary if enabled,
            // so future ASR sessions recognize them natively.
            seedNewlyLearnedIntoDictionaryAsync(ctx, outcome.newlyLearned);

            if (RamblerEnhancementsSettings.readAutoLearnToastEnabled(ctx)) {
                String msg = formatAutoLearnedToast(outcome.newlyLearned);
                if (msg != null) {
                    toastNotifier.showToast(ctx, msg);
                }
            }
        }
    }

    private static void seedNewlyLearnedIntoDictionaryAsync(
            final Context context, final List<RamblerLearnedFixes.FixRecord> newlyLearned) {
        if (!RamblerDynamicConfig.FEATURE_PERSONAL_DICTIONARY
                || !RamblerEnhancementsSettings.readUseDictionaryWords(context)) {
            return;
        }
        final List<String> words = new ArrayList<String>();
        for (RamblerLearnedFixes.FixRecord fix : newlyLearned) {
            String meant = fix.meant == null ? "" : fix.meant.trim();
            if (meant.length() >= 2 && meant.length() <= 64) {
                words.add(meant);
            }
        }
        if (words.isEmpty()) {
            return;
        }
        Thread worker = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    RamblerMuseStatsBridge.addWords(context, words);
                } catch (Throwable ignored) {
                    // Best-effort dictionary sync; replacement rule already active.
                }
            }
        }, "RamblerAutoLearnDictSync");
        worker.setDaemon(true);
        worker.start();
    }

    private static void schedulePollLocked() {
        cancelPollLocked();
        try {
            Looper mainLooper = Looper.getMainLooper();
            if (mainLooper == null) {
                return;
            }
            if (pollHandler == null) {
                pollHandler = new Handler(mainLooper);
            }
            pollRunnable = new Runnable() {
                @Override
                public void run() {
                    synchronized (TRACKER_LOCK) {
                        if (liveTracker == null || !liveTracker.isTracking()) {
                            pollRunnable = null;
                            return;
                        }
                        try {
                            liveTracker.observe();
                        } catch (Throwable err) {
                            logWarningSafely("Learned-fixes poll observe failed", err);
                        }
                        if (liveTracker != null && liveTracker.isTracking() && pollHandler != null) {
                            pollHandler.postDelayed(this, CHECK_INTERVAL_MS);
                        } else {
                            pollRunnable = null;
                        }
                    }
                }
            };
            pollHandler.postDelayed(pollRunnable, CHECK_INTERVAL_MS);
        } catch (Throwable ignored) {
            // Headless unit test without Android main looper.
        }
    }

    private static void cancelPollLocked() {
        if (pollHandler != null && pollRunnable != null) {
            try {
                pollHandler.removeCallbacks(pollRunnable);
            } catch (Throwable ignored) {
                // Ignore teardown errors.
            }
        }
        pollRunnable = null;
    }

    private static String fieldKeyOf(EditorInfo info) {
        if (info == null) {
            return "";
        }
        String pkg = info.packageName == null ? "" : info.packageName;
        return pkg + "#" + info.fieldId + "#" + info.inputType;
    }

    // ---- Reflection adapters for pcn / pdx / pdg / pdl ----

    private static SurroundingText readSurroundingFromPcn(Object pcn, int reach) {
        if (pcn == null || reach <= 0) {
            return null;
        }
        try {
            Class<?> cls = pcn.getClass();
            Method surrounding = cachedPcnSurroundingMethod;
            if (cachedPcnClass != cls || surrounding == null) {
                surrounding = resolvePcnSurroundingMethod(cls);
                cachedPcnSurroundingMethod = surrounding;
                cachedPcnClass = cls;
            }
            if (surrounding == null) {
                return null;
            }
            Object pdx = surrounding.invoke(
                    pcn, Integer.valueOf(reach), Integer.valueOf(reach), Integer.valueOf(0));
            return extractSurroundingFromPdx(pdx);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Method resolvePcnSurroundingMethod(Class<?> pcnClass) {
        String preferred = RamblerDynamicConfig.PCN_SURROUNDING_TEXT_METHOD;
        if (preferred != null && !preferred.isEmpty()) {
            try {
                Method m = pcnClass.getMethod(preferred, int.class, int.class, int.class);
                if (!Modifier.isStatic(m.getModifiers()) && m.getReturnType() != void.class) {
                    m.setAccessible(true);
                    return m;
                }
            } catch (Throwable ignored) {
                // Fall back to signature scan.
            }
        }
        for (Method m : pcnClass.getMethods()) {
            if (Modifier.isStatic(m.getModifiers())) {
                continue;
            }
            Class<?>[] params = m.getParameterTypes();
            if (params.length == 3
                    && params[0] == int.class
                    && params[1] == int.class
                    && params[2] == int.class
                    && !m.getReturnType().isPrimitive()
                    && m.getReturnType() != Object.class) {
                m.setAccessible(true);
                return m;
            }
        }
        return null;
    }

    private static SurroundingText extractSurroundingFromPdx(Object pdx) {
        if (pdx == null) {
            return null;
        }
        try {
            Class<?> cls = pdx.getClass();
            Method beforeM = cachedPdxBeforeMethod;
            Method afterM = cachedPdxAfterMethod;
            if (cachedPdxClass != cls || beforeM == null || afterM == null) {
                beforeM = resolveZeroArgCharSeqMethod(cls, RamblerDynamicConfig.PDX_BEFORE_CURSOR_METHOD);
                afterM = resolveZeroArgCharSeqMethod(cls, RamblerDynamicConfig.PDX_AFTER_CURSOR_METHOD);
                cachedPdxBeforeMethod = beforeM;
                cachedPdxAfterMethod = afterM;
                cachedPdxClass = cls;
            }
            if (beforeM == null || afterM == null) {
                return null;
            }
            Object beforeObj = beforeM.invoke(pdx);
            Object afterObj = afterM.invoke(pdx);
            String before = beforeObj == null ? null : beforeObj.toString();
            String after = afterObj == null ? null : afterObj.toString();
            return new SurroundingText(before, after);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Method resolveZeroArgCharSeqMethod(Class<?> cls, String name) {
        if (cls == null || name == null || name.isEmpty()) {
            return null;
        }
        try {
            Method m = cls.getMethod(name);
            if (!Modifier.isStatic(m.getModifiers())
                    && CharSequence.class.isAssignableFrom(m.getReturnType())) {
                m.setAccessible(true);
                return m;
            }
        } catch (Throwable ignored) {
            // Try declared methods.
        }
        try {
            Method m = cls.getDeclaredMethod(name);
            if (!Modifier.isStatic(m.getModifiers())
                    && CharSequence.class.isAssignableFrom(m.getReturnType())) {
                m.setAccessible(true);
                return m;
            }
        } catch (Throwable ignored) {
            // Not found.
        }
        return null;
    }

    private static SurroundingText extractSurroundingFromPdg(Object pdg) {
        if (pdg == null) {
            return null;
        }
        try {
            ensurePdgFields(pdg.getClass());
            Field pdxField = cachedPdgPdxField;
            if (pdxField == null) {
                return null;
            }
            Object pdx = pdxField.get(pdg);
            return extractSurroundingFromPdx(pdx);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String extractReasonName(Object pdg) {
        if (pdg == null) {
            return "";
        }
        try {
            ensurePdgFields(pdg.getClass());
            Field holderField = cachedPdgReasonHolderField;
            if (holderField == null) {
                return "";
            }
            Object pdl = holderField.get(pdg);
            if (pdl == null) {
                return "";
            }
            Class<?> pdlCls = pdl.getClass();
            Field enumField = cachedPdlReasonEnumField;
            if (cachedPdlClass != pdlCls || enumField == null) {
                enumField = findReasonEnumField(pdlCls);
                cachedPdlReasonEnumField = enumField;
                cachedPdlClass = pdlCls;
            }
            if (enumField == null) {
                return "";
            }
            Object val = enumField.get(pdl);
            return val instanceof Enum<?> ? ((Enum<?>) val).name() : "";
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static void ensurePdgFields(Class<?> pdgClass) {
        if (cachedPdgClass == pdgClass && (cachedPdgPdxField != null || cachedPdgReasonHolderField != null)) {
            return;
        }
        Field foundPdx = null;
        Field foundReasonHolder = null;
        for (Field f : pdgClass.getDeclaredFields()) {
            if (Modifier.isStatic(f.getModifiers())) {
                continue;
            }
            Class<?> fType = f.getType();
            if (fType.isPrimitive() || fType == String.class) {
                continue;
            }
            if (foundPdx == null
                    && resolveZeroArgCharSeqMethod(fType, RamblerDynamicConfig.PDX_BEFORE_CURSOR_METHOD) != null
                    && resolveZeroArgCharSeqMethod(fType, RamblerDynamicConfig.PDX_AFTER_CURSOR_METHOD) != null) {
                f.setAccessible(true);
                foundPdx = f;
            } else if (foundReasonHolder == null && findReasonEnumField(fType) != null) {
                f.setAccessible(true);
                foundReasonHolder = f;
            }
        }
        cachedPdgPdxField = foundPdx;
        cachedPdgReasonHolderField = foundReasonHolder;
        cachedPdgClass = pdgClass;
    }

    private static Field findReasonEnumField(Class<?> holderClass) {
        if (holderClass == null || holderClass.isPrimitive() || holderClass.isEnum()) {
            return null;
        }
        for (Field f : holderClass.getDeclaredFields()) {
            if (Modifier.isStatic(f.getModifiers())) {
                continue;
            }
            Class<?> t = f.getType();
            if (t.isEnum()) {
                Object[] constants = t.getEnumConstants();
                if (constants != null) {
                    for (Object c : constants) {
                        if ("DELETE".equals(((Enum<?>) c).name())) {
                            f.setAccessible(true);
                            return f;
                        }
                    }
                }
            }
        }
        return null;
    }

    private static void logWarningSafely(String message, Throwable throwable) {
        try {
            Log.w(TAG, message, throwable);
        } catch (Throwable ignored) {
            // Never propagate logging errors.
        }
    }
}
