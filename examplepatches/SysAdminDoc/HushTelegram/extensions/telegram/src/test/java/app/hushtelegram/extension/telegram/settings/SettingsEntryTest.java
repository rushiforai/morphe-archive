/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.widget.TextView;

import java.util.ArrayList;

import app.hushtelegram.extension.shared.SettingsContextRule;

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
        HushTelegramPreferenceFragment.failNextInitialization = null;
    }

    @Test public void repeatedImmediateEntryOpensQueueExactlyOneDialog() {
        ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup();
        Activity activity = controller.get();
        try {
            assertTrue(SettingsEntry.open(activity));
            assertTrue(SettingsEntry.open(activity));
            activity.getFragmentManager().executePendingTransactions();
            org.junit.Assert.assertEquals("one dialog before either tap's transaction settles", 1,
                    activity.getFragmentManager().getFragments().stream()
                            .filter(fragment -> fragment instanceof SettingsDialog).count());
        } finally {
            SettingsEntry.onClosedByUser();
            controller.pause().stop().destroy();
        }
    }

    @Test public void nativeLauncherAndAppInfoRequestsShareTheExistingDialog() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            SettingsEntry.openFromNative(activity);
            SettingsEntry.openFromNative(activity);
            SettingsEntry.onNewIntent(activity, new Intent().putExtra(SettingsEntry.EXTRA_OPEN_SETTINGS, true));
            SettingsEntry.onNewIntent(activity, new Intent(Intent.ACTION_APPLICATION_PREFERENCES));
            watcher.onActivityResumed(activity);
            ShadowLooper.idleMainLooper();
            org.junit.Assert.assertEquals(1, activity.getFragmentManager().getFragments().stream()
                    .filter(fragment -> fragment instanceof SettingsDialog).count());
            Object shown = dialogOver(activity);
            SettingsEntry.openFromNative(activity);
            ShadowLooper.idleMainLooper();
            org.junit.Assert.assertSame(shown, dialogOver(activity));
            ((SettingsDialog) shown).getDialog().onBackPressed();
            ShadowLooper.idleMainLooper();
            assertNull(dialogOver(activity));
            SettingsEntry.openFromNative(activity);
            ShadowLooper.idleMainLooper();
            org.junit.Assert.assertNotSame(shown, dialogOver(activity));
            org.junit.Assert.assertEquals(1, activity.getFragmentManager().getFragments().stream()
                    .filter(fragment -> fragment instanceof SettingsDialog).count());
            SettingsEntry.onClosedByUser();
        }
    }

    @Test public void theNativeTitleUsesEveryExistingTranslation() {
        for (String language : new String[]{"de", "es", "in", "pt-rBR", "tr"}) {
            RuntimeEnvironment.setQualifiers(language);
            org.junit.Assert.assertEquals(language,
                    app.hushtelegram.extension.shared.L10nTablesForTests.of(language.toLowerCase(java.util.Locale.ROOT))
                            .get("HushTelegram settings"),
                    SettingsEntry.nativeSettingsTitle());
        }
    }

    @Test public void nativeEntryKeepsPartialSelectionsTruthfulWhileOffOrPaused() {
        try {
            Settings.HIDE_ADS.save(false);
            for (java.util.EnumSet<PatchFamily> selected : java.util.Arrays.asList(
                    java.util.EnumSet.noneOf(PatchFamily.class), java.util.EnumSet.of(PatchFamily.HIDE_ADS))) {
                PatchFamily.inBuildForTests = selected;
                PatchFamily.capabilitiesForTests = java.util.EnumSet.noneOf(PatchFamily.Capability.class);
                for (app.hushtelegram.extension.shared.settings.HushTelegramPause.Reason reason :
                        app.hushtelegram.extension.shared.settings.HushTelegramPause.Reason.values()) {
                    app.hushtelegram.extension.shared.settings.PauseForTests.pause(reason);
                    for (String route : new String[]{"native", "launcher", "app-info"}) {
                        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                            for (int request = 0; request < 2; request++) {
                                if (route.equals("native")) SettingsEntry.openFromNative(controller.get());
                                else SettingsEntry.onNewIntent(controller.get(), route.equals("launcher")
                                        ? new Intent().putExtra(SettingsEntry.EXTRA_OPEN_SETTINGS, true)
                                        : new Intent(Intent.ACTION_APPLICATION_PREFERENCES));
                                watcher.onActivityResumed(controller.get());
                            }
                            ShadowLooper.idleMainLooper();
                            org.junit.Assert.assertEquals(route, 1, controller.get().getFragmentManager().getFragments().stream()
                                    .filter(fragment -> fragment instanceof SettingsDialog).count());
                            HushTelegramPreferenceFragment page = pageOver(controller.get());
                            org.junit.Assert.assertEquals(selected.contains(PatchFamily.HIDE_ADS),
                                    page.findPreference(Settings.HIDE_ADS.key) != null);
                            assertNull(page.findPreference(Settings.HIDE_COMMERCE.key));
                            assertNull(page.findPreference(Settings.REPAIR_FIREBASE_PUSH.key));
                            assertNull(page.findPreference("local_notification_status"));
                            org.junit.Assert.assertFalse(Settings.HIDE_ADS.savedValue());
                            SettingsEntry.onClosedByUser();
                        }
                    }
                }
            }
        } finally {
            PatchFamily.inBuildForTests = null;
            PatchFamily.capabilitiesForTests = null;
            Settings.HIDE_ADS.resetToDefault();
            app.hushtelegram.extension.shared.settings.PauseForTests.resume();
        }
    }

    @Test public void nativeEntryWaitsForASuitableHostAndSurvivesRecreationOnce() {
        SettingsEntry.openFromNative(null);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            SettingsEntry.openFromNative(controller.get());
            ShadowLooper.idleMainLooper();
            controller.configurationChange();
            ShadowLooper.idleMainLooper();
            SettingsEntry.openFromNative(controller.get());
            ShadowLooper.idleMainLooper();
            org.junit.Assert.assertEquals(1, controller.get().getFragmentManager().getFragments().stream()
                    .filter(fragment -> fragment instanceof SettingsDialog).count());
            assertNotNull(pageOver(controller.get()));
            SettingsEntry.onClosedByUser();
        }
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
        org.junit.Assert.assertEquals("HushTelegram settings", longLabel(manager));

        RuntimeEnvironment.setQualifiers("+de");
        SettingsEntry.publishShortcutNow(context);
        org.junit.Assert.assertEquals(app.hushtelegram.extension.shared.L10nTablesForTests.of("de").get("HushTelegram settings"),
                longLabel(manager));
        org.junit.Assert.assertEquals("one shortcut, relabelled, not two", 1, manager.getDynamicShortcuts().size());
    }

    /**
     * Telegram sets its own language after the application starts, so the label published then
     * is in the phone's. On a German phone with Telegram in English it stayed German next to an
     * English screen. The next Telegram screen to resume labels it again in Telegram's language.
     */
    @Test public void theShortcutIsLabelledAgainOnceThreadsHasSetItsLanguage() throws Exception {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);
        org.junit.Assert.assertEquals("HushTelegram settings", longLabel(manager));

        RuntimeEnvironment.setQualifiers("+de");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            app.hushtelegram.extension.shared.Utils.awaitBackgroundTasksForTests();
            org.junit.Assert.assertEquals(app.hushtelegram.extension.shared.L10nTablesForTests.of("de").get("HushTelegram settings"),
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
     * Telegram pushes its own shortcuts at rank 0, and the platform ranks the newest push first, so
     * the HushTelegram one ended up last. A launcher that shows three or four of them, or two next
     * to a notification, cut it off. Telegram's push still goes through, and then the HushTelegram
     * shortcut goes back in front.
     */
    @Test public void threadsOwnPushLeavesTheHushTelegramShortcutFirst() throws Exception {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);
        demote(context, manager, 3, "HushTelegram settings");

        SettingsEntry.pushDynamicShortcut(manager, threadsShortcut(context, "compose"));
        app.hushtelegram.extension.shared.Utils.awaitBackgroundTasksForTests();

        assertNotNull("Telegram's own push was lost", shortcut(manager, "compose"));
        org.junit.Assert.assertEquals("the HushTelegram shortcut stayed behind Telegram's own",
                0, shortcut(manager, SettingsEntry.SHORTCUT_ID).getRank());
    }

    /** An update of Telegram's shortcuts can rank them again too, and its answer is Telegram's own. */
    @Test public void threadsUpdateKeepsItsAnswerAndTheHushTelegramShortcutFirst() throws Exception {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);
        manager.pushDynamicShortcut(threadsShortcut(context, "search"));
        demote(context, manager, 1, "HushTelegram settings");

        boolean updated = SettingsEntry.updateShortcuts(manager,
                java.util.Collections.singletonList(threadsShortcut(context, "search")));
        app.hushtelegram.extension.shared.Utils.awaitBackgroundTasksForTests();

        assertTrue("Telegram's update answered false", updated);
        org.junit.Assert.assertEquals(0, shortcut(manager, SettingsEntry.SHORTCUT_ID).getRank());
    }

    /** A call that replaces every dynamic shortcut took the HushTelegram one with it. */
    @Test public void threadsReplacingItsShortcutsPublishesTheHushTelegramOneAgain() throws Exception {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);

        boolean set = SettingsEntry.setDynamicShortcuts(manager,
                java.util.Collections.singletonList(threadsShortcut(context, "activity")));
        app.hushtelegram.extension.shared.Utils.awaitBackgroundTasksForTests();

        assertTrue("Telegram's replacement answered false", set);
        assertNotNull("Telegram's own shortcut was lost", shortcut(manager, "activity"));
        android.content.pm.ShortcutInfo ours = shortcut(manager, SettingsEntry.SHORTCUT_ID);
        assertNotNull("the HushTelegram shortcut stayed gone", ours);
        org.junit.Assert.assertEquals(0, ours.getRank());
        org.junit.Assert.assertEquals("HushTelegram settings", String.valueOf(ours.getLongLabel()));
    }

    /** Each start checks the place as well as the label, so a shortcut left behind comes back first. */
    @Test public void theNextStartPutsAShortcutLeftBehindBackInFront() {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);
        demote(context, manager, 2, "HushTelegram settings");

        SettingsEntry.publishShortcutNow(context);

        org.junit.Assert.assertEquals(0, shortcut(manager, SettingsEntry.SHORTCUT_ID).getRank());
        org.junit.Assert.assertEquals(1, manager.getDynamicShortcuts().size());
    }

    /**
     * The process Telegram pushes from may not have Telegram's language yet, so moving the shortcut
     * back keeps the label it has. Relabelled in the phone's language there, it flipped between
     * the two languages each time Telegram pushed.
     */
    @Test public void movingTheShortcutBackKeepsItsLabel() {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        String german = app.hushtelegram.extension.shared.L10nTablesForTests.of("de").get("HushTelegram settings");
        demote(context, manager, 3, german);

        SettingsEntry.keepFirstNow(context);

        org.junit.Assert.assertEquals(german, longLabel(manager));
        org.junit.Assert.assertEquals(0, shortcut(manager, SettingsEntry.SHORTCUT_ID).getRank());
    }

    /** What the platform leaves after Telegram's pushes rank ahead of the HushTelegram shortcut. */
    private static void demote(android.content.Context context, android.content.pm.ShortcutManager manager,
                               int rank, String label) {
        manager.pushDynamicShortcut(new android.content.pm.ShortcutInfo.Builder(context, SettingsEntry.SHORTCUT_ID)
                .setShortLabel("HushTelegram")
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
     * The shortcut starts Telegram's own launcher activity by name, with the extra that asks for the
     * screen. A component Telegram doesn't have would leave the shortcut greyed out on the launcher.
     */
    @Test public void theShortcutStartsTelegramsLauncherActivity() {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);

        Intent intent = shortcut(manager, SettingsEntry.SHORTCUT_ID).getIntent();
        assertNotNull("the shortcut carries no intent", intent);
        org.junit.Assert.assertEquals(new android.content.ComponentName(context.getPackageName(),
                SettingsEntry.LAUNCHER_ACTIVITY), intent.getComponent());
        assertTrue("the shortcut doesn't ask for the screen",
                intent.getBooleanExtra(SettingsEntry.EXTRA_OPEN_SETTINGS, false));
    }

    /**
     * "Additional settings in the app" on Android's App info page starts the launcher activity with
     * ACTION_APPLICATION_PREFERENCES, and the screen opens over it. The action is spent, so a
     * recreated activity doesn't ask again and Telegram goes on as if started from its icon.
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
     * With Telegram already running, App info's request reaches the activity through onNewIntent,
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
     * Signed out, the shortcut's screen lands on the login screen, and Telegram replaces that with
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
     * recovery page) have to tell the entry so, or the screen follows its host to the next Telegram
     * screen as if nobody had closed it. The request is still inside its window here, so a close
     * the entry didn't hear about would reopen it.
     */
    @Test public void backOnTheRecoveryPageKeepsTheScreenClosedWhenItsHostGoesAway() {
        HushTelegramPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
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

    @SuppressWarnings("deprecation")
    private static HushTelegramPreferenceFragment pageOver(Activity activity) {
        SettingsDialog dialog = (SettingsDialog) dialogOver(activity);
        assertNotNull("no screen over " + activity, dialog);
        return (HushTelegramPreferenceFragment) dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
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
        return activity.getFragmentManager().findFragmentByTag("hushtelegram_settings");
    }
}
