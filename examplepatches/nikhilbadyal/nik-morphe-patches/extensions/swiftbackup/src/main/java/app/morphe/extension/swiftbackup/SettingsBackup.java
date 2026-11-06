package app.morphe.extension.swiftbackup;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;
import org.json.JSONObject;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.List;

/** Opt-in native settings snapshots; all cloud I/O is delegated to LocalDb's serialized transport. */
public final class SettingsBackup {
    private static final String TAG = "MorpheSettingsBackup";
    private static final String MODEL = "org.swiftapps.swiftbackup.settings.SwiftBackupSettingsHelper$SettingsData";
    private static final String KEY = "morphe_cloud_settings_backup";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    // Pause capture only while inspecting a restore candidate; cancellation must preserve the user's saved opt-in.
    private static volatile boolean restorePending;

    private SettingsBackup() {}

    /** Use an independent preference file so native settings exports do not include backup-control bookkeeping. */
    private static SharedPreferences preferences() throws Exception {
        Context context = (Context) Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication").invoke(null);
        return context.getSharedPreferences("morphe_settings_backup", Context.MODE_PRIVATE);
    }

    /** Capture the same model and Gson configuration as the app's bt7 export coroutine, off the main thread. */
    private static String capture() throws Exception {
        Object model = Class.forName(MODEL).getConstructor().newInstance();
        Object gson = Class.forName("w14").getMethod("d").invoke(null);
        String json = (String) gson.getClass().getMethod("i", Object.class).invoke(gson, model);
        validateSettings(new JSONObject(json));
        return json;
    }

    /** Reject partial/malformed snapshots before replacing a known-good backup or invoking the native importer. */
    static void validateSettings(JSONObject settings) throws Exception {
        settings.getJSONObject("settings");
        for (String key : new String[]{"favorites", "blacklist"}) {
            if (settings.has(key) && !settings.isNull(key)) settings.getJSONObject(key);
        }
    }

    /** Read the cloud envelope strictly; metadata from another feature must never be imported as app settings. */
    private static JSONObject decode(String raw) throws Exception {
        if (raw == null) throw new IllegalStateException("No saved settings backup was found in this cloud");
        JSONObject backup = new JSONObject(raw);
        if (backup.getInt("version") != 1 || backup.getLong("updatedAt") <= 0) {
            throw new IllegalStateException("Unsupported settings backup");
        }
        JSONObject settings = backup.getJSONObject("settings");
        validateSettings(settings);
        return settings;
    }

    /** Detect changes at each normal cloud tick, including blacklist/favorite edits that bypass Firebase. */
    public static void tick() throws Exception {
        if (!restorePending && preferences().getBoolean("enabled", false)) backup(false);
    }

    /** Only mark a snapshot captured after its journal commit; failed uploads remain pending for the next tick. */
    private static void backup(boolean force) throws Exception {
        String json = capture();
        SharedPreferences prefs = preferences();
        if (force || !json.equals(prefs.getString("lastSnapshot", null))) {
            LocalDb.storeSettingsBackup(json);
            if (!prefs.edit().putString("lastSnapshot", json).commit()) {
                throw new IllegalStateException("Could not save settings backup status");
            }
        }
    }

    /** Keep Android UI operations on the main thread; native export/import and cloud work run in the executor. */
    private static void message(Context context, String text) {
        MAIN.post(() -> Toast.makeText(context, text, Toast.LENGTH_LONG).show());
    }

    /** Use the native importer, which restores settings/favorites/blacklist and then restarts Swift Backup. */
    private static void restore(String snapshot) throws Exception {
        Object gson = Class.forName("w14").getMethod("c").invoke(null);
        Class<?> model = Class.forName(MODEL);
        Object data = gson.getClass().getMethod("c", String.class, Class.class).invoke(gson, decode(snapshot).toString(), model);
        model.getMethod("restore").invoke(data);
    }

