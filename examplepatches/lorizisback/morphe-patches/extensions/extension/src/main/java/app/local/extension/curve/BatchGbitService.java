package app.local.extension.curve;

import android.app.*;
import android.content.*;
import android.content.pm.ServiceInfo;
import android.os.*;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;

/** Explicitly started foreground operation. No automatic restart or financial retry. */
public final class BatchGbitService extends Service {
    static final Object LOCK=new Object();
    static volatile boolean running;
    private volatile boolean stop;
    private volatile int latestStartId;
    private ExecutorService executor;
    private PowerManager.WakeLock wakeLock;
    private long awakeUntil;
    private static final long MAX_BATCH_MILLIS=TimeUnit.MINUTES.toMillis(30);
    private static final int NOTICE=7241;
    private static final String CHANNEL="morphe_batch_gbit";
    @Override public void onCreate() {
        super.onCreate(); executor=Executors.newSingleThreadExecutor();
        getSystemService(NotificationManager.class).createNotificationChannel(new NotificationChannel(CHANNEL,"Batch Go Back in Time",NotificationManager.IMPORTANCE_LOW));
    }
    @Override public int onStartCommand(Intent intent,int flags,int startId) {
        latestStartId=startId;
        if(intent==null) { stopSelf(); return START_NOT_STICKY; }
        if("stop".equals(intent.getAction())) { stop=true; if(!running) stopSelf(); return START_NOT_STICKY; }
        synchronized(LOCK) { if(running) return START_NOT_STICKY; stop=false; running=true; }
        try { if(Build.VERSION.SDK_INT>=29) startForeground(NOTICE,notification(this,"Preparing batch",0,0,true,intent.getStringExtra("batch")),ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC); else startForeground(NOTICE,notification(this,"Preparing batch",0,0,true,intent.getStringExtra("batch"))); }
        catch(RuntimeException e) { running=false; stopSelf(); return START_NOT_STICKY; }
        executor.execute(()->runBatch(intent.getStringExtra("batch")));
        return START_NOT_STICKY;
    }
    private void runBatch(String id) {
        BatchStore store=new BatchStore(this); JSONObject batch=null;
        try {
            batch=store.read();
            if(batch==null || !batch.getString("id").equals(id) || !batch.getString("status").equals("ready")) return;
            acquireWakeLock();
            BatchRunner.run(batch,new BatchRunner.Transport() {
                public void account(String id) throws Exception { BatchCurve.account(id); }
                public void validate(JSONObject b,JSONObject row) throws Exception {
                    Object current=null;
                    for(Object tx:BatchCurve.history()) if(row.getString("id").equals(BatchCurve.call(tx,"getId"))) { current=tx; break; }
                    if(current==null || BatchCurve.call(current,"getGbitDate")!=null || BatchCurve.call(current,"getGbitOriginalCardId")!=null) throw new Exception("A purchase changed. Review your selection.");
                    JSONObject fresh=BatchCurve.quote(BatchCurve.option(BatchCurve.options(b.getString("account"),row.getString("id")),b.getString("card")));
                    if(!fresh.toString().equals(row.getJSONObject("quote").toString())) throw new Exception("Amounts or fees changed. Review your selection.");
                }
                public void move(JSONObject b,JSONObject row) throws Exception { BatchCurve.move(b.getString("account"),b.getString("card"),row.getString("id"),BatchGbitService.this::canSubmit); }
            },store::save,new BatchRunner.Control() {
                public boolean stopped() { return !canSubmit(); }
                public void progress(JSONObject b) throws Exception { publishStatus(BatchGbitService.this,b); }
            });
        } catch(Exception e) {
            if(batch!=null) try { batch.put("status","paused").put("message",e.getMessage()==null?"Batch stopped. Review before continuing.":e.getMessage()); store.save(batch); } catch(Exception ignored) { /* Existing journal remains the recovery authority. */ }
        } finally {
            releaseWakeLock();
            if(batch!=null) try { publishStatus(this,batch); } catch(Exception ignored) { }
            stopForeground(STOP_FOREGROUND_DETACH);
            synchronized(LOCK) { stopSelfResult(latestStartId); running=false; }
            try { BatchCurve.call(BatchCurve.resolve("com.curve.transactions.api.worker.LoadTransactionsWorker"),"invoke"); } catch(Exception ignored) { }
        }
    }
    private synchronized void acquireWakeLock() throws InterruptedException {
        if(stop || Thread.currentThread().isInterrupted()) throw new InterruptedException("Batch stopped before starting.");
        wakeLock=getSystemService(PowerManager.class).newWakeLock(PowerManager.PARTIAL_WAKE_LOCK,getPackageName()+":BatchGbit");
        wakeLock.setReferenceCounted(false);
        awakeUntil=SystemClock.elapsedRealtime()+MAX_BATCH_MILLIS;
        wakeLock.acquire(MAX_BATCH_MILLIS);
    }
    private synchronized boolean canSubmit() {
        return !stop && !Thread.currentThread().isInterrupted() && wakeLock!=null && wakeLock.isHeld() && SystemClock.elapsedRealtime()<awakeUntil;
    }
    private synchronized void releaseWakeLock() {
        if(wakeLock!=null && wakeLock.isHeld()) wakeLock.release();
        wakeLock=null;
    }
    static void publishStatus(Context context,JSONObject batch) throws JSONException {
        if(Build.VERSION.SDK_INT>=33 && context.checkSelfPermission(android.Manifest.permission.POST_NOTIFICATIONS)!=android.content.pm.PackageManager.PERMISSION_GRANTED) throw new IllegalStateException("Notification permission changed. Batch paused.");
        JSONArray rows=batch.getJSONArray("rows"); int done=0;
        for(int i=0;i<rows.length();i++) if(rows.getJSONObject(i).getString("state").equals("moved")) done++;
        String text=batch.getString("status").equals("running")?done+" of "+rows.length()+" moved":batch.getString("status").equals("complete")?"Batch complete: "+done+" moved":"Batch paused: "+done+" moved";
        NotificationManager manager=context.getSystemService(NotificationManager.class);
        manager.createNotificationChannel(new NotificationChannel(CHANNEL,"Batch Go Back in Time",NotificationManager.IMPORTANCE_LOW));
        manager.notify(NOTICE,notification(context,text,done,rows.length(),batch.getString("status").equals("running"),batch.getString("id")));
    }
    private static Notification notification(Context context,String text,int done,int total,boolean active,String batchId) {
        // This private activity participates in Curve's application-wide passcode lifecycle.
        Intent launch=new Intent(context,BatchGbitActivity.class).putExtra(BatchGbitActivity.EXTRA_BATCH_ID,batchId)
            .setData(new android.net.Uri.Builder().scheme("morphe-batch").authority("status").appendPath(batchId).build())
            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TOP);
        PendingIntent open=PendingIntent.getActivity(context,NOTICE,launch,PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE);
        Notification.Builder b=new Notification.Builder(context,CHANNEL).setSmallIcon(android.R.drawable.ic_popup_sync).setContentTitle("Batch Go Back in Time")
            .setContentText(text).setContentIntent(open).setOnlyAlertOnce(true).setOngoing(active).setVisibility(Notification.VISIBILITY_PRIVATE).setProgress(total,done,total==0);
        if(active) {
            PendingIntent cancel=PendingIntent.getService(context,NOTICE,new Intent(context,BatchGbitService.class).setAction("stop"),PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE);
            b.addAction(new Notification.Action.Builder(null,"Stop after current",cancel).build());
        }
        return b.build();
    }
    @Override public void onTimeout(int startId,int fgsType) { stop=true; executor.shutdownNow(); releaseWakeLock(); stopSelf(); }
    @Override public void onDestroy() { stop=true; executor.shutdownNow(); releaseWakeLock(); super.onDestroy(); }
    @Override public IBinder onBind(Intent intent) { return null; }
}
