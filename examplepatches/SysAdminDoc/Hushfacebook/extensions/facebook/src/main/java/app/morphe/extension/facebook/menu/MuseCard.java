/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.menu;

import androidx.annotation.Nullable;

import app.morphe.extension.facebook.download.PostDetails;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Takes the Muse card out of Facebook's Menu: "Meet Muse, your personal AI agent.", with Get app
 * and Dismiss, between your profile and What's on Facebook.
 *
 * <p>The card is a Menu bookmark drawn with a promotion under it. Each time the bookmark's
 * component renders, it asks whether that promotion was dismissed: Facebook keeps Dismiss per
 * bookmark id, for a while after the tap. The patch hands that answer and the bookmark to
 * {@link #dismissed}, and while the switch is on the bookmark named Muse reads as dismissed, so
 * the card goes the way Facebook's own Dismiss takes it. The bookmark is a GraphQL model, and its
 * name is read through the tree's kept {@code getString}, by the hash of {@code name}, the field
 * Facebook's own log line names a bookmark by.
 *
 * <p>Every other bookmark keeps Facebook's answer. Off, paused, before the settings are ready, for
 * anything but a live tree, or when anything here fails, Facebook's answer stands.
 */
public final class MuseCard {
    /** The bookmark's name. Muse is a product name, the same in every language. */
    static final String MUSE = "Muse";

    /** The bookmark's GraphQL name field, keyed the way the tree keys its fields. */
    static final int NAME = "name".hashCode();

    /** The Hook status name of the hook. */
    static final String HOOK = "Menu bookmark card";

    /** The counter route: every bookmark card asked about, and the ones hidden. */
    static final String ROUTE = "Menu bookmark cards";

    /** What a hidden Muse card is counted under. */
    static final String HIDDEN = "Muse card";

    private MuseCard() {
    }

    /**
     * Injection point, in the Menu bookmark component's render, right after it read whether the
     * bookmark's promotion was dismissed. Returns the answer it uses instead. Never throws.
     */
    public static boolean dismissed(boolean dismissed, @Nullable Object bookmark) {
        try {
            HookStatus.invoked(FamilyNames.MENU_PROMOTIONS);
            if (dismissed) return true;
            // Ready first: Settings loads every switch, and it can't before the context is set.
            if (!Utils.settingsReady() || !Settings.HIDE_MENU_MUSE.get()) return false;
            if (!PostDetails.isLiveTree(bookmark)) {
                // The patch hands over the bookmark the dismissal was read for, so anything else
                // means the anchor took the wrong call.
                HookStatus.missingMember(FamilyNames.MENU_PROMOTIONS, "Menu bookmark model", HOOK,
                        bookmark == null ? "null" : bookmark.getClass().getName());
                return false;
            }
            HookStatus.bound(FamilyNames.MENU_PROMOTIONS, HOOK);
            FeedFilterCounters.sawList(ROUTE, 1);
            if (!isMuse(PostDetails.string(bookmark, NAME))) return false;
            FeedFilterCounters.removed(ROUTE, 1, HIDDEN);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MENU_PROMOTIONS, HOOK, failure);
            return dismissed;
        }
    }

    /** Whether a bookmark named [name] is the Muse card's. */
    static boolean isMuse(@Nullable String name) {
        return name != null && MUSE.equalsIgnoreCase(name.trim());
    }
}