    /** Temporarily pause capture during preview, and persist disabling only when the user confirms restoration. */
    private static void requestRestore(Context context) {
        if (restorePending) return;
        restorePending = true;
        try {
            LocalDb.runSettingsTask(() -> {
                try {
                    if (!LocalDb.syncSettingsNow()) throw new IllegalStateException("Connect your cloud and try again");
                    String snapshot = LocalDb.settingsBackup();
                    decode(snapshot);
                    String savedAt = java.text.DateFormat.getDateTimeInstance().format(
                            new java.util.Date(new JSONObject(snapshot).getLong("updatedAt")));
                    MAIN.post(() -> new AlertDialog.Builder(context)
                            .setTitle("Restore saved settings?")
                            .setMessage("This restores the settings snapshot saved on "
                                    + savedAt
                                    + ". App settings, favorites, and blacklist data are restored using Swift Backup's importer, then the app restarts. Automatic backup stays off until you enable it again.")
                            .setNegativeButton("Cancel", null)
                            .setOnDismissListener(dialog -> restorePending = false)
                            .setPositiveButton("Restore", (dialog, which) -> {
                                try {
                                    if (!preferences().edit().putBoolean("enabled", false).commit()) {
                                        throw new IllegalStateException("Could not pause automatic backup");
                                    }
                                    LocalDb.runSettingsTask(() -> {
                                        try { restore(snapshot); }
                                        catch (Exception error) { message(context, "Restore failed: " + error.getMessage()); }
                                    });
                                } catch (Exception error) { restorePending = false; message(context, error.getMessage()); }
                            }).show());
                } catch (Exception error) { restorePending = false; message(context, "Cannot restore settings: " + error.getMessage()); }
            });
        } catch (Exception error) { restorePending = false; message(context, error.getMessage()); }
    }

    /** Present opt-in automatic backup and explicit backup/restore without changing account authentication. */
    private static void show(Context context) {
        try {
            boolean enabled = preferences().getBoolean("enabled", false);
            new AlertDialog.Builder(context)
                    .setTitle("Cloud settings backup")
                    .setMultiChoiceItems(new String[]{"Automatically back up settings"}, new boolean[]{enabled}, (dialog, which, checked) -> {
                        try {
                            if (!preferences().edit().putBoolean("enabled", checked).commit()) {
                                throw new IllegalStateException("Could not save backup option");
                            }
                            // Opting in from Settings must start capture even when Firebase has never attached.
                            if (checked) LocalDb.runSettingsTask(() -> {
                                try { tick(); }
                                catch (Exception error) { message(context, "Automatic capture failed: " + error.getMessage()); }
                            });
                            message(context, checked ? "Automatic settings backup enabled. Current settings replace the saved copy on the next sync." : "Automatic settings backup disabled");
                        } catch (Exception error) { message(context, error.getMessage()); }
                    })
                    .setPositiveButton("Back up now", (dialog, which) -> {
                        try {
                            LocalDb.runSettingsTask(() -> {
                                try {
                                    backup(true);
                                    boolean synced = LocalDb.syncSettingsNow();
                                    message(context, synced ? "Settings backed up to cloud" : "Settings saved locally; waiting for a cloud connection");
                                } catch (Exception error) { message(context, "Backup failed: " + error.getMessage()); }
                            });
                        } catch (Exception error) { message(context, error.getMessage()); }
                    })
                    .setNeutralButton("Restore from cloud", (dialog, which) -> requestRestore(context))
                    .setNegativeButton("Close", null).show();
        } catch (Exception error) { message(context, error.getMessage()); }
    }

    /** Reflect only members verified in the 5.1.0 APK; traverse class hierarchy so PreferenceGroup members are found. */
    private static Field field(Object target, String name) throws Exception {
        Class<?> current = target instanceof Class ? (Class<?>) target : target.getClass();
        Field field = null;
        while (current != null) {
            try {
                field = current.getDeclaredField(name);
                break;
            } catch (NoSuchFieldException ignored) {
                current = current.getSuperclass();
            }
        }
        if (field == null) {
            try {
                field = Class.forName("androidx.preference.Preference").getDeclaredField(name);
            } catch (NoSuchFieldException e) {
                field = Class.forName("androidx.preference.Preference").getField(name);
            }
        }
        // R8 finalized constructor-only preference fields after removing setters; this new instance is not yet published.
        field.setAccessible(true);
        return field;
    }

