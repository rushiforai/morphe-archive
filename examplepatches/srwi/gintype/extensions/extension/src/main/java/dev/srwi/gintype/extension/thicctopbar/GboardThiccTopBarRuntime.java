package dev.srwi.gintype.extension.thicctopbar;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.inputmethod.InputConnection;
import android.widget.FrameLayout;
import android.widget.TextView;
import dev.srwi.gintype.extension.multiglide.GboardMultiGlideRuntime;
import dev.srwi.gintype.extension.settings.GboardPatchesFeatureAvailability;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Runtime coordinator for Thicc Top Bar.
 * Intercepts candidates passed to LatinFixedCountCandidatesHolderView and
 * renders them via ThiccTopBarView (2D matrix of words & alternatives).
 */
public final class GboardThiccTopBarRuntime {
    private static final String TAG = "GboardThiccTopBar";
    private static final String MATRIX_BAR_TAG = "gboardpatches:matrix_bar_view";
    private static final String LIVE_GUESS_VIEW_TAG = "gboardpatches:multiglide_live_guess_view";

    public static final class CandidateItem {
        public final String text;
        public final int slotIndex;
        public final boolean isRaw;
        public final boolean isAutoCorrect;
        public final boolean isPrediction;
        public final String candidateType;
        public final Object rawCandidateObj;
        public final View softKey;

        public CandidateItem(String text, int slotIndex, boolean isRaw, boolean isAutoCorrect,
                             boolean isPrediction, String candidateType, Object rawCandidateObj, View softKey) {
            this.text = text;
            this.slotIndex = slotIndex;
            this.isRaw = isRaw;
            this.isAutoCorrect = isAutoCorrect;
            this.isPrediction = isPrediction;
            this.candidateType = candidateType != null ? candidateType : "";
            this.rawCandidateObj = rawCandidateObj;
            this.softKey = softKey;
        }

        @Override
        public String toString() {
            return text + "[slot=" + slotIndex + ",type=" + candidateType + ",raw=" + isRaw + ",auto=" + isAutoCorrect + ",pred=" + isPrediction + "]";
        }
    }

