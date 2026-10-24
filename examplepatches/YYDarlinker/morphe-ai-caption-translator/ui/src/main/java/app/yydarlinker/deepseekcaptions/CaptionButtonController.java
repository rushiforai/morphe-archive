package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
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
import java.util.function.Predicate;

/**
 * Follows YouTube's native caption controls without stealing the long-press caption menu.
 *
 * <p>Short tap and long press are intentionally different authorities. A short tap turns the
 * native caption selection on/off; the language is whatever YouTube selected. A long press belongs
 * entirely to YouTube: source-language captions, Off, and any other native track selection must
 * remain functional. The controller also stays off the Activity's global-layout hot path so player
 * animations remain uncontended.
 */
final class CaptionButtonController {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long NATIVE_MENU_WINDOW_MS = 30_000L;
    private static final long NATIVE_MENU_MONITOR_MS = 160L;
    private static final long EXACT_MENU_MIN_ACTION_MS = 220L;
    private static final long EXACT_MENU_OFF_CONFIRM_MS = 90L;
    private static final long PLAYER_TRANSITION_QUIET_MS = 4_500L;
    private static final long MAINTENANCE_SCAN_MS = 2_500L;
    private static final int MAX_SCANNED_VIEWS = 1_800;

    private static final Map<View, Boolean> HOOKED_BUTTONS =
            Collections.synchronizedMap(new WeakHashMap<>());

    /** Serializes menu selection, native-track authority and OFF so stale requests cannot win. */
    private static final Object NATIVE_STATE_LOCK = new Object();

    private static volatile WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static volatile WeakReference<View> captionButtonRef = new WeakReference<>(null);
    private static volatile WeakReference<View> exactCaptionButtonRef = new WeakReference<>(null);
    private static volatile int captionButtonViewId = View.NO_ID;
    private static volatile long ignoreUiStateUntilMs;
    private static volatile long transitionQuietUntilMs;
    private static volatile long nativeMenuUntilMs;
    private static volatile long nativeMenuOpenedAtMs;
    private static volatile long exactControllerGeneration;
    private static volatile long nativeMenuExactBaselineGeneration;
    private static volatile long scanGeneration;
    private static volatile boolean scanPosted;
    private static volatile boolean maintenancePosted;
    private static volatile boolean turnCaptionsOffOnTouchUp;
    private static volatile boolean buttonTouchDown;
    private static volatile boolean longPressGesture;
    private static volatile boolean nativeMenuSelectionArmed;
    private static volatile long buttonDownAtMs;
    private static volatile int nativeStateAtTouchDown = CaptionIntentPolicy.UNKNOWN;
    private static volatile int nativeMenuOpeningState = CaptionIntentPolicy.UNKNOWN;
    private static volatile int lastExactNativeState = CaptionIntentPolicy.UNKNOWN;
    private static volatile String currentVideoId = "";
    private static volatile List<String> localizedLabels = Collections.emptyList();

    private static final Runnable LONG_PRESS_ARM =
            () -> {
                if (!buttonTouchDown) return;
                longPressGesture = true;
                beginNativeMenuOwnership(false);
            };

    private static final Runnable NATIVE_MENU_MONITOR =
            new Runnable() {
                @Override
                public void run() {
                    if (!menuWatched()) return;
                    long now = SystemClock.uptimeMillis();
                    if (now >= transitionQuietUntilMs && now > ignoreUiStateUntilMs) {
                        View button = resolveCaptionButtonForNativeMenu();
                        if (button != null && button.isAttachedToWindow()) {
                            try {
                                syncNativeCaptionState(button);
                            } catch (Throwable ignored) {
                                // The monitor only observes; a broken view must not stop it.
                            }
                        }
                    }
                    if (menuWatched()) MAIN.postDelayed(this, NATIVE_MENU_MONITOR_MS);
                }
            };

    private static final Runnable MAINTENANCE =
            () -> {
                maintenancePosted = false;
                Activity activity = activityRef.get();
                if (activity == null || activity.isFinishing()) return;
                if (SystemClock.uptimeMillis() >= transitionQuietUntilMs) scanIfShown(activity);
                scheduleMaintenance();
            };

