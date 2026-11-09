package nl.johninnl.navigation.alerts;

import android.content.Context;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Process;
import android.os.RemoteException;
import android.os.SystemClock;
import android.util.Log;
import java.io.Closeable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.CompletableFuture;
import java.util.function.IntSupplier;
import java.util.function.LongSupplier;

/** Authenticated source endpoint. Native capture only enqueues; disk and callbacks run off UI. */
public final class WarningEndpoint implements Closeable {
    public interface AccessPolicy { String authorize(int uid); }
    interface StorageFactory { Storage open() throws IOException; }
    static final class Storage {
        final String boot;
        final PlaybackStore store;
        final Closeable resource;
        Storage(String boot,PlaybackStore store,Closeable resource) { this.boot=boot;this.store=store;this.resource=resource; }
    }
    private static final int MAX_CLIENTS=4, QUEUE_SIZE=128;
    private static final long CLIENT_TIMEOUT=45000, VIEW_TIMEOUT=30000;
    private final AccessPolicy access;
    private final WarningCapabilities profile;
    private final LongSupplier clock;
    private final IntSupplier caller;
    private final int sourceUid;
    private final String session=UUID.randomUUID().toString();
    private final WarningJournal journal=new WarningJournal(session);
    private final ThreadPoolExecutor actor=worker("warning-source",QUEUE_SIZE);
    private final ScheduledExecutorService timer=Executors.newSingleThreadScheduledExecutor(r->thread(r,"warning-maintenance"));
    private final Map<String,Registration> registrations=new LinkedHashMap<>();
    private final Slot[] slots=new Slot[MAX_CLIENTS];
    private final Object ingress=new Object();
    // Loading the durable ledger is asynchronous. Until it is known, legacy delivery
    // must not escape a fence that a previous process left for uncertain playback.
    private volatile boolean closed,captureFault,exclusive=true;
    private volatile String audioStatus="INITIALIZING";
    private volatile Set<String> capable=Collections.emptySet();
    private WarningAudioOwner audio;
    private final WarningLegacyClients legacyClients=new WarningLegacyClients();
    private Storage storage;
    private long head;
    private WarningAudioOwner.Lease lastOwner;

