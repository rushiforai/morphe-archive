package app.morphe.extension.chmate;
import android.app.Activity;
import android.content.Intent;
import android.net.Uri;

/** One local introduction, independent of exported preferences and NG-sharing consent. */
final class SettingsSupport {
    static final String URL="https://jbbs.shitaraba.net/computer/45040/";
    static void offer(Activity activity,Runnable next){
        android.content.SharedPreferences prefs=activity.getSharedPreferences("haiagaru.settings-introduction",0);
        if(prefs.getBoolean("supportOffered",false)){next.run();return;}
        if(activity.isFinishing()||activity.isDestroyed())return;
        boolean[] opened={false};
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(activity).setTitle("Haiagaruのサポート板")
            .setMessage("不具合の報告や使い方の相談は、したらばのサポート板をご利用ください。")
            .setPositiveButton("サポート板を開く",(d,w)->{opened[0]=true;activity.startActivity(intent(activity));})
            .setNegativeButton("閉じる",null).create();
        dialog.setOnDismissListener(d->{if(!opened[0]&&!activity.isFinishing()&&!activity.isDestroyed())next.run();});
        dialog.show();prefs.edit().putBoolean("supportOffered",true).apply();
    }
    static Intent intent(Activity activity){return new Intent(Intent.ACTION_VIEW,Uri.parse(URL)).setClass(activity,OpenUrlActivity.class);}
    private SettingsSupport(){}
}
