/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.chats;

import static org.robolectric.Shadows.shadowOf;

import android.app.Application;
import android.content.ComponentName;
import android.content.Intent;
import android.content.IntentFilter;

import org.robolectric.RuntimeEnvironment;
import org.robolectric.shadows.ShadowPackageManager;

/** Puts Messenger with its home screen entry on the test phone, and taps the icon as Facebook would. */
public final class MessengerIconForTests {
    /** A stand-in for the activity Messenger's launcher entry names. */
    static final ComponentName HOME = new ComponentName(MessengerCard.MESSENGER, MessengerCard.MESSENGER + ".StartScreen");

    private MessengerIconForTests() {
    }

    private static Application app() {
        return RuntimeEnvironment.getApplication();
    }

    /**
     * Installs Messenger, signed with a key that isn't this app's, with a MAIN and LAUNCHER
     * activity, the entry a home screen icon starts.
     */
    public static void install() {
        MessengerCardForTests.install(true);
        ShadowPackageManager packages = shadowOf(app().getPackageManager());
        packages.addActivityIfNotPresent(HOME);
        IntentFilter launcher = new IntentFilter(Intent.ACTION_MAIN);
        launcher.addCategory(Intent.CATEGORY_LAUNCHER);
        packages.addIntentFilterForActivity(HOME, launcher);
    }

    /** Takes Messenger off again, its launcher entry with it. */
    public static void uninstall() {
        MessengerCardForTests.uninstall();
    }

    /** The next activity the app started, or null, taking it off Robolectric's list. */
    public static Intent nextStarted() {
        return shadowOf(app()).getNextStartedActivity();
    }

    /**
     * With Messenger installed, taps the icon the way the top bar does. True when Messenger opened
     * in place of Facebook's Chats, which is the switch changing what Facebook would have done.
     */
    public static boolean opensMessenger() {
        install();
        boolean opened = MessengerIcon.open(app(), false);
        shadowOf(app()).clearNextStartedActivities();
        return opened;
    }
}
