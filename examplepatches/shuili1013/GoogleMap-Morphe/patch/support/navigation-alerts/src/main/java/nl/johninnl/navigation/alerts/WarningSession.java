package nl.johninnl.navigation.alerts;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.app.PendingIntent;
import java.io.Closeable;
import java.util.EnumSet;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import nl.johninnl.navigation.startup.NavigationClient;

/** Negotiate WARNINGS_V1 on the existing health worker before provider startup. */
public final class WarningSession implements NavigationClient.Capabilities,Closeable {
    private final Context app;
    private final WarningConnection.Listener listener;
    private final Map<String,ThreadPoolExecutor> workers=new HashMap<>();
    private WarningConnection connection;
    private IBinder binder;
    private String connectionSource="";
    private Object callbackIdentity;
    private long generation=-1,minimumGeneration;
    private boolean closed;
    private volatile String state="off";
    private volatile boolean captureComplete;
    private volatile String eventSource="";
    private volatile PendingIntent recovery;
    private volatile String controllerState="",sourceRouteState="";
    private volatile Bundle familyStatus=new Bundle();
    public String controllerState(){return controllerState;}
    public String sourceRouteState(){return sourceRouteState;}
    public Bundle familyStatus(){return familyStatus.deepCopy();}
    public WarningSession(Context context,WarningConnection.Listener listener) { app=context.getApplicationContext();this.listener=listener; }
    public String state() { return state; }
    public boolean captureComplete() { return captureComplete; }
    public boolean advertisesEvents(String source){return source!=null&&source.equals(eventSource);}
    /** Only an explicit source change permits returning to deliberately selected legacy behavior. */
    public synchronized void resetEventNegotiation(){eventSource="";recovery=null;controllerState="";sourceRouteState="";familyStatus=new Bundle();}
    public PendingIntent recoveryAction(){return recovery;}
    public synchronized WarningConnection connection() { return connection; }
    /** Recheck after posting a callback to an app UI queue, where a source switch may intervene. */
    public synchronized boolean accepts(String providerSession) {
        return !closed && connection!=null && generation>=minimumGeneration && providerSession!=null
                && providerSession.equals(connection.providerSession());
    }
    public synchronized boolean consume(String providerSession,Runnable action) {
        if(!accepts(providerSession))return false;action.run();return true;
    }
    @Override public boolean prepare(String source,Bundle status,long ticket) throws Exception {
        IBinder api=status.getBinder("warning_api");int[] protocols=status.getIntArray("warning_protocols");boolean v1=false;
        if(protocols!=null)for(int protocol:protocols)if(protocol==1)v1=true;
        final WarningConnection selected;
        final boolean reuse;
        synchronized(this) {
            if(closed || ticket<minimumGeneration)return false;
            if(!WarningProviders.supported(source)){detach();familyStatus=new Bundle();state="incompatible";return false;}
            controllerState=status.getString("warning_controller_state","");
            sourceRouteState=status.getString("warning_source_route_state","");
            familyStatus=readFamilies(status);
            if(api!=null||protocols!=null&&protocols.length>0)eventSource=source;
            if(api==null) {
                if(protocols!=null&&protocols.length>0) { detach();state="incompatible";return false; }
                detach();state="legacy";generation=ticket;return true;
            }
            if(!v1) { detach();state="incompatible";return false; }
            eventSource=source;
            PendingIntent action=status.getParcelable("warning_recovery");
            if(action!=null&&source.equals(action.getCreatorPackage())&&action.getCreatorUid()==app.getPackageManager().getApplicationInfo(source,0).uid
                    &&(android.os.Build.VERSION.SDK_INT<31||action.isImmutable()))recovery=action;
            else recovery=null;
            reuse=connection!=null && binder==api && source.equals(connectionSource) && generation==ticket && "ready".equals(state);
            if(reuse)selected=connection;
            else {
            detach();generation=ticket;binder=api;connectionSource=source;state="connecting";
            final long active=ticket;
            final Object activeCallback=new Object();callbackIdentity=activeCallback;
            ThreadPoolExecutor worker=workers.get(source);
            if(worker==null) {
                if(workers.size()>=2) { state="incompatible";return false; }
                worker=WarningConnection.controlWorker();workers.put(source,worker);
            }
            connection=new WarningConnection(app,WarningProviders.required(source),EnumSet.allOf(WarningAudioOwner.Mode.class),new WarningConnection.Listener() {
                // A STATUS poll can replace the endpoint without changing the startup ticket.
                // Fence both the check and delivery, including late retirement/death callbacks.
                private boolean current() { return !closed && connection!=null && callbackIdentity==activeCallback
                        && generation==active && active>=minimumGeneration; }
                public void snapshot(WarningConnection.Snapshot value) { synchronized(WarningSession.this) { if(current()) { captureComplete=value.captureComplete;listener.snapshot(value); } } }
                public void events(List<WarningEvent> values) { synchronized(WarningSession.this) { if(current())listener.events(values); } }
                public void ownerRevoked(long epoch) { synchronized(WarningSession.this) { if(current())listener.ownerRevoked(epoch); } }
                public void disconnected(String reason) { synchronized(WarningSession.this) { if(current()) { state="disconnected";captureComplete=false;controllerState="";sourceRouteState="";familyStatus=new Bundle();listener.disconnected(reason); } } }
            },worker,false);selected=connection;
            }
        }
        boolean ready=reuse?selected.ping().get(3,TimeUnit.SECONDS):selected.open(source,api).get(4,TimeUnit.SECONDS);
        synchronized(this) {
            if(closed || generation!=ticket || connection!=selected || ticket<minimumGeneration) { selected.close();return false; }
            state=ready?"ready":"disconnected";return ready;
        }
    }
    @Override public synchronized void disconnected(long nextGeneration) {
        minimumGeneration=Math.max(minimumGeneration,nextGeneration);generation=-1;detach();controllerState="";sourceRouteState="";familyStatus=new Bundle();state="off";
    }
    private void detach() {
        captureComplete=false;WarningConnection previous=connection;connection=null;binder=null;connectionSource="";callbackIdentity=null;
        if(previous!=null) { previous.retire();listener.disconnected("SOURCE_DISCONNECTED"); }
    }
    /** Optional status must never grant audio or make malformed metadata break an otherwise valid API. */
    private static Bundle readFamilies(Bundle status){
        try{
            Bundle raw=status.getBundle("warning_families");if(raw==null)return new Bundle();raw.setClassLoader(null);if(raw.size()>16)return new Bundle();
            Bundle out=new Bundle();
            for(String name:raw.keySet()){
                if(!name.matches("[a-z][a-z0-9_]{0,39}"))return new Bundle();
                Bundle row=raw.getBundle(name);if(row==null)return new Bundle();row.setClassLoader(null);if(row.size()>12)return new Bundle();
                for(String key:row.keySet()){
                    if(!key.matches("[a-z][a-z0-9_]{0,47}"))return new Bundle();Object value=row.get(key);
                    if(value instanceof String){if(!((String)value).matches("[a-z][a-z0-9_]{0,95}"))return new Bundle();}
                    else if(!(value instanceof Boolean||value instanceof Integer||value instanceof Long))return new Bundle();
                }
                out.putBundle(name,row.deepCopy());
            }
            return out;
        }catch(RuntimeException malformed){return new Bundle();}
    }
    @Override public synchronized void close() { closed=true;generation=-1;detach();controllerState="";sourceRouteState="";familyStatus=new Bundle();state="off";for(ThreadPoolExecutor worker:workers.values())worker.shutdown(); }
}