    private CaptionButtonController() {}

    private static boolean menuWatched() {
        return SystemClock.uptimeMillis() <= nativeMenuUntilMs && nativeMenuSelectionArmed;
    }

    // ---- Events from the host ----

    static void install(Activity activity) {
        if (activity == null) return;
        activityRef = new WeakReference<>(activity);
        localizedLabels = captionLabels(activity);
        if (decor(activity) == null) return;
        if (CaptionActions.isVisibleActive()) ignoreFor(1_200L);
        scheduleScan(80L);
        scheduleMaintenance();
    }

    static void onVideoId(String videoId) {
        String clean = videoId == null ? "" : videoId.trim();
        if (!clean.equals(currentVideoId)) {
            synchronized (NATIVE_STATE_LOCK) {
                currentVideoId = clean;
                turnCaptionsOffOnTouchUp = false;
                buttonTouchDown = false;
                longPressGesture = false;
                endNativeMenu();
                lastExactNativeState = CaptionIntentPolicy.UNKNOWN;
            }
            MAIN.removeCallbacks(LONG_PRESS_ARM);
            MAIN.removeCallbacks(NATIVE_MENU_MONITOR);
        }
        scheduleScan(220L);
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
        exactCaptionButtonRef = new WeakReference<>(button);
        final long generation = ++exactControllerGeneration;
        MAIN.post(() -> observeExactCaptionControllerAfterUpdate(button, generation));
    }

    static void noteAiTrackSelected() {
        ignoreUiStateUntilMs = SystemClock.uptimeMillis() + 700L;
        synchronized (NATIVE_STATE_LOCK) {
            endNativeMenu();
        }
        MAIN.removeCallbacks(NATIVE_MENU_MONITOR);
    }

    /**
     * Arms a quiet window around any player-shape transition. A transient CC accessibility OFF
     * state during rotation/fullscreen is not a user command and must not deactivate the AI track.
     *
     * <p>The window suppresses projection writes only. The session intent is applied by
     * {@link CaptionSessionReconciler} on its own player tick; no transition may gate that.
     */
    static void onPlayerTransition(String rawType) {
        long now = SystemClock.uptimeMillis();
        transitionQuietUntilMs = Math.max(transitionQuietUntilMs, now + PLAYER_TRANSITION_QUIET_MS);
        scanGeneration++;
        synchronized (NATIVE_STATE_LOCK) {
            clearNativeMenuEvidence();
            lastExactNativeState = CaptionIntentPolicy.UNKNOWN;
        }
        if (CaptionActions.isVisibleActive()) ignoreFor(PLAYER_TRANSITION_QUIET_MS);
    }

    /** Called only after the read-only player-geometry probe has observed a stable player. */
    static void onPlayerStable() {
        transitionQuietUntilMs = SystemClock.uptimeMillis();
        if (CaptionActions.isVisibleActive()) ignoreFor(900L);
        scheduleScan(120L);
    }

    // ---- The exact controller: YouTube's own report of the CC state ----

    private static void observeExactCaptionControllerAfterUpdate(View button, long generation) {
        if (button == null
                || !button.isAttachedToWindow()
                || button != exactCaptionButtonRef.get()
                || generation != exactControllerGeneration) return;
        long now = SystemClock.uptimeMillis();
        int state = nativeCaptionState(button);

        // Player transitions remain absolute authority: do not learn or act on transient CC states
        // while controls are being rebuilt. A real menu event is kept by checking the same final
        // controller state once the already-existing quiet window expires.
        if (now < transitionQuietUntilMs) {
            if (menuWatched())
                scheduleExactControllerRecheck(
                        button, generation, transitionQuietUntilMs - now + 16L);
            return;
        }
        if (state == CaptionIntentPolicy.ON) {
            lastExactNativeState = CaptionIntentPolicy.ON;
            if (now > ignoreUiStateUntilMs) syncNativeCaptionState(button);
            return;
        }
        boolean menuCandidate = menuCandidate(generation);
        if (now <= ignoreUiStateUntilMs) {
            if (menuCandidate)
                scheduleExactControllerRecheck(
                        button, generation, ignoreUiStateUntilMs - now + 16L);
            return;
        }
        if (state == CaptionIntentPolicy.OFF) {
            lastExactNativeState = CaptionIntentPolicy.OFF;
            if (menuCandidate)
                commitNativeCaptionOff(
                        true,
                        "Actual CC controller explicitly reported captions off; AI captions"
                                + " switched off too");
            else syncNativeCaptionState(button);
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
                () -> confirmUnknownOffFromExactController(generation), EXACT_MENU_OFF_CONFIRM_MS);
    }

