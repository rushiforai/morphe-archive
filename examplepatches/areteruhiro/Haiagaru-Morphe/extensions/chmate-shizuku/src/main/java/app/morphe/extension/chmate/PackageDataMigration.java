package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import android.util.Log;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Locale;

import rikka.shizuku.Shizuku;

/** UI and client side of the optional Shizuku data migration. */
public final class PackageDataMigration {
    private static final String LOG_TAG = "HaiagaruMigration";
    private static final String LEGACY_EXTERNAL_DATA =
            "/storage/emulated/0/Android/data/jp.co.airfront.android.a2chMate";
    private static final int PERMISSION_REQUEST = 0x4841;

    private static final java.util.Map<Button,String> SOURCES=new java.util.WeakHashMap<>();

    private PackageDataMigration() {
    }

    public static void addControl(Activity activity, LinearLayout layout) {

        TextView description = new TextView(activity);
        description.setText(text(
                "chmate本来のバックアップ/復元を推奨しています。",
                "Using ChMate's built-in backup/restore is recommended."
        ));
        description.setTextSize(13);
        LinearLayout.LayoutParams descriptionParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        descriptionParams.topMargin = dp(activity, 20);
        layout.addView(description, descriptionParams);

        Button button = new Button(activity);
        button.setAllCaps(false);
        resetButton(button);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        params.topMargin = dp(activity, 8);
        layout.addView(button, params);
        button.setOnClickListener(view -> chooseSource(activity, button));
    }

    private static void chooseSource(Activity activity,Button button){
        android.widget.EditText input=new android.widget.EditText(activity);input.setSingleLine(true);
        input.setText(activity.getSharedPreferences("haiagaru.migration",0).getString("sourcePackage",originalPackageName()));
        input.setHint("移行元のパッケージ名");
        android.app.AlertDialog dialog=new android.app.AlertDialog.Builder(activity).setTitle("Shizukuでデータフォルダを移行")
            .setMessage("移行元のパッケージ名を指定してください。Android/data/パッケージ名/files/2chMate 内のフォルダ・ファイルを個別または全て選んで移行します。アプリ専用の内部設定領域は対象外です。")
            .setView(input).setNegativeButton("キャンセル",null).setPositiveButton("フォルダを確認",null).create();
        dialog.setOnShowListener(d->dialog.getButton(-1).setOnClickListener(v->{
            String name=input.getText().toString().trim();
            if(!name.matches("[A-Za-z][A-Za-z0-9_]*(?:\\.[A-Za-z0-9_]+)+")||name.equals(activity.getPackageName())){input.setError("移行元の別アプリのパッケージ名を入力してください");return;}
            SOURCES.put(button,name);activity.getSharedPreferences("haiagaru.migration",0).edit().putString("sourcePackage",name).apply();dialog.dismiss();requestMigration(activity,button);
        }));dialog.show();
    }

    private static void requestMigration(Activity activity, Button button) {
        if (!Shizuku.pingBinder()) {
            showMessage(activity, "Shizukuを起動してください", "Start Shizuku first");
            return;
        }
        if (Shizuku.getVersion() < 13) {
            showMessage(activity, "Shizukuを更新してください", "Update Shizuku first");
            return;
        }
        if (Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED) {
            bindMigrationService(activity, button);
            return;
        }
        if (Shizuku.shouldShowRequestPermissionRationale()) {
            showMessage(activity, "Shizuku権限が拒否されています", "Shizuku permission was denied");
            return;
        }

        final Shizuku.OnRequestPermissionResultListener[] listener =
                new Shizuku.OnRequestPermissionResultListener[1];
        listener[0] = (requestCode, grantResult) -> {
            if (requestCode != PERMISSION_REQUEST) return;
            Shizuku.removeRequestPermissionResultListener(listener[0]);
            if (grantResult == PackageManager.PERMISSION_GRANTED) {
                bindMigrationService(activity, button);
            } else {
                showMessage(
                        activity,
                        "Shizuku権限がありません",
                        "Shizuku permission was not granted"
                );
            }
        };
        Shizuku.addRequestPermissionResultListener(listener[0]);
        Shizuku.requestPermission(PERMISSION_REQUEST);
    }

