/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.navigation;

import android.annotation.TargetApi;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;

import java.lang.reflect.Field;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.pinedrama.settings.L10n;
import app.morphe.extension.pinedrama.settings.PineDramaActivityHook;

/**
 * A long press on any tab in the strip across the top of PineDrama's home screen opens HushPine's
 * settings. The other Hush packages open theirs from the app's logo, and PineDrama's feed shows
 * none. Which tabs the strip holds is up to the server (Short Video and AI fiction have taken turns
 * in the same spot on one install), so the shortcut isn't tied to any one of them.
 *
 * <p>The settings patch hands over every top tab PineDrama binds, with the tag of the tab it shows
 * ({@link #onTopTab}). PineDrama's top tab takes its tap in its own performClick (switch to the tab,
 * or reload it when it's open) and has no long press or touch listener of its own. The press
 * is timed by a touch listener: every touch still reaches the tab as it did, so a tap is PineDrama's,
 * and a press held for the phone's long-press time opens the settings with the long-press
 * vibration. The rest of that touch is kept from the tab, so letting go doesn't also reload the
 * feed.
 *
 * <p>TalkBack can't time a press, so each tab also carries a named action, Open HushPine settings,
 * in the actions TalkBack lists for it ({@link OpenAction}).
 *
 * <p>No switch reads this, so Pause leaves it working: it's a way back to the switch that resumes
 * HushPine. A tab PineDrama makes long-clickable keeps its own long press.
 */
public final class TopTabSettingsShortcut {
    /** The timer on each top tab, so a tab bound again keeps the one it has. */
    private static final Map<View, Press> PRESSES = new WeakHashMap<>();

    private TopTabSettingsShortcut() {
    }

    /**
     * Injected where PineDrama's top tab strip finishes binding a tab's view, with the tag of the tab
     * it now shows. PineDrama reuses these views, so the tag only goes in the log.
     */
    public static void onTopTab(View tab, String tag) {
        try {
            if (tab == null) return;
            Logger.printInfo(() -> "A long press on the top tab " + tag + " opens HushPine settings");
            synchronized (PRESSES) {
                if (!PRESSES.containsKey(tab)) {
                    Press press = new Press();
                    tab.setOnTouchListener(press);
                    PRESSES.put(tab, press);
                }
                offerToTalkBack(tab);
            }
        } catch (Throwable error) {
            Logger.printException(() -> "Could not watch a top tab", error);
        }
    }

    /**
     * Opens the settings page the way its row in Settings and privacy does.
     *
     * @return whether the page was asked for. False leaves the press to PineDrama.
     */
    static boolean open() {
        if (Utils.getContext() == null) {
            Logger.printInfo(() -> "No app context yet, so the long press on a top tab stays PineDrama's");
            return false;
        }
        Logger.printInfo(() -> "Settings requested by a long press on a top tab");
        PineDramaActivityHook.openSettings();
        return true;
    }

    /** Times a press on one top tab, and opens the settings when it's held. */
    static final class Press implements View.OnTouchListener {
        private final Runnable fire = this::fire;
        /** The tab while a press on it is being timed. */
        private View pressed;
        private float downX;
        private float downY;
        /** This touch opened the settings, so the rest of it isn't the tab's. */
        private boolean opened;

        @Override
        public boolean onTouch(View tab, MotionEvent event) {
            try {
                switch (event.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        stop();
                        opened = false;
                        // A long press PineDrama gave the tab itself.
                        if (tab.isLongClickable()) return false;
                        pressed = tab;
                        downX = event.getX();
                        downY = event.getY();
                        tab.postDelayed(fire, ViewConfiguration.getLongPressTimeout());
                        return false;
                    case MotionEvent.ACTION_MOVE:
                        // The same leeway the tab gives its own press before it lets go.
                        if (pressed != null && !within(tab, event)) stop();
                        return opened;
                    case MotionEvent.ACTION_UP:
                    case MotionEvent.ACTION_CANCEL:
                        stop();
                        boolean ours = opened;
                        opened = false;
                        return ours;
                    default:
                        return opened;
                }
            } catch (Throwable error) {
                Logger.printException(() -> "Could not follow a press on a top tab", error);
                return false;
            }
        }

        private static boolean within(View tab, MotionEvent event) {
            float slop = ViewConfiguration.get(tab.getContext()).getScaledTouchSlop();
            float x = event.getX();
            float y = event.getY();
            return x >= -slop && y >= -slop && x < tab.getWidth() + slop && y < tab.getHeight() + slop;
        }

        private void stop() {
            View tab = pressed;
            pressed = null;
            if (tab != null) tab.removeCallbacks(fire);
        }

        private void fire() {
            View tab = pressed;
            pressed = null;
            if (tab == null || !tab.isAttachedToWindow()) return;
            try {
                // Not asked for, and letting go is PineDrama's tap, as it is without HushPine.
                if (!open()) return;
                opened = true;
                tab.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                // The tab lets go of its press here, so letting go of the screen isn't a tap on it.
                long now = SystemClock.uptimeMillis();
                MotionEvent cancel = MotionEvent.obtain(now, now, MotionEvent.ACTION_CANCEL, downX, downY, 0);
                tab.onTouchEvent(cancel);
                cancel.recycle();
            } catch (Throwable error) {
                Logger.printException(() -> "The long press on a top tab failed", error);
            }
        }
    }

