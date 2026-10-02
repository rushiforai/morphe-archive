/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.profile;

import android.view.View;
import android.widget.TextView;

import androidx.annotation.Nullable;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.L10n;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Show if a profile follows you" patch.
 *
 * <p>The header of someone's profile shows their pronouns in a small line beside their name, from a
 * slot that's only filled in when they've set some. Each time Instagram binds the name, it fills that
 * slot and shows it, or hides it. The patch calls {@link #besidePronouns} right after the slot is
 * shown and {@link #inPlaceOfPronouns} right after it's hidden, with the slot and the profile
 * screen's header, and the label goes after the pronouns or takes the slot on its own.
 *
 * <p>Whether the account follows you comes from the friendship status Instagram keeps on the
 * profile's user, which it asks for when the profile opens, or failing that from the user's own
 * followed_by. Until it knows, nothing is added.
 */
public final class FriendshipStatus {
    static final String SEPARATOR = " · ";

    private FriendshipStatus() {
    }

    /**
     * Injected right after the profile header shows the pronouns slot with the account's pronouns.
     * Adds the label after them. Never throws.
     */
    public static void besidePronouns(Object slot, Object header) {
        try {
            HookStatus.invoked(FamilyNames.FRIENDSHIP_STATUS);
            String label = label(header);
            if (label == null) return;
            View view = slotView(slot);
            if (!(view instanceof TextView)) return;
            TextView text = (TextView) view;
            text.setText(joined(text.getText(), label));
            log(label);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FRIENDSHIP_STATUS, "profile header", failure);
        }
    }

    /**
     * Injected right after the profile header hides the pronouns slot, for an account with none.
     * Puts the label in the slot and shows it. Never throws.
     */
    public static void inPlaceOfPronouns(Object slot, Object header) {
        try {
            HookStatus.invoked(FamilyNames.FRIENDSHIP_STATUS);
            String label = label(header);
            if (label == null) return;
            View view = slotView(slot);
            if (!(view instanceof TextView)) return;
            ((TextView) view).setText(label);
            setSlotVisibility(slot, View.VISIBLE);
            log(label);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FRIENDSHIP_STATUS, "profile header", failure);
        }
    }

    /** The label for the profile [header] belongs to, or null when the switch is off or it isn't known. */
    @Nullable
    static String label(Object header) {
        if (!Utils.settingsReady() || !Settings.SHOW_FRIENDSHIP_STATUS.get()) return null;
        Object user = profileUser(header);
        if (user == null) {
            Logger.printDebug(() -> "Friendship status: the profile's user isn't loaded yet");
            return null;
        }
        if (isViewer(header, user)) return null;
        Boolean followedBy = friendshipFollowedBy(user);
        if (followedBy == null) followedBy = followedBy(user);
        if (followedBy == null) Logger.printDebug(() -> "Friendship status: Instagram hasn't said whether this account follows you");
        return text(followedBy);
    }

    /** Whether [user] is the account signed in, whose own profile gets no label. */
    static boolean isViewer(Object header, Object user) {
        String id = userId(user);
        return id != null && id.equals(viewerId(header));
    }

    /** "Follows you" for true, "Doesn't follow you" for false, and null when Instagram doesn't know. */
    @Nullable
    static String text(@Nullable Boolean followedBy) {
        if (followedBy == null) return null;
        return followedBy ? L10n.t("Follows you") : L10n.t("Doesn't follow you");
    }

    /** The pronouns with the label after them, or the label alone when there are none. */
    static CharSequence joined(@Nullable CharSequence pronouns, String label) {
        if (pronouns == null || pronouns.length() == 0) return label;
        return pronouns + SEPARATOR + label;
    }

    private static void log(String label) {
        Logger.printDebug(() -> "Friendship status: labelled a profile " + label);
    }

    // ------------------------------------------------------------------ what the patch fills in

    /** Filled in by the patch: the user of the profile screen [header] belongs to, or null. */
    @Nullable
    public static Object profileUser(Object header) {
        return null;
    }

    /**
     * Filled in by the patch: whether [user] follows you, from the friendship status Instagram keeps
     * on the user, or null when it has none.
     */
    @Nullable
    public static Boolean friendshipFollowedBy(Object user) {
        return null;
    }

    /** Filled in by the patch: whether [user] follows you, from the user's own field, or null when Instagram doesn't know. */
    @Nullable
    public static Boolean followedBy(Object user) {
        return null;
    }

    /** Filled in by the patch: [user]'s ID, or null. */
    @Nullable
    public static String userId(Object user) {
        return null;
    }

    /** Filled in by the patch: the ID of the account signed in on the profile screen [header] belongs to, or null. */
    @Nullable
    public static String viewerId(Object header) {
        return null;
    }

    /** Filled in by the patch: the slot's TextView, put in place the first time it's asked for. */
    @Nullable
    public static View slotView(Object slot) {
        return null;
    }

    /** Filled in by the patch: shows or hides the slot. True once it's done that. */
    public static boolean setSlotVisibility(Object slot, int visibility) {
        return false;
    }
}
