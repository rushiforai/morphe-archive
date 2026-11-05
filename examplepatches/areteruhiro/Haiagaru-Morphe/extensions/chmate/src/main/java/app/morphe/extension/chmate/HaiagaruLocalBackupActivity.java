package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import android.widget.Toast;

import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/** Android document-picker transport for the same validated snapshot used by MEGA. */
public final class HaiagaruLocalBackupActivity extends HaiagaruComposeActivity {
    public static final String EXTRA_MODE = "haiagaru.backup.mode";
    public static final String EXTRA_CATEGORIES = "haiagaru.backup.categories";
    public static final String EXTRA_CHOOSE_OTHER_LOCATION = "haiagaru.backup.otherLocation";
    public static final int MODE_SAVE = 1;
    public static final int MODE_OPEN = 2;
    public static final int MODE_FOLDER = 3;
    public static final int MODE_IMPORT_ARCHIVE = 4;
    public static final int MODE_IMPORT_ARCHIVE_ZIP = 5;
    private static final int REQUEST_DOCUMENT = 1;
    private int mode;
    private int categories;
    private boolean pickerStarted;
    private HaiagaruBackupArchive.Backup openedBackup;
    private HaiagaruDialog progress;
    private BackupProgress notification;
    private ArchiveZipSource archiveZip;
    private File archiveZipFile;
    private Uri archiveImportUri;
    private boolean archiveCopyStarted;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        mode = getIntent().getIntExtra(EXTRA_MODE, 0);
        categories = getIntent().getIntExtra(EXTRA_CATEGORIES, HaiagaruSyncSnapshot.DEFAULT)
                & HaiagaruSyncSnapshot.ALL;
        pickerStarted = state != null && state.getBoolean("pickerStarted", false);
        if (mode != MODE_SAVE && mode != MODE_OPEN && mode != MODE_FOLDER && mode != MODE_IMPORT_ARCHIVE && mode != MODE_IMPORT_ARCHIVE_ZIP) {
            finish();
            return;
        }
        if((mode==MODE_IMPORT_ARCHIVE||mode==MODE_IMPORT_ARCHIVE_ZIP)&&state!=null&&state.getString("archiveImportUri")!=null){
            if(state.getBoolean("archiveCopyStarted",false)){finish();return;}
            openArchiveFolder(Uri.parse(state.getString("archiveImportUri")));return;
        }
        if (!pickerStarted && mode == MODE_OPEN && getIntent().getData() != null) {
            pickerStarted = true;
            open(getIntent().getData());
        } else if (!pickerStarted) launchPicker();
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        state.putBoolean("pickerStarted", pickerStarted);
        if(archiveImportUri!=null)state.putString("archiveImportUri",archiveImportUri.toString());
        state.putBoolean("archiveCopyStarted",archiveCopyStarted);
        super.onSaveInstanceState(state);
    }

    private void launchPicker() {
        if(mode==MODE_IMPORT_ARCHIVE){
            try{pickerStarted=true;startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE)
                    .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_PREFIX_URI_PERMISSION),REQUEST_DOCUMENT);}
            catch(Exception e){showError("フォルダ選択画面を開けませんでした");}return;
        }
        if(mode==MODE_FOLDER){
            try{pickerStarted=true;Intent folder=new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE)
                    .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                            |Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION|Intent.FLAG_GRANT_PREFIX_URI_PERMISSION);
                if(android.os.Build.VERSION.SDK_INT>=26&&!getIntent().getBooleanExtra(EXTRA_CHOOSE_OTHER_LOCATION,false)){Uri initial=LocalAutoBackup.folderHint(this);
                    if(initial!=null)folder.putExtra(android.provider.DocumentsContract.EXTRA_INITIAL_URI,initial);}
                startActivityForResult(folder,REQUEST_DOCUMENT);}
            catch(Exception e){showError("フォルダ選択画面を開けませんでした");}return;
        }
        Intent picker = new Intent(mode == MODE_SAVE
                ? Intent.ACTION_CREATE_DOCUMENT : Intent.ACTION_OPEN_DOCUMENT);
        picker.addCategory(Intent.CATEGORY_OPENABLE);
        picker.setType("application/zip");
        if (mode == MODE_SAVE) {
            picker.putExtra(Intent.EXTRA_TITLE, "haiagaru-backup-" +
                    BackupTime.filename(System.currentTimeMillis()) + ".zip");
        } else {
            picker.setType("*/*");
            picker.putExtra(Intent.EXTRA_MIME_TYPES, new String[]{"application/zip", "application/x-zip-compressed", "application/json", "text/plain", "application/octet-stream"});
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
        if(mode==MODE_FOLDER){
            try{if(!android.provider.DocumentsContract.isTreeUri(uri))throw new IOException("フォルダを選択してください");
                getContentResolver().takePersistableUriPermission(uri,data.getFlags()&(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_WRITE_URI_PERMISSION));
                LocalAutoBackup.setFolder(this,uri);Toast.makeText(this,"自動バックアップの保存先を設定しました",Toast.LENGTH_LONG).show();finish();}
            catch(Exception e){showError("保存先のアクセス権を保持できませんでした");}
        }
        else if(mode==MODE_IMPORT_ARCHIVE||mode==MODE_IMPORT_ARCHIVE_ZIP) openArchiveFolder(uri);
        else if (mode == MODE_SAVE) save(uri);
        else open(uri);
    }

    private void openArchiveFolder(Uri uri){
        archiveImportUri=uri;
        run(null,()->{
            final ArchiveFolderTransfer.Source source;final String root;
            if(mode==MODE_IMPORT_ARCHIVE){
                if(!android.provider.DocumentsContract.isTreeUri(uri))throw new IOException("フォルダを選択してください");
                source=new NativeArchiveFolderImport.Tree(this,uri);root=android.provider.DocumentsContract.getTreeDocumentId(uri);
            }else{
                archiveZipFile=HaiagaruBackupArchive.temporary(this);
                try(InputStream in=getContentResolver().openInputStream(uri);OutputStream out=new FileOutputStream(archiveZipFile)){
                    if(in==null)throw new IOException("ZIPを開けません");HaiagaruBackupArchive.copy(in,out);
                }
                archiveZip=new ArchiveZipSource(archiveZipFile);source=archiveZip;root="";
            }
            phase("アーカイブの内容を確認しています…");ArchiveFolderTransfer.Plan plan=ArchiveFolderTransfer.scan(source,root);
            runOnUiThread(()->{
                if(isFinishing()||isDestroyed())return;
                java.util.LinkedHashSet<String> groups=new java.util.LinkedHashSet<>();for(ArchiveFolderTransfer.Entry e:plan.entries)groups.add(e.path.split("/",2)[0]);
                String[] names=groups.toArray(new String[0]);boolean[] selected=new boolean[names.length];
                android.app.AlertDialog choose=new android.app.AlertDialog.Builder(this).setTitle("取り込むフォルダ・ファイルを選択")
                    .setMultiChoiceItems(names,selected,(d,i,value)->selected[i]=value)
                    .setNegativeButton("キャンセル",(d,w)->finish()).setOnCancelListener(d->finish()).setNeutralButton("すべて選択",null).setPositiveButton("内容を確認",null).create();
                choose.setOnShowListener(d->{
                    choose.getButton(-3).setOnClickListener(v->{boolean all=true;for(boolean value:selected)all&=value;java.util.Arrays.fill(selected,!all);for(int i=0;i<names.length;i++)choose.getListView().setItemChecked(i,!all);choose.getButton(-3).setText(all?"すべて選択":"すべて解除");});
                    choose.getButton(-1).setOnClickListener(v->{java.util.Set<String> picked=new java.util.HashSet<>();for(int i=0;i<names.length;i++)if(selected[i])picked.add(names[i]);
                        ArchiveFolderTransfer.Plan chosen=ArchiveFolderTransfer.select(plan,picked);if(chosen.entries.isEmpty()){Toast.makeText(this,"取り込む項目を選択してください",Toast.LENGTH_LONG).show();return;}
                        choose.dismiss();new HaiagaruDialog.Builder(this).setTitle("選択したアーカイブを上書き復元")
                            .setMessage(chosen.threads+"件のDATと関連IDXを取り込みます。同名ファイルは上書きします。選択していない項目と元データは変更しません。完了後、標準のスレッドアーカイブ一覧を開き直してください。")
                            .setNegativeButton("キャンセル",(x,w)->finish()).setOnCancelListener(x->finish())
                            .setPositiveButton("上書きして取り込む",(x,w)->{archiveCopyStarted=true;run("アーカイブを取り込みました。一覧を開き直してください",()->{
                                try{phase("アーカイブをコピーしています…");ArchiveFolderTransfer.restore(source,chosen,ArchiveOrigins.archiveRoot(this));}
                                finally{closeArchiveZip();}
                            });}).show();
                    });
                });choose.show();
            });
        });
    }

    private void closeArchiveZip(){
        if(archiveZip!=null)try{archiveZip.close();}catch(IOException ignored){}
        if(archiveZipFile!=null)archiveZipFile.delete();
    }

    private void save(Uri uri) {
        if (categories == 0) {
            showError("バックアップする項目が選ばれていません");
            return;
        }
        run("端末のファイルにバックアップしました", () -> {
            File snapshot = HaiagaruBackupArchive.capture(getApplicationContext(), categories);
            try {
                phase("バックアップを保存しています…");
                BackupDocuments.save(this, snapshot, uri,
                        () -> phase("保存したバックアップを確認しています…"));
            } finally { snapshot.delete(); }
        });
    }

    private void open(Uri uri) {
        run(null, () -> {
            File temporary = HaiagaruBackupArchive.temporary(this);
            boolean transferred = false;
            try (InputStream input = getContentResolver().openInputStream(uri);
                 OutputStream output = new FileOutputStream(temporary)) {
                if (input == null) throw new IOException("ファイルを開けませんでした");
                HaiagaruBackupArchive.copy(input, output);
                transferred = true;
            } finally { if (!transferred) temporary.delete(); }
            HaiagaruBackupArchive.Backup backup = HaiagaruBackupArchive.read(this, temporary);
            runOnUiThread(() -> {
                if (isFinishing() || isDestroyed()) backup.close();
                else {
                    openedBackup = backup;
                    // Restore the selection saved in this backup, not this device's current save options.
                    categories = backup.snapshot.optInt("categories", 0) & HaiagaruSyncSnapshot.ALL;
                    confirmRestore(backup);
                }
            });
        });
    }

    private void confirmRestore(HaiagaruBackupArchive.Backup backup) {
        JSONObject snapshot = backup.snapshot;
        int available = snapshot.optInt("categories", 0) & HaiagaruSyncSnapshot.ALL;
        if(available==0){showError("復元できる項目がありません");return;}
        int[] bits = HaiagaruMegaSync.CATEGORY_BITS;
        String[] names = HaiagaruMegaSync.CATEGORY_NAMES.clone();
        boolean[] selected = new boolean[bits.length];
        for (int index = 0; index < bits.length; index++) {
            boolean present = (available & bits[index]) != 0;
            names[index] += present ? "" : "（バックアップに含まれません）";
            selected[index] = present && (categories & bits[index]) != 0;
        }
        String summary;
        try {
            summary = HaiagaruMegaSync.buildChangeSummary(getApplicationContext(), snapshot, available);
        } catch (Exception error) {
            showError("変更内容を確認できませんでした");
            return;
        }
        new HaiagaruDialog.Builder(this).setTitle("端末のバックアップから復元")
                .setMultiChoiceItems(names, selected, (dialog, index, checked) ->
                        selected[index] = checked && (available & bits[index]) != 0)
                .setNegativeButton("キャンセル", (dialog, which) -> finish())
                .setNeutralButton("内容・注意事項", (d, w) -> {
                    int selectedFlags=0;
                    for(int i=0;i<bits.length;i++)if(selected[i])selectedFlags|=bits[i];
                    categories=selectedFlags;
                    new HaiagaruDialog.Builder(this)
                        .setMessage("復元前に現在のデータをアプリ内へ退避します。\n" + summary + "\n" + HaiagaruBackupSecrets.WARNING)
                        .setPositiveButton("項目選択に戻る", (info, chosen) -> confirmRestore(backup))
                        .setOnCancelListener(info -> finish()).show();
                })
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
                    HaiagaruMegaSync.confirmSensitive(this, chosen, () -> {
                    openedBackup = null; // Worker owns the temporary file from here.
                    run("復元しました。ChMateを再起動してください", () -> {
                        try (HaiagaruBackupArchive.Backup owned = backup) {
                            HaiagaruBackupArchive.restore(getApplicationContext(), backup, chosen, false);
                        }
                    });
                    }, this::finish);
                })
                .setOnCancelListener(dialog -> finish()).show();
    }

    private void phase(String text) {
        BackupProgress current = notification;
        if (current != null) current.update(text, false);
        runOnUiThread(() -> {
            if (progress != null && !isFinishing() && !isDestroyed()) progress.setMessage(text);
        });
    }

    private void run(String success, Operation operation) {
        final BackupProgress operationNotification = new BackupProgress(this,
                mode == MODE_SAVE ? "ローカルバックアップ" : "バックアップの読み込み・復元");
        notification = operationNotification;
        progress = HaiagaruDialog.progress(this, "処理を準備しています…");
        progress.setMessage(mode == MODE_SAVE ? "バックアップを作成しています…\n完了するまで保存先が0MBと表示される場合があります。" : "バックアップを読み込んでいます…");
        progress.setCancelable(false);
        progress.show();
        new Thread(() -> {
            try {
                operation.perform();
                if (success != null) operationNotification.update(success, true);
                else operationNotification.dismiss();
                runOnUiThread(this::hideProgress);
                if (success != null) runOnUiThread(() -> {
                    Toast.makeText(this, success, Toast.LENGTH_LONG).show();
                    finish();
                });
            } catch (Exception error) {
                operationNotification.update("処理に失敗しました。アプリでエラーを確認してください", true);
                android.util.Log.e("HaiagaruLocalBackup", "Backup operation failed (mode=" + mode + ")", error);
                runOnUiThread(() -> {
                    hideProgress();
                    if (!isFinishing() && !isDestroyed()) showError(error instanceof IOException
                            ? error.getMessage() : "バックアップを処理できませんでした");
                });
            }
        }, "Haiagaru-local-backup").start();
    }

    private void hideProgress() {
        if (progress != null) { progress.dismiss(); progress = null; }
    }

    private void showError(String message) {
        new HaiagaruDialog.Builder(this).setTitle("バックアップを処理できませんでした")
                .setMessage(message).setPositiveButton("閉じる", (dialog, which) -> finish())
                .setOnCancelListener(dialog -> finish()).show();
    }

    @Override protected void onDestroy() {
        hideProgress();
        if (openedBackup != null) { openedBackup.close(); openedBackup = null; }
        if(!archiveCopyStarted)closeArchiveZip();
        super.onDestroy();
    }

    private interface Operation { void perform() throws Exception; }
}
