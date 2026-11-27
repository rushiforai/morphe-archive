package dev.srwi.gintype.extension.multiglide;

import dev.srwi.gintype.extension.multiglide.MultiGlideGeometry.KeySpec;
import dev.srwi.gintype.extension.multiglide.MultiGlideInputToken.TouchPoint;
import dev.srwi.gintype.extension.multiglide.MultiGlideInputToken.WordCandidate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Pure-JVM behavioral state machine governing MultiGlide's Gboard integration rules
 * (touch routing, buffer promotion, live composing preview, auto-space, compound-word
 * Backspace attachment, capitalization, and hook decision predicates).
 *
 * Kept free of Android framework dependencies so every integration rule (MG-01..MG-19)
 * can be deterministically verified on the JVM.
 */
final class MultiGlideWordSession {

    static final float MULTI_TOUCH_SWIPE_THRESHOLD_PX = 22f;
    static final int TEXT_SNAPSHOT_CHARS = 256;
    static final int MAX_ROLLBACK_EXTRA_CHARS = 48;
    static final long MAX_PASSIVE_TAP_GAP_MS = 750L;
    static final int MAX_PASSIVE_TAP_TOKENS = 8;
    static final long ROLLOVER_MULTI_TOUCH_WINDOW_MS = 220L;
    static final long DOUBLE_SPACE_PERIOD_TIMEOUT_MS = 500L;
    static final long BACKSPACE_HOLD_TIMEOUT_MS = 280L;

    enum CapsMode {
        /** Keyboard is explicitly unshifted: do not force sentence-start capitalization. */
        NONE,
        /** One-shot Shift or auto-caps is active: capitalize the first character. */
        SHIFT,
        /** Caps Lock is active: uppercase the entire word. */
        CAPS_LOCK,
        /** Keyboard state unavailable: infer sentence-start capitalization from text before cursor. */
        AUTO
    }

    static final class SettingsSnapshot {
        final boolean enabled;
        final boolean autoSpaceEnabled;
        final int autoSpaceDelayMs;
        final int singleTouchCombineDelayMs;
        final boolean doubleSpacePeriodEnabled;
        final boolean autoSpaceBeforeWord;
        final int tapToMultiGlideDelayMs;
        final String backspaceMode;
        final boolean smartTapSwipeSplitEnabled;

        SettingsSnapshot(
                boolean enabled,
                boolean autoSpaceEnabled,
                int autoSpaceDelayMs,
                int singleTouchCombineDelayMs
        ) {
            this(enabled, autoSpaceEnabled, autoSpaceDelayMs, singleTouchCombineDelayMs,
                    true, false, GboardMultiGlideSettings.DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS,
                    GboardMultiGlideSettings.DEFAULT_BACKSPACE_MODE);
        }

        SettingsSnapshot(
                boolean enabled,
                boolean autoSpaceEnabled,
                int autoSpaceDelayMs,
                int singleTouchCombineDelayMs,
                boolean doubleSpacePeriodEnabled
        ) {
            this(enabled, autoSpaceEnabled, autoSpaceDelayMs, singleTouchCombineDelayMs,
                    doubleSpacePeriodEnabled, false,
                    GboardMultiGlideSettings.DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS,
                    GboardMultiGlideSettings.DEFAULT_BACKSPACE_MODE);
        }

        SettingsSnapshot(
                boolean enabled,
                boolean autoSpaceEnabled,
                int autoSpaceDelayMs,
                int singleTouchCombineDelayMs,
                boolean doubleSpacePeriodEnabled,
                boolean autoSpaceBeforeWord
        ) {
            this(enabled, autoSpaceEnabled, autoSpaceDelayMs, singleTouchCombineDelayMs,
                    doubleSpacePeriodEnabled, autoSpaceBeforeWord,
                    GboardMultiGlideSettings.DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS,
                    GboardMultiGlideSettings.DEFAULT_BACKSPACE_MODE);
        }

        SettingsSnapshot(
                boolean enabled,
                boolean autoSpaceEnabled,
                int autoSpaceDelayMs,
                int singleTouchCombineDelayMs,
                boolean doubleSpacePeriodEnabled,
                boolean autoSpaceBeforeWord,
                int tapToMultiGlideDelayMs
        ) {
            this(enabled, autoSpaceEnabled, autoSpaceDelayMs, singleTouchCombineDelayMs,
                    doubleSpacePeriodEnabled, autoSpaceBeforeWord, tapToMultiGlideDelayMs,
                    GboardMultiGlideSettings.DEFAULT_BACKSPACE_MODE);
        }

        SettingsSnapshot(
                boolean enabled,
                boolean autoSpaceEnabled,
                int autoSpaceDelayMs,
                int singleTouchCombineDelayMs,
                boolean doubleSpacePeriodEnabled,
                boolean autoSpaceBeforeWord,
                int tapToMultiGlideDelayMs,
                String backspaceMode
        ) {
            this(enabled, autoSpaceEnabled, autoSpaceDelayMs, singleTouchCombineDelayMs,
                    doubleSpacePeriodEnabled, autoSpaceBeforeWord, tapToMultiGlideDelayMs,
                    backspaceMode, GboardMultiGlideSettings.DEFAULT_SMART_TAP_SWIPE_SPLIT_ENABLED);
        }

        SettingsSnapshot(
                boolean enabled,
                boolean autoSpaceEnabled,
                int autoSpaceDelayMs,
                int singleTouchCombineDelayMs,
                boolean doubleSpacePeriodEnabled,
                boolean autoSpaceBeforeWord,
                int tapToMultiGlideDelayMs,
                String backspaceMode,
                boolean smartTapSwipeSplitEnabled
        ) {
            this.enabled = enabled;
            this.autoSpaceEnabled = autoSpaceEnabled;
            this.autoSpaceDelayMs = autoSpaceDelayMs;
            this.singleTouchCombineDelayMs = singleTouchCombineDelayMs;
            this.doubleSpacePeriodEnabled = doubleSpacePeriodEnabled;
            this.autoSpaceBeforeWord = autoSpaceBeforeWord;
            this.tapToMultiGlideDelayMs = tapToMultiGlideDelayMs;
            this.backspaceMode = GboardMultiGlideSettings.sanitizeBackspaceMode(backspaceMode);
            this.smartTapSwipeSplitEnabled = smartTapSwipeSplitEnabled;
        }
    }

    interface EditorAdapter {
        String readTextBeforeCursorSnapshot();
        String readCharBeforeCursor();
        void deleteCharsBeforeCursor(int count);
        int previewWord(String word, String baselineBeforeText, boolean prependLeadingSpace);
        void commitFinishedWord(String word, boolean appendSpace);
        void commitText(String text);
        default void deleteActiveComposingWord(int charCount) {
            deleteCharsBeforeCursor(charCount);
        }
        default void replaceComposingWithText(int composingCharCount, String replacement) {
            deleteCharsBeforeCursor(composingCharCount);
            if (replacement != null && !replacement.isEmpty()) {
                commitText(replacement);
            }
        }
    }

    interface DecodePort {
        List<WordCandidate> decode(List<MultiGlideInputToken> tokens, String prevWord);

        default String activeLanguage() {
            return "en";
        }

        default List<String> activeLanguages() {
            return java.util.Collections.singletonList(activeLanguage());
        }

        default int lookupWordFrequency(String word) {
            return 0;
        }

        default float lookupBigramScore(String prevWord, String word) {
            return 0f;
        }
    }

    interface LifecycleCallbacks {
        void onTrailAccentChanged(boolean active);
        void onTakeoverActivatedOnFinish();
        void onPointerFinished(int pointerId, boolean isSwipe, boolean inMultiGlideGesture);
        void onClearTrailManagerActive();
        void onScheduleAutospaceTimer(long delayMs);
        void onCancelAutospaceTimer();
        default void onScheduleStockSwipeAutospaceTimer(long delayMs) {}
        default void onCancelStockSwipeAutospaceTimer() {}
        default void onBufferTimerUpdated(long durationMs) {}
        default void onWordReadyTimerElapsed() {}
        default void onNativeTopBarBlankChanged(boolean blank) {}
        void onWordDecoded(
                String word,
                List<String> alternatives,
                List<MultiGlideInputToken> tokens,
                boolean capitalizeFirst,
                String prevWord,
                String baseline,
                int promotedPassiveCount,
                int rollbackDeleted,
                int restingDropped,
                List<WordCandidate> candidates
        );
        void onWordCommitted(
                String word,
                boolean autospaceInserted,
                String prevWord,
                List<String> alternatives
        );
        void onSkippedGesture(
                String reason,
                boolean hasSwipe,
                boolean strokeHadMultiTouch,
                int passiveBufferSize,
                int restingDropped,
                String baseline,
                List<MultiGlideInputToken> completedTokens
        );
    }

    static class PointerTrack {
        final int pointerId;
        final float startX;
        final float startY;
        final long startTimeMs;
        final char startKeyChar;
        final boolean startedOnLetter;
        final int slot; // 0 = LEFT, 1 = RIGHT
        final List<TouchPoint> points = new ArrayList<>(48);
        final List<MultiGlideInputToken.KeyContact> contacts = new ArrayList<>(12);
        final List<MultiGlideInputToken.Dwell> dwells =
                new ArrayList<>(KineticaConstants.MAX_DWELL_SEGMENTS);
        float lastX;
        float lastY;
        long lastTimeMs;
        float pathLengthPx = 0f;
        float maxDispSqPx = 0f;
        boolean overlapped = false;
        char currentKeyChar;
        int currentCode = -1;
        long currentEnterTimeMs;
        int runAnchorIdx = 0;
        float runAnchorXKw;
        float runAnchorYKw;
        long runAnchorTimeMs;
        int runLastIdx = 0;
        long runLastTimeMs;
        boolean dwellInitialized = false;
        boolean contactsFinalized = false;
        boolean finished = false;

        PointerTrack(
                int pointerId,
                float x,
                float y,
                long timeMs,
                char startKeyChar,
                boolean startedOnLetter,
                int slot,
                MultiGlideGeometry geometry
        ) {
            this.pointerId = pointerId;
            this.startX = x;
            this.startY = y;
            this.lastX = x;
            this.lastY = y;
            this.startTimeMs = timeMs;
            this.lastTimeMs = timeMs;
            this.startKeyChar = startKeyChar;
            this.currentKeyChar = startKeyChar;
            this.startedOnLetter = startedOnLetter;
            this.slot = slot;
            this.points.add(new TouchPoint(x, y, timeMs, pointerId));

            if (geometry != null && geometry.isValid() && geometry.keyWidthPx > 0f) {
                float xKw = x / geometry.keyWidthPx;
                float yKw = y / geometry.keyWidthPx;
                this.runAnchorXKw = xKw;
                this.runAnchorYKw = yKw;
                this.runAnchorTimeMs = timeMs;
                this.runLastTimeMs = timeMs;
                this.dwellInitialized = true;
                this.currentCode = geometry.keyAtKw(xKw, yKw);
                this.currentEnterTimeMs = timeMs;
            }
        }

