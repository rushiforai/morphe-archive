package app.johninnl.modelhost.api;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/** Bind once, open isolated sessions, close on client shutdown. Reconnection never replays edits. */
public final class ModelHostClient implements AutoCloseable {
    public static final String DEFAULT_PACKAGE="app.johninnl.modelhost";
    public static final String SERVICE_CLASS="app.johninnl.modelhost.service.ModelHostService";
    private final ComponentName component;
    private final Executor callbacks;
    private final ThreadPoolExecutor worker=new ThreadPoolExecutor(1,2,30,TimeUnit.SECONDS,new ArrayBlockingQueue<>(64),r -> new Thread(r,"modelhost-client"));
    private final ExecutorService controls=Executors.newSingleThreadExecutor(r->new Thread(r,"modelhost-client-control"));
    private final List<SpeechSession> speechSessions=new CopyOnWriteArrayList<>();
    private final List<HostSession> sessions=new CopyOnWriteArrayList<>();
    private volatile IModelHost remote;
    private Context context;
    private ConnectionListener listener;
    private boolean bound;
    private final java.util.concurrent.atomic.AtomicBoolean closed=new java.util.concurrent.atomic.AtomicBoolean();
    public ModelHostClient() { this(new ComponentName(DEFAULT_PACKAGE,SERVICE_CLASS),r -> new Handler(Looper.getMainLooper()).post(r)); }
    public ModelHostClient(ComponentName component, Executor callbacks) { this.component=component;this.callbacks=callbacks; }
    private final ServiceConnection connection=new ServiceConnection() {
        @Override public void onServiceConnected(ComponentName name,IBinder binder) {
            if(closed.get())return;
            try { worker.execute(() -> { try {
                IModelHost host=IModelHost.Stub.asInterface(binder);
                if(host.apiVersion()/10000!=1)throw new HostException("INCOMPATIBLE_PROTOCOL");
                HostCapabilities capabilities=new HostCapabilities(host.capabilitiesJson());
                if(capabilities.protocolMajor!=1)throw new HostException("INCOMPATIBLE_PROTOCOL");
                HostStatus status=new HostStatus(host.statusJson());
                ConnectionListener l;
                synchronized(ModelHostClient.this){if(closed.get())return;remote=host;l=listener;}
                if(l!=null)callbacks.execute(() -> {if(!closed.get())l.onConnected(status,capabilities);});
            } catch(Exception e) { lost(e instanceof HostException ? (HostException)e : new HostException("PROVIDER_UNAVAILABLE",e)); } }); } catch(java.util.concurrent.RejectedExecutionException ignored){}
        }
        @Override public void onServiceDisconnected(ComponentName name) { lost(new HostException("PROVIDER_UNAVAILABLE")); }
        @Override public void onBindingDied(ComponentName name) { lost(new HostException("PROVIDER_UPDATED")); }
        @Override public void onNullBinding(ComponentName name) { lost(new HostException("PROVIDER_UNAVAILABLE")); }
    };
    /** Call from the main thread; all negotiation and requests run asynchronously. */
    public synchronized void connect(Context context, ConnectionListener listener) {
        if(closed.get())throw new IllegalStateException("Client closed");if(bound)throw new IllegalStateException("Already bound");this.context=context.getApplicationContext();this.listener=listener;
        try { bound=this.context.bindService(new Intent().setComponent(component),connection,Context.BIND_AUTO_CREATE);if(!bound)lost(new HostException("PROVIDER_MISSING")); }
        catch(RuntimeException e){lost(new HostException("PROVIDER_UNAVAILABLE",e));}
    }
    /** Call from a worker thread; this opens only a lightweight Binder session, never loads a model. */
    public HostSession openSession(SessionOptions options) throws HostException {
        IModelHost host=remote;if(host==null)throw new HostException("NOT_CONNECTED");
        try { IModelSession s=host.openSession(options.toJson(),new IHostEvents.Stub(){ @Override public void onStatus(String json){} });
            HostSession session=new HostSession(s,worker,controls,callbacks,sessions::remove);
            boolean rejected;
            synchronized(this){rejected=closed.get() || remote!=host;if(!rejected)sessions.add(session);}
            if(rejected){try{s.close();}catch(Exception ignored){}throw new HostException("NOT_CONNECTED");}
            return session;
        } catch(Exception e){throw new HostException("SESSION_UNAVAILABLE",e);}
    }
    /** The current selected model can change independently of the Binder connection. */
    public boolean supportsSpeechContactHints() throws HostException {
        IModelHost host = remote;
        if (closed.get() || host == null) throw new HostException("NOT_CONNECTED");
        try {
            return new HostCapabilities(host.capabilitiesJson()).supportsSpeechContactHints();
        } catch (Exception error) {
            throw new HostException("SPEECH_SESSION_UNAVAILABLE", error);
        }
    }
    /** Call on a worker thread after the provider advertises its speech capability. */
    public SpeechSession openSpeechSession(String language) throws HostException {
        return openSpeechSession(language, java.util.Collections.emptyList());
    }
    /** Optional, already validated display names for one utterance. */
    public SpeechSession openSpeechSession(String language, List<String> contextPhrases) throws HostException {
        IModelHost host = remote;
        if (closed.get() || host == null) throw new HostException("NOT_CONNECTED");
        try {
            org.json.JSONObject config = new org.json.JSONObject().put("schema", 1)
                .put("language", language == null ? "auto" : language);
            if (!contextPhrases.isEmpty()) {
                if (!new HostCapabilities(host.capabilitiesJson()).supportsSpeechContactHints()) {
                    throw new HostException("CONTEXT_BIAS_UNSUPPORTED");
                }
                config.put("contextPhrases", new org.json.JSONArray(contextPhrases));
            }
            ISpeechSession remoteSession = host.openSpeechSession(config.toString(), new IHostEvents.Stub() {
                @Override public void onStatus(String json) {}
            });
            SpeechSession session = new SpeechSession(remoteSession, worker, controls, callbacks, context,
                speechSessions::remove);
            synchronized (this) {
                if (closed.get() || remote != host) {
                    session.close();
                    throw new HostException("NOT_CONNECTED");
                }
                speechSessions.add(session);
            }
            return session;
        } catch (HostException error) {
            throw error;
        } catch (IllegalStateException error) {
            if ("CONTEXT_BIAS_UNSUPPORTED".equals(error.getMessage())) {
                throw new HostException("CONTEXT_BIAS_UNSUPPORTED");
            }
            throw new HostException("SPEECH_SESSION_UNAVAILABLE", error);
        } catch (IllegalArgumentException error) {
            if (!contextPhrases.isEmpty() && "INVALID_REQUEST".equals(error.getMessage())) {
                throw new HostException("INVALID_REQUEST");
            }
            throw new HostException("SPEECH_SESSION_UNAVAILABLE", error);
        } catch (Exception error) {
            throw new HostException("SPEECH_SESSION_UNAVAILABLE", error);
        }
    }
    public HostStatus status() throws HostException { try { if(closed.get() || remote==null)throw new HostException("NOT_CONNECTED");return new HostStatus(remote.statusJson()); }catch(RemoteException e){throw new HostException("PROVIDER_UNAVAILABLE",e);} }
    private void lost(HostException error) { remote=null;for(SpeechSession s:speechSessions)s.disconnected();speechSessions.clear();for(HostSession s:sessions)s.disconnected();sessions.clear();ConnectionListener l=listener;if(l!=null)callbacks.execute(() -> l.onDisconnected(error)); }
    @Override public synchronized void close() { if(!closed.compareAndSet(false,true))return;for(SpeechSession s:speechSessions)s.close();speechSessions.clear();for(HostSession s:sessions)s.close();sessions.clear();remote=null;if(bound){context.unbindService(connection);bound=false;}worker.shutdown();controls.shutdown();listener=null; }
}