    /**
     * Is [generation] an update of the CC controller inside a menu opened while captions were on?
     */
    private static boolean menuCandidate(long generation) {
        return CaptionActions.isVisibleActive()
                && menuWatched()
                && nativeMenuOpeningState == CaptionIntentPolicy.ON
                && generation > nativeMenuExactBaselineGeneration;
    }

    private static void scheduleExactControllerRecheck(View button, long generation, long delayMs) {
        MAIN.postDelayed(
                () -> {
                    if (generation == exactControllerGeneration)
                        observeExactCaptionControllerAfterUpdate(button, generation);
                },
                Math.max(16L, delayMs));
    }

    private static void confirmUnknownOffFromExactController(long generation) {
        long now = SystemClock.uptimeMillis();
        if (generation != exactControllerGeneration
                || now <= ignoreUiStateUntilMs
                || now < transitionQuietUntilMs
                || !menuCandidate(generation)) return;
        View button = exactCaptionButtonRef.get();
        if (button == null || !button.isAttachedToWindow()) return;

        int state = nativeCaptionState(button);
        if (state == CaptionIntentPolicy.ON) {
            lastExactNativeState = CaptionIntentPolicy.ON;
            return;
        }
        if (state == CaptionIntentPolicy.OFF) {
            lastExactNativeState = CaptionIntentPolicy.OFF;
            commitNativeCaptionOff(
                    true,
                    "Actual CC controller explicitly reported captions off; AI captions switched"
                            + " off too");
            return;
        }
        if (lastExactNativeState != CaptionIntentPolicy.ON) return;
        // Some current YouTube builds visually switch the CC icon to Off but expose neither a
        // checkable node nor an OFF content description. The exact controller event, a definite
        // pre-menu ON state, an armed menu transaction, a quiet player and a second stable UNKNOWN
        // observation keep ordinary player rebuilds and menu dismissal from reading as Off.
        commitNativeCaptionOff(
                true,
                "Actual CC controller confirmed long-press menu switched captions off; AI captions"
                        + " switched off too");
    }

    // ---- The native long-press menu ----

    private static void beginNativeMenuOwnership(boolean armSelectionImmediately) {
        long now = SystemClock.uptimeMillis();
        synchronized (NATIVE_STATE_LOCK) {
            nativeMenuUntilMs = Math.max(nativeMenuUntilMs, now + NATIVE_MENU_WINDOW_MS);
            nativeMenuSelectionArmed = nativeMenuSelectionArmed || armSelectionImmediately;
            ignoreUiStateUntilMs = Math.max(ignoreUiStateUntilMs, now + 300L);
            if (armSelectionImmediately) {
                nativeMenuOpenedAtMs = now;
                nativeMenuExactBaselineGeneration = exactControllerGeneration;
                nativeMenuOpeningState = stateBeforeMenu();
            }
        }
        if (nativeMenuSelectionArmed) {
            MAIN.removeCallbacks(NATIVE_MENU_MONITOR);
            MAIN.postDelayed(NATIVE_MENU_MONITOR, 320L);
        }
        Activity activity = activityRef.get();
        if (activity != null)
            CaptionDiagnostics.mark(
                    activity,
                    "NATIVE_CAPTION_MENU",
                    "CC long-press menu has selection authority; default AI behavior no longer"
                            + " overrides native, off, or automatic translation");
    }

