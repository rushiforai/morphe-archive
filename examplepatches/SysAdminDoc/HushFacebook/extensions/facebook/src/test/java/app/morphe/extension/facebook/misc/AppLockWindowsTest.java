/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.app.KeyguardManager;
import android.content.pm.ApplicationInfo;
import android.graphics.PixelFormat;
import android.provider.Settings.Global;
import android.view.View;
import android.view.WindowManager;

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
import org.robolectric.shadows.ShadowDialog;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowSystemClock;

import java.io.File;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Lock Facebook's two ways around the cover that take no focus: a window that lands above the
 * cover without taking the focus (a popup, a tooltip bubble, a not-focusable overlay) stops taking
 * taps and the cover goes back on top of it, and a game or ad screen in a process of its own
 * doesn't ask again right after Facebook was unlocked. The window list is a stand-in, since
 * Robolectric has no window manager to ask.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AppLockWindowsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final List<Object> asked = new ArrayList<>();
    private final List<AppLock.Answer> answers = new ArrayList<>();
    private final List<ActivityController<?>> controllers = new ArrayList<>();
    /** The windows in layer order, oldest first. */
    private final List<View> windows = new ArrayList<>();
    private Activity activity;

    @Before
    public void freshProcess() {
        AppLock.forgetForTests();
        AppLock.prompter = (screen, answer) -> {
            asked.add(screen);
            answers.add(answer);
        };
        AppLock.roots = freshRoots;
    }

    private final AppLock.Roots freshRoots = () -> {
            for (Dialog dialog : ShadowDialog.getShownDialogs()) {
                View decor = dialog.getWindow().getDecorView();
                if (dialog.isShowing() && !windows.contains(decor)) windows.add(decor);
            }
            return new ArrayList<>(windows);
        };

    @Before
    public void phoneWithAScreenLock() {
        KeyguardManager keyguard = RuntimeEnvironment.getApplication().getSystemService(KeyguardManager.class);
        shadowOf(keyguard).setIsDeviceSecure(true);
        Settings.APP_LOCK.save(true);
        Global.putInt(RuntimeEnvironment.getApplication().getContentResolver(), Global.BOOT_COUNT, 5);
    }

    @After
    public void restore() {
        AppLock.forgetForTests();
        PauseForTests.resume();
        Settings.APP_LOCK.resetToDefault();
        Settings.APP_LOCK_AFTER.resetToDefault();
        for (ActivityController<?> controller : controllers) controller.close();
    }

    private static View decorOf(Activity screen) {
        return screen == null ? null : screen.getWindow().getDecorView();
    }

    private Activity screen() {
        ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup();
        controllers.add(controller);
        return controller.get();
    }

    private static void front(Activity screen) {
        AppLock.started(screen);
        AppLock.resumed(screen);
        ShadowLooper.idleMainLooper();
    }

    /** A locked screen with its cover registered as a window above the screen's own. */
    private Activity lockedScreen() {
        activity = screen();
        windows.add(decorOf(activity));
        front(activity);
        asked.clear();
        return activity;
    }

    /** A window Facebook adds to the screen that can't take the focus, the way a popup or bubble is. */
    private View notFocusableWindow(Activity owner) {
        View view = new View(owner);
        WindowManager.LayoutParams params = new WindowManager.LayoutParams(
                WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.MATCH_PARENT,
                WindowManager.LayoutParams.TYPE_APPLICATION, WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
                PixelFormat.TRANSLUCENT);
        owner.getWindowManager().addView(view, params);
        view.setTag("overlay");
        windows.add(view);
        return view;
    }

    private static boolean takesNoTouch(View view) {
        return (((WindowManager.LayoutParams) view.getLayoutParams()).flags
                & WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE) != 0;
    }

    @Test
    public void aWindowThatTakesNoFocusAboveTheCoverStopsTakingTapsAndTheCoverGoesBackOnTop() {
        Activity screen = lockedScreen();
        Dialog cover = ShadowDialog.getLatestDialog();
        AppLock.roots.list();
        View overlay = notFocusableWindow(screen);

        AppLock.sweep(screen);

        assertTrue("a window above the cover still took taps", takesNoTouch(overlay));
        Dialog top = ShadowDialog.getLatestDialog();
        assertNotSame("the cover stayed under the window", cover, top);
        assertTrue(top.isShowing());
        assertFalse("the old cover stayed up too", cover.isShowing());
        assertTrue(AppLock.covered(screen));
    }

    @Test
    public void aWindowIsFoundWithinTheLooksIntervalWithoutAnyFocusChange() {
        Activity screen = lockedScreen();
        Dialog cover = ShadowDialog.getLatestDialog();
        AppLock.roots.list();
        View overlay = notFocusableWindow(screen);
        assertSame(cover, ShadowDialog.getLatestDialog());

        ShadowLooper.idleMainLooper(AppLock.WATCH_MS * 2, TimeUnit.MILLISECONDS);

        assertTrue(takesNoTouch(overlay));
        assertNotSame(cover, ShadowDialog.getLatestDialog());
    }

    private static boolean nothingScheduled() {
        return ShadowLooper.shadowMainLooper().getNextScheduledTaskTime().isZero();
    }

    @Test
    public void aLockedFacebookThatIsAwayStopsLookingForWindowsAndComingBackStartsAgain() {
        Activity screen = lockedScreen();
        AppLock.roots.list();
        assertFalse("no look was scheduled while the cover was up", nothingScheduled());

        AppLock.paused(screen);
        // The look already on its way runs once, finds nothing in front and doesn't go again.
        ShadowLooper.idleMainLooper(AppLock.WATCH_MS * 3, TimeUnit.MILLISECONDS);
        assertTrue("the poll kept waking the main thread with Facebook away", nothingScheduled());
        assertTrue(AppLock.covering());

        AppLock.resumed(screen);
        assertFalse("coming back didn't restart the poll", nothingScheduled());
        // The stand-in list learns of the fresh cover the resume put on top before the overlay lands above it.
        AppLock.roots.list();
        View overlay = notFocusableWindow(screen);
        ShadowLooper.idleMainLooper(AppLock.WATCH_MS * 2, TimeUnit.MILLISECONDS);
        assertTrue(takesNoTouch(overlay));
    }

    private final android.os.IBinder screenToken = new android.os.Binder();

    /** A window of [owner]'s of the given type that can't take the focus, with the given token. */
    private View typedWindow(Activity owner, int type, android.os.IBinder token) {
        View view = new View(owner);
        WindowManager.LayoutParams params = new WindowManager.LayoutParams(
                WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.MATCH_PARENT,
                type, WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE, PixelFormat.TRANSLUCENT);
        params.token = token;
        owner.getWindowManager().addView(view, params);
        windows.add(view);
        return view;
    }

    /** The list is in the order windows were added, so a sub-window of the screen's own sits under the cover wherever it is listed. */
    @Test
    public void aSubWindowOfTheScreenAboveTheCoverInTheListIsLeftAloneButAnotherTokensIsNot() {
        AppLock.tokenOf = screen -> screenToken;
        Activity screen = lockedScreen();
        Dialog cover = ShadowDialog.getLatestDialog();
        AppLock.roots.list();
        View popup = typedWindow(screen, WindowManager.LayoutParams.TYPE_APPLICATION_PANEL, screenToken);

        AppLock.sweep(screen);

        assertFalse("a popup attached to the screen was stopped", takesNoTouch(popup));
        assertSame("the cover moved for a popup of the screen", cover, ShadowDialog.getLatestDialog());

        View other = typedWindow(screen, WindowManager.LayoutParams.TYPE_APPLICATION_PANEL, new android.os.Binder());
        AppLock.sweep(screen);
        assertTrue("a sub-window of some other window kept its touches", takesNoTouch(other));
        assertNotSame(cover, ShadowDialog.getLatestDialog());
    }

    /** An overlay layers above every cover, so it is flagged even listed before the cover, and only the first time moves the cover. */
    @Test
    public void anOverlayTypeWindowListedBeforeTheCoverIsStoppedOnce() {
        AppLock.tokenOf = screen -> screenToken;
        activity = screen();
        windows.add(decorOf(activity));
        View overlay = typedWindow(activity, WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY, null);
        front(activity);
        AppLock.roots.list();

        AppLock.sweep(activity);

        assertTrue("an overlay-type window listed under the cover kept its touches", takesNoTouch(overlay));
        Dialog top = ShadowDialog.getLatestDialog();
        AppLock.sweep(activity);
        assertSame("the cover was put back on top again for a window it can't get above", top,
                ShadowDialog.getLatestDialog());
    }

    @Test
    public void theTouchesComeBackWithTheUnlockAndAWindowUnderTheCoverIsLeftAlone() {
        activity = screen();
        windows.add(decorOf(activity));
        View early = notFocusableWindow(activity);
        front(activity);
        Dialog cover = ShadowDialog.getLatestDialog();
        AppLock.roots.list();
        AppLock.sweep(activity);
        assertFalse("a window under the cover lost its touches", takesNoTouch(early));
        assertSame("the cover moved for a window under it", cover, ShadowDialog.getLatestDialog());

        View late = notFocusableWindow(activity);
        AppLock.sweep(activity);
        assertTrue(takesNoTouch(late));
        assertFalse(takesNoTouch(early));

        answers.get(0).unlocked();
        assertFalse("the unlock left a window without touches", takesNoTouch(late));
        assertFalse(AppLock.covering());
    }

    @Test
    public void aScreenThatIsDestroyedWhileLockedIsLetGoOfAndFacebooksOwnFlagIsLeftAlone() {
        Activity screen = lockedScreen();
        AppLock.roots.list();
        View ours = notFocusableWindow(screen);
        // Facebook made this one untouchable itself, above the cover, before the lock looked.
        View facebooks = new View(screen);
        WindowManager.LayoutParams params = new WindowManager.LayoutParams(
                WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.MATCH_PARENT,
                WindowManager.LayoutParams.TYPE_APPLICATION,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE | WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE,
                PixelFormat.TRANSLUCENT);
        screen.getWindowManager().addView(facebooks, params);
        windows.add(facebooks);
        AppLock.sweep(screen);
        assertTrue(takesNoTouch(ours));
        assertEquals("the lock holds a window it didn't flag", 1, AppLock.untouchableCount());

        answers.get(0).unlocked();
        assertFalse("the unlock gave back touches the lock took", takesNoTouch(ours));
        assertTrue("the unlock cleared Facebook's own flag", takesNoTouch(facebooks));
        assertEquals(0, AppLock.untouchableCount());

        // A second locked screen, rotated away: its windows aren't kept.
        AppLock.forgetForTests();
        AppLock.prompter = (shown, answer) -> {
            asked.add(shown);
            answers.add(answer);
        };
        AppLock.roots = freshRoots;
        windows.clear();
        Activity rotated = lockedScreen();
        AppLock.roots.list();
        notFocusableWindow(rotated);
        AppLock.sweep(rotated);
        assertEquals(1, AppLock.untouchableCount());
        AppLock.destroyed(rotated);
        assertEquals("a destroyed screen's window was still held", 0, AppLock.untouchableCount());
    }

    @Test
    public void aPhoneThatWontGiveItsWindowListLeavesTheCoverAsItWas() {
        Activity screen = lockedScreen();
        Dialog cover = ShadowDialog.getLatestDialog();
        View overlay = notFocusableWindow(screen);
        AppLock.roots = () -> null;

        AppLock.sweep(screen);

        assertFalse(takesNoTouch(overlay));
        assertSame(cover, ShadowDialog.getLatestDialog());
        assertTrue(AppLock.covered(screen));
    }

    @Test
    public void anotherScreensWindowAboveTheCoverIsNotThisScreensToStop() {
        Activity screen = lockedScreen();
        Dialog cover = ShadowDialog.getLatestDialog();
        AppLock.roots.list();
        Activity other = Robolectric.buildActivity(Activity.class).setup().get();
        View foreign = notFocusableWindow(other);

        AppLock.sweep(screen);

        assertFalse(takesNoTouch(foreign));
        assertSame(cover, ShadowDialog.getLatestDialog());
    }

    @Test
    public void offOrUnlockedNothingIsTouched() {
        Settings.APP_LOCK.save(false);
        activity = screen();
        windows.add(decorOf(activity));
        front(activity);
        View overlay = notFocusableWindow(activity);
        AppLock.sweep(activity);
        assertFalse(takesNoTouch(overlay));
        assertTrue(answers.isEmpty());
    }

    /** A fresh process that reads the phone's own window list, as a phone does. */
    private void realReader() {
        AppLock.forgetForTests();
        AppLock.prompter = (screen, answer) -> {
            asked.add(screen);
            answers.add(answer);
        };
    }

    @Test
    public void theRealWindowReaderFindsAShownDialogsWindow() {
        realReader();
        Activity screen = screen();
        Dialog dialog = new Dialog(screen);
        dialog.show();

        List<View> all = AppLock.roots.list();

        assertNotNull("the framework's window list couldn't be read under Robolectric", all);
        assertTrue("a shown dialog's window wasn't in the list", all.contains(dialog.getWindow().getDecorView()));
        assertTrue("the screen's own window wasn't in the list", all.contains(decorOf(screen)));
    }

    @Test
    public void aWindowAboveTheCoverIsFoundThroughTheRealReaderToo() {
        realReader();
        activity = screen();
        front(activity);
        Dialog cover = ShadowDialog.getLatestDialog();
        View overlay = new View(activity);
        activity.getWindowManager().addView(overlay, new WindowManager.LayoutParams(
                WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.MATCH_PARENT,
                WindowManager.LayoutParams.TYPE_APPLICATION, WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
                PixelFormat.TRANSLUCENT));

        AppLock.sweep(activity);

        assertTrue("the real reader didn't find a window above the cover", takesNoTouch(overlay));
        assertNotSame(cover, ShadowDialog.getLatestDialog());
    }

    @Test
    public void theReportSaysWhetherTheWindowCheckCanSeeEveryWindow() {
        assertEquals("LOCK FACEBOOK", AppLock.REPORT.title());
        Settings.APP_LOCK.save(false);
        assertTrue("the lock is off and the report still spoke", AppLock.REPORT.lines().isEmpty());

        Settings.APP_LOCK.save(true);
        assertEquals(1, AppLock.REPORT.lines().size());
        assertTrue(AppLock.REPORT.lines().get(0), AppLock.REPORT.lines().get(0).contains("not run yet"));

        realReader();
        assertNotNull(AppLock.roots.list());
        assertTrue(AppLock.REPORT.lines().get(0), AppLock.REPORT.lines().get(0).contains("works"));

        // A phone that hides the class: the lock says so instead of quietly noticing less.
        realReader();
        AppLock.windowGlobalName = "android.view.NoSuchWindowGlobal";
        assertNull(AppLock.roots.list());
        assertEquals(1, AppLock.REPORT.lines().size());
        assertTrue(AppLock.REPORT.lines().get(0), AppLock.REPORT.lines().get(0).contains("unavailable"));
    }

    // The unlock shared with a game or ad screen in a process of its own.

    private File note() {
        return new File(RuntimeEnvironment.getApplication().getNoBackupFilesDir(), "applock-unlocked");
    }

    /** A new process of Facebook's with this name: nothing remembered, and the main process's note left alone. */
    private Activity newProcess(String suffix) {
        Application app = RuntimeEnvironment.getApplication();
        ApplicationInfo info = app.getApplicationInfo();
        info.processName = suffix == null ? app.getPackageName() : app.getPackageName() + suffix;
        AppLock.forgetForTests();
        AppLock.prompter = (screen, answer) -> {
            asked.add(screen);
            answers.add(answer);
        };
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        windows.clear();
        asked.clear();
        answers.clear();
        return activity;
    }

    private void mainUnlocked() {
        Activity screen = lockedScreen();
        answers.get(0).unlocked();
        AppLock.paused(screen);
        assertTrue("the main process left no note", note().isFile());
    }

    private String mainProcess;

    @Before
    public void rememberProcess() {
        mainProcess = RuntimeEnvironment.getApplication().getApplicationInfo().processName;
    }

    @After
    public void backToMainProcess() {
        RuntimeEnvironment.getApplication().getApplicationInfo().processName = mainProcess;
        File note = note();
        if (note.exists()) assertTrue(note.delete());
    }

    @Test
    public void aGameOpenedWithinLockAfterOfAnUnlockDoesntAskAgain() {
        mainUnlocked();
        ShadowSystemClock.advanceBy(Duration.ofSeconds(30));
        Activity game = newProcess(":quicksilver");
        front(game);
        assertFalse("a game asked right after Facebook was unlocked", AppLock.covered(game));
        assertTrue(asked.isEmpty());
    }

    @Test
    public void aGameOpenedAfterLockAfterAsksAsItDid() {
        mainUnlocked();
        ShadowSystemClock.advanceBy(Duration.ofSeconds(61));
        Activity game = newProcess(":quicksilver");
        front(game);
        assertTrue(AppLock.covered(game));
        assertEquals(1, asked.size());
    }

    @Test
    public void immediatelyAndARebootNeverShareAnUnlock() {
        Settings.APP_LOCK_AFTER.save(AppLock.After.IMMEDIATELY);
        mainUnlocked();
        Activity game = newProcess(":quicksilver");
        front(game);
        assertTrue("Immediately shared an unlock", AppLock.covered(game));
        asked.clear();

        Settings.APP_LOCK_AFTER.save(AppLock.After.FIVE_MINUTES);
        newProcess(null);
        mainUnlocked();
        Global.putInt(RuntimeEnvironment.getApplication().getContentResolver(), Global.BOOT_COUNT, 6);
        Activity afterReboot = newProcess(":adnw");
        front(afterReboot);
        assertTrue("an unlock from before a restart was trusted", AppLock.covered(afterReboot));
    }

    /** The boot count can repeat, so a note from another boot of the phone is no unlock even with the same count. */
    @Test
    public void aNoteFromAnotherBootWithTheSameBootCountIsNotTrusted() throws Exception {
        mainUnlocked();
        String[] parts = new String(java.nio.file.Files.readAllBytes(note().toPath()),
                java.nio.charset.StandardCharsets.US_ASCII).split(" ");
        assertEquals("the note names the boot's start on the wall clock", 3, parts.length);
        long wallBoot = Long.parseLong(parts[2]);
        ShadowSystemClock.advanceBy(Duration.ofSeconds(30));

        // The same boot, a few seconds of clock drift: trusted.
        writeNote(parts[0] + " " + parts[1] + " " + (wallBoot + 5_000));
        Activity near = newProcess(":quicksilver");
        front(near);
        assertFalse("a note from this boot was refused", AppLock.covered(near));

        // The same count, a boot an hour apart: not trusted.
        writeNote(parts[0] + " " + parts[1] + " " + (wallBoot - 3_600_000));
        Activity far = newProcess(":adnw");
        front(far);
        assertTrue("a note from another boot was trusted", AppLock.covered(far));
        asked.clear();

        // An old note with no boot start is not trusted either.
        writeNote(parts[0] + " " + parts[1]);
        Activity old = newProcess(":quicksilver");
        front(old);
        assertTrue(AppLock.covered(old));
    }

    private void writeNote(String text) throws Exception {
        java.nio.file.Files.write(note().toPath(), text.getBytes(java.nio.charset.StandardCharsets.US_ASCII));
    }

    @Test
    public void theNoteGoesWhenFacebookLocksAndASideProcessNeverWritesOne() {
        mainUnlocked();
        // Away past the time: the next return locks, which takes the note away.
        AppLock.stopped(activity);
        ShadowSystemClock.advanceBy(Duration.ofMinutes(2));
        front(activity);
        assertTrue(AppLock.covering());
        assertFalse("a locked Facebook left an unlock for others", note().exists());

        Activity game = newProcess(":quicksilver");
        front(game);
        asked.clear();
        answers.get(0).unlocked();
        AppLock.paused(game);
        assertFalse("a side process wrote the note", note().exists());
    }

    /** No pause of Hushfacebook turns the cover's guard off: it is in reach of someone holding the phone. */
    @Test
    public void everyPauseStillKeepsWindowsUnderTheCover() {
        for (app.morphe.extension.shared.settings.HushfacebookPause.Reason why
                : app.morphe.extension.shared.settings.HushfacebookPause.Reason.values()) {
            if (why == app.morphe.extension.shared.settings.HushfacebookPause.Reason.NONE) continue;
            AppLock.forgetForTests();
            windows.clear();
            asked.clear();
            answers.clear();
            AppLock.prompter = (screen, answer) -> {
                asked.add(screen);
                answers.add(answer);
            };
            AppLock.roots = freshRoots;
            PauseForTests.pause(why);
            Activity screen = lockedScreen();
            AppLock.roots.list();
            View overlay = notFocusableWindow(screen);
            AppLock.sweep(screen);
            assertTrue("paused by " + why + ", a window above the cover took taps", takesNoTouch(overlay));
            PauseForTests.resume();
        }
    }
}
