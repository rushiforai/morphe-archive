package local.maps.cluster;

import android.content.Context;
import android.os.SystemClock;
import android.util.Log;
import java.lang.ref.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONObject;

/** Genuine external EV repository adapter. Native callbacks never read files or acquire providers. */
public final class VehicleEvBridge {
    private static final String TAG="MapsVehicleEV";
    private static final Object LOCK=new Object();
    private static final ScheduledExecutorService worker=Executors.newSingleThreadScheduledExecutor(r->thread(r,"MapsVehicleEV"));
    private static final ScheduledExecutorService expiry=Executors.newSingleThreadScheduledExecutor(r->thread(r,"MapsVehicleEVExpiry"));
    private static final ExecutorService cancellation=Executors.newSingleThreadExecutor(r->thread(r,"MapsVehicleEVCancel"));
    private static final List<Binding> repositories=new ArrayList<>();
    private static final ReferenceQueue<Object> collected=new ReferenceQueue<>();
    private static final Map<Identity,Token> owned=new HashMap<>();
    private static final ThreadLocal<Boolean> internalAvailability=new ThreadLocal<>();
    private static volatile Context context;
    private static volatile VehicleDataStore.Access access;
    private static volatile String state="EV routing profile is loading.";
    private static volatile String readback="";
    private static long serial;
    private static boolean profileLoaded;
    private static boolean identityCaptured;
    private static VehicleEvConnection startupConnection;
    private static VehiclePowertrain startupPowertrain=VehiclePowertrain.UNKNOWN;
    private static Thread thread(Runnable r,String name){Thread t=new Thread(r,name);t.setDaemon(true);return t;}
    private VehicleEvBridge(){}

    /** Display name only. Cached owner profile; never changes CarInfo or registration/session IDs. */
    public static String connectedCarDisplayName(String original){
        VehicleEvProfile.Profile profile=VehicleEvProfile.current();
        return profile==null||profile.model.isEmpty()?original:profile.model;
    }

    /** Vehicle identity is owner supplied; live charging-plan capability requires accepted fresh data. */
    public static Object wrapVehicleInfo(Object original){return VehicleEvInfo.wrap(original);}
    static boolean hasVehicleProfile(){return identityMatches(VehicleEvBuildProfile.knownBev());}
    /** Maps caches eligibility/catalogs. Freeze both powertrain and connector before native DI. */
    private static synchronized boolean identityMatches(boolean legacyHint){
        VehicleEvProfile.Profile p=VehicleEvProfile.current();
        boolean hint=p==null&&VehicleEvProfile.buildHintAllowed()&&legacyHint;
        VehiclePowertrain type=p!=null&&p.typeConfirmed?p.powertrain:hint?VehiclePowertrain.BEV:VehiclePowertrain.UNKNOWN;
        VehicleEvConnection selected=p!=null&&p.hasIdentity()?VehicleEvConnection.get(p.connector):hint?VehicleEvConnection.CCS2:null;
        if(!identityCaptured){startupConnection=selected;startupPowertrain=type;identityCaptured=true;}
        return selected!=null&&selected==startupConnection&&type==startupPowertrain;
    }
    static VehicleEvConnection identityConnection(){return hasVehicleProfile()?startupConnection:null;}
    static VehiclePowertrain identityPowertrain(){return hasVehicleProfile()?startupPowertrain:VehiclePowertrain.UNKNOWN;}
    static void initializeIdentity(){hasVehicleProfile();}
    static boolean canPlanRoutes(){
        synchronized(LOCK){for(Binding b:repositories)if(b.written!=null&&live(b.written))return true;return false;}
    }

