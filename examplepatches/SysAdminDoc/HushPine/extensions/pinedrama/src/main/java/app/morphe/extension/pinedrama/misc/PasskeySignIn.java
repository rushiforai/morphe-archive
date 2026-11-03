/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.misc;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.EarlySwitch;
import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.pinedrama.settings.SettingsStatus;

/**
 * The switch in front of Skip passkey sign-in (#102).
 *
 * <p>A password manager hands a passkey only to an app signed with the key the site's asset
 * links name, which a patched PineDrama can't have, so PineDrama's passkey step can't finish in it.
 * The hook is PineDrama's check of whether this phone can use passkeys at all. With the switch on
 * it answers no, which is what PineDrama hears on a phone without a recent Google Play services,
 * and its sign-in screens take the routes they already have for such a phone. With it off,
 * and while HushPine is paused, the check runs as PineDrama ships it.
 *
 * <p>PineDrama's saved-account list asks once, when its service is built, and that may be before
 * the settings context exists, so a read then comes from the saved file.
 */
@SuppressWarnings("unused")
public final class PasskeySignIn {
    /** {@link Settings#SKIP_PASSKEY_SIGN_IN}'s key, for a read before the settings context. */
    static final String SWITCH_KEY = "skip_passkey_sign_in";

    private PasskeySignIn() {
    }

    /** True while PineDrama's passkey support check should answer no. */
    public static boolean hidePasskeys() {
        if (!SettingsStatus.passkeySignInEnabled) return false;
        return Utils.getContext() != null ? Settings.SKIP_PASSKEY_SIGN_IN.get() : EarlySwitch.isOn(SWITCH_KEY);
    }
}
