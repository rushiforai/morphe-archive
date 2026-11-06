package app.morphe.extension.playbooks.settings;

import static app.morphe.extension.playbooks.shared.Text.t;

import android.content.Context;
import android.content.Intent;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.morphe.extension.playbooks.fonts.FontSettingsActivity;
import app.morphe.extension.playbooks.fonts.FontStore;
import app.morphe.extension.playbooks.fonts.FontVariant;

/**
 * Adds a "Custom font" row to Play Books' settings (Settings > Ebook reading).
 *
 * <p>The settings screen is a static tree of nodes ({@code CategoryNode} / {@code ItemNode}, keyed by an
 * enum of item ids) plus a map from item id to item. A node with an unused id is appended to the
 * reading category, and that id is mapped to a second instance of the "About Google Play Books" row.
 * The patched row asks this class for its title, subtitle and click action.
 *
 * <p>Every screen gets its own copy of the map from Dagger, and looks items up with a call that throws
 * for missing ids. So every class that reads the map passes it through {@link #registerFontItem(Map)}.
 */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class SettingsHook {
    private static final String TAG = "BooksPiko";
    private static final String READING_CATEGORY = "READING_CATEGORY";
    private static final String ABOUT_ITEM = "ABOUT_PLAY_BOOKS";
    private static final String ITEM_NODE = "com.google.android.apps.play.books.settings.common.ItemNode";

    /** Rows created here. Weak, so rows of a closed settings screen can be collected. */
    private static final Set<Object> FONT_ROWS = Collections.newSetFromMap(new WeakHashMap<Object, Boolean>());

    private static Enum<?> fontKey;
    private static volatile Context appContext;

    private SettingsHook() {
    }

    /** Root of the static settings tree. Replaced by the patch with a read of the tree field. */
    static Object treeRoot() {
        return null;
    }

    /** Injected at the start of the constructors of every class that reads the settings item map. */
    public static Map registerFontItem(Map items) {
        try {
            Object treeRoot = treeRoot();
            if (treeRoot == null || items == null || items.isEmpty()) return items;
            if (fontKey != null && FONT_ROWS.contains(items.get(fontKey))) return items;

            Enum<?> anyKey = (Enum<?>) items.keySet().iterator().next();
            Enum<?>[] keys = anyKey.getDeclaringClass().getEnumConstants();
            Enum<?> aboutKey = byName(keys, ABOUT_ITEM);
            Enum<?> readingKey = byName(keys, READING_CATEGORY);
            Object aboutRow = aboutKey == null ? null : items.get(aboutKey);
            Object reading = readingKey == null ? null : findNode(treeRoot, readingKey);
            if (aboutRow == null || reading == null) {
                Log.w(TAG, "Settings layout not recognized, custom font row not added");
                return items;
            }

            synchronized (SettingsHook.class) {
                if (fontKey == null) {
                    Set<Object> used = new HashSet<Object>(items.keySet());
                    collectKeys(treeRoot, used);
                    for (Enum<?> key : keys) {
                        if (!used.contains(key)) {
                            fontKey = key;
                            break;
                        }
                    }
                    if (fontKey == null) {
                        Log.w(TAG, "No free settings id, custom font row not added");
                        return items;
                    }
                }
                addChild(reading, fontKey);
            }

            Object fontRow = copyRow(aboutRow);
            FONT_ROWS.add(fontRow);
            Map result = new LinkedHashMap(items);
            result.put(fontKey, fontRow);
            Log.i(TAG, "Custom font row added to settings as " + fontKey.name());
            return result;
        } catch (Throwable throwable) {
            Log.e(TAG, "Could not add the custom font row to settings", throwable);
            return items;
        }
    }

    public static String title(Object row, String original) {
        if (!FONT_ROWS.contains(row)) return original;
        return t("사용자 글꼴", "Custom font");
    }

    public static String subtitle(Object row, String original) {
        if (!FONT_ROWS.contains(row)) return original;
        try {
            Context context = appContext;
            if (context != null) {
                FontStore store = FontStore.get(context);
                String name = store.displayName(FontVariant.REGULAR);
                if (name == null) return t("선택된 글꼴 없음 · 탭해서 TTF/OTF 선택", "No font picked · Tap to pick a TTF/OTF");
                return store.isEnabled() ? name : name + t(" (사용 안 함)", " (off)");
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Font subtitle failed", throwable);
        }
        return t("책 본문 글꼴 바꾸기", "Change the font of book text");
    }

    /** @return true if the click was handled. */
    public static boolean onClick(Object row) {
        if (!FONT_ROWS.contains(row)) return false;
        try {
            Context context = appContext;
            if (context == null) return false;
            Intent intent = new Intent(context, FontSettingsActivity.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Throwable throwable) {
            Log.e(TAG, "Could not open the font settings", throwable);
        }
        return true;
    }

    // region Reflection helpers

    private static Enum<?> byName(Enum<?>[] keys, String name) {
        for (Enum<?> key : keys) {
            if (key.name().equals(name)) return key;
        }
        return null;
    }

    /** The node's id (an enum) and children (a List), found by field type. */
    private static Enum<?> keyOf(Object node) throws IllegalAccessException {
        for (Class<?> type = node.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || !field.getType().isEnum()) continue;
                field.setAccessible(true);
                return (Enum<?>) field.get(node);
            }
        }
        return null;
    }

    private static Field childrenField(Object node) {
        for (Class<?> type = node.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || !List.class.isAssignableFrom(field.getType())) continue;
                field.setAccessible(true);
                return field;
            }
        }
        return null;
    }

    private static Object findNode(Object node, Enum<?> key) throws IllegalAccessException {
        if (key.equals(keyOf(node))) return node;
        Field children = childrenField(node);
        if (children == null) return null;
        List<?> list = (List<?>) children.get(node);
        if (list == null) return null;
        for (Object child : list) {
            Object found = findNode(child, key);
            if (found != null) return found;
        }
        return null;
    }

    private static void collectKeys(Object node, Set<Object> keys) throws IllegalAccessException {
        Enum<?> key = keyOf(node);
        if (key != null) keys.add(key);
        Field children = childrenField(node);
        if (children == null) return;
        List<?> list = (List<?>) children.get(node);
        if (list == null) return;
        for (Object child : list) collectKeys(child, keys);
    }

    private static void addChild(Object category, Enum<?> key) throws Exception {
        Field children = childrenField(category);
        List<?> list = (List<?>) children.get(category);
        for (Object child : list) {
            if (key.equals(keyOf(child))) return;
        }
        Class<?> itemNode = Class.forName(ITEM_NODE, true, category.getClass().getClassLoader());
        Constructor<?> constructor = itemNode.getDeclaredConstructor(key.getDeclaringClass());
        constructor.setAccessible(true);
        List<Object> extended = new ArrayList<Object>(list);
        extended.add(constructor.newInstance(key));
        children.set(category, Collections.unmodifiableList(extended));
    }

    /** New instance of the row's class, built from the same Context. */
    private static Object copyRow(Object row) throws Exception {
        Context context = null;
        for (Field field : row.getClass().getDeclaredFields()) {
            if (Context.class.isAssignableFrom(field.getType())) {
                field.setAccessible(true);
                context = (Context) field.get(row);
                break;
            }
        }
        if (context == null) throw new IllegalStateException("No Context in " + row.getClass());
        appContext = context.getApplicationContext() != null ? context.getApplicationContext() : context;

        Constructor<?> constructor = row.getClass().getDeclaredConstructor(Context.class);
        constructor.setAccessible(true);
        return constructor.newInstance(context);
    }

    // endregion
}