    /** Called from Application setup. This performs cached metadata access only. */
    public static void attach(Context c){
        if(context!=null)return;
        VehicleEvProfile.initializeEarly(c);initializeIdentity();
        synchronized(LOCK){
            if(context!=null)return;Context app=c.getApplicationContext();context=app==null?c:app;access=VehicleDataStore.access(context);
            VehicleDataStore.observe(VehicleEvBridge::storeChanged);
            VehicleAutoReader.install(context);
            VehicleReaderSettings.install(context);
            worker.execute(()->{try{VehicleEvProfile.load(context);}catch(Exception e){state="Set an EV routing profile.";}profileLoaded=true;poll();});
        }
    }
    /** A constructor callback only retains a weak reference and schedules reflection off-main. */
    public static void register(Object repo){
        if(repo==null)return;
        synchronized(LOCK){for(Binding b:repositories)if(b.repo.get()==repo)return;repositories.add(new Binding(repo));}
        worker.execute(()->{synchronized(LOCK){Binding b=find(repo);if(b==null||b.ready)return;}
            try{Binding resolved=new Binding(repo);resolved.resolve(repo);synchronized(LOCK){Binding b=find(repo);if(b!=null)b.take(resolved);}Log.i(TAG,"native external EV repository ready");}
            catch(Exception e){state="Native EV repository unavailable.";Log.w(TAG,"EV repository schema: "+e.getClass().getSimpleName());}
        });
    }
    private static Binding find(Object repo){for(Binding b:repositories)if(b.repo.get()==repo)return b;return null;}
    private static Binding carrier(Object object){for(Binding b:repositories)if(b.ready&&b.carrier==object)return b;return null;}
    private static void purge(){Reference<?> ref;while((ref=collected.poll())!=null)owned.remove(ref);}
    private static Token token(Object input){purge();return input==null?null:owned.get(new Identity(input,null));}
    private static boolean live(Token t){return t!=null&&identityPowertrain()==VehiclePowertrain.BEV&&!EvTest.isActive()&&!t.binding.suspended&&VehicleEvPolicy.live(t.input,access,t.profile,SystemClock.elapsedRealtime());}

