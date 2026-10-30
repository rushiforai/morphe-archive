package local.maps.cluster;

import android.app.Application;
import android.content.*;
import android.os.*;
import android.util.Log;
import java.util.Map;

/** Broadcast guidance has its own lifetime, even when cluster map projection is off. */
public final class BydGuidance {
    private static final String TAG="MapsBydGuidance";
    private static Handler worker;
    private static GuidanceSession session;
    private static HudSession hudSession;
    private static SharedPreferences legacyPreferences;
    private static GuidanceFrame hudFrame;
    private static volatile String outputDescription="HUD transport: checking receiver.";
    static String outputDescription(){return outputDescription;}
    private static volatile boolean untestedHudAvailable,standaloneActive;
    /** Receiver checks passed on an untested DiLink 5.1 build; the user may opt in. */
    static boolean untestedHudAvailable(){return untestedHudAvailable;}
    static boolean standaloneActive(){return standaloneActive;}
    private static final java.util.List<Object> sources=new java.util.concurrent.CopyOnWriteArrayList<>();
    private static Object selected, selectedState;
    private static boolean sourceError;
    private static volatile boolean sourceKnown,routeActive;
    static boolean updatePromptSafe(){return sourceKnown&&!routeActive;}
    /** Camera zoom needs a known source; MAIN guidance does not select CLUSTER camera family. */
    static boolean sourceKnownForZoom(){return sourceKnown;}
    public static boolean routeActiveForRecovery(){return routeActive();}
    static boolean routeActive(){return routeActive;}
    private static long selectedFreshAt;
    private static long sourceLogAt=Long.MIN_VALUE;
    /** Capture the authoritative provider also used by CarNavigationProviderService. */
    public static void registerSource(Object source) {
        try { if(!sources.contains(source)) { sources.add(source);Log.i(TAG,"navigation provider registered"); } }
        catch(Throwable e){Log.w(TAG,"register navigation source",e);}
    }
    static synchronized void install(Application app) {
        if(worker!=null)return;
        HandlerThread thread=new HandlerThread("maps-byd-guidance");thread.start();worker=new Handler(thread.getLooper());
        SharedPreferences preferences=app.getSharedPreferences("local_byd_guidance",Context.MODE_PRIVATE);
        legacyPreferences=preferences;
        worker.post(()->{
            session=new GuidanceSession(frame->send(app,frame),new GuidanceSession.Store(){
                public boolean shown(){return preferences.getBoolean("guidance_shown",false);}
                public boolean save(boolean shown){return preferences.edit().putBoolean("guidance_shown",shown).commit();}
            });
            String rejection=HudReceiver.rejection(app),adapter=AmapAdapter.packageName(app);
            untestedHudAvailable=HudCompatibility.UNTESTED.equals(rejection);
            SharedPreferences journal=app.getSharedPreferences("local_byd_standalone_hud",Context.MODE_PRIVATE);
            if(rejection==null||untestedHudAvailable&&ClusterSettings.untestedHud()) {
                hudSession=new HudSession(packet->sendHud(app,packet),new HudSession.Store(){
                    public boolean pending(){return journal.getBoolean("pending_clear",false);}
                    public boolean save(boolean value){return journal.edit().putBoolean("pending_clear",value).commit();}
                });
                standaloneActive=true;
                outputDescription=rejection==null?"HUD transport: standalone receiver verified.":"HUD transport: standalone receiver (experimental: this firmware build is untested).";
            } else if(untestedHudAvailable) {
                // The user turned the experimental output off: clear anything a killed process left on the HUD.
                if(journal.getBoolean("pending_clear",false)) {
                    try{HudReceiver.send(app,HudPackets.END);journal.edit().putBoolean("pending_clear",false).commit();}
                    catch(RuntimeException e){Log.w(TAG,"standalone HUD recovery clear",e);}
                }
                outputDescription="HUD transport: AMap via "+adapter+". A standalone HUD receiver passed all checks, but this firmware build is untested. You can try it below.";
            } else outputDescription="HUD transport: AMap via "+adapter+". Standalone unavailable ("+rejection+").";
            long now=SystemClock.elapsedRealtime();
            if(ready(now))enableOutput(now);
        });
        worker.postDelayed(new Runnable(){public void run(){
            long now=SystemClock.elapsedRealtime();
            if(ready(now)){pollSources();enableOutput(now);}
            worker.postDelayed(this,hudSession==null?1000:250);
        }},1000);
    }
    private static void pollSources() {
        long now=SystemClock.elapsedRealtime();
        try {
            Object provider=null,state=null;GuidanceFrame frame=null;
            for(Object candidate:sources) {
                Object value=candidate.getClass().getField("b").get(candidate);
                GuidanceFrame decoded=MapsGuidanceSource.read(value);
                if(decoded!=null && (provider==null || candidate==selected)) {
                    provider=candidate;state=value;frame=decoded;
                    if(candidate==selected)break;
                }
            }
            // Identity changes are real provider updates. Polling a cached value must not
            // extend freshness: the session still expires it after 30 seconds.
            if(provider!=selected || state!=selectedState) {
                selected=provider;selectedState=state;selectedFreshAt=now;
                observe(frame,now);
            }
            if(sourceLogAt==Long.MIN_VALUE || now-sourceLogAt>=10000) {
                sourceLogAt=now;
                Log.i(TAG,state==null?"source mode=OFF providers="+sources.size():"source "+MapsGuidanceSource.diagnostic(state));
            }
            sourceKnown=!sources.isEmpty();routeActive=frame!=null;
            Diagnostics.source(frame!=null,sources.size(),now-selectedFreshAt);
            sourceError=false;
        } catch(Throwable e) {
            sourceKnown=false;
            observe(null,now);
            if(!sourceError)Log.w(TAG,"navigation schema unavailable; guidance cleared",e);
            Diagnostics.failure("source","schema_mismatch");
            sourceError=true;
        }
    }
    private static boolean enabled(){return ClusterSettings.state()!=null&&ClusterSettings.state().vehicleGuidance;}
    static synchronized void settingsChanged() {
        if(worker!=null)worker.post(()->{long now=SystemClock.elapsedRealtime();if(ready(now))enableOutput(now);});
    }
    private static boolean ready(long now) {
        if(hudSession==null)return true;
        // Clear only AMap output journaled by an earlier project build before switching transports.
        if(legacyPreferences.getBoolean("guidance_shown",false)) {
            session.enable(false,now);
            if(legacyPreferences.getBoolean("guidance_shown",false)){hudSession.enable(false,now);return false;}
        }
        return true;
    }
    private static void observe(GuidanceFrame frame,long now) {
        if(hudSession!=null){hudFrame=frame;hudSession.observe(frame,now,now);}
        else session.observe(frame,now,now);
    }
    private static void enableOutput(long now) {
        if(hudSession!=null)hudSession.enable(enabled(),now);else session.enable(enabled(),now);
    }
    private static void sendHud(Context context,String packet) {
        boolean clear=HudPackets.END.equals(packet),guidance=!clear&&!HudPackets.START.equals(packet);
        try {
            HudReceiver.send(context,packet);
            if(clear||guidance)Diagnostics.guidance(clear?null:hudFrame,true);
        } catch(RuntimeException e) {
            if(clear||guidance)Diagnostics.guidance(clear?null:hudFrame,false);
            Diagnostics.failure("adapter",e instanceof SecurityException?"permission_denied":"internal_error");throw e;
        }
        // Never log the normal payload: it may include a street name.
        Log.i(TAG,clear?"standalone HUD clear dispatched":guidance?"standalone HUD guidance dispatched":"standalone HUD start dispatched");
    }
    private static void send(Context context,GuidanceFrame frame) {
        Intent intent=new Intent(BydGuidanceProtocol.ACTION).setPackage(AmapAdapter.packageName(context)).addFlags(BydGuidanceProtocol.FLAGS);
        for(Map.Entry<String,Object> entry:BydGuidanceProtocol.message(frame).entrySet()) {
            Object value=entry.getValue();
            if(value instanceof Integer)intent.putExtra(entry.getKey(),((Integer)value).intValue());
            else if(value instanceof Boolean)intent.putExtra(entry.getKey(),((Boolean)value).booleanValue());
            else intent.putExtra(entry.getKey(),(String)value);
        }
        try {context.sendBroadcast(intent);Diagnostics.guidance(frame,true);}
        catch(RuntimeException e){Diagnostics.guidance(frame,false);Diagnostics.failure("adapter",e instanceof SecurityException?"permission_denied":"internal_error");throw e;}
        // Delivery and physical display must be checked separately. Do not log roads/locations.
        Log.i(TAG,frame==null?"end broadcast sent":"guidance broadcast sent: icon="+frame.icon+" exit="+frame.exit+" metres="+frame.turnMeters);
    }
}
