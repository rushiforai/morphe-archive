package app.spicetify.extension.spotify.theme;

import android.util.Log;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

/**
 * Themes Spotify's Compose screens through Encore. The theme patch routes both reads of Spotify's
 * default dark palette through {@link #palette}, hands Encore's raw colors to {@link #primitives}
 * once they're built, and passes two screens' own #282828 surfaces through {@link #surface};
 * {@link #table()} says which color resource each palette and raw color field follows, so the theme's
 * resource values theme Views and Compose alike. Behind a background image, the header scrim and
 * icons tinted with the page background pass through {@link #scrimAlpha} and {@link #iconTint}.
 * Nothing here throws into Spotify: when in doubt, Spotify keeps its own colors.
 */
public final class ComposeTheme {
    private static final String TAG = "Spicetify";
    /** Spotify's #282828 surface as Compose stores it, and the resource with that stock color. */
    private static final long SURFACE = 0xFF282828L << 32;
    private static final String SURFACE_RESOURCE = "gray_15";
    private static final long OPAQUE = 0xFFL << 56;
    /**
     * The alpha of a see-through color: nearly clear, but never 0, so it's never Compose's
     * Color.Transparent, which an icon may be tinted with on purpose.
     */
    static final int SEE_THROUGH = 0x01000000;

    /** The palette's paths, then the raw colors' paths. Tests put in their own. */
    static Table[] tables = parse(table());

    /** The theme in use. A new one for each update. */
    private static volatile Theme theme = new Theme(Collections.<String, Integer>emptyMap(), false);
    /** The colors of see-through fields, which an icon must never be tinted with. */
    private static volatile long[] knockouts = new long[0];
    /** The last stock palette, the theme it was themed for, and the themed copy. */
    private static volatile Object[] cached = new Object[3];
    private static Object rawColors;
    private static final Map<String, Object> stockSlots = new HashMap<>();

    private ComposeTheme() {}

    /** The theme patch replaces this with the table for the patched Spotify version. */
    static String table() {
        return "";
    }

    /**
     * From ThemeRuntime: the theme's resource values, and whether a background image shows behind
     * Spotify. No values restore Spotify's palette and raw colors.
     */
    public static synchronized void update(Map<String, Integer> values, boolean backgroundImage) {
        try {
            Theme next = new Theme(values, backgroundImage);
            theme = next;
            knockouts = knockouts(next);
            applyPrimitives();
        } catch (RuntimeException e) {
            Log.w(TAG, "Compose colors could not be updated", e);
        }
    }

    /** Injection point: right after Spotify reads its default dark Encore palette. */
    public static Object palette(Object stock) {
        Object[] cache = cached;
        Theme current = theme;
        if (cache[0] == stock && cache[1] == current) return cache[2];
        Object themed = stock;
        if (stock != null && !current.colors.isEmpty()) {
            try {
                Copy copy = new Copy(tables[0], current);
                themed = copy.of(stock, "");
                Log.i(TAG, "Compose palette: " + copy.themed + " of " + copy.mapped() + " colors themed");
            } catch (Exception e) {
                Log.w(TAG, "Compose palette kept Spotify's colors", e);
                themed = stock;
            }
        }
        cached = new Object[] {stock, current, themed};
        return themed;
    }

    /** Injection point: the end of the static initializer of Encore's raw colors. */
    public static synchronized void primitives(Object holder) {
        if (holder != rawColors) stockSlots.clear();
        rawColors = holder;
        applyPrimitives();
    }

    /**
     * Injection point: the #282828 surface two screens keep in a static field, read once when its class
     * loads. It follows gray_15, which has that stock color, so a theme's card color reaches it.
     */
    public static long surface(long stock) {
        Integer color = theme.colors.get(SURFACE_RESOURCE);
        return color == null || stock != SURFACE ? stock : (long) color << 32;
    }

    /** Injection point: both alphas of the header scrim, which clears while a background image shows. */
    public static float scrimAlpha(float alpha) {
        return theme.backgroundImage ? 0f : alpha;
    }

    /**
     * Injection point: every Encore icon's tint. An icon Spotify tints with the page background, like
     * the glyph on the small green play button, stays opaque when that background turns see-through.
     */
    public static long iconTint(long tint) {
        for (long knockout : knockouts) {
            if (tint == knockout) return tint | OPAQUE;
        }
        return tint;
    }

    /** Puts themed copies of Encore's raw color groups into their holder, or Spotify's own back. */
    private static void applyPrimitives() {
        Object holder = rawColors;
        if (holder == null) return;
        Theme current = theme;
        Copy copy = new Copy(tables[1], current);
        for (String slot : tables[1].slots()) {
            try {
                Field field = holder.getClass().getDeclaredField(slot);
                if (Modifier.isFinal(field.getModifiers())) throw new IllegalStateException("final slot");
                field.setAccessible(true);
                Object stock = stockSlots.get(slot);
                if (stock == null) {
                    stock = field.get(holder);
                    stockSlots.put(slot, stock);
                }
                field.set(holder, stock == null || current.colors.isEmpty() ? stock : copy.of(stock, slot));
            } catch (Exception e) {
                Log.w(TAG, "Encore raw colors kept Spotify's " + slot, e);
            }
        }
        if (!current.colors.isEmpty()) {
            Log.i(TAG, "Encore raw colors: " + copy.themed + " of " + copy.mapped() + " colors themed");
        }
    }

