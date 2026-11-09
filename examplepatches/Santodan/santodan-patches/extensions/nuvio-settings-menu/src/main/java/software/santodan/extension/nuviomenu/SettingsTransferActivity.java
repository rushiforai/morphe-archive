package software.santodan.extension.nuviomenu;

import android.app.Activity;
import android.app.Application;
import android.content.*;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import java.io.*;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import software.santodan.nuvio.NuvioNative;

/** Private document-picker host. It needs no storage permission or native activity hooks. */
public final class SettingsTransferActivity extends Activity {
    private static final int EXPORT = 41, IMPORT = 42;
    private static volatile Boolean available;
    private boolean working;
    private int workGeneration;
    private boolean pickerPending;

    public static void renderSettings(Object composer) throws Exception {
        Application app = (Application) Class.forName("android.app.ActivityThread")
            .getMethod("currentApplication").invoke(null);
        if (available == null) {
            try {
                app.getPackageManager().getActivityInfo(new ComponentName(app, SettingsTransferActivity.class), 0);
                available = true;
            } catch (PackageManager.NameNotFoundException absent) { available = false; }
        }
        if (!available) return;
        ClassLoader loader = composer.getClass().getClassLoader();
        Class<?> function = Class.forName("kotlin.jvm.functions.Function0", false, loader);
        Object unit;
        Class<?> unitType = Class.forName("kotlin.Unit", false, loader);
        try { unit = unitType.getField("INSTANCE").get(null); }
        catch (NoSuchFieldException renamed) { unit = unitType.getField("a").get(null); }
        final Object result = unit;
        String reference = NuvioNative.REF_SETTINGS_ROWS_A;
        String owner = reference.substring(1, reference.indexOf(';')).replace('/', '.');
        String name = reference.substring(reference.indexOf("->") + 2, reference.indexOf('('));
        Method row = null;
        for (Method candidate : Class.forName(owner, false, loader).getDeclaredMethods())
            if (candidate.getName().equals(name) && candidate.getParameterCount() == 18) {
                if (row != null) throw new NoSuchMethodException("Ambiguous native settings action row");
                row = candidate;
            }
        if (row == null) throw new NoSuchMethodException("Native settings action row");
        row.setAccessible(true);
        Object noop = Proxy.newProxyInstance(loader, new Class<?>[]{function}, (proxy, method, args) -> {
            if (method.getName().equals("invoke")) return result;
            if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
            if (method.getName().equals("equals")) return proxy == args[0];
            return "SantodanSettingsTransferNoop";
        });
        for (boolean exporting : new boolean[]{true, false}) {
            Object click = Proxy.newProxyInstance(loader, new Class<?>[]{function}, (proxy, method, args) -> {
                if (method.getName().equals("invoke")) {
                    app.startActivity(new Intent(app, SettingsTransferActivity.class)
                        .putExtra("export", exporting).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                    return result;
                }
                if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                if (method.getName().equals("equals")) return proxy == args[0];
                return "SantodanSettingsTransfer";
            });
            row.invoke(null, exporting ? "Export patch settings" : "Import patch settings",
                exporting ? "Save settings for all patches and profiles. Includes your IntroDB API key if configured."
                    : "Restore a settings backup from another installation. Restart NuvioTV afterwards.",
                null, click, null, noop, true, null, null, 0L, null, null, 0f, 0L, composer, 0, 0, 16336);
        }
        SettingsTransferUi.render(composer);
    }

    @Override public void onCreate(Bundle saved) {
        super.onCreate(saved);
        if (saved != null) {
            pickerPending = saved.getBoolean("pickerPending");
            if (!pickerPending) message("Transfer screen was recreated. Restart NuvioTV and check your settings before trying again.");
            return;
        }
        boolean exporting = getIntent().getBooleanExtra("export", false);
        Intent picker = new Intent(exporting ? Intent.ACTION_CREATE_DOCUMENT : Intent.ACTION_OPEN_DOCUMENT)
            .addCategory(Intent.CATEGORY_OPENABLE).setType(exporting ? "application/json" : "*/*");
        if (exporting) picker.putExtra(Intent.EXTRA_TITLE, "nuviotv-patch-settings.json");
        try { pickerPending = true; startActivityForResult(picker, exporting ? EXPORT : IMPORT); }
        catch (ActivityNotFoundException unavailable) {
            pickerPending = false;
            message("No file picker is installed. Enable an Android document picker to export or import settings.");
        }
    }

    @Override public void onSaveInstanceState(Bundle state) {
        state.putBoolean("pickerPending", pickerPending); super.onSaveInstanceState(state);
    }

    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        pickerPending = false;
        if (result != RESULT_OK || data == null || data.getData() == null) { finish(); return; }
        Uri uri = data.getData();
        if (request == EXPORT) execute(() -> {
            String json = PatchSettingsBackup.encode(readSettings());
            try (OutputStream out = getContentResolver().openOutputStream(uri, "wt")) {
                if (out == null) throw new IOException("Cannot open backup destination");
                out.write(json.getBytes(StandardCharsets.UTF_8));
            }
            runOnUiThread(() -> message("Patch settings exported."));
        });
        else if (request == IMPORT) execute(() -> {
            String json;
            try (InputStream in = getContentResolver().openInputStream(uri)) {
                if (in == null) throw new IOException("Cannot open backup");
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buffer = new byte[8192]; int count;
                while ((count = in.read(buffer)) != -1) {
                    if (out.size() + count > PatchSettingsBackup.MAX_BYTES) throw new IOException("Backup is larger than 1 MiB");
                    out.write(buffer, 0, count);
                }
                json = out.toString("UTF-8");
            }
            Map<String, Map<String, Object>> settings = PatchSettingsBackup.decode(json);
            runOnUiThread(() -> {
                working = false; // Reading has finished; confirmation can start the save immediately.
                SettingsTransferUi.show("Import patch settings?", "Replace saved patch settings in " + settings.size()
                        + " settings groups? Profile IDs are preserved; use the same profiles in this installation.",
                    "Import", () -> execute(() -> {
                        restore(settings);
                        runOnUiThread(() -> {
                            SettingsTransferUi.show("Patch settings imported", "Restart NuvioTV to apply all imported settings.",
                                "Restart NuvioTV", () -> SettingsRestartActivity.restart(getApplicationContext()), "Later");
                        });
                    }), "Cancel");
                finish();
            });
        });
        finish();
    }

