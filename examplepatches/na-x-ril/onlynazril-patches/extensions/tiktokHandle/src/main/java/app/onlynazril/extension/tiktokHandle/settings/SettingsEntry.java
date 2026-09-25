package app.onlynazril.extension.tiktokHandle.settings;

import android.content.Context;

/**
 * Values the Settings row needs at runtime.
 *
 * The row's icon is a resource id read while TikTok builds the cell state, so the patch calls in
 * here rather than baking an id into bytecode.
 *
 * The glyph is resolved by name on the device instead of being pinned to a resource id: TikTok's
 * own {@code cog} is a vector drawn for their icon slot, so it fills the row the way their own
 * icons do. A framework bitmap like {@code ic_menu_preferences} is padded inside its bounds and
 * comes out looking small. Falls back to the framework drawable when the name is gone.
 */
public final class SettingsEntry {
    private static final String[] GEAR_NAMES = {"cog", "ic_cog", "gear", "ic_gear"};

    private static int resolved;

    private SettingsEntry() {}

    public static int iconResourceId() {
        if (resolved != 0) return resolved;
        Context context = HandleSettings.appContext();
        if (context != null) {
            for (String name : GEAR_NAMES) {
                int id = context.getResources().getIdentifier(name, "drawable", context.getPackageName());
                if (id != 0) {
                    resolved = id;
                    return id;
                }
            }
        }
        return android.R.drawable.ic_menu_preferences;
    }
}
