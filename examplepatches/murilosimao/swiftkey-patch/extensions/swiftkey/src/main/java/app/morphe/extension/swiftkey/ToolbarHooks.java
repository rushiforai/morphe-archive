package app.morphe.extension.swiftkey;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.Intent;
import android.os.UserManager;
import android.view.View;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public final class ToolbarHooks {
    static final String PREFS = "swiftkey_clean_toolbar";
    private static WeakReference<View> currentToolbar = new WeakReference<>(null);
    private ToolbarHooks() {}

    static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /** Replaces the native six-slot customiser entry without changing the other menu buttons. */
    public static void bindEditor(View entry, View.OnClickListener originalListener) {
        entry.setOnClickListener(clicked -> {
            Context context = clicked.getContext();
            Intent intent = new Intent(context, ToolbarSettingsActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
            context.startActivity(intent);
        });
    }

    public static ArrayList<Object> select(List<?> dynamic, List<?> fixed, List<?> overflow, View toolbar) {
        ArrayList<Object> original = new ArrayList<>(dynamic);
        original.addAll(fixed);
        UserManager userManager = (UserManager) toolbar.getContext().getSystemService(Context.USER_SERVICE);
        if (userManager != null && !userManager.isUserUnlocked()) return original;
        currentToolbar = new WeakReference<>(toolbar);
        LinkedHashMap<Integer, Object> available = new LinkedHashMap<>();
        for (List<?> source : new List<?>[]{dynamic, fixed, overflow}) {
            for (Object item : source) available.putIfAbsent(ToolbarBridge.itemId(item), item);
        }
        SharedPreferences preferences = prefs(toolbar.getContext());
        remember(preferences, available, dynamic);
        if (!preferences.getBoolean("enabled", false)) return original;
        int width = toolbar.getWidth();
        if (width <= 0) width = toolbar.getResources().getDisplayMetrics().widthPixels;
        float density = toolbar.getResources().getDisplayMetrics().density;
        int capacity = Math.max(2, (int) (width / (48f * density)));
        ArrayList<Object> selected = ToolbarSelection.choose(available,
            ToolbarSelection.parse(preferences.getString("order", "")), capacity);
        // The host's ConstraintSet chain rejects fewer than two views.
        return selected.size() < 2 ? original : selected;
    }

    private static void remember(SharedPreferences preferences, LinkedHashMap<Integer, Object> available,
                                 List<?> dynamic) {
        try {
            // Keep descriptors, never host item objects, keyboard context or typed text.
            LinkedHashMap<Integer, JSONObject> descriptors = new LinkedHashMap<>();
            JSONArray old = new JSONArray(preferences.getString("catalog", "[]"));
            for (int i = 0; i < old.length(); i++) {
                JSONObject item = old.getJSONObject(i);
                descriptors.put(item.getInt("id"), item);
            }
            for (int id : available.keySet()) {
                if (id == ToolbarSelection.MORE) continue;
                Object item = available.get(id);
                String label = ToolbarBridge.caption(item);
                if (label == null || label.isEmpty()) continue;
                descriptors.put(id, new JSONObject().put("id", id).put("label", label)
                    .put("icon", ToolbarBridge.icon(item)));
            }
            JSONArray catalog = new JSONArray();
            for (JSONObject descriptor : descriptors.values()) catalog.put(descriptor);
            String encoded = catalog.toString();
            SharedPreferences.Editor editor = preferences.edit();
            boolean changed = !encoded.equals(preferences.getString("catalog", "[]"));
            if (changed) editor.putString("catalog", encoded);
            if (!preferences.contains("order")) {
                List<Integer> ids = new ArrayList<>();
                for (Object item : dynamic) ids.add(ToolbarBridge.itemId(item));
                editor.putString("order", ToolbarSelection.encode(ids));
                changed = true;
            }
            if (changed) editor.apply();
        } catch (org.json.JSONException ignored) {
            preferences.edit().remove("catalog").apply();
        }
    }

    static void refresh() {
        View toolbar = currentToolbar.get();
        if (toolbar != null && toolbar.isAttachedToWindow()) toolbar.post(() -> ToolbarBridge.refresh(toolbar));
    }
}