    private Map<String, Map<String, Object>> readSettings() throws IOException {
        Set<String> scopes = new TreeSet<>(Arrays.asList(PatchSettingsBackup.SCOPES));
        File folder = new File(getApplicationInfo().dataDir, "shared_prefs");
        File[] files = folder.listFiles();
        if (folder.exists() && files == null) throw new IOException("Cannot list profile settings");
        if (files != null) for (File file : files) {
            String name = file.getName();
            if (name.endsWith(".xml") && PatchSettingsBackup.scope(name.substring(0, name.length() - 4)))
                scopes.add(name.substring(0, name.length() - 4));
        }
        Map<String, Map<String, Object>> result = new TreeMap<>();
        for (String scope : scopes) {
            Map<String, Object> values = new TreeMap<>();
            for (Map.Entry<String, ?> entry : getSharedPreferences(scope, 0).getAll().entrySet())
                if (PatchSettingsBackup.type(scope, entry.getKey()) != null) values.put(entry.getKey(), entry.getValue());
            result.put(scope, values);
        }
        return result;
    }

    // All JSON is validated before the first write. Keep a rollback copy for commit failures.
    private void restore(Map<String, Map<String, Object>> values) throws IOException {
        PatchSettingsBackup.restore(new PatchSettingsBackup.Store() {
            public Map<String, Map<String, Object>> read() throws IOException { return readSettings(); }
            public void replace(String scope, Map<String, Object> settings) throws IOException { write(scope, settings); }
        }, values);
    }

    private void write(String scope, Map<String, Object> values) throws IOException {
        SharedPreferences prefs = getSharedPreferences(scope, 0);
        SharedPreferences.Editor edit = prefs.edit();
        for (String key : prefs.getAll().keySet()) if (PatchSettingsBackup.type(scope, key) != null) edit.remove(key);
        for (Map.Entry<String, Object> entry : values.entrySet()) {
            String key = entry.getKey(); Object value = entry.getValue();
            if (value instanceof Boolean) edit.putBoolean(key, (Boolean) value);
            else if (value instanceof Integer) edit.putInt(key, (Integer) value);
            else if (value instanceof Long) edit.putLong(key, (Long) value);
            else if (value instanceof String) edit.putString(key, (String) value);
            else if (value instanceof Set) edit.putStringSet(key, (Set<String>) value);
            else throw new IOException("Unsupported setting value");
        }
        if (!edit.commit()) throw new IOException("Cannot save patch settings");
    }

    private interface Work { void run() throws Exception; }
    private void execute(Work work) {
        if (working) return;
        working = true; SettingsTransferUi.busy();
        final int generation = ++workGeneration;
        new Thread(() -> {
            try { work.run(); }
            catch (Exception error) { runOnUiThread(() -> message("Settings transfer failed: " + error.getMessage())); }
            finally { runOnUiThread(() -> { if (workGeneration == generation) working = false; }); }
        }, "SantodanSettingsTransfer").start();
    }
    private void message(String text) {
        SettingsTransferUi.show("Patch settings", text, "OK", () -> {}, null);
        finish();
    }
}
