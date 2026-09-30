/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 *
 * Part of the Twitter Bookmarker overlay: see morphe/README.md.
 */

package app.morphe.extension.twitter.patches.bookmarker;

import java.text.Normalizer;
import java.util.Locale;
import java.util.regex.Pattern;

/**
 * Category name to collection slug, mirroring {@code extension/src/shared/slug.ts}
 * so a collection created on the phone lands on the same key the browser
 * extension would have used for the same name.
 *
 * <p>Rules, in order: NFKD-decompose, strip combining marks, lowercase, trim,
 * spaces to "-", drop anything outside {@code [a-z0-9-]}, collapse "-", trim
 * leading/trailing "-". {@code "AI & LLM"} becomes {@code "ai-llm"} and
 * {@code "Read Later"} becomes {@code "read-later"}.
 *
 * <p>One deliberate difference: the browser extension falls back to
 * {@code category-<short-id>} when a name slugs down to nothing, because it is
 * slugging an id nobody typed. Here the user typed a name on purpose, so an
 * empty result is reported back and the save asks again instead of inventing a
 * collection called "category-00000000".
 */
public final class Slug {

    /** Exactly what the backend accepts (storage.SlugPattern). */
    private static final Pattern VALID = Pattern.compile("^[a-z0-9][a-z0-9-]*$");

    private static final Pattern COMBINING_MARKS = Pattern.compile("[\\u0300-\\u036f]");
    private static final Pattern WHITESPACE = Pattern.compile("\\s+");
    private static final Pattern UNSAFE = Pattern.compile("[^a-z0-9-]");
    private static final Pattern REPEATED_DASHES = Pattern.compile("-+");
    private static final Pattern EDGE_DASHES = Pattern.compile("^-+|-+$");

    private Slug() {}

    /** The slug for a human name, or "" when the name has nothing usable. */
    public static String from(String name) {
        if (name == null) return "";
        String slug = Normalizer.normalize(name, Normalizer.Form.NFKD);
        slug = COMBINING_MARKS.matcher(slug).replaceAll("");
        slug = slug.toLowerCase(Locale.US).trim();
        slug = WHITESPACE.matcher(slug).replaceAll("-");
        slug = UNSAFE.matcher(slug).replaceAll("");
        slug = REPEATED_DASHES.matcher(slug).replaceAll("-");
        return EDGE_DASHES.matcher(slug).replaceAll("");
    }

    /** True when the backend will accept this slug, checked before sending it. */
    public static boolean isValid(String slug) {
        return slug != null && VALID.matcher(slug).matches();
    }
}
