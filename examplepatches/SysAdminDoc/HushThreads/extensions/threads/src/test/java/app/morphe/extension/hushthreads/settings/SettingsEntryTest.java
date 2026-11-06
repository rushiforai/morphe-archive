/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.settings;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.widget.TextView;

import java.util.ArrayList;

import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.ReopenSettingsAfterRestart;

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

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SettingsEntryTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final SettingsEntry.OpenWhenResumed watcher = new SettingsEntry.OpenWhenResumed();

    @Before public void watch() {
        RuntimeEnvironment.getApplication().registerActivityLifecycleCallbacks(watcher);
    }

    @After public void stopWatching() {
        RuntimeEnvironment.getApplication().unregisterActivityLifecycleCallbacks(watcher);
        HushThreadsPreferenceFragment.failNextInitialization = null;
    }

    /**
     * The launcher shortcut is labelled in the phone's language when it's first published, and a
     * phone that changes language gets it relabelled: one found under the old label is pushed
     * again. Kept as it was, it stayed in its first language for good.
     */
    @Test public void theShortcutFollowsThePhonesLanguage() {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);
        org.junit.Assert.assertEquals("HushThreads settings", longLabel(manager));

        RuntimeEnvironment.setQualifiers("+de");
        SettingsEntry.publishShortcutNow(context);
        org.junit.Assert.assertEquals(app.morphe.extension.shared.L10nTablesForTests.of("de").get("HushThreads settings"),
                longLabel(manager));
        org.junit.Assert.assertEquals("one shortcut, relabelled, not two", 1, manager.getDynamicShortcuts().size());
    }

    /**
     * Threads sets its own language after the application starts, so the label published then
     * is in the phone's. On a German phone with Threads in English it stayed German next to an
     * English screen. The next Threads screen to resume labels it again in Threads' language.
     */
    @Test public void theShortcutIsLabelledAgainOnceThreadsHasSetItsLanguage() throws Exception {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);
        org.junit.Assert.assertEquals("HushThreads settings", longLabel(manager));

        RuntimeEnvironment.setQualifiers("+de");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            app.morphe.extension.shared.Utils.awaitBackgroundTasksForTests();
            org.junit.Assert.assertEquals(app.morphe.extension.shared.L10nTablesForTests.of("de").get("HushThreads settings"),
                    longLabel(manager));
            org.junit.Assert.assertEquals(1, manager.getDynamicShortcuts().size());
        }
    }

    private static String longLabel(android.content.pm.ShortcutManager manager) {
        for (android.content.pm.ShortcutInfo shortcut : manager.getDynamicShortcuts()) {
            if (SettingsEntry.SHORTCUT_ID.equals(shortcut.getId())) return String.valueOf(shortcut.getLongLabel());
        }
        return null;
    }

    /**
     * Threads pushes its own shortcuts at rank 0, and the platform ranks the newest push first, so
     * the HushThreads one ended up last. A launcher that shows three or four of them, or two next
     * to a notification, cut it off. Threads' push still goes through, and then the HushThreads
     * shortcut goes back in front.
     */
    @Test public void threadsOwnPushLeavesTheHushThreadsShortcutFirst() throws Exception {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);
        demote(context, manager, 3, "HushThreads settings");

        SettingsEntry.pushDynamicShortcut(manager, threadsShortcut(context, "compose"));
        app.morphe.extension.shared.Utils.awaitBackgroundTasksForTests();

        assertNotNull("Threads' own push was lost", shortcut(manager, "compose"));
        org.junit.Assert.assertEquals("the HushThreads shortcut stayed behind Threads' own",
                0, shortcut(manager, SettingsEntry.SHORTCUT_ID).getRank());
    }

    /** An update of Threads' shortcuts can rank them again too, and its answer is Threads' own. */
    @Test public void threadsUpdateKeepsItsAnswerAndTheHushThreadsShortcutFirst() throws Exception {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);
        manager.pushDynamicShortcut(threadsShortcut(context, "search"));
        demote(context, manager, 1, "HushThreads settings");

        boolean updated = SettingsEntry.updateShortcuts(manager,
                java.util.Collections.singletonList(threadsShortcut(context, "search")));
        app.morphe.extension.shared.Utils.awaitBackgroundTasksForTests();

        assertTrue("Threads' update answered false", updated);
        org.junit.Assert.assertEquals(0, shortcut(manager, SettingsEntry.SHORTCUT_ID).getRank());
    }

    /** A call that replaces every dynamic shortcut took the HushThreads one with it. */
    @Test public void threadsReplacingItsShortcutsPublishesTheHushThreadsOneAgain() throws Exception {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);

        boolean set = SettingsEntry.setDynamicShortcuts(manager,
                java.util.Collections.singletonList(threadsShortcut(context, "activity")));
        app.morphe.extension.shared.Utils.awaitBackgroundTasksForTests();

        assertTrue("Threads' replacement answered false", set);
        assertNotNull("Threads' own shortcut was lost", shortcut(manager, "activity"));
        android.content.pm.ShortcutInfo ours = shortcut(manager, SettingsEntry.SHORTCUT_ID);
        assertNotNull("the HushThreads shortcut stayed gone", ours);
        org.junit.Assert.assertEquals(0, ours.getRank());
        org.junit.Assert.assertEquals("HushThreads settings", String.valueOf(ours.getLongLabel()));
    }

    /** Each start checks the place as well as the label, so a shortcut left behind comes back first. */
    @Test public void theNextStartPutsAShortcutLeftBehindBackInFront() {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);
        demote(context, manager, 2, "HushThreads settings");

        SettingsEntry.publishShortcutNow(context);

        org.junit.Assert.assertEquals(0, shortcut(manager, SettingsEntry.SHORTCUT_ID).getRank());
        org.junit.Assert.assertEquals(1, manager.getDynamicShortcuts().size());
    }

    /**
     * The process Threads pushes from may not have Threads' language yet, so moving the shortcut
     * back keeps the label it has. Relabelled in the phone's language there, it flipped between
     * the two languages each time Threads pushed.
     */
    @Test public void movingTheShortcutBackKeepsItsLabel() {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        String german = app.morphe.extension.shared.L10nTablesForTests.of("de").get("HushThreads settings");
        demote(context, manager, 3, german);

        SettingsEntry.keepFirstNow(context);

        org.junit.Assert.assertEquals(german, longLabel(manager));
        org.junit.Assert.assertEquals(0, shortcut(manager, SettingsEntry.SHORTCUT_ID).getRank());
    }

    /**
     * Someone who opens the screen from the Threads logo didn't want it in the icon's long-press
     * menu too (HushFacebook#146). Off takes it out at once and leaves Threads' own; Threads' next
     * calls and the next start don't bring it back; on puts it back in front.
     */
    @Test public void theSettingsShortcutSwitchTakesTheShortcutOutAndPutsItBack() throws Exception {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        assertTrue("on by default", BaseSettings.SETTINGS_SHORTCUT.savedValue());
        SettingsEntry.publishShortcutNow(context);
        manager.pushDynamicShortcut(threadsShortcut(context, "compose"));
        assertNotNull(shortcut(manager, SettingsEntry.SHORTCUT_ID));

        BaseSettings.SETTINGS_SHORTCUT.save(false);
        SettingsEntry.shortcutSwitchChanged(context);
        app.morphe.extension.shared.Utils.awaitBackgroundTasksForTests();
        assertNull("the shortcut stayed in the launcher's menu", shortcut(manager, SettingsEntry.SHORTCUT_ID));
        assertNotNull("Threads' own shortcut went too", shortcut(manager, "compose"));

        SettingsEntry.pushDynamicShortcut(manager, threadsShortcut(context, "search"));
        SettingsEntry.setDynamicShortcuts(manager, java.util.Collections.singletonList(threadsShortcut(context, "activity")));
        app.morphe.extension.shared.Utils.awaitBackgroundTasksForTests();
        SettingsEntry.publishShortcutNow(context);
        SettingsEntry.keepFirstNow(context);
        assertNull("Threads' calls or a start brought it back", shortcut(manager, SettingsEntry.SHORTCUT_ID));
        assertNotNull(shortcut(manager, "activity"));

        BaseSettings.SETTINGS_SHORTCUT.save(true);
        SettingsEntry.shortcutSwitchChanged(context);
        app.morphe.extension.shared.Utils.awaitBackgroundTasksForTests();
        android.content.pm.ShortcutInfo ours = shortcut(manager, SettingsEntry.SHORTCUT_ID);
        assertNotNull("on didn't put it back", ours);
        org.junit.Assert.assertEquals(0, ours.getRank());
        assertNotNull(shortcut(manager, "activity"));
    }

    /** The switch is kept while paused: a pause neither brings the shortcut back nor takes it away. */
    @Test public void aPauseLeavesTheSettingsShortcutAsItsSwitchSays() {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        try {
            PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
            SettingsEntry.publishShortcutNow(context);
            assertNotNull("a paused start dropped the way back to settings", shortcut(manager, SettingsEntry.SHORTCUT_ID));
            BaseSettings.SETTINGS_SHORTCUT.save(false);
            SettingsEntry.publishShortcutNow(context);
            assertNull("a pause brought the shortcut back", shortcut(manager, SettingsEntry.SHORTCUT_ID));
        } finally {
            PauseForTests.resume();
        }
    }

    /** The row on the Pause, backup and diagnostics page saves the switch and takes the shortcut out. */
    @Test public void theRowOnThePausePageTakesTheShortcutOut() throws Exception {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushThreadsPreferenceFragment page = new HushThreadsPreferenceFragment();
            controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
            android.preference.SwitchPreference row =
                    (android.preference.SwitchPreference) page.findPreference(BaseSettings.SETTINGS_SHORTCUT.key);
            assertNotNull("no settings shortcut row", row);
            assertTrue(row.isChecked());
            org.junit.Assert.assertEquals("Settings shortcut on the app icon", String.valueOf(row.getTitle()));

            assertTrue(row.getOnPreferenceChangeListener().onPreferenceChange(row, false));
            app.morphe.extension.shared.Utils.awaitBackgroundTasksForTests();
            org.junit.Assert.assertFalse(BaseSettings.SETTINGS_SHORTCUT.savedValue());
            assertNull("the row left the shortcut in the menu", shortcut(manager, SettingsEntry.SHORTCUT_ID));
        }
    }

    /**
     * The long press on the logo has its own switch. Off, a header drawn from then on gets no long
     * press, and one drawn before keeps Compose's old handler, which then opens nothing.
     */
    @Test public void theLogoSwitchTakesTheLongPressAway() {
        ActivityController<Activity> activity = resumedLauncher();
        org.junit.Assert.assertSame(ThreadsLogo.LONG_PRESS, ThreadsLogo.longPress());

        BaseSettings.SETTINGS_LOGO_PRESS.save(false);
        assertNull("a header drawn now still gets a long press", ThreadsLogo.longPress());
        assertNull(ThreadsLogo.LONG_PRESS.invoke());
        ShadowLooper.idleMainLooper();
        assertNull("an older header's long press opened the screen", dialogOver(activity.get()));

        BaseSettings.SETTINGS_LOGO_PRESS.save(true);
        org.junit.Assert.assertSame(ThreadsLogo.LONG_PRESS, ThreadsLogo.longPress());
    }

    /**
     * Each way in has its switch on the Pause page, and the last one that's on stays on: its row is
     * greyed out and says why, and turning it off is refused. Another way back on frees it.
     */
    @Test public void theLastWayInOnThePausePageCantBeTurnedOff() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushThreadsPreferenceFragment page = new HushThreadsPreferenceFragment();
            controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
            android.preference.SwitchPreference shortcut = way(page, BaseSettings.SETTINGS_SHORTCUT);
            android.preference.SwitchPreference row = way(page, BaseSettings.SETTINGS_ROW);
            android.preference.SwitchPreference logo = way(page, BaseSettings.SETTINGS_LOGO_PRESS);
            org.junit.Assert.assertEquals("Settings row in Threads' settings", String.valueOf(row.getTitle()));
            org.junit.Assert.assertEquals("Open settings from the logo", String.valueOf(logo.getTitle()));
            String shortcutSummary = String.valueOf(shortcut.getSummary());
            for (android.preference.SwitchPreference way : java.util.Arrays.asList(shortcut, row, logo)) {
                assertTrue(way.getKey() + " is greyed out with all three on", way.isEnabled());
            }

            assertTrue(row.getOnPreferenceChangeListener().onPreferenceChange(row, false));
            assertTrue(logo.getOnPreferenceChangeListener().onPreferenceChange(logo, false));
            org.junit.Assert.assertFalse(BaseSettings.SETTINGS_ROW.savedValue());
            org.junit.Assert.assertFalse(BaseSettings.SETTINGS_LOGO_PRESS.savedValue());
            org.junit.Assert.assertFalse("the last way in can still be switched off", shortcut.isEnabled());
            org.junit.Assert.assertEquals("Stays on, since it's the only way left into these settings.",
                    String.valueOf(shortcut.getSummary()));
            org.junit.Assert.assertFalse("turning off the last way in went through",
                    shortcut.getOnPreferenceChangeListener().onPreferenceChange(shortcut, false));
            assertTrue(BaseSettings.SETTINGS_SHORTCUT.savedValue());
            assertTrue("the ways that are off can be turned back on", row.isEnabled() && logo.isEnabled());

            // The shared fragment enables each row it syncs, and the last one stays greyed out after.
            page.refreshSwitches();
            org.junit.Assert.assertFalse("a sync turned the last way in back on", shortcut.isEnabled());

            assertTrue(logo.getOnPreferenceChangeListener().onPreferenceChange(logo, true));
            assertTrue("a second way in didn't free the shortcut", shortcut.isEnabled());
            org.junit.Assert.assertEquals(shortcutSummary, String.valueOf(shortcut.getSummary()));
        }
    }

    /**
     * A Threads build the row and the long press don't fit has only the shortcut, and App info's
     * way in, so the page offers no switch for the other two and the shortcut stays on.
     */
    @Test public void aBuildWithOnlyTheShortcutKeepsIt() {
        WaysInForTests.set(false, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushThreadsPreferenceFragment page = new HushThreadsPreferenceFragment();
            controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
            assertNull("a switch for a row this build hasn't got", page.findPreference(BaseSettings.SETTINGS_ROW.key));
            assertNull("a switch for a long press this build hasn't got",
                    page.findPreference(BaseSettings.SETTINGS_LOGO_PRESS.key));
            org.junit.Assert.assertFalse("the only way in can be switched off",
                    way(page, BaseSettings.SETTINGS_SHORTCUT).isEnabled());

            // Stored off from a build that had the other two, it's still published.
            BaseSettings.SETTINGS_SHORTCUT.save(false);
            assertTrue(SettingsEntry.shortcutOn());
        } finally {
            WaysInForTests.set(true, true);
        }
    }

    /** All three stored off can't leave the screen unreachable from Threads: each of them comes back on. */
    @Test public void everyWayStoredOffComesBackOn() {
        BaseSettings.SETTINGS_SHORTCUT.save(false);
        BaseSettings.SETTINGS_ROW.save(false);
        BaseSettings.SETTINGS_LOGO_PRESS.save(false);
        assertTrue(SettingsEntry.shortcutOn());
        assertTrue(SettingsEntry.rowOn());
        assertTrue(SettingsEntry.logoPressOn());
        org.junit.Assert.assertSame(ThreadsLogo.LONG_PRESS, ThreadsLogo.longPress());

        BaseSettings.SETTINGS_ROW.save(true);
        org.junit.Assert.assertFalse(SettingsEntry.shortcutOn());
        org.junit.Assert.assertFalse(SettingsEntry.logoPressOn());
        assertTrue(SettingsEntry.rowOn());
    }

    /**
     * A Threads build the patch fits but that has none of the row's icons never draws the row, so
     * it isn't a way back in: the page offers no switch for it, and with the logo off the shortcut
     * is the last way in and stays on.
     */
    @Test public void aRowThreadsCantDrawIsntAWayIn() {
        ThreadsSettingsRow.icon = 0;
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushThreadsPreferenceFragment page = new HushThreadsPreferenceFragment();
            controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
            assertNull("a switch for a row Threads can't draw", page.findPreference(BaseSettings.SETTINGS_ROW.key));
            android.preference.SwitchPreference shortcut = way(page, BaseSettings.SETTINGS_SHORTCUT);
            android.preference.SwitchPreference logo = way(page, BaseSettings.SETTINGS_LOGO_PRESS);

            assertTrue(logo.getOnPreferenceChangeListener().onPreferenceChange(logo, false));
            org.junit.Assert.assertFalse("the row that's never drawn counted as a way back in", shortcut.isEnabled());
            org.junit.Assert.assertFalse("the shortcut went off with only the undrawn row left",
                    shortcut.getOnPreferenceChangeListener().onPreferenceChange(shortcut, false));
            assertTrue(BaseSettings.SETTINGS_SHORTCUT.savedValue());
        } finally {
            ThreadsSettingsRow.icon = -1;
        }
    }

    /**
     * All three stored off put the shortcut up as the way back in. Turning just the row on makes
     * the row the way in, so the shortcut leaves the launcher's menu again.
     */
    @Test public void turningTheRowOnWhenAllWereOffTakesTheShortcutOut() throws Exception {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        BaseSettings.SETTINGS_SHORTCUT.save(false);
        BaseSettings.SETTINGS_ROW.save(false);
        BaseSettings.SETTINGS_LOGO_PRESS.save(false);
        SettingsEntry.publishShortcutNow(context);
        assertNotNull("all three off left no shortcut", shortcut(manager, SettingsEntry.SHORTCUT_ID));
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushThreadsPreferenceFragment page = new HushThreadsPreferenceFragment();
            controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
            android.preference.SwitchPreference row = way(page, BaseSettings.SETTINGS_ROW);
            assertTrue(row.getOnPreferenceChangeListener().onPreferenceChange(row, true));
            app.morphe.extension.shared.Utils.awaitBackgroundTasksForTests();
            assertNull("the shortcut stayed in the menu with the row on", shortcut(manager, SettingsEntry.SHORTCUT_ID));
        }
    }

    /** The switches are kept while paused, like the shortcut's: a pause doesn't bring the row or the long press back. */
    @Test public void aPauseLeavesTheRowAndTheLongPressAsTheirSwitchesSay() {
        BaseSettings.SETTINGS_ROW.save(false);
        BaseSettings.SETTINGS_LOGO_PRESS.save(false);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        try {
            assertTrue("the test didn't pause HushThreads", HushThreadsPause.isPaused());
            org.junit.Assert.assertFalse("a pause brought the row back", SettingsEntry.rowOn());
            assertNull("a pause brought the long press back", ThreadsLogo.longPress());
        } finally {
            PauseForTests.resume();
        }
    }

    private static android.preference.SwitchPreference way(HushThreadsPreferenceFragment page,
                                                           app.morphe.extension.shared.settings.BooleanSetting setting) {
        android.preference.SwitchPreference row = (android.preference.SwitchPreference) page.findPreference(setting.key);
        assertNotNull("no switch for " + setting.key, row);
        return row;
    }

    /** What the platform leaves after Threads' pushes rank ahead of the HushThreads shortcut. */
    private static void demote(android.content.Context context, android.content.pm.ShortcutManager manager,
                               int rank, String label) {
        manager.pushDynamicShortcut(new android.content.pm.ShortcutInfo.Builder(context, SettingsEntry.SHORTCUT_ID)
                .setShortLabel("HushThreads")
                .setLongLabel(label)
                .setIntent(new Intent(Intent.ACTION_VIEW))
                .setRank(rank)
                .build());
        org.junit.Assert.assertEquals(rank, shortcut(manager, SettingsEntry.SHORTCUT_ID).getRank());
    }

    private static android.content.pm.ShortcutInfo threadsShortcut(android.content.Context context, String id) {
        return new android.content.pm.ShortcutInfo.Builder(context, id)
                .setShortLabel(id)
                .setIntent(new Intent(Intent.ACTION_VIEW))
                .setRank(0)
                .build();
    }

    private static android.content.pm.ShortcutInfo shortcut(android.content.pm.ShortcutManager manager, String id) {
        for (android.content.pm.ShortcutInfo shortcut : manager.getDynamicShortcuts()) {
            if (id.equals(shortcut.getId())) return shortcut;
        }
        return null;
    }

    /**
     * The shortcut starts Threads' own launcher activity by name, with the extra that asks for the
     * screen. A component Threads doesn't have would leave the shortcut greyed out on the launcher.
     */
    @Test public void theShortcutStartsThreadsLauncherActivity() {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);

        Intent intent = shortcut(manager, SettingsEntry.SHORTCUT_ID).getIntent();
        assertNotNull("the shortcut carries no intent", intent);
        org.junit.Assert.assertEquals(new android.content.ComponentName(context.getPackageName(),
                "com.instagram.barcelona.mainactivity.BarcelonaActivity"), intent.getComponent());
        assertTrue("the shortcut doesn't ask for the screen",
                intent.getBooleanExtra(SettingsEntry.EXTRA_OPEN_SETTINGS, false));
    }

    /**
     * "Additional settings in the app" on Android's App info page starts the launcher activity with
     * ACTION_APPLICATION_PREFERENCES, and the screen opens over it. The action is spent, so a
     * recreated activity doesn't ask again and Threads goes on as if started from its icon.
     */
    @Test public void appInfosAdditionalSettingsOpensTheScreen() {
        Intent fromAppInfo = new Intent(Intent.ACTION_APPLICATION_PREFERENCES);
        ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class, fromAppInfo).create();
        SettingsEntry.onActivityCreate(activity.get());
        activity.start().resume();
        ShadowLooper.idleMainLooper();

        assertNotNull("App info's request didn't open the screen", dialogOver(activity.get()));
        org.junit.Assert.assertEquals(Intent.ACTION_MAIN, activity.get().getIntent().getAction());
    }

    /**
     * The HushThreads row in Threads' own settings opens the screen over the Threads screen in
     * front. Threads calls the row's click as a Kotlin Function0 and drops what it answers.
     */
    @Test public void theRowInThreadsOwnSettingsOpensTheScreen() {
        ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class,
                new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)).create();
        SettingsEntry.onActivityCreate(activity.get());
        activity.start().resume();
        ShadowLooper.idleMainLooper();
        assertNull("a launch from the icon opened the screen", dialogOver(activity.get()));

        Object answer = new ThreadsSettingsRow.Click().invoke();
        ShadowLooper.idleMainLooper();

        assertNull(answer);
        assertNotNull("the row didn't open the screen", dialogOver(activity.get()));
    }

    /**
     * A long press on the Threads logo at the top of the home feed opens the screen over the Threads
     * screen in front. Compose calls the long press as a Kotlin Function0 and drops what it answers.
     */
    @Test public void aLongPressOnTheThreadsLogoOpensTheScreen() {
        ActivityController<Activity> activity = resumedLauncher();
        assertNull("a launch from the icon opened the screen", dialogOver(activity.get()));

        Object answer = ThreadsLogo.LONG_PRESS.invoke();
        ShadowLooper.idleMainLooper();

        assertNull(answer);
        assertNotNull("the long press didn't open the screen", dialogOver(activity.get()));
    }

    @Test public void theLogoLongPressHasATranslatedAccessibilityLabel() {
        org.junit.Assert.assertEquals("Open HushThreads settings", ThreadsLogo.longClickLabel());
        RuntimeEnvironment.setQualifiers("+de");
        org.junit.Assert.assertEquals(app.morphe.extension.shared.L10nTablesForTests.of("de")
                .get("Open HushThreads settings"), ThreadsLogo.longClickLabel());
    }

    /**
     * TalkBack calls the logo by the app's name, which isn't translated, and Compose drops what
     * the description answers. Unpatched, describe() is the extension's empty stub.
     */
    @Test public void theLogoIsDescribedByTheAppsName() {
        org.junit.Assert.assertEquals("Threads", ThreadsLogo.LABEL);
        assertNull(ThreadsLogo.DESCRIBE.invoke(new Object()));
    }

    /** The screen is where HushThreads is resumed, so the logo opens it while HushThreads is paused. */
    @Test public void aLongPressOnTheThreadsLogoOpensTheScreenWhilePaused() {
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        try {
            assertTrue("the test didn't pause HushThreads", HushThreadsPause.isPaused());
            ActivityController<Activity> activity = resumedLauncher();

            new ThreadsLogo.LongPress().invoke();
            ShadowLooper.idleMainLooper();

            assertNotNull("the long press didn't open the screen while paused", dialogOver(activity.get()));
        } finally {
            PauseForTests.resume();
        }
    }

    /** Threads' launcher activity, started from the icon and in front. */
    private static ActivityController<Activity> resumedLauncher() {
        ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class,
                new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)).create();
        SettingsEntry.onActivityCreate(activity.get());
        activity.start().resume();
        ShadowLooper.idleMainLooper();
        return activity;
    }

    /**
     * With Threads already running, App info's request reaches the activity through onNewIntent,
     * and the screen opens when it resumes. A plain launch from the icon opens nothing.
     */
    @Test public void appInfosRequestOpensTheScreenOverARunningThreads() {
        ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class,
                new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)).create();
        SettingsEntry.onActivityCreate(activity.get());
        activity.start().resume();
        ShadowLooper.idleMainLooper();
        assertNull("a launch from the icon opened the screen", dialogOver(activity.get()));

        activity.pause();
        Intent fromAppInfo = new Intent(Intent.ACTION_APPLICATION_PREFERENCES);
        SettingsEntry.onNewIntent(activity.get(), fromAppInfo);
        activity.resume();
        ShadowLooper.idleMainLooper();

        assertNotNull("App info's request didn't open the screen", dialogOver(activity.get()));
        org.junit.Assert.assertEquals(Intent.ACTION_MAIN, fromAppInfo.getAction());
    }

    /**
     * Signed out, the shortcut's screen lands on the login screen, and Threads replaces that with
     * its logged-out screen a moment later. Android resumes the replacement before it destroys the
     * login screen, so the replacement is already in front when the request comes back, and it
     * never resumes again to pick it up. On a phone that left the request pending until it expired.
     */
    @Test public void theScreenFollowsItsHostToAReplacementAlreadyInFront() {
        ActivityController<Activity> login = openedOverNewActivity();

        ActivityController<Activity> loggedOut = replace(login);

        assertNotNull("the screen was lost when its host went away", dialogOver(loggedOut.get()));
    }

    @Test public void aScreenThePersonClosedStaysClosedWhenItsHostGoesAway() {
        ActivityController<Activity> login = openedOverNewActivity();
        SettingsEntry.onClosedByUser();

        ActivityController<Activity> loggedOut = replace(login);

        assertNull("a screen the person closed came back", dialogOver(loggedOut.get()));
    }

    /**
     * The three ways a person leaves the screen (the title bar's arrow, the Back key and Back on the
     * recovery page) have to tell the entry so, or the screen follows its host to the next Threads
     * screen as if nobody had closed it. The request is still inside its window here, so a close
     * the entry didn't hear about would reopen it.
     */
    @Test public void backOnTheRecoveryPageKeepsTheScreenClosedWhenItsHostGoesAway() {
        HushThreadsPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
        ActivityController<Activity> login = openedOverNewActivity();
        android.preference.Preference back = pageOver(login.get()).findPreference("morphe_settings_error_back");
        assertNotNull("no recovery page", back);

        back.getOnPreferenceClickListener().onPreferenceClick(back);
        ShadowLooper.idleMainLooper();
        assertNull("Back left the screen open", dialogOver(login.get()));
        ActivityController<Activity> loggedOut = replace(login);

        assertNull("the screen came back after the person left it with Back", dialogOver(loggedOut.get()));
    }

    @Test public void theBackKeyKeepsTheScreenClosedWhenItsHostGoesAway() {
        ActivityController<Activity> login = openedOverNewActivity();

        ((SettingsDialog) dialogOver(login.get())).getDialog().onBackPressed();
        ShadowLooper.idleMainLooper();
        assertNull("the Back key left the screen open", dialogOver(login.get()));
        ActivityController<Activity> loggedOut = replace(login);

        assertNull("the screen came back after the person closed it with the Back key", dialogOver(loggedOut.get()));
    }

    /** The arrow dismisses rather than cancels, so it has to tell the entry itself. */
    @Test public void theTitleBarArrowKeepsTheScreenClosedWhenItsHostGoesAway() {
        ActivityController<Activity> login = openedOverNewActivity();
        SettingsDialog dialog = (SettingsDialog) dialogOver(login.get());
        ArrayList<View> labelled = new ArrayList<>();
        dialog.getView().findViewsWithText(labelled, "Back", View.FIND_VIEWS_WITH_CONTENT_DESCRIPTION);
        View arrow = null;
        for (View view : labelled) {
            if (view instanceof android.widget.ImageButton && ((android.widget.ImageButton) view).getDrawable() != null) arrow = view;
        }
        assertNotNull("no arrow in the title bar among " + labelled, arrow);

        assertTrue("the arrow didn't take the tap", arrow.performClick());
        ShadowLooper.idleMainLooper();
        assertNull("the arrow left the screen open", dialogOver(login.get()));
        ActivityController<Activity> loggedOut = replace(login);

        assertNull("the screen came back after the person closed it with the arrow", dialogOver(loggedOut.get()));
    }

    /**
     * The restart row restarts Threads with a marker naming its page. The next start takes the
     * marker, the same way onApplicationCreate does, and the screen opens over the first Threads
     * screen to resume, on that page. Closing it drops the page, so a later open starts at the top.
     */
    @Test public void aStartAfterTheRestartRowOpensTheScreenOnItsPage() {
        android.content.SharedPreferences store = app.morphe.extension.shared.settings.Setting.preferences.preferences;
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        try {
            org.junit.Assert.assertFalse("a start without a marker asked for the screen",
                    ReopenSettingsAfterRestart.reopenIfPending(SettingsEntry::reopenOn));
            ReopenSettingsAfterRestart.remember(store, "Appearance", android.os.SystemClock.elapsedRealtime());
            assertTrue(ReopenSettingsAfterRestart.reopenIfPending(SettingsEntry::reopenOn));
            org.junit.Assert.assertFalse("the marker outlived the start that read it",
                    store.contains("hush_reopen_settings_page"));

            ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup();
            ShadowLooper.idleMainLooper();
            SettingsDialog dialog = (SettingsDialog) dialogOver(activity.get());
            assertNotNull("the restart didn't open the screen again", dialog);
            org.junit.Assert.assertEquals("Appearance", dialog.startPage());
            android.widget.ListView list = pageOver(activity.get()).getView().findViewById(android.R.id.list);
            boolean onAppearance = false;
            for (int i = 0; i < list.getCount(); i++) {
                Object row = list.getItemAtPosition(i);
                if (row instanceof android.preference.Preference
                        && Settings.PURE_BLACK.key.equals(((android.preference.Preference) row).getKey())) onAppearance = true;
            }
            assertTrue("the screen didn't open on Appearance", onAppearance);

            // Appearance, the first page, and out: every page opens from the first one.
            SettingsL10nTest.backOf(dialog).performClick();
            SettingsL10nTest.backOf(dialog).performClick();
            ShadowLooper.idleMainLooper();
            assertNull("the screen stayed open", dialogOver(activity.get()));
            assertNull("closing the screen kept its page for the next open", SettingsEntry.requestedPage());

            // An ordinary start later on finds no marker and opens nothing.
            org.junit.Assert.assertFalse(ReopenSettingsAfterRestart.reopenIfPending(SettingsEntry::reopenOn));
            ActivityController<Activity> later = Robolectric.buildActivity(Activity.class).setup();
            ShadowLooper.idleMainLooper();
            assertNull("a later start opened the screen", dialogOver(later.get()));
        } finally {
            SettingsEntry.onClosedByUser();
            PatchFamily.inBuildForTests = null;
        }
    }

    /**
     * Threads takes Android's fragment state out of every activity it recreates, so a font size or
     * dark theme change, or Android ending Threads in the background, closed the screen for good
     * (seen on an emulator). It comes back over the recreated activity on the page it was on. One
     * the person closed stays closed.
     */
    @Test public void theScreenComesBackOnItsPageWhenThreadsRecreatesItsHost() {
        recreatedHostWithEveryPatch();
    }

    /**
     * Android 9 is the oldest Threads runs on, and no emulator image for it here can run Threads'
     * arm64 code, so its framework fragments get the same recreation here.
     */
    @Test @Config(sdk = 28) public void onAndroid9TheScreenComesBackWhenThreadsRecreatesItsHost() {
        recreatedHostWithEveryPatch();
    }

    private void recreatedHostWithEveryPatch() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        try {
            recreatedHostBringsTheScreenBack();
        } finally {
            SettingsEntry.onClosedByUser();
            PatchFamily.inBuildForTests = null;
        }
    }

    private void recreatedHostBringsTheScreenBack() {
        Intent shortcut = new Intent().putExtra(SettingsEntry.EXTRA_OPEN_SETTINGS, true);
        ActivityController<ThreadsLikeActivity> activity = Robolectric.buildActivity(ThreadsLikeActivity.class, shortcut).create();
        SettingsEntry.onActivityCreate(activity.get());
        activity.start().resume();
        ShadowLooper.idleMainLooper();
        tapRow(activity.get(), "section_Feed");
        org.junit.Assert.assertEquals("Feed", pageOver(activity.get()).navigation.route());
        // Long after the request, so only the activity's saved state can bring the screen back.
        ShadowLooper.idleMainLooper(5, java.util.concurrent.TimeUnit.MINUTES);

        activity.recreate();
        ShadowLooper.idleMainLooper();

        assertNotNull("the screen closed when Threads recreated its activity", dialogOver(activity.get()));
        org.junit.Assert.assertEquals("the screen came back on another page",
                "Feed", pageOver(activity.get()).navigation.route());

        // Feed, the first page, and out.
        SettingsL10nTest.backOf((SettingsDialog) dialogOver(activity.get())).performClick();
        SettingsL10nTest.backOf((SettingsDialog) dialogOver(activity.get())).performClick();
        ShadowLooper.idleMainLooper();
        assertNull("the screen stayed open", dialogOver(activity.get()));
        activity.recreate();
        ShadowLooper.idleMainLooper();
        assertNull("a screen the person closed came back with its activity", dialogOver(activity.get()));
    }

    /**
     * Android 9 resumes only the focused side of a split screen. A font size or theme change made
     * in the other side recreates Threads there without resuming it, and the screen used to be
     * dropped once its request was 30 seconds old. It waits for that activity however long it
     * takes, while another Threads screen that resumes late doesn't get it.
     */
    @Test @Config(sdk = 28) public void onAndroid9ARecreatedSideThatResumesLateStillGetsTheScreen() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        try {
            Intent shortcut = new Intent().putExtra(SettingsEntry.EXTRA_OPEN_SETTINGS, true);
            ActivityController<ThreadsLikeActivity> side = Robolectric.buildActivity(ThreadsLikeActivity.class, shortcut).create();
            SettingsEntry.onActivityCreate(side.get());
            side.start().resume();
            ShadowLooper.idleMainLooper();
            tapRow(side.get(), "section_Feed");
            ShadowLooper.idleMainLooper(5, java.util.concurrent.TimeUnit.MINUTES);

            // The other side takes focus, and its change recreates Threads, which stays paused.
            // Built by hand: Robolectric's recreate() passes through a resume.
            side.pause();
            android.os.Bundle saved = new android.os.Bundle();
            side.saveInstanceState(saved);
            side.stop().destroy();
            ActivityController<ThreadsLikeActivity> rebuilt = Robolectric.buildActivity(ThreadsLikeActivity.class, side.getIntent())
                    .create(saved).start().postCreate(saved);
            ShadowLooper.idleMainLooper(2, java.util.concurrent.TimeUnit.MINUTES);
            ActivityController<ThreadsLikeActivity> other = Robolectric.buildActivity(ThreadsLikeActivity.class).setup();
            ShadowLooper.idleMainLooper();
            assertNull("a Threads screen that resumed late took the screen", dialogOver(other.get()));
            other.pause().stop().destroy();

            rebuilt.resume();
            ShadowLooper.idleMainLooper();
            assertNotNull("the screen was dropped while its side waited for focus", dialogOver(rebuilt.get()));
            org.junit.Assert.assertEquals("Feed", pageOver(rebuilt.get()).navigation.route());
        } finally {
            SettingsEntry.onClosedByUser();
            PatchFamily.inBuildForTests = null;
        }
    }

    /**
     * The screen open over two Threads activities: closing the copy over the second leaves the
     * first's copy to come back when Threads recreates the first. One closed flag for every copy
     * used to make the first activity skip saving its own.
     */
    @Test public void closingOneCopyKeepsTheOtherAcrossARecreation() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        try {
            Intent shortcut = new Intent().putExtra(SettingsEntry.EXTRA_OPEN_SETTINGS, true);
            ActivityController<ThreadsLikeActivity> first = Robolectric.buildActivity(ThreadsLikeActivity.class, shortcut).create();
            SettingsEntry.onActivityCreate(first.get());
            first.start().resume();
            ShadowLooper.idleMainLooper();
            assertNotNull("the shortcut opened nothing", dialogOver(first.get()));

            first.pause();
            ActivityController<ThreadsLikeActivity> second = Robolectric.buildActivity(ThreadsLikeActivity.class).setup();
            first.stop();
            assertTrue(SettingsEntry.open(second.get()));
            ShadowLooper.idleMainLooper();
            SettingsL10nTest.backOf((SettingsDialog) dialogOver(second.get())).performClick();
            ShadowLooper.idleMainLooper();
            assertNull("the second copy stayed open", dialogOver(second.get()));
            second.pause();
            first.start().resume();
            second.stop().destroy();
            ShadowLooper.idleMainLooper();
            assertNotNull("the first copy closed with the second", dialogOver(first.get()));

            // Long after the request, so only the activity's saved state can bring the screen back.
            ShadowLooper.idleMainLooper(5, java.util.concurrent.TimeUnit.MINUTES);
            first.recreate();
            ShadowLooper.idleMainLooper();
            assertNotNull("closing the other copy lost this one", dialogOver(first.get()));
        } finally {
            SettingsEntry.onClosedByUser();
            PatchFamily.inBuildForTests = null;
        }
    }

    /**
     * A file picked while Threads rebuilt its activity behind the picker reaches the settings it
     * brings back. The answer used to go to the page that asked, by a name the rebuilt activity no
     * longer had, so the file went nowhere and the screen came back as if nothing was picked.
     */
    @Test public void aFilePickedWhileThreadsRebuildsReachesTheSettingsItBringsBack() throws Exception {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        SettingsFileProvider.install("settings-entry");
        try {
            Intent shortcut = new Intent().putExtra(SettingsEntry.EXTRA_OPEN_SETTINGS, true);
            ActivityController<ThreadsLikeActivity> activity = Robolectric.buildActivity(ThreadsLikeActivity.class, shortcut).create();
            SettingsEntry.onActivityCreate(activity.get());
            activity.start().resume();
            ShadowLooper.idleMainLooper();
            SettingsBackupTest.listPicker(activity.get());
            HushThreadsPreferenceFragment asked = pageOver(activity.get());
            android.preference.Preference row = asked.findPreference("action_import_settings");
            row.getOnPreferenceClickListener().onPreferenceClick(row);
            Intent around = org.robolectric.Shadows.shadowOf(activity.get()).getNextStartedActivity();
            assertNotNull("Import opened nothing", around);
            ActivityController<SettingsFilePicker> picker = Robolectric.buildActivity(SettingsFilePicker.class, around).create();
            org.robolectric.shadows.ShadowActivity.IntentForResult started =
                    org.robolectric.Shadows.shadowOf(picker.get()).getNextStartedActivityForResult();

            // Covered by the picker, Threads is rebuilt without its fragments, as a font size change does.
            activity.pause().stop();
            activity.recreate();
            ShadowLooper.idleMainLooper();
            android.net.Uri file = SettingsFileProvider.put("settings-entry", "picked.json",
                    SettingsBackup.create().getBytes(java.nio.charset.StandardCharsets.UTF_8));
            org.robolectric.Shadows.shadowOf(picker.get()).receiveResult(started.intent, Activity.RESULT_OK,
                    new Intent().setData(file).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION
                            | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION));
            // Held while the file waits for the settings, since the picker's own access ends with it.
            org.junit.Assert.assertEquals("the file's access wasn't kept while it waited", 1,
                    activity.get().getContentResolver().getPersistedUriPermissions().size());
            activity.start().resume();
            for (int round = 0; round < 3; round++) {
                app.morphe.extension.shared.Utils.awaitBackgroundTasksForTests();
                ShadowLooper.idleMainLooper();
            }
            assertTrue("the file's access was kept after the read",
                    activity.get().getContentResolver().getPersistedUriPermissions().isEmpty());

            HushThreadsPreferenceFragment page = pageOver(activity.get());
            org.junit.Assert.assertNotSame("the settings weren't rebuilt", asked, page);
            android.app.AlertDialog preview = org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
            assertNotNull("the picked file went nowhere", preview);
            assertTrue(preview.isShowing());
            org.junit.Assert.assertEquals("Your switches already match that file, so nothing will change.",
                    String.valueOf(org.robolectric.Shadows.shadowOf(preview).getMessage()));
            preview.cancel();
            ShadowLooper.idleMainLooper();
        } finally {
            SettingsEntry.onClosedByUser();
            SettingsBackupPreference.forgetPickForTests();
            SettingsFileGrants.forgetProcessForTests();
            PatchFamily.inBuildForTests = null;
        }
    }

    /** Threads' start lets go of the access to a settings file an ended process kept. */
    @Test public void threadsStartingLetsGoOfFileAccessAnEndedProcessKept() throws Exception {
        android.content.Context application = RuntimeEnvironment.getApplication();
        SettingsFileProvider.install("settings-entry");
        android.net.Uri left = SettingsFileProvider.put("settings-entry", "left.json", new byte[0]);
        SettingsFileGrants.take(application, left, Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);
        SettingsFileGrants.forgetProcessForTests();
        org.junit.Assert.assertEquals(1, application.getContentResolver().getPersistedUriPermissions().size());

        // Not the Application itself, so no second lifecycle watcher is registered.
        SettingsEntry.onApplicationCreate(new android.content.ContextWrapper(application));
        app.morphe.extension.shared.Utils.awaitBackgroundTasksForTests();
        assertTrue("the start kept the ended process's access",
                application.getContentResolver().getPersistedUriPermissions().isEmpty());
    }

    /**
     * A crash kept in the first minute lists the switches. The settings screen registered them, so a
     * start that crashed before anyone opened it kept a report with no [PATCHES] section.
     */
    @Test public void threadsStartingRegistersTheSwitchesACrashReportKeeps() throws Exception {
        android.content.Context application = RuntimeEnvironment.getApplication();
        app.morphe.extension.shared.settings.preference.ReportSectionsForTests.clear();
        PatchFamily.inBuildForTests = java.util.EnumSet.of(PatchFamily.HIDE_ADS);
        try {
            org.junit.Assert.assertEquals("", app.morphe.extension.shared.settings.preference.ReportSectionsForTests.keptWithACrash());
            SettingsEntry.onApplicationCreate(new android.content.ContextWrapper(application));
            app.morphe.extension.shared.Utils.awaitBackgroundTasksForTests();
            String kept = app.morphe.extension.shared.settings.preference.ReportSectionsForTests.keptWithACrash();
            assertTrue("the start registered no switches: " + kept, kept.startsWith("\n[PATCHES]\n"));
        } finally {
            PatchFamily.inBuildForTests = null;
        }
    }

    /** Takes Android's fragment state out before it's restored, as Threads' IgFragmentActivity does. */
    public static final class ThreadsLikeActivity extends Activity {
        @Override protected void onCreate(android.os.Bundle state) {
            if (state != null) state.remove("android:fragments");
            super.onCreate(state);
        }
    }

    private static void tapRow(Activity activity, String key) {
        android.widget.ListView list = pageOver(activity).getView().findViewById(android.R.id.list);
        for (int i = 0; i < list.getCount(); i++) {
            Object row = list.getItemAtPosition(i);
            if (!(row instanceof android.preference.Preference) || !key.equals(((android.preference.Preference) row).getKey())) continue;
            assertTrue(list.performItemClick(list.getAdapter().getView(i, null, list), i, list.getAdapter().getItemId(i)));
            ShadowLooper.idleMainLooper();
            return;
        }
        org.junit.Assert.fail("No row " + key);
    }

    @SuppressWarnings("deprecation")
    private static HushThreadsPreferenceFragment pageOver(Activity activity) {
        SettingsDialog dialog = (SettingsDialog) dialogOver(activity);
        assertNotNull("no screen over " + activity, dialog);
        return (HushThreadsPreferenceFragment) dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
    }

    /** An activity started by the launcher shortcut, with the screen open over it. */
    private static ActivityController<Activity> openedOverNewActivity() {
        Intent shortcut = new Intent().putExtra(SettingsEntry.EXTRA_OPEN_SETTINGS, true);
        ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class, shortcut).create();
        SettingsEntry.onActivityCreate(activity.get());
        activity.start().resume();
        ShadowLooper.idleMainLooper();
        assertNotNull("the screen did not open over the shortcut's activity", dialogOver(activity.get()));
        return activity;
    }

    /** The order Android uses when an activity starts the next one and finishes. */
    private static ActivityController<Activity> replace(ActivityController<Activity> current) {
        current.pause();
        ActivityController<Activity> next = Robolectric.buildActivity(Activity.class).create().start().resume();
        current.stop().destroy();
        ShadowLooper.idleMainLooper();
        return next;
    }

    private static Object dialogOver(Activity activity) {
        return activity.getFragmentManager().findFragmentByTag("hushthreads_settings");
    }
}
