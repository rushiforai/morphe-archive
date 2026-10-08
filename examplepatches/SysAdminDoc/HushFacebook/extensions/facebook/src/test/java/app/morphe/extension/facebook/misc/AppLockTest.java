/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.junit.Assert.assertArrayEquals;
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
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.hardware.biometrics.BiometricPrompt;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

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
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.time.Duration;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.settings.SettingsEntry;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.Setting;

/**
 * Lock Facebook: a cold start and a return after the chosen time cover Facebook and ask for the
 * screen lock, only a passed check takes the cover away, picture-in-picture, a rotation, the switch
 * off and a phone without a screen lock never lock, and no pause opens it. Android's prompt is
 * stood in for.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AppLockTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** A screen whose stop is a rotation. */
    public static final class Rotating extends Activity {
        @Override
        public boolean isChangingConfigurations() {
            return true;
        }
    }

    /** A screen whose picture-in-picture mode the test sets, as Android reports it to a pause. */
    public static final class Video extends Activity {
        boolean floating;

        @Override
        public boolean isInPictureInPictureMode() {
            return floating;
        }
    }

    /** Each time the lock asked: over which screen, and how to answer. */
    private final List<Asked> asked = new ArrayList<>();
    private final List<ActivityController<?>> controllers = new ArrayList<>();

    private static final class Asked {
        final Activity activity;
        final AppLock.Answer answer;

        Asked(Activity activity, AppLock.Answer answer) {
            this.activity = activity;
            this.answer = answer;
        }
    }

    @Before
    public void freshProcess() {
        AppLock.forgetForTests();
        AppLock.prompter = (activity, answer) -> asked.add(new Asked(activity, answer));
        secure(true);
    }

    @After
    public void restore() {
        AppLock.forgetForTests();
        PauseForTests.resume();
        Settings.APP_LOCK.resetToDefault();
        Settings.APP_LOCK_AFTER.resetToDefault();
        for (ActivityController<?> controller : controllers) controller.close();
    }

    private static void secure(boolean secure) {
        KeyguardManager keyguard = RuntimeEnvironment.getApplication().getSystemService(KeyguardManager.class);
        shadowOf(keyguard).setIsDeviceSecure(secure);
    }

    private <T extends Activity> T screen(Class<T> type) {
        ActivityController<T> controller = Robolectric.buildActivity(type).setup();
        controllers.add(controller);
        return controller.get();
    }

    private Activity screen() {
        return screen(Activity.class);
    }

    /** A screen coming to the front, as the settings entry's callbacks report it, and the main thread run. */
    private static void front(Activity activity) {
        AppLock.started(activity);
        AppLock.resumed(activity);
        ShadowLooper.idleMainLooper();
    }

    /** Facebook left for [away] and brought back on the same screen. */
    private static void awayAndBack(Activity activity, Duration away) {
        AppLock.stopped(activity);
        ShadowSystemClock.advanceBy(away);
        front(activity);
    }

    private static Button button(View view) {
        if (view instanceof Button) return (Button) view;
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            Button found = button(group.getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }

    @Test
    public void offNeverLocksAndTurningItOnDoesntLockTheScreenInFront() {
        Activity activity = screen();
        front(activity);
        assertFalse(AppLock.covered(activity));
        assertTrue(asked.isEmpty());

        Settings.APP_LOCK.save(true);
        AppLock.resumed(activity);
        ShadowLooper.idleMainLooper();
        assertFalse("the switch locked the screen it was turned on over", AppLock.covered(activity));

        awayAndBack(activity, Duration.ofSeconds(61));
        assertTrue("a return after the time didn't lock", AppLock.covered(activity));
    }

    @Test
    public void aColdStartCoversFacebookAndOnlyAPassedCheckOpensIt() {
        Settings.APP_LOCK.save(true);
        Activity activity = screen();
        front(activity);
        assertTrue(AppLock.covered(activity));
        assertTrue(AppLock.covering());
        assertEquals(1, asked.size());
        assertEquals(activity, asked.get(0).activity);
        assertTrue("the cover isn't the newest window", ShadowDialog.getLatestDialog().isShowing());

        asked.get(0).answer.unlocked();
        assertFalse(AppLock.covered(activity));
        assertFalse(AppLock.covering());
    }

    @Test
    public void aCancelledOrFailedCheckLeavesFacebookCovered() {
        Settings.APP_LOCK.save(true);
        Activity activity = screen();
        front(activity);
        asked.get(0).answer.refused(BiometricPrompt.BIOMETRIC_ERROR_USER_CANCELED, "Cancelled");
        assertTrue("a cancelled check opened Facebook", AppLock.covered(activity));
        assertFalse("the settings opened over the cover", SettingsEntry.open(activity));

        // Coming back to the front doesn't ask again on its own after a no, but Unlock does.
        AppLock.resumed(activity);
        ShadowLooper.idleMainLooper();
        assertEquals(1, asked.size());
        Dialog cover = ShadowDialog.getLatestDialog();
        Button unlock = button(cover.getWindow().getDecorView());
        unlock.performClick();
        ShadowLooper.idleMainLooper();
        assertEquals(2, asked.size());

        asked.get(1).answer.refused(BiometricPrompt.BIOMETRIC_ERROR_LOCKOUT, "Too many attempts");
        assertTrue(AppLock.covered(activity));

        // Back leaves the cover in place and sends Facebook away.
        cover.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_BACK));
        cover.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_BACK));
        assertTrue(cover.isShowing());
        assertTrue(shadowOf(activity).isTaskMovedToBack());
    }

    /** Facebook opens a dialog on a locked screen, and the window manager hands it the focus. */
    private static Dialog facebooksDialogOver(Activity activity, Dialog cover) {
        Dialog facebooks = new Dialog(activity);
        facebooks.show();
        assertSame(facebooks, ShadowDialog.getLatestDialog());
        cover.onWindowFocusChanged(false);
        ShadowLooper.idleMainLooper();
        return facebooks;
    }

    @Test
    public void aDialogFacebookOpensOverTheCoverEndsUpUnderIt() {
        Settings.APP_LOCK.save(true);
        Activity activity = screen();
        front(activity);
        asked.get(0).answer.refused(BiometricPrompt.BIOMETRIC_ERROR_USER_CANCELED, "Cancelled");
        Dialog cover = ShadowDialog.getLatestDialog();

        Dialog facebooks = facebooksDialogOver(activity, cover);
        Dialog top = ShadowDialog.getLatestDialog();
        assertNotSame("the cover stayed under Facebook's dialog", facebooks, top);
        assertNotNull("what went on top isn't a cover", button(top.getWindow().getDecorView()));
        assertTrue(top.isShowing());
        assertTrue(AppLock.covered(activity));
        assertFalse("the old cover stayed up too", cover.isShowing());
        assertTrue("Facebook's dialog was closed rather than covered", facebooks.isShowing());

        // A screen on its way out losing the focus is left alone.
        AppLock.paused(activity);
        top.onWindowFocusChanged(false);
        ShadowLooper.idleMainLooper();
        assertSame(top, ShadowDialog.getLatestDialog());
    }

    @Test
    public void theScreenLockCheckTakingTheFocusLeavesTheCoverButADialogUnderItDoesnt() {
        Settings.APP_LOCK.save(true);
        Activity activity = screen();
        front(activity);
        assertEquals(1, asked.size());
        Dialog cover = ShadowDialog.getLatestDialog();

        // Android's check takes the focus: the cover stays where it is, under it.
        cover.onWindowFocusChanged(false);
        ShadowLooper.idleMainLooper();
        assertSame("the cover moved for the screen lock check", cover, ShadowDialog.getLatestDialog());

        // Facebook opens a dialog while the check is up, then the check is cancelled.
        Dialog facebooks = new Dialog(activity);
        facebooks.show();
        asked.get(0).answer.refused(BiometricPrompt.BIOMETRIC_ERROR_USER_CANCELED, "Cancelled");
        ShadowSystemClock.advanceBy(Duration.ofMillis(AppLock.SETTLE_MS));
        ShadowLooper.idleMainLooper();
        Dialog top = ShadowDialog.getLatestDialog();
        assertNotSame("the cover stayed under a dialog opened during the check", facebooks, top);
        assertNotNull(button(top.getWindow().getDecorView()));
        assertTrue(AppLock.covered(activity));
    }

    @Test
    public void aCheckAndroidCalledOffAsksAgainOnTheNextReturnToTheFront() {
        Settings.APP_LOCK.save(true);
        Activity activity = screen();
        front(activity);
        asked.get(0).answer.refused(AppLock.CALLED_OFF, null);
        assertTrue(AppLock.covered(activity));
        AppLock.resumed(activity);
        ShadowLooper.idleMainLooper();
        assertEquals(2, asked.size());
    }

    @Test
    public void aCheckThatCantStartLeavesFacebookCovered() {
        Settings.APP_LOCK.save(true);
        AppLock.prompter = (activity, answer) -> {
            throw new SecurityException("not in front");
        };
        Activity activity = screen();
        front(activity);
        assertTrue(AppLock.covered(activity));
        assertTrue(AppLock.covering());
    }

    @Test
    public void aReturnAsksOnlyAfterTheChosenTime() {
        Settings.APP_LOCK.save(true);
        Activity activity = screen();
        front(activity);
        asked.get(0).answer.unlocked();

        awayAndBack(activity, Duration.ofSeconds(30));
        assertFalse("half a minute away locked a one minute lock", AppLock.covered(activity));
        awayAndBack(activity, Duration.ofSeconds(61));
        assertTrue(AppLock.covered(activity));
        asked.get(1).answer.unlocked();

        Settings.APP_LOCK_AFTER.save(AppLock.After.FIFTEEN_MINUTES);
        awayAndBack(activity, Duration.ofMinutes(14));
        assertFalse(AppLock.covered(activity));
        Settings.APP_LOCK_AFTER.save(AppLock.After.IMMEDIATELY);
        awayAndBack(activity, Duration.ZERO);
        assertTrue("leaving with the lock set to right away didn't lock", AppLock.covered(activity));
    }

    @Test
    public void aSecondScreenOrARotationIsntALeave() {
        Settings.APP_LOCK.save(true);
        Settings.APP_LOCK_AFTER.save(AppLock.After.IMMEDIATELY);
        Activity first = screen();
        front(first);
        asked.get(0).answer.unlocked();

        // Facebook opening another screen over the first: one starts before the other stops.
        Activity second = screen();
        AppLock.started(second);
        AppLock.stopped(first);
        AppLock.resumed(second);
        ShadowLooper.idleMainLooper();
        assertFalse(AppLock.covered(second));

        Rotating rotating = screen(Rotating.class);
        AppLock.started(rotating);
        AppLock.stopped(second);
        AppLock.resumed(rotating);
        AppLock.stopped(rotating);
        ShadowSystemClock.advanceBy(Duration.ofMinutes(5));
        front(rotating);
        assertFalse("a rotation counted as leaving", AppLock.covered(rotating));
        assertEquals(1, asked.size());
    }

    /** A full-screen video shrinking into its floating window: Android pauses it in that mode. */
    private static void shrink(Video video) {
        video.floating = true;
        AppLock.paused(video);
    }

    /** The floating window brought back to full screen: Android resumes it out of that mode. */
    private static void expand(Video video) {
        video.floating = false;
        AppLock.resumed(video);
        ShadowLooper.idleMainLooper();
    }

    @Test
    public void aPictureInPictureWindowIsNeverCovered() {
        Settings.APP_LOCK.save(true);
        Video video = screen(Video.class);
        front(video);
        asked.get(0).answer.unlocked();

        // However long it plays, the floating window itself is left alone and asks nothing.
        shrink(video);
        ShadowSystemClock.advanceBy(Duration.ofHours(2));
        AppLock.resumed(video);
        ShadowLooper.idleMainLooper();
        assertFalse(AppLock.covered(video));
        assertEquals(1, asked.size());

        // Locked by another screen while it floats, it still stays as it is.
        Activity other = screen();
        front(other);
        assertTrue(AppLock.covered(other));
        AppLock.resumed(video);
        ShadowLooper.idleMainLooper();
        assertFalse(AppLock.covered(video));
    }

    @Test
    public void aReturnFromPictureInPictureAfterTheTimeAsks() {
        Settings.APP_LOCK.save(true);
        Video video = screen(Video.class);
        front(video);
        asked.get(0).answer.unlocked();

        // Brought back within the minute: Facebook was never away long enough.
        shrink(video);
        ShadowSystemClock.advanceBy(Duration.ofSeconds(30));
        expand(video);
        assertFalse("half a minute floating locked a one minute lock", AppLock.covered(video));
        assertEquals(1, asked.size());

        // Floating past the minute, then back to full screen: covered, and the check asked for.
        shrink(video);
        ShadowSystemClock.advanceBy(Duration.ofMinutes(2));
        expand(video);
        assertTrue("the video brought back after the time wasn't covered", AppLock.covered(video));
        assertEquals(2, asked.size());
        asked.get(1).answer.unlocked();

        // Floating past the minute, then Facebook opened from its icon onto another screen.
        shrink(video);
        ShadowSystemClock.advanceBy(Duration.ofMinutes(2));
        Activity other = screen();
        front(other);
        assertTrue("a screen opened while the video floated wasn't covered", AppLock.covered(other));
        assertFalse(AppLock.covered(video));
        assertEquals(3, asked.size());
    }

    /**
     * A reel floating while the phone locks and unlocks: Android stops its window and starts it
     * again, which isn't a return to Facebook, so the time away keeps running. Lock after 15
     * minutes, the reel floated at t0, the phone locked and unlocked at t0+14m, and Facebook opened
     * or the reel brought back at t0+25m: both ask.
     */
    @Test
    public void aFloatingReelThatStartsAgainKeepsTheTimeAwayRunning() {
        Settings.APP_LOCK.save(true);
        Settings.APP_LOCK_AFTER.save(AppLock.After.FIFTEEN_MINUTES);
        for (boolean bringBack : new boolean[] {false, true}) {
            AppLock.forgetForTests();
            asked.clear();
            AppLock.prompter = (shown, answer) -> asked.add(new Asked(shown, answer));
            Video video = screen(Video.class);
            front(video);
            asked.get(0).answer.unlocked();

            shrink(video);
            ShadowSystemClock.advanceBy(Duration.ofMinutes(14));
            // The phone locks and unlocks: the floating window stops, then starts and pauses again.
            AppLock.stopped(video);
            AppLock.started(video);
            AppLock.resumed(video);
            AppLock.paused(video);
            ShadowLooper.idleMainLooper();
            assertFalse("the floating window was covered", AppLock.covered(video));
            assertEquals("the floating window's restart asked", 1, asked.size());

            ShadowSystemClock.advanceBy(Duration.ofMinutes(11));
            if (bringBack) {
                expand(video);
                assertTrue("the reel brought back 25 minutes after it floated wasn't covered", AppLock.covered(video));
            } else {
                Activity other = screen();
                front(other);
                assertTrue("Facebook opened 25 minutes after the reel floated wasn't covered", AppLock.covered(other));
            }
            assertEquals(2, asked.size());
        }
    }

    @Test
    public void aScreenThatGoesWhileAskingDoesntStopTheNextCheck() {
        Settings.APP_LOCK.save(true);
        Activity first = screen();
        front(first);
        AppLock.destroyed(first);
        Activity second = screen();
        AppLock.resumed(second);
        ShadowLooper.idleMainLooper();
        assertEquals(2, asked.size());
        assertEquals(second, asked.get(1).activity);
        asked.get(1).answer.unlocked();
        assertFalse(AppLock.covered(second));
    }

    @Test
    public void noScreenLockNeverLocks() {
        Settings.APP_LOCK.save(true);
        secure(false);
        Activity activity = screen();
        front(activity);
        assertFalse("a phone without a screen lock got a lock it can't open", AppLock.covered(activity));
        assertTrue(asked.isEmpty());
    }

    /** The phone's screen lock taken away while Facebook is locked: no check could pass, so the cover goes. */
    @Test
    public void removingThePhonesScreenLockLetsALockedFacebookGo() {
        Settings.APP_LOCK.save(true);
        Activity activity = screen();
        front(activity);
        asked.get(0).answer.refused(BiometricPrompt.BIOMETRIC_ERROR_USER_CANCELED, "Cancelled");
        assertTrue(AppLock.covered(activity));

        // Back from Android's settings without the screen lock: the same screen comes to the front.
        secure(false);
        AppLock.resumed(activity);
        ShadowLooper.idleMainLooper();
        assertFalse("the cover stayed with nothing left to ask for", AppLock.covered(activity));
        assertFalse(AppLock.covering());
        assertEquals(1, asked.size());

        // Locked again, then Facebook left and brought back after the screen lock went.
        secure(true);
        awayAndBack(activity, Duration.ofMinutes(5));
        assertTrue(AppLock.covered(activity));
        assertEquals(2, asked.size());
        asked.get(1).answer.refused(BiometricPrompt.BIOMETRIC_ERROR_USER_CANCELED, "Cancelled");
        AppLock.stopped(activity);
        secure(false);
        ShadowSystemClock.advanceBy(Duration.ofMinutes(5));
        front(activity);
        assertFalse("a return without a screen lock stayed covered", AppLock.covered(activity));
        assertFalse(AppLock.covering());

        // Locked again, and Unlock tapped after the screen lock went.
        secure(true);
        awayAndBack(activity, Duration.ofMinutes(5));
        assertEquals(3, asked.size());
        asked.get(2).answer.refused(BiometricPrompt.BIOMETRIC_ERROR_USER_CANCELED, "Cancelled");
        secure(false);
        button(ShadowDialog.getLatestDialog().getWindow().getDecorView()).performClick();
        ShadowLooper.idleMainLooper();
        assertFalse("Unlock left Facebook covered with nothing to ask for", AppLock.covering());
        assertEquals("Unlock asked for a screen lock the phone doesn't have", 3, asked.size());
    }

    /**
     * Each way to pause Hushfacebook is in reach of someone holding the phone, so none of them
     * opens Facebook: a start still covers it and asks, and Lock after keeps the time chosen.
     */
    @Test
    public void everyPauseStillLocks() {
        Settings.APP_LOCK.save(true);
        Settings.APP_LOCK_AFTER.save(AppLock.After.FIVE_MINUTES);
        for (HushfacebookPause.Reason why : HushfacebookPause.Reason.values()) {
            if (why == HushfacebookPause.Reason.NONE) continue;
            AppLock.forgetForTests();
            asked.clear();
            AppLock.prompter = (shown, answer) -> asked.add(new Asked(shown, answer));
            PauseForTests.pause(why);
            Activity activity = screen();
            front(activity);
            assertTrue("a start paused by " + why + " wasn't covered", AppLock.covered(activity));
            assertEquals("a start paused by " + why + " didn't ask", 1, asked.size());
            asked.get(0).answer.unlocked();
            assertFalse(AppLock.covered(activity));

            awayAndBack(activity, Duration.ofMinutes(2));
            assertFalse("paused by " + why + ", two minutes away locked a five minute lock", AppLock.covered(activity));
            awayAndBack(activity, Duration.ofMinutes(6));
            assertTrue("paused by " + why + ", a return after the time wasn't covered", AppLock.covered(activity));
            assertEquals(2, asked.size());
        }
    }

    /**
     * Instant Games, their ads and Facebook's crash screen run in processes of their own, where
     * the settings entry starts nothing but the lock's watch. A screen there is covered on the
     * process's cold start and after Lock after, as in the main one.
     */
    @Test
    public void aScreenInAnotherOfFacebooksProcessesLocksToo() {
        Settings.APP_LOCK.save(true);
        Application app = RuntimeEnvironment.getApplication();
        ApplicationInfo info = app.getApplicationInfo();
        String main = info.processName;
        info.processName = app.getPackageName() + ":quicksilver";
        try {
            assertFalse(Utils.isMainProcess());
            SettingsEntry.onApplicationCreate(app);
            // A second run of the hook adds no second watch, which would count every start twice.
            SettingsEntry.onApplicationCreate(app);
            ActivityController<Activity> game = Robolectric.buildActivity(Activity.class).setup();
            controllers.add(game);
            ShadowLooper.idleMainLooper();
            assertTrue("a game's screen opened without the lock", AppLock.covered(game.get()));
            assertEquals(1, asked.size());
            asked.get(0).answer.unlocked();
            assertFalse(AppLock.covered(game.get()));

            game.pause().stop();
            ShadowSystemClock.advanceBy(Duration.ofSeconds(30));
            game.restart().resume();
            ShadowLooper.idleMainLooper();
            assertFalse("half a minute away locked a one minute lock", AppLock.covered(game.get()));

            game.pause().stop();
            ShadowSystemClock.advanceBy(Duration.ofMinutes(2));
            game.restart().resume();
            ShadowLooper.idleMainLooper();
            assertTrue("a game brought back after the time wasn't covered", AppLock.covered(game.get()));
            assertEquals(2, asked.size());
        } finally {
            info.processName = main;
        }
    }

    /**
     * A game already running in its own process while the lock is changed in Facebook's settings:
     * the main process writes the file, and the game's loaded settings don't see it. Its checks read
     * the file, so turning the lock off stops the asking, and turning it back on with no wait asks
     * on the next return.
     */
    @Test
    public void aSideProcessFollowsTheLockAsItsChangedInTheMainOne() {
        Settings.APP_LOCK.save(true);
        Application app = RuntimeEnvironment.getApplication();
        ApplicationInfo info = app.getApplicationInfo();
        String main = info.processName;
        SharedPreferences file = Setting.preferences.preferences;
        info.processName = app.getPackageName() + ":quicksilver";
        try {
            SettingsEntry.onApplicationCreate(app);
            ActivityController<Activity> game = Robolectric.buildActivity(Activity.class).setup();
            controllers.add(game);
            ShadowLooper.idleMainLooper();
            assertTrue(AppLock.covered(game.get()));
            asked.get(0).answer.unlocked();

            file.edit().putBoolean(Settings.APP_LOCK.key, false).commit();
            assertTrue("the game's loaded setting should still say on", Settings.APP_LOCK.get());
            game.pause().stop();
            ShadowSystemClock.advanceBy(Duration.ofMinutes(5));
            game.restart().resume();
            ShadowLooper.idleMainLooper();
            assertFalse("a lock turned off still covered the game", AppLock.covered(game.get()));
            assertEquals(1, asked.size());

            file.edit().putBoolean(Settings.APP_LOCK.key, true)
                    .putString(Settings.APP_LOCK_AFTER.key, AppLock.After.IMMEDIATELY.name()).commit();
            assertEquals(AppLock.After.ONE_MINUTE, Settings.APP_LOCK_AFTER.get());
            game.pause().stop();
            ShadowSystemClock.advanceBy(Duration.ofSeconds(5));
            game.restart().resume();
            ShadowLooper.idleMainLooper();
            assertTrue("a lock turned back on with no wait didn't ask", AppLock.covered(game.get()));
            assertEquals(2, asked.size());
        } finally {
            info.processName = main;
        }
    }

    /**
     * A side process reads the lock's settings straight from the settings file, never through
     * SharedPreferences, whose reload deletes a file the main process is part way through writing
     * and renames its backup over it. Nothing on disk changes: a backup left mid-write and the
     * half-written file stay byte for byte, and the backup's values are the ones read while it's
     * there. A finished write still reaches the side process, and a file cut short with no backup
     * leaves the last values read.
     */
    @Test
    public void aSideProcessReadsTheSettingsFileWithoutChangingIt() throws IOException {
        Application app = RuntimeEnvironment.getApplication();
        ApplicationInfo info = app.getApplicationInfo();
        String main = info.processName;
        File folder = new File(app.getDataDir(), "shared_prefs");
        assertTrue(folder.isDirectory() || folder.mkdirs());
        File file = new File(folder, Setting.PREFERENCES_NAME + ".xml");
        File backup = new File(file.getPath() + ".bak");
        byte[] before = file.exists() ? Files.readAllBytes(file.toPath()) : null;
        info.processName = app.getPackageName() + ":quicksilver";
        try {
            assertFalse(Utils.isMainProcess());
            Files.write(backup.toPath(), lockFile(true, AppLock.After.IMMEDIATELY));
            String whole = new String(lockFile(false, AppLock.After.ONE_HOUR), StandardCharsets.UTF_8);
            byte[] cutShort = whole.substring(0, whole.indexOf("<string")).getBytes(StandardCharsets.UTF_8);
            Files.write(file.toPath(), cutShort);
            byte[] backupBytes = Files.readAllBytes(backup.toPath());

            assertTrue("the backup's switch wasn't the one read", AppLock.lockOn());
            assertEquals(AppLock.After.IMMEDIATELY, AppLock.lockAfter());
            assertTrue("the backup was consumed", backup.exists());
            assertArrayEquals("the backup changed", backupBytes, Files.readAllBytes(backup.toPath()));
            assertArrayEquals("the file being written changed", cutShort, Files.readAllBytes(file.toPath()));

            // The write lands: the file holds the new save and the backup goes.
            Files.write(file.toPath(), lockFile(false, AppLock.After.FIVE_MINUTES));
            assertTrue(backup.delete());
            assertFalse("a finished write didn't reach the side process", AppLock.lockOn());
            assertEquals(AppLock.After.FIVE_MINUTES, AppLock.lockAfter());

            // Cut short with no backup: the last values read stand, and the file is left as it is.
            Files.write(file.toPath(), cutShort);
            assertFalse(AppLock.lockOn());
            assertEquals(AppLock.After.FIVE_MINUTES, AppLock.lockAfter());
            assertArrayEquals(cutShort, Files.readAllBytes(file.toPath()));
            assertFalse(backup.exists());

            // No file and no backup: nothing was saved, so both are at their defaults.
            assertTrue(file.delete());
            assertEquals(Settings.APP_LOCK.defaultValue, AppLock.lockOn());
            assertEquals(Settings.APP_LOCK_AFTER.defaultValue, AppLock.lockAfter());
        } finally {
            info.processName = main;
            //noinspection ResultOfMethodCallIgnored
            backup.delete();
            if (before != null) Files.write(file.toPath(), before);
            else //noinspection ResultOfMethodCallIgnored
                file.delete();
        }
    }

    /** A settings file as Android's SharedPreferences writes one, holding the lock's two settings among others. */
    private static byte[] lockFile(boolean on, AppLock.After after) {
        return ("<?xml version='1.0' encoding='utf-8' standalone='yes' ?>\n<map>\n"
                + "    <boolean name=\"hushfacebook_some_other_switch\" value=\"" + !on + "\" />\n"
                + "    <boolean name=\"" + Settings.APP_LOCK.key + "\" value=\"" + on + "\" />\n"
                + "    <string name=\"" + Settings.APP_LOCK_AFTER.key + "\">" + after.name() + "</string>\n"
                + "    <string name=\"hushfacebook_words\">a &amp; b</string>\n"
                + "</map>\n").getBytes(StandardCharsets.UTF_8);
    }

    @Test
    public void aLockTimeIsReadFromAFileOnlyAsOneThisBuildKnows() {
        Set<String> written = new HashSet<>();
        for (AppLock.After after : AppLock.After.values()) {
            assertTrue("two choices share " + after.fileValue, written.add(after.fileValue));
            assertEquals(after, AppLock.After.fromFile(after.fileValue));
        }
        assertNull(AppLock.After.fromFile("2_minutes"));
        assertNull(AppLock.After.fromFile(60_000));
        assertNull(AppLock.After.fromFile(null));
        assertEquals(AppLock.After.ONE_MINUTE, Settings.APP_LOCK_AFTER.defaultValue);
    }
}