    /** The see-through colors of a theme with a background image: each such field's color, nearly clear. */
    private static long[] knockouts(Theme theme) {
        Set<Long> colors = new LinkedHashSet<>();
        for (Table table : tables) {
            for (Entry entry : table.entries.values()) {
                Integer color = theme.backgroundImage && entry.seeThrough ? theme.colors.get(entry.resource) : null;
                if (color != null) colors.add((long) (color & 0x00FFFFFF | SEE_THROUGH) << 32);
            }
        }
        long[] result = new long[colors.size()];
        int i = 0;
        for (long color : colors) result[i++] = color;
        return result;
    }

    /** Parses {@code path=resource@AARRGGBB,...;path=...}, where a trailing {@code *} marks a see-through field. */
    static Table[] parse(String encoded) {
        Table[] parsed = {new Table(), new Table()};
        try {
            String[] sections = encoded.split(";", -1);
            for (int s = 0; s < sections.length && s < parsed.length; s++) {
                for (String item : sections[s].split(",")) {
                    if (item.isEmpty()) continue;
                    int equals = item.indexOf('=');
                    int at = item.indexOf('@', equals);
                    boolean seeThrough = item.endsWith("*");
                    int stock = (int) Long.parseLong(item.substring(at + 1, item.length() - (seeThrough ? 1 : 0)), 16);
                    parsed[s].put(item.substring(0, equals), new Entry(item.substring(equals + 1, at), stock, seeThrough));
                }
            }
            return parsed;
        } catch (RuntimeException e) {
            Log.w(TAG, "Compose color table unreadable", e);
            return new Table[] {new Table(), new Table()};
        }
    }

    /** A field's color resource, its stock ARGB, and whether it turns see-through behind a background image. */
    static final class Entry {
        final String resource;
        final int stock;
        final boolean seeThrough;

        Entry(String resource, int stock, boolean seeThrough) {
            this.resource = resource;
            this.stock = stock;
            this.seeThrough = seeThrough;
        }
    }

    /** Field paths such as {@code a.b.c} to their entries, and every path that leads to one. */
    static final class Table {
        final Map<String, Entry> entries = new HashMap<>();
        final Set<String> branches = new HashSet<>();

        void put(String path, Entry entry) {
            entries.put(path, entry);
            for (int dot = path.indexOf('.'); dot > 0; dot = path.indexOf('.', dot + 1)) {
                branches.add(path.substring(0, dot));
            }
        }

        /** The top-level fields that lead to a mapped color. */
        List<String> slots() {
            List<String> slots = new ArrayList<>();
            for (String branch : branches) {
                if (branch.indexOf('.') < 0) slots.add(branch);
            }
            return slots;
        }
    }

    /** The theme's value for each color resource it sets, and whether a background image shows. */
    private static final class Theme {
        final Map<String, Integer> colors;
        final boolean backgroundImage;

        Theme(Map<String, Integer> colors, boolean backgroundImage) {
            this.colors = Collections.unmodifiableMap(new HashMap<>(colors));
            this.backgroundImage = backgroundImage;
        }
    }

    /** One themed copy of an object graph; objects whose colors don't change are kept, not copied. */
    private static final class Copy {
        private final Table table;
        private final Theme theme;
        int themed;

        Copy(Table table, Theme theme) {
            this.table = table;
            this.theme = theme;
        }

        /** Rebuilds {@code node} through its only constructor, which takes its fields in name order. */
        Object of(Object node, String path) throws ReflectiveOperationException {
            List<Field> fields = instanceFields(node.getClass());
            Object[] values = new Object[fields.size()];
            Class<?>[] types = new Class<?>[fields.size()];
            boolean changed = false;
            for (int i = 0; i < values.length; i++) {
                Field field = fields.get(i);
                String at = path.isEmpty() ? field.getName() : path + "." + field.getName();
                Object stock = field.get(node);
                Object value = stock;
                if (field.getType() == long.class) {
                    long color = color((Long) stock, at);
                    if (color != (Long) stock) value = color;
                } else if (stock != null && table.branches.contains(at)) {
                    value = of(stock, at);
                }
                changed |= value != stock;
                values[i] = value;
                types[i] = field.getType();
            }
            if (!changed) return node;
            Constructor<?> constructor = node.getClass().getDeclaredConstructor(types);
            constructor.setAccessible(true);
            Object copy = constructor.newInstance(values);
            for (int i = 0; i < values.length; i++) {
                if (!Objects.equals(fields.get(i).get(copy), values[i])) {
                    throw new IllegalStateException(node.getClass().getName() + " doesn't take its fields in name order");
                }
            }
            return copy;
        }

        /** Compose keeps an sRGB color's ARGB in the high 32 bits. A stock color that moved stays. */
        private long color(long stock, String path) {
            Entry entry = table.entries.get(path);
            Integer color = entry == null ? null : theme.colors.get(entry.resource);
            if (color == null) return stock;
            if ((stock & 0xFFFFFFFFL) != 0 || (int) (stock >>> 32) != entry.stock) {
                Log.w(TAG, "Compose color " + path + " no longer follows " + entry.resource);
                return stock;
            }
            themed++;
            int argb = theme.backgroundImage && entry.seeThrough ? color & 0x00FFFFFF | SEE_THROUGH : color;
            return (long) argb << 32;
        }

        int mapped() {
            int mapped = 0;
            for (Entry entry : table.entries.values()) {
                if (theme.colors.containsKey(entry.resource)) mapped++;
            }
            return mapped;
        }

        private static List<Field> instanceFields(Class<?> type) {
            List<Field> fields = new ArrayList<>();
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                field.setAccessible(true);
                fields.add(field);
            }
            fields.sort(Comparator.comparing(Field::getName));
            return fields;
        }
    }
}
