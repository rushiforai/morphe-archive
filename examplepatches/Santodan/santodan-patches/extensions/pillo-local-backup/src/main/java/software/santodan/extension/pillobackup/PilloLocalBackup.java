package software.santodan.extension.pillobackup;

import android.app.*;
import android.content.*;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Bundle;
import android.view.*;
import android.widget.*;
import org.json.*;
import java.io.*;
import java.lang.reflect.*;
import java.text.SimpleDateFormat;
import java.util.*;

/** Local backup UI plus an early, journaled restore before Pillo opens its stores. */
public final class PilloLocalBackup {
    private static final String TAG = "santodan.local.backup";
    static final String IDENTITY = "acdc24b1947a76c496bdc3ac20b3d60e";
    private static volatile boolean busy;
    private static volatile boolean restored;
    private static final ThreadLocal<Boolean> GOOGLE_ROUTE = new ThreadLocal<>();
    private static java.lang.ref.WeakReference<Activity> onboarding = new java.lang.ref.WeakReference<>(null);
    private PilloLocalBackup() {}

    static File work(Context context) { return context.getDir("santodan-local-backup", Context.MODE_PRIVATE); }
    static Map<String, File> roots(Context context) {
        Map<String, File> roots = new LinkedHashMap<>();
        roots.put("database", context.getDatabasePath("pillo.db"));
        roots.put("preferences", new File(context.getApplicationInfo().dataDir, "shared_prefs"));
        roots.put("files", context.getFilesDir());
        roots.put("no_backup", context.getNoBackupFilesDir());
        File external = context.getExternalFilesDir(null);
        if (external != null) roots.put("external", external);
        return roots;
    }
    static Map<String, File> targets(Context context, JSONObject manifest) throws Exception {
        Map<String, File> available = roots(context), selected = new LinkedHashMap<>();
        JSONArray names = manifest.getJSONArray("roots");
        for (int i = 0; i < names.length(); i++) {
            String key = names.getString(i);
            if (!available.containsKey(key)) throw new IOException("Backup storage is unavailable: " + key);
            selected.put(key, available.get(key));
        }
        selected.put("database-wal", new File(context.getDatabasePath("pillo.db") + "-wal"));
        selected.put("database-shm", new File(context.getDatabasePath("pillo.db") + "-shm"));
        selected.put("database-journal", new File(context.getDatabasePath("pillo.db") + "-journal"));
        return selected;
    }
    static Map<String, File> allTargets(Context context) {
        Map<String, File> targets = roots(context);
        targets.put("database-wal", new File(context.getDatabasePath("pillo.db") + "-wal"));
        targets.put("database-shm", new File(context.getDatabasePath("pillo.db") + "-shm"));
        targets.put("database-journal", new File(context.getDatabasePath("pillo.db") + "-journal"));
        return targets;
    }

    /** Injected before even LocaleManager reads preferences and before content providers initialize. */
    public static void beforeAttach(Context base) {
        File work = work(base), journal = new File(work, "restore-journal.json"), pending = new File(work, "restore-ready");
        try {
            if (journal.exists()) {
                String state = new JSONObject(LocalArchive.readText(journal)).getString("state");
                if (state.equals("committed")) {
                    restored = true; LocalArchive.delete(pending);
                } else if (state.equals("prepared") && pending.exists()) {
                    LocalArchive.commit(journal, allTargets(base));
                    restored = true; LocalArchive.delete(pending);
                    LocalArchive.atomicText(new File(work, "result.txt"), "Local backup restored. A copy of your previous data is available under Local backup > Export pre-restore backup.");
                } else {
                    LocalArchive.recover(journal, allTargets(base));
                    LocalArchive.delete(pending);
                    LocalArchive.atomicText(new File(work, "result.txt"), "An interrupted restore was cancelled. Your previous data was kept.");
                }
            } else if (pending.exists()) {
                LocalArchive.delete(pending);
                LocalArchive.atomicText(new File(work, "result.txt"), "Restore could not start. Your previous data was kept.");
            }
        } catch (Exception error) {
            try {
                LocalArchive.recover(journal, allTargets(base));
                LocalArchive.delete(pending);
                LocalArchive.atomicText(new File(work, "result.txt"), "Restore failed; previous data recovered: " + reason(error));
            } catch (Exception recovery) {
                // Never let Room open a partially replaced database after failed rollback.
                throw new IllegalStateException("Pillo local restore needs recovery; original data remains in .santodan-old files.", recovery);
            }
        }
    }

