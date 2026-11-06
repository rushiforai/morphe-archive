import android.app.ActivityThread;
import android.content.Context;
import app.morphe.extension.swiftbackup.LocalDb;
import app.morphe.extension.swiftbackup.SettingsBackup;
import java.lang.reflect.*;
import org.json.JSONObject;
import org.swiftapps.swiftbackup.settings.SwiftBackupSettingsHelper.SettingsData;

/** Exercise real controller capture/validation/restore decisions against native boundary fixtures. */
public final class SettingsBackupTest {
    private static int assertions;
    private static void check(boolean ok, String message) {
        if (!ok) throw new AssertionError(message);
        assertions++;
        System.out.println("PASS: " + message);
    }

    /** The metadata suite already provides an isolated real-file/cloud environment without production hooks. */
    private static void fresh() throws Exception {
        Method reset = LocalDbTest.class.getDeclaredMethod("fresh");
        reset.setAccessible(true);
        reset.invoke(null);
        ActivityThread.application = new Context();
        w14.exported = "{\"settings\":{\"theme\":\"dark\"},\"favorites\":{\"items\":[]},\"blacklist\":{\"items\":[{\"packageName\":\"test.app\"}]}}";
        w14.imported = null;
        SettingsData.restores = 0;
        Field pause = SettingsBackup.class.getDeclaredField("restorePending");
        pause.setAccessible(true);
        pause.set(null, false);
        android.app.AlertDialog.Builder.shown = null;
    }

    /** Invoke the real explicit restore worker while bypassing only the confirmation UI. */
    private static void restore(String snapshot) throws Exception {
        Method method = SettingsBackup.class.getDeclaredMethod("restore", String.class);
        method.setAccessible(true);
        try { method.invoke(null, snapshot); }
        catch (InvocationTargetException error) { throw (Exception) error.getCause(); }
    }

