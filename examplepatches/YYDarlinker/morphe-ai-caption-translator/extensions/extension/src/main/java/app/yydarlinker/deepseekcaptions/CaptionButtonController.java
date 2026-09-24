package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.ImageView;

import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Makes short-tap caption activation use the configured AI target without stealing YouTube's
 * native long-press caption menu.
 *
 * <p>Short tap and long press are intentionally different authorities. A short tap may turn the
 * configured default AI target on/off. A long press belongs entirely to YouTube: source-language
 * captions, Off, and any other native track selection must remain functional. The controller also
 * stays off the Activity's global-layout hot path so player animations remain uncontended.</p>
 */
final class CaptionButtonController {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long SELECTION_WINDOW_MS = 2_500L;
    private static final long NATIVE_MENU_WINDOW_MS = 12_000L;
    private static final long NATIVE_MENU_MONITOR_MS = 160L;
    private static final long EXACT_MENU_MIN_ACTION_MS = 220L;
    private static final long EXACT_MENU_OFF_CONFIRM_MS = 90L;
    private static final long PLAYER_TRANSITION_QUIET_MS = 4_500L;
    private static final long MAINTENANCE_SCAN_MS = 2_500L;
    private static final int MAX_SCANNED_VIEWS = 1_800;

    private static final Map<View, Boolean> INSTALLED_ROOTS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<View, Boolean> HOOKED_BUTTONS =
            Collections.synchronizedMap(new WeakHashMap<>());
    /** Serializes menu selection, native-track authority, and OFF so stale requests cannot revive state. */
    private static final Object NATIVE_STATE_LOCK = new Object();

    private static volatile WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static volatile WeakReference<View> captionButtonRef = new WeakReference<>(null);
    private static volatile WeakReference<View> exactCaptionButtonRef = new WeakReference<>(null);
    private static volatile int captionButtonViewId = View.NO_ID;
    private static volatile long selectDefaultUntilMs;
    private static volatile long suppressDefaultUntilMs;
    private static volatile long ignoreUiStateUntilMs;
    private static volatile long transitionQuietUntilMs;
    private static volatile long nativeMenuUntilMs;
    private static volatile long nativeMenuOpenedAtMs;
    private static volatile long exactControllerGeneration;
    private static volatile long nativeMenuExactBaselineGeneration;
    private static volatile long scanGeneration;
    private static volatile boolean scanPosted;
    private static volatile boolean maintenancePosted;
    private static volatile boolean defaultSelectionLogged;
    private static volatile boolean turnCaptionsOffOnTouchUp;
    private static volatile boolean buttonTouchDown;
    private static volatile boolean longPressGesture;
    private static volatile boolean nativeMenuSelectionArmed;
    private static volatile boolean nativeTrackSelected;
    private static volatile String nativeMenuVideoId = "";
    private static volatile String nativeTrackVideoId = "";
    private static volatile long buttonDownAtMs;
    private static volatile int intentBeforeTouch = CaptionIntentPolicy.UNKNOWN;
    private static volatile int nativeStateAtTouchDown = CaptionIntentPolicy.UNKNOWN;
    private static volatile int nativeMenuOpeningState = CaptionIntentPolicy.UNKNOWN;
    private static volatile int lastExactNativeState = CaptionIntentPolicy.UNKNOWN;
    private static volatile int captionIntent = CaptionIntentPolicy.UNKNOWN;
    private static volatile String currentVideoId = "";
    private static volatile List<String> localizedLabels = Collections.emptyList();

    private static final Runnable LONG_PRESS_ARM = () -> {
        if (!buttonTouchDown) return;
        longPressGesture = true;
        beginNativeMenuOwnership(false);
    };

    private static final Runnable NATIVE_MENU_MONITOR = new Runnable() {
        @Override public void run() {
            long now = SystemClock.uptimeMillis();
            if (now > nativeMenuUntilMs ||
                    (!nativeMenuSelectionArmed && !isNativeTrackSelectedForCurrentVideo())) {
                return;
            }
            if (now >= transitionQuietUntilMs && now > ignoreUiStateUntilMs) {
                View button = resolveCaptionButtonForNativeMenu();
                if (button != null && button.isAttachedToWindow()) {
                    try { syncNativeCaptionState(button); } catch (Throwable ignored) {}
                }
            }
            if (SystemClock.uptimeMillis() <= nativeMenuUntilMs &&
                    (nativeMenuSelectionArmed || isNativeTrackSelectedForCurrentVideo())) {
                MAIN.postDelayed(this, NATIVE_MENU_MONITOR_MS);
            }
        }
    };

