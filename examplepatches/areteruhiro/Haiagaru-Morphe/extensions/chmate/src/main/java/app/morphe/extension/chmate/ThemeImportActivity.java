package app.morphe.extension.chmate;

import android.app.Activity;

import android.content.ClipData;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.provider.DocumentsContract;
import android.provider.OpenableColumns;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Uses Android's document picker, without all-files access or Android/data access. */
public final class ThemeImportActivity extends HaiagaruComposeActivity {
    private static final int FILES = 41, FOLDER = 42;
    private static final long MAX_TOTAL = 64L * 1024 * 1024;
    private static final Object IMPORT_LOCK = new Object();
    private TextView status;
    private boolean busy;
    private File staged;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        setTitle("カスタムテーマの取り込み");
        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        int padding = (int) (20 * getResources().getDisplayMetrics().density);
        layout.setPadding(padding, padding, padding, padding);
        TextView help = new TextView(this);
        help.setText("Downloadなどに保存した自作テーマをChMateに取り込みます。Android/dataの操作や特別な権限は不要です。\n\n"
                + "テーマ名.day.txt、テーマ名.night.txt、テーマ名.ingrs.txt、テーマ名.gray.txt、テーマ名.sky.txt、テーマ名.ml.txt、テーマ名.day3.txt に対応（内容はUTF-8のJSON形式）。\n\n"
                + "画像素材がある場合は、テーマと素材を入れたフォルダを選んでください。直下と1段下のフォルダを読み込みます。ZIPは先に展開してください。\n\n"
                + "取り込み後はChMateの「テーマの選択」を開き直し、追加されたテーマを選んでください。元ファイルを編集した場合は再度取り込んでください。自動同期はしません。");
        layout.addView(help);
        button(layout, "テーマファイルを選択（複数可）", FILES);
        button(layout, "画像素材付きのフォルダを選択", FOLDER);
        Button themes = new Button(this);
        themes.setText("取り込み済みテーマ一覧・削除");
        themes.setOnClickListener(v -> showImportedThemes());
        layout.addView(themes);
        status = new TextView(this);
        layout.addView(status);
        Button close = new Button(this);
        close.setText("閉じる");
        close.setOnClickListener(v -> finish());
        layout.addView(close);
        android.widget.ScrollView scroll = new android.widget.ScrollView(this);
        scroll.setFitsSystemWindows(true);
        scroll.addView(layout);
        HaiagaruUi.showModel(this, "カスタムテーマの取り込み", scroll);
        if (state == null && getIntent().getBooleanExtra("haiagaru.themes.list", false))
            getWindow().getDecorView().post(this::showImportedThemes);
    }

    private File themeRoot() throws IOException { return new File(HaiagaruSyncSnapshot.externalRoot(this), "theme"); }

    private void showImportedThemes() {
        if (busy) return;
        busy=true;
        status.setText("取り込み済みテーマを確認しています…");
        new Thread(() -> {
            try {
                List<ImportedThemes.Entry> entries;
                synchronized (IMPORT_LOCK) { entries=ImportedThemes.list(themeRoot()); }
                runOnUiThread(() -> {
                    busy=false;
                    if (isFinishing() || isDestroyed()) return;
                    status.setText("取り込み済みテーマ: "+entries.size()+"件");
                    if (entries.isEmpty()) {
                        new HaiagaruDialog.Builder(this).setTitle("取り込み済みテーマ")
                                .setMessage("取り込み済みの自作テーマはありません。標準テーマはこの一覧には含まれません。")
                                .setPositiveButton("閉じる",null).show();
                        return;
                    }
                    String[] labels=new String[entries.size()];
                    for (int i=0;i<labels.length;i++) labels[i]=entries.get(i).relativePath;
                    new HaiagaruDialog.Builder(this).setTitle("取り込み済みテーマ（"+entries.size()+"件）")
                            .setItems(labels,(dialog,index)->confirmDeleteTheme(entries.get(index)))
                            .setNegativeButton("閉じる",null).show();
                });
            } catch (Exception error) { showManagementFailure(error); }
        },"Haiagaru-theme-list").start();
    }

    private void confirmDeleteTheme(ImportedThemes.Entry entry) {
        new HaiagaruDialog.Builder(this).setTitle("このテーマを削除しますか？")
                .setMessage(entry.relativePath+"\n\n使用中の場合は、先に別のテーマへ切り替えてください。"
                        +"\nテーマファイルだけを削除し、画像素材と取り込み元のファイルは残します。"
                        +"\nこの削除は取り消せません。元ファイルがあれば再度取り込めます。"
                        +"\n削除後はChMateの「テーマの選択」を開き直してください。")
                .setNegativeButton("キャンセル",(dialog,which)->showImportedThemes())
                .setPositiveButton("削除",(dialog,which)->deleteTheme(entry)).show();
    }

    private void deleteTheme(ImportedThemes.Entry entry) {
        if (busy) return;
        busy=true;
        status.setText("テーマを削除しています…");
        new Thread(() -> {
            try {
                synchronized (IMPORT_LOCK) { ImportedThemes.delete(themeRoot(),entry); }
                runOnUiThread(() -> {
                    busy=false;
                    if (isFinishing() || isDestroyed()) return;
                    android.widget.Toast.makeText(this,"テーマを削除しました。画像素材は残しています。",android.widget.Toast.LENGTH_LONG).show();
                    showImportedThemes();
                });
            } catch (Exception error) { showManagementFailure(error); }
        },"Haiagaru-theme-delete").start();
    }

    private void showManagementFailure(Exception error) {
        runOnUiThread(() -> {
            busy=false;
            if (!isFinishing() && !isDestroyed()) status.setText("テーマの管理に失敗しました: "+error.getMessage());
        });
    }

    private void button(LinearLayout layout, String label, int request) {
        Button button = new Button(this);
        button.setText(label);
        button.setOnClickListener(v -> {
            if (busy) return;
            Intent intent = new Intent(request == FILES ? Intent.ACTION_OPEN_DOCUMENT : Intent.ACTION_OPEN_DOCUMENT_TREE);
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            if (request == FILES) {
                intent.addCategory(Intent.CATEGORY_OPENABLE);
                intent.setType("*/*");
                intent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true);
            }
            try { startActivityForResult(intent, request); }
            catch (Exception error) { status.setText("ファイル選択画面を開けませんでした"); }
        });
        layout.addView(button);
    }

    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if ((request != FILES && request != FOLDER) || result != RESULT_OK || data == null || busy) return;
        busy = true;
        status.setText("ファイルを確認しています…");
        new Thread(() -> {
            File directory = null;
            try {
                directory = File.createTempFile("theme-import-", "", getCacheDir());
                if (!directory.delete() || !directory.mkdir()) throw new IOException("一時フォルダを作成できません");
                Batch batch = new Batch(directory);
                String group = "取り込みテーマ";
                if (request == FOLDER) {
                    Uri tree = data.getData();
                    if (tree == null) throw new IOException("フォルダが選択されていません");
                    Uri document = DocumentsContract.buildDocumentUriUsingTree(tree, DocumentsContract.getTreeDocumentId(tree));
                    try (Cursor cursor = getContentResolver().query(document, new String[]{DocumentsContract.Document.COLUMN_DISPLAY_NAME}, null, null, null)) {
                        if (cursor != null && cursor.moveToFirst() && ThemeImportFiles.safeName(cursor.getString(0))) group = cursor.getString(0);
                    }
                    collect(tree, DocumentsContract.getTreeDocumentId(tree), "", batch, 0);
                } else {
                    ClipData clips = data.getClipData();
                    if (clips != null) {
                        if (clips.getItemCount() > 256) throw new IOException("一度に取り込めるのは256ファイルまでです");
                        for (int i = 0; i < clips.getItemCount(); i++) add(clips.getItemAt(i).getUri(), batch);
                    } else if (data.getData() != null) add(data.getData(), batch);
                }
                if (batch.themes == 0) throw new IOException("対応するテーマがありません。ファイル名とJSON形式を確認してください");
                prepareLayout(batch, group, request == FILES);
                File target = new File(HaiagaruSyncSnapshot.externalRoot(this), "theme");
                int existing = 0;
                for (String name : batch.names) if (ThemeImportFiles.child(target, name).exists()) existing++;
                final int conflicts = existing;
                final File ready = directory;
                runOnUiThread(() -> {
                    if (isFinishing() || isDestroyed()) { remove(ready); return; }
                    staged = ready;
                    new HaiagaruDialog.Builder(this).setTitle("テーマを取り込みますか？")
                            .setMessage("テーマ " + batch.themes + "件、素材 " + (batch.names.size() - batch.themes) + "件\n"
                                    + (conflicts == 0 ? "同名のファイルはありません。" : "同名の既存ファイル " + conflicts + "件を置き換えます。")
                                    + "\n選択元のファイルは変更しません。")
                            .setNegativeButton("キャンセル", (d, w) -> cancel(ready))
                            .setOnCancelListener(d -> cancel(ready))
                            .setPositiveButton(conflicts == 0 ? "取り込む" : "置き換えて取り込む", (d, w) -> install(batch, target))
                            .show();
                });
            } catch (Exception error) {
                remove(directory);
                showFailure(error);
            }
        }, "Haiagaru-theme-read").start();
    }

    private static void prepareLayout(Batch batch, String group, boolean filesOnly) throws IOException {
        // Native theme deletion removes the parent directory. Never install themes at theme/ itself.
        Set<String> themeFolders = new HashSet<>();
        for (String name : batch.names) {
            int slash = name.indexOf('/');
            if (slash >= 0 && ThemeImportFiles.theme(name.substring(slash + 1))) themeFolders.add(name.substring(0, slash));
        }
        File prepared = new File(batch.directory, ".prepared");
        if (!prepared.mkdir()) throw new IOException("取り込み用の配置を作成できません");
        List<String> names = new ArrayList<>();
        Set<String> unique = new HashSet<>();
        for (String name : batch.names) {
            int slash = name.indexOf('/');
            String destination;
            if (filesOnly) {
                destination = name.substring(0, name.length() - 4) + "/" + name;
            } else if (slash >= 0 && themeFolders.contains(name.substring(0, slash))) {
                destination = name;
            } else {
                destination = group + "/" + name;
            }
            if (!unique.add(destination)) throw new IOException("取り込み先のファイル名が重複しています");
            File target = ThemeImportFiles.child(prepared, destination);
            if (!target.getParentFile().isDirectory() && !target.getParentFile().mkdirs()) throw new IOException("取り込み用フォルダを作成できません");
            if (!ThemeImportFiles.child(batch.directory, name).renameTo(target)) throw new IOException("取り込み用の配置を作成できません");
            names.add(destination);
        }
        batch.names.clear();
        batch.names.addAll(names);
        batch.prepared = prepared;
    }

    private void add(Uri uri, Batch batch) throws Exception {
        try (Cursor cursor = getContentResolver().query(uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor == null || !cursor.moveToFirst()) throw new IOException("ファイル名を取得できません");
            String name = cursor.getString(0);
            if (!ThemeImportFiles.theme(name)) throw new IOException("対応していないテーマ名です: " + name);
            copy(uri, name, batch);
        }
    }

    private void collect(Uri tree, String id, String prefix, Batch batch, int depth) throws Exception {
        Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(tree, id);
        try (Cursor cursor = getContentResolver().query(children, new String[]{DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                DocumentsContract.Document.COLUMN_DISPLAY_NAME, DocumentsContract.Document.COLUMN_MIME_TYPE}, null, null, null)) {
            if (cursor == null) throw new IOException("フォルダを読み取れません");
            while (cursor.moveToNext()) {
                if (++batch.visited > 1024) throw new IOException("フォルダ内の項目が多すぎます。テーマだけのフォルダを選んでください");
                String childId = cursor.getString(0), name = cursor.getString(1);
                if (!ThemeImportFiles.safeName(name)) continue;
                if (DocumentsContract.Document.MIME_TYPE_DIR.equals(cursor.getString(2))) {
                    if (depth == 0) collect(tree, childId, name + "/", batch, 1);
                } else if (ThemeImportFiles.theme(name) || ThemeImportFiles.image(name)) {
                    copy(DocumentsContract.buildDocumentUriUsingTree(tree, childId), prefix + name, batch);
                }
            }
        }
    }

    private void copy(Uri uri, String relative, Batch batch) throws Exception {
        if (batch.names.size() >= 256 || !batch.unique.add(relative)) throw new IOException("ファイル数が多すぎるか同名ファイルが重複しています");
        boolean theme = ThemeImportFiles.theme(new File(relative).getName());
        File target = ThemeImportFiles.child(batch.directory, relative);
        File parent = target.getParentFile();
        if (!parent.isDirectory() && !parent.mkdirs()) throw new IOException("一時保存先を作成できません");
        long count = 0;
        try (InputStream input = getContentResolver().openInputStream(uri); FileOutputStream output = new FileOutputStream(target)) {
            if (input == null) throw new IOException("ファイルを開けません");
            byte[] buffer = new byte[8192];
            int size;
            while ((size = input.read(buffer)) != -1) {
                count += size;
                batch.bytes += size;
                if (count > (theme ? 2L : 16L) * 1024 * 1024 || batch.bytes > MAX_TOTAL) throw new IOException("ファイルが大きすぎます（テーマ2MiB・素材16MiB・合計64MiBまで）");
                output.write(buffer, 0, size);
            }
            output.getFD().sync();
        }
        if (theme) {
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            try (InputStream input = new FileInputStream(target)) {
                byte[] buffer = new byte[8192]; int size;
                while ((size = input.read(buffer)) != -1) bytes.write(buffer, 0, size);
            }
            String json = StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes.toByteArray())).toString();
            try { new JSONObject(json); }
            catch (org.json.JSONException invalid) {
                throw new IOException("テーマのJSON形式を確認してください: " + relative);
            }
            batch.themes++;
        } else {
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            BitmapFactory.decodeFile(target.getPath(), bounds);
            if (bounds.outWidth <= 0 || bounds.outHeight <= 0 || bounds.outWidth > 8192 || bounds.outHeight > 8192) throw new IOException("対応できない画像素材です: " + relative);
        }
        batch.names.add(relative);
    }

    private void install(Batch batch, File target) {
        staged = null;
        status.setText("取り込んでいます…");
        new Thread(() -> {
            try {
                synchronized (IMPORT_LOCK) { commit(batch, target); }
                runOnUiThread(() -> {
                    busy = false;
                    status.setText("テーマ " + batch.themes + "件を取り込みました。ChMateの「テーマの選択」を開き直して選んでください。");
                });
            } catch (Exception error) { showFailure(error); }
            finally { remove(batch.directory); }
        }, "Haiagaru-theme-install").start();
    }

    private static void commit(Batch batch, File root) throws IOException {
        if (!root.isDirectory() && !root.mkdirs()) throw new IOException("テーマ保存先を作成できません");
        // Stage replacements on the same filesystem, then rename. Keep originals until all renames succeed.
        File transaction = new File(root, ".import-" + java.util.UUID.randomUUID());
        if (!transaction.mkdir()) throw new IOException("保存用フォルダを作成できません");
        List<String> installed = new ArrayList<>(), originals = new ArrayList<>();
        boolean recovered = true;
        try {
            for (int i = 0; i < batch.names.size(); i++) {
                String name = batch.names.get(i);
                File destination = ThemeImportFiles.child(root, name);
                if (!destination.getParentFile().isDirectory() && !destination.getParentFile().mkdirs()) throw new IOException("保存先を作成できません");
                File fresh = new File(transaction, "new-" + i);
                try (InputStream input = new FileInputStream(ThemeImportFiles.child(batch.prepared == null ? batch.directory : batch.prepared, name)); FileOutputStream output = new FileOutputStream(fresh)) {
                    byte[] buffer = new byte[8192]; int size;
                    while ((size = input.read(buffer)) != -1) output.write(buffer, 0, size);
                    output.getFD().sync();
                }
                if (destination.exists()) {
                    if (!destination.isFile() || !destination.renameTo(new File(transaction, "old-" + i))) throw new IOException("既存ファイルを退避できません");
                    originals.add(name);
                }
                if (!fresh.renameTo(destination)) throw new IOException("テーマを保存できません");
                installed.add(name);
            }
        } catch (Exception error) {
            recovered = false;
            boolean restored = true;
            for (String name : installed) {
                File file = ThemeImportFiles.child(root, name);
                if (file.exists() && !file.delete()) restored = false;
            }
            for (String name : originals) {
                File old = new File(transaction, "old-" + batch.names.indexOf(name));
                if (!old.renameTo(ThemeImportFiles.child(root, name))) restored = false;
            }
            recovered = restored;
            if (!recovered) throw new IOException("復旧できなかったファイルを " + transaction.getName() + " に保管しました", error);
            throw new IOException("テーマの保存に失敗したため、変更を元に戻しました", error);
        } finally { if (recovered) remove(transaction); }
    }

    private void cancel(File directory) { staged = null; remove(directory); busy = false; status.setText("取り込みをキャンセルしました"); }
    private void showFailure(Exception error) {
        runOnUiThread(() -> { busy = false; if (!isFinishing() && !isDestroyed()) status.setText("取り込めませんでした: " + error.getMessage()); });
    }
    private static void remove(File file) {
        if (file == null) return;
        File[] children = file.listFiles();
        if (children != null) for (File child : children) remove(child);
        file.delete();
    }
    @Override protected void onDestroy() { remove(staged); super.onDestroy(); }
    private static final class Batch {
        final File directory;
        File prepared;
        final List<String> names = new ArrayList<>();
        final Set<String> unique = new HashSet<>();
        long bytes; int themes, visited;
        Batch(File directory) { this.directory = directory; }
    }
}
