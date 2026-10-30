/*
 * Copyright 2026 pixkk
 */
package app.pixkk.extension.core;

/**
 * The values a setting has until it is changed on the settings page. The patches that own the
 * settings replace each body with the value typed in their options when the app is patched, so a
 * patched app starts with the same values every time, without them being set again on the phone.
 * What the bodies return here is only what an unpatched build would use.
 */
public final class Defaults {
    private Defaults() {
    }

    public static int railSpacingDp() {
        return 0;
    }

    public static int railAvatarGapDp() {
        return 0;
    }

    public static int railDiscGapDp() {
        return 0;
    }

    public static int soundScrollSpeed() {
        return 40;
    }

    public static int shareFavoritePosition() {
        return 0;
    }
}