    private static final Runnable MAINTENANCE = () -> {
        maintenancePosted = false;
        Activity activity = activityRef.get();
        if (activity == null || activity.isFinishing()) return;

        long now = SystemClock.uptimeMillis();
        if (now >= transitionQuietUntilMs) {
            View root = decor(activity);
            if (root != null && root.isShown()) {
                try { scan(root); } catch (Throwable ignored) {}
            }
        }
        scheduleMaintenance();
    };

    private CaptionButtonController() {}

    static void install(Activity activity) {
        if (activity == null) return;
        activityRef = new WeakReference<>(activity);
        localizedLabels = captionLabels(activity);

        View root = decor(activity);
        if (root == null) return;
        INSTALLED_ROOTS.put(root, Boolean.TRUE);
        if (DynamicCaptionController.isVisibleActive()) {
            long now = SystemClock.uptimeMillis();
            captionIntent = CaptionIntentPolicy.ON;
            clearNativeTrackAuthority();
            ignoreUiStateUntilMs = Math.max(ignoreUiStateUntilMs, now + 1_200L);
        }

        scheduleScan(80L);
        scheduleMaintenance();
    }

    static void onVideoId(String videoId) {
        String clean = videoId == null ? "" : videoId.trim();
        if (!clean.equals(currentVideoId)) {
            synchronized (NATIVE_STATE_LOCK) {
                currentVideoId = clean;
                selectDefaultUntilMs = 0L;
                suppressDefaultUntilMs = 0L;
                turnCaptionsOffOnTouchUp = false;
                buttonTouchDown = false;
                longPressGesture = false;
                nativeMenuSelectionArmed = false;
                nativeMenuUntilMs = 0L;
                nativeMenuVideoId = "";
                clearNativeTrackAuthorityLocked();
                clearNativeMenuEvidenceLocked();
                lastExactNativeState = CaptionIntentPolicy.UNKNOWN;
                defaultSelectionLogged = false;
            }
            MAIN.removeCallbacks(LONG_PRESS_ARM);
            MAIN.removeCallbacks(NATIVE_MENU_MONITOR);
        }
        scheduleScan(220L);
    }

    /**
     * Cross-video policy deliberately ignores a native track selected on the current video.
     * Native/source and Auto-translate choices are video-local; only the caption ON/OFF intent carries.
     */
    static boolean wantsCaptionsOnAcrossVideo() {
        long now = SystemClock.uptimeMillis();
        return DynamicCaptionController.isVisibleActive() ||
                CaptionIntentPolicy.mayActivate(captionIntent, now, selectDefaultUntilMs);
    }

    static void onDefaultLanguageChanged() {
        selectDefaultUntilMs = 0L;
        defaultSelectionLogged = false;
    }

    /** Optional explicit signal from any future menu hook; long-press touch detection already calls it. */
    static void noteCaptionMenuInteraction() {
        beginNativeMenuOwnership(true);
    }