    /** Cleanup happens off the startup thread; Pillo's own consistency scheduler repairs alarms. */
    public static void afterCreate(Context application) {
        if (!restored) return;
        try { call(call(application, "getAlarmAuditScheduler"), "schedule"); }
        catch (Exception error) { android.util.Log.e("PilloLocalBackup", "Alarm audit could not start", error); }
        new Thread(() -> {
            try {
                File work = work(application);
                LocalArchive.recover(new File(work, "restore-journal.json"), allTargets(application));
                LocalArchive.delete(new File(work, "incoming"));
                LocalArchive.delete(new File(work, "import.zip"));
            } catch (Exception error) { android.util.Log.e("PilloLocalBackup", "Restore cleanup will retry next launch", error); }
        }, "PilloRestoreCleanup").start();
    }

    public static void attach(Activity activity) {
        activity.getWindow().getDecorView().post(() -> {
            if (!activity.isFinishing() && activity.getFragmentManager().findFragmentByTag(TAG) == null)
                activity.getFragmentManager().beginTransaction().add(new LocalBackupFragment(), TAG).commit();
        });
    }

    public static void attachOnboarding(Activity activity) {
        onboarding = new java.lang.ref.WeakReference<>(activity);
    }

    /** Preserve the native controller contract while offering all three restore sources. */
    public static Object onboardingChoice(Object original, Object callbacks) throws Exception {
        Class<?> controller = Class.forName("xyz.rtrvr.pillo.extensions.BottomSheetController");
        Field medisafe = callbacks.getClass().getDeclaredField("$onClickRestoreViaMedisafe");
        Field account = callbacks.getClass().getDeclaredField("$onClickRestoreViaPilloAccount");
        medisafe.setAccessible(true); account.setAccessible(true);
        Object medisafeAction = medisafe.get(callbacks), accountAction = account.get(callbacks);
        return Proxy.newProxyInstance(controller.getClassLoader(), new Class<?>[]{controller}, (proxy, method, args) -> {
            Activity activity = onboarding.get();
            if (method.getName().equals("open") && activity != null && !activity.isFinishing()) {
                if (busy) return null;
                new AlertDialog.Builder(activity).setTitle("Choose an Option")
                    .setItems(new String[]{"Import ‘Medisafe’ Report Data", "Restore Pillo Back-up Data", "Import local backup"},
                        (dialog, which) -> {
                            try {
                                if (which == 2) {
                                    LocalBackupFragment fragment = (LocalBackupFragment) activity.getFragmentManager().findFragmentByTag(TAG);
                                    if (fragment == null) {
                                        fragment = new LocalBackupFragment();
                                        Bundle options = new Bundle(); options.putBoolean("showButton", false);
                                        fragment.setArguments(options);
                                        activity.getFragmentManager().beginTransaction().add(fragment, TAG).commit();
                                        activity.getFragmentManager().executePendingTransactions();
                                    }
                                    fragment.importFile();
                                } else Class.forName("kotlin.jvm.functions.Function0").getMethod("invoke")
                                    .invoke(which == 0 ? medisafeAction : accountAction);
                            } catch (Exception error) {
                                new AlertDialog.Builder(activity).setMessage("Cannot open restore: " + reason(error))
                                    .setPositiveButton("OK", null).show();
                            }
                        }).show();
                return null;
            }
            try { return method.invoke(original, args); }
            catch (InvocationTargetException error) { throw error.getCause(); }
        });
    }

