/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20
 */

package app.morphe.extension.youtube.patches.feed;

import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.ClickableSpan;
import android.text.style.ReplacementSpan;

import androidx.annotation.Nullable;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Recognizes published-video metadata in the visible Litho text, not in its accessibility label. */
final class FeedSubtitle {
    private static final String TEMPLATE = "\\.(?:eml|e)(?:-js)?(?:-fe)?\\|[0-9a-f]+\\|";
    private static final String CONTAINERS = "(?:ContainerType\\|)*";
    private static final String LOCKUP_METADATA = "lockup_metadata(?:_ue)?" + TEMPLATE + CONTAINERS;
    private static final String CONTENT_METADATA = "content_metadata" + TEMPLATE + CONTAINERS;
    // Exact template chains, not substring matches: a badge, attachment, title in the modern metadata
    // header, or nested card with its own template is not a subtitle. The classic layout also needs
    // both a view count and a publication time because it shares the template with the title.
    private static final Pattern CARD_PATH = Pattern.compile("lockup" + TEMPLATE + "CellType\\|" + CONTAINERS
            + LOCKUP_METADATA + CONTENT_METADATA + "TextType\\|");
    private static final Pattern CLASSIC_PATH = Pattern.compile("video_lockup_with_attachment" + TEMPLATE
            + "CellType\\|video_lockup" + TEMPLATE + CONTAINERS + "video_lockup_metadata" + TEMPLATE
            + CONTAINERS + LOCKUP_METADATA + "(?:" + CONTENT_METADATA + ")?TextType\\|");

