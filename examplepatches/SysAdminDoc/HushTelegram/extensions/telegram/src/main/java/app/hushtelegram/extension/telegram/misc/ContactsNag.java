/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.SharedPreferences;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Stops Telegram asking for contacts again once you've said no. Telegram writes two flags to its
 * notification settings: askAboutContacts goes false when Android's permission prompt is denied or
 * the chat list's prompt is turned down, askAboutContacts2 when the Contacts tab's own prompt is.
 * The Contacts tab asks again on every open whatever they say, and its tab badge only reads the
 * second, so a denial from the chat list leaves a "!" there for good. Either flag false counts as a
 * no here. Permission isn't missing on either path when it's granted, so a grant is never quieted.
 */
public final class ContactsNag {
    static final String ASKED_ANYWHERE = "askAboutContacts";
    static final String ASKED_IN_CONTACTS = "askAboutContacts2";

    private ContactsNag() {}

    /** The Contacts tab, contacts permission missing: true returns before its dialog or request. */
    public static boolean skipAsk(SharedPreferences prefs) {
        HookStatus.invoked(FamilyNames.QUIET_CONTACTS_NAG);
        if (!enabled() || !declined(prefs)) return false;
        HookStatus.counted(FamilyNames.QUIET_CONTACTS_NAG, "contacts prompt skipped");
        return true;
    }

    /** The Contacts tab badge, about to show "!": true clears it the way a granted permission does. */
    public static boolean hideBadge(SharedPreferences prefs) {
        HookStatus.invoked(FamilyNames.QUIET_CONTACTS_NAG);
        if (!enabled() || !declined(prefs)) return false;
        HookStatus.counted(FamilyNames.QUIET_CONTACTS_NAG, "contacts badge hidden");
        return true;
    }

    private static boolean declined(SharedPreferences prefs) {
        try {
            return !prefs.getBoolean(ASKED_ANYWHERE, true) || !prefs.getBoolean(ASKED_IN_CONTACTS, true);
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.QUIET_CONTACTS_NAG, "prompt flags read", t);
            return false;
        }
    }

    private static boolean enabled() {
        try {
            return Utils.settingsReady() && Settings.QUIET_CONTACTS_NAG.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.QUIET_CONTACTS_NAG, "switch read", t);
            return false;
        }
    }
}