        void addPoint(float x, float y, long timeMs, MultiGlideGeometry geometry) {
            long ts = Math.max(lastTimeMs, timeMs);
            float dx = x - lastX;
            float dy = y - lastY;
            float dist = (float) Math.hypot(dx, dy);
            float dStartX = x - startX;
            float dStartY = y - startY;
            float dispSq = dStartX * dStartX + dStartY * dStartY;
            if (dispSq > maxDispSqPx) {
                maxDispSqPx = dispSq;
            }
            if (dist < 1.5f && !points.isEmpty()) {
                if (ts > lastTimeMs) {
                    lastTimeMs = ts;
                    trackDwell(points.size() - 1, x, y, ts, geometry);
                }
                return;
            }
            pathLengthPx += dist;
            lastX = x;
            lastY = y;
            lastTimeMs = ts;
            points.add(new TouchPoint(x, y, ts, pointerId));

            int idx = points.size() - 1;
            trackDwell(idx, x, y, ts, geometry);

            if (geometry != null && geometry.isValid() && geometry.keyWidthPx > 0f) {
                float xKw = x / geometry.keyWidthPx;
                float yKw = y / geometry.keyWidthPx;
                if (currentCode == -1
                        || !geometry.insideInflatedKw(
                                xKw, yKw, currentCode, KineticaConstants.STICKY_INFLATE_KW)) {
                    int newCode = geometry.keyAtKw(xKw, yKw);
                    if (newCode != -1 && newCode != currentCode) {
                        if (currentCode != -1) {
                            contacts.add(new MultiGlideInputToken.KeyContact(
                                    currentCode, currentEnterTimeMs, ts));
                        }
                        currentCode = newCode;
                        currentEnterTimeMs = ts;
                    }
                }
            }
        }

        private void trackDwell(int idx, float xPx, float yPx, long ts, MultiGlideGeometry geometry) {
            if (geometry == null || !geometry.isValid() || geometry.keyWidthPx <= 0f) return;
            float xKw = xPx / geometry.keyWidthPx;
            float yKw = yPx / geometry.keyWidthPx;
            if (!dwellInitialized) {
                runAnchorIdx = idx;
                runAnchorXKw = xKw;
                runAnchorYKw = yKw;
                runAnchorTimeMs = ts;
                runLastIdx = idx;
                runLastTimeMs = ts;
                dwellInitialized = true;
                return;
            }
            float dx = xKw - runAnchorXKw;
            float dy = yKw - runAnchorYKw;
            float rSq = KineticaConstants.DWELL_RADIUS_KW * KineticaConstants.DWELL_RADIUS_KW;
            if (dx * dx + dy * dy <= rSq) {
                runLastIdx = idx;
                runLastTimeMs = ts;
                return;
            }
            closeDwellRun();
            runAnchorIdx = idx;
            runAnchorXKw = xKw;
            runAnchorYKw = yKw;
            runAnchorTimeMs = ts;
            runLastIdx = idx;
            runLastTimeMs = ts;
        }

        private void closeDwellRun() {
            if (runLastTimeMs - runAnchorTimeMs < KineticaConstants.DWELL_MIN_MS) return;
            dwells.add(new MultiGlideInputToken.Dwell(
                    runAnchorIdx, runLastIdx, runAnchorTimeMs, runLastTimeMs));
            if (dwells.size() < KineticaConstants.MAX_DWELL_SEGMENTS) return;
            int shortest = 0;
            for (int i = 1; i < dwells.size(); i++) {
                long dCur = dwells.get(i).tExit - dwells.get(i).tEnter;
                long dBest = dwells.get(shortest).tExit - dwells.get(shortest).tEnter;
                if (dCur < dBest) shortest = i;
            }
            dwells.remove(shortest);
        }

        boolean isSwipe(float swipeThresholdPx) {
            if (points.size() < 2) return false;
            return maxDispSqPx >= swipeThresholdPx * swipeThresholdPx;
        }

        boolean isRestingFinger(float swipeThresholdPx) {
            return overlapped
                    && !isSwipe(swipeThresholdPx)
                    && (lastTimeMs - startTimeMs) >= KineticaConstants.RESTING_FINGER_MIN_MS;
        }

        MultiGlideInputToken toToken(float swipeThresholdPx) {
            if (!contactsFinalized) {
                contactsFinalized = true;
                if (currentCode != -1) {
                    contacts.add(new MultiGlideInputToken.KeyContact(
                            currentCode, currentEnterTimeMs, lastTimeMs));
                }
            }
            if (isSwipe(swipeThresholdPx)) {
                return MultiGlideInputToken.swipe(
                        pointerId,
                        slot,
                        new ArrayList<>(points),
                        pathLengthPx,
                        startTimeMs,
                        lastTimeMs,
                        new ArrayList<>(contacts),
                        new ArrayList<>(dwells),
                        false,
                        false
                );
            }
            if (startedOnLetter && startKeyChar != '\0') {
                return MultiGlideInputToken.tap(
                        pointerId,
                        slot,
                        startKeyChar,
                        startX,
                        startY,
                        startTimeMs,
                        lastTimeMs
                );
            }
            return null;
        }

        /**
         * Non-mutating snapshot for live intermediate decoding during ACTION_MOVE.
         */
        MultiGlideInputToken toSnapshotToken(float swipeThresholdPx) {
            List<MultiGlideInputToken.KeyContact> snapshotContacts = new ArrayList<>(contacts);
            if (!contactsFinalized && currentCode != -1) {
                snapshotContacts.add(new MultiGlideInputToken.KeyContact(
                        currentCode, currentEnterTimeMs, lastTimeMs));
            }
            if (isSwipe(swipeThresholdPx)) {
                return MultiGlideInputToken.swipe(
                        pointerId,
                        slot,
                        new ArrayList<>(points),
                        pathLengthPx,
                        startTimeMs,
                        lastTimeMs,
                        snapshotContacts,
                        new ArrayList<>(dwells),
                        false,
                        false
                );
            }
            if (startedOnLetter && startKeyChar != '\0') {
                return MultiGlideInputToken.tap(
                        pointerId,
                        slot,
                        startKeyChar,
                        startX,
                        startY,
                        startTimeMs,
                        lastTimeMs
                );
            }
            return null;
        }
    }

    /**
     * Shared buffer state for retaining short prefix strokes and rolling back Stock Gboard's
     * committed prefix if a subsequent stroke promotes into MultiGlide.
     */
    static abstract class PendingStrokeBufferBase {
        final List<MultiGlideInputToken> tokens = new ArrayList<>();
        String baselineText = null;
        long lastUpTimeMs = 0L;
        CapsMode initialCapsMode = CapsMode.AUTO;

        void clear() {
            tokens.clear();
            baselineText = null;
            lastUpTimeMs = 0L;
            initialCapsMode = CapsMode.AUTO;
        }

        protected abstract boolean isValidTypedPrefix(String typedPrefix);

        protected final void validateGapAndPrefix(
                String snapshotNow,
                boolean downOnLetter,
                long eventTimeMs,
                long maxGapMs
        ) {
            if (tokens.isEmpty()) return;
            long gapMs = (lastUpTimeMs > 0L) ? (eventTimeMs - lastUpTimeMs) : Long.MAX_VALUE;
            if (!downOnLetter || gapMs < 0L || gapMs > maxGapMs) {
                clear();
                return;
            }
            String typedPrefix = extractTypedPrefixSinceBaseline(baselineText, snapshotNow);
            if (!isValidTypedPrefix(typedPrefix)) {
                clear();
            }
        }

        protected final boolean appendTokensWithinCap(
                List<MultiGlideInputToken> additions,
                String baselineAtDown,
                long eventTimeMs,
                int maxTokens
        ) {
            if (additions == null || additions.isEmpty() || baselineAtDown == null) {
                clear();
                return false;
            }
            if (tokens.isEmpty()) {
                if (additions.size() > maxTokens) {
                    clear();
                    return false;
                }
                baselineText = baselineAtDown;
            } else if (tokens.size() + additions.size() > maxTokens) {
                clear();
                return false;
            }
            tokens.addAll(additions);
            lastUpTimeMs = eventTimeMs;
            return true;
        }

        String promoteInto(List<MultiGlideInputToken> destWordTokens, String textSnapshotAtActionDown) {
            String restoredSnapshot = peekPromotedBaseline(destWordTokens, textSnapshotAtActionDown);
            clear();
            return restoredSnapshot;
        }

        String peekPromotedBaseline(List<MultiGlideInputToken> destWordTokens, String textSnapshotAtActionDown) {
            if (tokens.isEmpty()) return textSnapshotAtActionDown;
            String restoredSnapshot = textSnapshotAtActionDown;
            String typedPrefix = extractTypedPrefixSinceBaseline(baselineText, textSnapshotAtActionDown);
            if (isValidTypedPrefix(typedPrefix)) {
                destWordTokens.addAll(tokens);
                restoredSnapshot = baselineText;
            }
            return restoredSnapshot;
        }
    }

    /**
     * Passive pre-swipe tap buffer: retains tap-only prefix strokes and their pre-tap baseline
     * so a subsequent MultiGlide stroke in the same word rolls back Stock Gboard's prefix.
     */
    static class PassiveTapBuffer extends PendingStrokeBufferBase {
        boolean hadMultiTouch = false;

        @Override
        void clear() {
            super.clear();
            hadMultiTouch = false;
        }

        @Override
        protected boolean isValidTypedPrefix(String typedPrefix) {
            return isPureLetterPrefix(typedPrefix, tokens.size());
        }

        void validateOnActionDown(
                String snapshotNow,
                boolean downOnLetter,
                long eventTimeMs,
                boolean autoSpaceEnabled
        ) {
            validateOnActionDown(
                    snapshotNow,
                    downOnLetter,
                    eventTimeMs,
                    (int) MAX_PASSIVE_TAP_GAP_MS,
                    autoSpaceEnabled);
        }

        void validateOnActionDown(
                String snapshotNow,
                boolean downOnLetter,
                long eventTimeMs,
                int tapToMultiGlideDelayMs,
                boolean autoSpaceEnabled
        ) {
            if (autoSpaceEnabled && tapToMultiGlideDelayMs <= 0) {
                clear();
                return;
            }
            long maxGap = autoSpaceEnabled ? tapToMultiGlideDelayMs : Long.MAX_VALUE;
            validateGapAndPrefix(snapshotNow, downOnLetter, eventTimeMs, maxGap);
        }

        boolean canPromoteMultiTouchSwipe(List<MultiGlideInputToken> completedTokens) {
            return hadMultiTouch
                    && !tokens.isEmpty()
                    && completedTokens != null
                    && !completedTokens.isEmpty();
        }

        void recordStroke(
                List<MultiGlideInputToken> completedTokens,
                boolean hasSwipe,
                boolean sawNonLetter,
                boolean strokeHadMultiTouch,
                String tapBaselineAtDown,
                long eventTimeMs,
                boolean autoSpaceEnabled
        ) {
            recordStroke(
                    completedTokens,
                    hasSwipe,
                    sawNonLetter,
                    strokeHadMultiTouch,
                    tapBaselineAtDown,
                    eventTimeMs,
                    (int) MAX_PASSIVE_TAP_GAP_MS,
                    autoSpaceEnabled);
        }

        void recordStroke(
                List<MultiGlideInputToken> completedTokens,
                boolean hasSwipe,
                boolean sawNonLetter,
                boolean strokeHadMultiTouch,
                String tapBaselineAtDown,
                long eventTimeMs,
                int tapToMultiGlideDelayMs,
                boolean autoSpaceEnabled
        ) {
            if (autoSpaceEnabled && tapToMultiGlideDelayMs <= 0) {
                clear();
                return;
            }
            List<MultiGlideInputToken> tapOnlyTokens = (!hasSwipe && !sawNonLetter)
                    ? collectPureTapTokens(completedTokens)
                    : null;
            int maxTokens = autoSpaceEnabled
                    ? MAX_PASSIVE_TAP_TOKENS
                    : KineticaConstants.MAX_WORD_LEN;
            boolean hadExisting = !tokens.isEmpty();
            if (!appendTokensWithinCap(tapOnlyTokens, tapBaselineAtDown, eventTimeMs, maxTokens)) {
                return;
            }
            hadMultiTouch = hadExisting ? (hadMultiTouch | strokeHadMultiTouch) : strokeHadMultiTouch;
        }
    }

    /**
     * Buffer retaining sequential single-touch strokes so subsequent strokes within the combine
     * timeout (or indefinitely while autoSpaceEnabled == false) promote into MultiGlide.
     */
    static class SingleTouchCombineBuffer extends PendingStrokeBufferBase {
        boolean hasSwipeToken = false;