    /** Settings reaches this chooser before its existing Google sign-in gate. */
    public static boolean chooseTransport(Object signedIn, Context context, Activity activity, Object signIn) {
        if (Boolean.TRUE.equals(GOOGLE_ROUTE.get()) || activity == null || activity.isFinishing()) return false;
        new AlertDialog.Builder(activity).setTitle("Backup and restore")
            .setItems(new String[]{"Local file", "Google backup"}, (dialog, which) -> {
                if (which == 0) {
                    if (busy) return;
                    LocalBackupFragment fragment = (LocalBackupFragment) activity.getFragmentManager().findFragmentByTag(TAG);
                    if (fragment == null) {
                        fragment = new LocalBackupFragment(); Bundle options = new Bundle(); options.putBoolean("showButton", false);
                        fragment.setArguments(options);
                        activity.getFragmentManager().beginTransaction().add(fragment, TAG).commit();
                        activity.getFragmentManager().executePendingTransactions();
                    }
                    fragment.menu();
                } else {
                    try {
                        GOOGLE_ROUTE.set(true);
                        Class<?> owner = Class.forName("xyz.rtrvr.pillo.ui.settings.components.SettingsOtherEntriesKt$SettingsOtherEntries$1$2");
                        Method nativeAction = null;
                        for (Method method : owner.getDeclaredMethods())
                            if (method.getName().equals("invoke$lambda$7$lambda$6") && method.getParameterTypes().length == 4) nativeAction = method;
                        if (nativeAction == null) throw new NoSuchMethodException("Settings backup action");
                        nativeAction.setAccessible(true); nativeAction.invoke(null, signedIn, context, activity, signIn);
                    } catch (Exception error) {
                        new AlertDialog.Builder(activity).setTitle("Backup and restore").setMessage("Cannot open Google backup: " + reason(error)).setPositiveButton("OK", null).show();
                    } finally { GOOGLE_ROUTE.remove(); }
                }
            }).show();
        return true;
    }