    public WarningEndpoint(Context context,AccessPolicy access,WarningCapabilities profile) {
        this(Process.myUid(),access,profile,()-> {
            String boot=AtomicPlaybackStore.bootIdentity(context);
            AtomicPlaybackStore store=new AtomicPlaybackStore(context);
            return new Storage(boot,store,store);
        },SystemClock::elapsedRealtime,Binder::getCallingUid);
    }
    WarningEndpoint(int uid,AccessPolicy access,WarningCapabilities profile,StorageFactory factory,LongSupplier clock,IntSupplier caller) {
        if(access==null || profile==null || factory==null || clock==null || caller==null)throw new IllegalArgumentException("ENDPOINT_CONFIGURATION");
        this.sourceUid=uid;this.access=access;this.profile=profile;this.clock=clock;this.caller=caller;
        for(int i=0;i<slots.length;i++)slots[i]=new Slot(i);
        actor.execute(()-> {
            try { storage=factory.open();audio=new WarningAudioOwner(storage.boot,session,journal,storage.store,profile);refresh(); }
            catch(IOException | RuntimeException error) { exclusive=true;audioStatus="STORAGE_FAILED"; }
        });
        timer.scheduleAtFixedRate(()->post(this::maintenance),1,1,TimeUnit.SECONDS);
    }
    private final Binder endpoint=new Binder() {
        { attachInterface(null,WarningWire.DESCRIPTOR); }
        @Override protected boolean onTransact(int code,Parcel data,Parcel reply,int flags) throws RemoteException {
            // UID authorization precedes even Bundle decoding and descriptor discovery.
            int uid=caller.getAsInt();String packageName=access.authorize(uid);
            if(packageName==null)throw new SecurityException("WARNING_CALLER");
            if(code==IBinder.INTERFACE_TRANSACTION) { reply.writeString(WarningWire.DESCRIPTOR);return true; }
            if(code<WarningWire.REGISTER || code>WarningWire.PREVIEW)return super.onTransact(code,data,reply,flags);
            data.enforceInterface(WarningWire.DESCRIPTOR);
            if(data.dataAvail()>WarningWire.MAX_FRAME)throw new IllegalArgumentException("FRAME_SIZE");
            Bundle request=data.readBundle(null);
            if(request==null)throw new IllegalArgumentException("REQUEST_REQUIRED");
            if(data.dataAvail()!=0)throw new IllegalArgumentException("TRAILING_DATA");
            Bundle result=invoke(()->handle(code,uid,packageName,request));
            reply.writeNoException();reply.writeBundle(WarningWire.checked(result));return true;
        }
    };
    public IBinder binder() { return endpoint; }
    public String sourceSession() { return session; }
    public boolean exclusiveAudio() { return exclusive; }
    public String audioStatus(){return audioStatus;}
    /** Source-process UI only. Never exposed as a receiver-controlled Binder reset flag. */
    public CompletableFuture<String> recoverAfterParkedStop(){
        if(Process.myUid()!=sourceUid)throw new SecurityException("RECOVERY_SOURCE_UID");
        CompletableFuture<String> result=new CompletableFuture<>();
        try{actor.execute(()->{
            if(audio==null){result.complete("STORAGE_FAILED");return;}
            WarningAudioOwner.Snapshot snapshot=audio.snapshot(clock.getAsLong());
            if(snapshot.owner!=null&&snapshot.owner.ready){result.complete("OUTPUT_ACTIVE");return;}
            String status=audio.resetAfterVerifiedParkedStop().name();
            if(status.equals("OK"))for(Registration r:registrations.values()){
                r.synced=false;r.view=null;r.deliveryGeneration++;r.invalidationPending=true;verifyOrDeliver(r);
            }
            refresh();result.complete(status);
        });}catch(RejectedExecutionException error){result.complete("OVERLOADED");}
        return result;
    }
    public Set<String> capablePackages() { return capable; }
    public void controlClient(int uid,boolean warningAware){
        if(uid==sourceUid || access.authorize(uid)==null)return;
        post(()->{legacyClients.observe(uid,warningAware,clock.getAsLong());refresh();});
    }
    /** Losing a native record must be visible and must prevent new exclusive playback grants. */
    public void captureOverflow() { failCapture("NATIVE_CAPTURE_OVERFLOW");post(()-> { for(Registration r:new ArrayList<>(registrations.values()))deliver(r);refresh(); }); }

