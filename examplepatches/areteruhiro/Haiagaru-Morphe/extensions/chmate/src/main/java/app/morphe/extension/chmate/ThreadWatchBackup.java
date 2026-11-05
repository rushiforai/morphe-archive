package app.morphe.extension.chmate;

import android.app.NotificationManager;
import android.app.job.JobScheduler;
import android.content.Context;
import android.content.SharedPreferences;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.IOException;
import java.util.*;

/** Settings backup contains subscriptions and counts, never notification bodies or operation tokens. */
final class ThreadWatchBackup {
    static final String KEY="threadNotifications";
    static JSONObject capture(Context context) throws Exception {
        synchronized(ThreadWatch.LOCK){
            JSONArray threads=new JSONArray();
            SharedPreferences prefs=ThreadWatch.prefs(context);
            for(String url:new TreeSet<>(prefs.getAll().keySet())){
                ThreadWatchRules.Target target=ThreadWatchRules.target(url);
                if(target==null)continue;
                JSONObject item=new JSONObject(prefs.getString(url,"{}"));
                threads.put(new JSONObject().put("url",target.url).put("count",item.optInt("count",-1))
                        .put("repliesOnly",item.optBoolean("repliesOnly",false)).put("stopAfterReply",item.optBoolean("stopAfterReply",false))
                        .put("paused",item.optBoolean("paused",false)).put("own",item.optJSONArray("own")==null?new JSONArray():item.getJSONArray("own"))
                        .put("durationMinutes",item.optInt("durationMinutes",0)).put("expiresAt",item.optLong("expiresAt",0))
                        .put("pauseReason",item.optString("pauseReason")).put("title",item.optString("title")));
            }
            JSONObject data=new JSONObject().put("intervalMinutes",ThreadWatch.interval(context)).put("threads",threads)
                .put("durationMinutes",ThreadWatchManagement.defaultDuration(context));
            validate(data);return data;
        }
    }
    static void validate(JSONObject data) throws Exception {
        if(data==null)throw new IOException("通知設定の形式が不正です");
        integer(data,"intervalMinutes",1,10080);
        if(data.has("durationMinutes"))integer(data,"durationMinutes",0,43200);
        JSONArray threads=data.optJSONArray("threads");
        if(threads==null||threads.length()>100)throw new IOException("通知登録は100件までです");
        Set<String> urls=new HashSet<>();
        for(int i=0;i<threads.length();i++){
            JSONObject item=threads.optJSONObject(i);
            if(item==null)throw new IOException("通知登録の形式が不正です");
            Object value=item.opt("url");
            ThreadWatchRules.Target target=value instanceof String&&((String)value).length()<=2048
                    ?ThreadWatchRules.target((String)value):null;
            if(target==null||!urls.add(target.url))throw new IOException("通知登録のURLが不正または重複しています");
            integer(item,"count",-1,9_999_999);
            if(item.has("durationMinutes"))integer(item,"durationMinutes",0,43200);
            if(item.has("expiresAt")){
                Object deadline=item.opt("expiresAt");
                if(!(deadline instanceof Integer)&&!(deadline instanceof Long)||((Number)deadline).longValue()<0)throw new IOException("通知期限が不正です");
            }
            for(String key:new String[]{"title","pauseReason"})if(item.has(key)&&(!(item.opt(key) instanceof String)||item.getString(key).length()>4096))throw new IOException("通知登録の表示情報が不正です");
            for(String flag:new String[]{"repliesOnly","stopAfterReply","paused"})if(item.has(flag)&&!(item.opt(flag) instanceof Boolean))throw new IOException("通知設定のスイッチが不正です");
            if(item.has("own")){
                JSONArray own=item.optJSONArray("own");if(own==null||own.length()>1000)throw new IOException("自分の書き込み番号の形式が不正です");
                for(int j=0;j<own.length();j++){Object no=own.opt(j);if(!(no instanceof Integer)&&!(no instanceof Long)||((Number)no).longValue()<1||((Number)no).longValue()>9_999_999)throw new IOException("自分の書き込み番号が不正です");}
            }
        }
    }
    private static int integer(JSONObject data,String key,int min,int max)throws IOException{
        Object value=data.opt(key);
        if(!(value instanceof Integer)&&!(value instanceof Long))throw new IOException("通知設定の数値が不正です");
        long number=((Number)value).longValue();
        if(number<min||number>max)throw new IOException("通知設定の数値が範囲外です");
        return (int)number;
    }
    static void restore(Context context,JSONObject data,boolean merge)throws Exception{
        if(data==null)return; // Older backups must keep subscriptions on this device.
        validate(data);
        boolean reschedule;
        synchronized(ThreadWatch.LOCK){
            SharedPreferences prefs=ThreadWatch.prefs(context);
            Set<String> previous=new HashSet<>(prefs.getAll().keySet());
            Set<String> combined=merge?new HashSet<>(previous):new HashSet<>();
            JSONArray threads=data.getJSONArray("threads");
            for(int i=0;i<threads.length();i++)combined.add(ThreadWatchRules.target(threads.getJSONObject(i).getString("url")).url);
            if(combined.size()>100)throw new IOException("通知登録の合計が100件を超えます");
            SharedPreferences.Editor editor=prefs.edit();
            boolean registrationsChanged=!merge;
            if(!merge)editor.clear();
            for(int i=0;i<threads.length();i++){
                JSONObject item=threads.getJSONObject(i);
                String url=ThreadWatchRules.target(item.getString("url")).url;
                if(merge&&prefs.contains(url))continue;
                registrationsChanged=true;
                // In-flight checks from before restore cannot overwrite the restored count.
                editor.putString(url,new JSONObject().put("count",item.getInt("count"))
                        .put("token",UUID.randomUUID().toString()).put("repliesOnly",item.optBoolean("repliesOnly",false))
                        .put("stopAfterReply",item.optBoolean("stopAfterReply",false)).put("paused",item.optBoolean("paused",false))
                        .put("own",item.optJSONArray("own")==null?new JSONArray():item.getJSONArray("own"))
                        .put("durationMinutes",item.optInt("durationMinutes",0)).put("expiresAt",item.optLong("expiresAt",0))
                        .put("pauseReason",item.optString("pauseReason")).put("title",item.optString("title")).toString());
            }
            if(registrationsChanged&&!editor.commit())throw new IOException("通知登録を復元できません");
            SharedPreferences options=context.getSharedPreferences(ThreadWatch.PREFS+"_options",0);
            boolean restoreInterval=!merge||!options.contains("minutes");
            if(restoreInterval&&!options.edit()
                    .putInt("minutes",data.getInt("intervalMinutes")).commit())throw new IOException("通知間隔を復元できません");
            if(data.has("durationMinutes")&&(!merge||!options.contains("durationMinutes"))&&!options.edit()
                    .putInt("durationMinutes",data.getInt("durationMinutes")).commit())throw new IOException("通知期限を復元できません");
            reschedule=registrationsChanged||restoreInterval;
            if(!merge){
                NotificationManager notifications=(NotificationManager)context.getSystemService(Context.NOTIFICATION_SERVICE);
                if(notifications!=null)for(String url:previous)notifications.cancel(url,ThreadWatch.JOB);
            }
        }
        if(!reschedule)return;
        JobScheduler jobs=(JobScheduler)context.getSystemService(Context.JOB_SCHEDULER_SERVICE);
        if(jobs!=null)jobs.cancel(ThreadWatch.JOB);
        ThreadWatch.schedule(context);
    }
    private ThreadWatchBackup(){}
}
