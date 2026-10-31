package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Handler;
import android.os.Looper;
import android.os.Environment;
import android.system.Os;
import android.util.Log;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Hooks for 191's native ZIP restore, not Haiagaru's JSON/MEGA restore. */
public final class NativeRestore191 {
    private static final String TAG = "HaiagaruNativeRestore";
    private static final String ERROR = "haiagaru_native_restore_error";
    private static final WeakHashMap<Object, Boolean> preparing = new WeakHashMap<>();
    private static final WeakHashMap<Object, Boolean> redirected = new WeakHashMap<>();
    private static WeakReference<Object> owner = new WeakReference<>(null);
    private static WeakReference<Thread> restoreWorker = new WeakReference<>(null);
    private static Context context;
    private static boolean errorShown;

    private NativeRestore191() { }

    public static void initialize(Context value) { context = value.getApplicationContext(); }

    /** Expanded backups are working data, not expendable Android cache. */
    public static File stagingRoot(Context value) { return value.getNoBackupFilesDir(); }

    public static void retain(Object fragment) {
        try { fragment.getClass().getMethod("setRetainInstance", boolean.class).invoke(fragment, true); }
        catch (Exception error) { throw new IllegalStateException("復元画面の保持に失敗しました", error); }
    }

    public static synchronized boolean beginPreview(Object fragment) {
        try {
            if (Boolean.TRUE.equals(redirected.get(fragment))) return false;
            Thread restoring = restoreWorker.get();
            if (Boolean.TRUE.equals(preparing.get(fragment)) || (restoring != null && restoring.isAlive())) {
                binding(fragment, "b", boolean.class, true);
                binding(fragment, "c", boolean.class, false);
                return false;
            }
            Object other = owner.get();
            if (other != null && other != fragment) {
                Thread thread = (Thread) field(other, "c");
                if (Boolean.TRUE.equals(preparing.get(other)) || (thread != null && thread.isAlive())) {
                    binding(fragment, "b", String.class, "別の復元処理が実行中です。完了後に開き直してください");
                    return false;
                }
            }
            owner = new WeakReference<>(fragment);
            preparing.put(fragment, true);
            return true;
        } catch (Exception error) { throw new IllegalStateException("復元状態を確認できません", error); }
    }

    public static synchronized void finishPreview(Object fragment) { preparing.put(fragment, false); }

    /** Haiagaru ZIPs deliberately have no native SQLite DB, e.g. Cookie-only saves. */
    public static boolean routeHaiagaruBackup(Object fragment) {
        try {
            File directory = (File) field(fragment, "h");
            File metadata = new File(directory, "snapshot.json");
            if (!metadata.isFile()) return false;
            if (metadata.length() > HaiagaruSyncSnapshot.MAX_METADATA_BYTES)
                throw new IOException("バックアップ情報が大きすぎます");
            // Validate the signature before routing; the local importer validates the
            // entire archive again before showing any restore action.
            try (java.io.InputStream input = new java.io.FileInputStream(metadata);
                 java.io.ByteArrayOutputStream output = new java.io.ByteArrayOutputStream()) {
                HaiagaruBackupArchive.copy(input, output);
                HaiagaruSyncSnapshot.validate(output.toByteArray());
            }
            String source = (String) field(fragment, "f");
            synchronized (NativeRestore191.class) { redirected.put(fragment, true); preparing.put(fragment, false); }
            new Handler(Looper.getMainLooper()).post(() -> {
                try {
                    Activity activity = (Activity) fragment.getClass().getMethod("getActivity").invoke(fragment);
                    if (activity == null || activity.isFinishing()) return;
                    binding(fragment, "b", boolean.class, false);
                    binding(fragment, "c", boolean.class, false);
                    binding(fragment, "b", String.class, "Haiagaru形式のバックアップです。専用の復元画面で項目を確認してください。");
                    activity.startActivity(new android.content.Intent(activity, HaiagaruLocalBackupActivity.class)
                            .putExtra(HaiagaruLocalBackupActivity.EXTRA_MODE, HaiagaruLocalBackupActivity.MODE_OPEN)
                            .setData(android.net.Uri.parse(source)));
                } catch (Exception error) { Log.e(TAG, "Cannot open Haiagaru backup screen", error); }
            });
            return true;
        } catch (Exception error) { throw new IllegalStateException("Haiagaruバックアップを確認できません", error); }
    }

