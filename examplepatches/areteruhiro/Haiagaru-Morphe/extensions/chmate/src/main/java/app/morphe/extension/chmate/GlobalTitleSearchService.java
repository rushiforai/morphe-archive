package app.morphe.extension.chmate;

import android.app.*;
import android.content.*;
import android.os.*;
import java.io.*;
import java.util.*;
import java.util.concurrent.*;

/** Explicit, user-started foreground searches survive leaving the HOME screen. */
public final class GlobalTitleSearchService extends Service {
    static final String CHANNEL="haiagaru-global-title-search";
    private static final int FOREGROUND=0x484730;
    private static final ConcurrentMap<String,Job> JOBS=new ConcurrentHashMap<>();
    static final ExecutorService IO=Executors.newFixedThreadPool(2,r->{Thread t=new Thread(r,"Haiagaru-global-search");t.setDaemon(true);return t;});
    private final Handler main=new Handler(Looper.getMainLooper());
    private final Set<Job> owned=new HashSet<>();
    static final class Job {
        final String id=UUID.randomUUID().toString(),query;final Context context;
        final GlobalTitleSearch.Job request;
        volatile String text="",status="検索を開始しています";volatile boolean running=true,ready;
        private String primary="",external="",cached="";private boolean freshExternal;
        volatile boolean failed; volatile long updated=System.currentTimeMillis();
        Job(Context c,String q){context=c.getApplicationContext();query=q;request=new GlobalTitleSearch.Job(q,false);}
        GlobalSearchResults.Result result(){return new GlobalSearchResults.Result(id,query,text,updated,status,running);}
        synchronized void publish(String extra,String state){
            if(state.startsWith("標準"))primary=extra;
            else if(state.startsWith("取得済み"))cached=extra;
            else{external=extra;freshExternal=true;}
            text=GlobalSearchResults.merge(primary,freshExternal?external:cached);
            status=state;ready=true;updated=System.currentTimeMillis();
        }
    }
    static Job byId(String id){return id==null?null:JOBS.get(id);}
    static Job running(String query){for(Job j:JOBS.values())if(j.running&&j.query.equals(query))return j;return null;}
    static GlobalSearchResults.Result result(Context c,String id)throws IOException{
        Job j=JOBS.get(id);return j!=null?j.result():GlobalSearchResults.read(c,id);
    }
    static void launch(Activity a,String query){
        if(running(query)!=null){android.widget.Toast.makeText(a,"同じキーワードを検索中です。途中結果を開けます。",0).show();return;}
        Intent i=new Intent(a,GlobalTitleSearchService.class).putExtra("query",query);
        if(Build.VERSION.SDK_INT>=26)a.startForegroundService(i);else a.startService(i);
    }
    @Override public int onStartCommand(Intent i,int flags,int startId){
        if(i==null){stopSelf();return START_NOT_STICKY;}
        if("cancel".equals(i.getAction())){
            Job j=JOBS.get(i.getStringExtra("id"));if(j!=null){j.request.cancel();j.status="検索を停止しました";}update();return START_NOT_STICKY;
        }
        String q=i.getStringExtra("query");
        if(q==null||q.trim().isEmpty()||q.length()>512){stopSelf(startId);return START_NOT_STICKY;}
        if(running(q)!=null){update();return START_NOT_STICKY;}
        if(owned.size()>=2){android.widget.Toast.makeText(this,"同時検索は2件までです",0).show();update();return START_NOT_STICKY;}
        Job job=new Job(this,q);JOBS.put(job.id,job);owned.add(job);
        if(JOBS.size()>16)JOBS.values().removeIf(j->!j.running&&!owned.contains(j));
        foreground(job);
        IO.execute(()->{
            try{
                GlobalTitleSearch.background(this,job,(text,status)->{
                    if(job.request.stopped())return;
                    job.publish(text,status);main.post(()->{if(owned.contains(job)){notifyJob(job,false);GlobalSearchHome.refresh(job.query);}});
                });
                if(!job.request.stopped()){
                    if(!job.ready)throw new IOException("検索結果を取得できませんでした");
                    job.status=(job.failed?"一部の取得に失敗・":"検索完了・")+GlobalSearchResults.count(job.text)+"件";
                    if(job.ready&&GlobalSearchHome.history(this))GlobalSearchResults.save(this,new GlobalSearchResults.Result(job.id,job.query,job.text,job.updated,job.status,false));
                }
            }catch(Exception error){job.failed=true;job.status="検索できませんでした。途中結果 "+GlobalSearchResults.count(job.text)+"件";android.util.Log.w("HaiagaruSearch","Background title search failed",error);}
            finally{job.request.cancel();job.running=false;main.post(()->{owned.remove(job);notifyJob(job,true);GlobalSearchHome.refresh(job.query);update();});}
        });
        return START_NOT_STICKY;
    }
    private void foreground(Job job){
        NotificationManager manager=(NotificationManager)getSystemService(NOTIFICATION_SERVICE);
        if(Build.VERSION.SDK_INT>=26)manager.createNotificationChannel(new NotificationChannel(CHANNEL,"全板から検索",NotificationManager.IMPORTANCE_DEFAULT));
        Notification n=notification(job,false);
        if(Build.VERSION.SDK_INT>=29)startForeground(FOREGROUND,n,android.content.pm.ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC);else startForeground(FOREGROUND,n);
    }
    private int id(Job job){return 0x30000000|(job.id.hashCode()&0xfffffff);}
    private Notification notification(Job job,boolean completed){
        int immutable=PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE;
        PendingIntent open=PendingIntent.getActivity(this,id(job),GlobalSearchHome.intent(this,job.id),immutable);
        PendingIntent stop=PendingIntent.getService(this,id(job),new Intent(this,GlobalTitleSearchService.class).setAction("cancel").putExtra("id",job.id),immutable);
        Notification.Builder b=Build.VERSION.SDK_INT>=26?new Notification.Builder(this,CHANNEL):new Notification.Builder(this);
        b.setSmallIcon(android.R.drawable.ic_menu_search).setContentTitle((completed?"全板検索：":"検索中：")+job.query)
            .setContentText(job.status+(completed?"":GlobalSearchHome.partial(this)?"・タップで途中結果":"・完了後に表示できます")).setContentIntent(open).setOngoing(!completed).setAutoCancel(completed).setOnlyAlertOnce(!completed);
        if(!completed)b.addAction(android.R.drawable.ic_menu_close_clear_cancel,"停止",stop);
        return b.build();
    }
    private void notifyJob(Job job,boolean completed){
        try{((NotificationManager)getSystemService(NOTIFICATION_SERVICE)).notify(id(job),notification(job,completed));}catch(SecurityException unavailable){android.util.Log.w("HaiagaruSearch","Notification permission unavailable");}
    }
    private void update(){
        if(owned.isEmpty()){stopForeground(true);stopSelf();}
        else ((NotificationManager)getSystemService(NOTIFICATION_SERVICE)).notify(FOREGROUND,notification(owned.iterator().next(),false));
    }
    @Override public void onDestroy(){for(Job j:owned)j.request.cancel();super.onDestroy();}
    @Override public void onTimeout(int id,int type){for(Job j:owned)j.request.cancel();stopForeground(true);stopSelf();}
    @Override public IBinder onBind(Intent i){return null;}
}
