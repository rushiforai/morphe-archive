/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.profile;

import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.function.BooleanSupplier;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.L10n;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the second switch of the "Show if a profile follows you" patch: Doesn't follow you on
 * the rows of your own Following list.
 *
 * <p>Every row of a follow list goes through one binder, which hands the row's account and view to
 * a static call that fills in the username, the name line under it and the follow button. The patch
 * calls {@link #row} right after that, with the binder, the row's view and its account. The mark
 * goes after the name on the name line, or takes that line on its own for an account with no name.
 *
 * <p>Only your own Following list is marked: the binder's list has to be one of Instagram's two
 * kinds of Following list, and its owner the account signed in. Followers, someone else's Following
 * list and every other list Instagram draws with this binder stay as they are. Whether an account
 * follows you comes from the friendship status Instagram fetches for the list's rows, as on a
 * profile. Until it knows, nothing is added.
 *
 * <p>Rows are recycled, so a row this marked may come back for another account. Instagram fills the
 * name line in again on each bind, and a mark it didn't overwrite is taken back here before the row
 * is looked at afresh. With the switch off, HushGram paused, the settings not read yet or anything
 * thrown, the row stays as Instagram drew it.
 */
public final class FollowingList {
    /** Instagram's names for its Following lists, which it keeps: the full list and the simplified one. */
    static final Set<String> FOLLOWING_KINDS =
            Collections.unmodifiableSet(new HashSet<>(Arrays.asList("FOLLOWING", "FOLLOWING_SIMPLIFIED")));

    static final String ROW = "following list row";

    /**
     * The name lines this marked, with what each held before and what it was given. Weak, so a row
     * gone from the screen isn't kept.
     */
    private static final Map<TextView, Mark> marked = new WeakHashMap<>();

    private FollowingList() {
    }

    /** What a row's mark replaced, so it can be taken back. */
    private static final class Mark {
        final CharSequence before;
        final CharSequence wrote;
        final int visibility;

        Mark(CharSequence before, CharSequence wrote, int visibility) {
            this.before = before;
            this.wrote = wrote;
            this.visibility = visibility;
        }
    }

    /** Where {@link #row} gets what it needs from Instagram's objects. Tests hand in their own. */
    interface Reader {
        /** The kind of list the binder draws, Instagram's enum constant, or null. */
        @Nullable
        Object listKind(Object binder);

        /** The ID of the account whose list the binder draws, or null. */
        @Nullable
        String listOwnerId(Object binder);

        /** The ID of the account signed in, or null. */
        @Nullable
        String viewerId(Object binder);

        /** Whether [user] follows you, or null when Instagram doesn't know. */
        @Nullable
        Boolean followedBy(Object user);

        /** The name line of the row whose view holder is [holder]. */
        @Nullable
        TextView subtitle(Object holder);
    }

    static final Reader PATCHED = new Reader() {
        @Override
        public Object listKind(Object binder) {
            return FollowingList.listKind(binder);
        }

        @Override
        public String listOwnerId(Object binder) {
            return FollowingList.listOwnerId(binder);
        }

        @Override
        public String viewerId(Object binder) {
            return FollowingList.viewerId(binder);
        }

        @Override
        public Boolean followedBy(Object user) {
            Boolean known = FriendshipStatus.friendshipFollowedBy(user);
            return known != null ? known : FriendshipStatus.followedBy(user);
        }

        @Override
        public TextView subtitle(Object holder) {
            return FollowingList.subtitle(holder);
        }
    };

    /**
     * Injected right after a follow list's binder has filled in a row. Adds Doesn't follow you to the
     * name line when the row is on your own Following list and its account doesn't follow you back.
     * Never throws.
     */
    public static void row(Object binder, int position, View row, Object user) {
        row(binder, row, user, PATCHED, FollowingList::switchedOn);
    }

    static void row(Object binder, View row, Object user, Reader reader, BooleanSupplier on) {
        try {
            HookStatus.invoked(FamilyNames.FRIENDSHIP_STATUS);
            boolean marking = on.getAsBoolean();
            if (!marking && nothingMarked()) return;
            Object holder = row == null ? null : row.getTag();
            TextView subtitle = holder == null ? null : reader.subtitle(holder);
            if (subtitle == null) return;
            unmark(subtitle);
            if (!marking) return;
            if (!ownFollowingList(reader.listKind(binder), reader.listOwnerId(binder), reader.viewerId(binder))) return;
            // Only Instagram's own no counts. Before it has checked, the row says nothing.
            if (!Boolean.FALSE.equals(reader.followedBy(user))) return;
            mark(subtitle, L10n.t("Doesn't follow you"));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FRIENDSHIP_STATUS, ROW, failure);
        }
    }

    /** Whether the list is one of your own Following lists: its kind is a Following list and you own it. */
    static boolean ownFollowingList(@Nullable Object kind, @Nullable String owner, @Nullable String viewer) {
        if (!(kind instanceof Enum)) return false;
        if (!FOLLOWING_KINDS.contains(((Enum<?>) kind).name())) return false;
        return owner != null && !owner.isEmpty() && owner.equals(viewer);
    }

    /**
     * Puts [label] after the name, or on the hidden name line of an account with no name, which it
     * then shows. Whatever goes wrong partway puts the line back as it was.
     */
    private static void mark(TextView subtitle, String label) {
        CharSequence before = subtitle.getText();
        int visibility = subtitle.getVisibility();
        CharSequence wrote = visibility == View.VISIBLE ? FriendshipStatus.joined(before, label) : label;
        try {
            subtitle.setText(wrote);
            if (visibility != View.VISIBLE) subtitle.setVisibility(View.VISIBLE);
        } catch (RuntimeException failure) {
            subtitle.setText(before);
            subtitle.setVisibility(visibility);
            throw failure;
        }
        synchronized (marked) {
            marked.put(subtitle, new Mark(before, wrote, visibility));
        }
        Logger.printDebug(() -> "Following list: marked an account that doesn't follow you");
    }

    /**
     * Takes back the mark on [subtitle], when it still holds it. Once Instagram has filled the line
     * in again for the row's next account, the mark is gone already and the line is left alone.
     */
    private static void unmark(TextView subtitle) {
        Mark mark;
        synchronized (marked) {
            mark = marked.remove(subtitle);
        }
        if (mark == null || !TextUtils.equals(subtitle.getText(), mark.wrote)) return;
        subtitle.setText(mark.before);
        if (mark.visibility != View.VISIBLE && subtitle.getVisibility() == View.VISIBLE) {
            subtitle.setVisibility(mark.visibility);
        }
    }

    private static boolean nothingMarked() {
        synchronized (marked) {
            return marked.isEmpty();
        }
    }

    /** Whether the switch is on: off while paused and before the settings are read. */
    static boolean switchedOn() {
        return Utils.settingsReady() && Settings.MARK_FOLLOWING_LIST.get();
    }

    // ------------------------------------------------------------------ what the patch fills in

    /** Filled in by the patch: the kind of list [binder] draws, Instagram's enum constant, or null. */
    @Nullable
    public static Object listKind(Object binder) {
        return null;
    }

    /** Filled in by the patch: the ID of the account whose list [binder] draws, or null. */
    @Nullable
    public static String listOwnerId(Object binder) {
        return null;
    }

    /** Filled in by the patch: the ID of the account signed in on [binder]'s list, or null. */
    @Nullable
    public static String viewerId(Object binder) {
        return null;
    }

    /** Filled in by the patch: the name line of the row whose view holder is [holder]. */
    @Nullable
    public static TextView subtitle(Object holder) {
        return null;
    }
}
