package nl.johninnl.navigation.alerts;

import android.content.Context;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.SystemClock;
import android.os.Handler;
import android.os.Looper;
import java.io.Closeable;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/** One bounded control worker per provider. Listener calls run on that worker, never the UI. */
public final class WarningConnection implements Closeable,WarningScheduler.Transport {
    public interface Listener {
        void snapshot(Snapshot value);
        void events(List<WarningEvent> values);
        void ownerRevoked(long epoch);
        /** May also run on a Binder death thread. Cancel local output promptly. */
        void disconnected(String reason);
    }
    public static final class Candidate {
        public final WarningEvent authority,payload;
        Candidate(WarningEvent authority,WarningEvent payload) { this.authority=authority;this.payload=payload; }
    }
    public static final class Snapshot {
        public final String providerSession,audioStatus;
        public final long headSequence;
        public final boolean resyncRequired,captureComplete;
        public final List<WarningEvent> state,records;
        public final List<Candidate> announcements;
        public final List<PlaybackGrant> dispositions;
        Snapshot(String session,long head,boolean resync,boolean complete,String audioStatus,List<WarningEvent> state,
                 List<WarningEvent> records,List<Candidate> announcements,List<PlaybackGrant> dispositions) {
            providerSession=session;headSequence=head;resyncRequired=resync;captureComplete=complete;this.audioStatus=audioStatus;
            this.state=Collections.unmodifiableList(state);this.records=Collections.unmodifiableList(records);
            this.announcements=Collections.unmodifiableList(announcements);this.dispositions=Collections.unmodifiableList(dispositions);
        }
    }
    public static final class Lease {
        public final String token;
        public final long epoch,until;
        public final WarningAudioOwner.Mode mode;
        public final boolean ready;
        Lease(Bundle b) { token=WarningWire.text(b,"owner_token");epoch=WarningWire.number(b,"owner_epoch");until=WarningWire.number(b,"until_elapsed_ms");mode=WarningAudioOwner.Mode.valueOf(WarningWire.text(b,"mode"));ready=WarningWire.flag(b,"ready"); }
    }
    public static final class Claim {
        public final String status,ownerPackage;
        public final Lease lease;
        Claim(Bundle b) { status=WarningWire.text(b,"status");ownerPackage=b.getString("owner_package","");Bundle value=b.getBundle("lease");lease=value==null?null:new Lease(value); }
    }
    public static final class Attempt {
        public final String status;
        public final PlaybackGrant grant;
        public final Candidate candidate;
        Attempt(Bundle b,long now) {
            status=WarningWire.text(b,"status");Bundle g=b.getBundle("grant");grant=g==null?null:WarningWire.grant(g);
            Bundle authority=b.getBundle("authority"),payload=b.getBundle("payload");
            candidate=authority==null?null:candidate(authority,payload,now);
        }
    }
    private final Context app;
    private final Set<String> capabilities;
    private final Set<WarningAudioOwner.Mode> modes;
    private final Listener listener;
    private final ThreadPoolExecutor control;
    private final boolean ownsWorker;
    static ThreadPoolExecutor controlWorker() { return new ThreadPoolExecutor(1,1,0,TimeUnit.MILLISECONDS,new ArrayBlockingQueue<>(128),r-> {
        Thread t=new Thread(r,"warning-receiver");t.setDaemon(true);return t;
    },new ThreadPoolExecutor.AbortPolicy()); }
    private final Object incoming=new Object();
    private final ArrayDeque<List<WarningEvent>> accepted=new ArrayDeque<>();
    private final CompletableFuture<Boolean> established=new CompletableFuture<>();
    // Rebinding the same living consumer must retain its right to acknowledge its old grant.
    private static final String PROCESS_NONCE=UUID.randomUUID().toString();
    private final String nonce=PROCESS_NONCE;
    private volatile IBinder endpoint;
    private volatile int providerUid=-1;
    private volatile String registration,session,providerPackage;
    private volatile boolean closed,confirmed,retiring,outputOutstanding,grantRequestPending,previewSupported;
    private volatile Lease knownLease;
    private long cursor;
    private int acceptedCount;
    private boolean drainScheduled,resyncScheduled;
    private final IBinder.DeathRecipient death=()->fail("PROVIDER_DIED");

