package app.afterglow.extension.litho;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;

/**
 * Byte patterns matched against an element's protobuf buffer, gated by
 * Afterglow preferences.
 *
 * <p>Some buttons share one component name and accessibility id, and only the
 * proto data tells them apart, usually by an icon name such as
 * {@code "yt_outline_bag_"}. Match the shared component with a path group, then
 * check its buffer inside {@link LithoFilter#isFiltered}:
 *
 * <pre>{@code
 * private final ByteArrayFilterGroup shopButton =
 *         new ByteArrayFilterGroup("someBooleanIosKey", "yt_outline_bag_");
 * ...
 * return shopButton.matches(component);
 * }</pre>
 *
 * <p>Searching one group uses Boyer-Moore-Horspool; for several groups over the
 * same buffer, use a {@link ByteArrayFilterGroupList}, which searches all of
 * them in one pass.
 */
public class ByteArrayFilterGroup extends FilterGroup<byte[]> {
    private final int[][] skipTables;

    /** UTF-8 encodings of the strings, while the boolean preference {@code prefKey} is on. */
    public ByteArrayFilterGroup(String prefKey, String... patterns) {
        this(keyOf(prefKey), toBytes(patterns));
    }

    /** Raw byte patterns (such as protobuf field keys), while {@code prefKey} is on. */
    public ByteArrayFilterGroup(String prefKey, byte[]... patterns) {
        this(keyOf(prefKey), patterns);
    }

    protected ByteArrayFilterGroup(String[] prefKeys, byte[][] patterns) {
        super(prefKeys, patterns);
        int[][] tables = new int[this.patterns.length][];
        for (int i = 0; i < tables.length; i++) {
            if (this.patterns[i].length == 0) throw new IllegalArgumentException("Empty byte pattern");
            tables[i] = skipTable(this.patterns[i]);
        }
        skipTables = tables;
    }

    /** UTF-8 encodings of the strings, while any of the preferences is on. */
    public static ByteArrayFilterGroup anyOf(String[] prefKeys, String... patterns) {
        return new ByteArrayFilterGroup(keysOf(prefKeys), toBytes(patterns));
    }

    /** UTF-8 encodings of the strings, without a preference gate. */
    public static ByteArrayFilterGroup always(String... patterns) {
        return new ByteArrayFilterGroup(NO_KEYS, toBytes(patterns));
    }

    static byte[][] toBytes(String[] strings) {
        if (strings == null) throw new IllegalArgumentException("Null filter patterns");
        byte[][] bytes = new byte[strings.length][];
        for (int i = 0; i < strings.length; i++) {
            if (strings[i] == null) throw new IllegalArgumentException("Null filter pattern");
            bytes[i] = strings[i].getBytes(StandardCharsets.UTF_8);
        }
        return bytes;
    }

    private static int[] skipTable(byte[] pattern) {
        int[] table = new int[256];
        Arrays.fill(table, pattern.length);
        for (int i = 0, last = pattern.length - 1; i < last; i++) {
            table[pattern[i] & 0xFF] = last - i;
        }
        return table;
    }

    private static int indexOf(byte[] data, byte[] pattern, int[] skipTable) {
        int last = pattern.length - 1;
        for (int index = 0, end = data.length - pattern.length; index <= end; ) {
            int i = last;
            while (i >= 0 && data[index + i] == pattern[i]) i--;
            if (i < 0) return index;
            index += skipTable[data[index + last] & 0xFF];
        }
        return -1;
    }

    /** Index of the first pattern found in the bytes, or -1 if none is found or the group is off. */
    public int indexIn(byte[] bytes) {
        if (bytes == null || bytes.length == 0 || !isEnabled()) return -1;
        for (int i = 0; i < patterns.length; i++) {
            int index = indexOf(bytes, patterns[i], skipTables[i]);
            if (index >= 0) return index;
        }
        return -1;
    }

    /** True if the group is on and one of its patterns is in the bytes. */
    public boolean matches(byte[] bytes) {
        return indexIn(bytes) >= 0;
    }

    /** True if the group is on and one of its patterns is in the component's proto buffer. */
    public boolean matches(LithoComponent component) {
        return isEnabled() && matches(component.buffer());
    }
}
