package app.yydarlinker.aicaptions.host;

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
import java.util.Locale;
import java.util.WeakHashMap;

/** Observes native CC after controller updates, without consuming the native menu gesture. */
final class CaptionButton {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<View, Boolean> hooked = new WeakHashMap<>();
    private static WeakReference<View> exact = new WeakReference<>(null);
    private static long quietUntil, offQuietUntil, menuUntil, downAt, owner;
    private static boolean menuOpenedOn, exactAfterMenu, confirmUnknown, findPending;
    private static int atDown = NativeCaptionBridge.UNKNOWN;
    private static final Runnable READ = CaptionButton::readSettled;
    private static final Runnable FIND = CaptionButton::findInPlayer;

    private CaptionButton() {}

    static void resetVisit() {
        MAIN.removeCallbacks(READ);
        MAIN.removeCallbacks(FIND);
        exact.clear();
        quietUntil = offQuietUntil = menuUntil = downAt = 0;
        menuOpenedOn = exactAfterMenu = confirmUnknown = findPending = false;
        atDown = NativeCaptionBridge.UNKNOWN;
    }

    static void observe(ImageView button) {
        if (!current(button)) return;
        bind(button);
        exactAfterMenu = menuOpenedOn;
        confirmUnknown = false;
        scheduleRead(0);
    }

    static void playerUnsettled() {
        quietUntil = SystemClock.uptimeMillis() + 4500;
        menuOpenedOn = exactAfterMenu = confirmUnknown = false;
    }

    static void playerStable() {
        long now = SystemClock.uptimeMillis();
        if (quietUntil > now && NativeCaptionBridge.ccState() == NativeCaptionBridge.ON)
            offQuietUntil = now + 900;
        quietUntil = now;
        if (current(exact.get())) scheduleRead(16);
    }

    static void findCurrent() {
        if (current(exact.get())) scheduleRead(0);
        else if (!findPending) {
            findPending = true;
            MAIN.postDelayed(FIND, 160);
        }
    }

    private static void findInPlayer() {
        findPending = false;
        if (!AiCaptionHook.enabled() || CaptionSurface.isShorts()) return;
        View root = CaptionSurface.player();
        android.app.Activity activity = CaptionPlayer.activity();
        if (root == null && activity != null) root = activity.getWindow().getDecorView();
        if (root == null) return;
        ArrayDeque<View> pending = new ArrayDeque<>();
        pending.add(root);
        for (int seen = 0; !pending.isEmpty() && seen < 900; seen++) {
            View view = pending.remove();
            if (view instanceof ImageView && view.isShown() && view.isClickable()
                    && looksLikeCc(view)) {
                bind(view);
                scheduleRead(0);
                return;
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) pending.add(group.getChildAt(i));
            }
        }
    }

    private static boolean looksLikeCc(View view) {
        if (view.getId() != View.NO_ID) {
            try {
                String name = view.getResources().getResourceEntryName(view.getId());
                if (name.contains("caption") || name.contains("subtitle")) return true;
            } catch (RuntimeException noResourceName) {
                // An unnamed control can still expose a native accessibility description.
            }
        }
        String text = description(view);
        return text.contains("caption") || text.contains("subtitle") || text.contains("字幕");
    }

    private static void bind(View button) {
        exact = new WeakReference<>(button);
        owner = CaptionPlayer.ownerEpoch();
        if (hooked.put(button, Boolean.TRUE) == null) button.setOnTouchListener(CaptionButton::touch);
    }

    private static boolean touch(View button, MotionEvent event) {
        if (!AiCaptionHook.enabled() || !current(button) || button != exact.get()) return false;
        long now = SystemClock.uptimeMillis();
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            downAt = now;
            atDown = state(button);
            if (atDown == NativeCaptionBridge.UNKNOWN) atDown = NativeCaptionBridge.ccState();
            menuOpenedOn = exactAfterMenu = false;
        } else if ((action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) && downAt != 0) {
            if (now - downAt >= ViewConfiguration.getLongPressTimeout()) {
                menuOpenedOn = atDown == NativeCaptionBridge.ON;
                menuUntil = now + 30000;
                quietUntil = Math.max(quietUntil, now + 310);
            } else if (action == MotionEvent.ACTION_UP && atDown == NativeCaptionBridge.ON) {
                CaptionSession.onCcState(NativeCaptionBridge.OFF);
            }
            downAt = 0;
        }
        return false;
    }

    private static void scheduleRead(long delay) {
        MAIN.removeCallbacks(READ);
        MAIN.postDelayed(READ, delay);
    }

    private static boolean current(View button) {
        android.app.Activity activity = CaptionPlayer.activity();
        return button != null && activity != null && !activity.isFinishing()
                && button.isAttachedToWindow() && button.getRootView() == activity.getWindow().getDecorView()
                && !CaptionSurface.isShorts();
    }

    private static void readSettled() {
        View button = exact.get();
        if (!AiCaptionHook.enabled() || owner != CaptionPlayer.ownerEpoch() || !current(button)) return;
        int state = state(button);
        long now = SystemClock.uptimeMillis();
        long after = state == NativeCaptionBridge.ON ? quietUntil : Math.max(quietUntil, offQuietUntil);
        if (now < after) {
            scheduleRead(after - now);
            return;
        }
        if (state == NativeCaptionBridge.UNKNOWN && exactAfterMenu && now < menuUntil) {
            if (!confirmUnknown) {
                confirmUnknown = true;
                scheduleRead(90);
                return;
            }
            state = NativeCaptionBridge.OFF;
        }
        exactAfterMenu = confirmUnknown = false;
        if (state == NativeCaptionBridge.OFF) menuOpenedOn = false;
        if (state != NativeCaptionBridge.UNKNOWN) CaptionSession.onCcState(state);
    }

    private static int state(View view) {
        AccessibilityNodeInfo node = null;
        try {
            node = view.createAccessibilityNodeInfo();
            if (node != null && node.isCheckable())
                return node.isChecked() ? NativeCaptionBridge.ON : NativeCaptionBridge.OFF;
        } catch (RuntimeException unavailable) {
            // The description can still be read if the native accessibility node was replaced.
        } finally {
            if (node != null) node.recycle();
        }
        String label = description(view);
        if (contains(label, "turn off", "disable captions", "captions on", "captions enabled",
                "关闭字幕", "關閉字幕", "字幕开启", "字幕開啟", "字幕已开启", "字幕已開啟",
                "字幕をオフ", "자막 사용 중지")) return NativeCaptionBridge.ON;
        if (contains(label, "turn on", "enable captions", "captions off", "captions disabled",
                "字幕关闭", "字幕關閉", "字幕已关闭", "字幕已關閉", "开启字幕", "開啟字幕",
                "打开字幕", "字幕をオン")) return NativeCaptionBridge.OFF;
        return view.isActivated() || view.isSelected() ? NativeCaptionBridge.ON : NativeCaptionBridge.UNKNOWN;
    }

    private static String description(View view) {
        CharSequence label = view.getContentDescription();
        return label == null ? "" : label.toString().trim().toLowerCase(Locale.ROOT);
    }

    private static boolean contains(String label, String... phrases) {
        for (String phrase : phrases) if (label.contains(phrase)) return true;
        return false;
    }
}