    /** Attach after native preference construction; retain original register allocation and all existing controls. */
    public static void attach(Object fragment) {
        MAIN.post(() -> {
            try {
                Method jMethod = fragment.getClass().getMethod("j", String.class);
                jMethod.setAccessible(true);
                Object export = jMethod.invoke(fragment, "export_settings");
                if (export == null) return;
                Object parent = field(export, "a0").get(export);
                if (parent == null) return;
                // Use field() helper so reflection handles obfuscated/package-private container hierarchies cleanly.
                List children = (List) field(parent, "g0").get(parent);
                for (Object child : children) if (KEY.equals(field(child, "t").get(child))) return;
                Method actMethod = fragment.getClass().getMethod("getActivity");
                actMethod.setAccessible(true);
                Context context = (Context) actMethod.invoke(fragment);
                if (context == null) return;
                Class<?> preference = Class.forName("androidx.preference.Preference");
                Object row = preference.getConstructor(Context.class).newInstance(context);
                field(row, "t").set(row, KEY);
                field(row, "n").set(row, "Cloud settings backup");
                field(row, "k").setInt(row, field(export, "k").getInt(export));
                field(row, "p").set(row, "Automatic backup, back up now, or restore saved settings");

                // Swift Backup renders preference sections inside MaterialCardView cards via preference_segmented.
                // Reusing export_settings' layout resource and segmented flags ensures this preference is part of the card
                // container rather than an unstyled, transparent view that splits the surrounding section.
                int layoutRes = field(export, "W").getInt(export);
                if (layoutRes == 0) {
                    layoutRes = context.getResources().getIdentifier("preference_segmented", "layout", context.getPackageName());
                }
                if (layoutRes == 0) {
                    layoutRes = 0x7f0d0145; // Verified R.layout.preference_segmented in 5.1.0
                }
                field(row, "W").setInt(row, layoutRes);
                field(row, "R").setBoolean(row, true);
                field(row, "S").setBoolean(row, false);

                // Assign the cloud upload icon. Swift Backup's preference adapter (lt7) checks for "cloud" in
                // the preference key (KEY="cloud_settings_backup") to automatically style this icon with a circular
                // blue badge background and matching blue tint.
                int iconRes = context.getResources().getIdentifier("ic_cloud_upload", "drawable", context.getPackageName());
                if (iconRes == 0) {
                    iconRes = context.getResources().getIdentifier("ic_cloud_filled", "drawable", context.getPackageName());
                }
                if (iconRes == 0) {
                    iconRes = 0x7f08011b; // Verified R.drawable.ic_cloud_upload in 5.1.0
                }
                field(row, "q").setInt(row, iconRes);
                try {
                    field(row, "r").set(row, context.getDrawable(iconRes));
                } catch (Throwable ignored) {}

                Object manager = field(export, "b").get(export);
                // Attach preference to hierarchy manager so lifecycle and preference keys are managed consistently.
                for (Method m : preference.getMethods()) {
                    if (m.getName().equals("k") && m.getParameterTypes().length == 1) {
                        m.setAccessible(true);
                        m.invoke(row, manager);
                        break;
                    }
                }
                field(row, "a0").set(row, parent);
                Class<?> listener = Class.forName("t36");
                field(row, "f").set(row, Proxy.newProxyInstance(listener.getClassLoader(), new Class<?>[]{listener}, (proxy, method, args) -> {
                    if (method.getName().equals("d")) { show(context); return true; }
                    if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                    if (method.getName().equals("equals")) return proxy == args[0];
                    return "Morphe cloud settings backup";
                }));
                children.add(row);
                Object adapter = field(export, "Y").get(export);
                if (adapter != null) {
                    Method oMethod = adapter.getClass().getMethod("o");
                    oMethod.setAccessible(true);
                    oMethod.invoke(adapter);
                }
            } catch (Exception error) { Log.e(TAG, "Cannot attach cloud settings backup control", error); }
        });
    }
}
