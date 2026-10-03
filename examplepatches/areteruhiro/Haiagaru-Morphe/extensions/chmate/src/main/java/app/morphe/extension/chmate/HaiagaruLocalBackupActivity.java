package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import android.widget.Toast;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/** Android document-picker transport for the same validated snapshot used by MEGA. */
public final class HaiagaruLocalBackupActivity extends Activity {
    public static final String EXTRA_MODE = "haiagaru.backup.mode";
    public static final String EXTRA_CATEGORIES = "haiagaru.backup.categories";
    public static final int MODE_SAVE = 1;
    public static final int MODE_OPEN = 2;
    private static final int REQUEST_DOCUMENT = 1;
    private static final int MAX_BYTES = 32 * 1024 * 1024;
    private int mode;
    private int categories;
    private boolean pickerStarted;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        mode = getIntent().getIntExtra(EXTRA_MODE, 0);
        categories = getIntent().getIntExtra(EXTRA_CATEGORIES, HaiagaruSyncSnapshot.DEFAULT)
                & HaiagaruSyncSnapshot.ALL;
        pickerStarted = state != null && state.getBoolean("pickerStarted", false);
        if (mode != MODE_SAVE && mode != MODE_OPEN) {
            finish();
            return;
        }
        if (!pickerStarted) launchPicker();
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        state.putBoolean("pickerStarted", pickerStarted);
        super.onSaveInstanceState(state);
    }

    private void launchPicker() {
        Intent picker = new Intent(mode == MODE_SAVE
                ? Intent.ACTION_CREATE_DOCUMENT : Intent.ACTION_OPEN_DOCUMENT);
        picker.addCategory(Intent.CATEGORY_OPENABLE);
        picker.setType("application/json");
        if (mode == MODE_SAVE) {
            picker.putExtra(Intent.EXTRA_TITLE, "haiagaru-backup-" +
                    new java.text.SimpleDateFormat("yyyyMMdd-HHmmss", java.util.Locale.ROOT)
                            .format(new java.util.Date()) + ".json");
        } else {
            picker.setType("*/*");
            picker.putExtra(Intent.EXTRA_MIME_TYPES, new String[]{"application/json", "text/plain"});
        }
        try {
            pickerStarted = true;
            startActivityForResult(picker, REQUEST_DOCUMENT);
        } catch (Exception error) {
            showError("ファイル選択画面を開けませんでした");
        }
    }

    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request != REQUEST_DOCUMENT) return;
        Uri uri = data == null ? null : data.getData();
        if (result != RESULT_OK || uri == null) {
            finish();
            return;
        }
        if (mode == MODE_SAVE) save(uri);
        else open(uri);
    }

    private void save(Uri uri) {
        if (categories == 0) {
            showError("バックアップする項目が選ばれていません");
            return;
        }
        run("端末のファイルにバックアップしました", () -> {
            byte[] snapshot = HaiagaruSyncSnapshot.capture(getApplicationContext(), categories);
            try (ParcelFileDescriptor file = getContentResolver().openFileDescriptor(uri, "wt")) {
                if (file == null) throw new IOException("保存先を開けませんでした");
                try (OutputStream output = new ParcelFileDescriptor.AutoCloseOutputStream(file)) {
                    output.write(snapshot);
                    output.flush();
                }
            }
        });
    }

    private void open(Uri uri) {
        run(null, () -> {
            byte[] bytes;
            try (InputStream input = getContentResolver().openInputStream(uri)) {
                if (input == null) throw new IOException("ファイルを開けませんでした");
                ByteArrayOutputStream output = new ByteArrayOutputStream();
                byte[] buffer = new byte[8192];
                int read;
                while ((read = input.read(buffer)) != -1) {
                    if (output.size() + read > MAX_BYTES) throw new IOException("32 MiBを超えるバックアップです");
                    output.write(buffer, 0, read);
                }
                bytes = output.toByteArray();
            }
            JSONObject snapshot = HaiagaruSyncSnapshot.validate(bytes);
            runOnUiThread(() -> confirmRestore(snapshot));
        });
    }

    private void confirmRestore(JSONObject snapshot) {
        int available = snapshot.optInt("categories", 0) & HaiagaruSyncSnapshot.ALL;
        int[] bits = {HaiagaruSyncSnapshot.BOOKMARKS, HaiagaruSyncSnapshot.NG,
                HaiagaruSyncSnapshot.SETTINGS, HaiagaruSyncSnapshot.POST_HISTORY,
                HaiagaruSyncSnapshot.KAKIKOMI, HaiagaruSyncSnapshot.COOKIES};
        String[] names = {"お気に入り・閲覧履歴", "NG設定", "ChMate・Haiagaru設定",
                "書き込み履歴", "書き込みメモ", "Cookie（ログイン情報を含む）"};
        boolean[] selected = new boolean[bits.length];
        for (int index = 0; index < bits.length; index++) {
            boolean present = (available & bits[index]) != 0;
            names[index] += present ? "" : "（バックアップに含まれません）";
            selected[index] = present && (categories & bits[index]) != 0;
        }
        String summary;
        try {
            summary = HaiagaruSyncSnapshot.describeChanges(getApplicationContext(),
                    snapshot, available, false);
        } catch (Exception error) {
            showError("変更内容を確認できませんでした");
            return;
        }
        new AlertDialog.Builder(this).setTitle("端末のバックアップから復元")
                .setMessage("復元前に現在のデータをアプリ内へ退避します。\n\n" + summary
                        + "\nCookieはログイン情報を含み、別端末では再ログインが必要な場合があります。")
                .setMultiChoiceItems(names, selected, (dialog, index, checked) ->
                        selected[index] = checked && (available & bits[index]) != 0)
                .setNegativeButton("キャンセル", (dialog, which) -> finish())
                .setPositiveButton("復元", (dialog, which) -> {
                    int flags = 0;
                    for (int index = 0; index < bits.length; index++) {
                        if (selected[index]) flags |= bits[index];
                    }
                    if (flags == 0) {
                        showError("復元する項目を選択してください");
                        return;
                    }
                    final int chosen = flags;
                    run("復元しました。ChMateを再起動してください", () ->
                            HaiagaruSyncSnapshot.restore(getApplicationContext(), snapshot, chosen));
                })
                .setOnCancelListener(dialog -> finish()).show();
    }

    private void run(String success, Operation operation) {
        new Thread(() -> {
            try {
                operation.perform();
                if (success != null) runOnUiThread(() -> {
                    Toast.makeText(this, success, Toast.LENGTH_LONG).show();
                    finish();
                });
            } catch (Exception error) {
                runOnUiThread(() -> showError(error instanceof IOException
                        ? error.getMessage() : "バックアップを処理できませんでした"));
            }
        }, "Haiagaru-local-backup").start();
    }

    private void showError(String message) {
        new AlertDialog.Builder(this).setTitle("バックアップを処理できませんでした")
                .setMessage(message).setPositiveButton("閉じる", (dialog, which) -> finish())
                .setOnCancelListener(dialog -> finish()).show();
    }

    private interface Operation { void perform() throws Exception; }
}
