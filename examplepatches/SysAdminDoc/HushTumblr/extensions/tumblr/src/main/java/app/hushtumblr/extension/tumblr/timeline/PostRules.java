/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import androidx.annotation.Nullable;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;
import app.hushtumblr.extension.tumblr.settings.TextSettings;

/**
 * The post switches of the timeline filter: Hide reblogs, Hide video posts, Hide photo posts, Hide
 * text posts, Hide posts with these words and Hide filtered posts. {@link TimelineFilter} asks
 * {@link #now} once a page and hands each item's payload to {@link #removes}.
 *
 * <p>A post is read through {@link HushPost}, which the post bridge patch adds to Tumblr's post
 * model. Anything else is kept, a campaign in your own Blaze dashboard included: it carries your
 * post, but it isn't a post in a feed. Anything that can't be read is kept too.
 *
 * <p>A post's kind comes from all of its blocks, the ones in its reblog trail and its own: any
 * video block makes it a video post, any image block without a video makes it a photo post, and
 * everything else is a text post. A post with no blocks at all has no kind and stays.
 *
 * <p>A filtered post is one Tumblr would cover with "This post contains filtered content": its
 * {@link HushFilteredPost} note names a tag or word from your own Tumblr filters.
 */
public final class PostRules {
    static final String VIDEO_BLOCK = "com.tumblr.rumblr.model.post.blocks.VideoBlock";
    static final String IMAGE_BLOCK = "com.tumblr.rumblr.model.post.blocks.ImageBlock";