    private static final String SPACE = "[ \\t\u00a0\u202f]";
    private static final Pattern SEPARATOR = Pattern.compile(SPACE + "*[·•]" + SPACE + "*|[ \\t\ufffc]{2,}");
    private static final Pattern DIRECTION_MARK = Pattern.compile("[\u061c\u200e\u200f\u202a-\u202e\u2066-\u2069]");
    private static final String NUMBER = "\\p{Nd}+(?:[.,'’٬٫\u00a0\u202f ]\\p{Nd}+)*";
    private static final String SCALE = "(?:[KMBkmb]|mi|mil|bi|lakh|crore|ألف|مليون|مليار)";
    private static final String COUNT = NUMBER + "(?:" + SPACE + "?" + SCALE + ")?";
    private static final Pattern VIEW_LABEL = Pattern.compile(COUNT + SPACE
            + "(?:views?|visualizaç(?:ão|ões)|مشاهد(?:ة|ات))"
            + "|(?:no views|sem visualizações|لا توجد مشاهدات)", Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    private static final Pattern BARE_COUNT = Pattern.compile(COUNT);
    private static final Pattern RELATIVE_DATE = Pattern.compile(
            "(?:\\p{Nd}+ (?:second|minute|hour|day|week|month|year)s? ago|yesterday|just now)"
            + "|(?:há \\p{Nd}+ (?:segundo|hora|minuto|dia|semana|mês|meses|ano)s?|ontem|agora mesmo)"
            + "|(?:قبل (?:\\p{Nd}+ )?(?:ثانية|ثوانٍ?|دقيقة|دقائق|ساعة|ساعات|يوم|أيام|أسبوع|أسابيع|شهر|أشهر|سنة|سنوات)"
            + "|قبل (?:يومين|أسبوعين|شهرين|ساعة واحدة|ساعتين|سنتين)|أمس|الآن)",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    private static final String DAY = "(?:0?[1-9]|[12][0-9]|3[01])";
    private static final String MONTH = "(?:Jan(?:uary)?|Feb(?:ruary)?|Mar(?:ch)?|Apr(?:il)?|May|Jun(?:e)?|Jul(?:y)?"
            + "|Aug(?:ust)?|Sep(?:t(?:ember)?)?|Oct(?:ober)?|Nov(?:ember)?|Dec(?:ember)?)\\.?";
    private static final Pattern ABSOLUTE_DATE = Pattern.compile(MONTH + " " + DAY + ", [0-9]{4}"
            + "|" + DAY + " " + MONTH + " [0-9]{4}|[0-9]{4}-(?:0[1-9]|1[0-2])-(?:0[1-9]|[12][0-9]|3[01])"
            + "|" + DAY + " de (?:jan(?:eiro)?|fev(?:ereiro)?|mar(?:ço)?|abr(?:il)?|mai(?:o)?|jun(?:ho)?|jul(?:ho)?"
            + "|ago(?:sto)?|set(?:embro)?|out(?:ubro)?|nov(?:embro)?|dez(?:embro)?)\\.? de [0-9]{4}"
            + "|\\p{Nd}{1,2} (?:يناير|فبراير|مارس|أبريل|مايو|يونيو|يوليو|أغسطس|سبتمبر|أكتوبر|نوفمبر|ديسمبر) \\p{Nd}{4}",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);

    private FeedSubtitle() {
    }

    private record Part(int start, int end) {
        String label(CharSequence text) {
            String label = TextUtils.substring(text, start, end);
            Matcher marks = DIRECTION_MARK.matcher(label);
            String normalized = marks.find() ? marks.replaceAll("").trim() : label;
            return normalized.replace('\u00a0', ' ').replace('\u202f', ' ');
        }
    }

    record Edit(SpannableString text, @Nullable String views, boolean viewsRemoved) {
    }

    @Nullable
    static Edit hide(@Nullable CharSequence path, CharSequence text, boolean hideViews, boolean hideAge) {
        if (path == null || path.length() > 400 || text.length() > 150) {
            return null;
        }
        boolean classic = CLASSIC_PATH.matcher(path).matches();
        if (!classic && !CARD_PATH.matcher(path).matches()) {
            return null;
        }

        Part[] parts = split(text);
        if (parts == null) {
            return null;
        }
        int last = parts[2] != null ? 2 : parts[1] != null ? 1 : 0;
        Part tail = parts[last];
        String label = tail.label(text);
        Part age = RELATIVE_DATE.matcher(label).matches() || ABSOLUTE_DATE.matcher(label).matches() ? tail : null;
        int viewIndex = age == null ? last : last - 1;
        Part views = viewIndex < 0 ? null : parts[viewIndex];
        String viewLabel = views == null ? null : age == null ? label : views.label(text);
        boolean hasPlayIcon = false;
        if (views != null && !VIEW_LABEL.matcher(viewLabel).matches()) {
            int previous = viewIndex > 0 ? parts[viewIndex - 1].end : 0;
            hasPlayIcon = (age != null || (!classic && last == 0)) && text instanceof Spanned spanned
                    && BARE_COUNT.matcher(viewLabel).matches()
                    && hasPlayAttachment(spanned, previous, views.start, viewIndex > 0);
            if (!hasPlayIcon) {
                views = null;
                viewLabel = null;
            }
        }
        int firstMetadata = views != null ? viewIndex : age != null ? last : -1;
        if (firstMetadata < 0 || firstMetadata > 1 || (classic && (views == null || age == null))) {
            return null;
        }

        boolean removeViews = hideViews && views != null;
        boolean removeAge = hideAge && age != null;
        if (!removeViews && !removeAge) {
            return null;
        }
        Part channel = firstMetadata == 1 ? parts[0] : null;
        int start;
        int end = text.length();
        if (removeViews && !removeAge && age != null && channel == null) {
            start = 0;
            end = age.start;
        } else if (!removeViews && views != null) {
            start = views.end;
        } else {
            start = channel == null ? 0 : channelEnd(text, channel.end, parts[firstMetadata].start, hasPlayIcon);
            if (removeViews && !removeAge && age != null) {
                // Reuse the count-to-date separator. The channel's verification icon stays in place.
                end = views.end;
            }
        }

        Part deletion = preserveDirection(text, start, end);
        if (deletion == null || !canDelete(text, deletion.start, deletion.end)) {
            return null;
        }
        SpannableStringBuilder result = new SpannableStringBuilder(text);
        result.delete(deletion.start, deletion.end);
        return new Edit(new SpannableString(result), viewLabel, removeViews);
    }

    @Nullable
    private static Part[] split(CharSequence text) {
        Part[] parts = new Part[3];
        Matcher separators = SEPARATOR.matcher(text);
        int start = 0;
        int size = 0;
        while (separators.find()) {
            Part part = part(text, start, separators.start());
            if (part != null) {
                if (size == 2) {
                    return null;
                }
                parts[size++] = part;
            } else if (start != 0 || dot(text, separators.start(), separators.end()) >= 0) {
                return null;
            }
            start = separators.end();
        }
        parts[size] = part(text, start, text.length());
        return parts[size] == null ? null : parts;
    }

    @Nullable
    private static Part part(CharSequence text, int start, int end) {
        while (start < end && isPadding(text.charAt(start))) {
            start++;
        }
        while (end > start && isPadding(text.charAt(end - 1))) {
            end--;
        }
        return start == end ? null : new Part(start, end);
    }

    private static boolean isPadding(char ch) {
        return ch == ' ' || ch == '\t' || ch == '\u00a0' || ch == '\u202f' || ch == '\ufffc';
    }

    private static int dot(CharSequence text, int start, int end) {
        for (int index = start; index < end; index++) {
            char ch = text.charAt(index);
            if (ch == '·' || ch == '•') {
                return index;
            }
        }
        return -1;
    }

    private static boolean hasPlayAttachment(Spanned text, int start, int end, boolean hasChannel) {
        int dot = dot(text, start, end);
        int attachments = 0;
        for (ReplacementSpan span : text.getSpans(start, end, ReplacementSpan.class)) {
            if (text.getSpanStart(span) >= (dot < 0 ? start : dot + 1) && text.getSpanEnd(span) <= end) {
                attachments++;
            }
        }
        // In an icon separator run, the play icon follows the separator, not the verification icon.
        return attachments == (dot < 0 && hasChannel ? 2 : 1)
                || (dot < 0 && hasChannel && attachments == 3);
    }

    private static int channelEnd(CharSequence text, int start, int end, boolean playAttachment) {
        if (!(text instanceof Spanned spanned)) {
            return start;
        }

        int dot = dot(text, start, end);
        int last = start;
        int previous = start;
        int beforePrevious = start;
        for (ReplacementSpan span : spanned.getSpans(start, end, ReplacementSpan.class)) {
            int spanEnd = spanned.getSpanEnd(span);
            if (spanned.getSpanStart(span) < start || spanEnd > (dot < 0 ? end : dot)) {
                continue;
            }
            if (spanEnd > last) {
                beforePrevious = previous;
                previous = last;
                last = spanEnd;
            } else if (spanEnd > previous) {
                beforePrevious = previous;
                previous = spanEnd;
            } else if (spanEnd > beforePrevious) {
                beforePrevious = spanEnd;
            }
        }
        if (dot >= 0) {
            return last;
        }
        // Spaced runs contain the separator and, for a bare count, its play icon after it.
        return playAttachment ? beforePrevious : previous;
    }

    private static boolean canDelete(CharSequence text, int start, int end) {
        if (start >= end) {
            return false;
        }
        if (!(text instanceof Spanned spanned)) {
            return true;
        }
        for (ClickableSpan span : spanned.getSpans(start, end, ClickableSpan.class)) {
            if (spanned.getSpanStart(span) < end && spanned.getSpanEnd(span) > start) {
                return false;
            }
        }
        for (ReplacementSpan span : spanned.getSpans(start, end, ReplacementSpan.class)) {
            int spanStart = spanned.getSpanStart(span);
            int spanEnd = spanned.getSpanEnd(span);
            if (spanStart < end && spanEnd > start && (spanStart < start || spanEnd > end)) {
                return false;
            }
        }
        return true;
    }

    /** Keep directional wrappers around retained text; only delete paired controls together. */
    @Nullable
    private static Part preserveDirection(CharSequence text, int start, int end) {
        int[] openings = null;
        int depth = 0;
        for (int index = 0; index < text.length(); index++) {
            char ch = text.charAt(index);
            if ((ch >= '\u202a' && ch <= '\u202e' && ch != '\u202c') || (ch >= '\u2066' && ch <= '\u2068')) {
                if (openings == null) {
                    openings = new int[text.length()];
                }
                openings[depth++] = index;
            } else if (ch == '\u202c' || ch == '\u2069') {
                if (depth == 0) {
                    return null;
                }
                int open = openings[--depth];
                if ((text.charAt(open) < '\u2066') != (ch == '\u202c')) {
                    return null;
                }
                if (open < start && index >= start && index < end) {
                    if (!onlyDirectionalPadding(text, index + 1, end)) {
                        return null;
                    }
                    end = index;
                } else if (open >= start && open < end && index >= end) {
                    if (!onlyDirectionalPadding(text, start, open)) {
                        return null;
                    }
                    start = open + 1;
                }
            }
        }
        return depth == 0 ? new Part(start, end) : null;
    }

    private static boolean onlyDirectionalPadding(CharSequence text, int start, int end) {
        for (int i = start; i < end; i++) {
            char ch = text.charAt(i);
            if (!isPadding(ch) && Character.getType(ch) != Character.FORMAT) {
                return false;
            }
        }
        return true;
    }
}
