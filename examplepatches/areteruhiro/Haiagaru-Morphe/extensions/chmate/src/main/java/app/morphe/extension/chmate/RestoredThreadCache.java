package app.morphe.extension.chmate;

import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.File;
import java.io.IOException;

/** A restored history row is not evidence that its DAT was restored too. */
final class RestoredThreadCache {
    private static final java.util.concurrent.atomic.AtomicBoolean REPAIRING = new java.util.concurrent.atomic.AtomicBoolean();

    static void addSettings(android.widget.LinearLayout box, android.app.Activity activity) {
        android.widget.Button button = new android.widget.Button(activity);
        button.setText("本文キャッシュの整合性を修復");
        box.addView(button);
        button.setOnClickListener(v -> new HaiagaruDialog.Builder(activity)
                .setTitle("本文キャッシュの整合性を修復")
                .setMessage("バックアップ復元後などに、本文DATがないのに取得済みとして残った履歴を修復します。既読位置・書き込みマークは保持します。履歴を退避してから補正し、本文のダウンロードは行いません。完了後にChMateを再起動し、通常の更新・巡回を行ってください。")
                .setPositiveButton("修復", (d,w) -> repair(activity))
                .setNegativeButton("キャンセル", null).show());
    }

    private static void repair(android.app.Activity activity) {
        if (!REPAIRING.compareAndSet(false, true)) return;
        Context context = activity.getApplicationContext();
        android.widget.Toast.makeText(activity,"本文キャッシュを確認しています",android.widget.Toast.LENGTH_SHORT).show();
        new Thread(() -> {
            String result;
            try {
                File recovery = new File(context.getFilesDir(), "haiagaru-sync-recovery");
                if (!recovery.isDirectory() && !recovery.mkdirs()) throw new IOException("退避領域を作成できません");
                byte[] snapshot = HaiagaruSyncSnapshot.capture(context, HaiagaruSyncSnapshot.BOOKMARKS);
                android.util.AtomicFile backup = new android.util.AtomicFile(new File(recovery,
                        "before-cache-repair-" + java.util.UUID.randomUUID() + ".json"));
                java.io.FileOutputStream output = backup.startWrite();
                try { output.write(snapshot); backup.finishWrite(output); }
                catch (Exception error) { backup.failWrite(output); throw error; }
                reconcile(context, new JSONObject(new String(snapshot, java.nio.charset.StandardCharsets.UTF_8)).getJSONArray("bookmarks"));
                result = "整合性の修復が完了しました。ChMateを再起動し、更新・巡回を行ってください。本文はまだダウンロードしていません。";
            } catch (Exception error) {
                android.util.Log.w("Haiagaru", "Thread cache repair unavailable", error);
                result = "修復できませんでした。保存領域・空き容量を確認してください。";
            } finally { REPAIRING.set(false); }
            final String message = result;
            activity.runOnUiThread(() -> {
                if (!activity.isFinishing() && !activity.isDestroyed())
                    new HaiagaruDialog.Builder(activity).setTitle("本文キャッシュの修復").setMessage(message).setPositiveButton("閉じる",null).show();
            });
        }, "Haiagaru-cache-repair").start();
    }
    static void reconcile(Context context, JSONArray rows) throws Exception {
        if (rows == null || rows.length() == 0) return;
        File external = context.getExternalFilesDir(null);
        if (external == null || !external.isDirectory() || !external.canRead())
            throw new IOException("復元後のスレ本文の保存領域を確認できません");
        File dat = new File(HaiagaruSyncSnapshot.externalRoot(context), "dat");
        if (dat.exists() && (!dat.isDirectory() || !dat.canRead()))
            throw new IOException("復元後のスレ本文フォルダを確認できません");
        File file = context.getDatabasePath("roidon.sqlite");
        if (!file.isFile()) throw new IOException("ChMateの履歴DBが見つかりません");
        try (SQLiteDatabase db = SQLiteDatabase.openDatabase(file.getPath(), null, SQLiteDatabase.OPEN_READWRITE)) {
            reconcile(db, dat, rows);
        }
    }

    /** Run after incoming DAT files are committed, not before ZIP extraction. */
    static void reconcile(SQLiteDatabase db, File dat, JSONArray rows) throws Exception {
        ContentValues values = new ContentValues();
        values.put("res_count", 0);
        db.beginTransaction();
        try {
            for (int i = 0; i < rows.length(); i++) {
                JSONObject row = rows.getJSONObject(i);
                String name = row.optString("name", "");
                long created = row.optLong("created", -1);
                if (name.isEmpty() || name.indexOf('/') >= 0 || name.indexOf('\\') >= 0 || created < 0) continue;
                File log = new File(dat, name + "_" + created + ".dat");
                if (log.exists()) {
                    if (!log.isFile() || !log.canRead())
                        throw new IOException("復元後のスレ本文を確認できません");
                    if (log.length() > 0) continue;
                }
                // Native patrol skips downloads when server_res_count <= res_count.
                // Correct only the derived local-cache count. Keep read_count,
                // server_res_count, read_state, flags, and all marks/history.
                db.update("bookmarks", values, "name=? AND created=? AND res_count>0",
                        new String[]{name, Long.toString(created)});
            }
            db.setTransactionSuccessful();
        } finally { db.endTransaction(); }
    }
    private RestoredThreadCache() {}
}
