package app.morphe.extension.chmate;

import android.app.*;
import android.content.*;
import android.os.*;

/** Never terminates the app without a fresh, explicit confirmation. */
final class SettingsRestart {
    private static final java.util.WeakHashMap<Activity,HaiagaruDialog> OPEN=new java.util.WeakHashMap<>();
    static void confirm(Activity activity){
        confirm(activity,()->{});
    }
    static void confirm(Activity activity,Runnable deferred){
        if(activity.isFinishing()||activity.isDestroyed())return;
        HaiagaruDialog previous=OPEN.get(activity);if(previous!=null&&previous.isShowing())return;
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(activity).setTitle("変更の反映には再起動が必要です")
                .setMessage("今すぐChMateを再起動しますか？未保存の入力や実行中のアップロード・検索は中断されます。「あとで」を選んでも設定は保存され、次の起動時に反映されます。")
                .setNegativeButton("あとで",(d,w)->deferred.run()).setOnCancelListener(d->deferred.run())
                .setPositiveButton("今すぐ再起動",(d,w)->restart(activity)).create();
        OPEN.put(activity,dialog);dialog.setOnDismissListener(d->OPEN.remove(activity));dialog.show();
    }
    private static void restart(Activity activity){
        // Flush pending apply() writes before ending the process. Do not touch
        // credentials or user data; these empty commits are only write barriers.
        if(!android.preference.PreferenceManager.getDefaultSharedPreferences(activity).edit().commit()){
            android.widget.Toast.makeText(activity,"設定の保存を確認できません。再起動せず、後でもう一度お試しください",1).show();return;
        }
        for(String name:new String[]{WacchoiSearchOptions.PREFS,ToolbarIcons.PREFS,"haiagaru_response_actions"})
            if(!activity.getSharedPreferences(name,0).edit().commit()){
                android.widget.Toast.makeText(activity,"設定の保存を確認できません。再起動せず、後でもう一度お試しください",1).show();return;
            }
        Intent launch=new Intent().setClassName(activity.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity")
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TASK);
        try{
            Bundle options=null;
            if(Build.VERSION.SDK_INT>=35)options=ActivityOptions.makeBasic()
                    .setPendingIntentCreatorBackgroundActivityStartMode(ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOWED).toBundle();
            PendingIntent pending=PendingIntent.getActivity(activity,0x484147,launch,
                    PendingIntent.FLAG_CANCEL_CURRENT|PendingIntent.FLAG_IMMUTABLE,options);
            AlarmManager alarms=(AlarmManager)activity.getSystemService(Context.ALARM_SERVICE);
            if(alarms==null)throw new IllegalStateException("No alarm service");
            // No exact-alarm permission. The OS may defer reopening; settings
            // remain saved and the user can always reopen from the launcher.
            alarms.set(AlarmManager.ELAPSED_REALTIME, SystemClock.elapsedRealtime()+800,pending);
            android.widget.Toast.makeText(activity,"再起動します。自動で開かない場合はアプリアイコンから開いてください",1).show();
            activity.finishAffinity();
            new Handler(Looper.getMainLooper()).postDelayed(()->android.os.Process.killProcess(android.os.Process.myPid()),200);
        }catch(RuntimeException error){android.util.Log.w("Haiagaru","Unable to schedule restart",error);
            android.widget.Toast.makeText(activity,"自動再起動できませんでした。設定は保存済みです。後でアプリを再起動してください",1).show();}
    }
    private SettingsRestart(){}
}
