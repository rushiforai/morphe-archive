/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.TextView;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import app.hushtelegram.extension.telegram.settings.SettingsEntry;
import app.hushtelegram.extension.telegram.settings.SettingsRoutes;

import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SideMenuTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final List<String> asked = new ArrayList<>();
    private ActivityController<Activity> controller;

    @Before public void reset() {
        restore();
        SideMenu.opener = new SideMenu.Opener() {
            @Override public void start(Activity activity, Intent intent) {
                asked.add("start " + intent.getAction() + " " + intent.getDataString() + " " + intent.getComponent().getClassName());
            }

            @Override public void turnTo(Object screen, int page) { asked.add("turn " + page); }

            @Override public void accounts(Object screen, View anchor) { asked.add("accounts"); }

            @Override public void hushSettings(Activity activity) { asked.add("hush"); }
        };
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.SIDE_MENU);
        Settings.SIDE_MENU.resetToDefault();
        Settings.HIDE_CONTACTS_TAB.resetToDefault();
        SideMenu.opener = Activity::startActivity;
        SideMenu.gates = new SideMenu.Gates() {};
        SideMenuPanel.Registry.panel = new java.lang.ref.WeakReference<>(null);
        HookStatus.clear();
        if (controller != null) controller.pause().stop().destroy();
        controller = null;
        asked.clear();
    }

    private static String report() { return String.join("\n", HookStatus.report()); }

    private Activity activity() {
        controller = Robolectric.buildActivity(Activity.class).setup();
        return controller.get();
    }

    private long clock = SystemClock.uptimeMillis();

    /** A touch 16 ms after the last, as a finger's events come. */
    private MotionEvent touch(int action, float x) {
        clock += 16;
        return MotionEvent.obtain(clock, clock, action, x, 400f, 0);
    }

    @Test public void offByDefaultAndWhilePaused() {
        assertFalse(Settings.SIDE_MENU.get());
        assertFalse(SideMenu.on());
        assertTrue(report().contains("Hide Contacts tab"));
        Settings.SIDE_MENU.save(true);
        assertTrue(SideMenu.on());
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), SideMenu.on());
            PauseForTests.resume();
        }
    }

    @Test public void aBrokenSwitchReadKeepsTheMenuShut() {
        Settings.SIDE_MENU.save(true);
        SettingReadsForTests.breakReads(Settings.SIDE_MENU);
        assertFalse(SideMenu.on());
        assertTrue(report().contains("side menu switch"));
    }

    @Test public void aForwardSwipeOrAnotherPagerNeverArmsIt() {
        Settings.SIDE_MENU.save(true);
        Activity activity = activity();
        View pager = new View(activity);
        FrameLayout parent = new FrameLayout(activity);
        parent.addView(pager);
        activity.setContentView(parent);
        // Outside a patched app no pager belongs to a main screen, so nothing is added either way.
        SideMenu.swipeStarts(pager, touch(MotionEvent.ACTION_MOVE, 40f), false);
        SideMenu.swipeStarts(pager, touch(MotionEvent.ACTION_MOVE, 40f), true);
        SideMenu.swipeStarts(null, touch(MotionEvent.ACTION_MOVE, 40f), false);
        assertNull(parent.findViewWithTag(SideMenuPanel.TAG));
        assertFalse(SideMenu.back(new Object(), true));
    }

    /** Gates that answer as told and write down each arm. */
    private final class Steered implements SideMenu.Gates {
        Object screen = new Object();
        int page;
        boolean mayOpen = true;

        @Override public Object screen(Object pager) { return screen; }

        @Override public int page(Object screen) { return page; }

        @Override public boolean mayOpen(Object pager, MotionEvent event) { return mayOpen; }

        @Override public void arm(Object screen, View pager, MotionEvent event) { asked.add("arm " + event.getActionMasked()); }
    }

    @Test public void onlyAMovingSwipeBackOnTheFirstPageTheChatListLetsGoArmsIt() {
        Steered gates = new Steered();
        SideMenu.gates = gates;
        View pager = new View(activity());

        // Switch off: the screen is found, the switch says no.
        SideMenu.swipeStarts(pager, touch(MotionEvent.ACTION_MOVE, 40f), false);
        assertTrue(asked.isEmpty());

        Settings.SIDE_MENU.save(true);
        SideMenu.swipeStarts(pager, touch(MotionEvent.ACTION_MOVE, 40f), false);
        assertEquals(List.of("arm " + MotionEvent.ACTION_MOVE), asked);

        // Telegram asks again on a lift or a second finger, which can't drag anything in.
        SideMenu.swipeStarts(pager, touch(MotionEvent.ACTION_UP, 40f), false);
        SideMenu.swipeStarts(pager, touch(MotionEvent.ACTION_POINTER_UP, 40f), false);
        gates.page = 2;
        SideMenu.swipeStarts(pager, touch(MotionEvent.ACTION_MOVE, 40f), false);
        gates.page = 0;
        gates.mayOpen = false;
        SideMenu.swipeStarts(pager, touch(MotionEvent.ACTION_MOVE, 40f), false);
        assertEquals(1, asked.size());
    }

    @Test public void anotherPagersSwipeIsntCountedAsTheMenus() {
        Steered gates = new Steered();
        gates.screen = null;
        SideMenu.gates = gates;
        Settings.SIDE_MENU.save(true);
        SideMenu.swipeStarts(new View(activity()), touch(MotionEvent.ACTION_MOVE, 40f), false);
        assertTrue(asked.isEmpty());
        assertFalse(report().contains("Hide Contacts tab"));
    }

    @Test public void eachRowOpensTelegramsOwnScreen() {
        Activity activity = activity();
        Object screen = new Object();
        String own = activity.getClass().getName();
        SideMenu.open(SideMenu.Row.PROFILE, screen, activity);
        SideMenu.open(SideMenu.Row.NEW_MESSAGE, screen, activity);
        SideMenu.open(SideMenu.Row.CONTACTS, screen, activity);
        SideMenu.open(SideMenu.Row.CALLS, screen, activity);
        SideMenu.open(SideMenu.Row.SETTINGS, screen, activity);
        SideMenu.open(SideMenu.Row.HUSH, screen, activity);
        assertEquals(List.of(
                "turn 3",
                "start new_dialog null " + own,
                "turn 1",
                "start android.intent.action.VIEW tg://calllog " + own,
                "start android.intent.action.VIEW tg://settings " + own,
                "hush"), asked);
        assertTrue(report().contains("side menu opened new message"));
        assertTrue(report().contains("side menu opened hush"));
    }

    @Test public void contactsOpensTheContactListWhenItsTabIsHidden() {
        Activity activity = activity();
        Settings.HIDE_CONTACTS_TAB.save(true);
        SideMenu.open(SideMenu.Row.CONTACTS, new Object(), activity);
        assertEquals(List.of("start new_dialog null " + activity.getClass().getName()), asked);
    }

    @Test public void savedMessagesWaitsForTheAccount() {
        // Without an account id there's no chat to open, so nothing starts.
        SideMenu.open(SideMenu.Row.SAVED, new Object(), activity());
        assertTrue(asked.isEmpty());
        assertEquals("tg://openmessage?user_id=42", SideMenu.link(controller.get(), SideMenu.SAVED_LINK + 42).getDataString());
    }

    @Test public void rowsFallBackToEnglishOutsideTelegram() {
        String[] words = SideMenu.rowLabels();
        assertEquals(SideMenu.Row.values().length, words.length);
        for (int i = 0; i < SideMenu.FALLBACK.length; i++) assertEquals(SideMenu.FALLBACK[i], words[i]);
        assertEquals(SettingsEntry.nativeSettingsTitle(), words[SideMenu.Row.HUSH.ordinal()]);
    }

    @Test public void theHushRowFollowsItsWayInSwitch() {
        Activity activity = activity();
        FrameLayout parent = new FrameLayout(activity);
        activity.setContentView(parent);
        SideMenuPanel panel = SideMenuPanel.in(parent, new Object());
        try {
            panel.showHush();
            assertEquals(View.VISIBLE, panel.hushRow.getVisibility());
            assertEquals(View.VISIBLE, panel.hushDivider.getVisibility());
            SettingsRoutes.SIDE_MENU_ROW.save(false);
            panel.showHush();
            assertEquals("the row stayed with its way off", View.GONE, panel.hushRow.getVisibility());
            assertEquals(View.GONE, panel.hushDivider.getVisibility());
            SettingsRoutes.SIDE_MENU_ROW.save(true);
            panel.showHush();
            assertEquals(View.VISIBLE, panel.hushRow.getVisibility());
        } finally {
            SettingsRoutes.SIDE_MENU_ROW.resetToDefault();
        }
    }

    @Test public void theMenuHasItsRowsAndIsAddedOnce() {
        Activity activity = activity();
        FrameLayout parent = new FrameLayout(activity);
        activity.setContentView(parent);
        Object screen = new Object();
        SideMenuPanel panel = SideMenuPanel.in(parent, screen);
        assertSame(panel, SideMenuPanel.in(parent, screen));
        assertEquals(1, parent.getChildCount());
        assertEquals(View.GONE, panel.getVisibility());
        List<String> rows = new ArrayList<>();
        for (int i = 0; i < panel.menu.getChildCount(); i++) {
            View child = panel.menu.getChildAt(i);
            rows.add(child == panel.name ? "name" : child instanceof TextView ? ((TextView) child).getText().toString() : "line");
        }
        List<String> expected = new ArrayList<>(List.of("name", "Switch account", "line"));
        for (int i = 0; i < SideMenu.FALLBACK.length; i++) expected.add(SideMenu.FALLBACK[i]);
        expected.add("line");
        expected.add(SettingsEntry.nativeSettingsTitle());
        assertEquals(expected, rows);
        panel.menu.getChildAt(1).performClick();
        panel.menu.getChildAt(4).performClick();
        assertEquals(List.of("accounts", "start new_dialog null " + activity.getClass().getName()), asked);
    }

    @Test public void aSwipeDragsItOpenAndBackClosesIt() {
        Activity activity = activity();
        FrameLayout parent = new FrameLayout(activity);
        View pager = new View(activity);
        parent.addView(pager, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        activity.setContentView(parent);
        ShadowLooper.idleMainLooper();
        List<Integer> screenGot = new ArrayList<>();
        Window window = activity.getWindow();
        Window.Callback stock = window.getCallback();
        window.setCallback((Window.Callback) Proxy.newProxyInstance(getClass().getClassLoader(), new Class<?>[]{Window.Callback.class},
                (proxy, method, args) -> {
                    if (method.getName().equals("dispatchTouchEvent")) screenGot.add(((MotionEvent) args[0]).getActionMasked());
                    return method.invoke(stock, args);
                }));
        Object screen = new Object();

        SideMenuPanel.arm(screen, pager, touch(MotionEvent.ACTION_MOVE, 20f));
        SideMenuPanel panel = (SideMenuPanel) parent.findViewWithTag(SideMenuPanel.TAG);
        assertNotNull(panel);
        assertTrue(window.getCallback() instanceof SideMenuPanel.Gestures);
        assertFalse("armed isn't open", SideMenu.back(screen, false));

        // The rest of the swipe: the screen gets a cancel, and the menu follows the finger.
        window.getCallback().dispatchTouchEvent(touch(MotionEvent.ACTION_MOVE, 120f));
        assertEquals(List.of(MotionEvent.ACTION_CANCEL), screenGot);
        assertTrue(panel.progress() > 0f);
        window.getCallback().dispatchTouchEvent(touch(MotionEvent.ACTION_MOVE, 2000f));
        window.getCallback().dispatchTouchEvent(touch(MotionEvent.ACTION_UP, 2000f));
        ShadowLooper.idleMainLooper(1, TimeUnit.SECONDS);
        assertEquals(1f, panel.progress(), 0f);
        assertEquals(View.VISIBLE, panel.getVisibility());
        assertEquals(List.of(MotionEvent.ACTION_CANCEL), screenGot);
        assertTrue(report().contains("side menu opened"));

        // Back is the menu's while it shows, asked or done, and closes it when done.
        assertFalse("another screen's Back stays its own", SideMenu.back(new Object(), false));
        assertTrue(SideMenu.back(screen, false));
        assertEquals(1f, panel.progress(), 0f);
        assertTrue(SideMenu.back(screen, true));
        ShadowLooper.idleMainLooper(1, TimeUnit.SECONDS);
        assertEquals(0f, panel.progress(), 0f);
        assertEquals(View.GONE, panel.getVisibility());
        assertFalse(SideMenu.back(screen, true));

        // A new touch goes to the screen as always.
        window.getCallback().dispatchTouchEvent(touch(MotionEvent.ACTION_DOWN, 50f));
        assertEquals(List.of(MotionEvent.ACTION_CANCEL, MotionEvent.ACTION_DOWN), screenGot);
    }

    @Test public void aShortSwipeSlidesBackShut() {
        Activity activity = activity();
        FrameLayout parent = new FrameLayout(activity);
        View pager = new View(activity);
        parent.addView(pager);
        activity.setContentView(parent);
        ShadowLooper.idleMainLooper();
        Object screen = new Object();
        SideMenuPanel.arm(screen, pager, touch(MotionEvent.ACTION_MOVE, 20f));
        Window.Callback gestures = activity.getWindow().getCallback();
        gestures.dispatchTouchEvent(touch(MotionEvent.ACTION_MOVE, 30f));
        SideMenuPanel panel = (SideMenuPanel) parent.findViewWithTag(SideMenuPanel.TAG);
        assertTrue(panel.progress() > 0f && panel.progress() < 0.5f);
        gestures.dispatchTouchEvent(touch(MotionEvent.ACTION_CANCEL, 30f));
        ShadowLooper.idleMainLooper(1, TimeUnit.SECONDS);
        assertEquals(0f, panel.progress(), 0f);
        assertEquals(View.GONE, panel.getVisibility());
        assertFalse(SideMenu.back(screen, false));
    }

    @Test public void aScreenThatGoesMidCloseComesBackClosed() {
        Activity activity = activity();
        FrameLayout parent = new FrameLayout(activity);
        View pager = new View(activity);
        parent.addView(pager);
        activity.setContentView(parent);
        ShadowLooper.idleMainLooper();
        Object screen = new Object();
        SideMenuPanel.arm(screen, pager, touch(MotionEvent.ACTION_MOVE, 20f));
        Window.Callback gestures = activity.getWindow().getCallback();
        gestures.dispatchTouchEvent(touch(MotionEvent.ACTION_MOVE, 2000f));
        gestures.dispatchTouchEvent(touch(MotionEvent.ACTION_UP, 2000f));
        ShadowLooper.idleMainLooper(1, TimeUnit.SECONDS);
        SideMenuPanel panel = (SideMenuPanel) parent.findViewWithTag(SideMenuPanel.TAG);
        assertEquals(1f, panel.progress(), 0f);

        // A row starts the close, and the screen it opens takes the main one off before the slide ends.
        panel.settle(false);
        activity.setContentView(new FrameLayout(activity));
        ShadowLooper.idleMainLooper(1, TimeUnit.SECONDS);
        assertEquals(0f, panel.progress(), 0f);
        assertEquals(View.GONE, panel.getVisibility());
        activity.setContentView(parent);
        ShadowLooper.idleMainLooper();
        assertFalse(SideMenu.back(screen, false));
    }

    @Test public void aRowThatFailsIsReportedNotThrown() {
        SideMenu.opener = new SideMenu.Opener() {
            @Override public void start(Activity activity, Intent intent) { throw new IllegalStateException("no screen"); }

            @Override public void accounts(Object screen, View anchor) { throw new IllegalStateException("no switcher"); }
        };
        Activity activity = activity();
        FrameLayout parent = new FrameLayout(activity);
        activity.setContentView(parent);
        SideMenuPanel panel = SideMenuPanel.in(parent, new Object());
        panel.menu.getChildAt(1).performClick();
        panel.menu.getChildAt(4).performClick();
        // The report names the first of the two.
        assertTrue(report(), report().contains("2 missing. First missing: a working 'side menu accounts' hook"));
    }

    @Test public void textIsDarkOnALightMenuAndLightOnADarkOne() {
        assertEquals(0xFF000000, new SideMenuPanel.Colors(Color.WHITE).text);
        assertEquals(0xFFFFFFFF, new SideMenuPanel.Colors(0xFF1F1F1F).text);
        Activity activity = activity();
        FrameLayout root = new FrameLayout(activity);
        View list = new View(activity);
        list.setBackgroundColor(0xFF17212B);
        root.addView(list, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        activity.setContentView(root);
        ShadowLooper.idleMainLooper();
        assertEquals(0xFF17212B, SideMenuPanel.colorsFor(activity, root).background);
    }
}
