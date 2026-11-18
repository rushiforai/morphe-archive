package nl.johninnl.velaprobe;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.provider.Settings;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicReference;

/** Test-only native fixture runner. Never broadcasts NAVIGATION_STATE or edits exporter state. */
public abstract class NativeProbe extends Instrumentation {
    static final double LATITUDE=38.5449, START_LONGITUDE=-121.7540, END_LONGITUDE=-121.7340;
    static final long SAMPLE_MS=2200;
    ClassLoader loader;
    Activity launchedActivity;
    Bundle arguments;
    final StringBuilder evidence=new StringBuilder();
    String feedClass;
    interface Work { void run() throws Exception; }
    abstract String provider();
    abstract String version();
    abstract void prepare() throws Exception;
    abstract void approach() throws Exception;
    abstract void active(int sample) throws Exception;
    abstract void alertsOnly() throws Exception;
    abstract void clear() throws Exception;
    abstract void stopProducer() throws Exception;
    abstract String[] expectedKinds();
    /** Optional immediate native callback contract check, distinct from sampled hold scenarios. */
    void callbacks() throws Exception { throw new UnsupportedOperationException("callbacks scenario is unavailable for "+provider()); }
    Class<?> type(String name) throws Exception { return Class.forName(name,true,loader); }
    Object call(Object value,String name,Class<?>[] parameters,Object...args) throws Exception {
        Method method=value.getClass().getMethod(name,parameters);method.setAccessible(true);return method.invoke(value,args);
    }
    Object declared(Object value,Class<?> owner,String name,Class<?>[] parameters,Object...args) throws Exception {
        Method method=owner.getDeclaredMethod(name,parameters);method.setAccessible(true);return method.invoke(value,args);
    }
    Object field(Object owner,String name) throws Exception {
        Class<?> cls=owner instanceof Class?(Class<?>)owner:owner.getClass();
        while(cls!=null){try{Field field=cls.getDeclaredField(name);field.setAccessible(true);return field.get(owner instanceof Class?null:owner);}catch(NoSuchFieldException e){cls=cls.getSuperclass();}}
        throw new NoSuchFieldException(name);
    }
    void main(Work work) throws Exception {
        AtomicReference<Throwable> error=new AtomicReference<>();
        runOnMainSync(()->{try{work.run();}catch(Throwable e){error.set(e);}});
        if(error.get()!=null)throw new RuntimeException(error.get());
    }
    void check(boolean good,String label){if(!good)throw new AssertionError(label);evidence.append("PASS ").append(label).append('\n');}
    void phase(String name) throws Exception {
        Bundle row=new Bundle();row.putString("phase",name);row.putString("provider",provider());
        row.putLong("elapsed_ms",SystemClock.elapsedRealtime());row.putString("stream","VELA_PROBE_PHASE "+provider()+" "+name+"\n");
        sendStatus(0,row);evidence.append("PHASE ").append(name).append('\n');
    }
    long option(String name,long fallback,long minimum){return Math.max(minimum,Long.parseLong(arguments.getString(name,String.valueOf(fallback))));}
    String option(String name,String fallback){return arguments.getString(name,fallback);}
    void background() throws Exception {
        main(()->getTargetContext().startActivity(new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)));
        SystemClock.sleep(SAMPLE_MS);
        check(launchedActivity!=null&&!launchedActivity.hasWindowFocus(),"provider Activity backgrounded");
        check(!Settings.canDrawOverlays(getTargetContext()),"overlay permission off");
    }
    /** Read-only snapshot for fixture assertions; this Intent is never sent. */
    Intent snapshot() throws Exception {
        long now=SystemClock.elapsedRealtime();Class<?> feed=type(feedClass);
        Object state=field(feed,"STATE"),alerts=field(feed,"ALERTS");
        Object snapshot=call(state,"snapshot",new Class<?>[]{long.class},now);
        String session=(String)field(feed,"SESSION");
        Method factory=type("nl.johninnl.navigation.NavigationProtocol").getMethod("snapshot",String.class,String.class,String.class,long.class,snapshot.getClass(),long.class);
        Intent intent=(Intent)factory.invoke(null,"read-only-test-snapshot",provider(),session,0L,snapshot,now);
        return (Intent)call(alerts,"append",new Class<?>[]{Intent.class,long.class},intent,now);
    }
    void assertPhase(String name) throws Exception {
        Intent current=snapshot();
        if(name.equals("approach")) {
            check("ahead".equals(current.getStringExtra("zone_approach_status")),"native pre-entry observation exported");
            check(!"active".equals(current.getStringExtra("zone_status")),"approach has no active partial average");
        } else if(name.equals("active")) {
            check("active".equals(current.getStringExtra("zone_status")),"native active-zone observation exported");
            check(current.getBooleanExtra("zone_average_partial",false),"observed zone average remains partial");
            check(current.hasExtra("zone_average_speed_kmh"),"observed average available after distance and time threshold");
        }
        if(name.equals("approach")||name.equals("active")||name.equals("alerts")) {
            String[] kinds=current.getStringArrayExtra("alert_kinds");
            check(kinds!=null&&Arrays.asList(kinds).containsAll(Arrays.asList(expectedKinds())),"native road report kinds exported");
            check("valid".equals(current.getStringExtra("current_speed_status")),"native current speed fresh");
            check("valid".equals(current.getStringExtra("road_speed_limit_status")),"native effective limit fresh");
        }
        if(name.equals("clear"))check(current.getStringArrayExtra("alert_ids")!=null&&current.getStringArrayExtra("alert_ids").length==0,"native repository empty-list clear exported");
        Bundle row=new Bundle();row.putString("provider",provider());row.putString("phase",name+"-verified");
        row.putString("zone_status",current.getStringExtra("zone_status"));row.putString("approach_status",current.getStringExtra("zone_approach_status"));
        row.putString("alerts_status",current.getStringExtra("alerts_status"));
        row.putDouble("current_speed_kmh",current.getDoubleExtra("current_speed_kmh",Double.NaN));
        row.putDouble("road_speed_limit_kmh",current.getDoubleExtra("road_speed_limit_kmh",Double.NaN));
        row.putDouble("zone_average_speed_kmh",current.getDoubleExtra("zone_average_speed_kmh",Double.NaN));
        row.putString("publisher_session_id",current.getStringExtra("publisher_session_id"));
        row.putString("stream","VELA_PROBE_VERIFIED "+provider()+" "+name+"\n");sendStatus(0,row);
    }
    void hold(String name) throws Exception {
        phase(name);long until=SystemClock.elapsedRealtime()+option("hold_ms",12000,6600);int sample=0;
        do { final int index=sample++;main(()->{
            if(name.equals("approach"))approach();else if(name.equals("active"))active(index);else if(name.equals("alerts"))alertsOnly();else clear();
        });SystemClock.sleep(SAMPLE_MS); } while(SystemClock.elapsedRealtime()<until);
        main(()->assertPhase(name));
    }
    @Override public void onCreate(Bundle args){super.onCreate(args);arguments=args==null?new Bundle():args;start();}
    @Override public void onStart(){Bundle result=new Bundle();try{
        loader=getTargetContext().getClassLoader();
        check(Build.VERSION.SDK_INT>=34,"sender identity sharing supported");
        check(version().equals(getTargetContext().getPackageManager().getPackageInfo(provider(),0).versionName),"exact native provider version");
        // Root coordinator verifies Vela installation; target UID visibility is not required to broadcast explicitly.
        prepare();
        check("app.vela".equals(type(feedClass).getMethod("receiverPackage").invoke(null)),"patched native feed explicitly targets app.vela");
        background();
        String scenario=option("scenario","drive");
        if(scenario.equals("callbacks"))callbacks();
        else if(scenario.equals("approach"))hold("approach");
        else if(scenario.equals("active")){hold("approach");hold("active");}
        else if(scenario.equals("alerts"))hold("alerts");
        else if(scenario.equals("clear"))hold("clear");
        else if(scenario.equals("stop")){hold("active");main(()->stopProducer());phase("stopped");SystemClock.sleep(SAMPLE_MS);}
        else if(scenario.equals("stale")){
            hold("active");phase("stale-wait");
            long age=snapshot().getLongExtra("zone_updated_elapsed_ms",-1);
            SystemClock.sleep(option("stale_wait_ms",96000,31000));
            main(()->{Intent stale=snapshot();check(stale.getLongExtra("zone_updated_elapsed_ms",-2)==age,"idle publication does not refresh zone observation");check("stale".equals(stale.getStringExtra("alerts_status")),"native report list expires without new bus observations");});
            phase("stale-verified");
        } else if(scenario.equals("drive")){hold("approach");hold("active");hold("alerts");hold("clear");}
        else throw new IllegalArgumentException("scenario must be callbacks, drive, approach, active, alerts, clear, stop or stale");
        long finalHold=option("final_hold_ms",0,0);if(finalHold>0){phase("final-hold");SystemClock.sleep(finalHold);}
        if(option("end_action","leave").equals("stop")){main(()->stopProducer());phase("stopped");SystemClock.sleep(SAMPLE_MS);}
        result.putString("stream",evidence.toString());finish(Activity.RESULT_OK,result);
    }catch(Throwable error){result.putString("stream",evidence+android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,result);}}
}
