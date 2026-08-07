package dev.alastorkaneki.morphe.extension.operagx.icons;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Registry and component switcher for the independent Opera GX icon-pack patch. */
public final class GxIconPackRegistry {
    public static final String ACTION_OPEN = "dev.alastorkaneki.morphe.OPEN_GX_ICON_PACK";
    public static final String DEFAULT_ALIAS = "GxIconAlias_default";
    private static final String ALIAS_PACKAGE =
            "dev.alastorkaneki.morphe.extension.operagx.icons.";
    private static final String PREFS = "gx_icon_pack_preferences";
    private static final String KEY_SELECTED = "selected_alias";
    private static volatile List<Entry> cachedEntries;

    public static final class Entry {
        public final String name;
        public final String resourceName;
        public final String group;
        public final String alias;

        Entry(String name, String resourceName, String group) {
            this.name = name;
            this.resourceName = resourceName;
            this.group = group;
            this.alias = "GxIconAlias_" + resourceName.substring("gxip_".length());
        }
    }

    private GxIconPackRegistry() { }

    public static List<Entry> entries(Context context) {
        List<Entry> current = cachedEntries;
        if (current != null) return current;
        synchronized (GxIconPackRegistry.class) {
            current = cachedEntries;
            if (current != null) return current;
            ArrayList<Entry> parsed = new ArrayList<>();
            int id = context.getResources().getIdentifier(
                    "gx_icon_pack_index", "raw", context.getPackageName());
            if (id == 0) return Collections.emptyList();
            try (InputStream input = context.getResources().openRawResource(id);
                 BufferedReader reader = new BufferedReader(new InputStreamReader(input))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split("\\|", 3);
                    if (parts.length == 3 && parts[1].startsWith("gxip_")) {
                        parsed.add(new Entry(parts[0], parts[1], parts[2]));
                    }
                }
            } catch (Throwable ignored) {
                return Collections.emptyList();
            }
            current = Collections.unmodifiableList(parsed);
            cachedEntries = current;
            return current;
        }
    }

    public static String selectedAlias(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getString(KEY_SELECTED, DEFAULT_ALIAS);
    }

    public static void applySelection(Context context, String selectedAlias) {
        if (!DEFAULT_ALIAS.equals(selectedAlias)) {
            boolean known = false;
            for (Entry entry : entries(context)) {
                if (entry.alias.equals(selectedAlias)) {
                    known = true;
                    break;
                }
            }
            if (!known) throw new IllegalArgumentException("Unknown GX icon alias");
        }

        PackageManager manager = context.getPackageManager();
        String packageName = context.getPackageName();
        manager.setComponentEnabledSetting(
                component(packageName, selectedAlias),
                PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                PackageManager.DONT_KILL_APP);

        disableUnlessSelected(manager, packageName, DEFAULT_ALIAS, selectedAlias);
        for (Entry entry : entries(context)) {
            disableUnlessSelected(manager, packageName, entry.alias, selectedAlias);
        }
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .edit().putString(KEY_SELECTED, selectedAlias).apply();
    }

    private static void disableUnlessSelected(
            PackageManager manager, String packageName, String candidate, String selected) {
        if (candidate.equals(selected)) return;
        manager.setComponentEnabledSetting(
                component(packageName, candidate),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);
    }

    private static ComponentName component(String packageName, String alias) {
        return new ComponentName(packageName, ALIAS_PACKAGE + alias);
    }
}
