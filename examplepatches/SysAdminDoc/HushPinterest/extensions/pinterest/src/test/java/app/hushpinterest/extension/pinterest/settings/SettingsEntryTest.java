/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.widget.TextView;

import java.util.ArrayList;

import app.hushpinterest.extension.shared.SettingsContextRule;

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
        app.hushpinterest.extension.shared.Utils.setActivity(null);
        HushPinterestPreferenceFragment.failNextInitialization = null;
    }

    @Test public void registeredLifecycleProvidesTheLiveHostAndKeepsItDuringTheSavePicker() {
        ActivityController<Activity> first = Robolectric.buildActivity(Activity.class).setup();
        ActivityController<Activity> second = null;
        try {
            assertSame(first.get(), app.hushpinterest.extension.shared.Utils.getActivity());
            first.pause().stop();
            assertSame("the external save picker must keep its Pinterest host", first.get(),
                    app.hushpinterest.extension.shared.Utils.getActivity());
            second = Robolectric.buildActivity(Activity.class).setup();
            assertSame(second.get(), app.hushpinterest.extension.shared.Utils.getActivity());
            first.destroy();
            assertSame("destroying an old screen must keep its replacement", second.get(),
                    app.hushpinterest.extension.shared.Utils.getActivity());
            second.pause().stop().destroy();
            assertNull(app.hushpinterest.extension.shared.Utils.getActivity());
        } finally {
            if (!first.get().isDestroyed()) first.close();
            if (second != null && !second.get().isDestroyed()) second.close();
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
        org.junit.Assert.assertEquals("HushPinterest settings", longLabel(manager));

        RuntimeEnvironment.setQualifiers("+de");
        SettingsEntry.publishShortcutNow(context);
        org.junit.Assert.assertEquals(app.hushpinterest.extension.shared.L10nTablesForTests.of("de").get("HushPinterest settings"),
                longLabel(manager));
        org.junit.Assert.assertEquals("one shortcut, relabelled, not two", 1, manager.getDynamicShortcuts().size());
    }

    /**
     * Pinterest sets its own language after the application starts, so the label published then
     * is in the phone's. On a German phone with Pinterest in English it stayed German next to an
     * English screen. The next Pinterest screen to resume labels it again in Pinterest's language.
     */
    @Test public void theShortcutIsLabelledAgainOnceThreadsHasSetItsLanguage() throws Exception {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);
        org.junit.Assert.assertEquals("HushPinterest settings", longLabel(manager));

        RuntimeEnvironment.setQualifiers("+de");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            app.hushpinterest.extension.shared.Utils.awaitBackgroundTasksForTests();
            org.junit.Assert.assertEquals(app.hushpinterest.extension.shared.L10nTablesForTests.of("de").get("HushPinterest settings"),
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
     * Pinterest pushes its own shortcuts at rank 0, and the platform ranks the newest push first, so
     * the HushPinterest one ended up last. A launcher that shows three or four of them, or two next
     * to a notification, cut it off. Pinterest's push still goes through, and then the HushPinterest
     * shortcut goes back in front.
     */
    @Test public void threadsOwnPushLeavesTheHushPinterestShortcutFirst() throws Exception {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);
        demote(context, manager, 3, "HushPinterest settings");

        SettingsEntry.pushDynamicShortcut(manager, threadsShortcut(context, "compose"));
        app.hushpinterest.extension.shared.Utils.awaitBackgroundTasksForTests();

        assertNotNull("Pinterest's own push was lost", shortcut(manager, "compose"));
        org.junit.Assert.assertEquals("the HushPinterest shortcut stayed behind Pinterest's own",
                0, shortcut(manager, SettingsEntry.SHORTCUT_ID).getRank());
    }

    /** An update of Pinterest's shortcuts can rank them again too, and its answer is Pinterest's own. */
    @Test public void threadsUpdateKeepsItsAnswerAndTheHushPinterestShortcutFirst() throws Exception {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);
        manager.pushDynamicShortcut(threadsShortcut(context, "search"));
        demote(context, manager, 1, "HushPinterest settings");

        boolean updated = SettingsEntry.updateShortcuts(manager,
                java.util.Collections.singletonList(threadsShortcut(context, "search")));
        app.hushpinterest.extension.shared.Utils.awaitBackgroundTasksForTests();

        assertTrue("Pinterest's update answered false", updated);
        org.junit.Assert.assertEquals(0, shortcut(manager, SettingsEntry.SHORTCUT_ID).getRank());
    }

    /** A call that replaces every dynamic shortcut took the HushPinterest one with it. */
    @Test public void threadsReplacingItsShortcutsPublishesTheHushPinterestOneAgain() throws Exception {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);

        boolean set = SettingsEntry.setDynamicShortcuts(manager,
                java.util.Collections.singletonList(threadsShortcut(context, "activity")));
        app.hushpinterest.extension.shared.Utils.awaitBackgroundTasksForTests();

        assertTrue("Pinterest's replacement answered false", set);
        assertNotNull("Pinterest's own shortcut was lost", shortcut(manager, "activity"));
        android.content.pm.ShortcutInfo ours = shortcut(manager, SettingsEntry.SHORTCUT_ID);
        assertNotNull("the HushPinterest shortcut stayed gone", ours);
        org.junit.Assert.assertEquals(0, ours.getRank());
        org.junit.Assert.assertEquals("HushPinterest settings", String.valueOf(ours.getLongLabel()));
    }

    /** Each start checks the place as well as the label, so a shortcut left behind comes back first. */
    @Test public void theNextStartPutsAShortcutLeftBehindBackInFront() {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        SettingsEntry.publishShortcutNow(context);
        demote(context, manager, 2, "HushPinterest settings");

        SettingsEntry.publishShortcutNow(context);

        org.junit.Assert.assertEquals(0, shortcut(manager, SettingsEntry.SHORTCUT_ID).getRank());
        org.junit.Assert.assertEquals(1, manager.getDynamicShortcuts().size());
    }

    /**
     * The process Pinterest pushes from may not have Pinterest's language yet, so moving the shortcut
     * back keeps the label it has. Relabelled in the phone's language there, it flipped between
     * the two languages each time Pinterest pushed.
     */
    @Test public void movingTheShortcutBackKeepsItsLabel() {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.content.pm.ShortcutManager manager = context.getSystemService(android.content.pm.ShortcutManager.class);
        String german = app.hushpinterest.extension.shared.L10nTablesForTests.of("de").get("HushPinterest settings");
        demote(context, manager, 3, german);

        SettingsEntry.keepFirstNow(context);

        org.junit.Assert.assertEquals(german, longLabel(manager));
        org.junit.Assert.assertEquals(0, shortcut(manager, SettingsEntry.SHORTCUT_ID).getRank());
    }

    /** What the platform leaves after Pinterest's pushes rank ahead of the HushPinterest shortcut. */
    private static void demote(android.content.Context context, android.content.pm.ShortcutManager manager,
                               int rank, String label) {
        manager.pushDynamicShortcut(new android.content.pm.ShortcutInfo.Builder(context, SettingsEntry.SHORTCUT_ID)
                .setShortLabel("HushPinterest")
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
     * The shortcut starts Pinterest's own launcher activity by name, with the extra that asks for the
     * screen. A component Pinterest doesn't have would leave the shortcut greyed out on the launcher.
     */
    @Test public void theShortcutStartsPinterestsLauncherActivity() {
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
     * recreated activity doesn't ask again and Pinterest goes on as if started from its icon.
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
     * With Pinterest already running, App info's request reaches the activity through onNewIntent,
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
     * Signed out, the shortcut's screen lands on the login screen, and Pinterest replaces that with
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
     * recovery page) have to tell the entry so, or the screen follows its host to the next Pinterest
     * screen as if nobody had closed it. The request is still inside its window here, so a close
     * the entry didn't hear about would reopen it.
     */
    @Test public void backOnTheRecoveryPageKeepsTheScreenClosedWhenItsHostGoesAway() {
        HushPinterestPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
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
    private static HushPinterestPreferenceFragment pageOver(Activity activity) {
        SettingsDialog dialog = (SettingsDialog) dialogOver(activity);
        assertNotNull("no screen over " + activity, dialog);
        return (HushPinterestPreferenceFragment) dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
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
        return activity.getFragmentManager().findFragmentByTag("hushpinterest_settings");
    }
}
