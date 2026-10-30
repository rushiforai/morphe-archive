// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.app.AppOpsManager;
import android.app.usage.UsageEvents;
import android.app.usage.UsageStatsManager;
import android.content.Context;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.os.UserManager;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;

/** Opt-in caller owns lifecycle. Reads Usage Access only; never requests or grants it. */
public final class DiLink51Monitor {
    public interface Listener {void onState(ClusterThemeState.Snapshot snapshot);}
    private static final long OVERLAP=2000,RESYNC=60000,MAX_CONFIDENCE=65000,CLOCK_BACKWARD_TOLERANCE=50;
    private static final int SCAN_LIMIT=100000,ACCEPTED_LIMIT=8192;
    private final Context context;private final Listener listener;
    interface Clock {long wall();long elapsed();}
    private final Handler main;private final ScheduledExecutorService worker;private final Clock clock;
    private final AtomicLong generation=new AtomicLong();private volatile boolean running,closed;
    private ScheduledFuture<?> task;
    // The following fields belong exclusively to the one worker.
    private long workerEpoch=Long.MIN_VALUE,lastWall=-1,lastElapsed=-1,since,nextResync,positiveAt=-1;
    private boolean bootstrap=true;private ClusterThemeState state=new ClusterThemeState();
    private Method instanceGetter;private boolean getterChecked;
    public DiLink51Monitor(Context context,Listener listener){
        this(context,listener,new Clock(){public long wall(){return System.currentTimeMillis();}public long elapsed(){return SystemClock.elapsedRealtime();}},
            Executors.newSingleThreadScheduledExecutor(r->{Thread thread=new Thread(r,"MapsClusterTheme");thread.setDaemon(true);return thread;}),new Handler(Looper.getMainLooper()));
    }
    // Package-private dependencies make actual lifecycle/query boundaries testable without Android/device I/O.
    DiLink51Monitor(Context context,Listener listener,Clock clock,ScheduledExecutorService worker,Handler main){
        if(context==null||listener==null)throw new IllegalArgumentException("Missing cluster monitor dependency");
        if(clock==null||worker==null||main==null)throw new IllegalArgumentException("Missing cluster monitor executor");
        Context app=context.getApplicationContext();this.context=app==null?context:app;this.listener=listener;this.clock=clock;this.worker=worker;this.main=main;
    }
    public synchronized void start(){
        if(closed||running)return;running=true;long epoch=generation.incrementAndGet();deliver(epoch,ClusterThemeState.unknown("starting"),true);
        task=worker.scheduleWithFixedDelay(()->poll(epoch),0,500,TimeUnit.MILLISECONDS);
    }
    public synchronized void stop(){
        if(closed)return;
        running=false;long epoch=generation.incrementAndGet();if(task!=null){task.cancel(false);task=null;}
        deliver(epoch,ClusterThemeState.unknown("stopped"),false);
    }
    /** Terminal disposal when the host drops this monitor. No final callback can outlive disposal. */
    public synchronized void close(){
        if(closed)return;
        closed=true;running=false;generation.incrementAndGet();
        if(task!=null){task.cancel(true);task=null;}
        worker.shutdownNow();
    }
    /** Real permission check belongs to a worker; accidental UI callers fail closed without Binder. */
    public static boolean hasAccess(Context context){
        if(context==null||Looper.myLooper()==Looper.getMainLooper())return false;
        try{AppOpsManager manager=context.getSystemService(AppOpsManager.class);return manager!=null&&manager.checkOpNoThrow(AppOpsManager.OPSTR_GET_USAGE_STATS,Process.myUid(),context.getPackageName())==AppOpsManager.MODE_ALLOWED;}
        catch(RuntimeException unavailable){return false;}
    }
    private boolean active(long epoch){return !closed&&running&&generation.get()==epoch;}
    private void deliver(long epoch,ClusterThemeState.Snapshot snapshot,boolean expectedRunning){
        main.post(()->{if(!closed&&generation.get()==epoch&&running==expectedRunning)listener.onState(snapshot);});
    }
    private static long boot(long wall,long elapsed){return Math.max(0,wall-elapsed);}
    private void invalidate(String reason,long wall,long elapsed){state=new ClusterThemeState();state.clear(reason);bootstrap=true;since=boot(wall,elapsed);positiveAt=-1;nextResync=0;}
    private static final class Record {
        final String pkg,cls;final int id,type;final long time;
        Record(String pkg,String cls,int id,int type,long time){this.pkg=pkg;this.cls=cls;this.id=id;this.type=type;this.time=time;}
    }
    private int instance(UsageEvents.Event event){
        if(!getterChecked){getterChecked=true;try{instanceGetter=UsageEvents.Event.class.getMethod("getInstanceId");}catch(ReflectiveOperationException|SecurityException|LinkageError unavailable){instanceGetter=null;}}
        if(instanceGetter!=null)try{Object value=instanceGetter.invoke(event);if(value instanceof Integer)return (Integer)value;instanceGetter=null;throw new MonitorFailure("instance_access_changed");}
        catch(ReflectiveOperationException|RuntimeException|LinkageError unavailable){instanceGetter=null;throw new MonitorFailure("instance_access_changed");}
        return 0;
    }
    private void poll(long epoch){
        if(!active(epoch))return;long wall=clock.wall(),elapsed=clock.elapsed();
        if(workerEpoch!=epoch){workerEpoch=epoch;lastWall=-1;lastElapsed=-1;invalidate("starting",wall,elapsed);}
        try{
            if(!DiLink51Profile.supported(Build.FINGERPRINT)){invalidate("unsupported_firmware",wall,elapsed);deliver(epoch,state.snapshot(),true);return;}
            if(lastWall>=0){
                long wallDelta=wall-lastWall,elapsedDelta=elapsed-lastElapsed,correction=wallDelta-elapsedDelta;
                if(wall<lastWall||elapsed<lastElapsed||correction < -CLOCK_BACKWARD_TOLERANCE||Math.abs(correction)>OVERLAP)invalidate("clock_changed",wall,elapsed);
            }
            lastWall=wall;lastElapsed=elapsed;
            if(!hasAccess(context)){invalidate("usage_access_missing",wall,elapsed);deliver(epoch,state.snapshot(),true);return;}
            UserManager user=context.getSystemService(UserManager.class);
            if(user==null||!user.isUserUnlocked()){invalidate("user_locked",wall,elapsed);deliver(epoch,state.snapshot(),true);return;}
            boolean replay=bootstrap||elapsed>=nextResync;
            long begin=replay?boot(wall,elapsed):Math.max(boot(wall,elapsed),since);
            if(begin>wall)throw new MonitorFailure("clock_changed");
            UsageStatsManager manager=context.getSystemService(UsageStatsManager.class);
            if(manager==null)throw new MonitorFailure("usage_service_missing");
            UsageEvents events=manager.queryEvents(begin,wall);
            if(events==null)throw new MonitorFailure("usage_events_unavailable");
            ArrayList<Record> records=new ArrayList<>();UsageEvents.Event event=new UsageEvents.Event();int scanned=0;
            while(events.hasNextEvent()){
                if(++scanned>SCAN_LIMIT||!active(epoch))throw new MonitorFailure("query_incomplete");
                if(!events.getNextEvent(event))throw new MonitorFailure("query_incomplete");
                int type=event.getEventType();boolean reset=type==26||type==27;
                String pkg=event.getPackageName(),cls=event.getClassName();
                if(!reset&&(!ClusterThemeState.accepted(pkg,cls)||(type!=1&&type!=23)))continue;
                long time=event.getTimeStamp();if(time<begin||time>=wall)continue;
                if(records.size()>=ACCEPTED_LIMIT)throw new MonitorFailure("event_capacity");
                records.add(new Record(reset?null:pkg,reset?null:cls,reset?0:instance(event),type,time));
            }
            if(!active(epoch))return;
            if(!hasAccess(context)||!user.isUserUnlocked())throw new MonitorFailure("usage_access_changed");
            Collections.sort(records,Comparator.comparingLong(record->record.time));
            ClusterThemeState candidate=replay?new ClusterThemeState():state;
            for(Record record:records)candidate.event(record.pkg,record.cls,record.id,record.type,record.time);
            state=candidate;bootstrap=false;since=Math.max(boot(wall,elapsed),wall-OVERLAP);
            if(replay)nextResync=elapsed+RESYNC;
            boolean stock=false;for(Record record:records)if(record.type==1||record.type==23){stock=true;break;}
            if(stock)positiveAt=elapsed;
            ClusterThemeState.Snapshot snapshot=state.snapshot();
            if(snapshot.reliable&&(positiveAt<0||elapsed-positiveAt>MAX_CONFIDENCE)){invalidate("usage_history_stale",wall,elapsed);snapshot=state.snapshot();}
            deliver(epoch,snapshot,true);
        }catch(RuntimeException unavailable){if(active(epoch)){String reason=unavailable instanceof MonitorFailure?((MonitorFailure)unavailable).reason:"usage_query_failed";invalidate(reason,wall,elapsed);deliver(epoch,state.snapshot(),true);}}
    }
    private static final class MonitorFailure extends RuntimeException {final String reason;MonitorFailure(String reason){this.reason=reason;}}
}
