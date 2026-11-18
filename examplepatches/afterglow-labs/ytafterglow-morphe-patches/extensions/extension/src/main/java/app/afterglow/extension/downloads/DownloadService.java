package app.afterglow.extension.downloads;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ServiceInfo;
import android.os.IBinder;
import android.os.PowerManager;

/** Foreground lifetime follows user-started queue work; relaunch recovery remains explicit. */
public final class DownloadService extends Service implements DownloadManager.Listener {
    private static final String CHANNEL="afterglow_downloads", PAUSE="afterglow.downloads.PAUSE", CANCEL="afterglow.downloads.CANCEL";
    private static final int NOTIFICATION=0x414744;
    private DownloadManager manager;
    private PowerManager.WakeLock wakeLock;
    private long lastWake;
    static void start(Context context) {context.startForegroundService(new Intent(context,DownloadService.class));}
    static void stop(Context context) {context.stopService(new Intent(context,DownloadService.class));}
    @Override public void onCreate() {
        super.onCreate();manager=DownloadManager.get(this);
        NotificationManager notifications=getSystemService(NotificationManager.class);
        notifications.createNotificationChannel(new NotificationChannel(CHANNEL,"Afterglow downloads",NotificationManager.IMPORTANCE_LOW));
        startForeground(NOTIFICATION,notification(null),ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC);
        try {
            PowerManager power=getSystemService(PowerManager.class);wakeLock=power.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK,getPackageName()+":AfterglowDownloads");wakeLock.setReferenceCounted(false);renewWake();
        }catch(Exception ignored) { /* A missing optional wake-lock permission cannot break downloads. */ }
        manager.addListener(this);
    }
    @Override public int onStartCommand(Intent intent,int flags,int startId) {
        if(intent!=null) {
            String id=intent.getStringExtra("job");
            if(PAUSE.equals(intent.getAction()))manager.pause(id);
            else if(CANCEL.equals(intent.getAction()))manager.cancel(id);
        }
        manager.serviceStarted();onDownloadsChanged();return START_NOT_STICKY;
    }
    @Override public IBinder onBind(Intent intent) {return null;}
    @Override public void onDownloadsChanged() {
        DownloadJob current=null;
        for(DownloadJob job:manager.snapshot())if(job.state==DownloadJob.State.RUNNING){current=job;break;}
        getSystemService(NotificationManager.class).notify(NOTIFICATION,notification(current));renewWake();
    }
    private void renewWake() {if(wakeLock!=null && System.currentTimeMillis()-lastWake>5*60*1000){wakeLock.acquire(10*60*1000L);lastWake=System.currentTimeMillis();}}
    private Notification notification(DownloadJob job) {
        Intent vault=new Intent().setClassName(this,"app.afterglow.extension.ui.VaultActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        PendingIntent open=PendingIntent.getActivity(this,NOTIFICATION,vault,PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE);
        Notification.Builder builder=new Notification.Builder(this,CHANNEL).setSmallIcon(android.R.drawable.stat_sys_download).setContentTitle(job==null?"Afterglow downloads":job.request.title)
            .setContentText(job==null?"Preparing download queue":label(job.phase)).setContentIntent(open).setOnlyAlertOnce(true).setOngoing(true).setCategory(Notification.CATEGORY_PROGRESS);
        if(job!=null) {
            builder.setProgress(100,job.progress<0?0:(int)(job.progress*100),job.progress<0);
            builder.addAction(new Notification.Action.Builder(null,"Pause",action(PAUSE,job.id,1)).build());
            builder.addAction(new Notification.Action.Builder(null,"Cancel",action(CANCEL,job.id,2)).build());
        }
        return builder.build();
    }
    private PendingIntent action(String action,String id,int code) {
        Intent intent=new Intent(this,DownloadService.class).setAction(action).putExtra("job",id);
        return PendingIntent.getService(this,code,intent,PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE);
    }
    private static String label(DownloadJob.Phase phase) {
        switch(phase) {case EXTRACTION:return "Preparing download";case VIDEO_TRANSFER:return "Downloading video";case AUDIO_TRANSFER:return "Downloading audio";case CAPTIONS_TRANSFER:return "Downloading captions";case THUMBNAIL_TRANSFER:return "Downloading thumbnail";case MUX:return "Combining media";case LIBRARY_MOVE:return "Saving to Vault";default:return "Downloading";}
    }
    @Override public void onTimeout(int startId,int foregroundServiceType) {manager.serviceTimedOut();stopForeground(STOP_FOREGROUND_REMOVE);stopSelf();}
    @Override public void onDestroy() {
        if(manager!=null){manager.removeListener(this);manager.serviceStopped();}
        if(wakeLock!=null && wakeLock.isHeld())wakeLock.release();stopForeground(STOP_FOREGROUND_REMOVE);super.onDestroy();
    }
}