    /** ON only when captions were definitely on before the menu opened, else UNKNOWN. */
    private static int stateBeforeMenu() {
        if (nativeStateAtTouchDown == CaptionIntentPolicy.ON
                || lastExactNativeState == CaptionIntentPolicy.ON) return CaptionIntentPolicy.ON;
        View exact = exactCaptionButtonRef.get();
        boolean exactOn =
                exact != null
                        && exact.isAttachedToWindow()
                        && nativeCaptionState(exact) == CaptionIntentPolicy.ON;
        return exactOn ? CaptionIntentPolicy.ON : CaptionIntentPolicy.UNKNOWN;
    }

    /**
     * YouTube may rebuild the player controls while the native caption menu is open. The Off row
     * produces no Timed Text request, so the current CC control remains a useful fallback signal.
     * The exact controller hook is authoritative when available; this bounded resolver remains only
     * for YouTube builds where the controller callback is delayed or absent.
     */
    private static View resolveCaptionButtonForNativeMenu() {
        View exact = exactCaptionButtonRef.get();
        if (exact instanceof ImageView && exact.isAttachedToWindow()) return exact;

        Activity activity = activityRef.get();
        if (activity == null || activity.isFinishing()) return null;
        View root = decor(activity);
        if (root == null || !root.isShown()) return null;

        if (captionButtonViewId != View.NO_ID) {
            try {
                View candidate = root.findViewById(captionButtonViewId);
                if (candidate instanceof ImageView && isCaptionButton(activity, candidate)) {
                    captionButtonRef = new WeakReference<>(candidate);
                    return candidate;
                }
            } catch (Throwable ignored) {
                // Fall through to the cached and the scanned candidates.
            }
        }
        View cached = captionButtonRef.get();
        if (cached instanceof ImageView
                && cached.isAttachedToWindow()
                && isCaptionButton(activity, cached)) return cached;

        // Resource ids are normally stable. This bounded fallback is used only when YouTube has
        // replaced the control with an id-less variant during a user-opened menu.
        View[] found = new View[1];
        walk(
                root,
                view -> {
                    if (!(view instanceof ImageView) || !isCaptionButton(activity, view))
                        return false;
                    found[0] = view;
                    captionButtonRef = new WeakReference<>(view);
                    if (view.getId() != View.NO_ID) captionButtonViewId = view.getId();
                    return true;
                });
        return found[0];
    }

    // ---- Scanning for the button ----

