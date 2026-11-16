package app.onlynazril.extension.tiktok.settings;

import app.onlynazril.extension.tiktok.StampText;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * How a post or comment older than a week is dated.
 * <p>
 * `stored` is the value saved in prefs and in the backup, kept apart from the declaration order so
 * a later release can present the choices differently without re-meaning an old value. Every id
 * this list no longer carries reads back as {@link #AUTO}: that covers the retired numeric
 * `MM-dd-yy` and `dd-MM`, and the month-first shapes the automatic form already picks per locale.
 * <p>
 * `pattern` is the exact {@link SimpleDateFormat} pattern, or null for the automatic shape (the
 * locale's own month-and-day form, with the year once the post is from another year) and for
 * {@link #CUSTOM}, whose pattern the user types and which is stored beside this choice.
 */
public enum PostDateFormat {
    AUTO("Auto", null, 0),
    YYYY_MM_DD("yyyy-MM-dd", "yyyy-MM-dd", 5),
    DD_MM_YYYY("dd/MM/yyyy", "dd/MM/yyyy", 6),
    CUSTOM("Custom", null, 7);

    /** A pattern longer than this is a paste accident, not a date shape. */
    private static final int MAX_PATTERN_LENGTH = 40;

    public final String label;
    public final String pattern;
    public final int stored;

    PostDateFormat(String label, String pattern, int stored) {
        this.label = label;
        this.pattern = pattern;
        this.stored = stored;
    }

    /** The stored value, with anything out of range or retired falling back to {@link #AUTO}. */
    public static PostDateFormat fromStored(int value) {
        for (PostDateFormat format : values()) {
            if (format.stored == value) return format;
        }
        return AUTO;
    }

    /** Declaration order, which is the order the choice row shows. */
    public static PostDateFormat at(int index) {
        PostDateFormat[] values = values();
        return index >= 0 && index < values.length ? values[index] : AUTO;
    }

    /** The labels the choice row shows, in the stored order. */
    public static String[] labels() {
        PostDateFormat[] values = values();
        String[] labels = new String[values.length];
        for (int i = 0; i < values.length; i++) labels[i] = values[i].label;
        return labels;
    }

    /** The pattern this choice writes with, or null when the automatic shape is the answer. */
    public static String patternFor(PostDateFormat format, String custom) {
        if (format == CUSTOM) return custom;
        return format.pattern;
    }

    /**
     * Whether a typed pattern can date a real instant: not empty, not a wall of text, every letter
     * a pattern letter, and at least one field from the day or the time. A pattern made only of
     * quoted text would format just as well and still show no date.
     */
    public static boolean isValidPattern(String pattern, Locale locale) {
        if (pattern == null) return false;
        String trimmed = pattern.trim();
        if (trimmed.isEmpty() || trimmed.length() > MAX_PATTERN_LENGTH) return false;
        if (!hasDateField(trimmed)) return false;
        try {
            String sample = new SimpleDateFormat(trimmed, locale).format(new Date());
            return sample != null && !sample.trim().isEmpty();
        } catch (IllegalArgumentException ex) {
            return false;
        }
    }

    /** Pattern letters outside quotes that carry a day or a time; `y` alone still counts. */
    private static boolean hasDateField(String pattern) {
        boolean quoted = false;
        for (int i = 0; i < pattern.length(); i++) {
            char c = pattern.charAt(i);
            if (c == '\'') {
                quoted = !quoted;
                continue;
            }
            if (!quoted && "yMdHhmsS".indexOf(c) >= 0) return true;
        }
        return false;
    }

    /** One example per option; an unset or invalid custom pattern reads as an empty line. */
    public static String[] examples(Locale locale, long millis, boolean withClock, String custom) {
        PostDateFormat[] values = values();
        String[] examples = new String[values.length];
        for (int i = 0; i < values.length; i++) {
            PostDateFormat value = values[i];
            String pattern = patternFor(value, custom);
            if (value == CUSTOM && pattern == null) {
                examples[i] = "";
                continue;
            }
            examples[i] = StampText.date(millis, locale, pattern, withClock);
        }
        return examples;
    }
}