    public WarningConnection(Context context,Set<String> capabilities,Set<WarningAudioOwner.Mode> modes,Listener listener) {
        this(context,capabilities,modes,listener,controlWorker(),true);
    }
    WarningConnection(Context context,Set<String> capabilities,Set<WarningAudioOwner.Mode> modes,Listener listener,ThreadPoolExecutor worker,boolean ownsWorker) {
        if(context==null || listener==null || modes==null || modes.isEmpty())throw new IllegalArgumentException("CONNECTION_CONFIGURATION");
        app=context.getApplicationContext();this.capabilities=WarningCapabilities.copy(capabilities);
        this.modes=Collections.unmodifiableSet(java.util.EnumSet.copyOf(modes));this.listener=listener;
        this.control=worker;this.ownsWorker=ownsWorker;
    }
    /** The returned barrier completes after callback authentication, snapshot validation and ACK. */
    public CompletableFuture<Boolean> open(String providerPackage,IBinder source) {
        if(endpoint!=null)throw new IllegalStateException("CONNECTION_ALREADY_OPEN");
        this.providerPackage=providerPackage;
        endpoint=source;
        submit(()-> {
            if(source==null)throw new IllegalArgumentException("ENDPOINT_REQUIRED");
            providerUid=app.getPackageManager().getApplicationInfo(providerPackage,0).uid;
            if(!WarningWire.DESCRIPTOR.equals(source.getInterfaceDescriptor()))throw new SecurityException("SOURCE_DESCRIPTOR");
            source.linkToDeath(death,0);
            Bundle q=new Bundle();q.putBinder("callback",callback);q.putString("consumer_nonce",nonce);
            q.putStringArrayList("capabilities",new ArrayList<>(capabilities));ArrayList<String> outputs=new ArrayList<>();
            for(WarningAudioOwner.Mode mode:modes)outputs.add(mode.name());q.putStringArrayList("output_modes",outputs);
            Bundle reply=transact(WarningWire.REGISTER,q);
            if(!"VERIFYING".equals(WarningWire.text(reply,"status")))throw new IllegalStateException(WarningWire.text(reply,"status"));
            if(WarningWire.integer(reply,"source_uid")!=providerUid)throw new SecurityException("SOURCE_UID");
            registration=WarningWire.text(reply,"registration_token");session=WarningWire.text(reply,"provider_session");
            previewSupported=reply.getBoolean("preview_supported",false);
            if(!PlaybackGrant.uuid(registration) || !PlaybackGrant.uuid(session))throw new IllegalArgumentException("SOURCE_IDENTITY");
            return null;
        });
        return established;
    }
    public String providerSession() { return session; }
    public String identity() { return providerPackage; }
    public boolean supportsPreview(){return previewSupported;}
    public CompletableFuture<Boolean> ping() {
        return submit(()-> { Bundle reply=transact(WarningWire.PING,request());requireOk(reply);return session.equals(WarningWire.text(reply,"provider_session")); });
    }
    public CompletableFuture<Boolean> resync(){return submit(()->{synchronized(incoming){resyncScheduled=true;}resynchronize();return true;});}
    public CompletableFuture<Candidate> preview(Lease lease,String language,String nonce){return submit(()->{
        Bundle q=owned(lease);q.putString("language",language);q.putString("preview_nonce",nonce);Bundle reply=transact(WarningWire.PREVIEW,q);requireOk(reply);
        return candidate(reply.getBundle("authority"),reply.getBundle("payload"),SystemClock.elapsedRealtime());
    });}
    private final Binder callback=new Binder() {
        { attachInterface(null,WarningWire.CALLBACK); }
        @Override protected boolean onTransact(int code,Parcel in,Parcel out,int flags) throws RemoteException {
            if(Binder.getCallingUid()!=providerUid || providerUid<=0)throw new SecurityException("WARNING_PROVIDER_UID");
            if(code==IBinder.INTERFACE_TRANSACTION) { out.writeString(WarningWire.CALLBACK);return true; }
            in.enforceInterface(WarningWire.CALLBACK);
            if(in.dataAvail()>WarningWire.MAX_FRAME)throw new IllegalArgumentException("FRAME_SIZE");
            Bundle b=in.readBundle(null);if(b==null || in.dataAvail()!=0)throw new IllegalArgumentException("CALLBACK_FRAME");
            Bundle reply=WarningWire.status("OK");
            if(closed)throw new IllegalStateException("CLOSED");
            if(code==WarningWire.VERIFY) {
                // This can arrive before REGISTER returns. Confirmation is queued behind that call.
                String token=WarningWire.text(b,"registration_token"),challenge=WarningWire.text(b,"challenge"),sourceSession=WarningWire.text(b,"provider_session");
                if(!nonce.equals(WarningWire.text(b,"consumer_nonce")))throw new SecurityException("CONSUMER_NONCE");
                submit(()-> {
                    if(!token.equals(registration) || !sourceSession.equals(session))throw new SecurityException("CALLBACK_REGISTRATION");
                    Bundle q=request();q.putString("challenge",challenge);q.putBinder("callback",callback);
                    requireOk(WarningConnection.this.transact(WarningWire.CONFIRM,q));confirmed=true;resynchronize();return null;
                });
            }else {
                authenticate(b);
                if(code==WarningWire.EVENTS) { if(retiring){synchronized(incoming){reply.putLong("accepted_sequence",cursor);}}else accept(b,reply); }
                else if(code==WarningWire.STATE_INVALIDATED) { if(!retiring)scheduleResync(); }
                else if(code==WarningWire.OWNER_REVOKED) {
                    long epoch=WarningWire.number(b,"owner_epoch");submit(()-> { listener.ownerRevoked(epoch);return null; });
                }else throw new IllegalArgumentException("CALLBACK_TRANSACTION");
            }
            out.writeNoException();out.writeBundle(reply);return true;
        }
    };
    private void authenticate(Bundle b) {
        if(!confirmed || !nonce.equals(WarningWire.text(b,"consumer_nonce")) || !session.equals(WarningWire.text(b,"provider_session"))
                || !registration.equals(WarningWire.text(b,"registration_token")))throw new SecurityException("CALLBACK_IDENTITY");
    }
    private void accept(Bundle b,Bundle reply) {
        List<WarningEvent> events=WarningCodec.decodeBatch(b.getBundle("batch"),SystemClock.elapsedRealtime());
        long through=WarningWire.number(b,"through_sequence");
        synchronized(incoming) {
            long next=cursor;
            for(WarningEvent event:events) {
                if(!session.equals(event.providerSession) || event.sequence!=next+1) { reply.putLong("accepted_sequence",cursor);scheduleResync();return; }
                next=event.sequence;
            }
            if(events.isEmpty() || next!=through || acceptedCount+events.size()>WarningJournal.MAX_EVENTS || resyncScheduled) {
                reply.putLong("accepted_sequence",cursor);scheduleResync();return;
            }
            accepted.add(events);acceptedCount+=events.size();cursor=through;reply.putLong("accepted_sequence",through);
            for(WarningEvent event:events)WarningDiagnostics.event(event,"RECEIVER_ACCEPTED",SystemClock.elapsedRealtime());
            if(!drainScheduled) { drainScheduled=true;submit(()-> { drain();return null; }); }
        }
    }
    private void drain() {
        while(!closed) {
            List<WarningEvent> events;
            synchronized(incoming) {
                events=accepted.poll();if(events==null) { drainScheduled=false;return; }acceptedCount-=events.size();
            }
            listener.events(events);
        }
    }
    private void scheduleResync() {
        synchronized(incoming) {
            if(resyncScheduled || closed)return;resyncScheduled=true;
            submit(()-> { resynchronize();return null; });
        }
    }
    private void resynchronize() throws Exception {
        Bundle q=request();q.putString("provider_session",session);synchronized(incoming) { q.putLong("after_sequence",cursor); }
        List<WarningEvent> state=new ArrayList<>(),records=new ArrayList<>();List<Candidate> announcements=new ArrayList<>();List<PlaybackGrant> dispositions=new ArrayList<>();
        String view=null,audioStatus="UNOWNED";long head=-1;boolean resync=false,complete=false;int index=0;
        for(int pages=0;pages<512;pages++) {
            Bundle page=transact(WarningWire.RESUME,q);requireOk(page);
            if(!session.equals(WarningWire.text(page,"provider_session")))throw new IllegalArgumentException("SNAPSHOT_SESSION");
            String token=WarningWire.text(page,"view_token");long at=WarningWire.number(page,"head_sequence");
            if(view==null) { view=token;head=at;resync=WarningWire.flag(page,"resync_required");complete=WarningWire.flag(page,"capture_complete"); }
            else if(!view.equals(token) || head!=at)throw new IllegalArgumentException("SNAPSHOT_CHANGED");
            audioStatus=WarningWire.text(page,"audio_status");
            Object raw=page.get("items");if(!(raw instanceof ArrayList))throw new IllegalArgumentException("SNAPSHOT_ITEMS");
            if(((ArrayList<?>)raw).size()>WarningCodec.MAX_BATCH_EVENTS)throw new IllegalArgumentException("SNAPSHOT_COUNT");
            for(Object item:(ArrayList<?>)raw) {
                if(!(item instanceof Bundle))throw new IllegalArgumentException("SNAPSHOT_ITEM");Bundle b=(Bundle)item;
                switch(WarningWire.text(b,"item_type")) {
                    case "state":state.add(snapshotEvent(b.getBundle("event"),head));break;
                    case "record":records.add(snapshotEvent(b.getBundle("event"),head));break;
                    case "announcement":Candidate c=candidate(b.getBundle("authority"),b.getBundle("payload"),SystemClock.elapsedRealtime());
                        if(!session.equals(c.authority.providerSession) || c.authority.sequence>head || c.payload.sequence>head)throw new IllegalArgumentException("SNAPSHOT_EVENT");announcements.add(c);break;
                    case "disposition":PlaybackGrant grant=WarningWire.grant(b.getBundle("grant"));
                        if(!grant.consumerNonce.equals(nonce) || grant.ownerUid!=android.os.Process.myUid())throw new SecurityException("DISPOSITION_IDENTITY");dispositions.add(grant);break;
                    default:throw new IllegalArgumentException("SNAPSHOT_ITEM_TYPE");
                }
            }
            if(state.size()>128 || records.size()>128 || announcements.size()>128 || dispositions.size()>128)throw new IllegalArgumentException("SNAPSHOT_LIMIT");
            int next=WarningWire.integer(page,"next_index");boolean done=WarningWire.flag(page,"done");
            if(next<index || (!done && next==index))throw new IllegalArgumentException("SNAPSHOT_CURSOR");
            if(done) {
                validateSnapshot(state,records,resync);
                // Consume the frozen snapshot before telling the source it can send later records.
                listener.snapshot(new Snapshot(session,head,resync,complete,audioStatus,state,records,announcements,dispositions));
                synchronized(incoming) { accepted.clear();acceptedCount=0;cursor=head;resyncScheduled=false; }
                Bundle ack=request();ack.putString("view_token",view);ack.putLong("head_sequence",head);requireOk(transact(WarningWire.ACK,ack));
                established.complete(true);return;
            }
            index=next;q=request();q.putString("view_token",view);q.putInt("index",index);
        }
        throw new IllegalArgumentException("SNAPSHOT_PAGES");
    }
    private WarningEvent snapshotEvent(Bundle b,long head) {
        WarningEvent event=WarningCodec.decode(b,SystemClock.elapsedRealtime());
        if(!session.equals(event.providerSession) || event.sequence>head)throw new IllegalArgumentException("SNAPSHOT_EVENT");return event;
    }
    private static void validateSnapshot(List<WarningEvent> state,List<WarningEvent> records,boolean resync) {
        Set<String> ids=new HashSet<>();for(WarningEvent event:state)if(!ids.add(event.warningId) || event.operation==WarningEvent.Operation.CLEAR)throw new IllegalArgumentException("SNAPSHOT_STATE");
        long previous=0;for(WarningEvent event:records) { if(event.sequence<=previous || (!resync && previous!=0 && event.sequence!=previous+1))throw new IllegalArgumentException("SNAPSHOT_ORDER");previous=event.sequence; }
    }
    private static Candidate candidate(Bundle a,Bundle p,long now) {
        WarningEvent authority=WarningCodec.decode(a,now),payload=WarningCodec.decode(p,now);
        if(authority.operation!=WarningEvent.Operation.ANNOUNCE || !authority.providerSession.equals(payload.providerSession)
                || !authority.warningId.equals(payload.warningId) || authority.phase!=payload.phase || authority.announcementIndex!=payload.announcementIndex
                || payload.revision<authority.revision || payload.operation==WarningEvent.Operation.CLEAR)throw new IllegalArgumentException("ANNOUNCEMENT_PAYLOAD");
        return new Candidate(authority,payload);
    }
    public CompletableFuture<Claim> claim(WarningAudioOwner.Mode mode,boolean ready) {
        return submit(()-> { Bundle q=request();q.putString("mode",mode.name());q.putBoolean("ready",ready);Claim reply=new Claim(transact(WarningWire.CLAIM_AUDIO,q));if(reply.lease!=null)knownLease=reply.lease;return reply; });
    }
    public CompletableFuture<Claim> renew(Lease lease,WarningAudioOwner.Mode mode,boolean ready) {
        return submit(()-> { Bundle q=owned(lease);q.putString("mode",mode.name());q.putBoolean("ready",ready);Claim reply=new Claim(transact(WarningWire.RENEW_AUDIO,q));if(reply.lease!=null)knownLease=reply.lease;return reply; });
    }
    public CompletableFuture<Attempt> begin(Lease lease,WarningEvent event,String attemptNonce) { return attempt(lease,event,attemptNonce,null); }
    public CompletableFuture<Attempt> decide(Lease lease,WarningEvent event,String attemptNonce,PlaybackGrant.Outcome decision) { return attempt(lease,event,attemptNonce,decision); }
    private CompletableFuture<Attempt> attempt(Lease lease,WarningEvent event,String attemptNonce,PlaybackGrant.Outcome decision) {
        if(decision==null)grantRequestPending=true;
        return submit(()-> {
            Bundle q=owned(lease);q.putString("warning_id",event.warningId);q.putString("phase",event.phase.name().toLowerCase(java.util.Locale.ROOT));
            q.putLong("announcement_index",event.announcementIndex);q.putLong("revision",event.revision);q.putString("attempt_nonce",attemptNonce);
            if(decision!=null)q.putString("decision",decision.name());
            Attempt result=new Attempt(transact(WarningWire.BEGIN_ATTEMPT,q),SystemClock.elapsedRealtime());
            if(decision==null) {
                outputOutstanding="GRANTED".equals(result.status) || "TIMEOUT".equals(result.status) || "STORAGE_FAILED".equals(result.status)
                        || result.grant!=null && result.grant.granted;
                grantRequestPending=false;
            }
            if(result.grant!=null && (result.grant.ownerUid!=android.os.Process.myUid() || !result.grant.consumerNonce.equals(nonce)
                    || !result.grant.attemptNonce.equals(attemptNonce) || !result.grant.ownerToken.equals(lease.token) || result.grant.ownerEpoch!=lease.epoch))
                throw new SecurityException("GRANT_IDENTITY");
            if("GRANTED".equals(result.status) && (result.grant==null || result.candidate==null || result.grant.revision!=event.revision || result.grant.mode!=lease.mode
                    || !result.candidate.authority.warningId.equals(event.warningId) || result.candidate.authority.phase!=event.phase
                    || result.candidate.authority.announcementIndex!=event.announcementIndex
                    || !result.grant.eventKey.equals(PlaybackGrant.key(result.candidate.authority))))throw new SecurityException("GRANT_PAYLOAD");
            return result;
        });
    }
    public CompletableFuture<String> outcome(PlaybackGrant grant,PlaybackGrant.Outcome outcome,boolean quiescent) {
        return submit(()-> { Bundle q=request();q.putBundle("grant",WarningWire.grant(grant));q.putString("outcome",outcome.name());q.putBoolean("quiescent",quiescent);
            String result=WarningWire.text(transact(WarningWire.OUTCOME,q),"status");
            if("OK".equals(result) && quiescent && PlaybackGrant.terminal(outcome))outputOutstanding=false;return result; });
    }
    public CompletableFuture<String> release(Lease lease) {
        return submit(()-> {
            String result=WarningWire.text(transact(WarningWire.RELEASE,lease==null?request():owned(lease)),"status");
            if(retiring && "STALE_OWNER".equals(result))result=WarningWire.text(transact(WarningWire.RELEASE,request()),"status");
            if("OK".equals(result)){knownLease=null;if(retiring)close();}return result;
        });
    }
    private Bundle owned(Lease lease) { Bundle q=request();q.putString("owner_token",lease.token);q.putLong("owner_epoch",lease.epoch);return q; }
    private Bundle request() {
        if(closed || registration==null)throw new IllegalStateException("CONNECTION_UNAVAILABLE");
        Bundle q=new Bundle();q.putString("registration_token",registration);return q;
    }
    private Bundle transact(int code,Bundle q) throws RemoteException {
        if(closed)throw new IllegalStateException("CLOSED");
        if(retiring && code!=WarningWire.OUTCOME && code!=WarningWire.RELEASE)throw new IllegalStateException("RETIRED");
        Parcel in=Parcel.obtain(),out=Parcel.obtain();
        try {
            in.writeInterfaceToken(WarningWire.DESCRIPTOR);in.writeBundle(WarningWire.checked(q));
            if(!endpoint.transact(code,in,out,0))throw new RemoteException("WARNING_TRANSACTION");
            out.readException();if(out.dataAvail()>WarningWire.MAX_FRAME)throw new IllegalArgumentException("FRAME_SIZE");
            Bundle result=out.readBundle(null);if(result==null)throw new IllegalArgumentException("WARNING_RESPONSE");return result;
        }finally { in.recycle();out.recycle(); }
    }
    private static void requireOk(Bundle b) { if(!"OK".equals(WarningWire.text(b,"status")))throw new IllegalStateException(WarningWire.text(b,"status")); }
    private interface Work<T> { T run() throws Exception; }
    private <T> CompletableFuture<T> submit(Work<T> task) {
        CompletableFuture<T> result=new CompletableFuture<>();
        if(closed) { result.completeExceptionally(new IllegalStateException("CLOSED"));return result; }
        try { control.execute(()-> {
            try { if(closed)throw new IllegalStateException("CLOSED");result.complete(task.run()); }
            catch(Exception error) { result.completeExceptionally(error);if(!retiring)fail(error instanceof SecurityException?"NOT_AUTHORIZED":"CONNECTION_FAILED"); }
        }); }catch(RejectedExecutionException error) { result.completeExceptionally(error);fail("RECEIVER_OVERLOADED"); }
        return result;
    }
    private void fail(String reason) {
        if(closed)return;closed=true;confirmed=false;established.complete(false);
        IBinder source=endpoint;if(source!=null)source.unlinkToDeath(death,0);
        synchronized(incoming) { accepted.clear();acceptedCount=0; }
        if(ownsWorker)control.shutdown();listener.disconnected(reason);
    }
    @Override public void close() { fail("CLOSED"); }
    /** Keep only terminal/release IPC briefly available while local output is being cancelled. */
    public void retire() {
        if(closed || retiring)return;
        if(!confirmed){close();return;}
        retiring=true;listener.disconnected("RETIRED");
        if(!outputOutstanding && !grantRequestPending)release(knownLease).whenComplete((result,error)->close());
        new Handler(Looper.getMainLooper()).postDelayed(this::close,40000);
    }
}
