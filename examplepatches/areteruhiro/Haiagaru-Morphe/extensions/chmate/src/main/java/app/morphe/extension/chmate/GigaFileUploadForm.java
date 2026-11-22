package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.res.AssetFileDescriptor;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.provider.OpenableColumns;
import android.text.InputFilter;
import android.text.InputType;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.Spinner;
import android.widget.TextView;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

final class GigaFileUploadForm {
    static final int PICK = 6132;
    private final MediaUploadWebActivity activity;
    private final TextView status;
    private final Spinner expiration;
    private final EditText password;
    private final ProgressBar progress;
    private final Button choose, send, cancel;
    private Uri selected;
    private GigaFileTransfer transfer;
    private boolean picking, autoPick;
    private int orientation;

    GigaFileUploadForm(MediaUploadWebActivity activity, LinearLayout root, Bundle saved, Runnable showHistory) {
        this.activity = activity;
        choose = new Button(activity);
        choose.setText("ファイルを選択");
        choose.setOnClickListener(v -> pick());
        root.addView(choose);
        status = new TextView(activity);
        status.setText("送信するファイルを選択してください。");
        root.addView(status);

        TextView period = new TextView(activity);
        period.setText("保持期限");
        root.addView(period);
        expiration = new Spinner(activity);
        String[] days = new String[GigaFileTransfer.DAYS.length];
        for (int i = 0; i < days.length; i++) days[i] = GigaFileTransfer.DAYS[i] + "日";
        ArrayAdapter<String> adapter = new ArrayAdapter<>(activity,android.R.layout.simple_spinner_item,days);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        expiration.setAdapter(adapter);
        expiration.setSelection(saved == null ? 1 : saved.getInt("giga.days",1));
        root.addView(expiration);
        password = new EditText(activity);
        password.setHint("ダウンロードパスワード（任意）");
        password.setSingleLine(true);
        password.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        password.setFilters(new InputFilter[]{new InputFilter.LengthFilter(4)});
        password.setSaveEnabled(false);
        root.addView(password);

        send = new Button(activity);
        send.setText("アップロード");
        send.setEnabled(false);
        send.setOnClickListener(v -> upload());
        root.addView(send);
        progress = new ProgressBar(activity,null,android.R.attr.progressBarStyleHorizontal);
        progress.setMax(1000);
        progress.setVisibility(View.GONE);
        root.addView(progress);
        cancel = new Button(activity);
        cancel.setText("送信を中止");
        cancel.setVisibility(View.GONE);
        cancel.setOnClickListener(v -> cancel());
        root.addView(cancel);
        Button history = new Button(activity);
        history.setText("アップロード履歴");
        history.setOnClickListener(v -> showHistory.run());
        root.addView(history);
        if (saved != null) {
            selected = saved.getParcelable("giga.file");
            picking = saved.getBoolean("giga.picking");
            if (selected != null) showSelected();
        } else autoPick = true;
    }

    void resume() {
        if (!autoPick) return;
        autoPick = false;
        activity.getWindow().getDecorView().post(this::pick);
    }

    Intent pickerIntent() {
        return new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
                .setType("*/*").addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
    }

    private void pick() {
        if (picking || transfer != null || activity.isFinishing()) return;
        try {
            picking = true;
            try {
                activity.startActivityForResult(pickerIntent(), PICK);
            } catch (android.content.ActivityNotFoundException unsupported) {
                activity.startActivityForResult(pickerIntent().setAction(Intent.ACTION_GET_CONTENT), PICK);
            }
        } catch (RuntimeException unavailable) {
            picking = false;
            status.setText("Androidのファイル選択を開けませんでした。");
        }
    }

    void result(int resultCode, Intent data) {
        picking = false;
        if (resultCode != Activity.RESULT_OK || data == null) return;
        Uri uri = data.getData();
        if (uri == null || !"content".equals(uri.getScheme())) {
            status.setText("このファイルを開けませんでした。選び直してください。");
            return;
        }
        selected = uri;
        showSelected();
    }

    private void showSelected() {
        status.setText("ファイルを選択しました。保持期限とパスワードを設定して送信できます。");
        send.setEnabled(true);
        Uri uri = selected;
        new Thread(() -> {
            String name = "";
            try (Cursor cursor = activity.getContentResolver().query(uri,
                    new String[]{OpenableColumns.DISPLAY_NAME},null,null,null)) {
                if (cursor != null && cursor.moveToFirst() && !cursor.isNull(0)) name = cursor.getString(0);
            } catch (RuntimeException ignored) { }
            String label = name.substring(0, Math.min(name.length(),240));
            activity.runOnUiThread(() -> {
                if (!label.isEmpty() && uri.equals(selected) && transfer == null && !activity.isDestroyed())
                    status.setText(label);
            });
        }, "Haiagaru-GigaFile-name").start();
    }

