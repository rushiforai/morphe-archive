/*
 * Copyright 2026 pixkk
 */
package app.pixkk.extension.comment;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.pixkk.extension.core.L10n;
import app.pixkk.extension.core.Logger;
import app.pixkk.extension.core.Settings;

/**
 * Lets you drop rows from the menu a long press on a comment opens.
 *
 * <p>The panel hands its finished rows to one place, which the patch routes through
 * {@link #items}. Nothing about the rows is fixed in code: each row carries a key and a label as
 * two strings, so every row that passes through is written to a catalog (key and label, as
 * TikTok spelled them) which the settings checklist offers, and a row whose key was ticked there
 * is left out. The key is TikTok's own, so a pick survives a change of language.
 *
 * <p>A row is a card's last or first one when its style says so, and the card's rounded corners
 * are then given to the neighbour that stays, or the card would end in a square edge.
 */
public final class CommentMenuRows {
    /** The style's corner flags, as the Block row's patch finds them: round the bottom. */
    private static final int BOTTOM = 0x10;
    /** And round the top. */
    private static final int TOP = 0x1;
    /** The kinds of the menu's other blocks, as their class's int says. */
    private static final int BLOCK_SEND = 1;
    private static final int BLOCK_SHARE = 2;
    private static final int BLOCK_DIVIDER = 3;
    private static final int MAX_ROWS = 60;

    /** Styles whose corners were changed here and what they were, put back before every pass. */
    private static final Map<Object, Integer> CHANGED = new WeakHashMap<>();

    private CommentMenuRows() {
    }

    /** One row's key and label, read from its two string fields. */
    private static final class Row {
        final String key;
        final String label;

        Row(String key, String label) {
            this.key = key;
            this.label = label;
        }
    }

    public static List<?> items(Object panel, List<?> items) {
        if (items == null) return null;
        try {
            restoreCorners();
            List<Object> kept = new ArrayList<>(items.size());
            Set<String> hidden = hiddenKeys();
            boolean dropped = false;
            for (Object item : items) {
                Row row = read(item);
                if (row == null) {
                    int block = blockOf(item);
                    if (block == BLOCK_SEND || block == BLOCK_SHARE) {
                        row = new Row(blockKey(block), blockLabel(block));
                    }
                }
                if (row != null) observe(row);
                if (row != null && hidden.contains(row.key)) {
                    dropped = true;
                    continue;
                }
                kept.add(item);
            }
            if (!dropped) return items;
            dropDividers(kept);
            padTop(kept, items);
            roundCards(kept);
            return kept;
        } catch (Throwable failure) {
            Logger.printException(() -> "Could not filter the comment menu", failure);
            return items;
        }
    }

    /**
     * The menu's blocks that aren't an action row are one small class holding a single int, the
     * kind of block: the Send to friends strip, the Share to apps row, or a divider. They carry
     * no text, so the checklist names the two a reader can drop.
     */
    private static int blockOf(Object item) {
        if (item == null) return -1;
        Field kind = null;
        try {
            for (Field field : fields(item.getClass())) {
                if (field.getType() == String.class) return -1;
                if (field.getType() != int.class) continue;
                if (kind != null) return -1;
                kind = field;
            }
            return kind == null ? -1 : kind.getInt(item);
        } catch (IllegalAccessException ignored) {
            return -1;
        }
    }

    private static String blockKey(int block) {
        return block == BLOCK_SEND ? "block_send" : "block_share";
    }

    private static String blockLabel(int block) {
        return L10n.t(block == BLOCK_SEND
                ? "Send to friends (the strip at the top)"
                : "Share to apps (with Copy video ID)");
    }

    /** The key and label of a row, or null for something that isn't a labelled action. */
    private static Row read(Object item) {
        if (item == null) return null;
        List<String> strings = new ArrayList<>(2);
        try {
            for (Field field : fields(item.getClass())) {
                if (field.getType() != String.class) continue;
                Object value = field.get(item);
                if (value instanceof String) strings.add((String) value);
            }
        } catch (IllegalAccessException ignored) {
            return null;
        }
        // The constructor is (key, icon, label, ...): the key first, the label next.
        if (strings.size() != 2) return null;
        String key = strings.get(0).trim();
        String label = strings.get(1).trim();
        if (isKey(key) || !isKey(label)) return new Row(key, label);
        return new Row(label, key);
    }

    /** A key is TikTok's own id: lower case, no spaces. A label is the text a person reads. */
    private static boolean isKey(String value) {
        return !value.isEmpty() && value.matches("[a-z0-9_.:-]+");
    }

    // ---- the catalog and the ticks ---------------------------------------------------

    private static synchronized void observe(Row row) {
        if (row.key.isEmpty() || row.key.contains("\n") || row.label.contains("\n")) return;
        LinkedHashMap<String, String> catalog = catalog();
        if (row.label.equals(catalog.get(row.key))) return;
        if (!catalog.containsKey(row.key) && catalog.size() >= MAX_ROWS) return;
        catalog.put(row.key, row.label);
        StringBuilder out = new StringBuilder();
        for (Map.Entry<String, String> entry : catalog.entrySet()) {
            if (out.length() > 0) out.append('\n');
            out.append(entry.getKey()).append('\t').append(entry.getValue());
        }
        Settings.COMMENT_MENU_ROW_CATALOG.save(out.toString());
    }

