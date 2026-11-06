/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.comments;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Takes replies that match a saved pattern, or that carry a link while links are hidden, out of a
 * post's replies before Threads builds its rows from them.
 *
 * <p>An opened post asks for its replies and Threads parses the answer's list into rows. The patch
 * hands that list to {@link #filter} first and parses what comes back, so a reply that is taken out
 * was never built, listed or drawn. The switches and the patterns are the user's: one pattern a
 * line, matched whatever the letter case against the text and caption of each post the reply's
 * thread holds, links included as they're written. The link switch is a second rule under the main
 * one, so it takes nothing out while Filter comments is off.
 *
 * <p>A reply's text lives on the posts the reply carries, which are ordinary Threads posts: the
 * patch writes the reads of them in, since Threads renames what it's read with on every release.
 * The typed methods at the bottom answer nothing here; unpatched, every reply stays.
 */
public final class CommentFilter {
    private CommentFilter() {}

    /**
     * Whether the text carries a web link: a scheme, a www. host, or a bare domain with a path. A
     * bare domain alone (shopee.vn) isn't one, so "e.g." or "3.5" in a reply never reads as a link.
     */
    private static final Pattern LINK = Pattern.compile(
            "(?i)(https?://|www\\.|\\b[a-z0-9-]+\\.[a-z]{2,}/)"
    );

    /**
     * Injected where Threads hands the reply list it parsed from a post's answer. Answers the list
     * without the replies a listed pattern matches, or that carry a link while links are hidden, or
     * the same list when none does, Filter comments is off, HushThreads is paused or anything goes
     * wrong. Never throws.
     */
    public static List<?> filter(List<?> replies) {
        return filter(replies, CommentFilter::textOf);
    }

    /** How a reply's text is read: Threads' own post model in the app, a stand-in in tests. */
    interface ReplyText {
        String of(Object reply);
    }

    /** {@link #filter(List)} with each reply's text read by [text]. */
    static List<?> filter(List<?> replies, ReplyText text) {
        try {
            if (replies == null || replies.isEmpty()) return replies;
            if (!Utils.settingsReady()) return replies;

            if (!Settings.FILTER_COMMENTS.get()) return replies;
            boolean byLinks = Settings.HIDE_COMMENT_LINKS.get();
            List<String> patterns = patterns(CommentSettings.FILTER_COMMENT_PATTERNS.get());
            if (patterns.isEmpty() && !byLinks) return replies;

            HookStatus.invoked(FamilyNames.FILTER_COMMENTS);
            HookStatus.counted(FamilyNames.FILTER_COMMENTS, "reply lists checked");

            List<Object> kept = null;
            int index = 0;
            int removed = 0;
            for (Object reply : replies) {
                if (matches(text.of(reply), patterns, byLinks)) {
                    removed++;
                    if (kept == null) {
                        kept = new ArrayList<>(replies.size());
                        kept.addAll(replies.subList(0, index));
                    }
                } else if (kept != null) {
                    kept.add(reply);
                }
                index++;
            }
            HookStatus.counted(FamilyNames.FILTER_COMMENTS, "replies checked", index);
            if (removed == 0) return replies;

            HookStatus.counted(FamilyNames.FILTER_COMMENTS, "matching replies taken out", removed);
            int taken = removed;
            Logger.printDebug(() -> FamilyNames.FILTER_COMMENTS + ": took " + taken + " of " + replies.size()
                    + " replies out");
            return kept == null ? replies : kept;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.FILTER_COMMENTS, "reply list", t);
            return replies;
        }
    }

    /** The settings' patterns: separated by lines or commas, trimmed, lower-cased, blanks dropped. */
    static List<String> patterns(String saved) {
        if (saved == null || saved.isEmpty()) return Collections.emptyList();
        List<String> patterns = new ArrayList<>();
        for (String line : saved.split("[,\\r\\n]+")) {
            String pattern = line.trim().toLowerCase(Locale.ROOT);
            if (!pattern.isEmpty()) patterns.add(pattern);
        }
        return patterns;
    }

    /** Whether [text] holds one of [patterns], or a web link ({@link #LINK}) while [byLinks] is on. */
    static boolean matches(String text, List<String> patterns, boolean byLinks) {
        if (text == null || text.isEmpty()) return false;
        String lower = text.toLowerCase(Locale.ROOT);
        for (String pattern : patterns) {
            if (lower.contains(pattern)) return true;
        }
        return byLinks && LINK.matcher(lower).find();
    }

    /**
     * Whether a reply saying [text] is taken out with the switches as they stand. The decision
     * every reply goes through, on its own so Pause can be shown to reach it.
     */
    public static boolean removes(String text) {
        if (!Utils.settingsReady() || !Settings.FILTER_COMMENTS.get()) return false;
        return matches(text, patterns(CommentSettings.FILTER_COMMENT_PATTERNS.get()), Settings.HIDE_COMMENT_LINKS.get());
    }

    /**
     * Everything a reply says that a pattern is matched against: the text and then the caption of
     * each post its thread holds, in order. Answers an empty string for a reply whose text nothing
     * here could read, so it stays.
     */
    static String textOf(Object reply) {
        try {
            Object items = threadItems(reply);
            if (!(items instanceof List)) return "";
            List<?> threads = (List<?>) items;
            if (threads.isEmpty()) return "";
            StringBuilder text = new StringBuilder();
            for (Object thread : threads) {
                Object media = itemMedia(thread);
                if (media == null) continue;
                append(text, mediaText(media));
                append(text, mediaCaption(media));
            }
            return text.toString();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.FILTER_COMMENTS, "reply text", t);
            return "";
        }
    }

    private static void append(StringBuilder text, String part) {
        if (part == null || part.isEmpty()) return;
        if (text.length() != 0) text.append('\n');
        text.append(part);
    }

    /**
     * The posts a reply carries, in order: a reply's own text is the text of the post inside it.
     * The patch writes the read of the reply's list in.
     */
    static List<?> threadItems(Object reply) {
        return null;
    }

    /**
     * The post one entry of a reply carries ({@code com.instagram.feed.media.Media}), or null for
     * an entry that carries none. The patch writes the entry's own getter in.
     */
    static Object itemMedia(Object item) {
        return null;
    }

    /**
     * The text the post itself holds, the text Threads draws under the author's handle, or null
     * when the post carries none. The patch writes Threads' own accessor in.
     */
    static String mediaText(Object media) {
        return null;
    }

    /**
     * The post's caption text, which Threads keeps on the same post beside the text above, or null
     * when it carries none. The patch writes the read in.
     */
    static String mediaCaption(Object media) {
        return null;
    }
}