        @Override
        void clear() {
            super.clear();
            hasSwipeToken = false;
        }

        @Override
        protected boolean isValidTypedPrefix(String typedPrefix) {
            return isCombinePrefix(typedPrefix);
        }

        void validateOnActionDown(
                String snapshotNow,
                boolean downOnLetter,
                long eventTimeMs,
                int combineDelayMs,
                boolean autoSpaceEnabled
        ) {
            if (autoSpaceEnabled && combineDelayMs <= 0) {
                clear();
                return;
            }
            long maxGap = autoSpaceEnabled ? combineDelayMs : Long.MAX_VALUE;
            validateGapAndPrefix(snapshotNow, downOnLetter, eventTimeMs, maxGap);
        }

        boolean canPromoteWith(List<MultiGlideInputToken> completedTokens, boolean sawNonLetter) {
            return canPromoteWith(completedTokens, sawNonLetter, true);
        }

        boolean canPromoteWith(
                List<MultiGlideInputToken> completedTokens,
                boolean sawNonLetter,
                boolean allowTapOnlyPrefix
        ) {
            if (sawNonLetter || tokens.isEmpty() || completedTokens == null || completedTokens.isEmpty()) {
                return false;
            }
            if (hasSwipeToken) return true;
            if (!allowTapOnlyPrefix) return false;
            for (int i = 0; i < completedTokens.size(); i++) {
                if (completedTokens.get(i).kind == MultiGlideInputToken.Kind.SWIPE) {
                    return true;
                }
            }
            return false;
        }

        void recordStroke(
                List<MultiGlideInputToken> completedTokens,
                boolean strokeHasSwipe,
                boolean sawNonLetter,
                String tapBaselineAtDown,
                long eventTimeMs,
                int combineDelayMs,
                boolean autoSpaceEnabled
        ) {
            if ((autoSpaceEnabled && combineDelayMs <= 0) || sawNonLetter) {
                clear();
                return;
            }
            int maxTokens = autoSpaceEnabled
                    ? MAX_PASSIVE_TAP_TOKENS
                    : KineticaConstants.MAX_WORD_LEN;
            boolean hadExisting = !tokens.isEmpty();
            if (!appendTokensWithinCap(completedTokens, tapBaselineAtDown, eventTimeMs, maxTokens)) {
                return;
            }
            hasSwipeToken = hadExisting ? (hasSwipeToken | strokeHasSwipe) : strokeHasSwipe;
        }
    }

    volatile MultiGlideGeometry geometry = new MultiGlideGeometry();

    void setGeometry(MultiGlideGeometry newGeometry) {
        if (newGeometry != null) {
            this.geometry = newGeometry;
        }
    }
    final Map<Integer, PointerTrack> activePointers = new LinkedHashMap<>();
    final List<MultiGlideInputToken> completedTokens = new ArrayList<>(4);
    final List<MultiGlideInputToken> wordTokens = new ArrayList<>(16);
    final int[] pointerBySlot = new int[] { -1, -1 };
    final Map<Integer, Integer> slotByPointer = new HashMap<>(4);
    final PassiveTapBuffer passiveTapBuffer = new PassiveTapBuffer();
    final SingleTouchCombineBuffer singleTouchCombineBuffer = new SingleTouchCombineBuffer();

    boolean sawMultiTouch = false;
    boolean multiGlideTakeoverActive = false;
    boolean multiGlideWordActive = false;
    boolean sawNonLetterThisSession = false;
    boolean observedShouldStartGestureThisStroke = false;
    boolean stockGestureStartedThisStroke = false;
    String textSnapshotAtActionDown = null;
    boolean leadingSpaceEvaluated = false;
    boolean suppressNextLeadingSpace = false;
    boolean pendingBackspaceCheck = false;
    String suppressLeadingSpaceBaseline = null;
    String lastObservedTextBeforeCursor = null;
    String expectedSnapshotAfterPreview = null;
    String lastCommittedWord = null;
    CapsMode currentWordCapsMode = CapsMode.AUTO;
    long lastTouchUpTimeMs = 0L;
    long lastActionDownTimeMs = 0L;
    boolean lastDownOnLetterArea = false;
    int restingDroppedThisSession = 0;
    int lastPromotedPassiveCount = 0;
    boolean stockSwipeAutospacePending = false;

    static final class LastCommittedWordUndo {
        final String expectedSnapshot;
        final int deleteCharCount;

        LastCommittedWordUndo(String expectedSnapshot, int deleteCharCount) {
            this.expectedSnapshot = expectedSnapshot;
            this.deleteCharCount = deleteCharCount;
        }
    }

    String currentComposingWord = null;
    List<String> currentAlternativeWords = null;
    String promotedTapPrefix = null;
    boolean autospaceInserted = false;
    String autospaceSnapshot = null;
    boolean autospaceTimerPending = false;
    long autospaceFirstSpaceTapDownTimeMs = 0L;
    boolean pendingLeadingSpaceBeforeNextWord = false;
    LastCommittedWordUndo lastCommittedWordUndo = null;
    boolean pendingBackspaceTap = false;
    float backspaceDownX = 0f;
    float backspaceDownY = 0f;
    long backspaceDownTimeMs = 0L;
    long suppressedBasicUpEventTimeMs = -1L;

    void resetGestureState() {
        activePointers.clear();
        completedTokens.clear();
        pointerBySlot[0] = -1;
        pointerBySlot[1] = -1;
        slotByPointer.clear();
        sawMultiTouch = false;
        multiGlideTakeoverActive = false;
        sawNonLetterThisSession = false;
        observedShouldStartGestureThisStroke = false;
        stockGestureStartedThisStroke = false;
        restingDroppedThisSession = 0;
    }

    /**
     * Clears orphaned active-pointer state when {@code SoftKeyboardView} has completed an
     * {@code ACTION_UP} or {@code ACTION_CANCEL} stream that was consumed by another handler
     * (e.g. a long-press popup in {@code BasicMotionEventHandler.A(MotionEvent)}) before reaching
     * {@code AbstractGestureMotionEventHandler.g(MotionEvent)}.
     *
     * @return {@code true} if orphaned pointers were cleared.
     */
    boolean clearOrphanedActiveTouches(long touchEndEventTimeMs) {
        if (activePointers.isEmpty()) {
            return false;
        }
        if (lastActionDownTimeMs > touchEndEventTimeMs) {
            return false;
        }
        resetGestureState();
        pendingBackspaceTap = false;
        lastTouchUpTimeMs = touchEndEventTimeMs;
        return true;
    }

    void clearWordBuffer(LifecycleCallbacks callbacks) {
        if (callbacks != null && autospaceTimerPending) {
            callbacks.onCancelAutospaceTimer();
        }
        if (callbacks != null && stockSwipeAutospacePending) {
            callbacks.onCancelStockSwipeAutospaceTimer();
        }
        autospaceTimerPending = false;
        stockSwipeAutospacePending = false;
        wordTokens.clear();
        currentComposingWord = null;
        currentAlternativeWords = null;
        promotedTapPrefix = null;
        expectedSnapshotAfterPreview = null;
        multiGlideWordActive = false;
        leadingSpaceEvaluated = false;
        currentWordCapsMode = CapsMode.AUTO;
        lastTouchUpTimeMs = 0L;
        lastPromotedPassiveCount = 0;
    }

    float multiGlideThresholdPx() {
        return Math.max(MULTI_TOUCH_SWIPE_THRESHOLD_PX, geometry.keyWidthPx * 0.24f);
    }

    float backspaceSwipeThresholdPx() {
        return Math.max(MULTI_TOUCH_SWIPE_THRESHOLD_PX, geometry.keyWidthPx * 0.35f);
    }

    PointerTrack registerPointerDown(int pointerId, float x, float y, long timeMs) {
        float midX = geometry.isValid() ? geometry.midlinePx() : 540f;
        int slot = (x < midX) ? 0 : 1;
        int other = 1 - slot;
        int currentOwner = pointerBySlot[slot];
        if (currentOwner != -1 && activePointers.containsKey(currentOwner)) {
            slot = other;
        }
        slotByPointer.put(pointerId, slot);
        pointerBySlot[slot] = pointerId;

        boolean onLetter = geometry.isOnLetterArea(x, y);
        if (!onLetter) {
            sawNonLetterThisSession = true;
        }
        KeySpec nearest = geometry.nearestLetterKey(x, y);
        char keyChar = nearest != null ? nearest.character : '\0';
        PointerTrack track = new PointerTrack(
                pointerId, x, y, timeMs, keyChar, onLetter, slot, geometry);
        if (!activePointers.isEmpty()) {
            track.overlapped = true;
            for (PointerTrack existing : activePointers.values()) {
                existing.overlapped = true;
            }
        }
        activePointers.put(pointerId, track);
        return track;
    }

    void releasePointerSlot(int pointerId) {
        Integer slotObj = slotByPointer.remove(pointerId);
        if (slotObj != null) {
            int slot = slotObj;
            if (slot >= 0 && slot < pointerBySlot.length && pointerBySlot[slot] == pointerId) {
                pointerBySlot[slot] = -1;
            }
        }
    }

    boolean hasAnySwipingPointer(float swipeThreshold) {
        for (PointerTrack t : activePointers.values()) {
            if (t.startedOnLetter && t.isSwipe(swipeThreshold)) {
                return true;
            }
        }
        for (int i = 0; i < completedTokens.size(); i++) {
            if (completedTokens.get(i).kind == MultiGlideInputToken.Kind.SWIPE) {
                return true;
            }
        }
        return false;
    }

    boolean isLivePreviewEligible(float swipeThresholdPx) {
        if (multiGlideTakeoverActive) {
            return true;
        }
        if (sawNonLetterThisSession) {
            return false;
        }
        if (multiGlideWordActive) {
            return hasAnySwipingPointer(swipeThresholdPx) || containsSwipeToken(wordTokens);
        }
        return !singleTouchCombineBuffer.tokens.isEmpty()
                && (singleTouchCombineBuffer.hasSwipeToken || hasAnySwipingPointer(swipeThresholdPx));
    }

    /**
     * Builds an immutable token snapshot of the current in-progress MultiGlide word for throttled
     * live-preview decoding during ACTION_MOVE, or null if no SWIPE token is present yet.
     */
    List<MultiGlideInputToken> buildLiveSnapshotTokens() {
        float swipeThreshold = multiGlideThresholdPx();
        List<MultiGlideInputToken> out = new ArrayList<>(
                wordTokens.size() + completedTokens.size() + activePointers.size() + 4);
        if (!multiGlideWordActive && !sawNonLetterThisSession) {
            if (!singleTouchCombineBuffer.tokens.isEmpty()) {
                out.addAll(singleTouchCombineBuffer.tokens);
            } else if (!passiveTapBuffer.tokens.isEmpty()) {
                out.addAll(passiveTapBuffer.tokens);
            }
        }
        out.addAll(wordTokens);
        out.addAll(completedTokens);
        for (PointerTrack track : activePointers.values()) {
            if (track.isRestingFinger(swipeThreshold)) {
                continue;
            }
            MultiGlideInputToken tok = track.toSnapshotToken(swipeThreshold);
            if (tok != null) {
                out.add(tok);
            }
        }
        return containsSwipeToken(out) ? out : null;
    }

    /**
     * Returns true when an uncommitted tap prefix or active MultiGlide composing word is currently
     * in the editor and will be replaced in-place by this MultiGlide gesture (e.g., Tap+Swipe or
     * continuing a MultiGlide word within the autospace/combine window).
     */
    boolean hasPendingTapPrefixInEditor() {
        if (promotedTapPrefix != null && !promotedTapPrefix.isEmpty()) {
            return true;
        }
        if (multiGlideWordActive
                && currentComposingWord != null
                && !currentComposingWord.isEmpty()) {
            return true;
        }
        return !multiGlideWordActive
                && !sawNonLetterThisSession
                && (!singleTouchCombineBuffer.tokens.isEmpty() || !passiveTapBuffer.tokens.isEmpty());
    }