    /** Every row the menu has shown on this phone: key to label, oldest first. */
    public static synchronized LinkedHashMap<String, String> catalog() {
        LinkedHashMap<String, String> result = new LinkedHashMap<>();
        String stored = Settings.COMMENT_MENU_ROW_CATALOG.get();
        if (stored == null || stored.trim().isEmpty()) return result;
        for (String line : stored.split("\n")) {
            int tab = line.indexOf('\t');
            if (tab <= 0) continue;
            result.put(line.substring(0, tab), line.substring(tab + 1));
        }
        return result;
    }

    public static Set<String> hiddenKeys() {
        Set<String> keys = new HashSet<>();
        String stored = Settings.COMMENT_MENU_HIDDEN_ROWS.get();
        if (stored == null) return keys;
        for (String token : stored.split("[,\\n]")) {
            String key = token.trim();
            if (!key.isEmpty()) keys.add(key);
        }
        return keys;
    }

    // ---- corners ----------------------------------------------------------------------

    /**
     * Cards are set apart by dividers, so a card that lost all its rows leaves two dividers in a
     * row, and a menu that now starts with a card's neighbour starts with a divider. One divider
     * stays between two cards and none leads the menu.
     */
    private static void dropDividers(List<Object> items) {
        boolean previousDivider = true;
        for (int i = 0; i < items.size(); i++) {
            boolean divider = blockOf(items.get(i)) == BLOCK_DIVIDER;
            if (divider && previousDivider) {
                items.remove(i--);
                continue;
            }
            previousDivider = divider;
        }
    }

    /**
     * The Send strip carries the gap above the first card. When it is gone and a card now leads the
     * menu, that card would touch the sheet's edge, so one of the menu's own dividers goes first.
     */
    private static void padTop(List<Object> kept, List<?> original) {
        if (kept.isEmpty() || read(kept.get(0)) == null) return;
        for (Object item : original) {
            if (blockOf(item) == BLOCK_DIVIDER) {
                kept.add(0, item);
                return;
            }
        }
    }

    /**
     * A card is a run of rows between two other blocks: its first row rounds the top and its last
     * the bottom. A card that lost its first or last row hands those corners to the row that is
     * now first or last. A row's style is kept between menus, so the change is undone on the next
     * pass.
     */
    private static void roundCards(List<Object> items) throws IllegalAccessException {
        int start = -1;
        for (int i = 0; i <= items.size(); i++) {
            boolean row = i < items.size() && read(items.get(i)) != null;
            if (row && start < 0) start = i;
            if (!row && start >= 0) {
                addCorners(items.get(start), TOP);
                addCorners(items.get(i - 1), BOTTOM);
                start = -1;
            }
        }
    }

    private static void addCorners(Object row, int flags) throws IllegalAccessException {
        Object style = styleOf(row);
        Field corners = style == null ? null : cornersOf(style);
        if (corners == null) return;
        int current = corners.getInt(style);
        if ((current & flags) == flags) return;
        synchronized (CHANGED) {
            if (!CHANGED.containsKey(style)) CHANGED.put(style, current);
        }
        corners.setInt(style, current | flags);
    }

    private static void restoreCorners() {
        synchronized (CHANGED) {
            for (Map.Entry<Object, Integer> entry : CHANGED.entrySet()) {
                Object style = entry.getKey();
                Field corners = style == null ? null : cornersOf(style);
                if (corners == null) continue;
                try {
                    corners.setInt(style, entry.getValue());
                } catch (IllegalAccessException ignored) {
                    // The field was made accessible when it was found.
                }
            }
            CHANGED.clear();
        }
    }

    /** The row's style: its one field whose type holds a single int of corner flags. */
    private static Object styleOf(Object row) {
        if (row == null) return null;
        try {
            for (Field field : fields(row.getClass())) {
                Class<?> type = field.getType();
                if (type.isPrimitive() || type == String.class || type == Integer.class
                        || type.isInterface() || type.getName().startsWith("java.")) continue;
                Object value = field.get(row);
                if (value != null && cornersOf(value) != null) return value;
            }
        } catch (IllegalAccessException ignored) {
            // Not readable, so not a style we can fix.
        }
        return null;
    }

    private static Field cornersOf(Object style) {
        Field found = null;
        for (Field field : fields(style.getClass())) {
            if (field.getType() != int.class) continue;
            if (found != null) return null;
            found = field;
        }
        return found;
    }

    private static List<Field> fields(Class<?> type) {
        List<Field> out = new ArrayList<>();
        for (Class<?> at = type; at != null && at != Object.class; at = at.getSuperclass()) {
            for (Field field : at.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                try {
                    field.setAccessible(true);
                    out.add(field);
                } catch (RuntimeException ignored) {
                    // A field the runtime won't open is one we don't need.
                }
            }
        }
        return out;
    }
}
