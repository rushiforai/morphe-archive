package xyz.urro.gboard;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.widget.EditText;
import android.util.Log;

/** Native preference controls backed by our stable preference file, scoped to the keys we add. */
public final class SettingsRoutes {
    private SettingsRoutes() {}
    private static String key(Object preference) throws ReflectiveOperationException { return (String) TranslationHooks.field(preference, NativeApi.preferenceKey()); }
    private static Context context(Object preference) throws ReflectiveOperationException { return (Context) TranslationHooks.field(preference, NativeApi.preferenceContext()); }
    private static String booleanKey(String key) {
        if ("urro_clipcascade_enabled".equals(key)) return "clipcascade_enabled";
        if ("urro_show_remote_clipboard".equals(key)) return "show_remote_clipboard";
        if ("urro_confirm_clipboard_send".equals(key)) return "confirm_clipboard_send";
        if ("urro_simplify_translation_input".equals(key)) return "simplify_translation_input";
        return null;
    }
    public static boolean read(Object preference, boolean fallback) {
        try {
            String key = booleanKey(key(preference));
            return key == null ? fallback : ClipboardHooks.preferences(context(preference)).getBoolean(key, fallback);
        } catch (ReflectiveOperationException exception) { log(exception); return fallback; }
    }
    public static void write(Object preference, boolean value) {
        try {
            String key = booleanKey(key(preference));
            if (key == null) return;
            SharedPreferences settings = ClipboardHooks.preferences(context(preference));
            if (!settings.contains(key) || settings.getBoolean(key, !value) != value) {
                settings.edit().putBoolean(key, value).apply();
                if (!key.equals("simplify_translation_input")) ClipboardHooks.settingsChanged();
            }
        } catch (ReflectiveOperationException exception) { log(exception); }
    }
    private static String summary(Object preference) throws ReflectiveOperationException {
        String key = key(preference);
        if ("urro_local_section_name".equals(key)) return ClipboardHooks.preferences(context(preference)).getString("local_section_name", "This device");
        if ("urro_remote_section_name".equals(key)) return ClipboardHooks.preferences(context(preference)).getString("remote_section_name", "Other devices");
        if ("urro_clipcascade_status".equals(key)) return ClipboardHooks.status();
        return null;
    }
    public static void bind(Object preference) {
        try {
            String summary = summary(preference);
            if (summary == null) return;
            // Set the model before its native bind, without notifying an adapter mid-layout.
            Class<?> type = preference.getClass();
            while (type != null && !type.getName().equals("androidx.preference.Preference")) type = type.getSuperclass();
            if (type == null) throw new NoSuchFieldException("Preference summary");
            java.lang.reflect.Field field = type.getDeclaredField(NativeApi.preferenceSummary());
            field.setAccessible(true); field.set(preference, summary);
        } catch (ReflectiveOperationException exception) { log(exception); }
    }
    private static void changed(Object preference) {
        try { TranslationHooks.call(preference, NativeApi.preferenceSummarySetter(), new Class<?>[]{CharSequence.class}, summary(preference)); }
        catch (ReflectiveOperationException exception) { log(exception); }
    }
    public static boolean open(Object preference) {
        try {
            String key = key(preference);
            Context context = context(preference);
            if ("urro_clipcascade_local_network".equals(key)) {
                context.startActivity(new android.content.Intent(context, ClipPermissionActivity.class)
                        .addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK));
                return true;
            }
            if ("urro_local_section_name".equals(key) || "urro_remote_section_name".equals(key)) {
                String setting = key.equals("urro_local_section_name") ? "local_section_name" : "remote_section_name";
                String fallback = setting.equals("local_section_name") ? "This device" : "Other devices";
                EditText input = new EditText(context); input.setSingleLine(true);
                input.setText(ClipboardHooks.preferences(context).getString(setting, fallback)); input.selectAll();
                AlertDialog dialog = new AlertDialog.Builder(context).setTitle("Section name").setView(input)
                        .setNegativeButton("Cancel", null).setPositiveButton("Save", null).create();
                dialog.setOnShowListener(value -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(button -> {
                    String name = input.getText().toString().trim();
                    if (name.isEmpty()) { input.setError("Enter a section name"); return; }
                    ClipboardHooks.preferences(context).edit().putString(setting, name).apply();
                    changed(preference); ClipboardHooks.settingsChanged(); dialog.dismiss();
                })); dialog.show(); return true;
            }
            if ("urro_clear_remote_history".equals(key)) {
                new AlertDialog.Builder(context).setTitle("Clear received history?").setMessage("This only clears clips received by ClipCascade on this device.")
                        .setNegativeButton("Cancel", null).setPositiveButton("Clear", (dialog, which) -> ClipboardHooks.clear(context)).show(); return true;
            }
            return false;
        } catch (ReflectiveOperationException | RuntimeException exception) { log(exception); return false; }
    }
    private static void log(Exception exception) { Log.e("UrroGboard", "Patch preference handler failed", exception); }
}
