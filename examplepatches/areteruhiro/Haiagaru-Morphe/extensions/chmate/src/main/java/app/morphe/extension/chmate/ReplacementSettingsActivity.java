package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.ContentValues;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

/** A document URI lets external editors keep control of the user's replacement TXT. */
public final class ReplacementSettingsActivity extends Activity {
    private TextView status;
    private Button create;
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        if (!StringReplacement.supported(this)) { finish(); return; }
        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        int padding = (int) (20 * getResources().getDisplayMetrics().density);
        layout.setPadding(padding, padding, padding, padding);
        if (Build.VERSION.SDK_INT >= 21) layout.setOnApplyWindowInsetsListener((view, insets) -> {
            view.setPadding(padding, padding + insets.getSystemWindowInsetTop(), padding,
                    padding + insets.getSystemWindowInsetBottom());
            return insets;
        });
        TextView title = new TextView(this);
        title.setText("本文の文字列置換"); title.setTextSize(22); layout.addView(title);
        Switch enabled = new Switch(this);
        enabled.setText("表示する本文を置換する");
        enabled.setChecked(StringReplacement.prefs(this).getBoolean("enabled", false));
        enabled.setOnCheckedChangeListener((button, checked) -> StringReplacement.setEnabled(this, checked));
        layout.addView(enabled);
        TextView description = new TextView(this);
        description.setText("Download/Haiagaru/ReplaceStr.txt をUTF-8・タブ区切りで編集してください。"
                + "\n例: https://example■.com/ → https://example.com/"
                + "\nリンク認識前に本文を置換します。投稿本文・保存DAT・NG判定は変更しません。"
                + "\n通常置換のみ対応。<ex>は大小区別なし、<ex2>は区別あり。"
                + "正規表現・名前やタイトルの置換・URL条件にはまだ対応していません。"
                + "\nファイルを編集後、「再読み込み」→スレを開き直してください。"
                + "\nファイルを置き換えた場合や、別のパッケージ名でインストールした場合は再選択してください。");
        layout.addView(description);
        create = button(layout, "Download/Haiagaru にサンプルTXTを作成", () -> createSample());
        button(layout, "置換TXTを選択", () -> {
            Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
                    .setType("*/*").addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION
                            | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);
            try { startActivityForResult(picker, 1); }
            catch (Exception e) { status.setText("ファイル選択を開けません: " + e.getMessage()); }
        });
        button(layout, "再読み込み", () -> reload());
        button(layout, "戻る", this::finish);
        status = new TextView(this); layout.addView(status);
        ScrollView scroll = new ScrollView(this); scroll.addView(layout); setContentView(scroll);
    }
    @Override protected void onResume() { super.onResume(); reload(); }
    private void reload() {
        if (status == null) return;
        status.setText("読み込み中…");
        StringReplacement.reload(this, true, () -> runOnUiThread(() -> {
            if (!isFinishing()) status.setText(StringReplacement.status);
        }));
    }
    private Button button(LinearLayout layout, String label, Runnable action) {
        Button b = new Button(this); b.setText(label); b.setOnClickListener(v -> action.run()); layout.addView(b); return b;
    }
    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request != 1 || result != RESULT_OK || data == null || data.getData() == null) return;
        Uri uri = data.getData();
        try {
            getContentResolver().takePersistableUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION);
            StringReplacement.select(this, uri);
            reload();
        } catch (Exception e) { status.setText("ファイルの読み取り許可を保存できません: " + e.getMessage()); }
    }
    private void createSample() {
        create.setEnabled(false);
        new Thread(() -> {
            try {
                Uri uri;
                if (Build.VERSION.SDK_INT >= 29) {
                    String path = Environment.DIRECTORY_DOWNLOADS + "/Haiagaru/";
                    try (Cursor cursor = getContentResolver().query(MediaStore.Downloads.EXTERNAL_CONTENT_URI,
                            new String[]{MediaStore.MediaColumns._ID},
                            MediaStore.MediaColumns.DISPLAY_NAME + "=? AND " + MediaStore.MediaColumns.RELATIVE_PATH + "=?",
                            new String[]{"ReplaceStr.txt", path}, null)) {
                        if (cursor != null && cursor.moveToFirst()) throw new java.io.IOException("TXTがすでにあります。「置換TXTを選択」で開いてください");
                    }
                    ContentValues values = new ContentValues();
                    values.put(MediaStore.MediaColumns.DISPLAY_NAME, "ReplaceStr.txt");
                    values.put(MediaStore.MediaColumns.MIME_TYPE, "text/plain");
                    values.put(MediaStore.MediaColumns.RELATIVE_PATH, path);
                    values.put(MediaStore.MediaColumns.IS_PENDING, 1);
                    uri = getContentResolver().insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
                    if (uri == null) throw new java.io.IOException("TXTを作成できません");
                    try {
                        try (OutputStream out = getContentResolver().openOutputStream(uri)) {
                            if (out == null) throw new java.io.IOException("TXTを開けません");
                            out.write(StringReplacement.SAMPLE.getBytes(StandardCharsets.UTF_8));
                        }
                        ContentValues ready = new ContentValues(); ready.put(MediaStore.MediaColumns.IS_PENDING, 0);
                        getContentResolver().update(uri, ready, null, null);
                    } catch (Exception e) { getContentResolver().delete(uri, null, null); throw e; }
                } else {
                    File dir = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), "Haiagaru");
                    if (!dir.isDirectory() && !dir.mkdirs()) throw new java.io.IOException("フォルダを作成できません");
                    File file = new File(dir, "ReplaceStr.txt");
                    if (!file.createNewFile()) throw new java.io.IOException("TXTがすでにあります。「置換TXTを選択」で開いてください");
                    try (OutputStream out = new FileOutputStream(file)) { out.write(StringReplacement.SAMPLE.getBytes(StandardCharsets.UTF_8)); }
                    uri = Uri.fromFile(file);
                }
                StringReplacement.select(this, uri);
                runOnUiThread(this::reload);
            } catch (Exception e) { runOnUiThread(() -> status.setText(e.getMessage())); }
            finally { runOnUiThread(() -> create.setEnabled(true)); }
        }, "Haiagaru-ReplaceStr-create").start();
    }
}
