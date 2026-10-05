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

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.verify.domain.DomainVerificationManager;
import android.content.pm.verify.domain.DomainVerificationUserState;
import android.net.Uri;
import android.os.Build;

import androidx.annotation.RequiresApi;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Logger;

/**
 * Which of Pinterest's web addresses (pinterest.com, its country sites and pin.it) Android sends
 * to this app, read for this app alone.
 *
 * <p>Pinterest asks Android to verify those links, but the check is against Pinterest's own
 * signing key, so a patched build fails it. From Android 12 they open in the app only once a
 * person selects the addresses on its Open by default page, and Android says which are selected. Android 11 and older say nothing about it, so there
 * the row only opens the app's page.
 */
final class SupportedLinks {
    enum State { VERIFIED, SELECTED, SOME, NONE, DISABLED, UNKNOWN, NOT_REPORTED }

    private SupportedLinks() {}

    /** What Android says about this app's links, or UNKNOWN when it couldn't be read. */
    static State read(Context context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) return userState(context);
        return State.NOT_REPORTED;
    }

    @RequiresApi(Build.VERSION_CODES.S)
    private static State userState(Context context) {
        try {
            DomainVerificationManager manager = context.getSystemService(DomainVerificationManager.class);
            if (manager == null) return State.UNKNOWN;
            DomainVerificationUserState user = manager.getDomainVerificationUserState(context.getPackageName());
            return user == null ? State.UNKNOWN : state(user.isLinkHandlingAllowed(), user.getHostToStateMap());
        } catch (PackageManager.NameNotFoundException | RuntimeException unreadable) {
            Logger.printInfo(() -> "Supported links unreadable: " + unreadable.getClass().getSimpleName());
            return State.UNKNOWN;
        }
    }

    /** The whole app's answer from each address's; a state this code doesn't know is UNKNOWN. */
    @RequiresApi(Build.VERSION_CODES.S)
    private static State state(boolean allowed, Map<String, Integer> hosts) {
        if (!allowed) return State.DISABLED;
        if (hosts == null || hosts.isEmpty()) return State.UNKNOWN;
        int verified = 0;
        int open = 0;
        for (Integer state : hosts.values()) {
            if (state == null) return State.UNKNOWN;
            switch (state) {
                case DomainVerificationUserState.DOMAIN_STATE_VERIFIED:
                    verified++;
                    open++;
                    break;
                case DomainVerificationUserState.DOMAIN_STATE_SELECTED:
                    open++;
                    break;
                case DomainVerificationUserState.DOMAIN_STATE_NONE:
                    break;
                default:
                    return State.UNKNOWN;
            }
        }
        if (verified == hosts.size()) return State.VERIFIED;
        if (open == hosts.size()) return State.SELECTED;
        return open == 0 ? State.NONE : State.SOME;
    }

    static String summary(State state) {
        switch (state) {
            case VERIFIED:
                return L10n.t("Android verified this app for Pinterest's web addresses, so their links open here.");
            case SELECTED:
                return L10n.t("Pinterest's web addresses are selected for this app in Android's settings, so their links open here.");
            case SOME:
                return L10n.t("Only some of Pinterest's web addresses are selected for this app, and links to the rest open "
                        + "elsewhere. Tap to select them in Android's settings.");
            case NONE:
                return L10n.t("None of Pinterest's web addresses are selected for this app, so their links open elsewhere. "
                        + "Tap to select them in Android's settings.");
            case DISABLED:
                return L10n.t("Opening supported links is off for this app in Android's settings. Tap to turn it on.");
            case NOT_REPORTED:
                return L10n.t("Android 11 and older don't say which links open here. Tap to open this app's settings, then Open by default.");
            default:
                return L10n.t("Android didn't say which links open here. Tap to check in Android's settings.");
        }
    }

    /**
     * Android's pages for this app's links, to try in order: Open by default from Android 12, and the
     * app's own page, which leads there, as the fallback and as all older versions have.
     */
    static List<Intent> settingsIntents(Context context) {
        Uri app = Uri.fromParts("package", context.getPackageName(), null);
        List<Intent> intents = new ArrayList<>(2);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            intents.add(new Intent(android.provider.Settings.ACTION_APP_OPEN_BY_DEFAULT_SETTINGS, app));
        }
        intents.add(new Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS, app));
        return intents;
    }
}