    /** The families whose switches are here. A heading never goes with one of their posts. */
    static final Set<String> FAMILIES = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            FamilyNames.HIDE_REBLOGS, FamilyNames.HIDE_VIDEO_POSTS, FamilyNames.HIDE_PHOTO_POSTS,
            FamilyNames.HIDE_TEXT_POSTS, FamilyNames.HIDE_POSTS_WITH_WORDS, FamilyNames.HIDE_FILTERED_POSTS)));

    enum Kind { VIDEO, PHOTO, TEXT }

    final boolean reblogs;
    final boolean keepTaggedReblogs;
    final boolean keepReblogsWithContent;
    final boolean video;
    final boolean photo;
    final boolean text;
    /** The phrases to look for, in NFC and ROOT lower case. Empty when the switch is off or the list is. */
    final List<String> words;
    final List<String> allowedWords;
    final boolean wordsCurrentText;
    final boolean wordsReblogTrail;
    final boolean wordsTags;
    final boolean wordsSummary;
    final boolean filtered;

    PostRules(boolean reblogs, boolean keepTaggedReblogs, boolean keepReblogsWithContent, boolean video,
              boolean photo, boolean text, List<String> words, List<String> allowedWords, boolean wordsCurrentText,
              boolean wordsReblogTrail, boolean wordsTags, boolean wordsSummary, boolean filtered) {
        this.reblogs = reblogs;
        this.keepTaggedReblogs = keepTaggedReblogs;
        this.keepReblogsWithContent = keepReblogsWithContent;
        this.video = video;
        this.photo = photo;
        this.text = text;
        this.words = words;
        this.allowedWords = allowedWords;
        this.wordsCurrentText = wordsCurrentText;
        this.wordsReblogTrail = wordsReblogTrail;
        this.wordsTags = wordsTags;
        this.wordsSummary = wordsSummary;
        this.filtered = filtered;
    }

    /** Which kind each block class is, null for neither, so a class is looked up once. */
    private static final Map<Class<?>, Kind> BLOCK_KINDS = new ConcurrentHashMap<>();

    /** The last word list read and what it parsed to, so a page doesn't parse it again. */
    @Nullable
    private static volatile Parsed parsed;
    @Nullable
    private static volatile Parsed allowedParsed;

    /** The post switches on now, or null when none is. Throws for TimelineFilter to report. */
    @Nullable
    static PostRules now() {
        boolean reblogs = on(PatchFamily.Capability.REBLOG_POSTS, FamilyNames.HIDE_REBLOGS, Settings.HIDE_REBLOGS);
        boolean video = on(PatchFamily.Capability.VIDEO_POSTS, FamilyNames.HIDE_VIDEO_POSTS, Settings.HIDE_VIDEO_POSTS);
        boolean photo = on(PatchFamily.Capability.PHOTO_POSTS, FamilyNames.HIDE_PHOTO_POSTS, Settings.HIDE_PHOTO_POSTS);
        boolean text = on(PatchFamily.Capability.TEXT_POSTS, FamilyNames.HIDE_TEXT_POSTS, Settings.HIDE_TEXT_POSTS);
        boolean current = Settings.WORDS_CURRENT_TEXT.get(), trail = Settings.WORDS_REBLOG_TRAIL.get();
        boolean tags = Settings.WORDS_TAGS.get(), summary = Settings.WORDS_SUMMARY.get();
        boolean wordFilter = on(PatchFamily.Capability.POST_WORDS, FamilyNames.HIDE_POSTS_WITH_WORDS,
                Settings.HIDE_POSTS_WITH_WORDS);
        List<String> words = wordFilter && (current || trail || tags || summary)
                ? wordList(TextSettings.HIDDEN_WORDS.get()) : Collections.emptyList();
        boolean filtered = on(PatchFamily.Capability.FILTERED_POSTS, FamilyNames.HIDE_FILTERED_POSTS,
                Settings.HIDE_FILTERED_POSTS);
        if (!reblogs && !video && !photo && !text && words.isEmpty() && !filtered) return null;
        List<String> allowed = words.isEmpty() ? Collections.emptyList() : cachedWordList(TextSettings.ALLOWED_WORDS.get(), true);
        return new PostRules(reblogs, reblogs && Settings.KEEP_TAGGED_REBLOGS.get(),
                reblogs && Settings.KEEP_REBLOGS_WITH_CONTENT.get(), video, photo, text,
                words, allowed, current, trail, tags, summary, filtered);
    }

    /** Whether [capability]'s hook is in and [family]'s switch is on. */
    private static boolean on(PatchFamily.Capability capability, String family, BooleanSetting setting) {
        if (!capability.installed()) return false;
        HookStatus.invoked(family);
        return setting.get();
    }

    /** The first switch that's on, the family a failure is reported under. */
    String owner() {
        if (reblogs) return FamilyNames.HIDE_REBLOGS;
        if (video) return FamilyNames.HIDE_VIDEO_POSTS;
        if (photo) return FamilyNames.HIDE_PHOTO_POSTS;
        if (text) return FamilyNames.HIDE_TEXT_POSTS;
        if (!words.isEmpty()) return FamilyNames.HIDE_POSTS_WITH_WORDS;
        return FamilyNames.HIDE_FILTERED_POSTS;
    }

    /**
     * The patch name of the first switch that takes out the post in [payload], an item's data, or
     * null to keep it: anything that isn't a post, and a post that can't be read.
     */
    @Nullable
    String removes(@Nullable Object payload) {
        if (filtered && isFiltered(payload)) return FamilyNames.HIDE_FILTERED_POSTS;
        HushPost post = postOf(payload);
        if (post == null) return null;
        List<?> trail = reblogs || video || photo || text || !words.isEmpty() && wordsReblogTrail ? post.hushTrail() : null;
        if (reblogs && isReblog(post, trail) && !(keepTaggedReblogs && hasCurrentTags(post))
                && !(keepReblogsWithContent && hasCurrentContent(post))) return FamilyNames.HIDE_REBLOGS;
        if (video || photo || text) {
            Kind kind = kindOf(post, trail);
            if (video && kind == Kind.VIDEO) return FamilyNames.HIDE_VIDEO_POSTS;
            if (photo && kind == Kind.PHOTO) return FamilyNames.HIDE_PHOTO_POSTS;
            if (text && kind == Kind.TEXT) return FamilyNames.HIDE_TEXT_POSTS;
        }
        if (!words.isEmpty() && hasWord(post, trail, words) && !hasWord(post, trail, allowedWords))
            return FamilyNames.HIDE_POSTS_WITH_WORDS;
        return null;
    }

    /** Whether Tumblr would cover [payload] for a tag or word in your filters. */
    static boolean isFiltered(@Nullable Object payload) {
        Object note = payload instanceof HushFilteredPost ? ((HushFilteredPost) payload).hushFiltered() : null;
        if (!(note instanceof HushFiltered)) return false;
        HushFiltered filtered = (HushFiltered) note;
        return hasAny(filtered.hushFilteredTags()) || hasAny(filtered.hushFilteredContent());
    }

    private static boolean hasAny(@Nullable List<?> list) {
        if (list != null) for (Object entry : list) {
            if (entry != null) return true;
        }
        return false;
    }

    /** The post [payload] is, or null when it isn't one. */
    @Nullable
    static HushPost postOf(@Nullable Object payload) {
        return payload instanceof HushPost ? (HushPost) payload : null;
    }

    /** A reblog says which post it reblogs, and carries the posts before it in its trail. */
    static boolean isReblog(HushPost post, @Nullable List<?> trail) {
        String from = post.hushRebloggedFrom();
        return (from != null && !from.isEmpty()) || (trail != null && !trail.isEmpty());
    }

    /** Only tags on this reblog count. A trail entry's tags aren't the current author's contribution. */
    static boolean hasCurrentTags(HushPost post) {
        List<?> tags = post.hushTags();
        if (tags == null) return false;
        for (Object tag : tags) {
            if (tag instanceof String && ((String) tag).codePoints()
                    .anyMatch(point -> !Character.isWhitespace(point) && !Character.isSpaceChar(point))) return true;
        }
        return false;
    }

    /** Only blocks added on this reblog count. What the trail carries is someone else's contribution. */
    static boolean hasCurrentContent(HushPost post) {
        List<?> own = post.hushContent();
        if (own == null) return false;
        for (Object block : own) {
            if (block != null) return true;
        }
        return false;
    }

    /** The kind of [post] from all of its blocks, or null when it has none. */
    @Nullable
    static Kind kindOf(HushPost post, @Nullable List<?> trail) {
        boolean any = false;
        boolean image = false;
        for (List<?> blocks : blockLists(post, trail)) {
            for (Object block : blocks) {
                if (block == null) continue;
                any = true;
                Kind kind = blockKind(block.getClass());
                if (kind == Kind.VIDEO) return Kind.VIDEO;
                if (kind == Kind.PHOTO) image = true;
            }
        }
        if (!any) return null;
        return image ? Kind.PHOTO : Kind.TEXT;
    }

    /** The trail entries' blocks, then the post's own. */
    private static List<List<?>> blockLists(HushPost post, @Nullable List<?> trail) {
        List<List<?>> lists = new ArrayList<>();
        if (trail != null) {
            for (Object entry : trail) {
                List<?> blocks = entry instanceof HushTrail ? ((HushTrail) entry).hushContent() : null;
                if (blocks != null) lists.add(blocks);
            }
        }
        List<?> own = post.hushContent();
        if (own != null) lists.add(own);
        return lists;
    }

    /** VIDEO for a video block of any sort, PHOTO for an image block, TEXT for anything else. */
    static Kind blockKind(Class<?> type) {
        Kind known = BLOCK_KINDS.get(type);
        if (known != null) return known;
        Kind kind = Kind.TEXT;
        for (Class<?> at = type; at != null; at = at.getSuperclass()) {
            if (VIDEO_BLOCK.equals(at.getName())) {
                kind = Kind.VIDEO;
                break;
            }
            if (IMAGE_BLOCK.equals(at.getName())) {
                kind = Kind.PHOTO;
                break;
            }
        }
        BLOCK_KINDS.put(type, kind);
        return kind;
    }

    /** Only selected fields can deny a post or make an exception to that word denial. */
    private boolean hasWord(HushPost post, @Nullable List<?> trail, List<String> words) {
        if (words.isEmpty()) return false;
        if (wordsCurrentText && blocksMatch(post.hushContent(), words)) return true;
        if (wordsReblogTrail && trail != null) {
            for (Object entry : trail) if (entry instanceof HushTrail && blocksMatch(((HushTrail) entry).hushContent(), words)) return true;
        }
        List<?> tags = wordsTags ? post.hushTags() : null;
        if (tags != null) {
            for (Object tag : tags) {
                if (tag != null && matches(tag.toString(), words)) return true;
            }
        }
        return wordsSummary && matches(post.hushSummary(), words);
    }

    private static boolean blocksMatch(@Nullable List<?> blocks, List<String> words) {
        if (blocks != null) for (Object block : blocks) {
            if (block instanceof HushText && matches(((HushText) block).hushText(), words)) return true;
        }
        return false;
    }

    /** Whether [text] holds any of [words], canonically and ignoring case, each as whole words. */
    static boolean matches(@Nullable String text, List<String> words) {
        if (text == null || text.isEmpty()) return false;
        String lower = matchingText(text);
        for (String word : words) {
            if (containsWord(lower, word)) return true;
        }
        return false;
    }

    /**
     * Whether [phrase] is in [text] with no word continuation before or after it, so "cat" finds
     * "Cat pics" and "my cat." but not "category". Both are in NFC and ROOT lower case.
     * Letters, Unicode digits, combining marks and connector punctuation such as underscores
     * continue a word. Other punctuation and symbols, including emoji, separate words. This is
     * a code-point boundary policy, not language-specific segmentation.
     */
    static boolean containsWord(String text, String phrase) {
        if (phrase.isEmpty()) return false;
        int from = 0;
        while (true) {
            int at = text.indexOf(phrase, from);
            if (at < 0) return false;
            int end = at + phrase.length();
            boolean starts = at == 0 || !continuesWord(text.codePointBefore(at));
            boolean ends = end == text.length() || !continuesWord(text.codePointAt(end));
            if (starts && ends) return true;
            from = at + 1;
        }
    }

    private static boolean continuesWord(int point) {
        if (Character.isLetterOrDigit(point)) return true;
        int type = Character.getType(point);
        return type == Character.NON_SPACING_MARK || type == Character.COMBINING_SPACING_MARK
                || type == Character.ENCLOSING_MARK || type == Character.CONNECTOR_PUNCTUATION;
    }

    /** Canonical equivalence and existing case handling, without accent or compatibility folding. */
    private static String matchingText(String text) {
        return Normalizer.normalize(Normalizer.normalize(text, Normalizer.Form.NFC).toLowerCase(Locale.ROOT),
                Normalizer.Form.NFC);
    }

    /**
     * The phrases in [saved]: one a line or split by commas, trimmed, in NFC and ROOT lower case,
     * each once, in the order they were written. Blank entries are dropped.
     */
    public static List<String> wordList(@Nullable String saved) {
        return cachedWordList(saved, false);
    }

    /** One bounded cache for each saved list avoids reparsing either list on the next page. */
    private static List<String> cachedWordList(@Nullable String saved, boolean allow) {
        if (saved == null || saved.trim().isEmpty()) return Collections.emptyList();
        Parsed last = allow ? allowedParsed : parsed;
        if (last != null && last.saved.equals(saved)) return last.words;
        Set<String> words = new LinkedHashSet<>();
        for (String entry : saved.split("[,\\n\\r]")) {
            String word = matchingText(entry.trim());
            if (!word.isEmpty()) words.add(word);
        }
        List<String> list = Collections.unmodifiableList(new ArrayList<>(words));
        Parsed next = new Parsed(saved, list);
        if (allow) allowedParsed = next;
        else parsed = next;
        return list;
    }

    private static final class Parsed {
        final String saved;
        final List<String> words;

        Parsed(String saved, List<String> words) {
            this.saved = saved;
            this.words = words;
        }
    }
}