    String formatWordForCurrentContext(String word) {
        return formatWordForContext(
                word, textSnapshotAtActionDown, suppressNextLeadingSpace, currentWordCapsMode);
    }

    static String formatWordForContext(
            String word,
            String textSnapshotAtActionDown,
            boolean suppressNextLeadingSpace
    ) {
        return formatWordForContext(
                word, textSnapshotAtActionDown, suppressNextLeadingSpace, CapsMode.AUTO);
    }

    static String formatWordForContext(
            String word,
            String textSnapshotAtActionDown,
            boolean suppressNextLeadingSpace,
            CapsMode capsMode
    ) {
        boolean attaching = isAttachingAfterDeletion(
                textSnapshotAtActionDown, false, suppressNextLeadingSpace);
        return applyWordCasing(word, attaching, capsMode, textSnapshotAtActionDown);
    }

    static String applyWordCasing(
            String word,
            boolean attachingAfterDeletion,
            CapsMode capsMode,
            String capContext
    ) {
        if (word == null || word.isEmpty()) {
            return word;
        }
        CapsMode mode = (capsMode != null) ? capsMode : CapsMode.AUTO;
        if (mode == CapsMode.CAPS_LOCK) {
            return word.toUpperCase(java.util.Locale.ROOT);
        }
        if (mode == CapsMode.SHIFT) {
            return capitalizeFirstChar(word);
        }
        if (attachingAfterDeletion) {
            return lowercaseFirstChar(word);
        }
        if (mode == CapsMode.AUTO && shouldCapitalizeFirstLetter(capContext)) {
            return capitalizeFirstChar(word);
        }
        return word;
    }

    static CapsMode mergePromotedCapsMode(CapsMode bufferCapsMode, CapsMode strokeCapsMode) {
        CapsMode buf = (bufferCapsMode != null) ? bufferCapsMode : CapsMode.AUTO;
        CapsMode stroke = (strokeCapsMode != null) ? strokeCapsMode : CapsMode.AUTO;
        if (buf == CapsMode.CAPS_LOCK || stroke == CapsMode.CAPS_LOCK) {
            return CapsMode.CAPS_LOCK;
        }
        if (buf == CapsMode.SHIFT || stroke == CapsMode.SHIFT) {
            return CapsMode.SHIFT;
        }
        return stroke;
    }

    boolean onActionDown(
            int pointerId,
            float x,
            float y,
            long eventTimeMs,
            SettingsSnapshot settings,
            EditorAdapter editor,
            LifecycleCallbacks callbacks
    ) {
        return onActionDown(
                pointerId, x, y, eventTimeMs, settings, editor, callbacks, CapsMode.AUTO);
    }

    boolean onActionDown(
            int pointerId,
            float x,
            float y,
            long eventTimeMs,
            SettingsSnapshot settings,
            EditorAdapter editor,
            LifecycleCallbacks callbacks,
            CapsMode capsMode
    ) {
        lastActionDownTimeMs = eventTimeMs;
        boolean downOnLetter = geometry.isOnLetterArea(x, y);
        lastDownOnLetterArea = downOnLetter;

        if (callbacks != null) {
            callbacks.onPointerFinished(pointerId, false, false);
        }

        boolean downOnSpace = geometry.isSpaceKeyAt(x, y);
        String snapshotNow = (editor != null) ? editor.readTextBeforeCursorSnapshot() : null;

        // MG-12: Retract auto-inserted trailing space before hugging punctuation (preserving
        // autospace across non-character modifier/layout-switch keys like ?123/Shift while the
        // editor text is unchanged), or track Spacebar double-tap-to-period on ACTION_DOWN.
        if (autospaceInserted && autospaceSnapshot != null && snapshotNow != null
                && !snapshotNow.equals(autospaceSnapshot)) {
            autospaceInserted = false;
            autospaceSnapshot = null;
        }
        if (autospaceInserted) {
            KeySpec hit = geometry.findKeyAt(x, y);
            boolean downOnBackspace = geometry.isBackspaceKeyAt(x, y);
            if (hit == null && !downOnBackspace && geometry.isNonCharControlKeyAt(x, y)) {
                // Modifier / layout-switch key (e.g. ?123, Shift): preserve autospaceInserted
                // so a subsequent punctuation key like ':' on the symbols layout still retracts.
                autospaceFirstSpaceTapDownTimeMs = 0L;
            } else {
                if (hit == null && !downOnSpace && !downOnBackspace) {
                    hit = geometry.nearestAnyKey(x, y);
                }
                if (hit != null && geometry.isPunctuationChar(hit.character) && editor != null) {
                    String before = editor.readCharBeforeCursor();
                    if (before != null && !before.isEmpty() && before.charAt(before.length() - 1) == ' ') {
                        editor.deleteCharsBeforeCursor(1);
                    }
                    autospaceFirstSpaceTapDownTimeMs = 0L;
                    autospaceInserted = false;
                    autospaceSnapshot = null;
                    snapshotNow = editor.readTextBeforeCursorSnapshot();
                } else {
                    autospaceFirstSpaceTapDownTimeMs = (downOnSpace && activePointers.isEmpty()) ? eventTimeMs : 0L;
                    autospaceInserted = false;
                    autospaceSnapshot = null;
                }
            }
        } else {
            if (autospaceFirstSpaceTapDownTimeMs > 0L
                    && downOnSpace
                    && activePointers.isEmpty()
                    && settings.doubleSpacePeriodEnabled
                    && (eventTimeMs - autospaceFirstSpaceTapDownTimeMs) <= DOUBLE_SPACE_PERIOD_TIMEOUT_MS
                    && editor != null) {
                String before = snapshotNow;
                if (before != null && before.length() >= 3 && before.endsWith("  ")) {
                    char prev = before.charAt(before.length() - 3);
                    if (!Character.isWhitespace(prev) && prev != '.') {
                        editor.deleteCharsBeforeCursor(2);
                        editor.commitText(".");
                        snapshotNow = editor.readTextBeforeCursorSnapshot();
                    }
                }
            }
            autospaceFirstSpaceTapDownTimeMs = 0L;
        }
        boolean cursorNavigatedAway = multiGlideWordActive
                && expectedSnapshotAfterPreview != null
                && snapshotNow != null
                && !snapshotNow.equals(expectedSnapshotAfterPreview);

        long timeSinceLastUp = (lastTouchUpTimeMs > 0L)
                ? (eventTimeMs - lastTouchUpTimeMs)
                : Long.MAX_VALUE;
        boolean wasAutospacing = autospaceTimerPending;
        if (callbacks != null) {
            callbacks.onBufferTimerUpdated(0L);
            if (autospaceTimerPending) {
                callbacks.onCancelAutospaceTimer();
            }
            if (stockSwipeAutospacePending) {
                callbacks.onCancelStockSwipeAutospaceTimer();
            }
        }
        autospaceTimerPending = false;
        stockSwipeAutospacePending = false;

        boolean withinTimeout = !settings.autoSpaceEnabled
                || wasAutospacing
                || (timeSinceLastUp <= (settings.autoSpaceDelayMs + 80L) && !wordTokens.isEmpty());
        boolean isWordContinuing = downOnLetter
                && multiGlideWordActive
                && !cursorNavigatedAway
                && (withinTimeout || !activePointers.isEmpty());

        boolean hadMultiGlideWord = multiGlideWordActive;
        String endedComposingWord = currentComposingWord;
        List<String> endedAlternatives = currentAlternativeWords;
        String endedBaseline = textSnapshotAtActionDown;

        boolean armedLeadingSpace = pendingLeadingSpaceBeforeNextWord;
        boolean snapshotUnchanged = lastObservedTextBeforeCursor == null
                || snapshotNow == null
                || snapshotNow.equals(lastObservedTextBeforeCursor);
        boolean downOnModifier = !downOnLetter
                && !downOnSpace
                && !geometry.isBackspaceKeyAt(x, y)
                && !geometry.isPunctuationAt(x, y)
                && geometry.findKeyAt(x, y) == null
                && geometry.isNonCharControlKeyAt(x, y);
        if (!downOnModifier || !snapshotUnchanged) {
            pendingLeadingSpaceBeforeNextWord = false;
        }
        if (armedLeadingSpace
                && downOnLetter
                && !isWordContinuing
                && settings.autoSpaceEnabled
                && settings.autoSpaceBeforeWord
                && !suppressNextLeadingSpace
                && editor != null
                && snapshotNow != null
                && !snapshotNow.isEmpty()
                && Character.isLetterOrDigit(snapshotNow.charAt(snapshotNow.length() - 1))) {
            editor.commitText(" ");
            snapshotNow = editor.readTextBeforeCursorSnapshot();
            if (snapshotNow != null) {
                lastObservedTextBeforeCursor = snapshotNow;
            }
        }

        resetGestureState();

        boolean downOnBackspace = !downOnLetter && activePointers.isEmpty() && geometry.isBackspaceKeyAt(x, y);
        boolean canHandleBackspace = downOnBackspace
                && ((multiGlideWordActive && currentComposingWord != null
                        && !currentComposingWord.isEmpty() && !cursorNavigatedAway)
                    || (!multiGlideWordActive && lastCommittedWordUndo != null
                        && snapshotNow != null
                        && snapshotNow.equals(lastCommittedWordUndo.expectedSnapshot)));

        if (canHandleBackspace) {
            pendingBackspaceTap = true;
            backspaceDownX = x;
            backspaceDownY = y;
            backspaceDownTimeMs = eventTimeMs;
            updateBackspaceCompoundStateOnActionDown(snapshotNow, downOnLetter, x, y);
            lastObservedTextBeforeCursor = snapshotNow;
            if (callbacks != null) {
                callbacks.onTrailAccentChanged(multiGlideWordActive);
                if (!multiGlideWordActive) {
                    callbacks.onNativeTopBarBlankChanged(false);
                }
            }
            registerPointerDown(pointerId, x, y, eventTimeMs);
            return false;
        }

        pendingBackspaceTap = false;
        lastCommittedWordUndo = null;

        if (!isWordContinuing) {
            boolean hitSpaceOrPunct = !downOnLetter
                    && (geometry.isSpaceKeyAt(x, y) || geometry.isPunctuationAt(x, y));

            if (hadMultiGlideWord && endedComposingWord != null && !endedComposingWord.isEmpty()
                    && hitSpaceOrPunct && callbacks != null) {
                String prevWord = extractPreviousWord(endedBaseline, snapshotNow, lastCommittedWord);
                lastCommittedWord = endedComposingWord;
                callbacks.onWordCommitted(endedComposingWord, false, prevWord, endedAlternatives);
            }

            clearWordBuffer(callbacks);
            updateBackspaceCompoundStateOnActionDown(snapshotNow, downOnLetter, x, y);

            currentWordCapsMode = (capsMode != null) ? capsMode : CapsMode.AUTO;
            lastObservedTextBeforeCursor = snapshotNow;
            textSnapshotAtActionDown = snapshotNow;
            passiveTapBuffer.validateOnActionDown(
                    snapshotNow,
                    downOnLetter,
                    eventTimeMs,
                    settings.tapToMultiGlideDelayMs,
                    settings.autoSpaceEnabled);
            singleTouchCombineBuffer.validateOnActionDown(
                    snapshotNow,
                    downOnLetter,
                    eventTimeMs,
                    settings.singleTouchCombineDelayMs,
                    settings.autoSpaceEnabled);
        }

        if (callbacks != null) {
            callbacks.onTrailAccentChanged(isWordContinuing);
            callbacks.onNativeTopBarBlankChanged(isWordContinuing);
        }
        registerPointerDown(pointerId, x, y, eventTimeMs);
        return isWordContinuing;
    }