    private static void bindMigrationService(Activity activity, Button button) {
        File externalFiles = activity.getExternalFilesDir(null);
        File targetRoot = externalFiles == null ? null : externalFiles.getParentFile();
        if (targetRoot == null) {
            showFailure(activity, button, null);
            return;
        }

        button.setEnabled(false);
        button.setText(text("移行中…", "Importing..."));
        Shizuku.UserServiceArgs serviceArgs = new Shizuku.UserServiceArgs(
                new ComponentName(activity, LegacyDataMigrationService.class)
        )
                .processNameSuffix("haiagaru_migration")
                .tag("haiagaru-data-migration")
                .version(2)
                .daemon(false);

        ServiceConnection connection = new ServiceConnection() {
            @Override
            public void onServiceConnected(ComponentName name, IBinder binder) {
                new Thread(() -> {
                    try {
                        ILegacyDataMigrationService service=ILegacyDataMigrationService.Stub.asInterface(binder);
                        service.selectSourcePackage(SOURCES.get(button));
                        String[] children=service.listChildren("");java.util.Arrays.sort(children);
                        String[] labels=children.clone();for(int i=0;i<labels.length;i++)if(service.isDirectory(children[i]))labels[i]+="/";
                        ServiceConnection connection=this;
                        activity.runOnUiThread(()->chooseItems(activity,button,service,serviceArgs,connection,targetRoot,children,labels));
                    } catch(Throwable error){showFailure(activity,button,error);unbind(serviceArgs,this);}
                },"Haiagaru-migration-list").start();
            }

            @Override
            public void onServiceDisconnected(ComponentName name) {
            }
        };

        try {
            Shizuku.bindUserService(serviceArgs, connection);
        } catch (Throwable error) {
            showFailure(activity, button, error);
        }
    }

    private static void unbind(Shizuku.UserServiceArgs args,ServiceConnection connection){
        try{Shizuku.unbindUserService(args,connection,true);}catch(Throwable e){Log.w(LOG_TAG,"Unable to stop migration service",e);}
    }
    private static void chooseItems(Activity activity,Button button,ILegacyDataMigrationService service,Shizuku.UserServiceArgs args,ServiceConnection connection,File targetRoot,String[] children,String[] labels){
        if(activity.isFinishing()||activity.isDestroyed()){unbind(args,connection);return;}
        boolean[] selected=new boolean[children.length];
        android.app.AlertDialog dialog=new android.app.AlertDialog.Builder(activity).setTitle("移行するフォルダ・ファイルを選択")
            .setMultiChoiceItems(labels,selected,(d,i,value)->selected[i]=value)
            .setNegativeButton("キャンセル",(d,w)->{button.setEnabled(true);resetButton(button);unbind(args,connection);})
            .setOnCancelListener(d->{button.setEnabled(true);resetButton(button);unbind(args,connection);})
            .setNeutralButton("すべて選択",null).setPositiveButton("選択した項目を移行",null).create();
        dialog.setOnShowListener(d->{
            dialog.getButton(-3).setOnClickListener(v->{boolean all=true;for(boolean value:selected)all&=value;java.util.Arrays.fill(selected,!all);for(int i=0;i<selected.length;i++)dialog.getListView().setItemChecked(i,!all);dialog.getButton(-3).setText(all?"すべて選択":"すべて解除");});
            dialog.getButton(-1).setOnClickListener(v->{
                java.util.ArrayList<String> paths=new java.util.ArrayList<>();for(int i=0;i<children.length;i++)if(selected[i])paths.add(children[i]);
                if(paths.isEmpty()){Toast.makeText(activity,"移行する項目を選択してください",Toast.LENGTH_LONG).show();return;}
                dialog.dismiss();
                new android.app.AlertDialog.Builder(activity).setTitle("選択したデータを上書き移行")
                    .setMessage("移行元: "+SOURCES.get(button)+"\n対象: "+android.text.TextUtils.join("、",paths)+"\n\n同じ保存先のファイルは移行元の内容で上書きします。選択していない項目と移行元は変更しません。移行元のChMateを閉じ、移行後はHaiagaruを再起動してください。")
                    .setNegativeButton("キャンセル",(x,w)->{button.setEnabled(true);resetButton(button);unbind(args,connection);})
                    .setOnCancelListener(x->{button.setEnabled(true);resetButton(button);unbind(args,connection);})
                    .setPositiveButton("上書き移行",(x,w)->new Thread(()->{
                        long[] copied={0};
                        try{service.repairDestinationOwnership(targetRoot.getAbsolutePath());
                            File destination=new File(targetRoot,"files/2chMate").getCanonicalFile();
                            for(String path:paths)copyRecursively(service,path,destination,copied);
                            activity.runOnUiThread(()->{button.setEnabled(true);resetButton(button);if(activity.isFinishing()||activity.isDestroyed()){Toast.makeText(activity.getApplicationContext(),"データ移行が完了しました。ChMateを再起動してください",Toast.LENGTH_LONG).show();return;}new android.app.AlertDialog.Builder(activity).setTitle("移行完了").setMessage(copied[0]+"ファイルを移行しました。再起動すると反映します。")
                                .setPositiveButton("再起動",(a,b)->restart(activity)).setNegativeButton("後で",null).show();});
                        }catch(Throwable error){showFailure(activity,button,error);}finally{unbind(args,connection);}
                    },"Haiagaru-data-migration").start()).show();
            });
        });dialog.show();
    }

