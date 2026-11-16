package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.SharedPreferences;
import android.widget.Toast;

/** Local one-time advice only; never enables backup or transfers data on its own. */
final class SettingsBackupIntroduction {
    static final String KEY="automaticBackupOfferedV1";
    static void offer(Activity activity,Runnable next){
        SharedPreferences prefs=activity.getSharedPreferences("haiagaru.settings-introduction",0);
        if(prefs.getBoolean(KEY,false)){next.run();return;}
        if(activity.isFinishing()||activity.isDestroyed())return;
        boolean[] selected={false};
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(activity).setTitle("自動定期バックアップのおすすめ")
                .setMessage("お気に入りや設定を守るため、自動定期バックアップをおすすめしています。保存先を選んで、対象・間隔を設定してください。\n\nローカルは指定フォルダ、MEGAはクラウドに保存します。自動実行はアプリを開いている間に確認します。選択だけでバックアップが有効になったり、データが送信されたりすることはありません。")
                .setPositiveButton("ローカル",(d,w)->{selected[0]=true;LocalAutoBackup.show(activity);})
                .setNeutralButton("MEGA",(d,w)->{selected[0]=true;openMega(activity);})
                .setNegativeButton("あとで",null).create();
        dialog.setOnDismissListener(d->{if(!selected[0]&&!activity.isFinishing()&&!activity.isDestroyed())next.run();});
        dialog.show();prefs.edit().putBoolean(KEY,true).apply();
    }
    static void openMega(Activity activity){
        if(HaiagaruMegaSync.enabled(activity))BackupSettingsActivity.open(activity,true);
        else Toast.makeText(activity,"MEGAバックアップには追加パッチの導入とAndroid 7.0以降が必要です。",Toast.LENGTH_LONG).show();
    }
    private SettingsBackupIntroduction(){}
}