    /**
     * Updates MG-13 Backspace-gated compound attachment state.
     * Only deletions immediately preceded by a non-Space, non-punctuation keyboard key
     * (Backspace) latch {@code suppressNextLeadingSpace}. Cursor repositioning in the textbox
     * or Spacebar cursor swipes never arm Backspace detection.
     */
    private void updateBackspaceCompoundStateOnActionDown(
            String snapshotNow,
            boolean downOnLetter,
            float x,
            float y
    ) {
        boolean hitSpace = geometry.isSpaceKeyAt(x, y);
        boolean hitPunct = geometry.isPunctuationAt(x, y);

        if (hitSpace || hitPunct) {
            pendingBackspaceCheck = false;
            suppressNextLeadingSpace = false;
            suppressLeadingSpaceBaseline = null;
            return;
        }

        boolean detectedDeletion = pendingBackspaceCheck
                && didDeleteTrailingChars(lastObservedTextBeforeCursor, snapshotNow);
        if (detectedDeletion) {
            suppressNextLeadingSpace = true;
            suppressLeadingSpaceBaseline = snapshotNow;
        } else if (suppressNextLeadingSpace) {
            boolean stillValid = snapshotNow != null
                    && !snapshotNow.isEmpty()
                    && Character.isLetterOrDigit(snapshotNow.charAt(snapshotNow.length() - 1))
                    && snapshotNow.equals(suppressLeadingSpaceBaseline);
            if (!stillValid) {
                suppressNextLeadingSpace = false;
                suppressLeadingSpaceBaseline = null;
            }
        }

        // Arm Backspace detection only for non-letter, non-Space, non-punctuation keys.
        // Because Shift also lives in nonLetterKeys, Shift taps neither clear an already-latched
        // compound flag nor emit deletions, allowing Backspace -> Shift -> Word.
        pendingBackspaceCheck = !downOnLetter;
    }

    void onPointerDown(int pointerId, float x, float y, long eventTimeMs) {
        pendingBackspaceTap = false;
        registerPointerDown(pointerId, x, y, eventTimeMs);
        sawMultiTouch = true;
    }

    void mergeCapsModeOnPointerDown(CapsMode capsMode) {
        if (capsMode == null || capsMode == CapsMode.AUTO || capsMode == CapsMode.NONE) {
            return;
        }
        currentWordCapsMode = mergePromotedCapsMode(currentWordCapsMode, capsMode);
    }

    void onPointerUp(
            int pointerId,
            float x,
            float y,
            long eventTimeMs,
            boolean hasCurrentCoords,
            LifecycleCallbacks callbacks
    ) {
        float swipeThreshold = multiGlideThresholdPx();
        PointerTrack track = activePointers.remove(pointerId);
        boolean isSwipe = false;
        if (track != null) {
            if (hasCurrentCoords) {
                track.addPoint(x, y, eventTimeMs, geometry);
            }
            track.finished = true;
            if (!track.isRestingFinger(swipeThreshold)) {
                isSwipe = track.isSwipe(swipeThreshold);
                MultiGlideInputToken token = track.toToken(swipeThreshold);
                if (token != null) {
                    completedTokens.add(token);
                }
            } else {
                restingDroppedThisSession++;
            }
        }
        releasePointerSlot(pointerId);
        if (callbacks != null) {
            callbacks.onPointerFinished(pointerId, isSwipe, true);
        }
    }

    void onActionUp(
            long eventTimeMs,
            SettingsSnapshot settings,
            EditorAdapter editor,
            DecodePort decoder,
            LifecycleCallbacks callbacks
    ) {
        if (pendingBackspaceTap || suppressedBasicUpEventTimeMs == eventTimeMs) {
            PointerTrack track = activePointers.isEmpty()
                    ? null : activePointers.values().iterator().next();
            float upX = (track != null) ? track.lastX : backspaceDownX;
            float upY = (track != null) ? track.lastY : backspaceDownY;
            if (tryConsumePendingBackspaceTap(
                    eventTimeMs, upX, upY, settings, editor, decoder, callbacks)) {
                resetGestureState();
                return;
            }
        }
        float swipeThreshold = multiGlideThresholdPx();
        boolean isMultiGlideGesture = sawMultiTouch
                || multiGlideTakeoverActive
                || (multiGlideWordActive && !wordTokens.isEmpty());
        boolean anySwipeThisSession = false;

        for (PointerTrack track : activePointers.values()) {
            track.finished = true;
            if (track.isRestingFinger(swipeThreshold)) {
                restingDroppedThisSession++;
                if (isMultiGlideGesture && callbacks != null) {
                    callbacks.onPointerFinished(track.pointerId, false, true);
                }
                continue;
            }
            boolean isSwipe = track.isSwipe(swipeThreshold);
            if (isSwipe) {
                anySwipeThisSession = true;
            }
            MultiGlideInputToken token = track.toToken(swipeThreshold);
            if (token != null) {
                completedTokens.add(token);
            }
            if (isMultiGlideGesture && callbacks != null) {
                callbacks.onPointerFinished(track.pointerId, isSwipe, true);
            }
        }
        activePointers.clear();
        lastTouchUpTimeMs = eventTimeMs;

        boolean hasSwipe = anySwipeThisSession || containsSwipeToken(completedTokens) || containsSwipeToken(wordTokens);

        if (isMultiGlideGesture && !hasSwipe && callbacks != null) {
            callbacks.onClearTrailManagerActive();
        }

        boolean singleTouchSwipeConfirmed = !observedShouldStartGestureThisStroke
                || stockGestureStartedThisStroke;
        boolean allowTapOnlySingleCombine = (!settings.autoSpaceEnabled || settings.tapToMultiGlideDelayMs > 0)
                && singleTouchSwipeConfirmed;
        boolean promoteMultiTouchPassive = !multiGlideWordActive
                && passiveTapBuffer.canPromoteMultiTouchSwipe(completedTokens);
        boolean promoteSingleTouchCombine = !multiGlideWordActive
                && (!settings.autoSpaceEnabled || settings.singleTouchCombineDelayMs > 0)
                && singleTouchCombineBuffer.canPromoteWith(
                        completedTokens, sawNonLetterThisSession, allowTapOnlySingleCombine);
        boolean shouldDecodeNow = ((isMultiGlideGesture || promoteMultiTouchPassive) && hasSwipe)
                || promoteSingleTouchCombine;

        if (shouldDecodeNow) {
            List<WordCandidate> preDecodedCandidates = null;
            if (settings.smartTapSwipeSplitEnabled
                    && decoder != null
                    && !multiGlideWordActive
                    && containsSwipeToken(completedTokens)
                    && (promoteMultiTouchPassive
                            || (promoteSingleTouchCombine
                                    && !singleTouchCombineBuffer.hasSwipeToken))) {
                boolean usingSingleTouchBuffer = promoteSingleTouchCombine && !promoteMultiTouchPassive;
                List<MultiGlideInputToken> tapTokens = usingSingleTouchBuffer
                        ? singleTouchCombineBuffer.tokens
                        : passiveTapBuffer.tokens;
                String tapBaseline = usingSingleTouchBuffer
                        ? singleTouchCombineBuffer.baselineText
                        : passiveTapBuffer.baselineText;
                String rawPrefix = extractTypedPrefixSinceBaseline(tapBaseline, textSnapshotAtActionDown);
                if (SmartTapSwipeSplitJudge.isEligibleTapPrefix(rawPrefix)) {
                    String liveSnapshot = (editor != null) ? editor.readTextBeforeCursorSnapshot() : null;
                    String prevWordBeforePrefix = extractPreviousWord(
                            tapBaseline, liveSnapshot, lastCommittedWord);
                    SmartTapSwipeSplitJudge.Evaluation eval =
                            SmartTapSwipeSplitJudge.evaluateBestSplit(
                                    rawPrefix,
                                    tapTokens,
                                    completedTokens,
                                    prevWordBeforePrefix,
                                    decoder);
                    if (eval.isSplit()) {
                        int cut = eval.splitIndex;
                        String splitBaseline = (cut == rawPrefix.length())
                                ? textSnapshotAtActionDown
                                : tailSnapshot((tapBaseline != null ? tapBaseline : "")
                                        + rawPrefix.substring(0, cut));
                        List<MultiGlideInputToken> remainingRightTaps = new ArrayList<>();
                        if (cut < rawPrefix.length() && rawPrefix.length() == tapTokens.size()) {
                            for (int i = cut; i < tapTokens.size(); i++) {
                                remainingRightTaps.add(tapTokens.get(i));
                            }
                        }
                        passiveTapBuffer.clear();
                        singleTouchCombineBuffer.clear();
                        multiGlideTakeoverActive = true;
                        multiGlideWordActive = true;
                        if (callbacks != null) {
                            callbacks.onTrailAccentChanged(true);
                            callbacks.onNativeTopBarBlankChanged(true);
                            callbacks.onTakeoverActivatedOnFinish();
                        }
                        promotedTapPrefix = null;
                        textSnapshotAtActionDown = splitBaseline;
                        wordTokens.addAll(remainingRightTaps);
                        wordTokens.addAll(completedTokens);
                        completedTokens.clear();
                        decodeAndPreview(
                                settings,
                                editor,
                                decoder,
                                callbacks,
                                eval.splitCandidates,
                                splitBaseline,
                                true);
                        if (settings.autoSpaceEnabled) {
                            if (callbacks != null) {
                                callbacks.onCancelAutospaceTimer();
                            }
                            autospaceTimerPending = true;
                            if (callbacks != null) {
                                callbacks.onScheduleAutospaceTimer(settings.autoSpaceDelayMs);
                            }
                        } else {
                            autospaceTimerPending = false;
                        }
                        return;
                    }
                    preDecodedCandidates = eval.combinedCandidates;
                }
            }
            // MG-02 / MG-03: With Auto-Space ON, probe sequential 1-finger combinations first so a
            // 0-candidate miss lets rapid stock 1-finger typing proceed untouched.
            // With Auto-Space OFF, no Space means same word, so MultiGlide takes over and retains
            // the existing match/prefix plus all tokens if 0 candidates match.
            if (settings.autoSpaceEnabled
                    && !multiGlideWordActive
                    && promoteSingleTouchCombine
                    && !promoteMultiTouchPassive) {
                List<MultiGlideInputToken> probeWordTokens = new ArrayList<>();
                String probeBaseline = singleTouchCombineBuffer.peekPromotedBaseline(
                        probeWordTokens, textSnapshotAtActionDown);
                probeWordTokens.addAll(completedTokens);
                String probePrevWord = extractPreviousWord(
                        probeBaseline,
                        (editor != null) ? editor.readTextBeforeCursorSnapshot() : null,
                        lastCommittedWord);
                if (preDecodedCandidates == null) {
                    preDecodedCandidates = (decoder != null)
                            ? decoder.decode(probeWordTokens, probePrevWord)
                            : null;
                }
                if (preDecodedCandidates == null || preDecodedCandidates.isEmpty()) {
                    singleTouchCombineBuffer.clear();
                    handleStockFallback(
                            eventTimeMs,
                            settings,
                            editor,
                            hasSwipe,
                            true,
                            callbacks,
                            decoder != null ? preDecodedCandidates : null,
                            probeWordTokens,
                            probePrevWord,
                            probeBaseline);
                    return;
                }
            }

            boolean wasMultiGlideWordActive = multiGlideWordActive;
            String snapshotBeforePromotion = textSnapshotAtActionDown;
            multiGlideTakeoverActive = true;
            multiGlideWordActive = true;
            if (callbacks != null) {
                callbacks.onTrailAccentChanged(true);
                callbacks.onNativeTopBarBlankChanged(true);
                callbacks.onTakeoverActivatedOnFinish();
            }

            if (!wasMultiGlideWordActive) {
                int beforePromoted = wordTokens.size();
                if (promoteSingleTouchCombine && !promoteMultiTouchPassive) {
                    currentWordCapsMode = mergePromotedCapsMode(
                            singleTouchCombineBuffer.initialCapsMode, currentWordCapsMode);
                    String rawPrefix = extractTypedPrefixSinceBaseline(
                            singleTouchCombineBuffer.baselineText, textSnapshotAtActionDown);
                    textSnapshotAtActionDown = singleTouchCombineBuffer.promoteInto(
                            wordTokens, textSnapshotAtActionDown);
                    promotedTapPrefix = (rawPrefix != null && !containsSwipeToken(wordTokens))
                            ? rawPrefix : null;
                    passiveTapBuffer.clear();
                } else {
                    currentWordCapsMode = mergePromotedCapsMode(
                            passiveTapBuffer.initialCapsMode, currentWordCapsMode);
                    String rawPrefix = extractTypedPrefixSinceBaseline(
                            passiveTapBuffer.baselineText, textSnapshotAtActionDown);
                    textSnapshotAtActionDown = passiveTapBuffer.promoteInto(
                            wordTokens, textSnapshotAtActionDown);
                    promotedTapPrefix = (rawPrefix != null && !containsSwipeToken(wordTokens))
                            ? rawPrefix : null;
                    singleTouchCombineBuffer.clear();
                }
                lastPromotedPassiveCount += Math.max(0, wordTokens.size() - beforePromoted);
            } else {
                passiveTapBuffer.clear();
                singleTouchCombineBuffer.clear();
            }

            wordTokens.addAll(completedTokens);
            completedTokens.clear();

            decodeAndPreview(
                    settings,
                    editor,
                    decoder,
                    callbacks,
                    preDecodedCandidates,
                    snapshotBeforePromotion);

            if (settings.autoSpaceEnabled) {
                if (callbacks != null) {
                    callbacks.onCancelAutospaceTimer();
                }
                autospaceTimerPending = true;
                if (callbacks != null) {
                    callbacks.onScheduleAutospaceTimer(settings.autoSpaceDelayMs);
                }
            } else {
                autospaceTimerPending = false;
            }
        } else {
            handleStockFallback(
                    eventTimeMs, settings, editor, hasSwipe, false, callbacks, null, null, null, null);
        }
    }

