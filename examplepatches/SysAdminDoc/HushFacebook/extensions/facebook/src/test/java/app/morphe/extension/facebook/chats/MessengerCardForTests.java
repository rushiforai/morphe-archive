/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.chats;

import static org.robolectric.Shadows.shadowOf;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;

import org.robolectric.RuntimeEnvironment;

/** Puts Messenger on the test phone or takes it off, and asks the hook as Chats would. */
public final class MessengerCardForTests {
    private MessengerCardForTests() {
    }

    private static PackageManager packages() {
        return RuntimeEnvironment.getApplication().getPackageManager();
    }

    /**
     * Installs Messenger, [enabled] or disabled, signed with a key that isn't this app's: Meta's
     * Messenger beside a re-signed Facebook.
     */
    public static void install(boolean enabled) {
        PackageInfo messenger = new PackageInfo();
        messenger.packageName = MessengerCard.MESSENGER;
        messenger.signatures = new Signature[]{new Signature("0a0b0c0d")};
        messenger.applicationInfo = new ApplicationInfo();
        messenger.applicationInfo.packageName = MessengerCard.MESSENGER;
        messenger.applicationInfo.enabled = enabled;
        shadowOf(packages()).installPackage(messenger);
    }

    /**
     * Takes Messenger off again. Robolectric's removePackage, not deletePackage: the second also
     * records the package as deleted, and the package manager then doesn't find a later install.
     */
    public static void uninstall() {
        shadowOf(packages()).removePackage(MessengerCard.MESSENGER);
    }

    /** Drops what the hook kept from its last look, as a new Facebook process would start without it. */
    public static void newProcess() {
        MessengerCard.forget();
    }

    /**
     * With Messenger installed and a fresh process, asks the hook the way the card's show question
     * does. True when it hid the card, which is the switch changing what Facebook would have done.
     */
    public static boolean hidesWithMessenger() {
        install(true);
        newProcess();
        return MessengerCard.hide();
    }
}
