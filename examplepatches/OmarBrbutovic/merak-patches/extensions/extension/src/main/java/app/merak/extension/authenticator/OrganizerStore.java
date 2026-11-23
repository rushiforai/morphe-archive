package app.merak.extension.authenticator;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Persistent organizer state: the ordered category list, which category each account
 * belongs to, and the selected layout (folders or cards).
 * <p>
 * Accounts are referenced only by an opaque hashed key (see
 * {@link AccountOrganizerPatch#accountKey(Object)}); no account secret is ever stored here.
 */
final class OrganizerStore {

    static final String MODE_CARDS = "cards";
    static final String MODE_FOLDERS = "folders";

    /** Pseudo folder ids, used only for navigation. */
    static final String FOLDER_ALL = "__all__";
    static final String FOLDER_UNCATEGORIZED = "__none__";

    static final int[] PALETTE = {
            0xFF4285F4, // Blue
            0xFF34A853, // Green
            0xFFF9AB00, // Yellow
            0xFFEA4335, // Red
            0xFFA142F4, // Purple
            0xFF12B5CB, // Teal
            0xFFFA7B17, // Orange
            0xFFE52592, // Pink
    };
    static final String[] PALETTE_NAMES = {
            "Blue", "Green", "Yellow", "Red", "Purple", "Teal", "Orange", "Pink"
    };

    static int paletteIndex(int color) {
        return ((color % PALETTE.length) + PALETTE.length) % PALETTE.length;
    }

    static final class Category {
        final String id;
        String name;
        int color;
        /** One of {@link CategoryIcons#IDS}, or empty for no icon. */
        String icon = CategoryIcons.NONE;

        Category(String id, String name, int color) {
            this.id = id;
            this.name = name;
            this.color = color;
        }

        int colorValue() {
            return PALETTE[paletteIndex(color)];
        }
    }

    private static final String PREFS_NAME = "morphe_account_organizer";
    private static final String KEY_MODE = "mode";
    private static final String KEY_CATEGORIES = "categories";
    private static final String KEY_ASSIGNMENTS = "assignments";
    private static final String KEY_NEXT_ID = "next_id";
    private static final String KEY_FOLDER_ORDER = "folder_order";

    private final SharedPreferences prefs;

    final List<Category> categories = new ArrayList<>();
    /** Account key -> category id. */
    private final Map<String, String> assignments = new HashMap<>();
    private String mode = MODE_CARDS;
    private int nextId = 1;
    /** Saved folder grid order, including the pseudo folders. Sanitized by {@link #folderOrder()}. */
    private final List<String> savedFolderOrder = new ArrayList<>();

    OrganizerStore(Context context) {
        prefs = context.getApplicationContext().getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        load();
    }

    private void load() {
        mode = MODE_FOLDERS.equals(prefs.getString(KEY_MODE, MODE_CARDS)) ? MODE_FOLDERS : MODE_CARDS;
        nextId = Math.max(1, prefs.getInt(KEY_NEXT_ID, 1));

        categories.clear();
        try {
            JSONArray array = new JSONArray(prefs.getString(KEY_CATEGORIES, "[]"));
            for (int i = 0; i < array.length(); i++) {
                JSONObject object = array.getJSONObject(i);
                String id = object.optString("id", "");
                String name = object.optString("name", "").trim();
                if (id.isEmpty() || name.isEmpty() || find(id) != null) continue;
                Category category = new Category(id, name, object.optInt("color", i));
                String icon = object.optString("icon", CategoryIcons.NONE);
                category.icon = CategoryIcons.isValid(icon) ? icon : CategoryIcons.NONE;
                categories.add(category);
            }
        } catch (Exception ex) {
            AccountOrganizerPatch.logError("Could not read categories", ex);
        }

        savedFolderOrder.clear();
        try {
            JSONArray array = new JSONArray(prefs.getString(KEY_FOLDER_ORDER, "[]"));
            for (int i = 0; i < array.length(); i++) savedFolderOrder.add(array.optString(i));
        } catch (Exception ex) {
            AccountOrganizerPatch.logError("Could not read folder order", ex);
        }

        assignments.clear();
        try {
            JSONObject object = new JSONObject(prefs.getString(KEY_ASSIGNMENTS, "{}"));
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                String categoryId = object.optString(key, "");
                if (find(categoryId) != null) assignments.put(key, categoryId);
            }
        } catch (Exception ex) {
            AccountOrganizerPatch.logError("Could not read assignments", ex);
        }
    }

    private void save() {
        try {
            JSONArray array = new JSONArray();
            for (Category category : categories) {
                array.put(new JSONObject()
                        .put("id", category.id)
                        .put("name", category.name)
                        .put("color", category.color)
                        .put("icon", category.icon));
            }
            JSONObject assignmentObject = new JSONObject();
            for (Map.Entry<String, String> entry : assignments.entrySet()) {
                assignmentObject.put(entry.getKey(), entry.getValue());
            }
            JSONArray folderOrderArray = new JSONArray();
            for (String id : savedFolderOrder) folderOrderArray.put(id);
            prefs.edit()
                    .putString(KEY_FOLDER_ORDER, folderOrderArray.toString())
                    .putString(KEY_MODE, mode)
                    .putInt(KEY_NEXT_ID, nextId)
                    .putString(KEY_CATEGORIES, array.toString())
                    .putString(KEY_ASSIGNMENTS, assignmentObject.toString())
                    .apply();
        } catch (Exception ex) {
            AccountOrganizerPatch.logError("Could not save organizer state", ex);
        }
    }

    // region Mode

    boolean isFolderMode() {
        return MODE_FOLDERS.equals(mode);
    }

    void setFolderMode(boolean folders) {
        mode = folders ? MODE_FOLDERS : MODE_CARDS;
        save();
    }

    // endregion

    // region Categories

    Category find(String id) {
        if (id == null) return null;
        for (Category category : categories) {
            if (category.id.equals(id)) return category;
        }
        return null;
    }

    int indexOf(String id) {
        for (int i = 0, size = categories.size(); i < size; i++) {
            if (categories.get(i).id.equals(id)) return i;
        }
        return -1;
    }

    Category add(String name) {
        // Pick the first palette color not in use, so new categories are visually distinct.
        int color = categories.size();
        for (int candidate = 0; candidate < PALETTE.length; candidate++) {
            boolean used = false;
            for (Category category : categories) {
                if (paletteIndex(category.color) == candidate) {
                    used = true;
                    break;
                }
            }
            if (!used) {
                color = candidate;
                break;
            }
        }
        Category category = new Category("c" + nextId++, name.trim(), color);
        categories.add(category);
        save();
        return category;
    }

    void rename(Category category, String name) {
        category.name = name.trim();
        save();
    }

    void setColor(Category category, int colorIndex) {
        category.color = colorIndex;
        save();
    }

    void setIcon(Category category, String icon) {
        category.icon = CategoryIcons.isValid(icon) ? icon : CategoryIcons.NONE;
        save();
    }

    void move(Category category, int delta) {
        int from = categories.indexOf(category);
        int to = from + delta;
        if (from < 0 || to < 0 || to >= categories.size()) return;
        categories.remove(from);
        categories.add(to, category);
        save();
    }

    void delete(Category category) {
        categories.remove(category);
        Iterator<String> iterator = assignments.values().iterator();
        while (iterator.hasNext()) {
            if (iterator.next().equals(category.id)) iterator.remove();
        }
        save();
    }

    // endregion

    // region Folder order

    /**
     * Order of the folder grid: all categories plus the "All accounts" and "Uncategorized"
     * pseudo folders. Categories always keep their relative order from {@link #categories},
     * which is also the order of the cards layout.
     */
    List<String> folderOrder() {
        List<String> result = new ArrayList<>();
        for (String id : savedFolderOrder) {
            boolean valid = FOLDER_ALL.equals(id) || FOLDER_UNCATEGORIZED.equals(id) || find(id) != null;
            if (valid && !result.contains(id)) result.add(id);
        }
        if (!result.contains(FOLDER_ALL)) result.add(0, FOLDER_ALL);
        for (Category category : categories) {
            if (result.contains(category.id)) continue;
            // New categories go before "Uncategorized" when that is last.
            int uncategorized = result.indexOf(FOLDER_UNCATEGORIZED);
            if (uncategorized >= 0 && uncategorized == result.size() - 1) {
                result.add(uncategorized, category.id);
            } else {
                result.add(category.id);
            }
        }
        if (!result.contains(FOLDER_UNCATEGORIZED)) result.add(FOLDER_UNCATEGORIZED);

        // Fill the category slots in category order.
        int next = 0;
        for (int i = 0; i < result.size(); i++) {
            String id = result.get(i);
            if (!FOLDER_ALL.equals(id) && !FOLDER_UNCATEGORIZED.equals(id)) {
                result.set(i, categories.get(next++).id);
            }
        }
        return result;
    }

    /**
     * Applies a new order of the folders that are currently shown. Folders that are not shown
     * (for example an empty "Uncategorized") keep their position.
     */
    void reorderFolders(List<String> shownInNewOrder) {
        List<String> full = folderOrder();
        List<Integer> slots = new ArrayList<>();
        for (int i = 0; i < full.size(); i++) {
            if (shownInNewOrder.contains(full.get(i))) slots.add(i);
        }
        if (slots.size() != shownInNewOrder.size()) return; // Out of date, ignore.
        for (int i = 0; i < slots.size(); i++) full.set(slots.get(i), shownInNewOrder.get(i));

        List<Category> reordered = new ArrayList<>();
        for (String id : full) {
            Category category = find(id);
            if (category != null) reordered.add(category);
        }
        categories.clear();
        categories.addAll(reordered);

        savedFolderOrder.clear();
        savedFolderOrder.addAll(full);
        save();
    }

    // endregion

    // region Assignments

    /** @return The category id of the account, or null if it is uncategorized. */
    String categoryOf(String accountKey) {
        String id = assignments.get(accountKey);
        return find(id) != null ? id : null;
    }

    void assign(String accountKey, String categoryId) {
        if (categoryId == null || find(categoryId) == null) {
            assignments.remove(accountKey);
        } else {
            assignments.put(accountKey, categoryId);
        }
        save();
    }

    // endregion
}