    /**
     * Receives the concrete CC TouchImageView from YouTube's real subtitle-button controller.
     * Evaluation is posted until after the YouTube method returns, so the final accessibility /
     * selected state from a menu action is observed instead of the controller's pre-update state.
     */
    static void onNativeCaptionButtonController(ImageView button) {
        if (button == null) return;
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(() -> onNativeCaptionButtonController(button));
            return;
        }
        hook(button);
        captionButtonRef = new WeakReference<>(button);
        exactCaptionButtonRef = new WeakReference<>(button);
        int id = button.getId();
        if (id != View.NO_ID) captionButtonViewId = id;
        final long generation = ++exactControllerGeneration;
        MAIN.post(() -> observeExactCaptionControllerAfterUpdate(button, generation));
    }

    private static void observeExactCaptionControllerAfterUpdate(View button, long generation) {
        if (button == null || !button.isAttachedToWindow() || button != exactCaptionButtonRef.get() ||
                generation != exactControllerGeneration) {
            return;
        }
        long now = SystemClock.uptimeMillis();
        int state = nativeCaptionState(button);

        // Player transitions remain absolute authority: do not learn or act on transient CC states
        // while controls are being rebuilt. If this was a real menu event, preserve it by checking
        // the same final controller state once the already-existing quiet window expires.
        if (now < transitionQuietUntilMs) {
            if (nativeMenuSelectionArmed && now <= nativeMenuUntilMs) {
                scheduleExactControllerRecheck(
                        button, generation, transitionQuietUntilMs - now + 16L
                );
            }
            return;
        }

        if (state == CaptionIntentPolicy.ON) {
            lastExactNativeState = CaptionIntentPolicy.ON;
            if (now > ignoreUiStateUntilMs) syncNativeCaptionState(button);
            return;
        }

        boolean menuCandidate = DynamicCaptionController.isVisibleActive() &&
                nativeMenuSelectionArmed && now <= nativeMenuUntilMs &&
                nativeMenuOpeningState == CaptionIntentPolicy.ON &&
                generation > nativeMenuExactBaselineGeneration;

        if (now <= ignoreUiStateUntilMs) {
            if (menuCandidate) {
                scheduleExactControllerRecheck(
                        button, generation, ignoreUiStateUntilMs - now + 16L
                );
            }
            return;
        }

        if (state == CaptionIntentPolicy.OFF) {
            lastExactNativeState = CaptionIntentPolicy.OFF;
            if (menuCandidate) {
                commitNativeCaptionOff(
                        true,
                        "真实 CC 控制器已明确报告字幕关闭；AI 字幕状态同步关闭"
                );
            } else {
                syncNativeCaptionState(button);
            }
            return;
        }

        // UNKNOWN is never globally treated as OFF. It becomes actionable only inside an explicit
        // long-press menu transaction whose pre-menu state was definitively ON and only after the
        // real YouTube CC controller has refreshed once after the menu became interactive.
        if (!menuCandidate) return;
        long readyAt = nativeMenuOpenedAtMs + EXACT_MENU_MIN_ACTION_MS;
        if (now < readyAt) {
            scheduleExactControllerRecheck(button, generation, readyAt - now + 16L);
            return;
        }

        MAIN.postDelayed(
                () -> confirmUnknownOffFromExactController(generation),
                EXACT_MENU_OFF_CONFIRM_MS
        );
    }

    private static void scheduleExactControllerRecheck(View button, long generation, long delayMs) {
        MAIN.postDelayed(
                () -> {
                    if (generation == exactControllerGeneration) {
                        observeExactCaptionControllerAfterUpdate(button, generation);
                    }
                },
                Math.max(16L, delayMs)
        );
    }

    private static void confirmUnknownOffFromExactController(long generation) {
        long now = SystemClock.uptimeMillis();
        if (generation != exactControllerGeneration ||
                !DynamicCaptionController.isVisibleActive() ||
                now <= ignoreUiStateUntilMs || now < transitionQuietUntilMs ||
                !nativeMenuSelectionArmed || now > nativeMenuUntilMs ||
                nativeMenuOpeningState != CaptionIntentPolicy.ON ||
                generation <= nativeMenuExactBaselineGeneration) {
            return;
        }
        View button = exactCaptionButtonRef.get();
        if (button == null || !button.isAttachedToWindow()) return;

        int state = nativeCaptionState(button);
        if (state == CaptionIntentPolicy.ON) {
            lastExactNativeState = CaptionIntentPolicy.ON;
            return;
        }
        if (state == CaptionIntentPolicy.OFF) {
            lastExactNativeState = CaptionIntentPolicy.OFF;
            commitNativeCaptionOff(true, "真实 CC 控制器已明确报告字幕关闭；AI 字幕状态同步关闭");
            return;
        }
        if (lastExactNativeState != CaptionIntentPolicy.ON) return;

        // Some current YouTube builds visually switch the CC icon to Off but expose neither a
        // checkable node nor an OFF content description. Requiring the exact controller event,
        // definite pre-menu ON state, an armed menu transaction, a quiet player, and a second stable
        // UNKNOWN observation avoids interpreting ordinary player rebuilds or menu dismissal as Off.
        commitNativeCaptionOff(
                true,
                "真实 CC 控制器确认长按菜单已切换到关闭状态；AI 字幕同步关闭"
        );
    }

    /**
     * Single authority for source-track pass-through.
     *
     * <p>The old two-step "check then later commit" allowed an OFF event to clear native state and
     * an already-in-flight Timed Text request to write it back afterwards. This method consumes the
     * one-shot menu transaction and commits current-video native authority atomically.</p>
     */
    static boolean consumeNativeTrackPassThrough(Context context, String url) {
        if (!DeepSeekCaptionHook.isYouTubeTimedTextUrl(url) || TargetLanguage.fromUrl(url) != null) {
            return false;
        }

        long now = SystemClock.uptimeMillis();
        boolean newlySelected = false;
        synchronized (NATIVE_STATE_LOCK) {
            if (isNativeTrackSelectedForCurrentVideoLocked()) {
                return true;
            }
            if (!nativeMenuSelectionArmed || now > nativeMenuUntilMs) {
                return false;
            }

            String requestVideoId = requestVideoId(url);
            if ((!nativeMenuVideoId.isEmpty() && !nativeMenuVideoId.equals(currentVideoId)) ||
                    (!requestVideoId.isEmpty() && !currentVideoId.isEmpty() &&
                            !requestVideoId.equals(currentVideoId))) {
                nativeMenuSelectionArmed = false;
                clearNativeMenuEvidenceLocked();
                return false;
            }

            // Consume exactly once. Keep the monitor/window alive so a nearly-simultaneous OFF row
            // can still become authoritative and clear this provisional native-track selection.
            nativeMenuSelectionArmed = false;
            nativeTrackSelected = true;
            nativeTrackVideoId = currentVideoId;
            selectDefaultUntilMs = 0L;
            suppressDefaultUntilMs = Math.max(suppressDefaultUntilMs, nativeMenuUntilMs);
            captionIntent = CaptionIntentPolicy.ON;
            ignoreUiStateUntilMs = Math.max(ignoreUiStateUntilMs, now + 350L);
            clearNativeMenuEvidenceLocked();
            defaultSelectionLogged = false;
            newlySelected = true;
        }

        if (newlySelected && context != null) {
            CaptionDiagnostics.mark(
                    context,
                    "NATIVE_CAPTION_SELECTED",
                    "已尊重当前视频的长按菜单原生字幕选择；该权限不会带到下一视频"
            );
        }
        return true;
    }

    static void noteAiTrackSelected() {
        ignoreUiStateUntilMs = SystemClock.uptimeMillis() + 700L;
        synchronized (NATIVE_STATE_LOCK) {
            clearNativeTrackAuthorityLocked();
            nativeMenuSelectionArmed = false;
            nativeMenuUntilMs = 0L;
            nativeMenuVideoId = "";
            clearNativeMenuEvidenceLocked();
            captionIntent = CaptionIntentPolicy.ON;
        }
        MAIN.removeCallbacks(NATIVE_MENU_MONITOR);
    }

    /**
     * Arms a quiet window around any player-shape transition. A transient CC accessibility OFF
     * state during rotation/fullscreen is not a user command and must not deactivate the AI track.
     */
    static void onPlayerTransition(String rawType) {
        long now = SystemClock.uptimeMillis();
        transitionQuietUntilMs = Math.max(
                transitionQuietUntilMs,
                now + PLAYER_TRANSITION_QUIET_MS
        );
        scanGeneration++;
        synchronized (NATIVE_STATE_LOCK) {
            clearNativeMenuEvidenceLocked();
            lastExactNativeState = CaptionIntentPolicy.UNKNOWN;
        }

        if (DynamicCaptionController.isVisibleActive()) {
            captionIntent = CaptionIntentPolicy.ON;
            clearNativeTrackAuthority();
            ignoreUiStateUntilMs = Math.max(
                    ignoreUiStateUntilMs,
                    now + PLAYER_TRANSITION_QUIET_MS
            );
        }
    }

    /** Called only after the read-only player-geometry probe has observed a stable player. */
    static void onPlayerStable() {
        long now = SystemClock.uptimeMillis();
        transitionQuietUntilMs = now;
        if (DynamicCaptionController.isVisibleActive()) {
            captionIntent = CaptionIntentPolicy.ON;
            clearNativeTrackAuthority();
            ignoreUiStateUntilMs = Math.max(ignoreUiStateUntilMs, now + 900L);
        }
        scheduleScan(120L);
    }

    /** True only when the user wants the AI/default caption path, not a selected native track. */
    static boolean mayActivateAiTarget() {
        long now = SystemClock.uptimeMillis();
        if (isNativeTrackSelectedForCurrentVideo() || now <= nativeMenuUntilMs) return false;
        return CaptionIntentPolicy.mayActivate(captionIntent, now, selectDefaultUntilMs);
    }

    static String rewriteDefaultTarget(Context context, String url) {
        long now = SystemClock.uptimeMillis();
        if (isNativeTrackSelectedForCurrentVideo() || now <= nativeMenuUntilMs ||
                now <= suppressDefaultUntilMs) {
            return url;
        }
        if (now > selectDefaultUntilMs || !DeepSeekCaptionHook.isYouTubeTimedTextUrl(url)) {
            return url;
        }
        if (TargetLanguage.fromUrl(url) != null) {
            selectDefaultUntilMs = 0L;
            defaultSelectionLogged = false;
            return url;
        }
        String code = DeepSeekConfig.defaultTargetLanguage(context);
        if (code.isEmpty()) return url;
        captionIntent = CaptionIntentPolicy.ON;
        clearNativeTrackAuthority();
        String rewritten = TargetLanguage.withCode(url, code);
        if (!defaultSelectionLogged) {
            defaultSelectionLogged = true;
            CaptionDiagnostics.mark(
                    context,
                    "DEFAULT_TARGET_SELECTED",
                    "字幕按钮默认启用 " + TargetLanguage.fromCode(code).promptLabel()
            );
        }
        return rewritten;
    }

    private static void beginNativeMenuOwnership(boolean armSelectionImmediately) {
        long now = SystemClock.uptimeMillis();
        synchronized (NATIVE_STATE_LOCK) {
            nativeMenuUntilMs = Math.max(nativeMenuUntilMs, now + NATIVE_MENU_WINDOW_MS);
            nativeMenuSelectionArmed = nativeMenuSelectionArmed || armSelectionImmediately;
            nativeMenuVideoId = currentVideoId;
            selectDefaultUntilMs = 0L;
            suppressDefaultUntilMs = Math.max(suppressDefaultUntilMs, nativeMenuUntilMs);
            defaultSelectionLogged = false;
            ignoreUiStateUntilMs = Math.max(ignoreUiStateUntilMs, now + 300L);

            if (armSelectionImmediately) {
                nativeMenuOpenedAtMs = now;
                nativeMenuExactBaselineGeneration = exactControllerGeneration;
                int baseline = nativeStateAtTouchDown;
                if (baseline != CaptionIntentPolicy.ON) {
                    View exact = exactCaptionButtonRef.get();
                    if (exact != null && exact.isAttachedToWindow()) {
                        int current = nativeCaptionState(exact);
                        if (current == CaptionIntentPolicy.ON) baseline = current;
                    }
                }
                if (baseline != CaptionIntentPolicy.ON &&
                        lastExactNativeState == CaptionIntentPolicy.ON) {
                    baseline = CaptionIntentPolicy.ON;
                }
                nativeMenuOpeningState = baseline == CaptionIntentPolicy.ON
                        ? CaptionIntentPolicy.ON : CaptionIntentPolicy.UNKNOWN;
            }
        }

        if (nativeMenuSelectionArmed) {
            MAIN.removeCallbacks(NATIVE_MENU_MONITOR);
            MAIN.postDelayed(NATIVE_MENU_MONITOR, 320L);
        }

        Activity activity = activityRef.get();
        if (activity != null) {
            CaptionDiagnostics.mark(
                    activity,
                    "NATIVE_CAPTION_MENU",
                    "CC 长按菜单获得选择权；原生字幕、关闭与自动翻译选项不再被默认 AI 逻辑覆盖"
            );
        }
    }

    /**
     * YouTube may rebuild the player controls while the native caption menu is open. The Off row
     * produces no Timed Text request, so the current CC control remains a useful fallback signal.
     * The exact controller hook is authoritative when available; this bounded resolver remains only
     * for compatibility with YouTube builds where the controller callback is delayed or absent.
     */
    private static View resolveCaptionButtonForNativeMenu() {
        View exact = exactCaptionButtonRef.get();
        if (exact instanceof ImageView && exact.isAttachedToWindow()) return exact;

        Activity activity = activityRef.get();
        if (activity == null || activity.isFinishing()) return null;
        View root = decor(activity);
        if (root == null || !root.isShown()) return null;

        int stableId = captionButtonViewId;
        if (stableId != View.NO_ID) {
            try {
                View candidate = root.findViewById(stableId);
                if (candidate instanceof ImageView && isCaptionButton(activity, candidate)) {
                    captionButtonRef = new WeakReference<>(candidate);
                    return candidate;
                }
            } catch (Throwable ignored) {
            }
        }

        View cached = captionButtonRef.get();
        if (cached instanceof ImageView && cached.isAttachedToWindow() &&
                isCaptionButton(activity, cached)) {
            return cached;
        }

        // Resource ids are normally stable. This bounded fallback is used only when YouTube has
        // replaced the control with an id-less variant during a user-opened menu.
        ArrayDeque<View> pending = new ArrayDeque<>();
        pending.add(root);
        int seen = 0;
        while (!pending.isEmpty() && seen++ < MAX_SCANNED_VIEWS) {
            View view = pending.removeFirst();
            if (view instanceof ImageView && isCaptionButton(activity, view)) {
                captionButtonRef = new WeakReference<>(view);
                int id = view.getId();
                if (id != View.NO_ID) captionButtonViewId = id;
                return view;
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) {
                    View child = group.getChildAt(i);
                    if (child != null) pending.addLast(child);
                }
            }
        }
        return null;
    }

    private static void scheduleScan(long delayMs) {
        final long token = scanGeneration;
        if (scanPosted) return;
        scanPosted = true;
        MAIN.postDelayed(() -> {
            scanPosted = false;
            if (token != scanGeneration) {
                scheduleScan(120L);
                return;
            }
            Activity activity = activityRef.get();
            if (activity == null || activity.isFinishing()) return;
            long now = SystemClock.uptimeMillis();
            if (now < transitionQuietUntilMs) {
                scheduleScan(Math.max(120L, transitionQuietUntilMs - now));
                return;
            }
            View root = decor(activity);
            if (root == null || !root.isShown()) return;
            try { scan(root); } catch (Throwable ignored) {}
        }, Math.max(0L, delayMs));
    }

    private static void scheduleMaintenance() {
        if (maintenancePosted) return;
        maintenancePosted = true;
        MAIN.postDelayed(MAINTENANCE, MAINTENANCE_SCAN_MS);
    }

    private static View decor(Activity activity) {
        return activity == null || activity.getWindow() == null
                ? null
                : activity.getWindow().getDecorView();
    }

    private static void scan(View root) {
        Activity activity = activityRef.get();
        if (activity == null || activity.isFinishing() || root == null || !root.isShown()) return;
        if (SystemClock.uptimeMillis() < transitionQuietUntilMs) return;

        ArrayDeque<View> pending = new ArrayDeque<>();
        pending.add(root);
        int seen = 0;
        while (!pending.isEmpty() && seen++ < MAX_SCANNED_VIEWS) {
            View view = pending.removeFirst();
            if (view instanceof ImageView && isCaptionButton(activity, view)) {
                hook(view);
                syncNativeCaptionState(view);
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) {
                    View child = group.getChildAt(i);
                    if (child != null) pending.addLast(child);
                }
            }
        }
    }

    private static void hook(View button) {
        captionButtonRef = new WeakReference<>(button);
        int id = button.getId();
        if (id != View.NO_ID) captionButtonViewId = id;
        if (HOOKED_BUTTONS.put(button, Boolean.TRUE) != null) return;
        button.setOnTouchListener((view, event) -> {
            if (event == null) return false;
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                long now = SystemClock.uptimeMillis();
                buttonTouchDown = true;
                buttonDownAtMs = now;
                longPressGesture = false;
                nativeMenuSelectionArmed = false;
                nativeMenuVideoId = "";
                nativeMenuOpeningState = CaptionIntentPolicy.UNKNOWN;
                nativeMenuOpenedAtMs = 0L;
                nativeMenuExactBaselineGeneration = exactControllerGeneration;
                MAIN.removeCallbacks(LONG_PRESS_ARM);
                MAIN.removeCallbacks(NATIVE_MENU_MONITOR);
                MAIN.postDelayed(LONG_PRESS_ARM, ViewConfiguration.getLongPressTimeout());

                intentBeforeTouch = captionIntent;
                int nativeState = nativeCaptionState(view);
                nativeStateAtTouchDown = nativeState;
                turnCaptionsOffOnTouchUp = CaptionIntentPolicy.shouldTurnOff(
                        DynamicCaptionController.isVisibleActive(),
                        nativeState,
                        captionIntent
                );
                ignoreUiStateUntilMs = Math.max(
                        ignoreUiStateUntilMs,
                        now + ViewConfiguration.getLongPressTimeout() + 250L
                );
            } else if (action == MotionEvent.ACTION_UP) {
                long now = SystemClock.uptimeMillis();
                buttonTouchDown = false;
                MAIN.removeCallbacks(LONG_PRESS_ARM);
                boolean wasLongPress = longPressGesture ||
                        now - buttonDownAtMs >= ViewConfiguration.getLongPressTimeout();

                if (wasLongPress) {
                    beginNativeMenuOwnership(true);
                    turnCaptionsOffOnTouchUp = false;
                    captionIntent = intentBeforeTouch;
                    ignoreUiStateUntilMs = now + 250L;
                    return false;
                }

                MAIN.removeCallbacks(NATIVE_MENU_MONITOR);
                nativeMenuSelectionArmed = false;
                nativeMenuUntilMs = 0L;
                nativeMenuVideoId = "";
                clearNativeMenuEvidenceLocked();
                if (turnCaptionsOffOnTouchUp) {
                    turnCaptionsOffOnTouchUp = false;
                    captionIntent = CaptionIntentPolicy.OFF;
                    CaptionChoice.toggle(false);
                    clearNativeTrackAuthority();
                    selectDefaultUntilMs = 0L;
                    suppressDefaultUntilMs = now + SELECTION_WINDOW_MS;
                    defaultSelectionLogged = false;
                    DynamicCaptionController.deactivateFromCaptionButton();
                } else {
                    captionIntent = CaptionIntentPolicy.ON;
                    CaptionChoice.toggle(true);
                    clearNativeTrackAuthority();
                    Activity activity = activityRef.get();
                    if (activity != null && DeepSeekConfig.load(activity).enabled &&
                            !DeepSeekConfig.defaultTargetLanguage(activity).isEmpty()) {
                        selectDefaultUntilMs = now + SELECTION_WINDOW_MS;
                        suppressDefaultUntilMs = 0L;
                        defaultSelectionLogged = false;
                    }
                }
            } else if (action == MotionEvent.ACTION_CANCEL) {
                boolean wasLongPress = longPressGesture;
                buttonTouchDown = false;
                MAIN.removeCallbacks(LONG_PRESS_ARM);
                turnCaptionsOffOnTouchUp = false;
                if (wasLongPress) {
                    beginNativeMenuOwnership(true);
                    captionIntent = intentBeforeTouch;
                    ignoreUiStateUntilMs = SystemClock.uptimeMillis() + 250L;
                } else {
                    MAIN.removeCallbacks(NATIVE_MENU_MONITOR);
                    captionIntent = intentBeforeTouch;
                    nativeMenuSelectionArmed = false;
                    nativeMenuUntilMs = 0L;
                    nativeMenuVideoId = "";
                    clearNativeMenuEvidenceLocked();
                    if (!DynamicCaptionController.isVisibleActive()) selectDefaultUntilMs = 0L;
                }
            }
            return false;
        });
    }

    /**
     * Checkable accessibility state is authoritative outside player transitions. During a guarded
     * transition the method is deliberately silent, because YouTube may temporarily rebuild the CC
     * control as unchecked while preserving the user's actual caption selection.
     */
    private static void syncNativeCaptionState(View button) {
        long now = SystemClock.uptimeMillis();
        if (now <= ignoreUiStateUntilMs || now < transitionQuietUntilMs) return;
        int state = nativeCaptionState(button);
        if (state == CaptionIntentPolicy.UNKNOWN) return;

        if (state == CaptionIntentPolicy.OFF) {
            commitNativeCaptionOff(
                    now <= nativeMenuUntilMs,
                    "已确认长按菜单关闭字幕；残余字幕请求不会重新开启原生轨"
            );
            return;
        }
        synchronized (NATIVE_STATE_LOCK) {
            captionIntent = state;
        }
    }

    private static void commitNativeCaptionOff(boolean fromNativeMenu, String detail) {
        long now = SystemClock.uptimeMillis();
        synchronized (NATIVE_STATE_LOCK) {
            captionIntent = CaptionIntentPolicy.OFF;
            clearNativeTrackAuthorityLocked();
            nativeMenuSelectionArmed = false;
            nativeMenuUntilMs = 0L;
            nativeMenuVideoId = "";
            selectDefaultUntilMs = 0L;
            suppressDefaultUntilMs = Math.max(
                    suppressDefaultUntilMs,
                    now + SELECTION_WINDOW_MS
            );
            clearNativeMenuEvidenceLocked();
            defaultSelectionLogged = false;
        }

        MAIN.removeCallbacks(NATIVE_MENU_MONITOR);
        DynamicCaptionController.deactivateFromNativeCaptionState();
        Activity activity = activityRef.get();
        if (fromNativeMenu && activity != null) {
            CaptionDiagnostics.mark(
                    activity,
                    "NATIVE_CAPTION_OFF",
                    detail == null || detail.trim().isEmpty()
                            ? "已确认长按菜单关闭字幕；AI 字幕同步关闭"
                            : detail.trim()
            );
        }
    }

    private static boolean isNativeTrackSelectedForCurrentVideo() {
        synchronized (NATIVE_STATE_LOCK) {
            return isNativeTrackSelectedForCurrentVideoLocked();
        }
    }

    private static boolean isNativeTrackSelectedForCurrentVideoLocked() {
        return nativeTrackSelected && nativeTrackVideoId.equals(currentVideoId);
    }

    private static void clearNativeTrackAuthority() {
        synchronized (NATIVE_STATE_LOCK) {
            clearNativeTrackAuthorityLocked();
        }
    }

    private static void clearNativeTrackAuthorityLocked() {
        nativeTrackSelected = false;
        nativeTrackVideoId = "";
    }

    private static void clearNativeMenuEvidenceLocked() {
        nativeMenuOpenedAtMs = 0L;
        nativeMenuExactBaselineGeneration = exactControllerGeneration;
        nativeMenuOpeningState = CaptionIntentPolicy.UNKNOWN;
        nativeStateAtTouchDown = CaptionIntentPolicy.UNKNOWN;
    }

    private static String requestVideoId(String url) {
        try {
            Uri uri = Uri.parse(url);
            String value = uri.getQueryParameter("v");
            if (value == null || value.isEmpty()) value = uri.getQueryParameter("video_id");
            return value == null ? "" : value.trim();
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static int nativeCaptionState(View view) {
        AccessibilityNodeInfo node = null;
        try {
            node = view.createAccessibilityNodeInfo();
            if (node != null && node.isCheckable()) {
                return node.isChecked() ? CaptionIntentPolicy.ON : CaptionIntentPolicy.OFF;
            }
        } catch (Throwable ignored) {
        } finally {
            if (node != null) node.recycle();
        }

        String description = "";
        CharSequence raw = view.getContentDescription();
        if (raw != null) description = raw.toString().trim().toLowerCase(Locale.ROOT);
        if (!description.isEmpty()) {
            int described = CaptionIntentPolicy.fromDescription(description);
            if (described != CaptionIntentPolicy.UNKNOWN) return described;
        }
        if (view.isActivated() || view.isSelected()) return CaptionIntentPolicy.ON;
        return CaptionIntentPolicy.UNKNOWN;
    }

    private static boolean isCaptionButton(Activity activity, View view) {
        if (!view.isShown() || !view.isClickable()) return false;
        try {
            int id = view.getId();
            if (id != View.NO_ID) {
                String name = activity.getResources().getResourceEntryName(id)
                        .toLowerCase(Locale.ROOT);
                if (name.contains("caption") || name.contains("subtitle")) return true;
            }
        } catch (Throwable ignored) {
        }

        CharSequence descriptionValue = view.getContentDescription();
        if (descriptionValue == null) return false;
        String description = descriptionValue.toString().trim().toLowerCase(Locale.ROOT);
        if (description.isEmpty()) return false;
        if (description.contains("caption") || description.contains("subtitle") ||
                description.contains("字幕")) {
            return true;
        }
        for (String label : localizedLabels) {
            if (!label.isEmpty() && description.contains(label)) return true;
        }
        return false;
    }

    private static List<String> captionLabels(Context context) {
        Resources resources = context.getResources();
        String packageName = context.getPackageName();
        String[] names = {
                "accessibility_captions_button_name",
                "accessibility_captions_unavailable",
                "accessibility_captions_on",
                "accessibility_captions_off"
        };
        List<String> labels = new ArrayList<>();
        for (String name : names) {
            try {
                int id = resources.getIdentifier(name, "string", packageName);
                if (id == 0) continue;
                String value = resources.getString(id).trim().toLowerCase(Locale.ROOT);
                if (!value.isEmpty()) labels.add(value);
            } catch (Throwable ignored) {
            }
        }
        return Collections.unmodifiableList(labels);
    }
}