    private static void copyRecursively(
            ILegacyDataMigrationService service,
            String relativePath,
            File destinationRoot,
            long[] copiedFiles
    ) throws Exception {
        if (service.isDirectory(relativePath)) {
            File directory = resolveDestination(destinationRoot, relativePath);
            if (!directory.isDirectory() && !directory.mkdirs()) {
                throw new IOException("Unable to create " + directory);
            }
            for (String child : service.listChildren(relativePath)) {
                if (child == null || child.isEmpty() || child.equals(".") || child.equals("..")
                        || child.contains("/") || child.contains("\\")) {
                    throw new SecurityException("Unexpected source entry name");
                }
                String childPath = relativePath.isEmpty() ? child : relativePath + "/" + child;
                copyRecursively(service, childPath, destinationRoot, copiedFiles);
            }
            directory.setLastModified(service.lastModified(relativePath));
            return;
        }

        File destination = resolveDestination(destinationRoot, relativePath);
        File parent = destination.getParentFile();
        if (parent != null && !parent.isDirectory() && !parent.mkdirs()) {
            throw new IOException("Unable to create " + parent);
        }
        ParcelFileDescriptor descriptor = service.openFile(relativePath);
        if(descriptor==null)throw new IOException("Unable to open "+relativePath);
        long expected=descriptor.getStatSize(),counted=0;
        android.util.AtomicFile atomic=new android.util.AtomicFile(destination);FileOutputStream raw=null;
        try(BufferedInputStream input=new BufferedInputStream(new ParcelFileDescriptor.AutoCloseInputStream(descriptor))){
            raw=atomic.startWrite();BufferedOutputStream output=new BufferedOutputStream(raw);byte[] buffer=new byte[65536];int count;
            while((count=input.read(buffer))!=-1){output.write(buffer,0,count);counted+=count;}
            output.flush();if(expected>=0&&counted!=expected)throw new IOException("Source changed while copying");
            atomic.finishWrite(raw);raw=null;
        }catch(Throwable error){if(raw!=null)atomic.failWrite(raw);throw error;}
        destination.setLastModified(service.lastModified(relativePath));
        copiedFiles[0]++;
    }

    private static File resolveDestination(File root, String relativePath) throws IOException {
        File destination = relativePath.isEmpty()
                ? root
                : new File(root, relativePath).getCanonicalFile();
        String rootPrefix = root.getPath() + File.separator;
        if (!destination.getPath().equals(root.getPath())
                && !destination.getPath().startsWith(rootPrefix)) {
            throw new SecurityException("Unexpected migration destination");
        }
        return destination;
    }

    private static void showFailure(Activity activity, Button button, Throwable error) {
        if (error != null) Log.e(LOG_TAG, "Legacy external-data migration failed", error);
        activity.runOnUiThread(() -> {
            button.setEnabled(true);
            resetButton(button);
            showMessage(activity, "データ移行に失敗しました。一部は移行済みの場合があります。元データを確認して再度実行してください", "Data import failed. Some files may already have been copied; check the source and retry.");
        });
    }

    private static void resetButton(Button button) {
        button.setText(text(
                "データフォルダを選んで移行 (Shizuku)",
                "Import old ChMate shared data (Shizuku)"
        ));
    }

    private static void restart(Activity activity) {
        Intent intent = new Intent();
        intent.setClassName(activity.getPackageName(), "jp.syoboi.a2chMate.activity.HomeActivity");
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        activity.startActivity(intent);
        new Handler(Looper.getMainLooper()).postDelayed(
                () -> Process.killProcess(Process.myPid()),
                200
        );
    }

    private static void showMessage(Activity activity, String japanese, String english) {
        Toast.makeText(activity, text(japanese, english), Toast.LENGTH_LONG).show();
    }

    private static String text(String japanese, String english) {
        return Locale.JAPANESE.getLanguage().equals(Locale.getDefault().getLanguage())
                ? japanese
                : english;
    }

    private static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    private static String originalPackageName() {
        return new StringBuilder("jp.co.airfront.android.a2ch")
                .append("Mate")
                .toString();
    }
}
