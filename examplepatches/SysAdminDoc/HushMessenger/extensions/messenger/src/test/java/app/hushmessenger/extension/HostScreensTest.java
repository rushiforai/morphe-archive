package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import java.time.Duration;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowApplication;
import org.robolectric.shadows.ShadowLog;
import org.robolectric.shadows.ShadowSystemClock;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class HostScreensTest {
    private static final int SEPARATE = Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_NEW_DOCUMENT
        | Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS;

    /** Stands in for the shortcut answer, fresh as of now, so its 30 s expiry can't swap in a real ShortcutManager read. */
    static void answerControlsShortcut(boolean present) {
        HostScreens.controlsShortcut = present;
        HostScreens.controlsShortcutAt = android.os.SystemClock.elapsedRealtime();
    }

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        CrashGuard.resetForTests();
        HostScreens.controlsShortcut = null;
        AndroidShortcutManager.rateLimited = false;
        AndroidShortcutManager.pushed = 0;
        realShortcutWork = HostScreens.shortcutWork;
        HostScreens.shortcutWork = Runnable::run;
        // A failed start takes the Bold and Italic entries out on this executor, so it runs inline here too.
        realTextStyleWork = TextStyleActivity.work;
        TextStyleActivity.work = Runnable::run;
    }

    private java.util.concurrent.Executor realShortcutWork, realTextStyleWork;

    @After public void forgetApplication() {
        HostScreens.shortcutWork = realShortcutWork;
        TextStyleActivity.work = realTextStyleWork;
        HostScreens.applicationCreated(null);
        Settings.initialize(RuntimeEnvironment.getApplication());
    }

    private static Intent host(String screen) {
        Intent intent = new Intent();
        if (screen != null) intent.putExtra(HostScreens.EXTRA, screen);
        return intent;
    }

    /**
     * What a Root Mount install looks like to the app: PackageManager has never heard of HushMessenger's activities.
     * Robolectric adds an activity back when a test builds it, so they're disabled too, as on the phone test.
     */
    private static void mount() {
        Application app = RuntimeEnvironment.getApplication();
        var packages = Shadows.shadowOf(app.getPackageManager());
        for (Class<?> screen : new Class<?>[] {SettingsActivity.class, RestartActivity.class}) {
            ComponentName name = new ComponentName(app, screen);
            app.getPackageManager().setComponentEnabledSetting(name, PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP);
            packages.removeActivity(name);
        }
    }

    @Test public void onlyAStockHostWithAScreenBecomesAHushMessengerScreen() {
        assertTrue(HostScreens.activityFor(HostScreens.SCREEN_HOST, host("settings")) instanceof SettingsActivity);
        assertTrue(HostScreens.activityFor(HostScreens.SCREEN_HOST, host("restart")) instanceof RestartActivity);
        for (String screen : new String[] {"settings", "restart"}) {
            assertTrue(HostScreens.activityFor(HostScreens.SHORTCUT_HOST, host(screen)) instanceof HostScreens.ShortcutTrampoline);
        }
        // Messenger's own use of either activity, other activities and other extras stay stock.
        assertNull(HostScreens.activityFor(HostScreens.SCREEN_HOST, host(null)));
        assertNull(HostScreens.activityFor(HostScreens.SHORTCUT_HOST, host(null)));
        assertNull(HostScreens.activityFor(HostScreens.SCREEN_HOST, host("other")));
        assertNull(HostScreens.activityFor("com.facebook.messenger.neue.MainActivity", host("settings")));
        assertNull(HostScreens.activityFor(null, host("settings")));
        assertNull(HostScreens.activityFor(HostScreens.SCREEN_HOST, null));
        Intent wrongType = new Intent().putExtra(HostScreens.EXTRA, 1);
        assertNull(HostScreens.activityFor(HostScreens.SCREEN_HOST, wrongType));
    }

    @Test public void aNormalInstallOpensTheRealScreensAsBefore() {
        Application app = RuntimeEnvironment.getApplication();
        assertFalse(HostScreens.hosted(app));
        Intent settings = HostScreens.intentFor(app, HostScreens.SETTINGS);
        assertEquals(new ComponentName(app, SettingsActivity.class), settings.getComponent());
        assertEquals(Intent.FLAG_ACTIVITY_NEW_TASK, settings.getFlags());
        assertFalse(settings.hasExtra(HostScreens.EXTRA));
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Intent restart = HostScreens.intentFor(screen.get(), HostScreens.RESTART);
            assertEquals(new ComponentName(app, RestartActivity.class), restart.getComponent());
            assertEquals(0, restart.getFlags());
        }
        assertEquals(Intent.FLAG_ACTIVITY_NEW_TASK, HostScreens.intentFor(app, HostScreens.RESTART).getFlags());
    }

    @Test public void aDisabledSettingsActivityCountsAsHosted() {
        Application app = RuntimeEnvironment.getApplication();
        app.getPackageManager().setComponentEnabledSetting(new ComponentName(app, SettingsActivity.class),
            PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP);
        assertTrue(HostScreens.hosted(app));
    }

    @Test public void aRootMountInstallOpensTheScreensInsideTheStockHost() {
        mount();
        Application app = RuntimeEnvironment.getApplication();
        assertTrue(HostScreens.hosted(app));
        Intent settings = HostScreens.intentFor(app, HostScreens.SETTINGS);
        assertEquals(new ComponentName(app.getPackageName(), HostScreens.SCREEN_HOST), settings.getComponent());
        assertEquals("settings", settings.getStringExtra(HostScreens.EXTRA));
        // The host shares Messenger's task affinity, so settings open as their own document task instead, kept out of
        // Recents like the installed settings.
        assertEquals(SEPARATE, settings.getFlags());
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Intent restart = HostScreens.intentFor(screen.get(), HostScreens.RESTART);
            assertEquals(new ComponentName(app.getPackageName(), HostScreens.SCREEN_HOST), restart.getComponent());
            assertEquals("restart", restart.getStringExtra(HostScreens.EXTRA));
            assertEquals(0, restart.getFlags());
        }
    }

    @Test public void aShortcutOpensTheScreenAndClosesItself() {
        for (boolean mounted : new boolean[] {false, true}) {
            if (mounted) mount();
            for (String screen : new String[] {"settings", "restart"}) {
                Intent shortcut = host(screen).setClassName(RuntimeEnvironment.getApplication(), HostScreens.SHORTCUT_HOST);
                try (var trampoline = Robolectric.buildActivity(HostScreens.ShortcutTrampoline.class, shortcut).setup()) {
                    Intent opened = Shadows.shadowOf(trampoline.get()).getNextStartedActivity();
                    assertEquals(HostScreens.intentFor(trampoline.get(), screen).filterEquals(opened), true);
                    assertEquals(HostScreens.intentFor(trampoline.get(), screen).getFlags(), opened.getFlags());
                    assertEquals(mounted ? screen : null, opened.getStringExtra(HostScreens.EXTRA));
                    assertTrue(trampoline.get().isFinishing());
                }
            }
        }
    }

    @Test public void theMenuRowOpensSettingsInsideTheHostOnARootMountInstall() {
        mount();
        Application app = RuntimeEnvironment.getApplication();
        Settings.initialize(app);
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            TextView row = new TextView(screen.get());
            row.setText("HushMessenger");
            View item = new View(screen.get());
            Settings.handleMenuItemBound(new MenuRowHolder(row, item));
            item.performClick();
            Intent opened = Shadows.shadowOf(screen.get()).getNextStartedActivity();
            assertEquals(HostScreens.SCREEN_HOST, opened.getComponent().getClassName());
            assertEquals("settings", opened.getStringExtra(HostScreens.EXTRA));
        }
    }

    /** Messenger reuses the holder for other rows as the menu scrolls, and its listener is set once, at create. */
    @Test public void aRecycledMenuRowStillDoesWhatMessengerMadeItDo() {
        mount();
        Settings.initialize(RuntimeEnvironment.getApplication());
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            int[] stockTaps = {0};
            TextView row = new TextView(screen.get());
            View item = new View(screen.get());
            item.setOnClickListener(v -> stockTaps[0]++);
            MenuRowHolder holder = new MenuRowHolder(row, item);
            row.setText("HushMessenger");
            Settings.handleMenuItemBound(holder);
            Settings.handleMenuItemBound(holder);
            // Bound to our row again, the listener isn't wrapped twice.
            Settings.MenuRowClick listener = (Settings.MenuRowClick) Shadows.shadowOf(item).getOnClickListener();
            assertFalse(listener.stock instanceof Settings.MenuRowClick);
            item.performClick();
            assertEquals(0, stockTaps[0]);
            assertEquals("settings", Shadows.shadowOf(screen.get()).getNextStartedActivity().getStringExtra(HostScreens.EXTRA));
            row.setText("Marketplace");
            Settings.handleMenuItemBound(holder);
            item.performClick();
            assertEquals(1, stockTaps[0]);
            assertNull(Shadows.shadowOf(screen.get()).getNextStartedActivity());
        }
    }

    /** The binder serves several holder types, and one without a text field is Messenger's business, not an error. */
    @Test public void aMenuHolderWithoutATextFieldIsntRecordedAsAFailure() {
        Settings.hookErrors.remove("menu_row");
        Settings.handleMenuItemBound(new Object());
        Settings.handleMenuItemBound(null);
        assertNull(Settings.hookErrors.get("menu_row"));
    }

    /** Settings start from a hook's first use, the way they do when SettingsProvider never ran. */
    private static void startWithoutProvider(Application app) {
        CrashGuard.resetForTests();
        Settings.preferences = null;
        Settings.installed = Set.of();
        HostScreens.applicationCreated(app);
        assertFalse(Settings.enabled("people"));
        assertTrue(HostScreens.started);
    }

    private static Set<String> dynamicIds(ShortcutManager manager) {
        Set<String> ids = new TreeSet<>();
        for (ShortcutInfo shortcut : manager.getDynamicShortcuts()) ids.add(shortcut.getId());
        return ids;
    }

    /** Copy setup can say how long the late start held up the first hook, since Root Mount has no provider to do it. */
    @Test public void theLateStartRecordsItsTimeAndThread() {
        HostScreens.lateStart = null;
        startWithoutProvider(RuntimeEnvironment.getApplication());
        assertTrue(HostScreens.lateStart, HostScreens.lateStart.matches("\\d+ ms on .+"));
        HostScreens.lateStart = null;
    }

    /** #27: Android reads static shortcuts only when a package is installed or updated, so a Root Mount install had none. */
    @Test @Config(shadows = AndroidShortcutManager.class)
    public void aRootMountInstallGetsPatchControlsAndRestartAsDynamicShortcuts() {
        mount();
        Application app = RuntimeEnvironment.getApplication();
        ShortcutManager manager = app.getSystemService(ShortcutManager.class);
        startWithoutProvider(app);
        assertEquals(Set.of(HostScreens.CONTROLS_SHORTCUT, HostScreens.RESTART_SHORTCUT), dynamicIds(manager));
        for (ShortcutInfo shortcut : manager.getDynamicShortcuts()) {
            boolean controls = HostScreens.CONTROLS_SHORTCUT.equals(shortcut.getId());
            assertEquals(controls ? "Patch controls" : "Restart Messenger", shortcut.getShortLabel().toString());
            assertEquals(controls ? 0 : 1, shortcut.getRank());
            Intent intent = shortcut.getIntent();
            assertEquals(new ComponentName(app.getPackageName(), HostScreens.SHORTCUT_HOST), intent.getComponent());
            assertEquals(controls ? "settings" : "restart", intent.getStringExtra(HostScreens.EXTRA));
            assertTrue(HostScreens.activityFor(HostScreens.SHORTCUT_HOST, intent) instanceof HostScreens.ShortcutTrampoline);
        }
        // Messenger's conversation shortcuts can push one out. The next start puts it back without a copy.
        manager.removeDynamicShortcuts(List.of(HostScreens.RESTART_SHORTCUT));
        startWithoutProvider(app);
        assertEquals(Set.of(HostScreens.CONTROLS_SHORTCUT, HostScreens.RESTART_SHORTCUT), dynamicIds(manager));
        assertEquals(2, manager.getDynamicShortcuts().size());
    }

    /**
     * HushFacebook#146: a normal install gets the same pair, since only a dynamic shortcut can be taken off the icon
     * again. It goes on Messenger's own icon, never the HushMessenger settings icon in the app drawer.
     */
    @Test public void aNormalInstallGetsThePairOnMessengersIcon() throws Exception {
        Application app = RuntimeEnvironment.getApplication();
        ComponentName messenger = launcherIcons(app);
        ShortcutManager manager = app.getSystemService(ShortcutManager.class);
        startWithoutProvider(app);
        assertEquals(Set.of(HostScreens.CONTROLS_SHORTCUT, HostScreens.RESTART_SHORTCUT), dynamicIds(manager));
        for (ShortcutInfo shortcut : manager.getDynamicShortcuts()) {
            assertEquals(messenger, shortcut.getActivity());
            // Android turns down a dynamic shortcut whose icon is a resource from another package, Android's own included.
            android.graphics.drawable.Icon icon = (android.graphics.drawable.Icon) ShortcutInfo.class.getMethod("getIcon").invoke(shortcut);
            assertNotNull(icon);
            assertFalse(shortcut.getId(), icon.getType() == android.graphics.drawable.Icon.TYPE_RESOURCE
                && !app.getPackageName().equals(icon.getResPackage()));
        }
    }

    /** One refresh at a time, so turning Hide the icon shortcuts on and straight off again lands in that order. */
    @Test public void shortcutRefreshesRunOneAtATime() throws Exception {
        var firstRunning = new java.util.concurrent.CountDownLatch(1);
        var release = new java.util.concurrent.CountDownLatch(1);
        var secondRan = new java.util.concurrent.CountDownLatch(1);
        realShortcutWork.execute(() -> {
            firstRunning.countDown();
            try {
                release.await(5, java.util.concurrent.TimeUnit.SECONDS);
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
            }
        });
        assertTrue(firstRunning.await(5, java.util.concurrent.TimeUnit.SECONDS));
        realShortcutWork.execute(secondRan::countDown);
        assertFalse("the second refresh started while the first ran", secondRan.await(200, java.util.concurrent.TimeUnit.MILLISECONDS));
        release.countDown();
        assertTrue(secondRan.await(5, java.util.concurrent.TimeUnit.SECONDS));
    }

    /** Messenger's conversation shortcuts can push the pair down, and one left on the wrong icon would stay there. */
    @Test @Config(shadows = AndroidShortcutManager.class)
    public void aStartPutsBackAShortcutThatSlippedOrSitsOnTheWrongIcon() throws Exception {
        Application app = RuntimeEnvironment.getApplication();
        ComponentName messenger = launcherIcons(app);
        ComponentName drawer = new ComponentName(app.getPackageName(), SettingsActivity.DRAWER_ALIAS);
        ShortcutManager manager = app.getSystemService(ShortcutManager.class);
        Intent stock = new Intent(Intent.ACTION_VIEW).setClassName(app, HostScreens.SHORTCUT_HOST);
        manager.addDynamicShortcuts(List.of(
            new ShortcutInfo.Builder(app, HostScreens.CONTROLS_SHORTCUT).setShortLabel("Patch controls").setIntent(stock)
                .setActivity(messenger).build(),
            new ShortcutInfo.Builder(app, HostScreens.RESTART_SHORTCUT).setShortLabel("Restart Messenger").setIntent(stock)
                .setActivity(drawer).build()));
        manager.addDynamicShortcuts(conversations(app, messenger, 1));
        assertEquals(List.of("chat0", HostScreens.CONTROLS_SHORTCUT), menu(manager, messenger));
        startWithoutProvider(app);
        assertEquals(List.of(HostScreens.CONTROLS_SHORTCUT, HostScreens.RESTART_SHORTCUT, "chat0"), menu(manager, messenger));
        assertEquals(List.of(), menu(manager, drawer));
    }

    /**
     * Messenger pushes a conversation shortcut on top for each message, in the background too, where Android holds its
     * adds back for a while. Each of its writes still lands as it would, and the pair goes straight back on top with
     * pushes, which Android never holds back.
     */
    @Test @Config(sdk = 36, shadows = AndroidShortcutManager.class)
    public void messengersBackgroundShortcutsLeaveThePairOnTop() throws Exception {
        Application app = RuntimeEnvironment.getApplication();
        ComponentName messenger = launcherIcons(app);
        ShortcutManager manager = app.getSystemService(ShortcutManager.class);
        startWithoutProvider(app);
        AndroidShortcutManager.rateLimited = true;
        for (int chat = 0; chat < 3; chat++) HostScreens.messengerPushed(manager, chat(app, messenger, "chat" + chat).build());
        assertEquals(List.of(HostScreens.CONTROLS_SHORTCUT, HostScreens.RESTART_SHORTCUT, "chat2", "chat1", "chat0"), menu(manager, messenger));
        // Messenger's add gets Android's own answer, held back here.
        assertFalse(HostScreens.messengerAdded(manager, List.of(chat(app, messenger, "chat3").setRank(0).build())));
        assertFalse(dynamicIds(manager).contains("chat3"));
        AndroidShortcutManager.rateLimited = false;
        assertTrue(HostScreens.messengerAdded(manager, List.of(chat(app, messenger, "chat3").setRank(0).build())));
        assertEquals(List.of(HostScreens.CONTROLS_SHORTCUT, HostScreens.RESTART_SHORTCUT, "chat3", "chat2", "chat1", "chat0"),
            menu(manager, messenger));
        // A set takes the pair off along with everything else, and it comes straight back.
        assertTrue(HostScreens.messengerSet(manager, List.of(chat(app, messenger, "page").build())));
        assertEquals(List.of(HostScreens.CONTROLS_SHORTCUT, HostScreens.RESTART_SHORTCUT, "page"), menu(manager, messenger));
        // On top already, nothing more is pushed.
        int pushes = AndroidShortcutManager.pushed;
        HostScreens.putBackOnTop(app);
        assertEquals(pushes, AndroidShortcutManager.pushed);
        assertEquals(java.util.Map.of(), AndroidShortcutManager.grayed);
    }

    /** Hidden, the pair stays off whatever Messenger writes, and Messenger's own shortcuts land as they would. */
    @Test @Config(sdk = 36, shadows = AndroidShortcutManager.class)
    public void messengersShortcutsLeaveHiddenOnesOff() throws Exception {
        Application app = RuntimeEnvironment.getApplication();
        ComponentName messenger = launcherIcons(app);
        ShortcutManager manager = app.getSystemService(ShortcutManager.class);
        Settings.preferences.edit().putBoolean(Settings.HIDE_ICON_SHORTCUTS, true).commit();
        startWithoutProvider(app);
        HostScreens.messengerPushed(manager, chat(app, messenger, "chat0").build());
        assertTrue(HostScreens.messengerAdded(manager, List.of(chat(app, messenger, "chat1").setRank(0).build())));
        assertEquals(List.of("chat1", "chat0"), menu(manager, messenger));
    }

    /** Android 9 and 10 have no push, so Messenger's add there leaves the pair for the next start or leave. */
    @Test @Config(sdk = 28, shadows = AndroidShortcutManager.class)
    public void anAddOnAndroid9LeavesThePairForTheNextLeave() throws Exception {
        Application app = RuntimeEnvironment.getApplication();
        ComponentName messenger = launcherIcons(app);
        ShortcutManager manager = app.getSystemService(ShortcutManager.class);
        startWithoutProvider(app);
        assertTrue(HostScreens.messengerAdded(manager, List.of(chat(app, messenger, "chat0").setRank(0).build())));
        assertEquals(List.of("chat0", HostScreens.CONTROLS_SHORTCUT, HostScreens.RESTART_SHORTCUT), menu(manager, messenger));
        assertEquals(0, AndroidShortcutManager.pushed);
    }

    /** The patched calls come from Messenger's own classes, so the three entries must be public and static. */
    @Test public void messengersShortcutWritesHaveTheirEntries() throws Exception {
        for (java.lang.reflect.Method entry : List.of(
                HostScreens.class.getMethod("messengerPushed", ShortcutManager.class, ShortcutInfo.class),
                HostScreens.class.getMethod("messengerAdded", ShortcutManager.class, List.class),
                HostScreens.class.getMethod("messengerSet", ShortcutManager.class, List.class))) {
            assertTrue(entry.getName(), java.lang.reflect.Modifier.isStatic(entry.getModifiers()));
            assertEquals(entry.getName(), entry.getName().equals("messengerPushed") ? void.class : boolean.class, entry.getReturnType());
        }
    }

    /** One of Messenger's conversation shortcuts. A push without a rank of its own lands at the top. */
    private static ShortcutInfo.Builder chat(Application app, ComponentName messenger, String id) {
        return new ShortcutInfo.Builder(app, id).setShortLabel(id)
            .setIntent(new Intent(Intent.ACTION_VIEW).setComponent(messenger)).setActivity(messenger);
    }

    /** Messenger's own conversation shortcuts, which it adds at the top of its icon while it runs. */
    private static List<ShortcutInfo> conversations(Application app, ComponentName messenger, int count) {
        List<ShortcutInfo> chats = new java.util.ArrayList<>();
        for (int rank = 0; rank < count; rank++)
            chats.add(new ShortcutInfo.Builder(app, "chat" + rank).setShortLabel("Chat " + rank)
                .setIntent(new Intent(Intent.ACTION_VIEW).setComponent(messenger)).setRank(rank).setActivity(messenger).build());
        return chats;
    }

    /** The icon's shortcuts top to bottom, the order its long-press menu lists them in. */
    private static List<String> menu(ShortcutManager manager, ComponentName icon) {
        return manager.getDynamicShortcuts().stream().filter(shortcut -> icon.equals(shortcut.getActivity()))
            .sorted(java.util.Comparator.comparingInt(ShortcutInfo::getRank)).map(ShortcutInfo::getId).toList();
    }

    /** An activity Android is tearing down for a rotation, which comes straight back. */
    public static class Rotating extends Activity {
        @Override public boolean isChangingConfigurations() { return true; }
    }

    /**
     * On the S22 Messenger's conversation shortcuts pushed Restart Messenger to rank 4 while it ran, past the four the
     * launcher shows. Leaving Messenger puts the pair back on top; moving between its screens or rotating doesn't.
     */
    @Test @Config(shadows = AndroidShortcutManager.class)
    public void leavingMessengerPutsThePairBackOnTop() throws Exception {
        Application app = RuntimeEnvironment.getApplication();
        ComponentName messenger = launcherIcons(app);
        ShortcutManager manager = app.getSystemService(ShortcutManager.class);
        startWithoutProvider(app);
        String controls = HostScreens.CONTROLS_SHORTCUT, restart = HostScreens.RESTART_SHORTCUT;
        // Asking for ranks 0 and 1 here would tie with chat0 and leave Restart Messenger third, as it did on the S22.
        var pushed = List.of("chat0", controls, "chat1", restart, "chat2", "chat3");
        var onTop = List.of(controls, restart, "chat0", "chat1", "chat2", "chat3");

        try (var rotating = Robolectric.buildActivity(Rotating.class).setup()) {
            manager.addDynamicShortcuts(conversations(app, messenger, 4));
            assertEquals(pushed, menu(manager, messenger));
            rotating.pause().stop();
            assertEquals(pushed, menu(manager, messenger));
        }
        try (var chats = Robolectric.buildActivity(Activity.class).setup(); var chat = Robolectric.buildActivity(Activity.class).setup()) {
            chats.pause().stop();
            assertEquals("Chats stopped under a chat that's still on screen", pushed, menu(manager, messenger));
            chat.pause().stop();
            assertEquals(onTop, menu(manager, messenger));
        }
    }

    /**
     * Android refuses an add that would put more than its limit on one icon, the manifest's shortcuts included, and
     * Messenger's conversation shortcuts can fill it. Its lowest-ranked ones make room, and only as many as needed.
     */
    @Test @Config(shadows = AndroidShortcutManager.class)
    public void aFullIconStillGetsThePair() throws Exception {
        Application app = RuntimeEnvironment.getApplication();
        ComponentName messenger = launcherIcons(app);
        ShortcutManager manager = app.getSystemService(ShortcutManager.class);
        var shadow = (AndroidShortcutManager) org.robolectric.shadow.api.Shadow.extract(manager);
        shadow.setMaxShortcutCountPerActivity(6);
        shadow.setManifestShortcuts(List.of(new ShortcutInfo.Builder(app, "compose").setShortLabel("New message")
            .setIntent(new Intent(Intent.ACTION_VIEW).setComponent(messenger)).setActivity(messenger).build()));
        manager.addDynamicShortcuts(conversations(app, messenger, 5));
        startWithoutProvider(app);
        String controls = HostScreens.CONTROLS_SHORTCUT, restart = HostScreens.RESTART_SHORTCUT;
        assertEquals(List.of(controls, restart, "chat0", "chat1", "chat2"), menu(manager, messenger));
        // Messenger pushed one out. Room for it costs one more of its own, the lowest.
        manager.removeDynamicShortcuts(List.of(restart));
        manager.addDynamicShortcuts(List.of(new ShortcutInfo.Builder(app, "chat9").setShortLabel("Chat 9")
            .setIntent(new Intent(Intent.ACTION_VIEW).setComponent(messenger)).setRank(0).setActivity(messenger).build()));
        assertEquals(List.of("chat9", controls, "chat0", "chat1", "chat2"), menu(manager, messenger));
        startWithoutProvider(app);
        assertEquals(List.of(controls, restart, "chat9", "chat0", "chat1"), menu(manager, messenger));
    }

    /** While Android turns adds down, a full icon keeps every one of Messenger's shortcuts: no room for an add it won't take. */
    @Test @Config(shadows = AndroidShortcutManager.class)
    public void aRateLimitedAddTakesNothingOff() throws Exception {
        Application app = RuntimeEnvironment.getApplication();
        ComponentName messenger = launcherIcons(app);
        ShortcutManager manager = app.getSystemService(ShortcutManager.class);
        var shadow = (AndroidShortcutManager) org.robolectric.shadow.api.Shadow.extract(manager);
        shadow.setMaxShortcutCountPerActivity(6);
        manager.addDynamicShortcuts(conversations(app, messenger, 6));
        AndroidShortcutManager.rateLimited = true;
        startWithoutProvider(app);
        assertEquals(List.of("chat0", "chat1", "chat2", "chat3", "chat4", "chat5"), menu(manager, messenger));
        AndroidShortcutManager.rateLimited = false;
        startWithoutProvider(app);
        assertEquals(List.of(HostScreens.CONTROLS_SHORTCUT, HostScreens.RESTART_SHORTCUT, "chat0", "chat1", "chat2", "chat3"),
            menu(manager, messenger));
    }

    /**
     * HushFacebook#146: Hide the icon shortcuts takes the pair off the icon at once and at every start after, and a copy
     * pinned to the home screen turns gray until the switch is off again.
     */
    @Test @Config(shadows = AndroidShortcutManager.class)
    public void hideTheIconShortcutsTakesThePairAwayAndBringsItBack() throws Exception {
        Application app = RuntimeEnvironment.getApplication();
        launcherIcons(app);
        ShortcutManager manager = app.getSystemService(ShortcutManager.class);
        startWithoutProvider(app);
        manager.requestPinShortcut(manager.getDynamicShortcuts().stream()
            .filter(shortcut -> HostScreens.CONTROLS_SHORTCUT.equals(shortcut.getId())).findFirst().orElseThrow(), null);
        HostScreens.publishShortcuts(app);
        assertEquals(Set.of(HostScreens.CONTROLS_SHORTCUT, HostScreens.RESTART_SHORTCUT), dynamicIds(manager));
        assertEquals(List.of(HostScreens.CONTROLS_SHORTCUT), manager.getPinnedShortcuts().stream().map(ShortcutInfo::getId).toList());
        AndroidShortcutManager.grayed.clear();
        Settings.preferences.edit().putBoolean(Settings.HIDE_ICON_SHORTCUTS, true).commit();
        HostScreens.refreshShortcuts(app);
        assertEquals(Set.of(), dynamicIds(manager));
        assertEquals(java.util.Map.of(HostScreens.CONTROLS_SHORTCUT, new SettingsText(app).get("shortcut_turned_off")), AndroidShortcutManager.grayed);
        // Android keeps a published shortcut between runs, so a start that finds one takes it away again.
        manager.addDynamicShortcuts(List.of(new ShortcutInfo.Builder(app, HostScreens.RESTART_SHORTCUT).setShortLabel("Restart Messenger")
            .setIntent(new Intent(Intent.ACTION_VIEW).setClassName(app, HostScreens.SHORTCUT_HOST)).build()));
        // It isn't a control, so Pause and safe mode leave it as set.
        Settings.preferences.edit().putBoolean("paused", true).putBoolean("safe_mode", true).commit();
        startWithoutProvider(app);
        assertEquals(Set.of(), dynamicIds(manager));
        Settings.preferences.edit().putBoolean("paused", false).putBoolean("safe_mode", false).commit();
        Settings.preferences.edit().putBoolean(Settings.HIDE_ICON_SHORTCUTS, false).commit();
        HostScreens.refreshShortcuts(app);
        assertEquals(Set.of(HostScreens.CONTROLS_SHORTCUT, HostScreens.RESTART_SHORTCUT), dynamicIds(manager));
        assertEquals(java.util.Map.of(), AndroidShortcutManager.grayed);
    }

    /**
     * Robolectric sets a disabled pinned copy aside but leaves it saying it's enabled, moves a pinned shortcut off the
     * published list, keeps whatever rank a shortcut asked for and takes any number on one icon. Android does none of
     * that: a shortcut stays published after it's pinned, after every add it numbers each icon's shortcuts again from 0
     * (ShortcutPackage.adjustRanks), and it refuses an add that puts more than its limit on an icon.
     */
    @org.robolectric.annotation.Implements(ShortcutManager.class)
    public static class AndroidShortcutManager extends org.robolectric.shadows.ShadowShortcutManager {
        /** Each pinned copy that's gray, with what it says when tapped. */
        static final java.util.Map<String, String> grayed = new java.util.HashMap<>();

        /** Android turning adds down for a while (ShortcutPackage.tryApiCall), which it checks after the count. */
        static boolean rateLimited;

        @Override @org.robolectric.annotation.Implementation
        protected boolean isRateLimitingActive() {
            return rateLimited;
        }

        @Override @org.robolectric.annotation.Implementation
        protected boolean requestPinShortcut(ShortcutInfo shortcut, android.content.IntentSender result) {
            List<ShortcutInfo> before = getDynamicShortcuts();
            boolean pinned = super.requestPinShortcut(shortcut, result);
            for (ShortcutInfo kept : before) if (kept.getId().equals(shortcut.getId())) published().put(kept.getId(), kept);
            return pinned;
        }

        @Override @org.robolectric.annotation.Implementation
        protected boolean addDynamicShortcuts(List<ShortcutInfo> shortcuts) {
            // ShortcutPackage.enforceShortcutCountsBeforeOperation: the manifest's and the published ones per icon, a
            // published one that's added again moving to its new icon, and the whole add refused past the limit.
            java.util.Map<String, Integer> counts = new java.util.HashMap<>();
            for (ShortcutInfo shortcut : getManifestShortcuts()) counts.merge(String.valueOf(shortcut.getActivity()), 1, Integer::sum);
            for (ShortcutInfo shortcut : published().values()) counts.merge(String.valueOf(shortcut.getActivity()), 1, Integer::sum);
            for (ShortcutInfo shortcut : shortcuts) {
                ShortcutInfo original = published().get(shortcut.getId());
                if (original != null) counts.merge(String.valueOf(original.getActivity()), -1, Integer::sum);
                counts.merge(String.valueOf(shortcut.getActivity()), 1, Integer::sum);
            }
            for (int count : counts.values())
                if (count > getMaxShortcutCountPerActivity()) throw new IllegalArgumentException("Max number of dynamic shortcuts exceeded");
            if (rateLimited) return false;
            boolean added = super.addDynamicShortcuts(shortcuts);
            for (ShortcutInfo shortcut : shortcuts) published().put(shortcut.getId(), shortcut);
            renumber(shortcuts.stream().map(ShortcutInfo::getId).toList());
            return added;
        }

        /**
         * ShortcutService.pushDynamicShortcut, which Robolectric runs as an add: never held back by the rate limit, rank 0
         * unless one was asked for, ahead of the others at its rank, and a new one on a full icon drops the icon's lowest.
         */
        @Override @org.robolectric.annotation.Implementation(minSdk = android.os.Build.VERSION_CODES.R)
        protected void pushDynamicShortcut(ShortcutInfo shortcut) {
            try {
                if (shortcut.getRank() == Integer.MAX_VALUE) ShortcutInfo.class.getMethod("setRank", int.class).invoke(shortcut, 0);
            } catch (ReflectiveOperationException error) {
                throw new AssertionError(error);
            }
            String icon = String.valueOf(shortcut.getActivity());
            if (!published().containsKey(shortcut.getId())) {
                int count = 0;
                for (ShortcutInfo kept : getManifestShortcuts()) if (icon.equals(String.valueOf(kept.getActivity()))) count++;
                ShortcutInfo lowest = null;
                for (ShortcutInfo kept : published().values()) {
                    if (!icon.equals(String.valueOf(kept.getActivity()))) continue;
                    count++;
                    if (lowest == null || kept.getRank() > lowest.getRank()) lowest = kept;
                }
                if (count >= getMaxShortcutCountPerActivity() && lowest != null) published().remove(lowest.getId());
            }
            published().put(shortcut.getId(), shortcut);
            renumber(List.of(shortcut.getId()));
            pushed++;
        }

        /** Pushes since the last reset. */
        static int pushed;

        /** Per icon by rank; among equal ranks the ones this call added come first, in the call's order, then by id. */
        private static void renumber(List<String> added) {
            java.util.Map<String, List<ShortcutInfo>> icons = new java.util.HashMap<>();
            for (ShortcutInfo shortcut : published().values())
                icons.computeIfAbsent(String.valueOf(shortcut.getActivity()), icon -> new java.util.ArrayList<>()).add(shortcut);
            try {
                java.lang.reflect.Method setRank = ShortcutInfo.class.getMethod("setRank", int.class);
                for (List<ShortcutInfo> icon : icons.values()) {
                    icon.sort(java.util.Comparator.comparingInt(ShortcutInfo::getRank)
                        .thenComparingInt(shortcut -> added.contains(shortcut.getId()) ? 0 : 1)
                        .thenComparingInt(shortcut -> added.indexOf(shortcut.getId()))
                        .thenComparing(ShortcutInfo::getId));
                    for (int rank = 0; rank < icon.size(); rank++) setRank.invoke(icon.get(rank), rank);
                }
            } catch (ReflectiveOperationException error) {
                throw new AssertionError(error);
            }
        }

        @SuppressWarnings("unchecked")
        private static java.util.Map<String, ShortcutInfo> published() {
            try {
                java.lang.reflect.Field field = org.robolectric.shadows.ShadowShortcutManager.class.getDeclaredField("dynamicShortcuts");
                field.setAccessible(true);
                return (java.util.Map<String, ShortcutInfo>) field.get(null);
            } catch (ReflectiveOperationException error) {
                throw new AssertionError(error);
            }
        }

        @Override @org.robolectric.annotation.Implementation
        protected void disableShortcuts(List<String> ids, CharSequence message) {
            super.disableShortcuts(ids, message);
            for (String id : ids) grayed.put(id, String.valueOf(message));
            flag(ids, "addFlags");
        }

        @Override @org.robolectric.annotation.Implementation
        protected void enableShortcuts(List<String> ids) {
            super.enableShortcuts(ids);
            for (String id : ids) grayed.remove(id);
            flag(ids, "clearFlags");
        }

        private void flag(List<String> ids, String change) {
            try {
                int disabled = ShortcutInfo.class.getField("FLAG_DISABLED").getInt(null);
                for (ShortcutInfo shortcut : getPinnedShortcuts())
                    if (ids.contains(shortcut.getId())) ShortcutInfo.class.getMethod(change, int.class).invoke(shortcut, disabled);
            } catch (ReflectiveOperationException error) {
                throw new AssertionError(error);
            }
        }
    }

    /** Messenger's own icon, plus the HushMessenger settings icon in the app drawer that the shortcuts must skip. */
    private static ComponentName launcherIcons(Application app) throws Exception {
        var packages = Shadows.shadowOf(app.getPackageManager());
        ComponentName messenger = new ComponentName(app.getPackageName(), "com.facebook.orca.auth.StartScreenActivity");
        android.content.IntentFilter launcher = new android.content.IntentFilter(Intent.ACTION_MAIN);
        launcher.addCategory(Intent.CATEGORY_LAUNCHER);
        for (ComponentName icon : List.of(new ComponentName(app.getPackageName(), SettingsActivity.DRAWER_ALIAS), messenger)) {
            packages.addActivityIfNotPresent(icon);
            packages.addIntentFilterForActivity(icon, launcher);
        }
        return messenger;
    }

    /** With no other way back into settings, the switch can't take the last one away, even when it was saved on. */
    @Test public void theIconShortcutsStayWhenNothingElseIsLeft() {
        Application app = RuntimeEnvironment.getApplication();
        ShortcutManager manager = app.getSystemService(ShortcutManager.class);
        Settings.preferences.edit().putBoolean(Settings.HIDE_ICON_SHORTCUTS, true).commit();
        startWithoutProvider(app);
        assertTrue(Settings.iconShortcutsShown(app));
        assertEquals(Set.of(HostScreens.CONTROLS_SHORTCUT, HostScreens.RESTART_SHORTCUT), dynamicIds(manager));
    }

    /** #22: settings opened from the long-press shortcut prove that way back works. Restart Messenger doesn't count. */
    @Test public void onlyOpeningSettingsFromTheShortcutCountsAsAWayBack() {
        Application app = RuntimeEnvironment.getApplication();
        Intent restart = host("restart").setClassName(app, HostScreens.SHORTCUT_HOST);
        try (var trampoline = Robolectric.buildActivity(HostScreens.ShortcutTrampoline.class, restart).setup()) {
            assertFalse(Settings.preferences.getBoolean(Settings.SHORTCUT_USED, false));
        }
        Intent settings = host("settings").setClassName(app, HostScreens.SHORTCUT_HOST);
        try (var trampoline = Robolectric.buildActivity(HostScreens.ShortcutTrampoline.class, settings).setup()) {
            assertTrue(Settings.preferences.getBoolean(Settings.SHORTCUT_USED, false));
        }
    }

    /** A launcher ranks a dynamic shortcut by its reported use, so Root Mount's copies say when they're tapped. */
    @Test public void aRootMountShortcutTellsTheLauncherItWasUsed() {
        mount();
        Application app = RuntimeEnvironment.getApplication();
        ShortcutManager manager = app.getSystemService(ShortcutManager.class);
        startWithoutProvider(app);
        assertEquals(List.of(), Shadows.shadowOf(manager).getReportedShortcutsUsed());
        for (ShortcutInfo shortcut : manager.getDynamicShortcuts()) {
            try (var trampoline = Robolectric.buildActivity(HostScreens.ShortcutTrampoline.class, shortcut.getIntent()).setup()) {
                assertTrue(trampoline.get().isFinishing());
            }
        }
        List<String> reported = Shadows.shadowOf(manager).getReportedShortcutsUsed();
        assertEquals(2, reported.size());
        assertEquals(Set.of(HostScreens.CONTROLS_SHORTCUT, HostScreens.RESTART_SHORTCUT), new TreeSet<>(reported));
    }

    /** A launch from a shortcut that isn't published, like a copy pinned before an update, reports nothing. */
    @Test public void theStaticShortcutsReportNothing() {
        Application app = RuntimeEnvironment.getApplication();
        ShortcutManager manager = app.getSystemService(ShortcutManager.class);
        for (String screen : new String[] {"settings", "restart"}) {
            try (var trampoline = Robolectric.buildActivity(HostScreens.ShortcutTrampoline.class,
                    host(screen).setClassName(app, HostScreens.SHORTCUT_HOST)).setup()) {
                assertTrue(trampoline.get().isFinishing());
            }
        }
        assertEquals(List.of(), Shadows.shadowOf(manager).getReportedShortcutsUsed());
    }

    /** #22: the Menu row comes back whenever Patch controls is missing from the long-press menu, as after a failed publish. */
    @Test public void theMenuRowHidesOnlyWhilePatchControlsIsPublished() {
        Application app = RuntimeEnvironment.getApplication();
        ShortcutManager manager = app.getSystemService(ShortcutManager.class);
        Settings.preferences.edit().putBoolean("hide_menu_row", true).putBoolean(Settings.SHORTCUT_USED, true).commit();
        assertFalse(Settings.menuRowHidden());
        manager.addDynamicShortcuts(List.of(new ShortcutInfo.Builder(app, HostScreens.CONTROLS_SHORTCUT)
            .setShortLabel("Patch controls").setIntent(new Intent(Intent.ACTION_VIEW)).build()));
        assertFalse("an answer holds for a while", Settings.menuRowHidden());
        ShadowSystemClock.advanceBy(Duration.ofMillis(HostScreens.SHORTCUT_ANSWER_MS));
        assertTrue(Settings.menuRowHidden());
        // A start that has to put the pair back drops the old answer, so the next ask sees it at once.
        manager.removeAllDynamicShortcuts();
        assertTrue("still held", Settings.menuRowHidden());
        startWithoutProvider(app);
        assertTrue(Settings.menuRowHidden());
        manager.removeAllDynamicShortcuts();
        ShadowSystemClock.advanceBy(Duration.ofMillis(HostScreens.SHORTCUT_ANSWER_MS));
        assertFalse(Settings.menuRowHidden());
        startWithoutProvider(app);
        assertTrue("read again after the start", Settings.menuRowHidden());
        // Messenger's conversation shortcuts push it out while Messenger runs, with no start in between.
        manager.removeDynamicShortcuts(List.of(HostScreens.CONTROLS_SHORTCUT));
        assertTrue("still held", Settings.menuRowHidden());
        ShadowSystemClock.advanceBy(Duration.ofMillis(HostScreens.SHORTCUT_ANSWER_MS));
        assertFalse("the row comes back", Settings.menuRowHidden());
        assertFalse(Settings.available("hide_menu_row"));
    }

    /** The two fields Messenger's Menu row view holder keeps, under their obfuscated names. */
    static class MenuRowHolderBase {
        View A0I;
    }

    static final class MenuRowHolder extends MenuRowHolderBase {
        TextView A06;
        MenuRowHolder(TextView text, View item) { A06 = text; A0I = item; }
    }

    @Test public void settingsStartOnFirstUseWhenTheirProviderNeverRan() throws Exception {
        Application app = RuntimeEnvironment.getApplication();
        Settings.preferences = null;
        Settings.installed = Set.of();
        HostScreens.applicationCreated(app);
        app.getSharedPreferences("hushmessenger", 0).edit().putBoolean("people", true).commit();
        assertTrue(Settings.enabled("people"));
        assertNotNull(Settings.preferences);
        assertTrue(Settings.installed.contains("people"));
    }

    @Test @Config(sdk = 36) public void bubbleHooksCanBeTheFirstUseWithoutAProvider() {
        Application app = RuntimeEnvironment.getApplication();
        for (boolean chatHeads : new boolean[] {false, true}) {
            CrashGuard.resetForTests();
            Settings.preferences = null;
            Settings.installed = Set.of();
            Settings.bubbleRoutes = false;
            HostScreens.applicationCreated(app);
            app.getSharedPreferences("hushmessenger", 0).edit().putBoolean("bubbles", true)
                .putBoolean(Settings.BUBBLE_CHAT_HEADS, chatHeads).commit();
            assertTrue(chatHeads ? Settings.forceChatHeads() : Settings.enableBubbles());
            assertTrue(HostScreens.started);
            assertNotNull(Settings.preferences);
        }
    }

    @Test public void anApplicationAndroidHasntAttachedYetIsLeftAlone() {
        Settings.preferences = null;
        Settings.installed = Set.of();
        HostScreens.applicationCreated(new Application());
        assertFalse(Settings.enabled("people"));
        assertNull(Settings.preferences);
        HostScreens.applicationCreated(null);
        assertFalse(Settings.enabled("people"));
    }

    /** Records the watchers Messenger's Application is given, and throws the Error for one kind of them. */
    static final class FailingApplication extends Application {
        final List<Application.ActivityLifecycleCallbacks> registered = new java.util.ArrayList<>();
        private final Class<?> failing;
        private final Error error;

        FailingApplication(Class<?> failing, Error error) { this.failing = failing; this.error = error; }

        @Override public void registerActivityLifecycleCallbacks(Application.ActivityLifecycleCallbacks callback) {
            if (failing.isInstance(callback)) throw error;
            registered.add(callback);
        }
    }

    @Test public void aWatcherThatCantLoadLeavesTheOthersAndMessengersStartAlone() {
        Object[][] cases = {
            {SettingsReopen.FirstScreen.class, new NoClassDefFoundError("app/hushmessenger/extension/SettingsReopen$FirstScreen"),
                HostScreens.LeavingMessenger.class, "Can't watch for the first screen after a restart"},
            {HostScreens.LeavingMessenger.class, new ExceptionInInitializerError("static init"),
                SettingsReopen.FirstScreen.class, "Can't watch for Messenger leaving the screen"},
        };
        for (Object[] item : cases) {
            ShadowLog.clear();
            FailingApplication app = new FailingApplication((Class<?>) item[0], (Error) item[1]);
            HostScreens.applicationCreated(app);
            assertEquals(1, app.registered.size());
            assertTrue(((Class<?>) item[2]).isInstance(app.registered.get(0)));
            assertEquals(1, ShadowLog.getLogsForTag("HushMessenger").stream()
                .filter(entry -> item[3].equals(entry.msg) && entry.throwable == item[1]).count());
        }
    }

    @Test public void messengersOtherProcessesStayStockLikeOnANormalInstall() {
        Application app = RuntimeEnvironment.getApplication();
        Settings.preferences = null;
        Settings.installed = Set.of();
        HostScreens.applicationCreated(app);
        app.getSharedPreferences("hushmessenger", 0).edit().putBoolean("people", true).commit();
        ShadowApplication.setProcessName(app.getPackageName() + ":mqtt");
        try {
            assertFalse(Settings.enabled("people"));
            assertNull(Settings.preferences);
            assertFalse(HostScreens.started);
        } finally {
            ShadowApplication.setProcessName(app.getPackageName());
        }
        assertTrue(Settings.enabled("people"));
        assertTrue(HostScreens.started);
    }

    @Test public void aSettingsScreenThatStartsTheProcessChecksSafeModeFirst() {
        Settings.preferences.edit().putBoolean("safe_mode", true).commit();
        Settings.preferences = null;
        Settings.installed = Set.of();
        Robolectric.buildActivity(SettingsActivity.class).create();
        assertTrue(HostScreens.started);
        assertTrue(CrashGuard.isSafeMode());
    }

    @Test public void aStartThatFailsLeavesEveryControlStockUntilTheNextProcess() {
        Application app = RuntimeEnvironment.getApplication();
        Settings.preferences = null;
        Settings.installed = Set.of();
        HostScreens.applicationCreated(app);
        // A safe-mode flag stored as the wrong type makes CrashGuard throw while reading it.
        app.getSharedPreferences("hushmessenger", 0).edit().putBoolean("people", true).putString("safe_mode", "on").commit();
        ShadowLog.clear();
        assertFalse(Settings.enabled("people"));
        assertTrue(HostScreens.failed);
        assertFalse(HostScreens.started);
        assertFalse(Settings.enabled("people"));
        assertEquals("tried once", 1, ShadowLog.getLogsForTag("HushMessenger").stream()
            .filter(item -> "Can't start settings".equals(item.msg)).count());
    }

    @Test public void aStockLaunchOfAHostKeepsItsExtrasReadable() {
        Intent stock = new Intent().putExtra("stock", "value");
        // Stands in for the loader Android would otherwise leave on the extras until after the factory returns.
        stock.setExtrasClassLoader(new ClassLoader(null) { });
        assertNull(HostScreens.activityFor(HostScreens.SCREEN_HOST, stock));
        assertEquals(HostScreens.class.getClassLoader(), stock.getExtras().getClassLoader());
        assertEquals("value", stock.getStringExtra("stock"));
    }

    @Test public void thePatchedControlListIsReadLikeTheManifest() {
        assertEquals(Set.of(), Settings.bundled(""));
        assertEquals(Set.of(), Settings.bundled(null));
        assertEquals(Set.of("ads", "menu_row", "people"), Settings.bundled("ads,menu_row,people"));
        assertEquals(Set.of("ads"), Settings.bundled(",ads,"));
        // The extension alone records nothing; the patch writes the list and the build it started from.
        assertEquals("", HostScreens.bundledControls());
        assertEquals("", HostScreens.originalBuild());
    }

    /** HushFacebook#146: each way back in has its own switch on the App tab, and the last one that's on stays on. */
    @Test public void theLastWayBackIntoSettingsStaysOn() {
        Application app = RuntimeEnvironment.getApplication();
        PackageInfo info = Shadows.shadowOf(app.getPackageManager()).getInternalMutablePackageInfo(app.getPackageName());
        info.applicationInfo.metaData = new Bundle();
        info.applicationInfo.metaData.putBoolean("hush.feature.menu_row", true);
        info.applicationInfo.metaData.putBoolean("hush.feature." + Settings.LOGO_LONG_PRESS, true);
        Settings.initialize(app);
        Settings.preferences.edit().putString(Settings.LOGO_USED, Settings.patchedBuild(app)).commit();
        ShortcutManager manager = app.getSystemService(ShortcutManager.class);
        HostScreens.publishShortcuts(app);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            SettingsText words = new SettingsText(screen.get());
            for (String key : List.of("hide_menu_row", Settings.HIDE_ICON_SHORTCUTS, Settings.HIDE_LOGO_PRESS))
                assertTrue(key, ((android.widget.Switch) root.findViewWithTag(key)).isEnabled());
            ((android.widget.Switch) root.findViewWithTag(Settings.HIDE_ICON_SHORTCUTS)).setChecked(true);
            assertEquals(Set.of(), dynamicIds(manager));
            ((android.widget.Switch) root.findViewWithTag("hide_menu_row")).setChecked(true);
            assertTrue(Settings.menuRowHidden());
            // Only the logo is left, so its switch can't turn on, and the App tab names it as the way back.
            android.widget.Switch logo = root.findViewWithTag(Settings.HIDE_LOGO_PRESS);
            assertFalse(logo.isEnabled());
            assertTrue(logo.getContentDescription().toString().endsWith(words.format("last_way_in")));
            Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertEquals(words.get("way_logo") + " " + words.get("way_shortcuts_hidden"),
                ((TextView) root.findViewWithTag("access_help")).getText().toString());
            // The icon shortcuts come back with their switch, and the logo's switch is free again.
            ((android.widget.Switch) root.findViewWithTag(Settings.HIDE_ICON_SHORTCUTS)).setChecked(false);
            assertEquals(Set.of(HostScreens.CONTROLS_SHORTCUT, HostScreens.RESTART_SHORTCUT), dynamicIds(manager));
            logo = root.findViewWithTag(Settings.HIDE_LOGO_PRESS);
            assertTrue(logo.isEnabled());
            logo.setChecked(true);
            // The shortcut never opened settings here, so with the logo off the Menu row comes back.
            assertFalse(Settings.menuRowHidden());
            android.widget.Switch row = root.findViewWithTag("hide_menu_row");
            assertTrue(row.isChecked());
            assertTrue(row.getContentDescription().toString().endsWith(words.format("menu_row_needs_shortcut")));
        }
    }

    /** Hide the Menu row turns available again once Patch controls is back on the icon, not at the next visit. */
    @Test public void theMenuRowSwitchFollowsTheShortcutsBack() {
        Application app = RuntimeEnvironment.getApplication();
        PackageInfo info = Shadows.shadowOf(app.getPackageManager()).getInternalMutablePackageInfo(app.getPackageName());
        info.applicationInfo.metaData = new Bundle();
        info.applicationInfo.metaData.putBoolean("hush.feature.menu_row", true);
        Settings.initialize(app);
        Settings.preferences.edit().putBoolean(Settings.SHORTCUT_USED, true).commit();
        HostScreens.publishShortcuts(app);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            ((android.widget.Switch) root.findViewWithTag(Settings.HIDE_ICON_SHORTCUTS)).setChecked(true);
            assertFalse(((android.widget.Switch) root.findViewWithTag("hide_menu_row")).isEnabled());
            ((android.widget.Switch) root.findViewWithTag(Settings.HIDE_ICON_SHORTCUTS)).setChecked(false);
            assertTrue(((android.widget.Switch) root.findViewWithTag("hide_menu_row")).isEnabled());
        }
    }

    @Test public void onARootMountInstallTheAppTabLeavesOutTheDrawerIcon() {
        Application app = RuntimeEnvironment.getApplication();
        PackageInfo info = Shadows.shadowOf(app.getPackageManager()).getInternalMutablePackageInfo(app.getPackageName());
        info.applicationInfo.metaData = new Bundle();
        info.applicationInfo.metaData.putBoolean("hush.feature.menu_row", true);
        info.applicationInfo.metaData.putBoolean("hush.feature." + Settings.LOGO_LONG_PRESS, true);
        Shadows.shadowOf(app.getPackageManager()).addActivityIfNotPresent(new ComponentName(app.getPackageName(), SettingsActivity.DRAWER_ALIAS));
        for (boolean mounted : new boolean[] {false, true}) {
            var controller = Robolectric.buildActivity(SettingsActivity.class);
            // Building the activity registers it with PackageManager again, so the mount comes after.
            if (mounted) mount();
            try (var screen = controller.setup()) {
                View root = screen.get().getWindow().getDecorView();
                root.findViewWithTag("tab_app").performClick();
                TextView help = root.findViewWithTag("access_help");
                assertEquals(new SettingsText(app).get(mounted ? "access_help_hosted_menu" : "access_help_menu"), help.getText().toString());
                assertEquals(mounted, root.findViewWithTag("hide_drawer_icon") == null);
                root.findViewWithTag("restart_messenger").performClick();
                Intent restart = Shadows.shadowOf(screen.get()).getNextStartedActivity();
                assertEquals(mounted ? HostScreens.SCREEN_HOST : RestartActivity.class.getName(), restart.getComponent().getClassName());
                assertEquals(mounted ? "restart" : null, restart.getStringExtra(HostScreens.EXTRA));
            }
        }
    }
}