    private void handleStockFallback(
            long eventTimeMs,
            SettingsSnapshot settings,
            EditorAdapter editor,
            boolean hasSwipe,
            boolean failedSingleCombine,
            LifecycleCallbacks callbacks,
            List<WordCandidate> failedCandidates,
            List<MultiGlideInputToken> failedTokens,
            String failedPrevWord,
            String failedBaseline
    ) {
        if (callbacks != null) {
            callbacks.onTrailAccentChanged(false);
            callbacks.onNativeTopBarBlankChanged(false);
        }
        String tapBaselineAtDown = textSnapshotAtActionDown;
        CapsMode strokeCapsMode = currentWordCapsMode;
        boolean strokeHadMultiTouch = sawMultiTouch;
        boolean sawNonLetter = sawNonLetterThisSession;
        int restingDropped = restingDroppedThisSession;
        List<MultiGlideInputToken> completedCopy = new ArrayList<>(completedTokens);
        clearWordBuffer(callbacks);
        completedTokens.clear();
        multiGlideTakeoverActive = false;

        if (failedSingleCombine && callbacks != null && failedTokens != null) {
            callbacks.onWordDecoded(
                    null,
                    null,
                    failedTokens,
                    false,
                    failedPrevWord,
                    failedBaseline,
                    0,
                    0,
                    restingDropped,
                    failedCandidates);
        }

        boolean stockSwipeConfirmed = hasSwipe
                && (!observedShouldStartGestureThisStroke || stockGestureStartedThisStroke);
        boolean effectiveStrokeHasSwipe = strokeHadMultiTouch ? hasSwipe : stockSwipeConfirmed;

        boolean passiveWasEmpty = passiveTapBuffer.tokens.isEmpty();
        passiveTapBuffer.recordStroke(
                completedCopy,
                effectiveStrokeHasSwipe,
                sawNonLetter,
                strokeHadMultiTouch,
                tapBaselineAtDown,
                eventTimeMs,
                settings.tapToMultiGlideDelayMs,
                settings.autoSpaceEnabled);
        if (passiveWasEmpty && !passiveTapBuffer.tokens.isEmpty()) {
            passiveTapBuffer.initialCapsMode = strokeCapsMode;
        }
        boolean combineWasEmpty = singleTouchCombineBuffer.tokens.isEmpty();
        singleTouchCombineBuffer.recordStroke(
                completedCopy,
                effectiveStrokeHasSwipe,
                sawNonLetter,
                tapBaselineAtDown,
                eventTimeMs,
                settings.singleTouchCombineDelayMs,
                settings.autoSpaceEnabled);
        if (combineWasEmpty && !singleTouchCombineBuffer.tokens.isEmpty()) {
            singleTouchCombineBuffer.initialCapsMode = strokeCapsMode;
        }

        boolean scheduleStockSwipeAutospace = settings.autoSpaceEnabled
                && !sawNonLetter
                && !strokeHadMultiTouch
                && (stockSwipeConfirmed
                        || (!singleTouchCombineBuffer.tokens.isEmpty()
                                && singleTouchCombineBuffer.hasSwipeToken));
        if (scheduleStockSwipeAutospace && settings.autoSpaceBeforeWord
                && (settings.singleTouchCombineDelayMs <= 0 || singleTouchCombineBuffer.tokens.isEmpty())) {
            pendingLeadingSpaceBeforeNextWord = true;
            if (callbacks != null) {
                callbacks.onBufferTimerUpdated(0L);
            }
        } else if (scheduleStockSwipeAutospace && callbacks != null) {
            long stockDelayMs = (settings.singleTouchCombineDelayMs > 0 && !singleTouchCombineBuffer.tokens.isEmpty())
                    ? settings.singleTouchCombineDelayMs
                    : settings.autoSpaceDelayMs;
            stockSwipeAutospacePending = true;
            callbacks.onScheduleStockSwipeAutospaceTimer(stockDelayMs);
            callbacks.onBufferTimerUpdated(stockDelayMs);
        } else if (callbacks != null) {
            callbacks.onBufferTimerUpdated(0L);
        }

        if (callbacks != null && (hasSwipe || strokeHadMultiTouch || restingDropped > 0
                || !passiveTapBuffer.tokens.isEmpty())) {
            String reason = !hasSwipe
                    ? (strokeHadMultiTouch ? "rollover_no_swipe" : "tap_only")
                    : "single_touch_swipe";
            callbacks.onSkippedGesture(
                    reason,
                    hasSwipe,
                    strokeHadMultiTouch,
                    passiveTapBuffer.tokens.size(),
                    restingDropped,
                    tapBaselineAtDown,
                    completedCopy);
        }
    }

    private void decodeAndPreview(
            SettingsSnapshot settings,
            EditorAdapter editor,
            DecodePort decoder,
            LifecycleCallbacks callbacks,
            List<WordCandidate> preDecodedCandidates,
            String snapshotBeforePromotion
    ) {
        decodeAndPreview(
                settings,
                editor,
                decoder,
                callbacks,
                preDecodedCandidates,
                snapshotBeforePromotion,
                false);
    }

    private void decodeAndPreview(
            SettingsSnapshot settings,
            EditorAdapter editor,
            DecodePort decoder,
            LifecycleCallbacks callbacks,
            List<WordCandidate> preDecodedCandidates,
            String snapshotBeforePromotion,
            boolean forceLeadingSpace
    ) {
        if (decoder == null && preDecodedCandidates == null) return;
        String liveSnapshot = (editor != null) ? editor.readTextBeforeCursorSnapshot() : null;
        String prevWord = extractPreviousWord(textSnapshotAtActionDown, liveSnapshot, lastCommittedWord);
        List<WordCandidate> candidates = (preDecodedCandidates != null)
                ? preDecodedCandidates
                : decoder.decode(wordTokens, prevWord);
        if (candidates == null || candidates.isEmpty()) {
            if (currentComposingWord == null && snapshotBeforePromotion != null) {
                String retainedPrefix = extractTypedPrefixSinceBaseline(
                        textSnapshotAtActionDown, snapshotBeforePromotion);
                if (retainedPrefix != null && !retainedPrefix.isEmpty()) {
                    currentComposingWord = retainedPrefix;
                    leadingSpaceEvaluated = true;
                }
                expectedSnapshotAfterPreview = snapshotBeforePromotion;
                lastObservedTextBeforeCursor = snapshotBeforePromotion;
            }
            if (callbacks != null) {
                callbacks.onWordDecoded(
                        null,
                        null,
                        wordTokens,
                        false,
                        prevWord,
                        textSnapshotAtActionDown,
                        lastPromotedPassiveCount,
                        0,
                        restingDroppedThisSession,
                        candidates);
            }
            return;
        }

        boolean prependLeadingSpace = !leadingSpaceEvaluated
                && !suppressNextLeadingSpace
                && (forceLeadingSpace
                        || shouldPrependLeadingSpace(
                                textSnapshotAtActionDown, settings.autoSpaceEnabled));
        boolean attachingAfterDeletion = isAttachingAfterDeletion(
                textSnapshotAtActionDown, prependLeadingSpace, suppressNextLeadingSpace);

        String bestWord = candidates.get(0).word;
        String capContext = (textSnapshotAtActionDown != null) ? textSnapshotAtActionDown : liveSnapshot;
        CapsMode effectiveCapsMode = currentWordCapsMode != null ? currentWordCapsMode : CapsMode.AUTO;
        boolean capitalizeFirst = effectiveCapsMode == CapsMode.CAPS_LOCK
                || effectiveCapsMode == CapsMode.SHIFT
                || (effectiveCapsMode == CapsMode.AUTO
                        && !attachingAfterDeletion
                        && shouldCapitalizeFirstLetter(capContext));
        bestWord = applyWordCasing(bestWord, attachingAfterDeletion, effectiveCapsMode, capContext);

        List<String> alternativeWords = new ArrayList<>(candidates.size());
        for (int i = 0; i < candidates.size(); i++) {
            String w = applyWordCasing(
                    candidates.get(i).word, attachingAfterDeletion, effectiveCapsMode, capContext);
            if (!alternativeWords.contains(w)) {
                alternativeWords.add(w);
            }
        }

        currentComposingWord = bestWord;
        currentAlternativeWords = alternativeWords;

        int rollbackDeleted = 0;
        if (editor != null) {
            rollbackDeleted = editor.previewWord(
                    bestWord, textSnapshotAtActionDown, prependLeadingSpace);
            if (prependLeadingSpace && textSnapshotAtActionDown != null) {
                textSnapshotAtActionDown = tailSnapshot(textSnapshotAtActionDown + " ");
            }
            leadingSpaceEvaluated = true;
            pendingBackspaceCheck = false;
            expectedSnapshotAfterPreview = (textSnapshotAtActionDown != null)
                    ? tailSnapshot(textSnapshotAtActionDown + bestWord)
                    : null;
            String afterPreview = editor.readTextBeforeCursorSnapshot();
            if (afterPreview != null) {
                expectedSnapshotAfterPreview = afterPreview;
                lastObservedTextBeforeCursor = afterPreview;
            }
        }

        if (callbacks != null) {
            callbacks.onWordDecoded(
                    bestWord,
                    alternativeWords,
                    wordTokens,
                    capitalizeFirst,
                    prevWord,
                    textSnapshotAtActionDown,
                    lastPromotedPassiveCount,
                    rollbackDeleted,
                    restingDroppedThisSession,
                    candidates);
        }
    }

