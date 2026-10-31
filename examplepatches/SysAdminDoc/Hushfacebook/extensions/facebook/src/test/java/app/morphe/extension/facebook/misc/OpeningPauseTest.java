/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.Dialog;
import android.app.KeyguardManager;
import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Looper;
import android.os.PowerManager;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

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

import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.BackCallbacksForTests;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Opening pause: a start from Facebook's icon and a return after a minute away put a countdown
 * over Facebook, Open now works once it's over and Close or Back sends Facebook away. Links,
 * notifications, shares, a settings restart, a quick return, a rotation and time with the screen
 * off open straight away, and the switch off or Hushfacebook paused leave Facebook stock.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class OpeningPauseTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** A Facebook screen that counts the times it was sent to the background. */
    public static final class Screen extends Activity {
        int sentBack;

        @Override
        public boolean moveTaskToBack(boolean nonRoot) {
            sentBack++;
            return true;
        }
    }

    /** A screen whose stop is a rotation. */
    public static final class Rotating extends Activity {
        @Override
        public boolean isChangingConfigurations() {
            return true;
        }
    }

    private final List<ActivityController<?>> controllers = new ArrayList<>();

    @Before
    public void freshProcess() {
        OpeningPause.forgetForTests();
        AppLock.forgetForTests();
        Settings.OPENING_PAUSE.save(true);
        screenOn(true);
    }

    @After
    public void restore() {
        OpeningPause.forgetForTests();
        AppLock.forgetForTests();
        PauseForTests.resume();
        Settings.OPENING_PAUSE.resetToDefault();
        Settings.OPENING_PAUSE_LENGTH.resetToDefault();
        Settings.APP_LOCK.resetToDefault();
        for (ActivityController<?> controller : controllers) controller.close();
    }

    private static void screenOn(boolean on) {
        shadowOf(RuntimeEnvironment.getApplication().getSystemService(PowerManager.class)).setIsInteractive(on);
    }

    private <T extends Activity> T screen(Class<T> type, Intent intent) {
        ActivityController<T> controller = Robolectric.buildActivity(type, intent).setup();
        controllers.add(controller);
        return controller.get();
    }

    private Screen fromIcon() {
        return screen(Screen.class, OpeningPauseForTests.fromIcon());
    }

    /** A return that makes [activity], as the settings entry's callbacks report it. State is null for a fresh start. */
    private static void opens(Activity activity, Bundle state) {
        OpeningPause.created(activity, state);
        front(activity);
    }

    /** [activity] coming to the front, and the main thread run. */
    private static void front(Activity activity) {
        OpeningPause.started(activity);
        OpeningPause.resumed(activity);
        ShadowLooper.idleMainLooper();
    }

    /** Facebook leaving the screen for [away]. */
    private static void away(Activity activity, Duration away) {
        OpeningPause.stopped(activity);
        ShadowSystemClock.advanceBy(away);
    }

    /** [millis] of the main thread's time going by, the countdown's ticks with it. */
    private static void pass(long millis) {
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(millis));
    }

    private static Dialog cover() {
        Dialog cover = ShadowDialog.getLatestDialog();
        assertNotNull("no cover was made", cover);
        return cover;
    }

    private static List<TextView> texts(View view, List<TextView> found) {
        if (view instanceof TextView) found.add((TextView) view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) texts(group.getChildAt(i), found);
        }
        return found;
    }

    private static List<TextView> texts() {
        return texts(cover().getWindow().getDecorView(), new ArrayList<>());
    }

    private static Button button(String label) {
        for (TextView text : texts()) {
            if (text instanceof Button && label.contentEquals(text.getText())) return (Button) text;
        }
        throw new AssertionError("no " + label + " button on the cover");
    }

    private static boolean shows(String line) {
        for (TextView text : texts()) {
            if (line.contentEquals(text.getText())) return true;
        }
        return false;
    }

    /** A cold start from the icon, counted down and opened. */
    private Screen opened() {
        Screen screen = fromIcon();
        opens(screen, null);
        pass(5_000);
        button("Open now").performClick();
        assertFalse(OpeningPause.covering());
        return screen;
    }

    @Test
    public void offLeavesFacebookStock() {
        Settings.OPENING_PAUSE.save(false);
        Screen screen = fromIcon();
        opens(screen, null);
        assertFalse(OpeningPause.covering());

        away(screen, Duration.ofMinutes(5));
        front(screen);
        assertFalse("a return paused with the switch off", OpeningPause.covering());
    }

    @Test
    public void aStartFromTheIconCountsDownBeforeOpenNowWorks() {
        opens(fromIcon(), null);
        assertTrue(OpeningPause.covering());
        assertTrue(shows("Still want to open Facebook?"));
        Button openNow = button("Open now");
        assertFalse(openNow.isEnabled());
        assertTrue(shows("You can open it in 5 seconds."));

        pass(4_000);
        assertTrue(shows("You can open it in 1 second."));
        openNow.performClick();
        assertTrue("Open now worked before the count was over", OpeningPause.covering());

        pass(1_000);
        assertTrue(openNow.isEnabled());
        assertTrue(shows("Open it, or close it and do something else."));
        openNow.performClick();
        assertFalse(OpeningPause.covering());
    }

    @Test
    public void tenSecondsWaitsTen() {
        Settings.OPENING_PAUSE_LENGTH.save(OpeningPause.Length.TEN_SECONDS);
        opens(fromIcon(), null);
        assertTrue(shows("You can open it in 10 seconds."));
        pass(5_000);
        assertFalse(button("Open now").isEnabled());
        pass(5_000);
        assertTrue(button("Open now").isEnabled());
    }

    @Test
    public void linksNotificationsAndSharesOpenStraightAway() {
        Intent link = new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.facebook.com/groups/1"));
        Intent notification = new Intent().setComponent(
                new ComponentName(RuntimeEnvironment.getApplication(), Screen.class));
        Intent share = new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT, "hi");
        Intent iconWithData = OpeningPauseForTests.fromIcon().setData(Uri.parse("fb://feed"));
        for (Intent intent : Arrays.asList(link, notification, share, iconWithData)) {
            OpeningPause.forgetForTests();
            opens(screen(Screen.class, intent), null);
            assertFalse(intent + " paused", OpeningPause.covering());
        }
    }

    @Test
    public void aLinkToFacebookInTheBackgroundOpensStraightAway() {
        Screen screen = opened();
        away(screen, Duration.ofMinutes(5));
        // Android's order for a screen that's brought back with a new intent.
        OpeningPause.started(screen);
        OpeningPause.newIntent(new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.facebook.com/groups/1")));
        OpeningPause.resumed(screen);
        ShadowLooper.idleMainLooper();
        assertFalse(OpeningPause.covering());

        away(screen, Duration.ofMinutes(5));
        front(screen);
        assertTrue("the icon after a link didn't pause", OpeningPause.covering());
    }

    @Test
    public void facebooksOwnIntentsDontLiftACover() {
        Screen screen = fromIcon();
        opens(screen, null);
        OpeningPause.newIntent(new Intent(Intent.ACTION_VIEW, Uri.parse("fb://notifications")));
        OpeningPause.resumed(screen);
        ShadowLooper.idleMainLooper();
        assertTrue(OpeningPause.covering());
    }

    @Test
    public void aReturnWithinAMinuteOpensStraightAwayAndOneAfterPauses() {
        Screen screen = opened();
        away(screen, Duration.ofSeconds(59));
        front(screen);
        assertFalse("a quick return paused", OpeningPause.covering());

        away(screen, Duration.ofSeconds(61));
        front(screen);
        assertTrue("a return after a minute didn't pause", OpeningPause.covering());
    }

    @Test
    public void theIconScreenHandingOnKeepsTheCount() {
        Screen icon = fromIcon();
        Screen main = screen(Screen.class, OpeningPauseForTests.fromIcon());
        opens(icon, null);
        pass(2_000);
        OpeningPause.created(main, null);
        front(main);
        OpeningPause.stopped(icon);
        OpeningPause.destroyed(icon);
        assertTrue("the main screen came up uncovered", OpeningPause.covering());
        assertTrue("the count started over", shows("You can open it in 3 seconds."));
    }

    @Test
    public void aRotationIsntAReturn() {
        Rotating before = screen(Rotating.class, OpeningPauseForTests.fromIcon());
        opens(before, null);
        pass(5_000);
        button("Open now").performClick();
        ShadowSystemClock.advanceBy(Duration.ofMinutes(2));

        OpeningPause.stopped(before);
        opens(fromIcon(), new Bundle());
        assertFalse(OpeningPause.covering());
    }

    @Test
    public void timeWithTheScreenOffIsntTimeAway() {
        Screen screen = opened();
        screenOn(false);
        away(screen, Duration.ofMinutes(10));
        screenOn(true);
        front(screen);
        assertFalse(OpeningPause.covering());
    }

    @Test
    public void aSettingsRestartOpensStraightAway() {
        OpeningPause.restarted();
        Screen screen = fromIcon();
        opens(screen, null);
        assertFalse(OpeningPause.covering());

        away(screen, Duration.ofMinutes(2));
        front(screen);
        assertTrue("the restart kept later returns from pausing", OpeningPause.covering());
    }

    @Test
    public void pausedHushfacebookLeavesFacebookStock() {
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        opens(fromIcon(), null);
        assertFalse(OpeningPause.covering());
    }

    @Test
    public void switchingItOffLiftsTheCoverAtTheNextResume() {
        Screen screen = fromIcon();
        opens(screen, null);
        Settings.OPENING_PAUSE.save(false);
        OpeningPause.resumed(screen);
        assertFalse(OpeningPause.covering());

        Settings.OPENING_PAUSE.save(true);
        OpeningPause.resumed(screen);
        assertFalse("turning it on covered the screen in front", OpeningPause.covering());
    }

    @Test
    public void closeAndBackSendFacebookAwayAndTheCountStartsOver() {
        Screen screen = fromIcon();
        opens(screen, null);
        pass(3_000);
        button("Close").performClick();
        assertEquals(1, screen.sentBack);

        away(screen, Duration.ofSeconds(10));
        front(screen);
        assertTrue("closing lifted the pause", OpeningPause.covering());
        assertTrue(shows("You can open it in 5 seconds."));

        cover().onBackPressed();
        assertEquals(2, screen.sentBack);
        assertTrue(OpeningPause.covering());
    }

    /** On Android 16 Back reaches the cover as its window's callback, and sends Facebook away once. */
    @Test
    @Config(sdk = 36)
    public void backThroughTheWindowsCallbackSendsFacebookAway() throws ReflectiveOperationException {
        BackCallbacksForTests.on(true);
        Screen screen = fromIcon();
        opens(screen, null);
        BackCallbacksForTests.top(cover().getWindow().getDecorView()).onBackInvoked();
        assertEquals(1, screen.sentBack);
        assertTrue(OpeningPause.covering());
    }

    @Test
    public void theLockComesFirstAndThePauseAfterTheUnlock() {
        Settings.APP_LOCK.save(true);
        KeyguardManager keyguard = RuntimeEnvironment.getApplication().getSystemService(KeyguardManager.class);
        shadowOf(keyguard).setIsDeviceSecure(true);
        AppLock.Answer[] answer = {null};
        AppLock.prompter = (activity, given) -> answer[0] = given;

        Screen screen = fromIcon();
        // The settings entry registers the lock's callbacks first.
        OpeningPause.created(screen, null);
        AppLock.started(screen);
        OpeningPause.started(screen);
        AppLock.resumed(screen);
        OpeningPause.resumed(screen);
        ShadowLooper.idleMainLooper();
        assertTrue(AppLock.covering());
        assertFalse("the pause came up under the lock", OpeningPause.covering());

        assertNotNull("the lock didn't ask", answer[0]);
        answer[0].unlocked();
        ShadowLooper.idleMainLooper();
        assertFalse(AppLock.covering());
        assertTrue("the pause didn't come after the unlock", OpeningPause.covering());
    }

    @Test
    public void theButtonsAreBigEnoughToTap() {
        Screen screen = fromIcon();
        opens(screen, null);
        float density = screen.getResources().getDisplayMetrics().density;
        for (String label : Arrays.asList("Open now", "Close")) {
            assertTrue(label + " is under 48dp", button(label).getMinHeight() >= Math.round(48 * density));
        }
    }
}
