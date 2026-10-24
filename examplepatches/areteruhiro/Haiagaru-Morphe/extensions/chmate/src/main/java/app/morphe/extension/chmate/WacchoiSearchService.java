package app.morphe.extension.chmate;

import android.app.*;
import android.content.*;
import android.os.*;
import java.util.*;

/** A user-started search, independent of the search screen's lifecycle. */
public final class WacchoiSearchService extends Service {
    private static final String CHANNEL="haiagaru-wacchoi-search";
    private static final int NOTIFICATION=0x484704;
    static final String JOB_ID="haiagaru.searchJobId";
    private static final LinkedHashMap<String,WacchoiBackgroundJob> JOBS=new LinkedHashMap<>();
    static volatile WacchoiBackgroundJob current;
    private WacchoiBackgroundJob owned;
    private final Handler main=new Handler(Looper.getMainLooper());
    static synchronized WacchoiBackgroundJob get(String id){return id==null?null:JOBS.get(id);}
    static synchronized Map<String,WacchoiBackgroundJob> jobs(){return new LinkedHashMap<>(JOBS);}
    private int runningCount(){int count=0;for(WacchoiBackgroundJob job:jobs().values())if(job.running)count++;return count;}
    static void launch(android.app.Activity activity,Intent args) {
        args.setClass(activity,WacchoiSearchService.class);
        if(Build.VERSION.SDK_INT>=26)activity.startForegroundService(args);else activity.startService(args);
    }
    @Override public int onStartCommand(Intent intent,int flags,int startId) {
        if(intent==null){stopSelf();return START_NOT_STICKY;}
        String id=intent.getStringExtra(JOB_ID);
        WacchoiBackgroundJob selected=get(id);
        if("stop".equals(intent.getAction())){
            if(selected!=null)selected.cancel();else if(id==null)for(WacchoiBackgroundJob job:jobs().values())if(job.running)job.cancel();
            owned=current;foreground();update();return START_NOT_STICKY;
        }
        if("resume".equals(intent.getAction())) {
            owned=selected;foreground();
            if(selected!=null&&!selected.running&&selected.canResume()&&runningCount()<3){current=selected;selected.setListener(()->main.post(this::update));selected.resume();}
            update();return START_NOT_STICKY;
        }
        if(selected!=null||runningCount()>=3){owned=current;foreground();update();return START_NOT_STICKY;}
        if(id==null){id=UUID.randomUUID().toString();intent.putExtra(JOB_ID,id);}
        owned=new WacchoiBackgroundJob(this,()->main.post(this::update));current=owned;
        synchronized(WacchoiSearchService.class){
            if(JOBS.size()>=16){Iterator<Map.Entry<String,WacchoiBackgroundJob>> it=JOBS.entrySet().iterator();while(it.hasNext()&&JOBS.size()>=16){WacchoiBackgroundJob old=it.next().getValue();if(!old.running){old.release();it.remove();}}}
            JOBS.put(id,owned);
        }
        owned.rememberArguments(intent);foreground();owned.start(intent);return START_NOT_STICKY;
    }
    private void foreground(){
        NotificationManager manager=(NotificationManager)getSystemService(NOTIFICATION_SERVICE);
        if(Build.VERSION.SDK_INT>=26)manager.createNotificationChannel(new NotificationChannel(CHANNEL,"ワッチョイ4桁検索",NotificationManager.IMPORTANCE_LOW));
        if(Build.VERSION.SDK_INT>=29)startForeground(NOTIFICATION,notification(),android.content.pm.ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC);
        else startForeground(NOTIFICATION,notification());
    }
    private Notification notification(){
        int flags=PendingIntent.FLAG_UPDATE_CURRENT;
        if(Build.VERSION.SDK_INT>=23)flags|=PendingIntent.FLAG_IMMUTABLE;
        Intent returnToSearch=WacchoiSearchState.notificationArguments(owned==null?null:owned.searchArguments())
                .setClass(this,HissiWacchoiSearchActivity.class);
        PendingIntent open=PendingIntent.getActivity(this,NOTIFICATION,returnToSearch,flags);
        PendingIntent stop=PendingIntent.getService(this,NOTIFICATION,new Intent(this,WacchoiSearchService.class).setAction("stop"),flags);
        Notification.Builder builder=Build.VERSION.SDK_INT>=26?new Notification.Builder(this,CHANNEL):new Notification.Builder(this);
        boolean running=runningCount()>0;
        return builder.setSmallIcon(android.R.drawable.ic_menu_search).setContentTitle(running?"投稿を走査中（"+runningCount()+"件）":"投稿の走査結果")
                .setContentText(owned==null?"開始しています":owned.status).setContentIntent(open)
                .setOngoing(running).setAutoCancel(!running).addAction(android.R.drawable.ic_menu_close_clear_cancel,"すべて停止",stop).build();
    }
    private void update(){
        if(owned==null){if(runningCount()==0){stopForeground(true);stopSelf();}return;}
        if(runningCount()>0){((NotificationManager)getSystemService(NOTIFICATION_SERVICE)).notify(NOTIFICATION,notification());}
        else {stopForeground(true);((NotificationManager)getSystemService(NOTIFICATION_SERVICE)).notify(NOTIFICATION,notification());stopSelf();}
    }
    @Override public void onTimeout(int startId,int fgsType){for(WacchoiBackgroundJob job:jobs().values())if(job.running)job.cancel();stopForeground(true);stopSelf();}
    @Override public void onDestroy(){
        main.removeCallbacksAndMessages(null);
        for(WacchoiBackgroundJob job:jobs().values()){job.setListener(()->{});if(job.running)job.cancel();}
        super.onDestroy();
    }
    @Override public IBinder onBind(Intent intent){return null;}
}