    /** Replaces the final native pair only for owned inputs; skipped late jobs cannot erase newer data. */
    public static boolean handleOwnedPublish(Object repo,Object input,Object model){
        synchronized(LOCK){
            Binding b=find(repo);Token t=token(input);
            if(t==null){
                if(b!=null&&b.ready){
                    // An actual external source is authoritative. Cede without clearing its in-flight pair.
                    if(input!=null){
                        b.suspended=true;b.current=null;b.written=null;cancel(b);
                        try{b.setAvailability(b.nativeAvailability);}catch(Exception failure){Log.w(TAG,"EV handoff: "+failure.getClass().getSimpleName());}
                        state="Another native vehicle source is active.";
                    }
                    // Missing OEM-provider updates must not erase a live BYD sample.
                    if(input==null&&b.current!=null&&live(b.current))return true;
                }
                return false;
            }
            if(b==null||b!=t.binding||!b.ready||b.current!=t||!live(t))return true;
            try{
                b.written=t;b.publish(input,model);b.setAvailability(true);
                state="Live vehicle data connected to Maps EV routes.";
                readback=t.profile.summary()+"\n"+String.format(Locale.US,"%.1f%% · %.0f km · %d Wh / %d Wh",t.input.soc,t.input.rangeKm,Math.round(t.profile.capacityWh*t.input.soc/100),t.profile.capacityWh);
                Log.i(TAG,"native EV data accepted; generation="+t.generation);
            }catch(Exception failure){b.current=null;clearWritten(b);state="Maps could not accept vehicle data.";Log.w(TAG,"EV publish: "+failure.getClass().getSimpleName());}
            return true;
        }
    }
    /** Fast elapsed-time/opt-in check before native synchronous getters, including after deep sleep. */
    public static void beforeNativeRead(Object repo){synchronized(LOCK){Binding b=find(repo);if(b!=null)maintain(b);}}
    /** Scoped to the carrier of a registered external EV repository. */
    public static boolean availability(Object object,boolean requested){
        synchronized(LOCK){Binding b=carrier(object);if(b==null||Boolean.TRUE.equals(internalAvailability.get()))return requested;
            b.nativeAvailability=requested;maintain(b);return b.written!=null&&live(b.written)||requested;
        }
    }
    private static void cancel(Binding b){Future<?> old=b.future;b.future=null;if(old!=null)cancellation.execute(()->old.cancel(true));}
    private static void clearWritten(Binding b){
        Token old=b.written;b.written=null;if(old==null||!b.ready)return;
        try{
            Object current=b.original.get();Token owner=token(current);
            // Do not restore an old cached native/manual source over a newer external source.
            if(owner!=null&&owner.binding==b){b.publish(null,null);b.setAvailability(b.nativeAvailability);}
        }catch(Exception failure){Log.w(TAG,"EV withdrawal: "+failure.getClass().getSimpleName());}
        readback="";
    }
    private static void maintain(Binding b){
        if(b.current!=null&&!live(b.current)){b.current=null;cancel(b);}
        if(b.written!=null&&!live(b.written)){clearWritten(b);state=access!=null&&!access.enabled?"BYD vehicle data is off.":"Live EV readings unavailable; Maps battery prediction withdrawn.";}
    }
    private static void storeChanged(boolean revoke,String session,long epoch){
        VehicleAutoReader.changed();
        // Store calls outside its locks. Only volatile reads and short native atomic/StateFlow operations here.
        synchronized(LOCK){for(Binding b:repositories)maintain(b);}
        // Cache/settings reads stay on this separate worker.
        if(context!=null)worker.execute(VehicleEvBridge::refresh);
    }
    private static void poll(){refresh();worker.schedule(VehicleEvBridge::poll,1000,TimeUnit.MILLISECONDS);}
    private static void refresh(){
        Context c=context;if(c==null||!profileLoaded)return;
        VehicleEvProfile.Profile profile=VehicleEvProfile.current();
        if(access==null||!access.enabled||profile==null||!profile.enabled||identityPowertrain()!=VehiclePowertrain.BEV||EvTest.isActive()){
            synchronized(LOCK){for(Binding b:repositories)maintain(b);}
            state=EvTest.isActive()?"Turn off the synthetic EV test before using live data.":profile!=null&&profile.hasIdentity()&&!hasVehicleProfile()?"Vehicle profile saved. Force stop and reopen Maps to apply the vehicle type or charging connection.":profile!=null&&profile.typeConfirmed&&profile.powertrain==VehiclePowertrain.PHEV?"PHEV profile saved. Battery charge and electric range remain available in vehicle data. Our battery-only route model is off: combined fuel and battery forecasts and automatic charging stops are not provided by this profile.":profile!=null&&profile.typeConfirmed&&profile.powertrain==VehiclePowertrain.HEV?"HEV profile saved. Battery-only route data and charging stops are off. Native hybrid eco-routing for a non-plug-in HEV is not configured by this profile.":access!=null&&!access.enabled?"BYD vehicle data is off.":"Configure a vehicle profile; live battery route data is available for confirmed BEVs.";return;
        }
        VehicleEvPolicy.Input snapshot;
        try{snapshot=VehicleEvPolicy.read(VehicleDataStore.status(c),SystemClock.elapsedRealtime());}
        catch(Exception e){synchronized(LOCK){for(Binding b:repositories){b.current=null;cancel(b);clearWritten(b);}}state="Fresh battery and electric range are required for EV routes.";return;}
        List<Binding> targets;
        synchronized(LOCK){repositories.removeIf(b->b.repo.get()==null);targets=new ArrayList<>(repositories);}
        for(Binding b:targets){
            Object repo=b.repo.get();if(repo==null||!b.ready)continue;
            synchronized(LOCK){maintain(b);Object nativeInput=b.original.get();if(nativeInput!=null&&token(nativeInput)==null)b.suspended=true;if(b.suspended)continue;if(b.current!=null&&b.current.input.captured==snapshot.captured&&b.current.input.session.equals(snapshot.session)&&b.current.profile.epoch==profile.epoch)continue;}
            try{
                int[] connectors=VehicleEvConnection.get(profile.connector).energyEnums();
                Object input=VehicleEvProto.build(repo.getClass().getClassLoader(),profile.capacityWh,snapshot.soc,snapshot.rangeKm,connectors);
                VehicleEvProto.verify(input,profile.capacityWh,snapshot.soc,snapshot.rangeKm,connectors);
                Token t;
                synchronized(LOCK){
                    if(identityPowertrain()!=VehiclePowertrain.BEV||!VehicleEvPolicy.live(snapshot,access,profile,SystemClock.elapsedRealtime())||b.suspended)continue;
                    t=new Token(b,snapshot,profile,++serial);owned.put(new Identity(input,collected),t);b.current=t;cancel(b);
                }
                Future<?> future=b.launch(repo,input);
                synchronized(LOCK){if(b.current==t&&live(t))b.future=future;else cancellation.execute(()->future.cancel(true));}
                expiry.schedule(()->{synchronized(LOCK){maintain(b);}},Math.max(1,snapshot.deadline-SystemClock.elapsedRealtime()+1),TimeUnit.MILLISECONDS);
            }catch(Exception e){synchronized(LOCK){b.current=null;cancel(b);clearWritten(b);}state="Native EV model setup failed ("+e.getClass().getSimpleName()+").";Log.w(TAG,"EV model setup: "+e.getClass().getSimpleName());}
        }
    }
    static String description(){return state+(readback.isEmpty()?"":"\n\n"+readback);}
    static String profileSummary(){VehicleEvProfile.Profile p=VehicleEvProfile.current();return p==null?"Not configured":p.summary();}
    static void configure(Context c,String model,int capacityWh,boolean enabled,Runnable finished){
        configure(c,model,capacityWh,"CCS2",true,enabled,finished);
    }
    static void configure(Context c,String model,int capacityWh,String connection,boolean confirmedBev,boolean enabled,Runnable finished){
        configure(c,model,capacityWh,connection,confirmedBev?VehiclePowertrain.BEV:VehiclePowertrain.UNKNOWN,confirmedBev,enabled,finished);
    }
    static void configure(Context c,String model,int capacityWh,String connection,VehiclePowertrain type,boolean typeConfirmed,boolean enabled,Runnable finished){
        long epoch=VehicleEvProfile.invalidate();synchronized(LOCK){for(Binding b:repositories){b.suspended=false;maintain(b);}}
        worker.execute(()->{try{boolean saved=VehicleEvProfile.save(c.getApplicationContext(),model,capacityWh,connection,type,typeConfirmed,enabled,epoch);if(saved)state="Vehicle profile saved. Force stop and reopen Maps after changing the vehicle type or charging connection.";}catch(Exception e){if(VehicleEvProfile.epoch()==epoch)state="Could not save vehicle profile.";}
            refresh();if(finished!=null)new android.os.Handler(android.os.Looper.getMainLooper()).post(finished);
        });
    }
    private static final class Identity extends WeakReference<Object>{
        final int hash;Identity(Object o,ReferenceQueue<Object> queue){super(o,queue);hash=System.identityHashCode(o);}
        public int hashCode(){return hash;}
        public boolean equals(Object other){if(this==other)return true;if(!(other instanceof Identity))return false;Object a=get();return a!=null&&a==((Identity)other).get();}
    }
    private static final class Token {
        final Binding binding;final VehicleEvPolicy.Input input;final VehicleEvProfile.Profile profile;final long generation;
        Token(Binding b,VehicleEvPolicy.Input i,VehicleEvProfile.Profile p,long n){binding=b;input=i;profile=p;generation=n;}
    }
    private static final class Binding {
        final WeakReference<Object> repo;boolean ready,suspended,nativeAvailability;Object carrier,scope;AtomicReference<Object> original;
        Method publish,availability,launch;Constructor<?> task;Token current,written;Future<?> future;
        Binding(Object o){repo=new WeakReference<>(o);}
        void resolve(Object object)throws Exception{
            ClassLoader loader=object.getClass().getClassLoader();carrier=field(object,"i");scope=field(object,"b");
            @SuppressWarnings("unchecked") AtomicReference<Object> original=(AtomicReference<Object>)field(object,"k");this.original=original;suspended=original.get()!=null;
            publish=carrier.getClass().getMethod("d",loader.loadClass("qvt"));publish.setAccessible(true);
            availability=carrier.getClass().getMethod("c",boolean.class);availability.setAccessible(true);
            // 26.10 merged carrier rjs keeps the availability flow in e (26.09 rco.c).
            Object flow=field(carrier,"e");Method get=flow.getClass().getMethod("d");get.setAccessible(true);nativeAvailability=(Boolean)get.invoke(flow);
            task=loader.loadClass("hhs").getDeclaredConstructor(loader.loadClass("hjo"),loader.loadClass("afnz"),loader.loadClass("aodp"),int.class);task.setAccessible(true);
            launch=loader.loadClass("aprn").getDeclaredMethod("G",loader.loadClass("aokl"),loader.loadClass("aofm"));launch.setAccessible(true);ready=true;
        }
        void take(Binding b){carrier=b.carrier;scope=b.scope;original=b.original;publish=b.publish;availability=b.availability;launch=b.launch;task=b.task;nativeAvailability=b.nativeAvailability;suspended=b.suspended;ready=b.ready;}
        void publish(Object input,Object model)throws Exception{publish.invoke(carrier,model);original.set(input);}
        void setAvailability(boolean value)throws Exception{internalAvailability.set(true);try{availability.invoke(carrier,value);}finally{internalAvailability.remove();}}
        Future<?> launch(Object repo,Object input)throws Exception{return (Future<?>)launch.invoke(null,scope,task.newInstance(repo,input,null,EV_TASK_LAMBDA_ID));}
        private static Object field(Object object,String name)throws Exception{Field f=object.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(object);}
        /** Selector of the merged R8 lambda hhs that Maps 26.10 itself passes for (hjo, afnz) publish tasks; it was 1 in 26.09 hms. */
        static final int EV_TASK_LAMBDA_ID=2;
    }
}