    public static boolean beginRestore(Object thread) {
        Object fragment = null;
        try {
            fragment = field(thread, "b");
            synchronized (NativeRestore191.class) {
                Thread active = restoreWorker.get();
                if (active != null && active.isAlive()) return false;
                if (owner.get() != fragment || Boolean.TRUE.equals(preparing.get(fragment)))
                    throw new IOException("復元元を確認できません。バックアップを選び直してください");
                restoreWorker = new WeakReference<>(Thread.currentThread());
            }
            String path = (String) field(fragment, "d");
            if (path == null) throw new IOException("復元元データベースが準備されていません");
            File database = new File(path);
            validateDatabase(database);
            // Run on the restore worker, NEVER under the main-thread state lock.
            checkSpace((File) field(fragment, "h"), database);
            return true;
        } catch (Exception error) {
            Log.e(TAG, "NATIVE_RESTORE_PREFLIGHT_FAILED; no restore files copied", error);
            final Object screen = fragment;
            new Handler(Looper.getMainLooper()).post(() -> {
                if (screen == null) return;
                try {
                    binding(screen, "b", boolean.class, false);
                    binding(screen, "c", boolean.class, true);
                    binding(screen, "b", String.class, "復元を開始できませんでした。\n" + error.getMessage());
                } catch (Exception bindError) { Log.e(TAG, "Cannot show restore preflight error", bindError); }
            });
            return false;
        }
    }

    private static void checkSpace(File temporary, File database) throws Exception {
        Object manager = Class.forName("o.lo", false, context.getClassLoader()).getMethod("t").invoke(null);
        File storage = new File((String) field(manager, "e"));
        File[] children = temporary.listFiles();
        if (children == null) throw new IOException("復元用一時フォルダを読み込めません");
        java.util.Map<Long, Long> required = new java.util.HashMap<>();
        java.util.Map<Long, File> volumes = new java.util.HashMap<>();
        addSpace(required, volumes, context.getFilesDir(), database.length());
        for (File child : children) {
            if (!child.isDirectory() || child.getName().equals("databases")) continue;
            File destination = child.getName().equals("files") || child.getName().equals("prefs")
                    ? context.getFilesDir() : storage;
            addSpace(required, volumes, destination, NativeRestoreFiles.size(child));
        }
        for (java.util.Map.Entry<Long, Long> entry : required.entrySet()) {
            long usable = volumes.get(entry.getKey()).getUsableSpace();
            long needed = entry.getValue();
            if (needed > usable || usable - needed < 64L * 1024 * 1024)
                throw new IOException("復元先の空き容量が不足しています。展開済みデータとは別に約 "
                        + ((needed + 1048575L) / 1048576L) + " MB と作業領域が必要です");
        }
    }

    private static void addSpace(java.util.Map<Long, Long> required, java.util.Map<Long, File> volumes,
                                 File destination, long size) throws Exception {
        while (!destination.exists()) {
            destination = destination.getParentFile();
            if (destination == null) throw new IOException("復元先の保存領域が見つかりません");
        }
        // Emulated external storage consumes the same /data space despite a
        // different FUSE st_dev. Count internal + emulated copies together.
        File volumePath = destination;
        try {
            if (Environment.isExternalStorageEmulated(destination)) volumePath = context.getFilesDir();
        } catch (IllegalArgumentException notExternalStorage) { /* internal path */ }
        long volume = Os.stat(volumePath.getPath()).st_dev;
        long old = required.containsKey(volume) ? required.get(volume) : 0L;
        if (size > Long.MAX_VALUE - old) throw new IOException("復元サイズが大きすぎます");
        required.put(volume, old + size);
        volumes.put(volume, volumePath);
    }

    public static String previewError(Throwable error) {
        Log.e(TAG, "NATIVE_RESTORE_PREVIEW_DB_FAILED", error);
        return "復元元データベースを読み込めませんでした。\n" + error.getClass().getSimpleName()
                + ": " + error.getMessage();
    }

    public static boolean reusePreview(Object fragment) {
        try {
            String path = (String) field(fragment, "d");
            return path != null && new File(path).isFile();
        } catch (Exception error) { throw new IllegalStateException(error); }
    }

    public static void clearUnpreparedDirectory(File directory, Object fragment) {
        if (reusePreview(fragment)) return;
        try {
            File expected = new File(stagingRoot(context), "restoreTmp");
            if (!directory.getCanonicalFile().equals(expected.getCanonicalFile()))
                throw new IOException("復元一時フォルダの場所が不正です");
            delete(directory);
        } catch (IOException error) { throw new IllegalStateException("復元一時フォルダを準備できません", error); }
    }