    private static void scheduleScan(long delayMs) {
        final long token = scanGeneration;
        if (scanPosted) return;
        scanPosted = true;
        MAIN.postDelayed(
                () -> {
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
                    scanIfShown(activity);
                },
                Math.max(0L, delayMs));
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

    private static void scanIfShown(Activity activity) {
        View root = decor(activity);
        if (root == null || !root.isShown()) return;
        try {
            // Every caption button found is hooked and its state read.
            walk(
                    root,
                    view -> {
                        if (view instanceof ImageView && isCaptionButton(activity, view)) {
                            hook(view);
                            syncNativeCaptionState(view);
                        }
                        return false;
                    });
        } catch (Throwable ignored) {
            // A broken view tree is retried by the next maintenance pass.
        }
    }

    /** Breadth-first walk of at most {@link #MAX_SCANNED_VIEWS} views; [visitor] true stops. */
    private static void walk(View root, Predicate<View> visitor) {
        ArrayDeque<View> pending = new ArrayDeque<>();
        pending.add(root);
        for (int seen = 0; !pending.isEmpty() && seen < MAX_SCANNED_VIEWS; seen++) {
            View view = pending.removeFirst();
            if (visitor.test(view)) return;
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) {
                    View child = group.getChildAt(i);
                    if (child != null) pending.addLast(child);
                }
            }
        }
    }

    // ---- The touch gesture ----

    private static void hook(View button) {
        captionButtonRef = new WeakReference<>(button);
        if (button.getId() != View.NO_ID) captionButtonViewId = button.getId();
        if (HOOKED_BUTTONS.put(button, Boolean.TRUE) != null) return;
        button.setOnTouchListener(
                (view, event) -> {
                    if (event == null) return false;
                    switch (event.getActionMasked()) {
                        case MotionEvent.ACTION_DOWN:
                            onButtonDown(view);
                            break;
                        case MotionEvent.ACTION_UP:
                            onButtonUp();
                            break;
                        case MotionEvent.ACTION_CANCEL:
                            onButtonCancel();
                            break;
                        default:
                            break;
                    }
                    return false;
                });
    }

    private static void onButtonDown(View view) {
        long now = SystemClock.uptimeMillis();
        int longPress = ViewConfiguration.getLongPressTimeout();
        buttonTouchDown = true;
        buttonDownAtMs = now;
        longPressGesture = false;
        nativeMenuSelectionArmed = false;
        nativeMenuOpeningState = CaptionIntentPolicy.UNKNOWN;
        nativeMenuOpenedAtMs = 0L;
        nativeMenuExactBaselineGeneration = exactControllerGeneration;
        MAIN.removeCallbacks(LONG_PRESS_ARM);
        MAIN.removeCallbacks(NATIVE_MENU_MONITOR);
        MAIN.postDelayed(LONG_PRESS_ARM, longPress);

        nativeStateAtTouchDown = nativeCaptionState(view);
        turnCaptionsOffOnTouchUp =
                CaptionIntentPolicy.shouldTurnOff(
                        CaptionActions.isVisibleActive(),
                        nativeStateAtTouchDown,
                        CaptionNativeProjection.ccState());
        ignoreUiStateUntilMs = Math.max(ignoreUiStateUntilMs, now + longPress + 250L);
    }

    private static void onButtonUp() {
        long now = SystemClock.uptimeMillis();
        buttonTouchDown = false;
        MAIN.removeCallbacks(LONG_PRESS_ARM);
        if (longPressGesture || now - buttonDownAtMs >= ViewConfiguration.getLongPressTimeout()) {
            // The long press belongs to YouTube's menu: it owns the selection that follows.
            beginNativeMenuOwnership(true);
            turnCaptionsOffOnTouchUp = false;
            ignoreUiStateUntilMs = now + 250L;
            return;
        }
        MAIN.removeCallbacks(NATIVE_MENU_MONITOR);
        endNativeMenu();
        if (turnCaptionsOffOnTouchUp) {
            turnCaptionsOffOnTouchUp = false;
            // A tap on the CC control is a user act: it is the one place where turning the control
            // off also writes the session intent off.
            CaptionActions.deactivateByUser();
            return;
        }
        // Tapping the control on asks for the captions the user already intended, if any.
        CaptionSessionReconciler.onUserActivated(activityRef.get());
    }

    private static void onButtonCancel() {
        boolean wasLongPress = longPressGesture;
        buttonTouchDown = false;
        MAIN.removeCallbacks(LONG_PRESS_ARM);
        turnCaptionsOffOnTouchUp = false;
        if (wasLongPress) {
            beginNativeMenuOwnership(true);
            ignoreUiStateUntilMs = SystemClock.uptimeMillis() + 250L;
            return;
        }
        MAIN.removeCallbacks(NATIVE_MENU_MONITOR);
        endNativeMenu();
    }

    // ---- State ----

    private static void ignoreFor(long ms) {
        ignoreUiStateUntilMs = Math.max(ignoreUiStateUntilMs, SystemClock.uptimeMillis() + ms);
    }

    /** The menu transaction is over: nothing about it may be acted on any more. */
    private static void endNativeMenu() {
        nativeMenuSelectionArmed = false;
        nativeMenuUntilMs = 0L;
        clearNativeMenuEvidence();
    }

    private static void clearNativeMenuEvidence() {
        nativeMenuOpenedAtMs = 0L;
        nativeMenuExactBaselineGeneration = exactControllerGeneration;
        nativeMenuOpeningState = CaptionIntentPolicy.UNKNOWN;
        nativeStateAtTouchDown = CaptionIntentPolicy.UNKNOWN;
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
                    "Long-press menu confirmed captions off; pending caption requests cannot"
                            + " reenable the native track");
            return;
        }
        boolean becameOn = CaptionNativeProjection.ccState() != CaptionIntentPolicy.ON;
        CaptionNativeProjection.ccState(CaptionIntentPolicy.ON);
        // The control being on is an observation: it lets a deferred session intent be applied,
        // but it never writes one.
        if (becameOn)
            CaptionSessionReconciler.onObservation(
                    activityRef.get(), "cc_on", CaptionPlayerAuthority.ownerEpoch());
    }

    /**
     * The CC control reads Off. That is a projection of the native control, never a user command:
     * it writes no session intent and does not stop the AI overlay by itself. The real command is a
     * selection made inside the caption menu, which reaches the reconciler as an explicit native
     * selection.
     */
    private static void commitNativeCaptionOff(boolean fromNativeMenu, String detail) {
        synchronized (NATIVE_STATE_LOCK) {
            CaptionNativeProjection.ccState(CaptionIntentPolicy.OFF);
            endNativeMenu();
        }
        MAIN.removeCallbacks(NATIVE_MENU_MONITOR);
        Activity activity = activityRef.get();
        if (fromNativeMenu && activity != null)
            CaptionDiagnostics.mark(activity, "NATIVE_CAPTION_OFF", detail);
    }

    // ---- Reading the button ----

    private static int nativeCaptionState(View view) {
        AccessibilityNodeInfo node = null;
        try {
            node = view.createAccessibilityNodeInfo();
            if (node != null && node.isCheckable())
                return node.isChecked() ? CaptionIntentPolicy.ON : CaptionIntentPolicy.OFF;
        } catch (Throwable ignored) {
            // Fall back to the description below.
        } finally {
            if (node != null) node.recycle();
        }
        CharSequence raw = view.getContentDescription();
        if (raw != null) {
            int described = CaptionIntentPolicy.fromDescription(raw.toString());
            if (described != CaptionIntentPolicy.UNKNOWN) return described;
        }
        return view.isActivated() || view.isSelected()
                ? CaptionIntentPolicy.ON
                : CaptionIntentPolicy.UNKNOWN;
    }

    private static boolean isCaptionButton(Activity activity, View view) {
        if (!view.isShown() || !view.isClickable()) return false;
        try {
            if (view.getId() != View.NO_ID) {
                String name =
                        activity.getResources()
                                .getResourceEntryName(view.getId())
                                .toLowerCase(Locale.ROOT);
                if (name.contains("caption") || name.contains("subtitle")) return true;
            }
        } catch (Throwable ignored) {
            // A view without a resource entry is judged by its description.
        }
        CharSequence value = view.getContentDescription();
        if (value == null) return false;
        String description = value.toString().trim().toLowerCase(Locale.ROOT);
        if (description.isEmpty()) return false;
        if (description.contains("caption")
                || description.contains("subtitle")
                || description.contains("字幕")) return true;
        for (String label : localizedLabels)
            if (!label.isEmpty() && description.contains(label)) return true;
        return false;
    }

    private static List<String> captionLabels(Context context) {
        Resources resources = context.getResources();
        String[] names = {
            "accessibility_captions_button_name",
            "accessibility_captions_unavailable",
            "accessibility_captions_on",
            "accessibility_captions_off"
        };
        List<String> labels = new ArrayList<>();
        for (String name : names) {
            try {
                int id = resources.getIdentifier(name, "string", context.getPackageName());
                if (id == 0) continue;
                String value = resources.getString(id).trim().toLowerCase(Locale.ROOT);
                if (!value.isEmpty()) labels.add(value);
            } catch (Throwable ignored) {
                // A label this YouTube build does not have.
            }
        }
        return Collections.unmodifiableList(labels);
    }
}
