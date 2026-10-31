package app.local.extension.curve;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.HashSet;
import java.util.Collections;
import java.util.Map;

public final class PatchSettings {
    static final String ITEM_ID = "morphe_patches";
    private static final String HIDE_FLEX = "hide_flex";
    private static final String HIDE_LAUNCHPAD = "hide_launchpad";
    private static final String REMOVE_CRINGE = "remove_cringe";
    private static final String BATCH_GBIT = "batch_gbit";
    private static volatile boolean batchGbit = true;
    private static volatile boolean removeCringe = true;
    private static Context application;
    private static final String HIDDEN_TILES = "hidden_launchpad_tiles";
    private static volatile boolean hideFlex = true;
    private static volatile boolean hideLaunchpad;
    private static volatile Set<String> hiddenTiles = Collections.emptySet();
    private static SharedPreferences preferences;

    private PatchSettings() {}

    public static void initialize(Context context) {
        application = context;
        preferences = context.getSharedPreferences("morphe_patches", Context.MODE_PRIVATE);
        removeCringe = preferences.getBoolean(REMOVE_CRINGE, true);
        batchGbit = preferences.getBoolean(BATCH_GBIT, true);
        hideFlex = preferences.getBoolean(HIDE_FLEX, true);
        hideLaunchpad = preferences.getBoolean(HIDE_LAUNCHPAD, false);
        hiddenTiles = cleanIds(preferences.getStringSet(HIDDEN_TILES, Collections.emptySet()));
    }

    public static boolean isFlexHidden() {
        return hideFlex;
    }

    public static List<?> addPatchesButton(List<?> items) {
        for (Object item : items) {
            if (isPatches(item)) return BatchLaunchpad.add(items);
        }
        try {
            Class<?> action = Class.forName("com.curve.launchpad.model.LaunchpadAction");
            Object button = Class.forName("com.curve.launchpad.model.LaunchpadItem$Button")
                .getConstructor(String.class, String.class, String.class, String.class, action)
                .newInstance("Patches", "file:///android_asset/morphe_patches.png", null,
                    ITEM_ID, action.getField("NONE").get(null));
            List<Object> result = new ArrayList<>(items);
            result.add(button);
            return BatchLaunchpad.add(result);
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Curve Launchpad contract changed", error);
        }
    }

    static boolean isPatches(Object item) {
        if (item == null || !item.getClass().getName().equals("com.curve.launchpad.model.LaunchpadItem$Button")) {
            return false;
        }
        try {
            return ITEM_ID.equals(item.getClass().getMethod("getId").invoke(item));
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Curve Launchpad contract changed", error);
        }
    }

    public static boolean openIfPatches(Object fragment, Object item) {
        if (BatchLaunchpad.open(fragment, item)) return true;
        if (!isPatches(item)) return false;
        try {
            Activity activity = (Activity) fragment.getClass().getMethod("requireActivity").invoke(fragment);
            activity.startActivity(new Intent(activity, PatchesActivity.class));
            return true;
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Curve Launchpad activity is unavailable", error);
        }
    }

    static android.content.res.Resources resources() { return application.getResources(); }

    static boolean isCringeRemoved() { return preferences != null && removeCringe; }

    static boolean isBatchEnabled() { return batchGbit; }

    static boolean isLaunchpadHidden() { return hideLaunchpad; }

    static Set<String> hiddenTiles() { return hiddenTiles; }

    private static Set<String> cleanIds(Set<String> ids) {
        Set<String> result = new HashSet<>(ids);
        result.remove(null);
        result.remove("");
        result.remove(ITEM_ID);
        return Collections.unmodifiableSet(result);
    }

    static boolean saveSettings(boolean flex, boolean launchpad, Set<String> ids, boolean cringe, boolean batch) {
        Set<String> cleaned = cleanIds(ids);
        Map<String, ?> before = preferences.getAll();
        if (!preferences.edit().putBoolean(HIDE_FLEX, flex).putBoolean(HIDE_LAUNCHPAD, launchpad)
                .putStringSet(HIDDEN_TILES, new HashSet<>(cleaned)).putBoolean(REMOVE_CRINGE, cringe)
                .putBoolean(BATCH_GBIT, batch).commit()) {
            // Android updates its memory cache even when the disk commit fails.
            SharedPreferences.Editor restore = preferences.edit();
            for (String key : new String[]{HIDE_FLEX, HIDE_LAUNCHPAD, HIDDEN_TILES, REMOVE_CRINGE, BATCH_GBIT}) {
                Object old = before.get(key);
                if (old instanceof Boolean) restore.putBoolean(key, (Boolean) old);
                else if (old instanceof Set) restore.putStringSet(key, new HashSet<>((Set<String>) old));
                else restore.remove(key);
            }
            restore.commit();
            return false;
        }
        removeCringe = cringe;
        batchGbit = batch;
        hideFlex = flex;
        hideLaunchpad = launchpad;
        hiddenTiles = cleaned;
        return true;
    }
}
