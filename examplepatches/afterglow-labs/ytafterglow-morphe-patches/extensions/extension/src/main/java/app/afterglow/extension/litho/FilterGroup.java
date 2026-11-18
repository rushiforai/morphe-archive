package app.afterglow.extension.litho;

import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.Descriptor;
import app.afterglow.extension.settings.LiteMode;

/**
 * Patterns that hide something, gated by Afterglow preferences.
 *
 * <p>A group is on while any of its preference keys is on. The keys are the
 * iOS keys from {@code tools/ios-registry.json} (for example
 * {@code "hideShortsLike"}) and must be boolean settings; an unknown key throws
 * while the filter loads, so a typo cannot silently disable a filter. Groups
 * without keys ({@code always(...)}) are for checks inside a filter that is
 * already gated, such as "is this one of the action bar's buttons".
 *
 * <p>The preferences are read when a pattern is found, never ahead of time, so
 * a switch in the YTAfterglow settings applies to the next component YouTube
 * builds, as on iOS.
 *
 * @param <T> the content type: {@link CharSequence} or {@code byte[]}.
 */
public abstract class FilterGroup<T> {
    static final String[] NO_KEYS = new String[0];

    private final String[] prefKeys;
    /** Integer preference that gates the group instead of boolean keys, or null. */
    private final String intKey;
    private final int intValue;
    final T[] patterns;

    FilterGroup(String[] prefKeys, T[] patterns) {
        this(prefKeys, null, 0, patterns);
    }

    /** A group that is on while the integer preference {@code intKey} equals {@code intValue}. */
    FilterGroup(String intKey, int intValue, T[] patterns) {
        this(NO_KEYS, intKey, intValue, patterns);
    }

    private FilterGroup(String[] prefKeys, String intKey, int intValue, T[] patterns) {
        if (patterns == null || patterns.length == 0) {
            throw new IllegalArgumentException("A filter group needs at least one pattern");
        }
        for (T pattern : patterns) {
            if (pattern == null) throw new IllegalArgumentException("Null filter pattern");
        }
        for (String key : prefKeys) {
            Descriptor descriptor = AfterglowPrefs.descriptor(key);
            if (descriptor == null || descriptor.type != Descriptor.Type.BOOLEAN) {
                throw new IllegalArgumentException("Not a boolean Afterglow preference: " + key);
            }
        }
        if (intKey != null) {
            Descriptor descriptor = AfterglowPrefs.descriptor(intKey);
            if (descriptor == null || descriptor.type != Descriptor.Type.INTEGER) {
                throw new IllegalArgumentException("Not an integer Afterglow preference: " + intKey);
            }
        }
        this.prefKeys = prefKeys.clone();
        this.intKey = intKey;
        this.intValue = intValue;
        this.patterns = patterns.clone();
    }

    static String[] keyOf(String prefKey) {
        if (prefKey == null) {
            throw new IllegalArgumentException("Gate the group with an Afterglow preference key, or use always(...)");
        }
        return new String[] {prefKey};
    }

    static String[] keysOf(String[] prefKeys) {
        if (prefKeys == null || prefKeys.length == 0) {
            throw new IllegalArgumentException("anyOf(...) needs at least one Afterglow preference key");
        }
        for (String key : prefKeys) {
            if (key == null) throw new IllegalArgumentException("Null Afterglow preference key");
        }
        return prefKeys;
    }

    /**
     * True while any of the group's preference keys is on, or while its integer
     * preference has the group's value; always true for an ungated group.
     *
     * <p>Booleans are read as iOS {@code ytagBool} reads them: the stored value,
     * unless Lite Mode forces the key ({@link LiteMode#effectiveBool}). Integers
     * are read raw, as iOS {@code ytagInt} does.
     */
    public boolean isEnabled() {
        if (intKey != null) return AfterglowPrefs.getInt(intKey) == intValue;
        String[] keys = prefKeys;
        if (keys.length == 0) return true;
        for (String key : keys) {
            if (LiteMode.effectiveBool(key)) return true;
        }
        return false;
    }

    /** The preference keys that gate this group (empty for an ungated group). */
    public String[] prefKeys() {
        return prefKeys.clone();
    }
}