    void onActionCancel(LifecycleCallbacks callbacks) {
        if (callbacks != null) {
            callbacks.onTrailAccentChanged(false);
            callbacks.onNativeTopBarBlankChanged(false);
            callbacks.onClearTrailManagerActive();
        }
        resetGestureState();
        clearWordBuffer(callbacks);
        if (callbacks != null) {
            callbacks.onBufferTimerUpdated(0L);
        }
        passiveTapBuffer.clear();
        singleTouchCombineBuffer.clear();
        pendingBackspaceCheck = false;
        suppressNextLeadingSpace = false;
        suppressLeadingSpaceBaseline = null;
        pendingLeadingSpaceBeforeNextWord = false;
        pendingBackspaceTap = false;
        lastCommittedWordUndo = null;
    }

    void finalizeAutospace(
            boolean autoSpaceEnabled,
            EditorAdapter editor,
            LifecycleCallbacks callbacks
    ) {
        finalizeAutospace(autoSpaceEnabled, false, editor, callbacks);
    }

    void finalizeAutospace(
            boolean autoSpaceEnabled,
            boolean autoSpaceBeforeWord,
            EditorAdapter editor,
            LifecycleCallbacks callbacks
    ) {
        if (!autospaceTimerPending) return;
        autospaceTimerPending = false;
        if (!activePointers.isEmpty()) return;

        String committedWord = currentComposingWord;
        List<String> alternatives = currentAlternativeWords;

        if (editor != null && committedWord != null && !committedWord.isEmpty()) {
            boolean appendSpace = autoSpaceEnabled && !autoSpaceBeforeWord;
            editor.commitFinishedWord(committedWord, appendSpace);
            autospaceInserted = appendSpace;
            pendingLeadingSpaceBeforeNextWord = autoSpaceEnabled && autoSpaceBeforeWord;

            String afterSnapshot = editor.readTextBeforeCursorSnapshot();
            autospaceSnapshot = autoSpaceEnabled ? afterSnapshot : null;
            if (afterSnapshot != null) {
                lastObservedTextBeforeCursor = afterSnapshot;
                lastCommittedWordUndo = new LastCommittedWordUndo(
                        afterSnapshot,
                        committedWord.length() + (appendSpace ? 1 : 0));
            }
            String prevWord = extractPreviousWord(
                    textSnapshotAtActionDown, afterSnapshot, lastCommittedWord);
            lastCommittedWord = committedWord;
            if (callbacks != null) {
                callbacks.onWordCommitted(committedWord, autospaceInserted, prevWord, alternatives);
            }
        }

        clearWordBuffer(callbacks);
        passiveTapBuffer.clear();
        singleTouchCombineBuffer.clear();
        resetGestureState();
        if (callbacks != null) {
            callbacks.onTrailAccentChanged(false);
            callbacks.onWordReadyTimerElapsed();
        }
    }

    void finalizeStockSwipeAutospace(
            boolean autoSpaceEnabled,
            EditorAdapter editor
    ) {
        finalizeStockSwipeAutospace(autoSpaceEnabled, false, editor, null);
    }

    void finalizeStockSwipeAutospace(
            boolean autoSpaceEnabled,
            boolean autoSpaceBeforeWord,
            EditorAdapter editor
    ) {
        finalizeStockSwipeAutospace(autoSpaceEnabled, autoSpaceBeforeWord, editor, null);
    }

    void finalizeStockSwipeAutospace(
            boolean autoSpaceEnabled,
            boolean autoSpaceBeforeWord,
            EditorAdapter editor,
            LifecycleCallbacks callbacks
    ) {
        if (!stockSwipeAutospacePending) return;
        stockSwipeAutospacePending = false;
        if (!autoSpaceEnabled || !activePointers.isEmpty() || editor == null) return;

        String before = editor.readTextBeforeCursorSnapshot();
        if (before == null || before.isEmpty()) return;
        char last = before.charAt(before.length() - 1);
        if (!Character.isLetterOrDigit(last)) return;

        if (autoSpaceBeforeWord) {
            pendingLeadingSpaceBeforeNextWord = true;
            if (callbacks != null) {
                callbacks.onWordReadyTimerElapsed();
            }
            return;
        }

        editor.commitFinishedWord(null, true);
        autospaceInserted = true;

        String afterSnapshot = editor.readTextBeforeCursorSnapshot();
        autospaceSnapshot = afterSnapshot;
        if (afterSnapshot != null) {
            lastObservedTextBeforeCursor = afterSnapshot;
        }
        passiveTapBuffer.clear();
        singleTouchCombineBuffer.clear();
        if (callbacks != null) {
            callbacks.onWordReadyTimerElapsed();
        }
    }

    /**
     * Handles {@code ACTION_DOWN} from Gboard's {@code BasicMotionEventHandler} (which runs on
     * all layouts, including {@code ?123} symbols where {@code AbstractGestureMotionEventHandler}
     * is inactive). Retracts the auto-inserted trailing space immediately before hugging
     * punctuation such as {@code ':'} is committed.
     */
    void onBasicHandlerActionDown(char keyChar, EditorAdapter editor) {
        if (!autospaceInserted || editor == null) {
            return;
        }
        String snapshotNow = editor.readTextBeforeCursorSnapshot();
        if (autospaceSnapshot != null && snapshotNow != null && !snapshotNow.equals(autospaceSnapshot)) {
            autospaceInserted = false;
            autospaceSnapshot = null;
            return;
        }
        if (geometry.isPunctuationChar(keyChar)) {
            String before = editor.readCharBeforeCursor();
            if (before != null && !before.isEmpty() && before.charAt(before.length() - 1) == ' ') {
                editor.deleteCharsBeforeCursor(1);
                String after = editor.readTextBeforeCursorSnapshot();
                if (after != null) {
                    lastObservedTextBeforeCursor = after;
                }
            }
            autospaceInserted = false;
            autospaceSnapshot = null;
            autospaceFirstSpaceTapDownTimeMs = 0L;
        } else if (keyChar != '\0') {
            autospaceInserted = false;
            autospaceSnapshot = null;
        }
    }

    // ---- MG-21: Configurable Backspace Handling ----

    void maybeCancelPendingBackspaceTap(
            float x,
            float y,
            long eventTimeMs,
            LifecycleCallbacks callbacks
    ) {
        if (!pendingBackspaceTap) return;
        float dx = x - backspaceDownX;
        float dy = y - backspaceDownY;
        float maxDist = backspaceSwipeThresholdPx();
        if ((dx * dx + dy * dy) > (maxDist * maxDist)
                || (eventTimeMs - backspaceDownTimeMs) > BACKSPACE_HOLD_TIMEOUT_MS) {
            pendingBackspaceTap = false;
            lastCommittedWordUndo = null;
            boolean wasActive = multiGlideTakeoverActive || multiGlideWordActive;
            multiGlideTakeoverActive = false;
            clearWordBuffer(callbacks);
            if (wasActive && callbacks != null) {
                callbacks.onTrailAccentChanged(false);
                callbacks.onNativeTopBarBlankChanged(false);
            }
        }
    }

    boolean shouldSuppressBasicUpForEvent(long eventTimeMs) {
        return suppressedBasicUpEventTimeMs == eventTimeMs;
    }

    boolean tryConsumePendingBackspaceTap(
            long eventTimeMs,
            float x,
            float y,
            SettingsSnapshot settings,
            EditorAdapter editor,
            DecodePort decoder,
            LifecycleCallbacks callbacks
    ) {
        if (suppressedBasicUpEventTimeMs == eventTimeMs) {
            return true;
        }
        if (!pendingBackspaceTap) {
            return false;
        }
        pendingBackspaceTap = false;

        float dx = x - backspaceDownX;
        float dy = y - backspaceDownY;
        float maxDist = backspaceSwipeThresholdPx();
        long elapsed = eventTimeMs - backspaceDownTimeMs;
        if ((dx * dx + dy * dy) > (maxDist * maxDist) || elapsed < 0L || elapsed > BACKSPACE_HOLD_TIMEOUT_MS) {
            lastCommittedWordUndo = null;
            clearWordBuffer(callbacks);
            return false;
        }

        String snapshotNow = (editor != null) ? editor.readTextBeforeCursorSnapshot() : null;

        // Case 1: Active/pending MultiGlide word in last_input mode
        if (multiGlideWordActive
                && settings != null
                && GboardMultiGlideSettings.BACKSPACE_MODE_LAST_INPUT.equals(settings.backspaceMode)
                && !wordTokens.isEmpty()) {
            removeLatestStartedToken(wordTokens);
            if (containsSwipeToken(wordTokens)) {
                suppressedBasicUpEventTimeMs = eventTimeMs;
                pendingBackspaceCheck = false;
                suppressNextLeadingSpace = false;
                suppressLeadingSpaceBaseline = null;
                multiGlideTakeoverActive = true;
                multiGlideWordActive = true;
                lastTouchUpTimeMs = eventTimeMs;
                if (callbacks != null) {
                    callbacks.onTrailAccentChanged(true);
                }
                decodeAndPreview(settings, editor, decoder, callbacks, null, snapshotNow);
                if (settings.autoSpaceEnabled && callbacks != null) {
                    callbacks.onCancelAutospaceTimer();
                    autospaceTimerPending = true;
                    callbacks.onScheduleAutospaceTimer(settings.autoSpaceDelayMs);
                } else {
                    autospaceTimerPending = false;
                }
                return true;
            }
            if (!wordTokens.isEmpty() && currentComposingWord != null && !currentComposingWord.isEmpty()) {
                // Only TAP tokens remain (MG-08 / MG-09): restore typed tap prefix into editor and PassiveTapBuffer.
                String restoredPrefix = buildRestoredTapPrefix(wordTokens, promotedTapPrefix);
                if (editor != null && restoredPrefix != null && !restoredPrefix.isEmpty()) {
                    editor.replaceComposingWithText(currentComposingWord.length(), restoredPrefix);
                }
                List<MultiGlideInputToken> remainingTaps = new ArrayList<>(wordTokens);
                String baselineBeforeTaps = textSnapshotAtActionDown;
                clearWordBuffer(callbacks);
                if (baselineBeforeTaps != null) {
                    passiveTapBuffer.clear();
                    passiveTapBuffer.tokens.addAll(remainingTaps);
                    passiveTapBuffer.baselineText = baselineBeforeTaps;
                    passiveTapBuffer.lastUpTimeMs = eventTimeMs;
                }
                suppressedBasicUpEventTimeMs = eventTimeMs;
                pendingBackspaceCheck = false;
                suppressNextLeadingSpace = false;
                suppressLeadingSpaceBaseline = null;
                multiGlideTakeoverActive = false;
                if (callbacks != null) {
                    callbacks.onTrailAccentChanged(false);
                    callbacks.onNativeTopBarBlankChanged(false);
                }
                if (editor != null) {
                    lastObservedTextBeforeCursor = editor.readTextBeforeCursorSnapshot();
                }
                return true;
            }
            // Fall through to whole-word deletion when 0 tokens remain.
        }

        // Case 2: Whole-word deletion while pending (whole_word mode, or 1-token word in last_input mode)
        if (multiGlideWordActive && currentComposingWord != null && !currentComposingWord.isEmpty()) {
            if (editor != null) {
                editor.deleteActiveComposingWord(currentComposingWord.length());
            }
            suppressedBasicUpEventTimeMs = eventTimeMs;
            clearWordBuffer(callbacks);
            lastCommittedWordUndo = null;
            pendingLeadingSpaceBeforeNextWord = false;
            pendingBackspaceCheck = false;
            suppressNextLeadingSpace = false;
            suppressLeadingSpaceBaseline = null;
            multiGlideTakeoverActive = false;
            if (callbacks != null) {
                callbacks.onTrailAccentChanged(false);
                callbacks.onNativeTopBarBlankChanged(false);
            }
            if (editor != null) {
                lastObservedTextBeforeCursor = editor.readTextBeforeCursorSnapshot();
            }
            return true;
        }

        // Case 3: Whole-word deletion of the immediately preceding committed MultiGlide word
        if (lastCommittedWordUndo != null
                && snapshotNow != null
                && snapshotNow.equals(lastCommittedWordUndo.expectedSnapshot)) {
            if (editor != null && lastCommittedWordUndo.deleteCharCount > 0) {
                editor.deleteCharsBeforeCursor(lastCommittedWordUndo.deleteCharCount);
            }
            suppressedBasicUpEventTimeMs = eventTimeMs;
            lastCommittedWordUndo = null;
            autospaceInserted = false;
            autospaceSnapshot = null;
            pendingLeadingSpaceBeforeNextWord = false;
            pendingBackspaceCheck = false;
            suppressNextLeadingSpace = false;
            suppressLeadingSpaceBaseline = null;
            if (editor != null) {
                lastObservedTextBeforeCursor = editor.readTextBeforeCursorSnapshot();
            }
            return true;
        }

        lastCommittedWordUndo = null;
        clearWordBuffer(callbacks);
        return false;
    }