    private static final Map<ViewGroup, ThiccTopBarView> ACTIVE_BARS = new WeakHashMap<>();
    private static final Map<View, Integer> BASE_HEADER_HEIGHTS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final ThiccTopBarSentenceBuffer SENTENCE_BUFFER = new ThiccTopBarSentenceBuffer();
    private static final Map<String, List<String>> WORD_ALTERNATIVES_CACHE = new LinkedHashMap<String, List<String>>() {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, List<String>> eldest) {
            return size() > 600;
        }
    };

    private static List<String> activeOriginalSuggestions = null;
    private static volatile long lastSelfReplaceTimestamp = 0;
    private static volatile String lastSelfReplacedWord = null;
    private static volatile long lastHistoryInteractionTimestamp = 0;
    private static volatile long lastHistoryReplaceTimestamp = 0;
    private static volatile long lastWordNavTimestamp = 0;
    private static volatile long candidatesEventSeq = 0L;
    private static volatile WeakReference<ViewGroup> lastHolderViewRef = null;
    private static volatile String lastEditorIdentity = null;
    private static volatile String lastMultiGlideWord = null;
    private static volatile List<String> lastMultiGlideSuggestions = null;
    private static volatile long lastMultiGlideTimestamp = 0;

    private static WeakReference<View> currentVoiceButtonRef = null;
    private static int currentVoiceButtonOriginalVisibility = View.VISIBLE;
    private static JumpToEndArrowView currentJumpToEndArrow = null;
    private static Runnable pendingJumpRunnable = null;

    private static final long NATIVE_TOP_BAR_BLANK_TIMEOUT_MS = 600L;
    private static volatile Handler mainHandler = null;
    private static volatile boolean nativeTopBarBlankForMultiGlide = false;
    private static Runnable nativeTopBarBlankTimeoutRunnable = null;
    private static ViewTreeObserver.OnPreDrawListener nativeTopBarPreDrawGuard = null;
    private static WeakReference<ViewGroup> nativeTopBarPreDrawTargetRef = null;

    private static ViewGroup getLastHolderView() {
        WeakReference<ViewGroup> ref = lastHolderViewRef;
        return ref != null ? ref.get() : null;
    }

    private static void setLastHolderView(ViewGroup holderView) {
        if (holderView == null) {
            lastHolderViewRef = null;
            return;
        }
        WeakReference<ViewGroup> ref = lastHolderViewRef;
        if (ref == null || ref.get() != holderView) {
            lastHolderViewRef = new WeakReference<>(holderView);
        }
    }

    private static View getCurrentVoiceButton() {
        WeakReference<View> ref = currentVoiceButtonRef;
        return ref != null ? ref.get() : null;
    }

    private static ViewGroup getNativeTopBarPreDrawTarget() {
        WeakReference<ViewGroup> ref = nativeTopBarPreDrawTargetRef;
        return ref != null ? ref.get() : null;
    }
    private static final Map<View, Boolean> SUPPRESSED_HEADER_SIBLINGS = new WeakHashMap<>();
    private static final long POST_TOUCH_SYNC_DELAY_MS = 80L;
    private static volatile boolean thiccTopBarLiveGuessActive = false;
    private static Runnable thiccTopBarLiveGuessTimeoutRunnable = null;
    private static Runnable postTouchSyncRunnable = null;

    /**
     * Hook called at entry of SoftKeyboardView.dispatchTouchEvent(MotionEvent)Z.
     * Schedules a lightweight post-commit sync so punctuation/symbol keys (e.g. '?')
     * that commit without triggering a candidate update/clear still refresh the top bar.
     */
    public static void onKeyboardTouchEvent(Object softKeyboardViewObj, MotionEvent event) {
        try {
            if (event == null || !(softKeyboardViewObj instanceof View view)) {
                return;
            }
            int action = event.getActionMasked();
            if (action != MotionEvent.ACTION_UP
                    && action != MotionEvent.ACTION_POINTER_UP
                    && action != MotionEvent.ACTION_CANCEL) {
                return;
            }
            if (ThiccTopBarGboardReflector.isHeaderSoftKeyboardView(view)) {
                return;
            }
            if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                final long touchEndEventTimeMs = event.getEventTime();
                getMainHandler().post(() -> GboardMultiGlideRuntime.clearOrphanedActiveTouches(touchEndEventTimeMs));
            }
            if (action == MotionEvent.ACTION_CANCEL) {
                return;
            }
            if (!GboardThiccTopBarSettings.readEnabled(view.getContext())) {
                return;
            }
            ViewGroup holderView = getLastHolderView();
            if (holderView == null) {
                return;
            }
            schedulePostTouchSync(holderView);
        } catch (Throwable t) {
            Log.w(TAG, "onKeyboardTouchEvent failed", t);
        }
    }

    /**
     * Hook called when BasicMotionEventHandler dispatches a key or long-press popup KeyData.
     * Ensures popup punctuation (e.g. holding '.' -> '?') refreshes the top bar even if
     * SoftKeyboardView did not receive a normal ACTION_UP or Gboard skipped candidate updates.
     */
    public static void onKeyDataDispatched() {
        try {
            ViewGroup holderView = getLastHolderView();
            if (holderView == null || !GboardThiccTopBarSettings.readEnabled(holderView.getContext())) {
                return;
            }
            schedulePostTouchSync(holderView);
        } catch (Throwable t) {
            Log.w(TAG, "onKeyDataDispatched failed", t);
        }
    }

    private static void schedulePostTouchSync(ViewGroup holderView) {
        Handler handler = getMainHandler();
        if (postTouchSyncRunnable != null) {
            handler.removeCallbacks(postTouchSyncRunnable);
        }
        postTouchSyncRunnable = () -> syncBarAfterTouchIfNeeded(holderView);
        handler.postDelayed(postTouchSyncRunnable, POST_TOUCH_SYNC_DELAY_MS);
    }

    private static String buildEditorIdentity(Context context) {
        android.view.inputmethod.EditorInfo info =
                dev.srwi.gintype.extension.settings.GboardInputTypeGuard.resolveCurrentEditorInfo(context);
        if (info == null) {
            return null;
        }
        String pkg = info.packageName != null ? info.packageName : "";
        return pkg + "|" + info.fieldId + "|" + info.inputType;
    }

    /**
     * Resets sentence history, selection state, and the Jump-to-End arrow whenever the user
     * switches to a different app or text field so state never bleeds across editors.
     */
    private static boolean resetIfEditorChanged(ViewGroup holderView) {
        if (holderView == null) {
            return false;
        }
        String identity = buildEditorIdentity(holderView.getContext());
        if (identity == null) {
            return false;
        }
        String prev = lastEditorIdentity;
        if (prev != null && prev.equals(identity)) {
            return false;
        }
        lastEditorIdentity = identity;
        if (prev == null) {
            return false;
        }
        SENTENCE_BUFFER.clear();
        activeOriginalSuggestions = null;
        thiccTopBarLiveGuessActive = false;
        lastWordNavTimestamp = 0;
        lastHistoryInteractionTimestamp = 0;
        lastHistoryReplaceTimestamp = 0;
        lastSelfReplaceTimestamp = 0;
        lastSelfReplacedWord = null;
        hideJumpToEndArrow();
        ViewGroup parent = parentViewGroup(holderView);
        ViewGroup attachTarget = parent != null ? parent : holderView;
        ThiccTopBarView existingBar = ACTIVE_BARS.get(attachTarget);
        if (existingBar != null) {
            existingBar.clearHistorySelection();
        }
        return true;
    }

    private static void syncBarAfterTouchIfNeeded(ViewGroup holderView) {
        try {
            if (holderView == null) {
                return;
            }
            if (!GboardThiccTopBarSettings.readEnabled(holderView.getContext())) {
                return;
            }
            resetIfEditorChanged(holderView);
            if (dev.srwi.gintype.extension.settings.GboardInputTypeGuard.isThiccTopBarBlockedInput(
                    holderView.getContext())) {
                hideBarForSensitiveInput(holderView);
                return;
            }
            if (thiccTopBarLiveGuessActive
                    || GboardMultiGlideRuntime.hasActiveTouch()
                    || GboardMultiGlideRuntime.isMultiGlideWordActive()) {
                return;
            }
            ThiccTopBarView barView = getOrCreateBarView(holderView);
            if (barView == null) {
                return;
            }
            if (ThiccTopBarGboardReflector.isDictationActive(holderView)
                    || isHistorySelectionSessionActive(holderView, barView)) {
                return;
            }
            ViewGroup parent = parentViewGroup(holderView);
            ViewGroup attachTarget = parent != null ? parent : holderView;

            if (ThiccTopBarTextHelper.isSentenceEnded(holderView) || ThiccTopBarTextHelper.isInputEmpty(holderView)) {
                if (!SENTENCE_BUFFER.isEmpty() || barView.getVisibility() == View.VISIBLE) {
                    SENTENCE_BUFFER.clear();
                    activeOriginalSuggestions = null;
                    hideJumpToEndArrow();
                    barView.setVisibility(View.GONE);
                    ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, false);
                }
                return;
            }

            String activeWord = ThiccTopBarTextHelper.getActiveWord(holderView, Collections.emptyList(), false);
            if (activeWord != null && !activeWord.isEmpty()) {
                return;
            }

            boolean hadActiveWheel = barView.getActiveWheelWord() != null;
            ThiccTopBarTextHelper.syncSentenceBufferFromText(holderView, null, SENTENCE_BUFFER, WORD_ALTERNATIVES_CACHE);
            if (!SENTENCE_BUFFER.isEmpty()) {
                if (hadActiveWheel || !barMatchesSentenceBuffer(barView, SENTENCE_BUFFER)) {
                    if (Log.isLoggable(TAG, Log.DEBUG)) {
                        ThiccTopBarSentenceBuffer.WordEntry last = SENTENCE_BUFFER.getLastEntry();
                        Log.i(TAG, "syncBarAfterTouchIfNeeded: updating history bar, last="
                                + (last != null ? last.getSelectedWord() : "null")
                                + ", hadActiveWheel=" + hadActiveWheel);
                    }
                    activeOriginalSuggestions = null;
                    showHistoryOnlyBar(holderView, barView);
                }
            } else if (barView.getVisibility() == View.VISIBLE) {
                hideJumpToEndArrow();
                barView.setVisibility(View.GONE);
                ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, false);
            }
        } catch (Throwable t) {
            Log.w(TAG, "syncBarAfterTouchIfNeeded failed", t);
        }
    }

    private static boolean barMatchesSentenceBuffer(ThiccTopBarView barView, ThiccTopBarSentenceBuffer buffer) {
        List<String> displayed = barView.getDisplayedColumnWords();
        List<ThiccTopBarSentenceBuffer.WordEntry> entries = buffer.getEntries();
        if (displayed.size() != entries.size()) {
            return false;
        }
        for (int i = 0; i < entries.size(); i++) {
            String expected = entries.get(i).getSelectedWord();
            String actual = displayed.get(i);
            if (expected == null ? actual != null : !expected.equals(actual)) {
                return false;
            }
        }
        return true;
    }

    /**
     * Hook called after SoftKeyboardView finishes inflating to apply the configured
     * top bar scale before the first layout pass.
     */
    public static void onSoftKeyboardViewInflated(Object softKeyboardViewObj) {
        try {
            if (!(softKeyboardViewObj instanceof View view)) {
                return;
            }
            if (!ThiccTopBarGboardReflector.isHeaderSoftKeyboardView(view)) {
                return;
            }
            ViewGroup.LayoutParams lp = view.getLayoutParams();
            if (lp == null || lp.height <= 0) {
                return;
            }
            BASE_HEADER_HEIGHTS.put(view, lp.height);
            applyHeaderViewHeight(view, readActiveTopbarScale(view.getContext()));
        } catch (Throwable t) {
            Log.e(TAG, "onSoftKeyboardViewInflated failed", t);
        }
    }

    /**
     * Hook called at the computed-height return of SoftKeyboardView target height
     * calculation so Gboard's header and IME body size calculations match the scale.
     */
    public static int scaleHeaderTargetHeight(Object softKeyboardViewObj, int targetHeight) {
        try {
            if (targetHeight <= 0 || !(softKeyboardViewObj instanceof View view)) {
                return targetHeight;
            }
            if (!ThiccTopBarGboardReflector.isHeaderSoftKeyboardView(view)) {
                return targetHeight;
            }
            BASE_HEADER_HEIGHTS.put(view, targetHeight);
            float scale = readActiveTopbarScale(view.getContext());
            if (scale <= 1.001f) {
                return targetHeight;
            }
            return Math.max(targetHeight, Math.round(targetHeight * scale));
        } catch (Throwable t) {
            Log.e(TAG, "scaleHeaderTargetHeight failed", t);
            return targetHeight;
        }
    }

    private static float readActiveTopbarScale(Context context) {
        if (context == null || !GboardThiccTopBarSettings.readEnabled(context)) {
            return GboardThiccTopBarSettings.MIN_TOPBAR_SCALE;
        }
        return GboardThiccTopBarSettings.readTopbarScale(context);
    }

    private static ViewGroup parentViewGroup(View view) {
        if (view == null) {
            return null;
        }
        return (view.getParent() instanceof ViewGroup parent) ? parent : null;
    }

    private static void syncHeaderHeight(ViewGroup holderView, float scale) {
        if (holderView == null) {
            return;
        }
        View headerView = ThiccTopBarGboardReflector.findSoftKeyboardView(holderView);
        applyHeaderViewHeight(headerView, scale);
    }

    private static void applyHeaderViewHeight(View headerView, float scale) {
        if (headerView == null) {
            return;
        }
        ViewGroup.LayoutParams lp = headerView.getLayoutParams();
        if (lp == null || lp.height <= 0) {
            return;
        }
        Integer recordedBase = BASE_HEADER_HEIGHTS.get(headerView);
        int baseHeight;
        if (recordedBase != null && recordedBase > 0) {
            baseHeight = recordedBase;
        } else {
            baseHeight = lp.height;
            BASE_HEADER_HEIGHTS.put(headerView, baseHeight);
        }
        float sanitized = GboardThiccTopBarSettings.sanitizeTopbarScale(scale);
        int desiredHeight = sanitized > 1.001f
                ? Math.max(baseHeight, Math.round(baseHeight * sanitized))
                : baseHeight;
        if (lp.height != desiredHeight) {
            lp.height = desiredHeight;
            headerView.setLayoutParams(lp);
            headerView.requestLayout();
            if (headerView.getParent() instanceof View parentView) {
                parentView.requestLayout();
            }
        }
    }

    /** Immediately synchronizes tracked header views and suggestion bars after a settings change. */
    public static void syncAllHeaderHeights(Context context) {
        if (context == null) {
            return;
        }
        boolean enabled = GboardThiccTopBarSettings.readEnabled(context);
        float activeScale = readActiveTopbarScale(context);
        float swipeSensitivity = GboardThiccTopBarSettings.readSwipeSensitivity(context);
        boolean multiWordSelect = GboardThiccTopBarSettings.readDoubleTapMultiWordSelect(context);
        boolean invertSwipe = GboardThiccTopBarSettings.readInvertSwipe(context);
        List<View> trackedHeaders;
        synchronized (BASE_HEADER_HEIGHTS) {
            trackedHeaders = new ArrayList<>(BASE_HEADER_HEIGHTS.keySet());
        }
        for (View headerView : trackedHeaders) {
            if (headerView != null) {
                headerView.post(() -> applyHeaderViewHeight(headerView, activeScale));
            }
        }
        for (ThiccTopBarView bar : ACTIVE_BARS.values()) {
            if (bar != null) {
                bar.post(() -> {
                    bar.setScaleFactor(activeScale);
                    bar.setSwipeSensitivity(swipeSensitivity);
                    bar.setMultiWordSelectEnabled(multiWordSelect);
                    bar.setInvertVerticalSwipe(invertSwipe);
                });
            }
        }
        if (!enabled) {
            getMainHandler().post(() -> {
                hideJumpToEndArrow();
                ViewGroup holder = getLastHolderView();
                if (holder != null) {
                    handleDisabledState(holder);
                }
            });
        }
    }

    private static Handler getMainHandler() {
        Handler h = mainHandler;
        if (h == null) {
            h = new Handler(Looper.getMainLooper());
            mainHandler = h;
        }
        return h;
    }

    /**
     * Suppresses Gboard's stale 1-finger live guess and Quick-Access toolbar siblings during a
     * MultiGlide takeover when Thicc Top Bar is disabled, keeping the native top bar blank until
     * Gboard populates the decoded word alternatives (or a short safety timeout expires).
     */
    /**
     * Registers a candidates holder view discovered without Thicc Top Bar bytecode hooks
     * (e.g. when only MultiGlide is patched) so native top-bar live guesses and blanking work.
     */
    public static void registerFallbackHolderView(ViewGroup holderView) {
        if (holderView == null) {
            return;
        }
        if (getLastHolderView() == null
                || !GboardPatchesFeatureAvailability.hasFeature(
                        holderView.getContext(),
                        GboardPatchesFeatureAvailability.FEATURE_THICC_TOP_BAR)) {
            setLastHolderView(holderView);
        }
    }

    public static void setNativeTopBarBlankForMultiGlide(boolean blank) {
        Handler handler = getMainHandler();
        if (Looper.myLooper() != Looper.getMainLooper()) {
            handler.post(() -> setNativeTopBarBlankForMultiGlide(blank));
            return;
        }
        if (nativeTopBarBlankTimeoutRunnable != null) {
            handler.removeCallbacks(nativeTopBarBlankTimeoutRunnable);
            nativeTopBarBlankTimeoutRunnable = null;
        }

        ViewGroup holderView = getLastHolderView();
        if (blank) {
            if (holderView == null) {
                return;
            }
            if (GboardThiccTopBarSettings.readEnabled(holderView.getContext())) {
                thiccTopBarLiveGuessActive = true;
                cancelLiveGuessFallback();
                return;
            }
            nativeTopBarBlankForMultiGlide = true;
            ViewGroup parent = (holderView.getParent() instanceof ViewGroup p) ? p : null;
            ViewGroup attachTarget = parent != null ? parent : holderView;
            suppressNativeHeaderForBlank(attachTarget, holderView);
            attachNativeTopBarPreDrawGuard(attachTarget, holderView);
            nativeTopBarBlankTimeoutRunnable = () -> {
                if (nativeTopBarBlankForMultiGlide && GboardMultiGlideRuntime.hasActiveTouch()) {
                    handler.postDelayed(nativeTopBarBlankTimeoutRunnable, NATIVE_TOP_BAR_BLANK_TIMEOUT_MS);
                    return;
                }
                setNativeTopBarBlankForMultiGlide(false);
            };
            handler.postDelayed(nativeTopBarBlankTimeoutRunnable, NATIVE_TOP_BAR_BLANK_TIMEOUT_MS);
            return;
        }

        clearThiccTopBarLiveGuess();
        boolean wasBlank = nativeTopBarBlankForMultiGlide;
        nativeTopBarBlankForMultiGlide = false;
        detachNativeTopBarPreDrawGuard();
        hideNativeTopBarLiveGuess(holderView);
        restoreSuppressedHeaderSiblings();
        if (wasBlank && holderView != null && !GboardThiccTopBarSettings.readEnabled(holderView.getContext())) {
            holderView.setAlpha(1.0f);
            if (!ThiccTopBarGboardReflector.isUndoViewActive(
                    (holderView.getParent() instanceof ViewGroup p) ? p : holderView)) {
                holderView.setVisibility(View.VISIBLE);
            }
        }
    }

    private static void suppressNativeHeaderForBlank(ViewGroup attachTarget, ViewGroup holderView) {
        if (holderView != null) {
            ThiccTopBarGboardReflector.hideStaleCandidateSlots(holderView);
            holderView.setAlpha(0.0f);
            holderView.setVisibility(View.INVISIBLE);
        }
        if (attachTarget == null) {
            return;
        }
        ViewGroup headerParent = (attachTarget.getParent() instanceof ViewGroup gp) ? gp : null;
        if (headerParent != null) {
            for (int i = 0; i < headerParent.getChildCount(); i++) {
                View sibling = headerParent.getChildAt(i);
                if (sibling != attachTarget
                        && !(sibling instanceof ThiccTopBarView)
                        && sibling.getVisibility() == View.VISIBLE) {
                    sibling.setVisibility(View.INVISIBLE);
                    SUPPRESSED_HEADER_SIBLINGS.put(sibling, Boolean.TRUE);
                }
            }
        }
        // Also hide any non-holder, non-live-guess sibling inside attachTarget itself
        for (int i = 0; i < attachTarget.getChildCount(); i++) {
            View child = attachTarget.getChildAt(i);
            if (child != holderView
                    && !LIVE_GUESS_VIEW_TAG.equals(child.getTag())
                    && !(child instanceof ThiccTopBarView)
                    && child.getVisibility() == View.VISIBLE) {
                child.setVisibility(View.INVISIBLE);
                SUPPRESSED_HEADER_SIBLINGS.put(child, Boolean.TRUE);
            }
        }
    }

    private static void restoreSuppressedHeaderSiblings() {
        if (SUPPRESSED_HEADER_SIBLINGS.isEmpty()) {
            return;
        }
        for (View v : new ArrayList<>(SUPPRESSED_HEADER_SIBLINGS.keySet())) {
            if (v != null && v.getVisibility() == View.INVISIBLE) {
                v.setVisibility(View.VISIBLE);
            }
        }
        SUPPRESSED_HEADER_SIBLINGS.clear();
    }

    /**
     * Displays a centered intermediate MultiGlide guess in either Thicc Top Bar's right-hand
     * active wheel (when enabled) or the native top bar overlay (when Thicc Top Bar is disabled).
     */
    public static void updateLiveGuess(String word) {
        updateLiveGuess(word, false);
    }

    /**
     * Displays a centered intermediate MultiGlide guess in either Thicc Top Bar's right-hand
     * active wheel (when enabled) or the native top bar overlay (when Thicc Top Bar is disabled).
     *
     * @param excludePendingEditorWord true only when an uncommitted tap prefix in the editor
     *                                 (e.g. Tap+Swipe) will be replaced in-place by this guess.
     */
    public static void updateLiveGuess(String word, boolean excludePendingEditorWord) {
        Handler handler = getMainHandler();
        if (Looper.myLooper() != Looper.getMainLooper()) {
            handler.post(() -> updateLiveGuess(word, excludePendingEditorWord));
            return;
        }
        ViewGroup holderView = getLastHolderView();
        if (holderView == null || word == null || word.isEmpty()) {
            return;
        }
        if (!GboardMultiGlideRuntime.hasActiveTouch()) {
            return;
        }
        if (GboardThiccTopBarSettings.readEnabled(holderView.getContext())) {
            updateThiccTopBarLiveGuess(holderView, word, excludePendingEditorWord);
        } else {
            updateNativeTopBarLiveGuess(word);
        }
    }

    private static void updateMatrixWithSplit(
            ThiccTopBarView barView,
            int historyBeforeCount,
            List<String> currentAlternatives,
            int preferredSelected,
            ThiccTopBarView.OnCommitCallback onCommit,
            ThiccTopBarView.OnActiveWordSwapCallback onActiveSwap,
            ThiccTopBarView.OnHistoryWordReplaceCallback onHistoryReplace,
            ThiccTopBarView.OnHistoryWordClickCallback onHistoryClick
    ) {
        List<ThiccTopBarSentenceBuffer.WordEntry> allEntries = SENTENCE_BUFFER.getEntries();
        int split = Math.max(0, Math.min(allEntries.size(), historyBeforeCount));
        List<ThiccTopBarSentenceBuffer.WordEntry> before = allEntries.subList(0, split);
        List<ThiccTopBarSentenceBuffer.WordEntry> after = (split < allEntries.size())
                ? allEntries.subList(split, allEntries.size())
                : Collections.emptyList();
        barView.updateMatrix(before, currentAlternatives, preferredSelected, after,
                onCommit, onActiveSwap, onHistoryReplace, onHistoryClick);
    }

    private static void updateThiccTopBarLiveGuess(
            ViewGroup holderView, String word, boolean excludePendingEditorWord) {
        try {
            if (ThiccTopBarGboardReflector.isDictationActive(holderView)) {
                return;
            }
            ThiccTopBarView barView = getOrCreateBarView(holderView);
            if (barView == null) {
                return;
            }
            thiccTopBarLiveGuessActive = true;
            candidatesEventSeq++;
            lastWordNavTimestamp = 0;
            lastHistoryInteractionTimestamp = 0;
            cancelLiveGuessFallback();
            int historyBeforeCount = 0;
            if (ThiccTopBarTextHelper.isSentenceEnded(holderView)
                    || ThiccTopBarTextHelper.isInputEmpty(holderView)) {
                SENTENCE_BUFFER.clear();
            } else {
                // Only exclude an uncommitted tap prefix (e.g. MultiGlide Tap+Swipe) that will be
                // replaced in-place; a previously committed/swiped word without a trailing space
                // must remain in history during a stock or non-combining swipe.
                String pendingEditorWord = excludePendingEditorWord
                        ? ThiccTopBarTextHelper.getActiveWord(holderView, Collections.emptyList(), false)
                        : null;
                historyBeforeCount = ThiccTopBarTextHelper.syncSentenceBufferWithSplit(
                        holderView, pendingEditorWord, true, SENTENCE_BUFFER, WORD_ALTERNATIVES_CACHE);
            }
            ViewGroup parent = (holderView.getParent() instanceof ViewGroup p) ? p : null;
            ViewGroup attachTarget = parent != null ? parent : holderView;
            updateMatrixWithSplit(
                    barView,
                    historyBeforeCount,
                    Collections.singletonList(word),
                    0,
                    null,
                    null,
                    null,
                    null
            );
            barView.setVisibility(View.VISIBLE);
            ThiccTopBarGboardReflector.applyKeyboardBackground(barView, holderView);
            ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, true);
            barView.bringToFront();
        } catch (Throwable ignored) {
        }
    }

    private static void cancelLiveGuessFallback() {
        if (thiccTopBarLiveGuessTimeoutRunnable != null) {
            getMainHandler().removeCallbacks(thiccTopBarLiveGuessTimeoutRunnable);
            thiccTopBarLiveGuessTimeoutRunnable = null;
        }
    }

    private static void clearThiccTopBarLiveGuess() {
        thiccTopBarLiveGuessActive = false;
        cancelLiveGuessFallback();
    }

    /**
     * Called deterministically when the active touch gesture ends (ACTION_UP or ACTION_CANCEL).
     * While fingers remain down, {@code thiccTopBarLiveGuessActive} never times out regardless of
     * swipe duration; only after ACTION_UP does a short handoff fallback guard against cancelled
     * stock swipes that emit 0 final candidates.
     */
    public static void onGestureEndedForLiveGuess(boolean cancelled) {
        if (!thiccTopBarLiveGuessActive) {
            return;
        }
        if (cancelled) {
            clearThiccTopBarLiveGuess();
            return;
        }
        cancelLiveGuessFallback();
        thiccTopBarLiveGuessTimeoutRunnable = () -> {
            if (!GboardMultiGlideRuntime.hasActiveTouch()) {
                thiccTopBarLiveGuessActive = false;
            }
        };
        getMainHandler().postDelayed(thiccTopBarLiveGuessTimeoutRunnable, 300L);
    }

    /**
     * Displays (or clears) a centered intermediate MultiGlide guess in the native top bar while
     * {@code nativeTopBarBlankForMultiGlide} is active and Thicc Top Bar is disabled.
     */
    public static void updateNativeTopBarLiveGuess(String word) {
        Handler handler = getMainHandler();
        if (Looper.myLooper() != Looper.getMainLooper()) {
            handler.post(() -> updateNativeTopBarLiveGuess(word));
            return;
        }
        ViewGroup holderView = getLastHolderView();
        if (!nativeTopBarBlankForMultiGlide
                || holderView == null
                || GboardThiccTopBarSettings.readEnabled(holderView.getContext())) {
            hideNativeTopBarLiveGuess(holderView);
            return;
        }
        if (word == null || word.isEmpty()) {
            return;
        }
        ViewGroup parent = (holderView.getParent() instanceof ViewGroup p) ? p : null;
        ViewGroup attachTarget = parent != null ? parent : holderView;
        TextView guessView = getOrCreateNativeLiveGuessView(attachTarget, holderView);
        if (guessView != null) {
            guessView.setText(word);
            guessView.setVisibility(View.VISIBLE);
            guessView.bringToFront();
        }
    }

    private static TextView getOrCreateNativeLiveGuessView(ViewGroup attachTarget, ViewGroup holderView) {
        if (attachTarget == null) {
            return null;
        }
        View existing = attachTarget.findViewWithTag(LIVE_GUESS_VIEW_TAG);
        if (existing instanceof TextView tv) {
            styleNativeLiveGuessView(tv, holderView);
            return tv;
        }
        try {
            Context ctx = attachTarget.getContext();
            TextView tv = new TextView(ctx);
            tv.setTag(LIVE_GUESS_VIEW_TAG);
            tv.setGravity(Gravity.CENTER);
            tv.setSingleLine(true);
            tv.setEllipsize(TextUtils.TruncateAt.END);
            tv.setClickable(false);
            tv.setFocusable(false);
            tv.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            styleNativeLiveGuessView(tv, holderView);
            ViewGroup.LayoutParams lp = new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT);
            attachTarget.addView(tv, lp);
            return tv;
        } catch (Throwable t) {
            Log.w(TAG, "getOrCreateNativeLiveGuessView failed: " + t.getMessage());
            return null;
        }
    }

    private static void styleNativeLiveGuessView(TextView tv, ViewGroup holderView) {
        ThiccTopBarGboardReflector.applyKeyboardBackground(tv, holderView);
        TextView sample = findFirstTextView(holderView);
        if (sample != null) {
            tv.setTextColor(sample.getCurrentTextColor());
            tv.setTextSize(TypedValue.COMPLEX_UNIT_PX, sample.getTextSize());
            tv.setTypeface(sample.getTypeface());
        } else {
            boolean dark = (tv.getContext().getResources().getConfiguration().uiMode
                    & android.content.res.Configuration.UI_MODE_NIGHT_MASK)
                    == android.content.res.Configuration.UI_MODE_NIGHT_YES;
            tv.setTextColor(dark ? 0xFFE8EAED : 0xFF202124);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
        }
    }

    private static TextView findFirstTextView(View root) {
        if (root instanceof TextView tv && tv.getTextSize() > 0f) {
            return tv;
        }
        if (root instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                TextView found = findFirstTextView(vg.getChildAt(i));
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }

    private static void hideNativeTopBarLiveGuess(ViewGroup holderView) {
        if (holderView == null) {
            return;
        }
        ViewGroup parent = (holderView.getParent() instanceof ViewGroup p) ? p : null;
        ViewGroup attachTarget = parent != null ? parent : holderView;
        View existing = attachTarget.findViewWithTag(LIVE_GUESS_VIEW_TAG);
        if (existing != null && existing.getVisibility() != View.GONE) {
            existing.setVisibility(View.GONE);
        }
    }

    private static void attachNativeTopBarPreDrawGuard(ViewGroup attachTarget, ViewGroup holderView) {
        ViewGroup guardRoot = (attachTarget.getParent() instanceof ViewGroup gp) ? gp : attachTarget;
        if (nativeTopBarPreDrawGuard != null && getNativeTopBarPreDrawTarget() == guardRoot) {
            return;
        }
        detachNativeTopBarPreDrawGuard();
        ViewTreeObserver vto = guardRoot.getViewTreeObserver();
        if (vto == null || !vto.isAlive()) {
            return;
        }
        nativeTopBarPreDrawTargetRef = new WeakReference<>(guardRoot);
        final WeakReference<ViewGroup> fallbackHolderRef = new WeakReference<>(holderView);
        nativeTopBarPreDrawGuard = () -> {
            if (!nativeTopBarBlankForMultiGlide) {
                detachNativeTopBarPreDrawGuard();
                return true;
            }
            ViewGroup latest = getLastHolderView();
            ViewGroup currentHolder = latest != null ? latest : fallbackHolderRef.get();
            if (currentHolder != null && !GboardThiccTopBarSettings.readEnabled(currentHolder.getContext())) {
                ViewGroup p = (currentHolder.getParent() instanceof ViewGroup pg) ? pg : null;
                ViewGroup target = p != null ? p : currentHolder;
                suppressNativeHeaderForBlank(target, currentHolder);
            }
            return true;
        };
        vto.addOnPreDrawListener(nativeTopBarPreDrawGuard);
    }

    private static void detachNativeTopBarPreDrawGuard() {
        ViewGroup target = getNativeTopBarPreDrawTarget();
        if (target != null && nativeTopBarPreDrawGuard != null) {
            try {
                ViewTreeObserver vto = target.getViewTreeObserver();
                if (vto != null && vto.isAlive()) {
                    vto.removeOnPreDrawListener(nativeTopBarPreDrawGuard);
                }
            } catch (Throwable ignored) {
            }
        }
        nativeTopBarPreDrawGuard = null;
        nativeTopBarPreDrawTargetRef = null;
    }

    private static void hideBarForSensitiveInput(ViewGroup holderView) {
        SENTENCE_BUFFER.clear();
        activeOriginalSuggestions = null;
        thiccTopBarLiveGuessActive = false;
        hideJumpToEndArrow();
        if (holderView == null) {
            return;
        }
        ViewGroup parent = parentViewGroup(holderView);
        ViewGroup attachTarget = parent != null ? parent : holderView;
        ThiccTopBarView existing = ACTIVE_BARS.get(attachTarget);
        if (existing != null && existing.getVisibility() != View.GONE) {
            existing.setVisibility(View.GONE);
            ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, false);
        }
    }

    private static void handleDisabledState(ViewGroup holderView) {
        syncHeaderHeight(holderView, GboardThiccTopBarSettings.MIN_TOPBAR_SCALE);
        ViewGroup parent = (holderView.getParent() instanceof ViewGroup p) ? p : null;
        ViewGroup attachTarget = parent != null ? parent : holderView;
        ThiccTopBarView existing = ACTIVE_BARS.get(attachTarget);
        if (existing != null && existing.getVisibility() != View.GONE) {
            existing.setVisibility(View.GONE);
            if (!nativeTopBarBlankForMultiGlide) {
                ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, false);
            }
        }
        if (nativeTopBarBlankForMultiGlide) {
            suppressNativeHeaderForBlank(attachTarget, holderView);
        } else if (ThiccTopBarGboardReflector.getHolderCandidateCount(holderView) <= 0) {
            restoreSuppressedHeaderSiblings();
        }
    }

    private static void hideBarForDictation(
            ViewGroup attachTarget, ViewGroup holderView, ThiccTopBarView barView) {
        activeOriginalSuggestions = null;
        hideJumpToEndArrow();
        if (barView != null && barView.getVisibility() != View.GONE) {
            barView.setVisibility(View.GONE);
        }
        ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, false);
    }

    private GboardThiccTopBarRuntime() {
    }

    /**
     * Injected by bytecode patch at the entry of LatinFixedCountCandidatesHolderView.D
     *
     * @param holderViewObj    The LatinFixedCountCandidatesHolderView instance.
     * @param candidateListObj The candidate list (List<Lowu>).
     */
    public static void onCandidatesUpdated(Object holderViewObj, Object candidateListObj) {
        if (!(holderViewObj instanceof ViewGroup holderView)) {
            return;
        }
        setLastHolderView(holderView);
        resetIfEditorChanged(holderView);
        if (dev.srwi.gintype.extension.settings.GboardInputTypeGuard.isThiccTopBarBlockedInput(
                holderView.getContext())) {
            hideBarForSensitiveInput(holderView);
            return;
        }

        // Cache non-prediction alternatives synchronously before fast space/punctuation commits clear them
        if (candidateListObj != null && !GboardMultiGlideRuntime.isMultiGlideWordActive()) {
            try {
                ViewGroup preParent = (holderView.getParent() instanceof ViewGroup p) ? p : holderView;
                ThiccTopBarView existingBar = ACTIVE_BARS.get(preParent);
                if (!isHistorySelectionSessionActive(holderView, existingBar)) {
                    List<CandidateItem> preItems = ThiccTopBarGboardReflector.extractCandidatesFromIterable(candidateListObj);
                    if (preItems.size() >= 2
                            && !ThiccTopBarTextHelper.allPredictions(preItems)
                            && !ThiccTopBarGboardReflector.hasUndoCandidate(preItems)) {
                        String preActiveWord = ThiccTopBarTextHelper.getActiveWord(holderView, preItems);
                        if (preActiveWord != null && !preActiveWord.isEmpty() && !isRecentMultiGlideWord(preActiveWord)) {
                            List<String> preWords = buildTrimmedSuggestions(preItems, preActiveWord, new int[1]);
                            cacheAlternativeGroup(preWords, preActiveWord);
                        }
                    }
                }
            } catch (Throwable ignored) {
            }
        }

        final long eventSeq = ++candidatesEventSeq;
        // Run after LatinFixedCountCandidatesHolderView populates slot views
        holderView.post(() -> {
            try {
                if (eventSeq != candidatesEventSeq) {
                    return;
                }
                if (!GboardThiccTopBarSettings.readEnabled(holderView.getContext())) {
                    if (nativeTopBarBlankForMultiGlide && candidateListObj != null
                            && !GboardMultiGlideRuntime.isLivePreviewTouchActive()) {
                        int count = ThiccTopBarGboardReflector.getHolderCandidateCount(holderView);
                        boolean hasCandidates = count > 0
                                || (count < 0 && !ThiccTopBarGboardReflector
                                .extractCandidatesFromIterable(candidateListObj).isEmpty());
                        if (hasCandidates) {
                            setNativeTopBarBlankForMultiGlide(false);
                        }
                    }
                    handleDisabledState(holderView);
                    return;
                }

                if (GboardMultiGlideRuntime.isLivePreviewTouchActive()) {
                    return;
                }

                ThiccTopBarView barView = getOrCreateBarView(holderView);
                if (barView == null) {
                    return;
                }
                ViewGroup parent = parentViewGroup(holderView);
                ViewGroup attachTarget = parent != null ? parent : holderView;

                // Extract slot candidates directly from holderView slots
                List<CandidateItem> items = ThiccTopBarGboardReflector.extractSlotCandidatesFromHolder(holderView, candidateListObj);

                if (ThiccTopBarGboardReflector.isDictationActive(holderView)) {
                    hideBarForDictation(attachTarget, holderView, barView);
                    return;
                }

                // Ignore Gboard's native Undo/restore candidate when Thicc Top Bar is active:
                // sync the bar with the remaining text instead of dismissing Thicc Top Bar.
                if (ThiccTopBarGboardReflector.isUndoActive(holderView, items)) {
                    activeOriginalSuggestions = null;
                    if (ThiccTopBarTextHelper.isSentenceEnded(holderView) || ThiccTopBarTextHelper.isInputEmpty(holderView)) {
                        SENTENCE_BUFFER.clear();
                        hideJumpToEndArrow();
                        barView.setVisibility(View.GONE);
                        ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, false);
                    } else {
                        if (thiccTopBarLiveGuessActive
                        || GboardMultiGlideRuntime.hasActiveTouch()
                        || GboardMultiGlideRuntime.isMultiGlideWordActive()) {
                    return;
                }

                ThiccTopBarTextHelper.syncSentenceBufferFromText(holderView, null, SENTENCE_BUFFER, WORD_ALTERNATIVES_CACHE);
                        if (!SENTENCE_BUFFER.isEmpty()) {
                            showHistoryOnlyBar(holderView, barView);
                        } else {
                            hideJumpToEndArrow();
                            barView.setVisibility(View.GONE);
                            ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, false);
                        }
                    }
                    return;
                }

                boolean hasComposingCandidates = items != null && !items.isEmpty()
                        && !ThiccTopBarTextHelper.allPredictions(items);
                if (hasComposingCandidates
                        && !ThiccTopBarTextHelper.hasSelection(holderView)
                        && (SystemClock.uptimeMillis() - lastHistoryReplaceTimestamp) >= 600) {
                    lastWordNavTimestamp = 0;
                    lastHistoryInteractionTimestamp = 0;
                }

                boolean isSingleLiveSwipeCandidate = items != null && items.size() == 1
                        && items.get(0) != null && !items.get(0).isRaw && !items.get(0).isPrediction
                        && items.get(0).text != null && !items.get(0).text.trim().isEmpty();
                if (!isSingleLiveSwipeCandidate && isHistorySelectionSessionActive(holderView, barView)) {
                    barView.setVisibility(View.VISIBLE);
                    ThiccTopBarGboardReflector.applyKeyboardBackground(barView, holderView);
                    ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, true);
                    barView.bringToFront();
                    return;
                }

                if (barView.getSelectedHistoryIndex() >= 0 && ThiccTopBarTextHelper.isCursorAtEnd(holderView)) {
                    barView.clearHistorySelection();
                    hideJumpToEndArrow();
                } else if (barView.getSelectedHistoryIndex() < 0 && ThiccTopBarTextHelper.isCursorAtEnd(holderView)) {
                    hideJumpToEndArrow();
                }

                String currentWord = ThiccTopBarTextHelper.getActiveWord(holderView, items);
                if (currentWord == null) {
                    String editorActiveWord = ThiccTopBarTextHelper.getActiveWord(holderView, Collections.emptyList(), false);
                    if (editorActiveWord != null && isRecentMultiGlideWord(editorActiveWord)) {
                        currentWord = editorActiveWord;
                    }
                }
                if (Log.isLoggable(TAG, Log.DEBUG)) {
                    Log.i(TAG, "onCandidatesUpdated: resolved " + items.size() + " candidates, currentWord='" + currentWord + "': " + items);
                }

                // Case 1: No active word being typed/swiped (cursor after manual space, punctuation, or empty)
                if (currentWord == null || currentWord.isEmpty()) {
                    activeOriginalSuggestions = null;
                    if (items != null && items.size() == 1) {
                        CandidateItem only = items.get(0);
                        if (only != null && !only.isRaw && !only.isPrediction
                                && only.text != null && !only.text.trim().isEmpty()) {
                            updateThiccTopBarLiveGuess(holderView, only.text.trim(), false);
                            return;
                        }
                    }
                    if ((thiccTopBarLiveGuessActive
                            || GboardMultiGlideRuntime.hasActiveTouch()
                            || GboardMultiGlideRuntime.isMultiGlideWordActive())
                            && !ThiccTopBarTextHelper.isSentenceEnded(holderView)
                            && !ThiccTopBarTextHelper.isInputEmpty(holderView)) {
                        return;
                    }
                    clearThiccTopBarLiveGuess();
                    if (ThiccTopBarTextHelper.isSentenceEnded(holderView) || ThiccTopBarTextHelper.isInputEmpty(holderView)) {
                        SENTENCE_BUFFER.clear();
                        hideJumpToEndArrow();
                        barView.setVisibility(View.GONE);
                        ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, false);
                    } else {
                        ThiccTopBarTextHelper.syncSentenceBufferFromText(holderView, null, SENTENCE_BUFFER, WORD_ALTERNATIVES_CACHE);
                        if (!SENTENCE_BUFFER.isEmpty()) {
                            showHistoryOnlyBar(holderView, barView);
                        } else {
                            hideJumpToEndArrow();
                            barView.setVisibility(View.GONE);
                            ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, false);
                        }
                    }
                    return;
                }

                clearThiccTopBarLiveGuess();
                int[] centerIdxOut = new int[1];
                List<String> words = buildTrimmedSuggestions(items, currentWord, centerIdxOut);
                int centerIndex = centerIdxOut[0];

                // Preserve original 3 suggestions during flick navigation so user can flick back and forth!
                boolean isFromSelfReplace = lastSelfReplacedWord != null
                        && lastSelfReplacedWord.equalsIgnoreCase(currentWord)
                        && (SystemClock.uptimeMillis() - lastSelfReplaceTimestamp < 1500);

                if (isRecentMultiGlideWord(currentWord) && lastMultiGlideSuggestions != null && !lastMultiGlideSuggestions.isEmpty()) {
                    words = new ArrayList<>(lastMultiGlideSuggestions);
                    int idx = findCaseInsensitiveIndex(words, currentWord);
                    centerIndex = (idx >= 0) ? idx : 0;
                    words.set(centerIndex, currentWord);
                    activeOriginalSuggestions = new ArrayList<>(words);
                    cacheAlternativeGroup(words, currentWord);
                } else if (shouldPreserveActiveSuggestions(activeOriginalSuggestions, currentWord, isFromSelfReplace, items)) {
                    words = new ArrayList<>(activeOriginalSuggestions);
                    int idx = findCaseInsensitiveIndex(words, currentWord);
                    centerIndex = (idx >= 0) ? idx : 0;
                    words.set(centerIndex, currentWord);
                    if (Log.isLoggable(TAG, Log.DEBUG)) {
                        Log.i(TAG, "onCandidatesUpdated: preserving original 3 suggestions: " + words + ", centerIndex=" + centerIndex);
                    }
                } else {
                    activeOriginalSuggestions = new ArrayList<>(words);
                    cacheAlternativeGroup(words, currentWord);
                }

                // Update sentence buffer with completed words, keeping words after the cursor in-place
                int historyBeforeCount = ThiccTopBarTextHelper.syncSentenceBufferWithSplit(
                        holderView, currentWord, false, SENTENCE_BUFFER, WORD_ALTERNATIVES_CACHE);

                final List<CandidateItem> finalItems = new ArrayList<>(items);
                final List<String> currentWordsList = new ArrayList<>(words);

                updateMatrixWithSplit(
                        barView,
                        historyBeforeCount,
                        words,
                        centerIndex,
                        // onCommit: Tapping active word center pill selects the word if already in editor, or commits
                        (selectedIndex, word) -> {
                            GboardMultiGlideRuntime.onTopBarUserInteraction();
                            if (selectActiveWordIfAlreadyInEditor(holderView, barView, word)) {
                                return;
                            }
                            if (ThiccTopBarTextHelper.isCursorAtEnd(holderView)) {
                                hideJumpToEndArrow();
                            }
                            CandidateItem chosen = findCandidateByWord(finalItems, word);
                            commitCandidate(holderView, chosen, finalItems);
                        },
                        // onActiveSwap: Flick UP/DOWN or tap Top/Bottom swaps active word WITHOUT space
                        (selectedIndex, newWord) -> {
                            GboardMultiGlideRuntime.onTopBarUserInteraction();
                            if (ThiccTopBarTextHelper.isCursorAtEnd(holderView)) {
                                hideJumpToEndArrow();
                            }
                            lastSelfReplaceTimestamp = SystemClock.uptimeMillis();
                            lastSelfReplacedWord = newWord;
                            ThiccTopBarTextHelper.replaceActiveWordInTextField(holderView, newWord);
                            cacheAlternativeGroup(currentWordsList, newWord);
                        },
                        // onHistoryReplace: Flick or tap on a history column swaps that past word in sentence
                        createHistoryWordReplaceCallback(holderView),
                        createHistoryWordClickCallback(holderView, barView)
                );
                barView.setVisibility(View.VISIBLE);
                ThiccTopBarGboardReflector.applyKeyboardBackground(barView, holderView);
                ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, true);
                barView.bringToFront();
            } catch (Throwable t) {
                Log.e(TAG, "Failed to update matrix suggestions", t);
            }
        });
    }

    /**
     * Injected by bytecode patch at the entry of LatinFixedCountCandidatesHolderView.l
     *
     * @param holderViewObj The LatinFixedCountCandidatesHolderView instance.
     */
    public static void onCandidatesCleared(Object holderViewObj) {
        if (!(holderViewObj instanceof ViewGroup holderView)) {
            return;
        }
        setLastHolderView(holderView);
        resetIfEditorChanged(holderView);
        if (dev.srwi.gintype.extension.settings.GboardInputTypeGuard.isThiccTopBarBlockedInput(
                holderView.getContext())) {
            hideBarForSensitiveInput(holderView);
            return;
        }

        final long eventSeq = ++candidatesEventSeq;
        if (Log.isLoggable(TAG, Log.DEBUG)) {
            Log.i(TAG, "onCandidatesCleared");
        }
        holderView.post(() -> {
            try {
                if (eventSeq != candidatesEventSeq) {
                    return;
                }
                if (!GboardThiccTopBarSettings.readEnabled(holderView.getContext())) {
                    handleDisabledState(holderView);
                    return;
                }
                if (dev.srwi.gintype.extension.settings.GboardInputTypeGuard.isThiccTopBarBlockedInput(
                        holderView.getContext())) {
                    hideBarForSensitiveInput(holderView);
                    return;
                }

                ViewGroup parent = parentViewGroup(holderView);
                ViewGroup attachTarget = parent != null ? parent : holderView;
                ThiccTopBarView barView = getOrCreateBarView(holderView);
                if (barView == null) {
                    return;
                }

                if (ThiccTopBarGboardReflector.isDictationActive(holderView)) {
                    hideBarForDictation(attachTarget, holderView, barView);
                    return;
                }

                if (isHistorySelectionSessionActive(holderView, barView)) {
                    barView.setVisibility(View.VISIBLE);
                    ThiccTopBarGboardReflector.applyKeyboardBackground(barView, holderView);
                    ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, true);
                    barView.bringToFront();
                    return;
                }

                if (barView.getSelectedHistoryIndex() >= 0 && ThiccTopBarTextHelper.isCursorAtEnd(holderView)) {
                    barView.clearHistorySelection();
                    hideJumpToEndArrow();
                } else if (barView.getSelectedHistoryIndex() < 0 && ThiccTopBarTextHelper.isCursorAtEnd(holderView)) {
                    hideJumpToEndArrow();
                }

                if (ThiccTopBarTextHelper.isSentenceEnded(holderView) || ThiccTopBarTextHelper.isInputEmpty(holderView)) {
                    thiccTopBarLiveGuessActive = false;
                    SENTENCE_BUFFER.clear();
                    activeOriginalSuggestions = null;
                    hideJumpToEndArrow();
                    barView.setVisibility(View.GONE);
                    ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, false);
                    return;
                }

                // If an active word is present (allowTrailingSpace = false: if candidates are cleared after space, no active word!),
                // retain it when at the end of the line or when continuing an active mid-sentence word.
                String activeWord = resolveClearedActiveWord(holderView, barView);
                if (activeWord != null && !activeWord.isEmpty()) {
                    List<String> words = resolveSuggestionsForWord(activeWord);
                    int centerIdx = Math.max(0, findCaseInsensitiveIndex(words, activeWord));
                    words.set(centerIdx, activeWord);
                    final List<String> currentWordsList = new ArrayList<>(words);
                    int historyBeforeCount = ThiccTopBarTextHelper.syncSentenceBufferWithSplit(
                            holderView, activeWord, false, SENTENCE_BUFFER, WORD_ALTERNATIVES_CACHE);
                    updateMatrixWithSplit(
                            barView,
                            historyBeforeCount,
                            words,
                            centerIdx,
                            (selectedIndex, word) -> {
                                GboardMultiGlideRuntime.onTopBarUserInteraction();
                                if (selectActiveWordIfAlreadyInEditor(holderView, barView, word)) {
                                    return;
                                }
                                if (ThiccTopBarTextHelper.isCursorAtEnd(holderView)) {
                                    hideJumpToEndArrow();
                                }
                                commitCandidate(holderView, new CandidateItem(word, -1, true, true, false, "CLEARED_ACTIVE", null, null), Collections.emptyList());
                            },
                            (selectedIndex, newWord) -> {
                                GboardMultiGlideRuntime.onTopBarUserInteraction();
                                if (ThiccTopBarTextHelper.isCursorAtEnd(holderView)) {
                                    hideJumpToEndArrow();
                                }
                                lastSelfReplaceTimestamp = SystemClock.uptimeMillis();
                                lastSelfReplacedWord = newWord;
                                ThiccTopBarTextHelper.replaceActiveWordInTextField(holderView, newWord);
                                cacheAlternativeGroup(currentWordsList, newWord);
                            },
                            createHistoryWordReplaceCallback(holderView),
                            createHistoryWordClickCallback(holderView, barView)
                    );
                    barView.setVisibility(View.VISIBLE);
                    ThiccTopBarGboardReflector.applyKeyboardBackground(barView, holderView);
                    ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, true);
                    barView.bringToFront();
                    return;
                }

                if (thiccTopBarLiveGuessActive
                        || GboardMultiGlideRuntime.hasActiveTouch()
                        || GboardMultiGlideRuntime.isMultiGlideWordActive()) {
                    return;
                }

                ThiccTopBarTextHelper.syncSentenceBufferFromText(holderView, null, SENTENCE_BUFFER, WORD_ALTERNATIVES_CACHE);
                if (!SENTENCE_BUFFER.isEmpty()) {
                    showHistoryOnlyBar(holderView, barView);
                } else {
                    hideJumpToEndArrow();
                    barView.setVisibility(View.GONE);
                    ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, false);
                }
            } catch (Throwable t) {
                Log.e(TAG, "Failed to clear matrix suggestions", t);
            }
        });
    }

    private static ThiccTopBarView getOrCreateBarView(ViewGroup holderView) {
        float activeScale = readActiveTopbarScale(holderView.getContext());
        float swipeSensitivity = GboardThiccTopBarSettings.readSwipeSensitivity(holderView.getContext());
        boolean invertSwipe = GboardThiccTopBarSettings.readInvertSwipe(holderView.getContext());
        syncHeaderHeight(holderView, activeScale);
        ThiccTopBarView bar = resolveOrCreateBarView(holderView);
        if (bar != null) {
            bar.setScaleFactor(activeScale);
            bar.setSwipeSensitivity(swipeSensitivity);
            bar.setMultiWordSelectEnabled(
                    GboardThiccTopBarSettings.readDoubleTapMultiWordSelect(holderView.getContext()));
            bar.setInvertVerticalSwipe(invertSwipe);
        }
        return bar;
    }

    private static ThiccTopBarView resolveOrCreateBarView(ViewGroup holderView) {
        ViewGroup parent = parentViewGroup(holderView);
        ViewGroup attachTarget = parent != null ? parent : holderView;

        ThiccTopBarView bar = ACTIVE_BARS.get(attachTarget);
        if (bar != null && bar.getParent() == attachTarget) {
            return bar;
        }

        // Look for existing tagged child
        for (int i = 0; i < attachTarget.getChildCount(); i++) {
            View child = attachTarget.getChildAt(i);
            if (child instanceof ThiccTopBarView existing && MATRIX_BAR_TAG.equals(existing.getTag())) {
                ACTIVE_BARS.put(attachTarget, existing);
                attachWordCursorNavigator(holderView, existing);
                return existing;
            }
        }

        // Create new
        Context context = attachTarget.getContext();
        bar = new ThiccTopBarView(context);
        bar.setTag(MATRIX_BAR_TAG);
        attachWordCursorNavigator(holderView, bar);
        ThiccTopBarGboardReflector.applyKeyboardBackground(bar, holderView);

        ViewGroup.LayoutParams lp;
        if (attachTarget instanceof FrameLayout) {
            lp = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        } else {
            lp = new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        }

        attachTarget.addView(bar, lp);
        ACTIVE_BARS.put(attachTarget, bar);

        final ThiccTopBarView finalBar = bar;
        // Keep quick toggles suppressed and MatrixBar at front whenever MatrixBar is visible.
        attachTarget.addOnLayoutChangeListener((v, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
            if (finalBar.getVisibility() == View.VISIBLE) {
                if (ThiccTopBarGboardReflector.isDictationActive(holderView)) {
                    hideBarForDictation(attachTarget, holderView, finalBar);
                    return;
                }
                ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, true);
                if (attachTarget.getChildCount() > 0 && attachTarget.getChildAt(attachTarget.getChildCount() - 1) != finalBar) {
                    finalBar.bringToFront();
                }
            }
        });

        // Watch for holderView visibility / layout changes
        holderView.addOnLayoutChangeListener((v, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
            if (finalBar.getVisibility() != View.VISIBLE
                    && ThiccTopBarGboardReflector.getHolderCandidateCount(holderView) == 0) {
                ThiccTopBarGboardReflector.hideStaleCandidateSlots(holderView);
            }
            if (v.getVisibility() != View.VISIBLE || (right - left <= 0)) {
                if (isHistorySelectionSessionActive(holderView, finalBar)) {
                    return;
                }
                if (ThiccTopBarTextHelper.isSentenceEnded(v) || ThiccTopBarTextHelper.isInputEmpty(v)) {
                    if (finalBar.getVisibility() != View.GONE) {
                        finalBar.setVisibility(View.GONE);
                        ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, false);
                    }
                }
            }
        });

        return bar;
    }

    /**
     * Determines which candidate corresponds to the active word in the middle line.
     */
    private static int determineCenterCandidateIndex(ViewGroup holderView, List<CandidateItem> items, String currentWord) {
        if (items.isEmpty()) return 0;

        // 1. Exact or case-insensitive match with current typed or swiped word before cursor
        String lastWord = (currentWord != null && !currentWord.isEmpty()) ? currentWord : ThiccTopBarTextHelper.getActiveWord(holderView, items);
        if (lastWord != null && !lastWord.isEmpty()) {
            for (int i = 0; i < items.size(); i++) {
                if (lastWord.equals(items.get(i).text)) {
                    return i;
                }
            }
            for (int i = 0; i < items.size(); i++) {
                if (lastWord.equalsIgnoreCase(items.get(i).text)) {
                    return i;
                }
            }
        }

        // 2. Check if Gboard set any SoftKeyView to activated
        for (int i = 0; i < items.size(); i++) {
            View sk = items.get(i).softKey;
            if (sk != null && sk.isActivated()) {
                return i;
            }
        }

        // 3. Fallback: if holderView has field 'r' set, use that slot
        try {
            Field rField = holderView.getClass().getDeclaredField("r");
            rField.setAccessible(true);
            int r = rField.getInt(holderView);
            for (int i = 0; i < items.size(); i++) {
                if (items.get(i).slotIndex == r) {
                    return i;
                }
            }
        } catch (Throwable ignored) {
        }

        // 4. Normal typing: verbatim typed word has isRaw flag
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).isRaw) {
                return i;
            }
        }

        // 5. Swipe / glide typing: swiped word has isAutoCorrect flag
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).isAutoCorrect) {
                return i;
            }
        }

        // 6. Default: Gboard center slot (index 1) if available, else 0
        if (items.size() >= 2) {
            return 1;
        }
        return 0;
    }

    /**
     * Commits the chosen candidate into Gboard and the target text field.
     */
    private static void commitCandidate(ViewGroup holderView, CandidateItem selectedItem, List<CandidateItem> allItems) {
        if (Log.isLoggable(TAG, Log.DEBUG)) {
            Log.i(TAG, "commitCandidate: word=" + selectedItem.text + " slotIndex=" + selectedItem.slotIndex);
        }

        // Commit cleanly via InputConnection (avoids SoftKeyboardView.a(softKey) synthetic touch replay).
        replaceActiveCandidateViaInputConnection(holderView, selectedItem);

        // 3. Record in sentence buffer with real alternatives (never empty alternatives)
        List<String> altStrings = new ArrayList<>();
        if (allItems != null) {
            for (CandidateItem ci : allItems) {
                if (ci != null && ci.text != null && !ci.text.isEmpty()) {
                    altStrings.add(ci.text);
                }
            }
        }
        if (altStrings.isEmpty() && selectedItem.text != null && !selectedItem.text.isEmpty()) {
            altStrings.addAll(resolveSuggestionsForWord(selectedItem.text));
        }
        if (selectedItem.text != null && !selectedItem.text.isEmpty()) {
            cacheAlternativeGroup(altStrings, selectedItem.text);
        }
        if (holderView != null) {
            ThiccTopBarTextHelper.syncSentenceBufferFromText(
                    holderView, null, SENTENCE_BUFFER, WORD_ALTERNATIVES_CACHE);
        } else {
            int selIdx = findCaseInsensitiveIndex(altStrings, selectedItem.text);
            SENTENCE_BUFFER.addWord(selectedItem.text, altStrings, selIdx >= 0 ? selIdx : 0);
        }
    }

    static CandidateItem findCandidateByWord(List<CandidateItem> items, String word) {
        if (items != null && word != null) {
            for (CandidateItem ci : items) {
                if (word.equals(ci.text)) {
                    return ci;
                }
            }
            for (CandidateItem ci : items) {
                if (word.equalsIgnoreCase(ci.text)) {
                    return ci;
                }
            }
        }
        return new CandidateItem(word != null ? word : "", -1, false, false, false, "", null, null);
    }

    private static List<String> buildTrimmedSuggestions(
            List<CandidateItem> items,
            String currentWord,
            int[] outCenterIndex
    ) {
        int currentWordIdx = -1;
        for (int i = 0; i < items.size(); i++) {
            if (currentWord.equalsIgnoreCase(items.get(i).text)) {
                currentWordIdx = i;
                break;
            }
        }

        // Inject currentWord when absent (e.g. glide typing or words absent from candidates)
        if (currentWordIdx < 0) {
            CandidateItem activeItem = new CandidateItem(currentWord, -1, true, true, false, "GLIDE_ACTIVE", null, null);
            int insertPos = (items.size() >= 2) ? 1 : 0;
            items.add(insertPos, activeItem);
            currentWordIdx = insertPos;
        }

        int centerIndex = currentWordIdx;

        List<String> words = new ArrayList<>();
        for (CandidateItem ci : items) {
            words.add(ci.text);
        }

        if (words.isEmpty()) {
            words.add(currentWord);
            centerIndex = 0;
        }

        if (words.size() > 3) {
            if (centerIndex <= 0) {
                words = new ArrayList<>(words.subList(0, 3));
                centerIndex = 0;
            } else if (centerIndex >= words.size() - 1) {
                words = new ArrayList<>(words.subList(words.size() - 3, words.size()));
                centerIndex = 2;
            } else {
                words = new ArrayList<>(words.subList(centerIndex - 1, centerIndex + 2));
                centerIndex = 1;
            }
        }
        if (centerIndex >= 0 && centerIndex < words.size() && words.get(centerIndex).equalsIgnoreCase(currentWord)) {
            words.set(centerIndex, currentWord);
        }
        outCenterIndex[0] = centerIndex;
        return words;
    }

    private static void showHistoryOnlyBar(ViewGroup holderView, ThiccTopBarView barView) {
        List<ThiccTopBarSentenceBuffer.WordEntry> entries = SENTENCE_BUFFER.getEntries();
        barView.updateHistoryOnly(
                entries,
                createHistoryWordReplaceCallback(holderView),
                createHistoryWordClickCallback(holderView, barView)
        );
        ViewGroup parent = parentViewGroup(holderView);
        ViewGroup attachTarget = parent != null ? parent : holderView;
        barView.setVisibility(View.VISIBLE);
        ThiccTopBarGboardReflector.applyKeyboardBackground(barView, holderView);
        ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, true);
        barView.bringToFront();
    }

    private static void attachWordCursorNavigator(ViewGroup holderView, ThiccTopBarView barView) {
        barView.setMultiWordSelectEnabled(
                GboardThiccTopBarSettings.readDoubleTapMultiWordSelect(holderView.getContext()));
        barView.setOnWordCursorNavigateCallback(new ThiccTopBarView.OnWordCursorNavigateCallback() {
            private ThiccTopBarTextHelper.MultiWordSelectAnchor multiWordAnchor = null;

            @Override
            public void onNavigateWord(int direction) {
                GboardMultiGlideRuntime.onTopBarUserInteraction();
                lastWordNavTimestamp = SystemClock.uptimeMillis();
                activeOriginalSuggestions = null;
                ThiccTopBarTextHelper.moveCursorByWord(holderView, direction);
                refreshBarAfterCursorNavigation(holderView, barView);
            }

            @Override
            public void onMultiWordSelectStart() {
                GboardMultiGlideRuntime.onTopBarUserInteraction();
                multiWordAnchor = ThiccTopBarTextHelper.captureMultiWordSelectAnchor(holderView);
            }

            @Override
            public void onMultiWordSelectStep(int direction) {
                GboardMultiGlideRuntime.onTopBarUserInteraction();
                lastWordNavTimestamp = SystemClock.uptimeMillis();
                activeOriginalSuggestions = null;
                if (multiWordAnchor == null) {
                    multiWordAnchor = ThiccTopBarTextHelper.captureMultiWordSelectAnchor(holderView);
                }
                ThiccTopBarTextHelper.stepMultiWordSelection(holderView, multiWordAnchor, direction);
                refreshBarAfterCursorNavigation(holderView, barView);
            }
        });
    }

    private static void refreshBarAfterCursorNavigation(ViewGroup holderView, ThiccTopBarView barView) {
        boolean hadActiveWheel = barView.getCurrentWheelView().getParent() != null;
        int prevHistoryCount = barView.getHistoryWheelCount();
        int prevSelectedCol = barView.getSelectedHistoryIndex();
        int prevWindowStart = SENTENCE_BUFFER.getWindowStartWordIndex();
        ThiccTopBarTextHelper.syncSentenceBufferFromText(holderView, null, SENTENCE_BUFFER, WORD_ALTERNATIVES_CACHE);
        int newWindowStart = SENTENCE_BUFFER.getWindowStartWordIndex();
        if (!ThiccTopBarTextHelper.isCursorAtEnd(holderView)) {
            if (!SENTENCE_BUFFER.isEmpty() && (hadActiveWheel
                    || prevHistoryCount != SENTENCE_BUFFER.getEntries().size()
                    || prevWindowStart != newWindowStart)) {
                if (!hadActiveWheel && prevWindowStart != newWindowStart && prevSelectedCol >= 0) {
                    barView.captureWindowShiftScrollAnchor(prevSelectedCol, newWindowStart - prevWindowStart);
                }
                showHistoryOnlyBar(holderView, barView);
            }
            if (!ThiccTopBarTextHelper.hasSelection(holderView)) {
                barView.clearHistorySelection();
                barView.ensureColumnVisible(0);
            } else {
                int colIdx = ThiccTopBarTextHelper.getWordIndexAtCursor(holderView, SENTENCE_BUFFER);
                if (colIdx >= 0 && colIdx < barView.getHistoryWheelCount()) {
                    barView.selectHistoryWord(colIdx);
                } else {
                    barView.clearHistorySelection();
                    if (colIdx >= 0) {
                        barView.ensureColumnVisible(colIdx);
                    }
                }
            }
            showJumpToEndArrow(holderView, () -> handleJumpToEnd(holderView, barView));
        } else {
            lastWordNavTimestamp = 0;
            barView.clearHistorySelection();
            hideJumpToEndArrow();
            if (!SENTENCE_BUFFER.isEmpty()) {
                showHistoryOnlyBar(holderView, barView);
            }
            barView.post(() -> barView.fullScroll(View.FOCUS_RIGHT));
        }
    }

    private static String resolveClearedActiveWord(ViewGroup holderView, ThiccTopBarView barView) {
        String editorWord = ThiccTopBarTextHelper.getActiveWord(holderView, Collections.emptyList(), false);
        if (editorWord == null || editorWord.isEmpty()) {
            return null;
        }
        if (!ThiccTopBarTextHelper.hasTextAfterCursorOnSameLine(holderView)) {
            return editorWord;
        }
        String activeWheelWord = barView != null ? barView.getActiveWheelWord() : null;
        return shouldRetainMidSentenceClearedActiveWord(
                editorWord, activeWheelWord, isRecentMultiGlideWord(editorWord), thiccTopBarLiveGuessActive)
                ? editorWord
                : null;
    }

    static boolean shouldRetainMidSentenceClearedActiveWord(
            String editorWord,
            String activeWheelWord,
            boolean recentMultiGlide,
            boolean liveGuessActive
    ) {
        if (editorWord == null || editorWord.isEmpty()) {
            return false;
        }
        if (recentMultiGlide || liveGuessActive) {
            return true;
        }
        if (activeWheelWord == null || activeWheelWord.isEmpty()) {
            return false;
        }
        if (editorWord.equalsIgnoreCase(activeWheelWord)) {
            return true;
        }
        String lowerEditor = editorWord.toLowerCase();
        String lowerWheel = activeWheelWord.toLowerCase();
        return lowerEditor.startsWith(lowerWheel) || lowerWheel.startsWith(lowerEditor);
    }

    private static boolean isHistorySelectionSessionActive(ViewGroup holderView, ThiccTopBarView barView) {
        long now = SystemClock.uptimeMillis();
        if ((now - lastHistoryReplaceTimestamp) < 600) {
            return true;
        }
        if ((now - lastWordNavTimestamp) < 600) {
            return !ThiccTopBarTextHelper.isCursorAtEnd(holderView) || ThiccTopBarTextHelper.hasSelection(holderView);
        }
        if (barView == null || barView.getSelectedHistoryIndex() < 0) {
            return false;
        }
        boolean withinGrace = (now - lastHistoryInteractionTimestamp) < 600;
        return ThiccTopBarTextHelper.hasSelection(holderView) || withinGrace;
    }

    private static void replaceActiveCandidateViaInputConnection(ViewGroup holderView, CandidateItem selectedItem) {
        try {
            InputConnection ic = ThiccTopBarTextHelper.getInputConnection(holderView);
            if (ic == null) return;

            ic.finishComposingText();

            CharSequence sel = ic.getSelectedText(0);
            if (sel != null && sel.length() > 0) {
                ic.commitText(selectedItem.text + " ", 1);
                return;
            }

            CharSequence cs = ic.getTextBeforeCursor(200, 0);
            if (cs == null) {
                ic.commitText(selectedItem.text + " ", 1);
                return;
            }

            String text = cs.toString();
            int end = text.length();
            while (end > 0) {
                char ch = text.charAt(end - 1);
                if (ch == '\n' || ch == '\r' || !Character.isWhitespace(ch)) {
                    break;
                }
                end--;
            }
            int start = end;
            while (start > 0 && !ThiccTopBarTextHelper.isBoundaryChar(text, start - 1)) {
                start--;
            }
            String lastWord = text.substring(start, end);

            if (lastWord.equals(selectedItem.text)) {
                // Word is already in the text field with exact casing; ensure trailing space
                if (!text.endsWith(" ")) {
                    ic.commitText(" ", 1);
                }
                return;
            }

            if (!lastWord.isEmpty()) {
                int deleteLen = text.length() - start;
                int deleteAfter = 0;
                if (end == text.length()) {
                    CharSequence csAfter = ic.getTextAfterCursor(100, 0);
                    if (csAfter != null && csAfter.length() > 0) {
                        String after = csAfter.toString();
                        while (deleteAfter < after.length()
                                && !ThiccTopBarTextHelper.isBoundaryChar(after, deleteAfter)) {
                            deleteAfter++;
                        }
                    }
                }
                if (deleteLen > 0 && deleteLen <= text.length()) {
                    ic.beginBatchEdit();
                    ic.deleteSurroundingText(deleteLen, deleteAfter);
                    ic.commitText(selectedItem.text + " ", 1);
                    ic.endBatchEdit();
                    if (Log.isLoggable(TAG, Log.DEBUG)) {
                        Log.i(TAG, "replaceActiveCandidateViaInputConnection: cleanly replaced '" + lastWord + "' with '" + selectedItem.text + "'");
                    }
                    return;
                }
            }

            ic.commitText(selectedItem.text + " ", 1);
        } catch (Throwable t) {
            Log.e(TAG, "replaceActiveCandidateViaInputConnection error", t);
        }
    }

    static boolean shouldPreserveActiveSuggestions(
            List<String> activeOriginalSuggestions,
            String currentWord,
            boolean isFromSelfReplace,
            List<CandidateItem> items
    ) {
        if (activeOriginalSuggestions == null || activeOriginalSuggestions.isEmpty()) {
            return false;
        }
        if (isFromSelfReplace && activeOriginalSuggestions.size() >= 2) {
            return true;
        }
        if (currentWord == null || currentWord.isEmpty()) {
            return false;
        }
        boolean containsCurrent = false;
        for (String w : activeOriginalSuggestions) {
            if (currentWord.equalsIgnoreCase(w)) {
                containsCurrent = true;
                break;
            }
        }
        if (!containsCurrent) {
            return false;
        }
        if (activeOriginalSuggestions.size() >= 2) {
            return true;
        }
        return items != null && items.size() == 1;
    }

    static void cacheAlternativeGroup(List<String> words) {
        String primary = (words != null && !words.isEmpty()) ? words.get(0) : null;
        cacheAlternativeGroup(words, primary);
    }

    static void cacheAlternativeGroup(List<String> words, String primaryWord) {
        if (words == null || words.isEmpty()) return;
        String primaryExact = (primaryWord != null && !primaryWord.isEmpty()) ? primaryWord : null;
        List<String> deduped = new ArrayList<>(words.size());
        for (String w : words) {
            if (w == null || w.isEmpty()) continue;
            if (findCaseInsensitiveIndex(deduped, w) < 0) {
                deduped.add(w);
            }
        }
        if (primaryExact != null) {
            int primaryIdx = findCaseInsensitiveIndex(deduped, primaryExact);
            if (primaryIdx >= 0) {
                deduped.set(primaryIdx, primaryExact);
            } else {
                deduped.add(0, primaryExact);
            }
        }
        if (deduped.isEmpty()) return;

        // Preserve the wheel order so top/bottom alternatives don't swap when the word moves to history.
        List<String> copy;
        if (deduped.size() > 3) {
            int primaryIdx = (primaryExact != null) ? findCaseInsensitiveIndex(deduped, primaryExact) : 0;
            if (primaryIdx <= 0) {
                copy = new ArrayList<>(deduped.subList(0, 3));
            } else if (primaryIdx >= deduped.size() - 1) {
                copy = new ArrayList<>(deduped.subList(deduped.size() - 3, deduped.size()));
            } else {
                copy = new ArrayList<>(deduped.subList(primaryIdx - 1, primaryIdx + 2));
            }
        } else {
            copy = deduped;
        }
        String primaryKey = primaryExact != null ? primaryExact.toLowerCase() : null;
        if (primaryExact != null) {
            putAlternativeGroupIfBetter(primaryExact, copy, true);
            putAlternativeGroupIfBetter(primaryKey, copy, true);
        }
        for (String w : copy) {
            if (w == null || w.isEmpty()) continue;
            boolean isPrimary = primaryExact != null && w.equalsIgnoreCase(primaryExact);
            putAlternativeGroupIfBetter(w, copy, isPrimary && copy.size() >= 2);
            String key = w.toLowerCase();
            if (!key.equals(primaryKey)) {
                putAlternativeGroupIfBetter(key, copy, false);
            }
        }
    }

    private static void putAlternativeGroupIfBetter(String key, List<String> copy, boolean overwriteMulti) {
        if (key == null || key.isEmpty()) return;
        List<String> existing = WORD_ALTERNATIVES_CACHE.get(key);
        if (existing == null || existing.isEmpty() || (overwriteMulti && copy.size() >= 2) || (existing.size() < 2 && copy.size() >= 2)) {
            WORD_ALTERNATIVES_CACHE.put(key, copy);
        }
    }

    static List<String> buildMultiGlideSuggestions(String committedWord, List<String> alternatives) {
        List<String> result = new ArrayList<>(3);
        if (committedWord != null && !committedWord.isEmpty()) {
            result.add(committedWord);
        }
        if (alternatives != null) {
            for (String alt : alternatives) {
                if (alt == null || alt.isEmpty()) {
                    continue;
                }
                if (findCaseInsensitiveIndex(result, alt) < 0) {
                    result.add(alt);
                }
                if (result.size() >= 3) {
                    break;
                }
            }
        }
        return result;
    }

    private static int findCaseInsensitiveIndex(List<String> list, String target) {
        if (list == null || target == null) {
            return -1;
        }
        for (int i = 0; i < list.size(); i++) {
            if (target.equalsIgnoreCase(list.get(i))) {
                return i;
            }
        }
        return -1;
    }

    private static boolean isRecentMultiGlideWord(String word) {
        if (word == null || word.isEmpty()) {
            return false;
        }
        long elapsed = SystemClock.uptimeMillis() - lastMultiGlideTimestamp;
        if (elapsed > 2500) {
            return false;
        }
        if (lastMultiGlideWord != null && lastMultiGlideWord.equalsIgnoreCase(word)) {
            return true;
        }
        return lastMultiGlideSuggestions != null && findCaseInsensitiveIndex(lastMultiGlideSuggestions, word) >= 0;
    }

    private static List<String> resolveSuggestionsForWord(String word) {
        if (word == null || word.isEmpty()) {
            return new ArrayList<>(Collections.singletonList(""));
        }
        if (isRecentMultiGlideWord(word) && lastMultiGlideSuggestions != null && !lastMultiGlideSuggestions.isEmpty()) {
            List<String> list = new ArrayList<>(lastMultiGlideSuggestions);
            if (findCaseInsensitiveIndex(list, word) < 0) {
                list.set(0, word);
            }
            return list;
        }
        List<String> cached = WORD_ALTERNATIVES_CACHE.get(word);
        if (cached == null || cached.isEmpty()) {
            cached = WORD_ALTERNATIVES_CACHE.get(word.toLowerCase());
        }
        if (cached != null && !cached.isEmpty()) {
            List<String> list = new ArrayList<>(cached);
            if (findCaseInsensitiveIndex(list, word) < 0) {
                list.set(0, word);
            }
            return list;
        }
        return new ArrayList<>(Collections.singletonList(word));
    }

    private static boolean selectActiveWordIfAlreadyInEditor(
            ViewGroup holderView,
            ThiccTopBarView barView,
            String word
    ) {
        if (holderView == null || barView == null || word == null || word.isEmpty()) {
            return false;
        }
        if (ThiccTopBarTextHelper.hasTextAfterCursorOnSameLine(holderView)) {
            return false;
        }
        String activeInEditor = ThiccTopBarTextHelper.getActiveOrTrailingPunctuatedWord(holderView);
        String coreWord = ThiccTopBarTextHelper.getCoreWord(word);
        if (activeInEditor == null
                || (!activeInEditor.equalsIgnoreCase(word) && !activeInEditor.equalsIgnoreCase(coreWord))) {
            return false;
        }
        GboardMultiGlideRuntime.onTopBarUserInteraction();
        lastHistoryInteractionTimestamp = SystemClock.uptimeMillis();
        activeOriginalSuggestions = null;
        ThiccTopBarTextHelper.syncSentenceBufferFromText(holderView, null, SENTENCE_BUFFER, WORD_ALTERNATIVES_CACHE);
        if (SENTENCE_BUFFER.isEmpty()) {
            return false;
        }
        showHistoryOnlyBar(holderView, barView);
        int lastColIdx = SENTENCE_BUFFER.getEntries().size() - 1;
        barView.selectHistoryWord(lastColIdx);
        boolean selected = ThiccTopBarTextHelper.selectHistoryWordInTextField(
                holderView, SENTENCE_BUFFER, lastColIdx, activeInEditor);
        if (selected) {
            showJumpToEndArrow(holderView, () -> {
                ThiccTopBarTextHelper.jumpToEndOfTextField(holderView);
                barView.clearHistorySelection();
                hideJumpToEndArrow();
                barView.post(() -> barView.fullScroll(View.FOCUS_RIGHT));
            });
        }
        return selected;
    }

    private static ThiccTopBarView.OnHistoryWordReplaceCallback createHistoryWordReplaceCallback(
            ViewGroup holderView) {
        return (histColIdx, oldWord, newWord) -> {
            GboardMultiGlideRuntime.onTopBarUserInteraction();
            long now = SystemClock.uptimeMillis();
            lastHistoryInteractionTimestamp = now;
            lastHistoryReplaceTimestamp = now;
            return ThiccTopBarTextHelper.replaceHistoryWord(
                    holderView, SENTENCE_BUFFER, histColIdx, oldWord, newWord);
        };
    }

    private static ThiccTopBarView.OnHistoryWordClickCallback createHistoryWordClickCallback(
            ViewGroup holderView, ThiccTopBarView barView) {
        return (histColIdx, word) -> {
            GboardMultiGlideRuntime.onTopBarUserInteraction();
            lastHistoryInteractionTimestamp = SystemClock.uptimeMillis();
            boolean selected = ThiccTopBarTextHelper.selectHistoryWordInTextField(holderView, SENTENCE_BUFFER, histColIdx, word);
            if (selected) {
                showJumpToEndArrow(holderView, () -> handleJumpToEnd(holderView, barView));
            }
        };
    }

    private static void handleJumpToEnd(ViewGroup holderView, ThiccTopBarView barView) {
        lastWordNavTimestamp = 0;
        lastHistoryInteractionTimestamp = 0;
        activeOriginalSuggestions = null;
        ThiccTopBarTextHelper.jumpToEndOfTextField(holderView);
        barView.clearHistorySelection();
        hideJumpToEndArrow();
        ThiccTopBarTextHelper.syncSentenceBufferFromText(holderView, null, SENTENCE_BUFFER, WORD_ALTERNATIVES_CACHE);
        if (!SENTENCE_BUFFER.isEmpty()
                && !ThiccTopBarTextHelper.isSentenceEnded(holderView)
                && !ThiccTopBarTextHelper.isInputEmpty(holderView)) {
            showHistoryOnlyBar(holderView, barView);
        } else {
            ViewGroup parent = parentViewGroup(holderView);
            ViewGroup attachTarget = parent != null ? parent : holderView;
            barView.setVisibility(View.GONE);
            ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, false);
        }
        barView.post(() -> barView.fullScroll(View.FOCUS_RIGHT));
    }

    private static ViewGroup.LayoutParams copyLayoutParams(View sourceView) {
        ViewGroup.LayoutParams srcLp = sourceView.getLayoutParams();
        if (srcLp == null) {
            return new ViewGroup.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.MATCH_PARENT);
        }
        try {
            Constructor<?> ctor = srcLp.getClass().getConstructor(srcLp.getClass());
            ctor.setAccessible(true);
            return (ViewGroup.LayoutParams) ctor.newInstance(srcLp);
        } catch (Throwable t1) {
            try {
                if (srcLp instanceof ViewGroup.MarginLayoutParams mlp) {
                    Constructor<?> ctor = srcLp.getClass().getConstructor(ViewGroup.MarginLayoutParams.class);
                    ctor.setAccessible(true);
                    return (ViewGroup.LayoutParams) ctor.newInstance(mlp);
                }
            } catch (Throwable t2) {
            }
            try {
                Constructor<?> ctor = srcLp.getClass().getConstructor(ViewGroup.LayoutParams.class);
                ctor.setAccessible(true);
                return (ViewGroup.LayoutParams) ctor.newInstance(srcLp);
            } catch (Throwable t3) {
                return new ViewGroup.LayoutParams(srcLp.width, srcLp.height);
            }
        }
    }

    private static void showJumpToEndArrow(ViewGroup holderView, Runnable onJump) {
        pendingJumpRunnable = onJump;
        if (currentJumpToEndArrow != null
                && currentJumpToEndArrow.getParent() != null
                && currentJumpToEndArrow.isAttachedToWindow()
                && currentJumpToEndArrow.getRootView() == holderView.getRootView()) {
            currentJumpToEndArrow.setScaleFactor(
                    readActiveTopbarScale(currentJumpToEndArrow.getContext()));
            currentJumpToEndArrow.updateIconColor();
            currentJumpToEndArrow.setVisibility(View.VISIBLE);
            currentJumpToEndArrow.bringToFront();
            return;
        }
        if (currentJumpToEndArrow != null) {
            hideJumpToEndArrow();
            pendingJumpRunnable = onJump;
        }

        ViewGroup headerContainer = ThiccTopBarGboardReflector.findHeaderContainer(holderView);
        ViewGroup holderParent = parentViewGroup(holderView);
        View voiceBtn = null;
        if (headerContainer != null) {
            voiceBtn = ThiccTopBarGboardReflector.findVoiceButton(headerContainer, holderView);
        }
        if (voiceBtn == null && holderParent != null && holderParent != headerContainer) {
            voiceBtn = ThiccTopBarGboardReflector.findVoiceButton(holderParent, holderView);
        }

        Context context = holderView.getContext();
        if (currentJumpToEndArrow == null) {
            currentJumpToEndArrow = new JumpToEndArrowView(context);
        }
        currentJumpToEndArrow.setScaleFactor(
                readActiveTopbarScale(currentJumpToEndArrow.getContext()));
        currentJumpToEndArrow.updateIconColor();
        currentJumpToEndArrow.setOnJumpClickListener(() -> {
            if (pendingJumpRunnable != null) {
                pendingJumpRunnable.run();
            }
        });

        if (voiceBtn != null && voiceBtn.getParent() instanceof ViewGroup voiceParent) {
            currentVoiceButtonRef = new WeakReference<>(voiceBtn);
            currentVoiceButtonOriginalVisibility = voiceBtn.getVisibility();
            voiceBtn.setVisibility(View.INVISIBLE);
            ViewGroup.LayoutParams lp = copyLayoutParams(voiceBtn);
            ViewGroup arrowParent = parentViewGroup(currentJumpToEndArrow);
            if (arrowParent != null) {
                arrowParent.removeView(currentJumpToEndArrow);
            }
            voiceParent.addView(currentJumpToEndArrow, lp);
        } else {
            // No dedicated voice button slot (e.g. Voice Typing disabled in Gboard settings).
            // Prefer the FrameLayout attachTarget (holderParent) so the narrow 44dp arrow docks
            // cleanly on the right edge without covering the center words or swallowing double-taps.
            ViewGroup fallbackTarget;
            if (holderParent instanceof FrameLayout) {
                fallbackTarget = holderParent;
            } else if (headerContainer instanceof FrameLayout) {
                fallbackTarget = headerContainer;
            } else {
                fallbackTarget = holderParent != null ? holderParent : headerContainer;
            }
            if (fallbackTarget != null) {
                ViewGroup arrowParent = parentViewGroup(currentJumpToEndArrow);
                if (arrowParent != null) {
                    arrowParent.removeView(currentJumpToEndArrow);
                }
                ThiccTopBarGboardReflector.applyKeyboardBackground(currentJumpToEndArrow, holderView);
                int width = (int) TypedValue.applyDimension(
                        TypedValue.COMPLEX_UNIT_DIP, 44f, context.getResources().getDisplayMetrics());
                ViewGroup.LayoutParams lp;
                if (fallbackTarget instanceof FrameLayout) {
                    lp = new FrameLayout.LayoutParams(
                            width, ViewGroup.LayoutParams.MATCH_PARENT, Gravity.END | Gravity.CENTER_VERTICAL);
                } else if (fallbackTarget instanceof android.widget.RelativeLayout) {
                    android.widget.RelativeLayout.LayoutParams rlp =
                            new android.widget.RelativeLayout.LayoutParams(
                                    width, ViewGroup.LayoutParams.MATCH_PARENT);
                    rlp.addRule(android.widget.RelativeLayout.ALIGN_PARENT_END);
                    lp = rlp;
                } else {
                    lp = new ViewGroup.LayoutParams(width, ViewGroup.LayoutParams.MATCH_PARENT);
                }
                fallbackTarget.addView(currentJumpToEndArrow, lp);
            }
        }

        currentJumpToEndArrow.setVisibility(View.VISIBLE);
        currentJumpToEndArrow.bringToFront();
    }

    public static void hideJumpToEndArrow() {
        try {
            View voiceBtn = getCurrentVoiceButton();
            if (voiceBtn != null) {
                voiceBtn.setVisibility(currentVoiceButtonOriginalVisibility);
                currentVoiceButtonRef = null;
                currentVoiceButtonOriginalVisibility = View.VISIBLE;
            }
            if (currentJumpToEndArrow != null) {
                currentJumpToEndArrow.setVisibility(View.GONE);
                ViewGroup p = parentViewGroup(currentJumpToEndArrow);
                if (p != null) {
                    p.removeView(currentJumpToEndArrow);
                }
                currentJumpToEndArrow = null;
            }
            pendingJumpRunnable = null;
        } catch (Throwable t) {
            Log.w(TAG, "hideJumpToEndArrow error: " + t.getMessage());
        }
    }

    public static ThiccTopBarSentenceBuffer getSentenceBuffer() {
        return SENTENCE_BUFFER;
    }

    static Map<String, List<String>> getWordAlternativesCacheForTesting() {
        return WORD_ALTERNATIVES_CACHE;
    }

    public static void recordMultiGlideDecodedWord(String committedWord, List<String> alternatives) {
        try {
            if (committedWord == null || committedWord.isEmpty()) {
                return;
            }
            List<String> trimmedAlts = buildMultiGlideSuggestions(committedWord, alternatives);
            cacheAlternativeGroup(trimmedAlts, committedWord);
            lastMultiGlideWord = committedWord;
            lastMultiGlideSuggestions = new ArrayList<>(trimmedAlts);
            lastMultiGlideTimestamp = safeUptimeMillis();
            lastWordNavTimestamp = 0;
            lastHistoryInteractionTimestamp = 0;
            activeOriginalSuggestions = new ArrayList<>(trimmedAlts);

            ViewGroup holderView = getLastHolderView();
            if (holderView != null) {
                holderView.post(() -> refreshBarFromMultiGlide(holderView));
            } else {
                ThiccTopBarSentenceBuffer.WordEntry lastEntry = SENTENCE_BUFFER.getLastEntry();
                if (lastEntry == null || !committedWord.equals(lastEntry.committedWord)) {
                    SENTENCE_BUFFER.addWord(committedWord, trimmedAlts, 0);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static long safeUptimeMillis() {
        try {
            return SystemClock.uptimeMillis();
        } catch (Throwable ignored) {
            return System.currentTimeMillis();
        }
    }

    private static void refreshBarFromMultiGlide(ViewGroup holderView) {
        try {
            if (holderView == null || !GboardThiccTopBarSettings.readEnabled(holderView.getContext())) {
                return;
            }
            resetIfEditorChanged(holderView);
            ThiccTopBarView barView = getOrCreateBarView(holderView);
            if (barView == null) {
                return;
            }
            ViewGroup parent = parentViewGroup(holderView);
            ViewGroup attachTarget = parent != null ? parent : holderView;

            if (ThiccTopBarGboardReflector.isDictationActive(holderView)) {
                hideBarForDictation(attachTarget, holderView, barView);
                return;
            }
            if (isHistorySelectionSessionActive(holderView, barView)) {
                return;
            }

            if (barView.getSelectedHistoryIndex() >= 0 && ThiccTopBarTextHelper.isCursorAtEnd(holderView)) {
                barView.clearHistorySelection();
                hideJumpToEndArrow();
            } else if (barView.getSelectedHistoryIndex() < 0 && ThiccTopBarTextHelper.isCursorAtEnd(holderView)) {
                hideJumpToEndArrow();
            }

            if (ThiccTopBarTextHelper.isSentenceEnded(holderView) || ThiccTopBarTextHelper.isInputEmpty(holderView)) {
                SENTENCE_BUFFER.clear();
                activeOriginalSuggestions = null;
                hideJumpToEndArrow();
                barView.setVisibility(View.GONE);
                ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, false);
                return;
            }

            String activeWord = ThiccTopBarTextHelper.getActiveWord(holderView, Collections.emptyList(), false);
            if (activeWord == null) {
                String trailingCandidate = ThiccTopBarTextHelper.getActiveWord(holderView, Collections.emptyList(), true);
                if (trailingCandidate != null && isRecentMultiGlideWord(trailingCandidate)) {
                    activeWord = trailingCandidate;
                }
            }

            if (activeWord != null && !activeWord.isEmpty()) {
                clearThiccTopBarLiveGuess();
                List<String> words = resolveSuggestionsForWord(activeWord);
                int centerIdx = Math.max(0, findCaseInsensitiveIndex(words, activeWord));
                words.set(centerIdx, activeWord);
                activeOriginalSuggestions = new ArrayList<>(words);
                cacheAlternativeGroup(words, activeWord);
                final List<String> currentWordsList = new ArrayList<>(words);

                int historyBeforeCount = ThiccTopBarTextHelper.syncSentenceBufferWithSplit(
                        holderView, activeWord, false, SENTENCE_BUFFER, WORD_ALTERNATIVES_CACHE);
                updateMatrixWithSplit(
                        barView,
                        historyBeforeCount,
                        words,
                        centerIdx,
                        (selectedIndex, word) -> {
                            GboardMultiGlideRuntime.onTopBarUserInteraction();
                            if (selectActiveWordIfAlreadyInEditor(holderView, barView, word)) {
                                return;
                            }
                            if (ThiccTopBarTextHelper.isCursorAtEnd(holderView)) {
                                hideJumpToEndArrow();
                            }
                            commitCandidate(holderView, new CandidateItem(word, -1, true, true, false, "MULTIGLIDE_ACTIVE", null, null), Collections.emptyList());
                        },
                        (selectedIndex, newWord) -> {
                            GboardMultiGlideRuntime.onTopBarUserInteraction();
                            if (ThiccTopBarTextHelper.isCursorAtEnd(holderView)) {
                                hideJumpToEndArrow();
                            }
                            lastSelfReplaceTimestamp = SystemClock.uptimeMillis();
                            lastSelfReplacedWord = newWord;
                            ThiccTopBarTextHelper.replaceActiveWordInTextField(holderView, newWord);
                            cacheAlternativeGroup(currentWordsList, newWord);
                        },
                        createHistoryWordReplaceCallback(holderView),
                        createHistoryWordClickCallback(holderView, barView)
                );
                barView.setVisibility(View.VISIBLE);
                ThiccTopBarGboardReflector.applyKeyboardBackground(barView, holderView);
                ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, true);
                barView.bringToFront();
                return;
            }

            if (thiccTopBarLiveGuessActive) {
                return;
            }

            ThiccTopBarTextHelper.syncSentenceBufferFromText(holderView, null, SENTENCE_BUFFER, WORD_ALTERNATIVES_CACHE);
            if (!SENTENCE_BUFFER.isEmpty()) {
                showHistoryOnlyBar(holderView, barView);
            } else {
                hideJumpToEndArrow();
                barView.setVisibility(View.GONE);
                ThiccTopBarGboardReflector.updateHeaderViewsVisibility(attachTarget, holderView, false);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to refresh matrix bar from MultiGlide", t);
        }
    }
}