    public static void main(String[] args) throws Exception {
        fresh();
        SettingsBackup.tick();
        check(LocalDb.settingsBackup() == null, "automatic settings backup is opt-in after a fresh install");
        ActivityThread.application.getSharedPreferences("morphe_settings_backup", 0).edit().putBoolean("enabled", true).commit();
        SettingsBackup.tick();
        String snapshot = LocalDb.settingsBackup();
        check(new JSONObject(snapshot).getJSONObject("settings").getJSONObject("blacklist").getJSONArray("items").length() == 1,
                "automatic capture uses the complete native settings export");
        SettingsBackup.tick();
        check(snapshot.equals(LocalDb.settingsBackup()), "unchanged settings do not generate repeated snapshots");
        w14.exported = "{\"settings\":\"invalid\"}";
        boolean rejected = false;
        try { SettingsBackup.tick(); } catch (Exception expected) { rejected = true; }
        check(rejected && snapshot.equals(LocalDb.settingsBackup()), "malformed native export preserves the previous settings backup");
        restore(snapshot);
        check(SettingsData.restores == 1 && new JSONObject(w14.imported).getJSONObject("settings").getString("theme").equals("dark"),
                "explicit restore delegates the validated snapshot to the native importer");
        for (String invalid : new String[]{null, "{}", "{\"version\":2,\"updatedAt\":1,\"settings\":{}}", "{\"version\":1,\"updatedAt\":1,\"settings\":{\"settings\":false}}"}) {
            rejected = false;
            try { restore(invalid); } catch (Exception expected) { rejected = true; }
            check(rejected && SettingsData.restores == 1, "invalid restore candidate never reaches the native importer");
        }

        // Exercise the complete preview lifecycle with deterministic queue execution, not only restore's worker body.
        java.util.concurrent.ScheduledThreadPoolExecutor executor = new java.util.concurrent.ScheduledThreadPoolExecutor(1) {
            @Override public void execute(Runnable task) { task.run(); }
        };
        Field queue = LocalDb.class.getDeclaredField("executor");
        queue.setAccessible(true);
        queue.set(null, executor);
        try {
            fresh();
            Method show = SettingsBackup.class.getDeclaredMethod("show", Context.class);
            show.setAccessible(true);
            show.invoke(null, ActivityThread.application);
            android.app.AlertDialog.Builder.shown.choices.onClick(null, 0, true);
            check(LocalDb.settingsBackup() != null,
                    "enabling automatic backup from Settings queues capture without a Firebase attachment");
            fresh();
            android.content.SharedPreferences prefs = ActivityThread.application.getSharedPreferences("morphe_settings_backup", 0);
            prefs.edit().putBoolean("enabled", true).commit();
            SettingsBackup.tick();
            snapshot = LocalDb.settingsBackup();
            LocalDbTest.Cloud.remote = new JSONObject().put("rev", 1).put("data", new JSONObject()
                    .put("morphe_settings_backup", new JSONObject(snapshot))).toString().getBytes("UTF-8");
            Method preview = SettingsBackup.class.getDeclaredMethod("requestRestore", Context.class);
            preview.setAccessible(true);
            preview.invoke(null, ActivityThread.application);
            check(android.app.AlertDialog.Builder.shown != null && prefs.getBoolean("enabled", false),
                    "opening restore preview leaves the persistent automatic-backup option enabled");
            w14.exported = w14.exported.replace("dark", "light");
            SettingsBackup.tick();
            check(snapshot.equals(LocalDb.settingsBackup()), "restore preview temporarily pauses automatic capture");
            android.app.AlertDialog.Builder.shown.dismiss.onDismiss(null);
            SettingsBackup.tick();
            check(prefs.getBoolean("enabled", false) && LocalDb.settingsBackup().contains("light"),
                    "cancelling restore resumes automatic capture and preserves the opt-in");
            preview.invoke(null, ActivityThread.application);
            android.app.AlertDialog.Builder.shown.positive.onClick(null, 1);
            check(!prefs.getBoolean("enabled", true) && SettingsData.restores == 1,
                    "only confirmed restore persists disabling automatic backup and invokes the importer");
            android.app.AlertDialog.Builder.shown.dismiss.onDismiss(null);

            fresh();
            prefs = ActivityThread.application.getSharedPreferences("morphe_settings_backup", 0);
            prefs.edit().putBoolean("enabled", true).commit();
            LocalDbTest.Cloud.remote = "{\"rev\":1,\"data\":{}}".getBytes("UTF-8");
            preview.invoke(null, ActivityThread.application);
            SettingsBackup.tick();
            check(prefs.getBoolean("enabled", false) && LocalDb.settingsBackup() != null,
                    "missing restore snapshot resumes automatic capture without changing the opt-in");

            testAttach();
        } finally {
            executor.shutdownNow();
            queue.set(null, null);
        }
        System.out.println("Settings assertions passed: " + assertions);
    }

    /** Verify that dynamic preference construction integrates seamlessly with native segmented cards and icons. */
    private static void testAttach() throws Exception {
        fresh();
        final Object[] notified = new Object[1];
        Object adapter = new Object() {
            public void o() { notified[0] = true; }
        };
        androidx.preference.Preference export = new androidx.preference.Preference(ActivityThread.application);
        export.t = "export_settings";
        export.k = 1;
        export.W = 0x7f0d0145; // segmented layout
        export.b = new h46() {};
        export.Y = adapter;

        java.util.List<Object> children = new java.util.ArrayList<>();
        children.add(export);
        Object parent = new Object() {
            public java.util.List<Object> g0 = children;
        };
        export.a0 = parent;

        Object fragment = new Object() {
            public Object j(String key) { return "export_settings".equals(key) ? export : null; }
            public Context getActivity() { return ActivityThread.application; }
        };

        SettingsBackup.attach(fragment);
        check(children.size() == 2, "attached row is added to preference group children");
        androidx.preference.Preference row = (androidx.preference.Preference) children.get(1);
        check("morphe_cloud_settings_backup".equals(row.t), "attached row key matches cloud settings backup key");
        check(row.W == 0x7f0d0145, "attached row inherits segmented card layout from export settings");
        check(row.R && !row.S, "attached row receives segmented card spacing flags");
        check(row.q == 0x7f08011b && row.r != null, "attached row receives native cloud upload icon");
        check(Boolean.TRUE.equals(notified[0]), "attaching row invalidates and rebuilds preference group adapter");
    }
}
