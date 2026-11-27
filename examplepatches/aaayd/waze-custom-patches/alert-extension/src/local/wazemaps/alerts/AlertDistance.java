package local.wazemaps.alerts;

import android.app.AlertDialog;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.lang.reflect.Method;
import java.util.Arrays;

/** Configurable Android Auto heads-up distances, using Waze's own native config API. */
public final class AlertDistance {
    private static Context application() throws Exception {
        return (Context) Class.forName("k.z").getMethod("j", Class.class).invoke(null, Application.class);
    }

    static final int DEFAULT = 1200, MIN = 50, MAX = 10000;
    private static final String PREFS = "morphe_aa_alert_distance";
    private static final String TAG = "MorpheAlertDistance";
    private static final String[] FIELDS = {
        "CONFIG_VALUE_ANDROID_AUTO_HEADS_UP_DISTANCE_NORMAL",
        "CONFIG_VALUE_ANDROID_AUTO_HEADS_UP_DISTANCE_FREEWAY",
        "CONFIG_VALUE_ANDROID_AUTO_HEADS_UP_DISTANCE"
    };
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile Object[] configObjects;

    private static Context context() throws Exception {
        return application();
    }
    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
    static int validate(int value) {
        if (value < MIN || value > MAX) throw new IllegalArgumentException("Enter 50 to 10000 metres");
        return value;
    }
    private static int distance(SharedPreferences prefs) { return validate(prefs.getInt("metres", DEFAULT)); }
    private static Object[] configs() throws Exception {
        Object[] result = configObjects;
        if (result == null) {
            Class<?> type = Class.forName("com.waze.config.ConfigValues");
            result = new Object[FIELDS.length];
            for (int i = 0; i < result.length; i++) {
                result[i] = type.getField(FIELDS[i]).get(null);
                if (result[i] == null) throw new IllegalStateException("Config values are not ready");
            }
            configObjects = result;
        }
        return result;
    }

    /** Preserve the upstream Java getter override, with saved and bounded values. */
    public static Long override(Object config) {
        try {
            boolean target = false;
            for (Object value : configs()) if (value == config) target = true;
            if (!target) return null;
            SharedPreferences prefs = prefs(context());
            return prefs.getBoolean("enabled", true) ? Long.valueOf(distance(prefs)) : null;
        } catch (Exception error) {
            Log.e(TAG, "Distance override unavailable", error);
            return null;
        }
    }

    private static final class NativeConfig {
        final Object manager;
        final Method get, set;
        final int[] ids = new int[FIELDS.length];
        NativeConfig() throws Exception {
            Class<?> type = Class.forName("com.waze.ConfigManager");
            manager = type.getMethod("getInstance").invoke(null);
            get = type.getMethod("getConfigValueLongNTV", int.class);
            set = type.getMethod("setConfigValueLongNTV", int.class, long.class);
            Object[] values = configs();
            for (int i = 0; i < ids.length; i++) ids[i] = ((Number) values[i].getClass().getMethod("e").invoke(values[i])).intValue();
            if (ids[0] == ids[1] || ids[0] == ids[2] || ids[1] == ids[2]) throw new IllegalStateException("Duplicate config IDs");
        }
        long[] read() throws Exception {
            long[] result = new long[ids.length];
            for (int i = 0; i < ids.length; i++) result[i] = ((Number) get.invoke(manager, ids[i])).longValue();
            return result;
        }
        void write(long[] values) throws Exception {
            for (int i = 0; i < ids.length; i++) set.invoke(manager, ids[i], values[i]);
        }
    }

    /** Runs on Waze's native thread. Never accepts a Java override as verification. */
    static synchronized long[] apply(Context context, int metres, boolean enabled, boolean saveChoice) throws Exception {
        if (!Boolean.TRUE.equals(Class.forName("com.waze.NativeManager").getMethod("isAppStarted").invoke(null)))
            throw new IllegalStateException("Waze is still starting. Try again shortly.");
        if (enabled) validate(metres);
        SharedPreferences prefs = prefs(context);
        NativeConfig config = new NativeConfig();
        long[] before = config.read(), target = new long[FIELDS.length];
        SharedPreferences.Editor backup = prefs.edit();
        boolean missing = false;
        for (int i = 0; i < target.length; i++) {
            String key = "original_" + FIELDS[i];
            if (!prefs.contains(key)) { backup.putLong(key, before[i]); missing = true; }
            target[i] = enabled ? metres : prefs.getLong(key, before[i]);
        }
        if (missing && !backup.commit()) throw new IllegalStateException("Could not save original distances");
        boolean oldEnabled = prefs.getBoolean("enabled", true);
        int oldDistance = prefs.getInt("metres", DEFAULT);
        try {
            if (!Arrays.equals(before, target)) config.write(target);
            long[] actual = config.read();
            if (!Arrays.equals(actual, target)) throw new IllegalStateException("Waze did not accept the requested distance");
            if (saveChoice && !prefs.edit().putInt("metres", metres).putBoolean("enabled", enabled).commit())
                throw new IllegalStateException("Could not save the distance");
            Log.i(TAG, "Native distances verified: " + Arrays.toString(actual));
            return actual;
        } catch (Exception error) {
            try { config.write(before); } catch (Exception rollback) { error.addSuppressed(rollback); }
            if (saveChoice) prefs.edit().putInt("metres", oldDistance).putBoolean("enabled", oldEnabled).commit();
            throw error;
        }
    }

