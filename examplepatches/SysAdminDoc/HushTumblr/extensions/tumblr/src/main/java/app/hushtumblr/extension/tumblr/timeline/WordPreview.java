/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * What the word filter alone makes of a post typed into the word editors: whether a word to hide
 * matches, in which field, and whether an allowed word keeps the post anyway. It asks
 * {@link PostRules#wordHit}, the question the feed asks, of a made-up post, so the two can't read
 * a word differently. Other filters aren't asked, so a kept example says nothing about them.
 *
 * <p>The made-up post lives as long as this call. Nothing here is saved, logged or sent anywhere,
 * and the lists are parsed without touching the cache the feed's saved lists use.
 */
public final class WordPreview {
    /** What the word filter does with the example. */
    public enum Outcome {
        /** No field is selected, so no word can match. */
        NO_FIELDS,
        /** The list of words to hide is empty. */
        NO_WORDS,
        /** Nothing is typed in a selected field yet. */
        EMPTY,
        /** No word to hide is in a selected field. */
        KEPT,
        /** A word to hide matched and no allowed word did. */
        HIDDEN,
        /** A word to hide matched, and an allowed word keeps the post. */
        ALLOWED
    }

    public final Outcome outcome;
    /** The field the word to hide was found in, for HIDDEN and ALLOWED. */
    @Nullable public final PostRules.WordField hiddenIn;
    /** That word as the filter reads it, in lower case. */
    @Nullable public final String hiddenBy;
    /** The field the allowed word was found in, for ALLOWED. */
    @Nullable public final PostRules.WordField allowedIn;
    @Nullable public final String allowedBy;

    private WordPreview(Outcome outcome, @Nullable PostRules.WordHit hidden, @Nullable PostRules.WordHit allowed) {
        this.outcome = outcome;
        this.hiddenIn = hidden == null ? null : hidden.field;
        this.hiddenBy = hidden == null ? null : hidden.phrase;
        this.allowedIn = allowed == null ? null : allowed.field;
        this.allowedBy = allowed == null ? null : allowed.phrase;
    }

    /**
     * The word filter's answer for [example], one text per field, with [hiddenWords] and
     * [allowedWords] written as their editors take them and only the [selected] fields read.
     * Tags are split at commas, line breaks and a # that starts a tag, so tags typed the way a
     * post shows them ("#art #cat pics") come out as Tumblr keeps them, and a # inside one ("c#")
     * stays.
     */
    public static WordPreview of(@Nullable String hiddenWords, @Nullable String allowedWords,
                                 Set<PostRules.WordField> selected, Map<PostRules.WordField, String> example) {
        if (selected.isEmpty()) return new WordPreview(Outcome.NO_FIELDS, null, null);
        List<String> words = PostRules.parseWords(hiddenWords);
        if (words.isEmpty()) return new WordPreview(Outcome.NO_WORDS, null, null);
        boolean typed = false;
        for (PostRules.WordField field : selected) {
            String text = example.get(field);
            if (text != null && !text.trim().isEmpty()) typed = true;
        }
        if (!typed) return new WordPreview(Outcome.EMPTY, null, null);
        PostRules rules = new PostRules(false, false, false, false, false, false, false, false,
                words, PostRules.parseWords(allowedWords),
                selected.contains(PostRules.WordField.CURRENT_TEXT), selected.contains(PostRules.WordField.REBLOG_TRAIL),
                selected.contains(PostRules.WordField.TAGS), selected.contains(PostRules.WordField.SUMMARY), false);
        ExamplePost post = new ExamplePost(example);
        List<?> trail = post.hushTrail();
        PostRules.WordHit hidden = rules.wordHit(post, trail, rules.words);
        if (hidden == null) return new WordPreview(Outcome.KEPT, null, null);
        PostRules.WordHit allowed = rules.wordHit(post, trail, rules.allowedWords);
        return new WordPreview(allowed == null ? Outcome.HIDDEN : Outcome.ALLOWED, hidden, allowed);
    }

    /** The typed fields as a post with one text block, one reblog trail entry, its tags and a summary. */
    private static final class ExamplePost implements HushPost {
        private final Map<PostRules.WordField, String> example;

        ExamplePost(Map<PostRules.WordField, String> example) {
            this.example = example;
        }

        @Override
        public List<?> hushContent() {
            return blocks(example.get(PostRules.WordField.CURRENT_TEXT));
        }

        @Override
        public List<?> hushTrail() {
            List<?> blocks = blocks(example.get(PostRules.WordField.REBLOG_TRAIL));
            if (blocks.isEmpty()) return Collections.emptyList();
            HushTrail entry = () -> blocks;
            return Collections.singletonList(entry);
        }

        @Override
        public List<?> hushTags() {
            String typed = example.get(PostRules.WordField.TAGS);
            List<String> tags = new ArrayList<>();
            // A # splits only where a tag starts: at the beginning, or after a space of any kind,
            // a comma or a #.
            if (typed != null) for (String entry : typed.split("[,\\n\\r]|(?<![^\\s\\p{Z},#])#")) {
                String tag = entry.trim();
                if (!tag.isEmpty()) tags.add(tag);
            }
            return tags;
        }

        @Nullable
        @Override
        public String hushSummary() {
            return example.get(PostRules.WordField.SUMMARY);
        }

        @Nullable
        @Override
        public String hushRebloggedFrom() {
            return null;
        }

        private static List<?> blocks(@Nullable String text) {
            if (text == null || text.isEmpty()) return Collections.emptyList();
            HushText block = () -> text;
            return Collections.singletonList(block);
        }
    }
}
