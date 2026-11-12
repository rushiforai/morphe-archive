package app.morphe.extension.chmate;

import android.content.*;
import android.widget.Toast;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;

/** Sends only explicit exclusion saves, with durable retries and bounded batches. */
final class SharedNgReporterFeedback {
    static final String PREFS="haiagaru.shared-ng-feedback";
    private static final Object LOCK=new Object();
    private static final ScheduledExecutorService IO=Executors.newSingleThreadScheduledExecutor();
    interface Sender { JSONObject post(String endpoint,JSONObject body)throws Exception; }
    private static volatile Sender sender=(endpoint,body)->SharedNg.request("POST",endpoint,body);
    private static Context context;private static ScheduledFuture<?> task;
    static synchronized void initialize(Context source){
        if(context!=null)return;context=source.getApplicationContext();schedule(20000);
    }
    private static SharedPreferences prefs(){return context.getSharedPreferences(PREFS,0);}
    private static SharedNgFeedbackState read(SharedPreferences p,String key){return new SharedNgFeedbackState(p.getStringSet("desired."+key,Collections.emptySet()),p.getStringSet("pending."+key,Collections.emptySet()),p.getLong("revision."+key,0));}
    private static void write(SharedPreferences p,String key,SharedNgFeedbackState state){
        if(!p.edit().putStringSet("desired."+key,state.desired).putStringSet("pending."+key,state.pending).putLong("revision."+key,state.revision).commit())throw new IllegalStateException("除外情報の送信待ちを保存できません");
    }
    static void saved(Context source,Set<String> ignored){
        initialize(source);
        try{String key=PersonalNgSubmissions.hash(SharedNg.endpoint());synchronized(LOCK){SharedPreferences p=prefs();write(p,key,read(p,key).saved(ignored,System.currentTimeMillis()));p.edit().putLong("retry."+key,0).apply();}schedule(1000);}
        catch(Exception error){Toast.makeText(source,"端末内の除外は保存しましたが、共有除外の送信待ちを保存できませんでした",Toast.LENGTH_LONG).show();}
    }
    private static synchronized void schedule(long delay){if(task!=null)task.cancel(false);task=IO.schedule(SharedNgReporterFeedback::flush,Math.max(1000,delay),TimeUnit.MILLISECONDS);}
    private static void flush(){
        String key=null;
        try{
            final String endpoint=SharedNg.endpoint();key=PersonalNgSubmissions.hash(endpoint);SharedPreferences p=prefs();JSONArray batch;
            synchronized(LOCK){SharedNgFeedbackState current=read(p,key);if(current.pending.isEmpty())return;long wait=p.getLong("retry."+key,0)-System.currentTimeMillis();if(wait>0){schedule(wait);return;}batch=current.batch();}
            JSONObject request=PersonalNgSubmissions.requestIdentity("exclusions");if(!request.has("deviceKey"))throw new IllegalStateException("送信元の登録を待っています");
            if(!endpoint.equals(SharedNg.endpoint()))return;
            JSONObject answer=sender.post(endpoint,request.put("operations",batch));if(!answer.optBoolean("ok"))throw new IllegalStateException("除外情報の送信を再試行します");
            synchronized(LOCK){SharedNgFeedbackState next=read(p,key).acknowledged(batch,answer.getJSONArray("ack"));write(p,key,next);p.edit().putLong("retry."+key,0).putString("status","除外情報を送信しました").apply();if(!next.pending.isEmpty())schedule(1000);}
        }catch(Exception error){
            if(key!=null)prefs().edit().putLong("retry."+key,System.currentTimeMillis()+15*60*1000).putString("status","除外情報を送信待ちとして保存しています").apply();schedule(15*60*1000);
        }
    }
    private SharedNgReporterFeedback(){}
}