    /** Keep the native observation and deadlines. Issued time is captured before any actor backlog. */
    public boolean emit(Bundle nativeFields) {
        if(nativeFields==null || closed)return false;
        synchronized(ingress) {
            Bundle fields=new Bundle(nativeFields);
            long issued=clock.getAsLong();
            try { actor.execute(()->append(fields,issued));return true; }
            catch(RejectedExecutionException error) { failCapture("SOURCE_INGRESS_OVERFLOW");return false; }
        }
    }
    private void append(Bundle fields,long issued) {
        if(closed)return;
        try {
            fields.putInt("protocol_version",1);fields.putString("provider_session",session);
            fields.putLong("sequence",head+1);fields.putLong("issued_elapsed_ms",issued);
            long observed=WarningWire.number(fields,"observed_elapsed_ms");
            if(!fields.containsKey("state_until_elapsed_ms"))fields.putLong("state_until_elapsed_ms",observed+WarningEvent.STATE_WINDOW_MS);
            if("ANNOUNCE".equals(fields.getString("operation")) && !fields.containsKey("announce_until_elapsed_ms"))
                fields.putLong("announce_until_elapsed_ms",issued+(fields.getInt("priority",2)==0 || "moving_emergency".equals(fields.getString("relevance"))?5000:10000));
            WarningEvent event=WarningCodec.decode(fields,clock.getAsLong());
            WarningJournal.Append result=journal.append(event,clock.getAsLong());
            if(result==WarningJournal.Append.ACCEPTED || result==WarningJournal.Append.OVERFLOW)head=event.sequence;
            if(result==WarningJournal.Append.ACCEPTED)WarningDiagnostics.event(event,"SOURCE_APPEND",clock.getAsLong());
            if(result==WarningJournal.Append.OVERFLOW)failCapture("JOURNAL_OVERFLOW");
            if(result==WarningJournal.Append.ACCEPTED || result==WarningJournal.Append.OVERFLOW)
                for(Registration registration:new ArrayList<>(registrations.values()))deliver(registration);
            refresh();
        }catch(IllegalArgumentException error) {
            String reason=error.getMessage();
            failCapture(reason!=null&&reason.matches("[A-Za-z0-9_]{1,48}")?"INVALID_NATIVE_EVENT:"+reason:"INVALID_NATIVE_EVENT");
            refresh();
        }
    }
    private Bundle handle(int code,int uid,String packageName,Bundle q) {
        if(closed)return WarningWire.status("CLOSED");
        if(audio!=null)audio.legacyReceiverActive(legacyClients.legacyActive(clock.getAsLong()));
        if(code==WarningWire.REGISTER)return register(uid,packageName,q);
        Registration r=registration(uid,q);
        r.touched=clock.getAsLong();
        if(code==WarningWire.CONFIRM) {
            if(!r.challenge.equals(WarningWire.text(q,"challenge")) || r.callback!=q.getBinder("callback"))throw new SecurityException("CALLBACK_CHALLENGE");
            r.confirmed=true;refresh();return metadata(WarningWire.status("OK"));
        }
        if(!r.confirmed)throw new SecurityException("CALLBACK_UNCONFIRMED");
        Bundle result;
        switch(code) {
            case WarningWire.PING:return metadata(WarningWire.status("OK"));
            case WarningWire.PREVIEW:
                if(audio==null)return WarningWire.status("STORAGE_FAILED");
                WarningAudioOwner.Snapshot current=audio.snapshot(clock.getAsLong());
                if(!ownLease(r,current.owner)||!current.owner.token.equals(WarningWire.text(q,"owner_token"))||current.owner.epoch!=WarningWire.number(q,"owner_epoch"))return WarningWire.status("STALE_OWNER");
                if(current.code!=WarningAudioOwner.Code.OK)return WarningWire.status(current.code.name());
                if(current.pending!=null)return WarningWire.status("OUTPUT_ACTIVE");
                String previewNonce=WarningWire.text(q,"preview_nonce");if(!PlaybackGrant.uuid(previewNonce))throw new IllegalArgumentException("PREVIEW_NONCE");
                boolean dutch=WarningWire.text(q,"language").toLowerCase(java.util.Locale.ROOT).startsWith("nl");
                long at=clock.getAsLong();Bundle example=new Bundle();example.putString("operation","ANNOUNCE");example.putString("warning_id","synthetic-preview-"+previewNonce);example.putLong("revision",1);example.putLong("announcement_index",1);example.putString("phase","notice");example.putString("native_type","SYNTHETIC_PREVIEW");example.putString("native_subtype","EXAMPLE");example.putString("category","preview");example.putInt("priority",2);
                example.putString("message",dutch?"Synthetisch voorbeeld. Een hulpdienst nadert van achteren.":"Synthetic preview. An emergency vehicle is approaching from behind.");example.putString("language_tag",dutch?"nl":"en");example.putString("message_origin","template");example.putString("relevance","notice");example.putString("relationship","behind");example.putLong("observed_elapsed_ms",at);example.putLong("state_until_elapsed_ms",at+10000);example.putLong("announce_until_elapsed_ms",at+10000);example.putBoolean("is_preview",true);example.putString("preview_nonce",previewNonce);
                append(example,at);WarningJournal.Announcement synthetic=journal.announcement("synthetic-preview-"+previewNonce,WarningEvent.Phase.NOTICE,1,clock.getAsLong());
                if(synthetic==null)return WarningWire.status("OVERFLOW");
                Bundle preview=WarningWire.status("OK");preview.putBundle("authority",WarningCodec.encode(synthetic.authority));preview.putBundle("payload",WarningCodec.encode(synthetic.payload));return preview;
            case WarningWire.GET_STATE:
            case WarningWire.RESUME: return view(r,q);
            case WarningWire.ACK:
                if(r.view==null || !r.view.token.equals(WarningWire.text(q,"view_token")) || !r.view.delivered
                        || r.view.head!=WarningWire.number(q,"head_sequence") || clock.getAsLong()>=r.view.until)
                    return WarningWire.status("STALE_VIEW");
                r.cursor=r.view.head;r.captureFaultAcknowledged=r.view.captureFault;
                r.synced=true;r.view=null;deliver(r);return WarningWire.status("OK");
            case WarningWire.CLAIM_AUDIO:
            case WarningWire.RENEW_AUDIO:
                if(audio==null)return WarningWire.status("STORAGE_FAILED");
                if(captureFault)return WarningWire.status("OVERFLOW");
                if(!r.synced)return WarningWire.status("RESYNC_REQUIRED");
                WarningAudioOwner.Mode mode=WarningAudioOwner.Mode.valueOf(WarningWire.text(q,"mode"));
                boolean ready=WarningWire.flag(q,"ready");
                WarningAudioOwner.Claim claim=code==WarningWire.CLAIM_AUDIO?
                        audio.claim(uid,r.client,mode,ready,clock.getAsLong()):
                        audio.renew(uid,r.client,WarningWire.text(q,"owner_token"),WarningWire.number(q,"owner_epoch"),mode,ready,clock.getAsLong());
                result=WarningWire.status(claim.code.name());
                if(claim.lease!=null)result.putString("owner_package",claim.lease.packageName);
                if(ownLease(r,claim.lease))result.putBundle("lease",lease(claim.lease));
                break;
            case WarningWire.BEGIN_ATTEMPT:
                if(audio==null)return WarningWire.status("STORAGE_FAILED");
                if(captureFault)return WarningWire.status("OVERFLOW");
                if(!r.synced)return WarningWire.status("RESYNC_REQUIRED");
                WarningEvent.Phase phase=WarningEvent.Phase.valueOf(WarningWire.text(q,"phase").toUpperCase(java.util.Locale.ROOT));
                WarningAudioOwner.GrantResult grant;
                if(q.containsKey("decision"))grant=audio.decide(uid,r.client,WarningWire.text(q,"owner_token"),WarningWire.number(q,"owner_epoch"),
                        WarningWire.text(q,"warning_id"),phase,WarningWire.number(q,"announcement_index"),WarningWire.text(q,"attempt_nonce"),
                        PlaybackGrant.Outcome.valueOf(WarningWire.text(q,"decision")),clock.getAsLong());
                else grant=audio.begin(uid,r.client,WarningWire.text(q,"owner_token"),WarningWire.number(q,"owner_epoch"),
                        WarningWire.text(q,"warning_id"),phase,WarningWire.number(q,"announcement_index"),WarningWire.number(q,"revision"),WarningWire.text(q,"attempt_nonce"),clock.getAsLong());
                result=WarningWire.status(grant.code.name());
                if(grant.grant!=null&&grant.code==WarningAudioOwner.Code.GRANTED)WarningDiagnostics.grant(grant.grant,"GRANT_PERSISTED",clock.getAsLong());
                if(grant.grant!=null && grant.grant.ownerUid==uid && grant.grant.consumerNonce.equals(r.client.consumerNonce)
                        && grant.grant.attemptNonce.equals(WarningWire.text(q,"attempt_nonce"))
                        && grant.grant.ownerToken.equals(WarningWire.text(q,"owner_token"))
                        && grant.grant.ownerEpoch==WarningWire.number(q,"owner_epoch"))result.putBundle("grant",WarningWire.grant(grant.grant));
                if(grant.announcement!=null) { result.putBundle("authority",WarningCodec.encode(grant.announcement.authority));result.putBundle("payload",WarningCodec.encode(grant.announcement.payload)); }
                break;
            case WarningWire.OUTCOME:
                if(audio==null)return WarningWire.status("STORAGE_FAILED");
                Bundle value=q.getBundle("grant");if(value==null)throw new IllegalArgumentException("GRANT_REQUIRED");
                result=WarningWire.status(audio.outcome(uid,r.client.consumerNonce,WarningWire.grant(value),
                        PlaybackGrant.Outcome.valueOf(WarningWire.text(q,"outcome")),WarningWire.flag(q,"quiescent"),clock.getAsLong()).name());break;
            case WarningWire.RELEASE:
                if(q.containsKey("owner_token") && audio!=null) {
                    WarningAudioOwner.Code released=audio.release(uid,r.client,WarningWire.text(q,"owner_token"),WarningWire.number(q,"owner_epoch"),clock.getAsLong());
                    if(released!=WarningAudioOwner.Code.OK)return WarningWire.status(released.name());
                }
                remove(r);result=WarningWire.status("OK");break;
            default:throw new IllegalArgumentException("TRANSACTION");
        }
        refresh();return result;
    }
    private Bundle register(int uid,String pkg,Bundle q) {
        IBinder callback=q.getBinder("callback");if(callback==null)throw new IllegalArgumentException("CALLBACK_REQUIRED");
        String token=UUID.randomUUID().toString();
        WarningAudioOwner.Client client=new WarningAudioOwner.Client(uid,pkg,token,WarningWire.text(q,"consumer_nonce"),
                WarningWire.strings(q,"capabilities"),WarningWire.modes(q),profile.digest);
        Slot selected=null;
        for(Slot slot:slots)if(slot.uid==uid) { selected=slot;break; }
        if(selected==null)for(Slot slot:slots)if(slot.registration==null && !slot.busy) { selected=slot;break; }
        if(selected==null)return WarningWire.status("REGISTRATION_LIMIT");
        if(selected.registration!=null)remove(selected.registration);
        selected.uid=uid;
        Registration r=new Registration(client,callback,selected);selected.registration=r;registrations.put(token,r);
        try { callback.linkToDeath(r.death,0); }
        catch(RemoteException error) { remove(r);return WarningWire.status("CALLBACK_DEAD"); }
        Bundle challenge=base(r);challenge.putString("challenge",r.challenge);
        r.verifySent=send(r,WarningWire.VERIFY,challenge,null);
        Bundle response=metadata(WarningWire.status("VERIFYING"));response.putString("registration_token",token);return response;
    }
    private Registration registration(int uid,Bundle q) {
        Registration r=registrations.get(WarningWire.text(q,"registration_token"));
        if(r==null || r.client.uid!=uid)throw new SecurityException("WARNING_REGISTRATION");return r;
    }
    private Bundle metadata(Bundle b) {
        b.putInt("protocol_version",1);b.putInt("source_uid",sourceUid);b.putString("provider_session",session);b.putLong("head_sequence",head);
        b.putString("manifest_digest",profile.manifestDigest);b.putString("capability_digest",profile.digest);b.putBoolean("capture_complete",profile.complete && !captureFault);
        b.putStringArrayList("required_capabilities",new ArrayList<>(profile.required));b.putBoolean("preview_supported",true);return b;
    }
    private Bundle base(Registration r) { Bundle b=new Bundle();b.putString("registration_token",r.client.registration);b.putString("provider_session",session);b.putString("consumer_nonce",r.client.consumerNonce);return b; }