    public static final class LocalBackupFragment extends Fragment {
        private Button button;
        private AlertDialog progress;
        private AlertDialog confirmation;
        private JSONObject preview;
        @Override public void onCreate(Bundle state) {
            super.onCreate(state); setRetainInstance(true);
            if (state != null && state.containsKey("preview")) {
                try { preview = new JSONObject(state.getString("preview")); busy = true; }
                catch (Exception ignored) { preview = null; }
            }
        }
        @Override public void onSaveInstanceState(Bundle state) {
            super.onSaveInstanceState(state);
            if (preview != null) state.putString("preview", preview.toString());
        }
        @Override public void onActivityCreated(Bundle state) {
            super.onActivityCreated(state);
            Activity activity = getActivity();
            if (getArguments() == null || getArguments().getBoolean("showButton", true)) {
                button = new Button(activity); button.setText("Local backup"); button.setTextSize(12); button.setEnabled(!busy);
                FrameLayout.LayoutParams layout = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.END);
                float density = activity.getResources().getDisplayMetrics().density;
                layout.topMargin = (int) (64 * density); layout.rightMargin = (int) (12 * density);
                ((ViewGroup) activity.findViewById(android.R.id.content)).addView(button, layout);
                button.setOnClickListener(view -> menu());
            }
            File result = new File(work(activity), "result.txt");
            if (result.exists()) {
                try { String message = LocalArchive.readText(result); LocalArchive.delete(result); message(message); }
                catch (Exception error) { message("Cannot read restore result: " + reason(error)); }
            }
            if (preview != null) showConfirmation();
            else if (busy) showProgress();
        }
        @Override public void onDestroyView() {
            if (button != null && button.getParent() instanceof ViewGroup) ((ViewGroup) button.getParent()).removeView(button);
            if (progress != null) progress.dismiss(); progress = null; button = null;
            if (confirmation != null) confirmation.dismiss(); confirmation = null;
            super.onDestroyView();
        }
        private void menu() {
            boolean recovery = new File(work(getActivity()), "pre-restore.zip").isFile();
            String[] items = recovery ? new String[]{"Export all data to local file", "Import local backup", "Export pre-restore backup"}
                : new String[]{"Export all data to local file", "Import local backup"};
            new AlertDialog.Builder(getActivity()).setTitle("Local backup").setItems(items, (dialog, which) -> {
                try {
                    if (which == 1) importFile();
                    else {
                        String timestamp = new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.ROOT).format(new Date());
                        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT).setType("application/zip")
                            .addCategory(Intent.CATEGORY_OPENABLE).putExtra(Intent.EXTRA_TITLE,
                                (which == 2 ? "Pillo-pre-restore-" : "Pillo-local-") + timestamp + ".pillo-backup.zip");
                        startActivityForResult(intent, which == 2 ? 7203 : 7201);
                    }
                } catch (Exception error) { message("Cannot open file picker: " + reason(error)); }
            }).show();
        }
        private void importFile() {
            if (busy) return;
            try { startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("*/*")
                .addCategory(Intent.CATEGORY_OPENABLE), 7202); }
            catch (Exception error) { message("Cannot open file picker: " + reason(error)); }
        }
        @Override public void onActivityResult(int request, int result, Intent data) {
            super.onActivityResult(request, result, data);
            if (result != Activity.RESULT_OK || data == null || data.getData() == null
                || request < 7201 || request > 7203 || busy) return;
            Activity activity = getActivity(); Uri uri = data.getData();
            begin();
            new Thread(() -> {
                try {
                    File work = work(activity);
                    if (request == 7202) {
                        File archive = new File(work, "import.zip"), stage = new File(work, "incoming");
                        if (new File(work, "restore-journal.json").exists()) throw new IOException("Previous restore cleanup is still pending. Reopen Pillo and try again.");
                        LocalArchive.delete(stage);
                        try (InputStream input = activity.getContentResolver().openInputStream(uri); OutputStream output = new FileOutputStream(archive)) {
                            if (input == null) throw new IOException("Cannot read backup file.");
                            LocalArchive.transfer(input, output, LocalArchive.MAX_BYTES + 64 * 1024 * 1024);
                        }
                        JSONObject manifest = LocalArchive.extract(archive, stage);
                        validateDatabase(new File(stage, "data/database"));
                        targets(activity, manifest); // Require mounted storage before offering restore.
                        activity.runOnUiThread(() -> {
                            if (progress != null) progress.dismiss(); progress = null;
                            preview = manifest;
                            showConfirmation();
                        });
                    } else {
                        File archive = request == 7203 ? new File(work, "pre-restore.zip") : new File(work, "export.zip");
                        if (request == 7201) capture(activity, archive);
                        try (InputStream input = new FileInputStream(archive); OutputStream output = activity.getContentResolver().openOutputStream(uri, "wt")) {
                            if (output == null) throw new IOException("Cannot write the selected file.");
                            LocalArchive.transfer(input, output, LocalArchive.MAX_BYTES + 64 * 1024 * 1024);
                        }
                        if (request == 7201) LocalArchive.delete(archive);
                        complete(activity, "Backup exported to the selected file.");
                    }
                } catch (Exception error) { complete(activity, "Local backup failed: " + reason(error)); }
            }, "PilloLocalFile").start();
        }
        private void showConfirmation() {
            Activity current = getActivity(); if (current == null || current.isFinishing() || confirmation != null) return;
            confirmation = new AlertDialog.Builder(current).setTitle("Replace all Pillo data?")
                .setMessage("This restores the backup's profiles, medicines, reminders, history, settings and app-managed files. Current data will be replaced, and Pillo will restart. A local copy of your current data will be kept for recovery.")
                .setNegativeButton("Cancel", (dialog, which) -> cancelPreview(current))
                .setOnCancelListener(dialog -> cancelPreview(current))
                .setPositiveButton("Restore and restart", (dialog, which) -> {
                    JSONObject manifest = preview; preview = null; confirmation = null; busy = false;
                    restore(new File(work(current), "incoming"), manifest);
                }).show();
        }
        private void cancelPreview(Activity activity) { preview = null; confirmation = null; discardStage(activity); }
        private void restore(File stage, JSONObject manifest) {
            if (busy) return;
            Activity activity = getActivity(); begin();
            new Thread(() -> {
                try {
                    File work = work(activity);
                    validateDatabase(new File(stage, "data/database"));
                    // Capture the current state before any replacement, including its native DB snapshot.
                    capture(activity, new File(work, "pre-restore.zip"));
                    LocalArchive.prepare(stage, new File(work, "restore-journal.json"), targets(activity, manifest));
                    LocalArchive.atomicText(new File(work, "restore-ready"), "ready");
                    activity.runOnUiThread(() -> {
                        try {
                            Intent launch = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
                            if (launch == null || launch.getComponent() == null) throw new IOException("Cannot restart Pillo.");
                            activity.startActivity(Intent.makeRestartActivityTask(launch.getComponent()));
                            System.exit(0); // Same process restart pattern as Pillo's native restore.
                        } catch (Exception error) {
                            try { LocalArchive.delete(new File(work, "restore-ready")); LocalArchive.recover(new File(work, "restore-journal.json"), allTargets(activity)); }
                            catch (Exception cleanup) { android.util.Log.e("PilloLocalBackup", "Prepared restore cleanup failed", cleanup); }
                            end(); message("Cannot restart Pillo: " + reason(error));
                        }
                    });
                } catch (Exception error) { complete(activity, "Restore preparation failed; current data kept: " + reason(error)); }
            }, "PilloRestorePrepare").start();
        }
        private void discardStage(Activity context) {
            new Thread(() -> {
                try {
                    LocalArchive.delete(new File(work(context), "incoming")); LocalArchive.delete(new File(work(context), "import.zip"));
                    context.runOnUiThread(this::end);
                } catch (Exception error) { complete(context, "Import cancelled; temporary cleanup failed: " + reason(error)); }
            }, "PilloImportCancel").start();
        }
        private void begin() { busy = true; if (button != null) button.setEnabled(false); showProgress(); }
        private void showProgress() {
            if (getActivity() != null && progress == null)
                progress = new AlertDialog.Builder(getActivity()).setTitle("Local backup").setMessage("Working… Please keep Pillo open.").setCancelable(false).show();
        }
        private void end() { busy = false; if (button != null) button.setEnabled(true); if (progress != null) progress.dismiss(); progress = null; }
        private void complete(Activity activity, String text) { activity.runOnUiThread(() -> { end(); message(text); }); }
        private void message(String text) {
            Activity activity = getActivity(); if (activity != null && !activity.isFinishing())
                new AlertDialog.Builder(activity).setTitle("Local backup").setMessage(text).setPositiveButton("OK", null).show();
        }
    }

    static void capture(Context context, File archive) throws Exception {
        File work = work(context), snapshot = new File(work, "snapshot.sqlite3");
        Class<?> helperClass = Class.forName("xyz.rtrvr.pillo.data.persistence.backup.PilloDatabaseBackUpHelper");
        Class<?> callbackClass = Class.forName("kotlin.jvm.functions.Function3");
        boolean[] complete = {false}, success = {false}; String[] failure = {"Native database backup did not complete."};
        Object callback = Proxy.newProxyInstance(callbackClass.getClassLoader(), new Class<?>[]{callbackClass}, (proxy, method, args) -> {
            if (method.getName().equals("invoke")) {
                complete[0] = true; success[0] = Boolean.TRUE.equals(args[0]); failure[0] = String.valueOf(args[1]);
                return Class.forName("kotlin.Unit").getField("INSTANCE").get(null);
            }
            if (method.getName().equals("toString")) return "PilloLocalBackupCallback";
            if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
            if (method.getName().equals("equals")) return proxy == args[0];
            return null;
        });
        try {
            helperClass.getMethod("doBackup", File.class, String.class, callbackClass)
                .invoke(helperClass.getConstructor().newInstance(), work, snapshot.getName(), callback);
            if (!complete[0] || !success[0]) throw new IOException(failure[0]);
            validateDatabase(snapshot);
            // Flush queued SharedPreferences writes before copying XML files.
            File preferences = roots(context).get("preferences"); File[] xml = preferences.listFiles();
            if (xml != null) for (File file : xml) if (file.getName().endsWith(".xml"))
                if (!context.getSharedPreferences(file.getName().substring(0, file.getName().length() - 4), 0).edit().commit())
                    throw new IOException("Cannot flush preferences.");
            Map<String, File> source = roots(context); source.put("database", snapshot);
            LocalArchive.write(archive, source);
        } finally { LocalArchive.delete(snapshot); }
    }

    static void validateDatabase(File file) throws Exception {
        try (SQLiteDatabase database = SQLiteDatabase.openDatabase(file.getAbsolutePath(), null,
                SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.NO_LOCALIZED_COLLATORS)) {
            try (Cursor cursor = database.rawQuery("PRAGMA quick_check", null)) {
                if (!cursor.moveToFirst() || !"ok".equals(cursor.getString(0)) || cursor.moveToNext()) throw new IOException("Backup database is damaged.");
            }
            try (Cursor cursor = database.rawQuery("SELECT identity_hash FROM room_master_table WHERE id=42", null)) {
                if (!cursor.moveToFirst() || !IDENTITY.equals(cursor.getString(0))) throw new IOException("Database schema does not match Pillo 0.6.20.");
            }
        }
    }

    private static Object call(Object receiver, String name) throws Exception {
        for (Class<?> type = receiver.getClass(); type != null; type = type.getSuperclass())
            for (Method method : type.getDeclaredMethods())
                if (method.getName().equals(name) && method.getParameterTypes().length == 0) {
                    method.setAccessible(true); return method.invoke(receiver);
                }
        throw new NoSuchMethodException(name);
    }
    private static String reason(Throwable error) {
        while (error.getCause() != null) error = error.getCause();
        return error.getMessage() == null ? error.getClass().getSimpleName() : error.getMessage();
    }
}