    // Unlike Thread.interrupted(), testing cancellation must not clear it.
    public static boolean isInterrupted() { return Thread.currentThread().isInterrupted(); }

    public static boolean installDatabase(File source, File target) {
        try {
            if (context == null || !target.getCanonicalFile().equals(
                    context.getDatabasePath("roidon.sqlite").getCanonicalFile()))
                throw new IOException("復元先データベースの場所が不正です");
            // The native lazy opener synchronizes on o.nh.a. Hold that same lock
            // through the file switch so delayed background work cannot open the
            // old database while a large restored database is being copied.
            Class<?> manager = Class.forName("o.nh", false, context.getClassLoader());
            Field monitorField = manager.getDeclaredField("a"), live = manager.getDeclaredField("b");
            monitorField.setAccessible(true); live.setAccessible(true);
            Object monitor = monitorField.get(null);
            if (monitor == null) throw new IOException("データベースの復元ロックを取得できません");
            synchronized (monitor) {
                Object database = live.get(null);
                if (database instanceof SQLiteDatabase && ((SQLiteDatabase) database).isOpen())
                    throw new IOException("復元先データベースが使用中です。アプリを起動し直してください");
                NativeRestoreDatabase.prepare(source, "復元元");
                NativeRestoreDatabase.prepare(target, "復元先");
                NativeRestoreFiles.install(source, target, NativeRestore191::validateDatabase);
            }
            context.getSharedPreferences("boot_prefs", 0).edit().remove(ERROR).commit();
            return true;
        } catch (Exception error) {
            Log.e(TAG, "NATIVE_RESTORE_DB_INSTALL_FAILED; preserving restoreTmp and original ZIP", error);
            if (context != null) context.getSharedPreferences("boot_prefs", 0).edit()
                    .putString("rdp", source.getPath())
                    .putString(ERROR, "データベースの取り込みに失敗しました。復元用の一時データは保持しています。\n"
                            + error.getClass().getSimpleName() + ": " + error.getMessage()).commit();
            return false;
        }
    }

    private static void validateDatabase(File file) throws IOException {
        try (SQLiteDatabase db = NativeRestoreDatabase.open(file, SQLiteDatabase.OPEN_READONLY)) {
            try (Cursor result = db.rawQuery("PRAGMA quick_check(1)", null)) {
                if (!result.moveToFirst() || !"ok".equalsIgnoreCase(result.getString(0)))
                    throw new IOException("復元元データベースの整合性検査に失敗しました");
            }
            // Validate what 191 reads; do not rewrite a newer schema/version blindly.
            try (Cursor ignored = db.rawQuery("SELECT _id,board_order,name,server,title,category,is_external,flag,updated,access,extra2 FROM boards LIMIT 0", null)) {
                ignored.getCount();
            }
            try (Cursor ignored = db.rawQuery("SELECT _id,bookmark_order,name,created,title,res_count,server_res_count,read_count,read_state,updated,access,flag,state,posted FROM bookmarks LIMIT 0", null)) {
                ignored.getCount();
            }
        } catch (RuntimeException error) { throw new IOException("191で読み込めないデータベースです", error); }
    }

    public static void onActivityResumed(Activity activity) {
        if (context == null || errorShown || activity.isFinishing()) return;
        String error = context.getSharedPreferences("boot_prefs", 0).getString(ERROR, null);
        if (error == null) return;
        errorShown = true;
        new HaiagaruDialog.Builder(activity).setTitle("ChMate標準バックアップの復元エラー")
                .setMessage(error).setPositiveButton(android.R.string.ok, null).show();
    }

    private static Object field(Object object, String name) throws Exception {
        Field field = object.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(object);
    }

    private static void binding(Object fragment, String method, Class<?> type, Object value) throws Exception {
        Object binding = field(fragment, "b");
        java.lang.reflect.Method setter = binding.getClass().getMethod(method, type);
        setter.setAccessible(true);
        setter.invoke(binding, value);
    }

    private static void delete(File file) throws IOException {
        if (file.isDirectory()) {
            File[] children = file.listFiles();
            if (children == null) throw new IOException("一時フォルダを読み込めません");
            for (File child : children) {
                if (!child.getCanonicalPath().startsWith(file.getCanonicalPath() + File.separator))
                    throw new IOException("一時フォルダ外へのリンクがあります");
                delete(child);
            }
        }
        if (file.exists() && !file.delete()) throw new IOException("一時ファイルを削除できません: " + file.getName());
    }
}