    /** Called after native app initialisation, before Waze starts navigation services. */
    public static void applySaved() {
        try {
            Context context = context();
            SharedPreferences prefs = prefs(context);
            if (prefs.getBoolean("enabled", true)) apply(context, distance(prefs), true, false);
        } catch (Exception error) { Log.e(TAG, "Could not apply saved distance", error); }
    }
    private static void postNative(Runnable task) throws Exception {
        Object accepted = Class.forName("com.waze.NativeManager").getMethod("Post", Runnable.class).invoke(null, task);
        if (Boolean.FALSE.equals(accepted)) throw new IllegalStateException("Waze is still starting. Try again shortly.");
    }
    /** Reapply after Waze refreshes its configuration. */
    public static void scheduleApply() {
        try { postNative(AlertDistance::applySaved); }
        catch (Exception error) { Log.e(TAG, "Could not queue saved distance", error); }
    }
    private static String summary(Context context) {
        SharedPreferences prefs = prefs(context);
        return prefs.getBoolean("enabled", true) ? distance(prefs) + " m in Android Auto" : "Original Waze distances";
    }
    public static View decorate(View original) {
        if (original == null) return null;
        try {
            if (!"map_mode".equals(original.getTag()) && !"morphe_map_mode".equals(original.getTag())) return original;
            if (original.findViewWithTag("morphe_alert_distance") != null) return original;
            Context context = original.getContext();
            Class<?> type = Class.forName("com.waze.settings.tree.views.WazeSettingsView");
            View row = (View) type.getConstructor(Context.class).newInstance(context);
            type.getMethod("N", String.class).invoke(row, "Police alert distance");
            type.getMethod("P", String.class).invoke(row, summary(context));
            type.getMethod("B", int.class).invoke(row, 1);
            row.setTag("morphe_alert_distance");
            row.setOnClickListener(view -> show(context, row));
            boolean wrapped = "morphe_map_mode".equals(original.getTag());
            LinearLayout container = wrapped ? (LinearLayout) original : new LinearLayout(context);
            container.setOrientation(LinearLayout.VERTICAL);
            container.setTag("morphe_map_mode");
            if (!wrapped) container.addView(original, new LinearLayout.LayoutParams(-1, -2));
            int position = 1;
            if (container.findViewWithTag("morphe_themes") != null) position++;
            if (container.findViewWithTag("morphe_icon_pack") != null) position++;
            container.addView(row, position, new LinearLayout.LayoutParams(-1, -2));
            return container;
        } catch (Exception error) {
            Log.e(TAG, "Could not add distance setting", error);
            return original;
        }
    }
    private static String values(long[] values) {
        return "Live Waze values: normal roads " + values[0] + " m, freeways " + values[1] + " m, fallback " + values[2] + " m.";
    }
    private static void show(Context context, View row) {
        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        int padding = Math.round(20 * context.getResources().getDisplayMetrics().density);
        content.setPadding(padding, padding, padding, padding);
        EditText input = new EditText(context);
        input.setInputType(InputType.TYPE_CLASS_NUMBER);
        input.setSingleLine(true);
        input.setHint("Distance in metres (50 to 10000)");
        input.setText(String.valueOf(distance(prefs(context))));
        content.addView(input);
        TextView status = new TextView(context);
        status.setText("Reading Waze's current distances...");
        content.addView(status);
        TextView note = new TextView(context);
        note.setText("Controls Android Auto police and enforcement heads-up alerts. Waze must have a report available. Spoken warnings follow Waze's own rules.");
        note.setPadding(0, padding, 0, 0);
        content.addView(note);
        AlertDialog dialog = new AlertDialog.Builder(context).setTitle("Police alert distance").setView(content)
            .setNegativeButton("Cancel", null).setNeutralButton("Use original", null).setPositiveButton("Apply", null).create();
        dialog.setOnShowListener(ignored -> {
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(view -> {
                try { change(context, row, dialog, validate(Integer.parseInt(input.getText().toString().trim())), true); }
                catch (IllegalArgumentException error) { input.setError("Enter 50 to 10000 metres"); }
            });
            dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(view -> change(context, row, dialog, distance(prefs(context)), false));
        });
        dialog.show();
        try {
            postNative(() -> {
                String message;
                try {
                    if (!Boolean.TRUE.equals(Class.forName("com.waze.NativeManager").getMethod("isAppStarted").invoke(null)))
                        throw new IllegalStateException("Waze is still starting");
                    message = values(new NativeConfig().read());
                } catch (Exception error) { message = "Live values unavailable while Waze is starting."; }
                String result = message;
                MAIN.post(() -> status.setText(result));
            });
        } catch (Exception error) { status.setText("Live values unavailable while Waze is starting."); }
    }
    private static void change(Context context, View row, AlertDialog dialog, int metres, boolean enabled) {
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(false);
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setEnabled(false);
        try {
            postNative(() -> {
                try {
                    apply(context, metres, enabled, true);
                    MAIN.post(() -> {
                        try { row.getClass().getMethod("P", String.class).invoke(row, summary(context)); }
                        catch (Exception error) { Log.e(TAG, "Could not update distance label", error); }
                        dialog.dismiss();
                        Toast.makeText(context, enabled ? "Distance applied and verified in Waze" : "Original distances restored and verified", Toast.LENGTH_LONG).show();
                    });
                } catch (Exception error) {
                    Log.e(TAG, "Could not change distance", error);
                    MAIN.post(() -> failed(context, dialog));
                }
            });
        } catch (Exception error) { Log.e(TAG, "Could not queue distance change", error); failed(context, dialog); }
    }
    private static void failed(Context context, AlertDialog dialog) {
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(true);
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setEnabled(true);
        Toast.makeText(context, "Distance could not be applied. Try again when Waze has finished starting.", Toast.LENGTH_LONG).show();
    }
}