    private static void removeLatestStartedToken(List<MultiGlideInputToken> tokens) {
        if (tokens == null || tokens.isEmpty()) return;
        int bestIdx = tokens.size() - 1;
        long bestStart = tokens.get(bestIdx).startTimeMs;
        for (int i = tokens.size() - 2; i >= 0; i--) {
            long tStart = tokens.get(i).startTimeMs;
            if (tStart > bestStart) {
                bestStart = tStart;
                bestIdx = i;
            }
        }
        tokens.remove(bestIdx);
    }

    private static String buildRestoredTapPrefix(
            List<MultiGlideInputToken> tapTokens,
            String savedPrefix
    ) {
        if (savedPrefix != null && savedPrefix.length() == tapTokens.size()) {
            return savedPrefix;
        }
        StringBuilder sb = new StringBuilder(tapTokens.size());
        for (int i = 0; i < tapTokens.size(); i++) {
            MultiGlideInputToken t = tapTokens.get(i);
            if (t != null && t.character != '\0') {
                sb.append(t.character);
            }
        }
        return sb.toString();
    }

    // ---- Hook predicates (MG-06, MG-07, MG-17) ----

    boolean shouldStartGesture(boolean enabled, boolean stockShouldStart, boolean gestureAlreadyActive) {
        if (!enabled) return stockShouldStart;
        observedShouldStartGestureThisStroke = true;
        boolean multiGlideControlled = sawMultiTouch || multiGlideTakeoverActive || multiGlideWordActive;
        if (stockShouldStart) {
            stockGestureStartedThisStroke = true;
            if (multiGlideControlled) {
                multiGlideTakeoverActive = true;
            }
            return true;
        }
        if (gestureAlreadyActive) {
            return false;
        }
        if (multiGlideControlled && hasAnySwipingPointer(multiGlideThresholdPx())) {
            multiGlideTakeoverActive = true;
            return true;
        }
        return false;
    }

    boolean isControlled() {
        return sawMultiTouch || multiGlideTakeoverActive || multiGlideWordActive;
    }

    boolean resolveLetterStarted(boolean enabled, boolean stockLetterStarted) {
        if (stockLetterStarted || !enabled) {
            return stockLetterStarted;
        }
        return sawMultiTouch || multiGlideTakeoverActive || !completedTokens.isEmpty();
    }

    boolean shouldReceiveEventsDuringOtherOwner(boolean enabled) {
        return enabled && (!activePointers.isEmpty() || sawMultiTouch || multiGlideTakeoverActive);
    }

    boolean shouldSuppressBasicHandler(boolean enabled, boolean isActionDown) {
        return enabled && !isActionDown && multiGlideTakeoverActive;
    }

    boolean shouldSuppressRolloverCommit(
            boolean enabled,
            boolean isActionPointerDown,
            boolean geometryReady,
            long eventTimeMs,
            float newPointerX,
            float newPointerY,
            boolean hasFirstPointer,
            float firstPointerX,
            float firstPointerY
    ) {
        if (!enabled || !isActionPointerDown || !geometryReady) {
            return false;
        }
        if (multiGlideTakeoverActive) {
            return true;
        }
        long deltaMs = eventTimeMs - lastActionDownTimeMs;
        if (!lastDownOnLetterArea || deltaMs < 0L || deltaMs > ROLLOVER_MULTI_TOUCH_WINDOW_MS) {
            return false;
        }
        if (!geometry.isOnLetterArea(newPointerX, newPointerY)) {
            return false;
        }
        if (hasFirstPointer) {
            return geometry.isOnLetterArea(firstPointerX, firstPointerY);
        }
        return true;
    }

    boolean shouldInterceptGestureDispatch() {
        return multiGlideTakeoverActive;
    }

    boolean shouldInterceptGestureReset() {
        boolean protect = !activePointers.isEmpty()
                && (sawMultiTouch || multiGlideTakeoverActive || multiGlideWordActive);
        if (!protect) {
            resetGestureState();
            return false;
        }
        return true;
    }

    // ---- Pure text & prefix helpers ----

    private static boolean containsSwipeToken(List<MultiGlideInputToken> tokens) {
        for (int i = 0; i < tokens.size(); i++) {
            if (tokens.get(i).kind == MultiGlideInputToken.Kind.SWIPE) {
                return true;
            }
        }
        return false;
    }

    private static String tailSnapshot(String s) {
        if (s == null || s.length() <= TEXT_SNAPSHOT_CHARS) {
            return s;
        }
        return s.substring(s.length() - TEXT_SNAPSHOT_CHARS);
    }

    static boolean isSpaceAfterPunctuation(char c) {
        return c == '.' || c == ',' || c == '!' || c == '?' || c == ';' || c == ':';
    }

    static boolean shouldPrependLeadingSpace(String baselineBeforeText, boolean autoSpaceEnabled) {
        if (!autoSpaceEnabled || baselineBeforeText == null || baselineBeforeText.isEmpty()) {
            return false;
        }
        char last = baselineBeforeText.charAt(baselineBeforeText.length() - 1);
        return Character.isLetterOrDigit(last) || isSpaceAfterPunctuation(last);
    }

    /**
     * Checks whether trailing characters were deleted between {@code previousSnapshot} and
     * {@code currentSnapshot} while leaving a trailing letter/digit (supports both short texts
     * and saturated >= 256-char sliding snapshots).
     */
    static boolean didDeleteTrailingChars(String previousSnapshot, String currentSnapshot) {
        if (previousSnapshot == null || currentSnapshot == null || currentSnapshot.isEmpty()) {
            return false;
        }
        if (!Character.isLetterOrDigit(currentSnapshot.charAt(currentSnapshot.length() - 1))) {
            return false;
        }
        int prevLen = previousSnapshot.length();
        int curLen = currentSnapshot.length();
        if (curLen < prevLen) {
            return true;
        }
        if (curLen == prevLen && curLen >= 32 && !currentSnapshot.equals(previousSnapshot)) {
            int maxDel = Math.min(MAX_ROLLBACK_EXTRA_CHARS, curLen - 1);
            for (int deleted = 1; deleted <= maxDel; deleted++) {
                if (currentSnapshot.regionMatches(deleted, previousSnapshot, 0, curLen - deleted)) {
                    return true;
                }
            }
        }
        return false;
    }

    static boolean isAttachingAfterDeletion(
            String baselineBeforeText,
            boolean prependLeadingSpace,
            boolean suppressNextLeadingSpace
    ) {
        if (prependLeadingSpace || !suppressNextLeadingSpace
                || baselineBeforeText == null || baselineBeforeText.isEmpty()) {
            return false;
        }
        return Character.isLetterOrDigit(baselineBeforeText.charAt(baselineBeforeText.length() - 1));
    }

    static boolean isAttachingDirectlyToWord(String baselineBeforeText, boolean prependLeadingSpace) {
        if (prependLeadingSpace || baselineBeforeText == null || baselineBeforeText.isEmpty()) {
            return false;
        }
        return Character.isLetterOrDigit(baselineBeforeText.charAt(baselineBeforeText.length() - 1));
    }

    static String lowercaseFirstChar(String word) {
        if (word == null || word.isEmpty()) {
            return word;
        }
        return Character.toLowerCase(word.charAt(0)) + word.substring(1);
    }

    static String capitalizeFirstChar(String word) {
        if (word == null || word.isEmpty()) return word;
        char first = word.charAt(0);
        if (Character.isUpperCase(first)) return word;
        return Character.toUpperCase(first) + word.substring(1);
    }

    static boolean shouldCapitalizeFirstLetter(String before) {
        if (before == null) return false;
        if (before.isEmpty()) return true;
        for (int i = before.length() - 1; i >= 0; i--) {
            char c = before.charAt(i);
            if (c == '\n') return true;
            if (Character.isWhitespace(c)) continue;
            return c == '.' || c == '!' || c == '?';
        }
        return true;
    }

    static String extractPreviousWord(
            String baselineBeforeText,
            String fallbackSnapshot,
            String fallbackLastWord
    ) {
        String source = (baselineBeforeText != null) ? baselineBeforeText : fallbackSnapshot;
        if (source != null && !source.isEmpty()) {
            String s = source.trim();
            if (!s.isEmpty()) {
                int lastSpace = s.lastIndexOf(' ');
                String tail = (lastSpace >= 0) ? s.substring(lastSpace + 1) : s;
                String cleaned = tail.replaceAll("[^\\p{L}]", "");
                if (!cleaned.isEmpty()) {
                    return cleaned;
                }
            }
        }
        return fallbackLastWord;
    }

    static boolean isCombinePrefix(String prefix) {
        if (prefix == null || prefix.length() > MAX_ROLLBACK_EXTRA_CHARS) return false;
        if (!prefix.isEmpty() && prefix.charAt(prefix.length() - 1) == ' ') {
            return false;
        }
        for (int i = 0; i < prefix.length(); i++) {
            char c = prefix.charAt(i);
            if (!Character.isLetter(c) && c != ' ') {
                return false;
            }
        }
        return true;
    }

    static int computeExtraCharsAfterBaseline(String baselineBeforeText, String currentStr) {
        if (baselineBeforeText == null || currentStr == null) return 0;
        if (currentStr.equals(baselineBeforeText)) return 0;
        int baseLen = baselineBeforeText.length();
        int curLen = currentStr.length();
        if (curLen > baseLen && currentStr.startsWith(baselineBeforeText)) {
            int extra = curLen - baseLen;
            return (extra > 0 && extra <= MAX_ROLLBACK_EXTRA_CHARS) ? extra : 0;
        }
        if (curLen == baseLen && baseLen >= 32) {
            for (int extra = 1; extra <= MAX_ROLLBACK_EXTRA_CHARS && extra < baseLen; extra++) {
                if (baselineBeforeText.regionMatches(extra, currentStr, 0, baseLen - extra)) {
                    return extra;
                }
            }
        }
        return 0;
    }

    static String extractTypedPrefixSinceBaseline(String baselineBeforeText, String currentStr) {
        if (baselineBeforeText == null || currentStr == null) return null;
        if (currentStr.equals(baselineBeforeText)) return "";
        int extra = computeExtraCharsAfterBaseline(baselineBeforeText, currentStr);
        if (extra <= 0) return null;
        return currentStr.substring(currentStr.length() - extra);
    }

    static boolean isPureLetterPrefix(String prefix, int tapTokenCount) {
        if (prefix == null) return false;
        if (prefix.length() > tapTokenCount + 2) return false;
        for (int i = 0; i < prefix.length(); i++) {
            if (!Character.isLetter(prefix.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    static List<MultiGlideInputToken> collectPureTapTokens(List<MultiGlideInputToken> tokens) {
        if (tokens == null || tokens.isEmpty()) return null;
        List<MultiGlideInputToken> out = new ArrayList<>(tokens.size());
        for (int i = 0; i < tokens.size(); i++) {
            MultiGlideInputToken t = tokens.get(i);
            if (t == null || t.kind != MultiGlideInputToken.Kind.TAP) {
                return null;
            }
            out.add(t);
        }
        return out;
    }
}
