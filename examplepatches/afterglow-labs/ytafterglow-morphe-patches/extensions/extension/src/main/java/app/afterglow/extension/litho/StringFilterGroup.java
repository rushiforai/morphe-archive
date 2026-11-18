package app.afterglow.extension.litho;

/**
 * Text patterns matched against a component's path, identifier or
 * accessibility string, gated by Afterglow preferences.
 *
 * <p>Patterns match anywhere in the text: {@code "reel_like_button.e"} matches
 * a path that contains {@code ...|reel_like_button.eml|...}.
 */
public class StringFilterGroup extends FilterGroup<CharSequence> {

    /** Patterns that apply while the boolean preference {@code prefKey} is on. */
    public StringFilterGroup(String prefKey, String... patterns) {
        super(keyOf(prefKey), patterns);
    }

    protected StringFilterGroup(String[] prefKeys, String[] patterns) {
        super(prefKeys, patterns);
    }

    protected StringFilterGroup(String intKey, int intValue, String[] patterns) {
        super(intKey, intValue, patterns);
    }

    /** Patterns that apply while the integer preference {@code intKey} is {@code value}, such as a mode picker. */
    public static StringFilterGroup whenEquals(String intKey, int value, String... patterns) {
        if (intKey == null) throw new IllegalArgumentException("Null Afterglow preference key");
        return new StringFilterGroup(intKey, value, patterns);
    }

    /** Patterns that apply while any of the preferences is on. */
    public static StringFilterGroup anyOf(String[] prefKeys, String... patterns) {
        return new StringFilterGroup(keysOf(prefKeys), patterns);
    }

    /** Patterns without a preference gate, for checks inside an already gated filter. */
    public static StringFilterGroup always(String... patterns) {
        return new StringFilterGroup(NO_KEYS, patterns);
    }

    /** Index of the first pattern found in the text, or -1 if none is found or the group is off. */
    public int indexIn(CharSequence text) {
        if (text == null || text.length() == 0 || !isEnabled()) return -1;
        for (CharSequence pattern : patterns) {
            int index = indexOf(text, pattern, 0);
            if (index >= 0) return index;
        }
        return -1;
    }

    /** True if the group is on and one of its patterns is in the text. */
    public boolean matches(CharSequence text) {
        return indexIn(text) >= 0;
    }

    /** {@link String#indexOf(String, int)} for any {@link CharSequence}. */
    static int indexOf(CharSequence text, CharSequence pattern, int fromIndex) {
        int textLength = text.length();
        int patternLength = pattern.length();
        int start = Math.max(0, fromIndex);
        if (patternLength == 0) return start <= textLength ? start : -1;

        char first = pattern.charAt(0);
        for (int i = start, last = textLength - patternLength; i <= last; i++) {
            if (text.charAt(i) != first) continue;
            int j = 1;
            while (j < patternLength && text.charAt(i + j) == pattern.charAt(j)) j++;
            if (j == patternLength) return i;
        }
        return -1;
    }
}