    /** Freeze the view at one journal head; subsequent pages never mix newer native state. */
    private Bundle view(Registration r,Bundle q) {
        long now=clock.getAsLong();
        if(!q.containsKey("view_token")) {
            String prior=q.containsKey("provider_session")?WarningWire.text(q,"provider_session"):session;
            long after=q.containsKey("after_sequence")?WarningWire.number(q,"after_sequence"):0;
            WarningJournal.Resume resume=journal.resume(prior,after,now);
            List<Bundle> items=new ArrayList<>();
            for(WarningEvent event:resume.currentState)items.add(item("state","event",WarningCodec.encode(event)));
            for(WarningEvent event:resume.events)items.add(item("record","event",WarningCodec.encode(event)));
            for(WarningJournal.Announcement announcement:resume.announcements) {
                Bundle b=item("announcement","authority",WarningCodec.encode(announcement.authority));b.putBundle("payload",WarningCodec.encode(announcement.payload));items.add(b);
            }
            if(audio!=null)for(PlaybackGrant grant:audio.dispositions(r.client.uid,r.client.consumerNonce,now))items.add(item("disposition","grant",WarningWire.grant(grant)));
            boolean fault=captureFault;
            r.view=new View(resume.headSequence,resume.resyncRequired || fault,fault,items,now+VIEW_TIMEOUT);
            r.invalidationPending=false; // An explicit fresh snapshot satisfies a deferred invalidation.
            // A live callback already in flight cannot advance a new snapshot's cursor.
            r.synced=false;r.deliveryGeneration++;
        }
        View v=r.view;
        if(v==null || now>=v.until || (q.containsKey("view_token") && !v.token.equals(WarningWire.text(q,"view_token"))))return WarningWire.status("STALE_VIEW");
        int from=q.containsKey("index")?WarningWire.integer(q,"index"):0;
        if(from<0 || from>v.items.size() || from>v.next)return WarningWire.status("VIEW_CURSOR");
        Bundle result=metadata(WarningWire.status("OK"));result.putString("view_token",v.token);result.putLong("head_sequence",v.head);result.putBoolean("resync_required",v.resync);
        ArrayList<Bundle> page=new ArrayList<>();int to=from,count=0;
        while(to<v.items.size()) {
            Bundle next=v.items.get(to);int cost="announcement".equals(next.getString("item_type"))?2:1;
            if(count+cost>WarningCodec.MAX_BATCH_EVENTS)break;
            page.add(next);result.putParcelableArrayList("items",page);
            if(WarningCodec.encodedSize(result)>WarningCodec.MAX_BATCH_BYTES-1024) { page.remove(page.size()-1);break; }
            count+=cost;to++;
        }
        if(to==from && from<v.items.size())throw new IllegalStateException("VIEW_ITEM_SIZE");
        result.putParcelableArrayList("items",page);result.putInt("next_index",to);result.putBoolean("done",to==v.items.size());
        v.next=Math.max(v.next,to);v.delivered=v.delivered || to==v.items.size();appendAudio(result,r);return result;
    }
    private static Bundle item(String type,String field,Bundle data) { Bundle b=new Bundle();b.putString("item_type",type);b.putBundle(field,data);return b; }
    private void appendAudio(Bundle result,Registration r) {
        if(audio==null) { result.putString("audio_status","STORAGE_FAILED");return; }
        WarningAudioOwner.Snapshot snapshot=audio.snapshot(clock.getAsLong());result.putString("audio_status",snapshot.code.name());
        if(ownLease(r,snapshot.owner))result.putBundle("lease",lease(snapshot.owner));
        if(snapshot.pending!=null && snapshot.pending.ownerUid==r.client.uid && snapshot.pending.consumerNonce.equals(r.client.consumerNonce))result.putBundle("pending",WarningWire.grant(snapshot.pending));
    }
    private boolean ownLease(Registration r,WarningAudioOwner.Lease value) {
        // One UID can reconnect with a new nonce, but it must not inherit the previous lease.
        return value!=null && value.uid==r.client.uid && lastLeaseClientMatches(r,value);
    }
    private boolean lastLeaseClientMatches(Registration r,WarningAudioOwner.Lease value) {
        return audio!=null && audio.leaseBelongsTo(value,r.client);
    }
    private static Bundle lease(WarningAudioOwner.Lease value) {
        Bundle b=new Bundle();b.putString("owner_token",value.token);b.putLong("owner_epoch",value.epoch);b.putLong("until_elapsed_ms",value.until);b.putString("mode",value.mode.name());b.putBoolean("ready",value.ready);return b;
    }
    private void deliver(Registration r) {
        if(!r.confirmed || !r.synced || r.slot.busy || r.slot.registration!=r)return;
        WarningJournal.Resume resume=journal.resume(session,r.cursor,clock.getAsLong());
        // A sticky capture fault still fences audio, but its acknowledged snapshot must
        // not trigger an immediate ACK -> invalidation -> RESUME loop. The frozen
        // view records whether that fault was actually visible before acknowledgement.
        if(resume.resyncRequired || captureFault&&!r.captureFaultAcknowledged) {
            r.synced=false;Bundle b=base(r);b.putLong("head_sequence",resume.headSequence);b.putBoolean("resync_required",true);
            send(r,WarningWire.STATE_INVALIDATED,b,null);return;
        }
        if(resume.events.isEmpty())return;
        Bundle batch=WarningCodec.splitBatches(resume.events).get(0);
        List<WarningEvent> records=WarningCodec.decodeBatch(batch,clock.getAsLong());long through=records.get(records.size()-1).sequence;
        Bundle b=base(r);b.putBundle("batch",batch);b.putLong("through_sequence",through);
        long cursor=r.cursor,generation=r.deliveryGeneration;
        send(r,WarningWire.EVENTS,b,response-> {
            if(generation!=r.deliveryGeneration || !r.synced || cursor!=r.cursor)return;
            if(WarningWire.number(response,"accepted_sequence")!=through) { r.synced=false;return; }
            r.cursor=through;r.touched=clock.getAsLong();
        });
    }
    private interface Reply { void accept(Bundle response); }
    private boolean send(Registration r,int code,Bundle payload,Reply accepted) {
        Slot slot=r.slot;if(slot.busy || slot.registration!=r)return false;slot.busy=true;
        try { slot.worker.execute(()-> {
            Bundle response=null;Exception failure=null;
            Parcel in=Parcel.obtain(),out=Parcel.obtain();
            try {
                if(!WarningWire.CALLBACK.equals(r.callback.getInterfaceDescriptor()))throw new SecurityException("CALLBACK_DESCRIPTOR");
                in.writeInterfaceToken(WarningWire.CALLBACK);in.writeBundle(WarningWire.checked(payload));
                if(code==WarningWire.EVENTS)for(WarningEvent event:WarningCodec.decodeBatch(payload.getBundle("batch"),clock.getAsLong()))WarningDiagnostics.event(event,"CALLBACK_SEND",clock.getAsLong());
                if(!r.callback.transact(code,in,out,0))throw new RemoteException("CALLBACK_TRANSACTION");
                out.readException();if(out.dataAvail()>WarningWire.MAX_FRAME)throw new IllegalArgumentException("FRAME_SIZE");
                response=out.readBundle(null);if(response==null)throw new IllegalArgumentException("CALLBACK_RESPONSE");
            }catch(Exception error) { failure=error; }
            finally { in.recycle();out.recycle(); }
            final Bundle result=response;final Exception error=failure;
            post(()-> {
                slot.busy=false;
                if(slot.registration!=r) { if(slot.registration!=null)verifyOrDeliver(slot.registration);return; }
                if(error!=null) { remove(r);refresh();return; }
                try { if(accepted!=null)accepted.accept(result); }
                catch(RuntimeException invalid) { remove(r);refresh();return; }
                verifyOrDeliver(r);
            });
        });return true; }catch(RejectedExecutionException error) { slot.busy=false;remove(r);return false; }
    }
    private void verifyOrDeliver(Registration r) {
        if(!r.confirmed && !r.verifySent) { Bundle b=base(r);b.putString("challenge",r.challenge);r.verifySent=send(r,WarningWire.VERIFY,b,null); }
        else if(r.confirmed && r.revocationPending!=0) {
            Bundle b=base(r);b.putLong("owner_epoch",r.revocationPending);
            if(send(r,WarningWire.OWNER_REVOKED,b,null))r.revocationPending=0;
        }else if(r.confirmed && r.invalidationPending) {
            Bundle b=base(r);b.putBoolean("resync_required",true);
            // A callback in flight must finish first; its completion retries this notification.
            if(send(r,WarningWire.STATE_INVALIDATED,b,null))r.invalidationPending=false;
        }else deliver(r);
    }
    private void maintenance() {
        if(closed)return;long now=clock.getAsLong();
        for(Registration r:new ArrayList<>(registrations.values())) {
            if(now-r.touched>=CLIENT_TIMEOUT)remove(r);
            else { if(r.view!=null && now>=r.view.until)r.view=null;deliver(r); }
        }
        refresh();
    }
    private void refresh() {
        HashSet<String> packages=new HashSet<>();for(Registration r:registrations.values())if(r.confirmed)packages.add(r.client.packageName);
        capable=Collections.unmodifiableSet(packages);
        if(audio==null) { exclusive=true;audioStatus="STORAGE_FAILED";return; }
        audio.legacyReceiverActive(legacyClients.legacyActive(clock.getAsLong()));
        WarningAudioOwner.Snapshot snapshot=audio.snapshot(clock.getAsLong());exclusive=snapshot.exclusive;
        audioStatus=snapshot.code==WarningAudioOwner.Code.STORAGE_FAILED||snapshot.code==WarningAudioOwner.Code.AUDIO_UNCERTAIN?snapshot.code.name():captureFault?"OVERFLOW":!profile.complete?"COVERAGE_INCOMPLETE":snapshot.owner!=null&&snapshot.owner.ready&&snapshot.owner.mode==WarningAudioOwner.Mode.SILENT?"USER_MUTED":snapshot.owner!=null&&snapshot.owner.ready?"BUSY:"+snapshot.owner.packageName:snapshot.code.name();
        if(lastOwner!=null && (snapshot.owner==null || lastOwner.epoch!=snapshot.owner.epoch || lastOwner.ready&&!snapshot.owner.ready)) {
            for(Registration r:registrations.values())if(ownLease(r,lastOwner)) {
                r.revocationPending=Math.max(r.revocationPending,lastOwner.epoch);verifyOrDeliver(r);
            }
        }
        lastOwner=snapshot.owner;
    }
    private void remove(Registration r) {
        registrations.remove(r.client.registration);if(r.slot.registration==r)r.slot.registration=null;
        r.callback.unlinkToDeath(r.death,0);
        if(audio!=null)audio.consumerDied(r.client.uid,r.client.registration,clock.getAsLong());
    }
    private Bundle invoke(Callable<Bundle> task) {
        Future<Bundle> future;
        try { future=actor.submit(task); }
        catch(RejectedExecutionException error) { return WarningWire.status(closed?"CLOSED":"OVERLOADED"); }
        try { return future.get(3,TimeUnit.SECONDS); }
        catch(InterruptedException error) { Thread.currentThread().interrupt();return WarningWire.status("INTERRUPTED"); }
        catch(TimeoutException error) { return WarningWire.status("TIMEOUT"); }
        catch(ExecutionException error) {
            Throwable cause=error.getCause();if(cause instanceof RuntimeException)throw (RuntimeException)cause;
            throw new IllegalStateException(cause);
        }
    }
    private synchronized void failCapture(String reason) {
        if(captureFault)return;
        captureFault=true;
        // One bounded reason, never native messages/coordinates or a packet dump.
        Log.w("MorpheWarnings",reason);
    }
    private void post(Runnable task) { if(!closed)try { actor.execute(task); }catch(RejectedExecutionException error) { failCapture("SOURCE_CALLBACK_QUEUE_OVERFLOW"); } }
    @Override public void close() {
        if(closed)return;closed=true;timer.shutdownNow();
        // Preserve any pending grant on disk. Closing is not proof that a receiver stopped output.
        try { actor.execute(()-> {
            for(Registration r:new ArrayList<>(registrations.values()))remove(r);
            if(storage!=null && storage.resource!=null)try { storage.resource.close(); }catch(IOException ignored) { }
        }); }catch(RejectedExecutionException ignored) { }
        actor.shutdown();for(Slot slot:slots)slot.worker.shutdown();
    }
    private static Thread thread(Runnable task,String name) { Thread t=new Thread(task,name);t.setDaemon(true);return t; }
    private static ThreadPoolExecutor worker(String name,int size) { return new ThreadPoolExecutor(1,1,0,TimeUnit.MILLISECONDS,new ArrayBlockingQueue<>(size),r->thread(r,name),new ThreadPoolExecutor.AbortPolicy()); }
    private final class Registration {
        final WarningAudioOwner.Client client;final IBinder callback;final Slot slot;final String challenge=UUID.randomUUID().toString();
        final IBinder.DeathRecipient death=()->post(()-> { remove(this);refresh(); });
        boolean confirmed,synced,verifySent,invalidationPending,captureFaultAcknowledged;long cursor,touched=clock.getAsLong(),deliveryGeneration,revocationPending;View view;
        Registration(WarningAudioOwner.Client client,IBinder callback,Slot slot) { this.client=client;this.callback=callback;this.slot=slot; }
    }
    private static final class Slot {
        int uid;boolean busy;Registration registration;final ThreadPoolExecutor worker;
        Slot(int index) { worker=worker("warning-callback-"+index,1); }
    }
    private static final class View {
        final String token=UUID.randomUUID().toString();final long head,until;final boolean resync,captureFault;final List<Bundle> items;
        int next;boolean delivered;
        View(long head,boolean resync,boolean captureFault,List<Bundle> items,long until) { this.head=head;this.resync=resync;this.captureFault=captureFault;this.items=items;this.until=until; }
    }
}
