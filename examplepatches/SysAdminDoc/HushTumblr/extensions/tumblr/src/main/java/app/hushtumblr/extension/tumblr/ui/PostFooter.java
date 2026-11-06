/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import android.content.Context;
import android.content.res.Resources;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.Nullable;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Supplier;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.ResourceType;
import app.hushtumblr.extension.shared.ResourceUtils;
import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Which parts of the footer under a post Tumblr leaves out.
 *
 * <p>Tumblr draws the footer with Compose, one function per button. Each button hook is put first
 * in its button's function, and on true the function returns before it draws anything, so the rest
 * of the footer is drawn without it. Compose remembers what each footer drew last time and expects
 * the same buttons when it draws it again, so each button's answer is fixed the first time it's
 * asked once the settings are ready, and holds until Tumblr restarts.
 *
 * <p>The counts go through {@link #noteCount}, which Tumblr's footer asks for each count before it
 * turns it into text. Tumblr leaves a count of zero blank, so answering zero blanks it. That's only
 * text, so the counts switch shows on the next post that scrolls in.
 *
 * <p>Community posts have a footer of their own, made of Views: a comment button, a share button and
 * the reactions, which stand in for likes there. Each button switch's community hook goes at the end
 * of the method that binds that footer and sets its own controls GONE, with the same answer the
 * Compose button got. The community comment button writes "3 comments" rather than a bare number, so
 * {@link #communityCommentsText} swaps that text for Tumblr's own "Comments" ({@link #textCount}
 * blanks the count Tumblr bolds in it along with it), and {@link #notesTitle} does the same for the
 * count at the top of a post's notes. Each reaction button writes its emoji and how many reacted,
 * and {@link #communityReactionsText} leaves just the emoji. The comment, reblog and like tabs on a
 * post's notes each show a count as well, which {@link #hideNotesTabCounts} leaves blank, and each
 * comment there writes its own reply and like counts through {@link #commentCount}. Those two
 * buttons also tell TalkBack their counts, which {@link #commentRepliesDescription} and
 * {@link #commentLikesDescription} keep it from saying.
 */
public final class PostFooter {
    private PostFooter() {}

    /** Each button's answer, by its hook, once the settings were ready to give one. */
    private static final Map<PatchFamily.Capability, Boolean> FIXED = new ConcurrentHashMap<>();

    /** A community post's reactions and the button that adds one, by their kept class names. */
    static final Set<String> COMMUNITY_REACTIONS =
            names("CommunitiesReactionControl", "CommunitiesAddReactionControl");

    /** A community post's comment button, by its kept class name. */
    static final Set<String> COMMUNITY_COMMENTS = names("CommunitiesCommentsControl");

    /** A community post's share button, by its kept class name. */
    static final Set<String> COMMUNITY_SHARING = names("CommunitiesSharingControl");

    /** Tumblr's own word for a post's comments, and for its notes, by their string names. */
    static final String COMMENTS_LABEL = "comments";
    static final String NOTES_LABEL = "notification_channel_name_notes_v2";

    /** Tumblr's own word for a like button, by its string name. */
    static final String LIKE_LABEL = "alt_text_like_btn";

    /** The longest label taken from Tumblr; anything longer isn't the word wanted. */
    private static final int LONGEST_LABEL = 40;

    /** Whether the last count text on this thread went to a word, for {@link #textCount}. */
    private static final ThreadLocal<Boolean> SWAPPED = new ThreadLocal<>();

    /**
     * Injected at the start of the method that turns a like, reblog or comment count into its text.
     * Zero while Hide note counts is on, which Tumblr shows as no count. The count itself with the
     * switch off, paused, before HushTumblr has its settings, or when anything here fails.
     */
    public static int noteCount(int count) {
        return countOrZero(count, "count hidden");
    }

    /**
     * Injected first thing where a comment in a post's notes writes its reply count, and where it
     * writes its like count. Zero while Hide note counts is on, which Tumblr shows as its "Reply"
     * label and no like count, with both buttons kept. Tumblr hands the comment's own count in on
     * every bind, so the count is back on the next bind with the switch off. The count itself with
     * the switch off, paused, before HushTumblr has its settings, or when anything here fails.
     */
    public static int commentCount(int count) {
        return countOrZero(count, "comment card count hidden");
    }

    /**
     * Injected right after {@link #commentCount} where a comment writes its reply count, on the
     * reply button. Tumblr sets that button's spoken description only for a count, so a card that
     * showed one before would still say it once its count is hidden. Clears it while Hide note
     * counts is on, and TalkBack reads the "Reply" label the button shows. Leaves it alone with the
     * switch off, paused, before HushTumblr has its settings, or when anything here fails.
     */
    public static void commentRepliesDescription(@Nullable View view) {
        if (view == null || !Utils.settingsReady()) return;
        try {
            if (!PatchFamily.Capability.NOTE_COUNTS.installed()) return;
            HookStatus.invoked(FamilyNames.HIDE_NOTE_COUNTS);
            if (!Settings.HIDE_NOTE_COUNTS.get() || view.getContentDescription() == null) return;
            view.setContentDescription(null);
            HookStatus.counted(FamilyNames.HIDE_NOTE_COUNTS, "comment reply description cleared");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_NOTE_COUNTS, "comment reply description", failure);
        }
    }

    /**
     * Injected where a comment's like button sets its spoken description, "3 likes" from the count
     * {@link #commentCount} handed it, so "0 likes" while that count is hidden. Tumblr's own "Like"
     * in its place while Hide note counts is on, so TalkBack says no number. The description itself
     * otherwise. Never throws.
     */
    public static CharSequence commentLikesDescription(CharSequence text) {
        String word = wordFor(text, LIKE_LABEL, () -> L10n.t("Like"), "comment like description swapped");
        return word != null ? word : text;
    }

    /** Zero while Hide note counts is on, counted under {@code counted}, and {@code count} otherwise. Never throws. */
    private static int countOrZero(int count, String counted) {
        // Tumblr builds footers while it starts, before HushTumblr may read a switch.
        if (!Utils.settingsReady()) return count;
        try {
            if (!PatchFamily.Capability.NOTE_COUNTS.installed()) return count;
            HookStatus.invoked(FamilyNames.HIDE_NOTE_COUNTS);
            if (count == 0 || !Settings.HIDE_NOTE_COUNTS.get()) return count;
            HookStatus.counted(FamilyNames.HIDE_NOTE_COUNTS, counted);
            return 0;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_NOTE_COUNTS, "switch read", failure);
            return count;
        }
    }

    /**
     * Injected where a community post's comment button has written its "3 comments" text. Tumblr's
     * own "Comments" in its place while Hide note counts is on, read each time the button is drawn.
     * The text itself otherwise. Never throws.
     */
    public static String communityCommentsText(String text) {
        return countFree(text, COMMENTS_LABEL, () -> L10n.t("Comments"), "comment count hidden");
    }

    /**
     * Injected where a community post's reaction button is about to show its text: the reactions'
     * emoji, a space and [count], how many reacted. Just the emoji while Hide note counts is on,
     * read each time the button is bound. The text itself otherwise, or when it doesn't end in that
     * count. Never throws.
     */
    public static String communityReactionsText(String text, int count) {
        if (text == null || !Utils.settingsReady()) return text;
        try {
            if (!PatchFamily.Capability.NOTE_COUNTS.installed()) return text;
            HookStatus.invoked(FamilyNames.HIDE_NOTE_COUNTS);
            if (!Settings.HIDE_NOTE_COUNTS.get()) return text;
            // Tumblr appends the total with StringBuilder.append(int), which writes it the way this does.
            String total = " " + count;
            if (!text.endsWith(total)) return text;
            HookStatus.counted(FamilyNames.HIDE_NOTE_COUNTS, "reaction count hidden");
            return text.substring(0, text.length() - total.length());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_NOTE_COUNTS, "reaction count", failure);
            return text;
        }
    }

    /**
     * Injected right after {@link #communityCommentsText}, on the count Tumblr bolds at the start of
     * that text. Tumblr bolds as many characters as the count has, which on Tumblr's word would land
     * on part of it or run past its end, so the count is blank whenever the text just went to the
     * word. The count itself otherwise. Never throws.
     */
    public static String textCount(String count) {
        return Boolean.TRUE.equals(SWAPPED.get()) ? "" : count;
    }

    /**
     * Injected where a post's notes screen has written its "12 notes" title. Tumblr's own "Notes" in
     * its place while Hide note counts is on. The title itself otherwise. Never throws.
     */
    public static String notesTitle(String title) {
        return countFree(title, NOTES_LABEL, () -> L10n.t("Notes"), "notes count hidden");
    }

    /**
     * Injected first thing in the method that writes the count on one of a post's notes tabs. True
     * while Hide note counts is on, and the tab gets no number, the way Tumblr shows a count it
     * doesn't have yet. Read each time the tabs are drawn. False with the switch off, paused, before
     * HushTumblr has its settings, or when anything here fails.
     */
    public static boolean hideNotesTabCounts() {
        if (!Utils.settingsReady()) return false;
        try {
            if (!PatchFamily.Capability.NOTE_COUNTS.installed()) return false;
            HookStatus.invoked(FamilyNames.HIDE_NOTE_COUNTS);
            if (!Settings.HIDE_NOTE_COUNTS.get()) return false;
            HookStatus.counted(FamilyNames.HIDE_NOTE_COUNTS, "notes tab count hidden");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_NOTE_COUNTS, "notes tab count", failure);
            return false;
        }
    }

    /**
     * [text], or Tumblr's [label] (HushTumblr's [own] word when this build lacks it) while counts are
     * hidden. Remembers on this thread which it answered, for {@link #textCount}.
     */
    private static String countFree(String text, String label, Supplier<String> own, String counted) {
        String word = wordFor(text, label, own, counted);
        SWAPPED.set(word != null);
        return word != null ? word : text;
    }

    /** The word that goes in place of [text] while counts are hidden, or null to leave [text] alone. */
    @Nullable
    private static String wordFor(CharSequence text, String label, Supplier<String> own, String counted) {
        if (text == null || !Utils.settingsReady()) return null;
        try {
            if (!PatchFamily.Capability.NOTE_COUNTS.installed()) return null;
            HookStatus.invoked(FamilyNames.HIDE_NOTE_COUNTS);
            if (!Settings.HIDE_NOTE_COUNTS.get()) return null;
            HookStatus.counted(FamilyNames.HIDE_NOTE_COUNTS, counted);
            return tumblrLabel(Utils.getContext(), label, own);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_NOTE_COUNTS, "count text", failure);
            return null;
        }
    }

    /** Tumblr's string [name] in the app's language, or HushTumblr's [own] word when it has no usable one. */
    static String tumblrLabel(@Nullable Context context, String name, Supplier<String> own) {
        int id = context == null ? 0 : ResourceUtils.getIdentifier(context, ResourceType.STRING, name);
        if (id == 0) return own.get();
        try {
            String text = context.getString(id).trim();
            if (!text.isEmpty() && text.length() <= LONGEST_LABEL && text.indexOf('\n') < 0) return text;
        } catch (Resources.NotFoundException missing) {
            // A name with no value in this configuration: the build doesn't offer that word here.
        }
        return own.get();
    }

    /** Injected first in the footer's like button. True while Hide the like button is on. */
    public static boolean hideLikeButton() {
        return hides(PatchFamily.Capability.LIKE_BUTTON, FamilyNames.HIDE_LIKE_BUTTON, Settings.HIDE_LIKE_BUTTON,
                "like button hidden");
    }

    /** Injected first in the footer's reblog button. True while Hide the reblog button is on. */
    public static boolean hideReblogButton() {
        return hides(PatchFamily.Capability.REBLOG_BUTTON, FamilyNames.HIDE_REBLOG_BUTTON,
                Settings.HIDE_REBLOG_BUTTON, "reblog button hidden");
    }

    /** Injected first in the footer's comment button. True while Hide the comment button is on. */
    public static boolean hideCommentButton() {
        return hides(PatchFamily.Capability.COMMENT_BUTTON, FamilyNames.HIDE_COMMENT_BUTTON,
                Settings.HIDE_COMMENT_BUTTON, "comment button hidden");
    }

    /** Injected first in the footer's share button. True while Hide the share button is on. */
    public static boolean hideShareButton() {
        return hides(PatchFamily.Capability.SHARE_BUTTON, FamilyNames.HIDE_SHARE_BUTTON,
                Settings.HIDE_SHARE_BUTTON, "share button hidden");
    }

    /**
     * Injected first in the footer's Save button, which Tumblr draws only while its POST_STASH flag
     * is on. True while Hide the Save button is on.
     */
    public static boolean hideSaveButton() {
        return hides(PatchFamily.Capability.SAVE_BUTTON, FamilyNames.HIDE_SAVE_BUTTON, Settings.HIDE_SAVE_BUTTON,
                "save button hidden");
    }

    /**
     * Injected at the end of the method that binds a community post's footer. Hides its reactions
     * while Hide the like button is on. Never throws.
     */
    public static void hideCommunityReactions(@Nullable ViewGroup footer) {
        hideInCommunityFooter(footer, PatchFamily.Capability.LIKE_BUTTON, FamilyNames.HIDE_LIKE_BUTTON,
                Settings.HIDE_LIKE_BUTTON, COMMUNITY_REACTIONS, "community reactions hidden");
    }

    /**
     * Injected at the end of the method that binds a community post's footer. Hides its comment
     * button while Hide the comment button is on. Never throws.
     */
    public static void hideCommunityComments(@Nullable ViewGroup footer) {
        hideInCommunityFooter(footer, PatchFamily.Capability.COMMENT_BUTTON, FamilyNames.HIDE_COMMENT_BUTTON,
                Settings.HIDE_COMMENT_BUTTON, COMMUNITY_COMMENTS, "community comment button hidden");
    }

    /**
     * Injected at the end of the method that binds a community post's footer. Hides its share button
     * while Hide the share button is on. Never throws.
     */
    public static void hideCommunityShare(@Nullable ViewGroup footer) {
        hideInCommunityFooter(footer, PatchFamily.Capability.SHARE_BUTTON, FamilyNames.HIDE_SHARE_BUTTON,
                Settings.HIDE_SHARE_BUTTON, COMMUNITY_SHARING, "community share button hidden");
    }

    /**
     * Sets every view in [footer] whose class is one of [controls] GONE when the button's answer is
     * to hide it. Tumblr sets each control's visibility again as it binds the footer, before this
     * runs, so the controls come back once the switch is off and Tumblr restarts.
     */
    private static void hideInCommunityFooter(@Nullable ViewGroup footer, PatchFamily.Capability hook,
            String family, BooleanSetting setting, Set<String> controls, String counted) {
        if (footer == null || !answer(hook, family, setting)) return;
        try {
            if (hideControls(footer, controls) > 0) HookStatus.counted(family, counted);
        } catch (Throwable failure) {
            HookStatus.threw(family, "community footer", failure);
        }
    }

    /** Sets each view under [group] whose class is named in [controls] GONE, and says how many. */
    static int hideControls(ViewGroup group, Set<String> controls) {
        int hidden = 0;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (controls.contains(child.getClass().getSimpleName())) {
                child.setVisibility(View.GONE);
                hidden++;
            } else if (child instanceof ViewGroup) {
                hidden += hideControls((ViewGroup) child, controls);
            }
        }
        return hidden;
    }

    /** The button's [answer], counted as [counted] when it's to hide. */
    private static boolean hides(PatchFamily.Capability hook, String family, BooleanSetting setting,
            String counted) {
        if (!answer(hook, family, setting)) return false;
        HookStatus.counted(family, counted);
        return true;
    }

    /**
     * The button's answer: its switch as it was the first time it was asked once the settings were
     * ready. False before then, paused (the pause is decided once a run too), with its hook not in
     * this build, or when anything here fails. Never throws.
     */
    private static boolean answer(PatchFamily.Capability hook, String family, BooleanSetting setting) {
        if (!Utils.settingsReady()) return false;
        try {
            if (!hook.installed()) return false;
            HookStatus.invoked(family);
            return FIXED.computeIfAbsent(hook, unused -> setting.get());
        } catch (Throwable failure) {
            HookStatus.threw(family, "switch read", failure);
            return false;
        }
    }

    private static Set<String> names(String... names) {
        return Collections.unmodifiableSet(new HashSet<>(Arrays.asList(names)));
    }

    /** Forgets every fixed answer, as a new run of Tumblr would. */
    static void forgetAnswersForTests() {
        FIXED.clear();
    }
}