    private void upload() {
        if (selected == null || transfer != null) return;
        String key = password.getText().toString();
        if (!key.matches("[A-Za-z0-9]{0,4}")) {
            password.setError("半角英数字4文字以内");
            return;
        }
        Uri uri = selected;
        int days = GigaFileTransfer.DAYS[expiration.getSelectedItemPosition()];
        GigaFileTransfer task = new GigaFileTransfer();
        transfer = task;
        orientation = activity.getRequestedOrientation();
        activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LOCKED);
        setBusy(true);
        status.setText("ファイルを読み込んでいます…");
        new Thread(() -> {
            GigaFileTransfer.Result result = null;
            try { result = uploadFile(task,uri,days,key); }
            catch (Exception ignored) { /* Do not include a URL or secret from a transport error. */ }
            GigaFileTransfer.Result completed = result;
            activity.runOnUiThread(() -> complete(task,completed,key));
        }, "Haiagaru-GigaFile").start();
    }

    private GigaFileTransfer.Result uploadFile(GigaFileTransfer task, Uri uri, int days, String key) throws Exception {
        String name = "upload";
        long length = -1;
        try (Cursor cursor = activity.getContentResolver().query(uri,
                new String[]{OpenableColumns.DISPLAY_NAME,OpenableColumns.SIZE},null,null,null)) {
            if (cursor != null && cursor.moveToFirst()) {
                if (!cursor.isNull(0)) name = cursor.getString(0);
                if (!cursor.isNull(1)) length = cursor.getLong(1);
            }
        } catch (RuntimeException missingMetadata) { /* Some document providers expose only a stream. */ }
        name = name.replaceAll("[\\p{Cntrl}]", "_").trim();
        if (name.isEmpty()) name = "upload";
        if (name.length() > 240) name = name.substring(0,240);
        if (length < 0) {
            try (AssetFileDescriptor descriptor = activity.getContentResolver().openAssetFileDescriptor(uri,"r")) {
                if (descriptor != null) length = descriptor.getLength();
            }
        }
        File cache = null;
        try {
            if (length < 0) {
                cache = File.createTempFile("gigafile-",".tmp",activity.getCacheDir());
                try (InputStream input = fileStream(uri); FileOutputStream out = new FileOutputStream(cache)) {
                    byte[] buffer = new byte[65536];
                    length = 0;
                    for (int n; (n = input.read(buffer)) != -1;) {
                        task.checkCancelled();
                        length += n;
                        if (length > GigaFileTransfer.MAX_SIZE) throw new IOException("File too large");
                        out.write(buffer,0,n);
                    }
                }
            }
            long[] last = {0};
            try (InputStream input = cache == null ? fileStream(uri) : new FileInputStream(cache)) {
                return task.upload(activity.getApplicationContext(),input,length,name,days,key,(sent,total) -> {
                    long now = SystemClock.elapsedRealtime();
                    if (sent != total && now - last[0] < 250) return;
                    last[0] = now;
                    activity.runOnUiThread(() -> {
                        if (transfer != task) return;
                        progress.setProgress(total == 0 ? 1000 : (int)(sent * 1000 / total));
                        status.setText(sent == total ? "ギガファイル便の応答を確認しています…" : "アップロード中…");
                    });
                });
            }
        } finally { if (cache != null) cache.delete(); }
    }

    private InputStream fileStream(Uri uri) throws IOException {
        InputStream input = activity.getContentResolver().openInputStream(uri);
        if (input == null) throw new IOException("File unavailable");
        return input;
    }

    private void complete(GigaFileTransfer task, GigaFileTransfer.Result result, String requestedPassword) {
        if (transfer != task || activity.isFinishing() || activity.isDestroyed()) return;
        boolean stopped = !cancel.isEnabled();
        transfer = null;
        activity.setRequestedOrientation(orientation);
        setBusy(false);
        if (result == null) {
            status.setText(stopped ? "アップロードを中止しました。" : "送信結果を確認できませんでした。再送前に履歴をご確認ください。");
            return;
        }
        selected = null;
        send.setEnabled(false);
        boolean readyToShare = requestedPassword.isEmpty() || result.passwordSet;
        if (readyToShare && GigaFilePosting.pasteUpload(
                activity.getIntent().getStringExtra("postingUpload"),result.url,requestedPassword)) {
            activity.finish();
            return;
        }
        status.setText(!readyToShare
                ? "アップロードは完了しましたが、パスワード設定を確認できません。共有前にご確認ください。"
                : "アップロードが完了しました。共有URLと削除キーは履歴にあります。");
        password.setText("");
        if (readyToShare) activity.showGigaCompleted(result.url,requestedPassword);
        else activity.showGigaHistory();
    }

    private void setBusy(boolean busy) {
        choose.setEnabled(!busy);
        expiration.setEnabled(!busy);
        password.setEnabled(!busy);
        send.setEnabled(!busy && selected != null);
        progress.setVisibility(busy ? View.VISIBLE : View.GONE);
        if (busy) progress.setProgress(0);
        cancel.setEnabled(true);
        cancel.setVisibility(busy ? View.VISIBLE : View.GONE);
    }

    private void cancel() {
        if (transfer == null) return;
        cancel.setEnabled(false);
        status.setText("中止しています…");
        GigaFileTransfer task = transfer;
        new Thread(task::cancel,"Haiagaru-GigaFile-cancel").start();
    }

    void save(Bundle state) {
        state.putParcelable("giga.file",selected);
        state.putBoolean("giga.picking",picking);
        state.putInt("giga.days",expiration.getSelectedItemPosition());
    }

    void destroy() {
        if (transfer != null) cancel();
    }
}