    /**
     * Puts the TalkBack action on a top tab. A delegate PineDrama set since the last bind
     * is wrapped too, so it keeps answering. One that can't be read is left alone, without the
     * action, rather than replaced.
     */
    private static void offerToTalkBack(View tab) {
        View.AccessibilityDelegate current;
        try {
            current = delegateOf(tab);
        } catch (Exception unreadable) {
            Logger.printInfo(() -> "Could not read a top tab's accessibility delegate, so TalkBack keeps PineDrama's", unreadable);
            return;
        }
        if (current instanceof OpenAction) return;
        tab.setAccessibilityDelegate(new OpenAction(current));
    }

    /** The delegate PineDrama gave the tab, or null if it gave none. Android only reads it back from 10 on. */
    private static View.AccessibilityDelegate delegateOf(View tab) throws ReflectiveOperationException {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) return tab.getAccessibilityDelegate();
        Field field = View.class.getDeclaredField("mAccessibilityDelegate");
        field.setAccessible(true);
        return (View.AccessibilityDelegate) field.get(tab);
    }

    /**
     * TalkBack's way to the long press: a named action on a top tab that opens the settings through
     * the same route. Everything else goes on to the delegate PineDrama gave the tab, if it gave one,
     * so its own announcements and actions stay as they were. A tab PineDrama made long-clickable
     * doesn't offer it.
     */
    static final class OpenAction extends View.AccessibilityDelegate {
        /** Outside the standard action bits and Android's own resource ids. */
        static final int ID = 0x48534648;
        private final View.AccessibilityDelegate tikTok;

        OpenAction(View.AccessibilityDelegate tikTok) {
            this.tikTok = tikTok;
        }

        private boolean offered(View host) {
            return !host.isLongClickable();
        }

        @Override
        public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
            if (tikTok != null) tikTok.onInitializeAccessibilityNodeInfo(host, info);
            else super.onInitializeAccessibilityNodeInfo(host, info);
            if (offered(host)) {
                info.addAction(new AccessibilityNodeInfo.AccessibilityAction(ID,
                        L10n.t(host.getContext(), "Open HushPine settings")));
            }
        }

        @Override
        public boolean performAccessibilityAction(View host, int action, Bundle arguments) {
            if (action == ID) return offered(host) && open();
            return tikTok != null ? tikTok.performAccessibilityAction(host, action, arguments)
                    : super.performAccessibilityAction(host, action, arguments);
        }

        @Override
        public void sendAccessibilityEvent(View host, int eventType) {
            if (tikTok != null) tikTok.sendAccessibilityEvent(host, eventType);
            else super.sendAccessibilityEvent(host, eventType);
        }

        @Override
        public void sendAccessibilityEventUnchecked(View host, AccessibilityEvent event) {
            if (tikTok != null) tikTok.sendAccessibilityEventUnchecked(host, event);
            else super.sendAccessibilityEventUnchecked(host, event);
        }

        @Override
        public boolean dispatchPopulateAccessibilityEvent(View host, AccessibilityEvent event) {
            return tikTok != null ? tikTok.dispatchPopulateAccessibilityEvent(host, event)
                    : super.dispatchPopulateAccessibilityEvent(host, event);
        }

        @Override
        public void onPopulateAccessibilityEvent(View host, AccessibilityEvent event) {
            if (tikTok != null) tikTok.onPopulateAccessibilityEvent(host, event);
            else super.onPopulateAccessibilityEvent(host, event);
        }

        @Override
        public void onInitializeAccessibilityEvent(View host, AccessibilityEvent event) {
            if (tikTok != null) tikTok.onInitializeAccessibilityEvent(host, event);
            else super.onInitializeAccessibilityEvent(host, event);
        }

        @Override
        public boolean onRequestSendAccessibilityEvent(ViewGroup host, View child, AccessibilityEvent event) {
            return tikTok != null ? tikTok.onRequestSendAccessibilityEvent(host, child, event)
                    : super.onRequestSendAccessibilityEvent(host, child, event);
        }

        @Override
        public AccessibilityNodeProvider getAccessibilityNodeProvider(View host) {
            return tikTok != null ? tikTok.getAccessibilityNodeProvider(host) : super.getAccessibilityNodeProvider(host);
        }

        @TargetApi(Build.VERSION_CODES.O)
        @Override
        public void addExtraDataToAccessibilityNodeInfo(View host, AccessibilityNodeInfo info, String extraDataKey,
                                                        Bundle arguments) {
            if (tikTok != null) tikTok.addExtraDataToAccessibilityNodeInfo(host, info, extraDataKey, arguments);
            else super.addExtraDataToAccessibilityNodeInfo(host, info, extraDataKey, arguments);
        }
    }

    static void resetForTests() {
        synchronized (PRESSES) {
            PRESSES.clear();
        }
    }
}
