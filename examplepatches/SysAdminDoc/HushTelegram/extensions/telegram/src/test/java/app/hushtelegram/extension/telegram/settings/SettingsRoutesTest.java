/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;

import java.util.concurrent.TimeUnit;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.PauseForTests;

import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

/**
 * The four ways into the HushTelegram settings each have a switch (#29). A way that's off acts as
 * Telegram does without HushTelegram, one way always stays, and the switches go in a settings file.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SettingsRoutesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final SettingsEntry.OpenWhenResumed watcher = new SettingsEntry.OpenWhenResumed();
    private ActivityController<Activity> chats;

    @Before public void start() {
        RuntimeEnvironment.getApplication().registerActivityLifecycleCallbacks(watcher);
        chats = Robolectric.buildActivity(Activity.class).setup();
    }

    @After public void finish() {
        RuntimeEnvironment.getApplication().unregisterActivityLifecycleCallbacks(watcher);
        for (BooleanSetting way : SettingsRoutes.all()) way.resetToDefault();
        PauseForTests.resume();
        SettingsEntry.onClosedByUser();
        chats.pause().stop().destroy();
    }

    private static void off(BooleanSetting... ways) {
        for (BooleanSetting way : ways) way.save(false);
    }

    @Test public void everyWayStartsOn() {
        assertEquals(4, SettingsRoutes.all().length);
        for (BooleanSetting way : SettingsRoutes.all()) assertTrue(way.key, way.get());
        assertTrue(SettingsRoutes.settingsRow());
        assertTrue(SettingsRoutes.titlePress());
        assertTrue(SettingsRoutes.sideMenuRow());
        assertTrue(SettingsRoutes.shortcut());
    }

    @Test public void aWayThatIsOffReadsOffAndTheOthersStayOn() {
        off(SettingsRoutes.TITLE_PRESS);
        assertFalse(SettingsRoutes.titlePress());
        assertTrue(SettingsRoutes.settingsRow());
        assertTrue(SettingsRoutes.sideMenuRow());
        assertTrue(SettingsRoutes.shortcut());
    }

    @Test public void onlyTheLastWayOnCantBeTurnedOff() {
        assertFalse(SettingsRoutes.wouldBeTheLast(SettingsRoutes.SHORTCUT));
        off(SettingsRoutes.SETTINGS_ROW, SettingsRoutes.TITLE_PRESS);
        assertFalse(SettingsRoutes.wouldBeTheLast(SettingsRoutes.SHORTCUT));
        off(SettingsRoutes.SIDE_MENU_ROW);
        assertTrue(SettingsRoutes.wouldBeTheLast(SettingsRoutes.SHORTCUT));
        assertFalse("a way that's off isn't the last one on", SettingsRoutes.wouldBeTheLast(SettingsRoutes.SETTINGS_ROW));
    }

    /** Storage that says every way is off, from an import or an edit, still leaves the row on Telegram's Settings page. */
    @Test public void storageThatSaysAllOffKeepsTheSettingsRow() {
        off(SettingsRoutes.all());
        assertTrue(SettingsRoutes.settingsRow());
        assertTrue(SettingsEntry.nativeRowShown());
        assertFalse(SettingsRoutes.titlePress());
        assertFalse(SettingsRoutes.sideMenuRow());
        assertFalse(SettingsRoutes.shortcut());
    }

    @Test public void theSettingsRowGoesWhenItsWayIsOffAndAnotherIsOn() {
        assertTrue(SettingsEntry.nativeRowShown());
        off(SettingsRoutes.SETTINGS_ROW);
        assertFalse(SettingsEntry.nativeRowShown());
    }

    @Test public void pausedHushTelegramStillAnswersTheWays() {
        off(SettingsRoutes.TITLE_PRESS);
        PauseForTests.pause(app.hushtelegram.extension.shared.settings.HushTelegramPause.Reason.CRASH_LOOP);
        assertTrue(SettingsRoutes.settingsRow());
        assertTrue(SettingsRoutes.sideMenuRow());
        assertTrue(SettingsRoutes.shortcut());
        assertFalse(SettingsRoutes.titlePress());
    }

    // The long press on the chat list title.

    private FrameLayout bar() {
        Context context = chats.get();
        FrameLayout bar = new FrameLayout(context);
        bar.setOnClickListener(v -> { });
        bar.addView(new View(context), new FrameLayout.LayoutParams(360, 90));
        FrameLayout screen = new FrameLayout(context);
        screen.addView(bar, new FrameLayout.LayoutParams(720, 90));
        chats.get().setContentView(screen);
        ShadowLooper.idleMainLooper();
        return bar;
    }

    private static MotionEvent event(int action, long downTime) {
        return MotionEvent.obtain(downTime, SystemClock.uptimeMillis(), action, 180, 45, 0);
    }

    private static void press(View bar) {
        long down = SystemClock.uptimeMillis();
        bar.dispatchTouchEvent(event(MotionEvent.ACTION_DOWN, down));
        ShadowLooper.idleMainLooper(android.view.ViewConfiguration.getLongPressTimeout() + 100, TimeUnit.MILLISECONDS);
        bar.dispatchTouchEvent(event(MotionEvent.ACTION_UP, down));
        ShadowLooper.idleMainLooper();
    }

    private Object screen() {
        return chats.get().getFragmentManager().findFragmentByTag("hushtelegram_settings");
    }

    @Test public void aLongPressOnTheTitleDoesNothingWithItsWayOff() {
        off(SettingsRoutes.TITLE_PRESS);
        View bar = bar();
        SettingsEntry.watchChatListTitle(bar);
        assertFalse(SettingsEntry.requestFromTitle(bar));
        press(bar);
        assertNull("the long press opened the screen with its way off", screen());
    }

    @Test public void aLongPressOnTheTitleStillOpensTheScreenWithItsWayOn() {
        View bar = bar();
        SettingsEntry.watchChatListTitle(bar);
        press(bar);
        assertNotNull(screen());
    }

    // The launcher shortcut.

    private static ShortcutInfo shortcut(ShortcutManager manager) {
        for (ShortcutInfo info : manager.getDynamicShortcuts()) {
            if (SettingsEntry.SHORTCUT_ID.equals(info.getId())) return info;
        }
        return null;
    }

    @Test public void theShortcutIsNotPublishedWithItsWayOffAndGoesWhenItIsTurnedOff() {
        Context context = RuntimeEnvironment.getApplication();
        ShortcutManager manager = context.getSystemService(ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);
        assertNotNull(shortcut(manager));

        off(SettingsRoutes.SHORTCUT);
        SettingsEntry.publishShortcutNow(context);
        assertNull("the shortcut stayed with its way off", shortcut(manager));

        SettingsRoutes.SHORTCUT.save(true);
        SettingsEntry.publishShortcutNow(context);
        assertNotNull("the shortcut didn't come back", shortcut(manager));
    }

    @Test public void aShortcutPinnedBeforeItsWayWentOffOpensTelegramAndNothingMore() throws Exception {
        off(SettingsRoutes.SHORTCUT);
        Intent intent = new Intent(Intent.ACTION_MAIN).putExtra(SettingsEntry.EXTRA_OPEN_SETTINGS, true);
        java.lang.reflect.Method note = SettingsEntry.class.getDeclaredMethod("noteIntent", Intent.class);
        note.setAccessible(true);
        assertFalse((Boolean) note.invoke(null, intent));
        assertFalse("the spent extra stayed on the intent", intent.hasExtra(SettingsEntry.EXTRA_OPEN_SETTINGS));

        SettingsRoutes.SHORTCUT.save(true);
        Intent again = new Intent(Intent.ACTION_MAIN).putExtra(SettingsEntry.EXTRA_OPEN_SETTINGS, true);
        assertTrue((Boolean) note.invoke(null, again));
    }

    // Settings file.

    @Test public void theWaysGoInASettingsFileAndComeBack() throws Exception {
        off(SettingsRoutes.TITLE_PRESS, SettingsRoutes.SHORTCUT);
        JSONObject file = new JSONObject(SettingsBackup.create());
        JSONObject switches = file.getJSONObject(SettingsBackup.SETTINGS_NAME);
        assertEquals(false, switches.get(SettingsRoutes.TITLE_PRESS.key));
        assertEquals(false, switches.get(SettingsRoutes.SHORTCUT.key));
        assertEquals(true, switches.get(SettingsRoutes.SETTINGS_ROW.key));
        assertEquals(true, switches.get(SettingsRoutes.SIDE_MENU_ROW.key));

        for (BooleanSetting way : SettingsRoutes.all()) way.resetToDefault();
        SettingsBackup.apply(SettingsBackup.parse(file.toString()));
        assertFalse(SettingsRoutes.TITLE_PRESS.savedValue());
        assertFalse(SettingsRoutes.SHORTCUT.savedValue());
        assertTrue(SettingsRoutes.SETTINGS_ROW.savedValue());
        assertTrue(SettingsRoutes.SIDE_MENU_ROW.savedValue());
    }

    /** A file with every way off leaves the Settings row on, stored too, so its switch shows what the app does. */
    @Test public void aFileWithEveryWayOffKeepsTheSettingsRowSwitchOn() throws Exception {
        JSONObject file = new JSONObject(SettingsBackup.create());
        JSONObject switches = file.getJSONObject(SettingsBackup.SETTINGS_NAME);
        for (BooleanSetting way : SettingsRoutes.all()) switches.put(way.key, false);

        SettingsBackup.Snapshot whileOn = SettingsBackup.parse(file.toString());
        assertFalse("the row is on already, so the file leaves it", whileOn.changes().containsKey(SettingsRoutes.SETTINGS_ROW));
        assertEquals(3, SettingsBackup.apply(whileOn));
        assertTrue(SettingsRoutes.SETTINGS_ROW.savedValue());
        assertFalse(SettingsRoutes.TITLE_PRESS.savedValue());
        assertFalse(SettingsRoutes.SIDE_MENU_ROW.savedValue());
        assertFalse(SettingsRoutes.SHORTCUT.savedValue());

        // The row was off with another way on: the file turns it back on instead of leaving none.
        for (BooleanSetting way : SettingsRoutes.all()) way.resetToDefault();
        off(SettingsRoutes.SETTINGS_ROW);
        SettingsBackup.Snapshot whileOff = SettingsBackup.parse(file.toString());
        assertEquals(Boolean.TRUE, whileOff.changes().get(SettingsRoutes.SETTINGS_ROW));
        SettingsBackup.apply(whileOff);
        assertTrue(SettingsRoutes.SETTINGS_ROW.savedValue());
        assertTrue(SettingsRoutes.SETTINGS_ROW.get());
        assertFalse(SettingsRoutes.SHORTCUT.savedValue());
    }
}
