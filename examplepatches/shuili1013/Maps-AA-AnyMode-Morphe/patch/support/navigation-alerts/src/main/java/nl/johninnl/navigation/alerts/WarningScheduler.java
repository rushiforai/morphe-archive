package nl.johninnl.navigation.alerts;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicBoolean;

/** Shared receiving scheduler. All mutable state belongs to Time's serial dispatcher. */
public final class WarningScheduler {
    public static final int MAX_PENDING=16,MAX_HANDLED=128,MAX_ATTEMPTS=2;
    private static final long PREPARE_RETRY_MS=1000;
    public interface Time { long now();void execute(Runnable task);void after(Runnable task,long delay); }
    public interface Policy {
        boolean active();WarningAudioOwner.Mode mode();boolean enabled(WarningEvent event);
        /** Only positive, fresh evidence of passage; unknown GPS/relationship is not passage. */
        boolean passed(WarningEvent event,long now);
        default WarningPassage.Relevance relevance(WarningEvent event,long now){return passed(event,now)?WarningPassage.Relevance.PASSED:WarningPassage.Relevance.RELEVANT;}
    }
    public interface Speaker {
        void prepare(String language);boolean ready(String language,WarningAudioOwner.Mode mode);
        default void prepare(String language,WarningAudioOwner.Mode mode){if(mode!=WarningAudioOwner.Mode.SILENT)prepare(language);}
        default boolean ready(WarningEvent event,WarningAudioOwner.Mode mode){return ready(event.languageTag,mode);}
        WarningAudioOwner.Mode effective(WarningAudioOwner.Mode requested);
        boolean speak(WarningEvent payload,PlaybackGrant grant,long originalDeadline,Callback callback);
        void cancel(PlaybackGrant grant);
    }
    public interface Callback {
        void started(PlaybackGrant grant);
        void finished(PlaybackGrant grant,PlaybackGrant.Outcome outcome,boolean quiescent);
    }
    public interface Observer { void changed(String status);void outcome(WarningEvent authority,PlaybackGrant.Outcome outcome); }
    public interface Transport {
        String identity();
        CompletableFuture<WarningConnection.Claim> claim(WarningAudioOwner.Mode mode,boolean ready);
        CompletableFuture<WarningConnection.Claim> renew(WarningConnection.Lease lease,WarningAudioOwner.Mode mode,boolean ready);
        CompletableFuture<WarningConnection.Attempt> begin(WarningConnection.Lease lease,WarningEvent event,String nonce);
        CompletableFuture<WarningConnection.Attempt> decide(WarningConnection.Lease lease,WarningEvent event,String nonce,PlaybackGrant.Outcome decision);
        CompletableFuture<String> outcome(PlaybackGrant grant,PlaybackGrant.Outcome outcome,boolean quiescent);
        CompletableFuture<String> release(WarningConnection.Lease lease);
        default CompletableFuture<Boolean> resync(){return CompletableFuture.completedFuture(false);}
        default CompletableFuture<WarningConnection.Candidate> preview(WarningConnection.Lease lease,String language,String nonce){return CompletableFuture.completedFuture(null);}
    }
    private static final Comparator<Pending> ORDER=Comparator.comparingInt((Pending p)->p.authority.priority.ordinal())
            .thenComparingLong(p->p.authority.announceUntil).thenComparingLong(p->p.authority.issuedAt).thenComparingLong(p->p.authority.sequence);
    private final Time time;private final Policy policy;private final Speaker speaker;private final Observer observer;
    private final Map<String,Pending> queue=new LinkedHashMap<>();
    private final Map<String,Long> handled=new LinkedHashMap<>();
    // Process-local positive evidence only: these nonces have never reached any speaker API.
    private final Map<String,String> unsubmitted=new LinkedHashMap<>();
    private final java.util.Set<String> unknownReplies=new java.util.HashSet<>();
    private Transport transport;private String session="",preparedLanguage="";
    private WarningConnection.Lease lease;
    private Active active;
    private WarningAudioOwner.Mode preparedMode;
    private long generation,cursor,nextClaim,nextRenew,ticker,nextResync,nextPrepare;
    private int grantRequests;
    private boolean coverage,controlBusy,pumping,again,unknownOutput,reconcilingSnapshot;
    private CompletableFuture<String> previewResult;
    private String previewLanguage,previewNonce;
    private long previewDeadline;
    private boolean previewRequested;
    private volatile String status="OFF";
    public WarningScheduler(Policy policy,Speaker speaker,Observer observer) { this(new MainTime(),policy,speaker,observer); }
    WarningScheduler(Time time,Policy policy,Speaker speaker,Observer observer) {
        this.time=time;this.policy=policy;this.speaker=speaker;this.observer=observer;
    }
    public String status(){return status;}
    /** Explicit parked user action. The source creates a labelled local example, never a road report. */
    public CompletableFuture<String> preview(String language){
        CompletableFuture<String> result=new CompletableFuture<>();time.execute(()->{
            if(transport==null){result.complete("DISCONNECTED");return;}
            if(previewResult!=null||active!=null||grantRequests>0||!queue.isEmpty()){result.complete("BUSY");return;}
            if(!policy.active()){result.complete("PAUSED");return;}
            if(unknownOutput){result.complete("AUDIO_UNCERTAIN");return;}
            if(!coverage){result.complete("COVERAGE_INCOMPLETE");return;}
            if(speaker.effective(policy.mode())==WarningAudioOwner.Mode.SILENT){result.complete("USER_MUTED");return;}
            previewResult=result;previewLanguage=language!=null&&language.startsWith("nl")?"nl":"en";previewNonce=UUID.randomUUID().toString();previewDeadline=time.now()+8000;previewRequested=true;nextClaim=0;pump();
        });return result;
    }
    public void connected(Transport source,WarningConnection.Snapshot snapshot){time.execute(()->connect(source,snapshot));}
    private void connect(Transport source,WarningConnection.Snapshot snapshot) {
        if(transport==source && session.equals(snapshot.providerSession) && snapshot.headSequence<cursor)return;
        long previousCursor=cursor;
        boolean changed=transport!=source || !session.equals(snapshot.providerSession);
        if(changed) {
            generation++;queue.clear();handled.clear();lease=null;controlBusy=false;nextClaim=0;
            if(active!=null)cancel(active,false);
        }
        transport=source;session=snapshot.providerSession;cursor=snapshot.headSequence;coverage=snapshot.captureComplete;
        unknownOutput=false;PlaybackGrant recover=null;
        for(PlaybackGrant grant:snapshot.dispositions){
            boolean possible=grant.granted&&(grant.outcome==PlaybackGrant.Outcome.GRANTED||grant.outcome==PlaybackGrant.Outcome.UNCERTAIN||grant.outcome==PlaybackGrant.Outcome.STARTED);
            if(possible&&active==null&&!grant.started&&source.identity().equals(unsubmitted.get(grant.attemptNonce)))recover=grant;
            else {
                if(grant.started || PlaybackGrant.suppressesReplay(grant.outcome))handled.put(grant.eventKey,time.now()+WarningJournal.RETENTION_MS);
                if(possible&&active==null)unknownOutput=true;
                if(grant.outcome==PlaybackGrant.Outcome.NOT_STARTED){unsubmitted.remove(grant.attemptNonce);unknownReplies.remove(grant.attemptNonce);}
            }
        }
        if(active!=null && active.source.identity().equals(source.identity()))active.source=source;
        if(!changed){
            // Resync can replace missed live CLEAR/revision messages. Reconcile existing work
            // before accepting new authorities; state alone must never create speech.
            reconcilingSnapshot=true;
            try{
                for(WarningEvent event:snapshot.records)if(event.sequence>previousCursor){
                    if(event.operation==WarningEvent.Operation.CLEAR)clear(event.warningId);
                    else if(event.operation==WarningEvent.Operation.UPSERT)revise(event);
                }
                for(WarningEvent event:snapshot.state)if(event.operation!=WarningEvent.Operation.CLEAR)revise(event);
            }finally{reconcilingSnapshot=false;}
        }
        // Only retained announcement authorities may add new playback work.
        for(WarningConnection.Candidate candidate:snapshot.announcements)enqueue(candidate.authority,candidate.payload,true);
        long token=++ticker;time.after(()->tick(token),100);
        if(recover!=null&&active==null){
            final PlaybackGrant grant=recover;final long version=generation;controlBusy=true;
            source.outcome(grant,PlaybackGrant.Outcome.NOT_STARTED,true).whenComplete((code,error)->time.execute(()->{
                if(error==null&&"OK".equals(code)){unsubmitted.remove(grant.attemptNonce);unknownReplies.remove(grant.attemptNonce);}
                else unknownOutput=true;
                if(version==generation&&transport==source){controlBusy=false;setStatus(unknownOutput?"AUDIO_UNCERTAIN":"NOT_STARTED");pump();}
            }));
        }
        pump();
    }
    public void events(Transport source,List<WarningEvent> events){time.execute(()-> {
        if(source!=transport)return;
        for(WarningEvent event:events) {
            if(!session.equals(event.providerSession) || event.sequence<=cursor)continue;
            cursor=event.sequence;
            if(event.operation==WarningEvent.Operation.ANNOUNCE)enqueue(event,event,false);
            else if(event.operation==WarningEvent.Operation.CLEAR)clear(event.warningId);
            else revise(event);
        }
        pump();
    });}
    public void refresh(){time.execute(()-> { nextClaim=0;pump(); });}
    public void revoked(long epoch){time.execute(()-> {if(lease!=null && lease.epoch==epoch){lease=null;if(active!=null)cancel(active,false);setStatus("OWNER_REVOKED");}pump();});}
    public void disconnected(){time.execute(()-> {
        endPreview("DISCONNECTED");
        generation++;ticker++;transport=null;session="";lease=null;coverage=false;queue.clear();handled.clear();controlBusy=false;
        if(active!=null)cancel(active,false);setStatus("DISCONNECTED");
    });}
    private void tick(long token){if(token!=ticker || transport==null)return;pump();time.after(()->tick(token),100);}
    private void enqueue(WarningEvent authority,WarningEvent payload,boolean replay) {
        boolean example=Boolean.TRUE.equals(payload.fields().get("is_preview"));
        if(example&&(replay||previewResult==null||!previewNonce.equals(payload.fields().get("preview_nonce"))))return;
        if(!example&&previewResult!=null){
            if(active!=null&&Boolean.TRUE.equals(active.pending.payload.fields().get("is_preview")))cancel(active,false);
            else endPreview("INTERRUPTED");
        }
        String key=PlaybackGrant.key(authority);
        if(handled.containsKey(key) || active!=null && active.pending.key.equals(key))return;
        Pending old=queue.get(key);
        if(old!=null){if(payload.revision>=old.payload.revision)old.payload=payload;old.replay|=replay;return;}
        Pending value=new Pending(authority,payload,replay);
        observe(authority,PlaybackGrant.Outcome.RECEIVED);
        if(payload.category.equals("display_only")){terminal(value,PlaybackGrant.Outcome.REJECTED);return;}
        if(time.now()>=authority.announceUntil){terminal(value,PlaybackGrant.Outcome.EXPIRED);return;}
        prune();
        if(queue.size()>=MAX_PENDING) {
            Pending worst=queue.values().stream().max(ORDER).get();
            if(ORDER.compare(value,worst)<0){queue.remove(worst.key);terminal(worst,PlaybackGrant.Outcome.REJECTED);}
            else {terminal(value,PlaybackGrant.Outcome.REJECTED);setStatus("OVERFLOW");return;}
            setStatus("OVERFLOW");
        }
        if(handled.size()>=MAX_HANDLED){terminal(value,PlaybackGrant.Outcome.REJECTED);setStatus("OVERFLOW");return;}
        queue.put(key,value);observe(authority,PlaybackGrant.Outcome.QUEUED);
    }
    private void revise(WarningEvent event) {
        for(Pending p:queue.values())if(sameWarning(p.authority,event) && event.revision>=p.payload.revision)p.payload=event;
        if(active!=null && !active.started && (!active.cancelled||active.retry) && sameWarning(active.pending.authority,event) && event.revision>active.pending.payload.revision) {
            // Retain the submitted immutable revision when only state/geometry changed.
            // Cancelling identical audio can consume retries or interrupt a late real start.
            if(!active.accepted || !sameSpeech(active.pending.payload,event)){active.pending.payload=event;cancel(active,true);}
        }
    }
    private static boolean sameSpeech(WarningEvent a,WarningEvent b){
        return a.message.equals(b.message)&&a.languageTag.equals(b.languageTag)&&a.priority==b.priority
                &&a.category.equals(b.category)&&a.nativeType.equals(b.nativeType)&&java.util.Objects.equals(a.nativeSubtype,b.nativeSubtype);
    }
    private static boolean sameWarning(WarningEvent a,WarningEvent b){return a.warningId.equals(b.warningId) && a.phase==b.phase && a.announcementIndex==b.announcementIndex;}
    private void clear(String id){for(Pending p:new ArrayList<>(queue.values()))if(p.authority.warningId.equals(id)){queue.remove(p.key);terminal(p,PlaybackGrant.Outcome.CANCELLED);}if(active!=null && active.pending.authority.warningId.equals(id)){active.retry=false;cancel(active,false);}}
    private void prune(){
        long now=time.now();handled.entrySet().removeIf(e->e.getValue()<=now);
        for(Pending p:new ArrayList<>(queue.values()))if(now>=p.authority.announceUntil){queue.remove(p.key);terminal(p,PlaybackGrant.Outcome.EXPIRED);}
    }
    private void pump(){
        if(pumping||reconcilingSnapshot){again=true;return;}pumping=true;
        try{do{again=false;pumpOne();}while(again);}finally{pumping=false;}
    }
    private void pumpOne(){
        prune();long now=time.now();
        if(previewRequested&&now>=previewDeadline)endPreview("SPEAKER_UNAVAILABLE");
        if(active!=null && active.terminal!=null){ack(active);return;}
        if(transport==null)return;
        if(!policy.active()){endPreview("PAUSED");if(active!=null)cancel(active,false);setStatus("PAUSED");return;}
        WarningAudioOwner.Mode mode=speaker.effective(policy.mode());
        // Missing spatial context must not head-of-line block a nonspatial emergency.
        Pending next=null,audible=null,urgent=null;boolean contextHeld=false;
        for(Pending candidate:queue.values()){
            boolean enabled=policy.enabled(candidate.payload);WarningPassage.Relevance relevant=relevance(candidate.payload,now);
            if(mode!=WarningAudioOwner.Mode.SILENT&&enabled&&relevant==WarningPassage.Relevance.RELEVANT){
                if(audible==null||ORDER.compare(candidate,audible)<0)audible=candidate;
                if(candidate.authority.priority==WarningEvent.Priority.P0&&(urgent==null||ORDER.compare(candidate,urgent)<0))urgent=candidate;
            }
            if(mode!=WarningAudioOwner.Mode.SILENT&&enabled&&relevant==WarningPassage.Relevance.CONTEXT_UNVERIFIED){contextHeld=true;continue;}
            if(next==null||ORDER.compare(candidate,next)<0)next=candidate;
        }
        if(active!=null) {
            if(active.generation!=generation || !session.equals(active.grant.providerSession) || mode!=active.grant.mode
                    || lease==null || now>=lease.until || !Boolean.TRUE.equals(active.pending.payload.fields().get("is_preview"))&&!policy.enabled(active.pending.payload)
                    || !active.started && now>=active.pending.authority.announceUntil)cancel(active,false);
            else if(!active.started&&relevance(active.pending.payload,now)!=WarningPassage.Relevance.RELEVANT)cancel(active,relevance(active.pending.payload,now)==WarningPassage.Relevance.CONTEXT_UNVERIFIED);
            else if(urgent!=null && active.pending.authority.priority!=WarningEvent.Priority.P0)cancel(active,true);
        }
        if(!coverage){endPreview("COVERAGE_INCOMPLETE");setStatus("COVERAGE_INCOMPLETE");return;}
        if(unknownOutput){setStatus("AUDIO_UNCERTAIN");return;}
        if(next==null&&contextHeld&&active==null){setStatus("CONTEXT_UNVERIFIED");return;}
        if(controlBusy)return;
        String language=audible!=null?audible.payload.languageTag:active!=null?active.pending.payload.languageTag:previewRequested?previewLanguage:preparedLanguage;
        boolean changedPreparation=!language.equals(preparedLanguage)||preparedMode!=mode;
        boolean retryPreparation=active==null&&(next!=null||previewRequested)&&mode!=WarningAudioOwner.Mode.SILENT&&!language.isEmpty()&&!language.equals("und")
                &&now>=nextPrepare&&!speaker.ready(language,mode);
        if(changedPreparation||retryPreparation){preparedLanguage=language;preparedMode=mode;nextPrepare=now+PREPARE_RETRY_MS;speaker.prepare(language,mode);}
        boolean ready=mode==WarningAudioOwner.Mode.SILENT || active!=null && active.accepted && !active.cancelled ||
                (audible==null?speaker.ready(language,mode):speaker.ready(audible.payload,mode));
        if(lease!=null && now>=lease.until){lease=null;if(active!=null)cancel(active,false);}
        if(lease!=null && lease.mode!=mode)nextClaim=0;
        if(lease==null || now>=nextRenew || lease.mode!=mode) {
            if(now<nextClaim)return;
            Transport source=transport;long version=generation;controlBusy=true;nextClaim=now+250;
            CompletableFuture<WarningConnection.Claim> request=lease==null?source.claim(mode,ready):source.renew(lease,mode,ready);
            request.whenComplete((reply,error)->time.execute(()-> {
                if(version!=generation || source!=transport)return;controlBusy=false;
                if(error!=null){lease=null;setStatus("DELIVERY_INTERRUPTED");return;}
                if("OK".equals(reply.status) && reply.lease!=null){lease=reply.lease;nextRenew=time.now()+WarningAudioOwner.RENEW_INTERVAL_MS;setStatus(mode==WarningAudioOwner.Mode.SILENT?"USER_MUTED":"READY");}
                else {lease=null;setStatus(reply.status.equals("BUSY")&&!reply.ownerPackage.isEmpty()?"BUSY:"+reply.ownerPackage:reply.status);if(!reply.status.equals("SPEAKER_UNAVAILABLE"))endPreview(status);if(active!=null)cancel(active,false);}
                pump();
            }));return;
        }
        if(previewRequested&&next==null&&active==null&&ready){
            Transport source=transport;long version=generation;controlBusy=true;previewRequested=false;
            source.preview(lease,previewLanguage,previewNonce).whenComplete((candidate,error)->time.execute(()->{
                if(source!=transport||version!=generation)return;controlBusy=false;
                if(error!=null||candidate==null){endPreview("INCOMPATIBLE");setStatus("INCOMPATIBLE");return;}
                enqueue(candidate.authority,candidate.payload,false);pump();
            }));return;
        }
        if(next==null){if(contextHeld&&active==null)setStatus("CONTEXT_UNVERIFIED");return;}
        if(grantRequests>0 || now<next.retryAt)return;
        boolean example=Boolean.TRUE.equals(next.payload.fields().get("is_preview"));
        PlaybackGrant.Outcome decision=!example&&!policy.enabled(next.payload)?PlaybackGrant.Outcome.USER_FILTERED:
                mode==WarningAudioOwner.Mode.SILENT?PlaybackGrant.Outcome.USER_MUTED:
                relevance(next.payload,now)==WarningPassage.Relevance.PASSED||relevance(next.payload,now)==WarningPassage.Relevance.OFF_ROUTE?PlaybackGrant.Outcome.REJECTED:null;
        if(decision!=null){
            queue.remove(next.key);terminal(next,decision);
            if(decision==PlaybackGrant.Outcome.REJECTED){WarningPassage.Relevance relevant=relevance(next.payload,now);WarningDiagnostics.event(next.authority,"RELEVANCE_"+relevant.name(),now);setStatus(relevant.name());}
            recordDecision(next,decision);return;
        }
        if(active!=null)return;
        if(!ready){setStatus("SPEAKER_UNAVAILABLE");return;}
        begin(next);
    }
    private void begin(Pending p){
        Transport source=transport;WarningConnection.Lease permission=lease;long version=generation;
        if(p.nonce==null){
            if(unsubmitted.size()>=MAX_HANDLED){queue.remove(p.key);terminal(p,PlaybackGrant.Outcome.REJECTED);setStatus("OVERFLOW");return;}
            p.nonce=UUID.randomUUID().toString();p.requested=p.payload;unsubmitted.put(p.nonce,source.identity());
        }
        final String nonce=p.nonce;controlBusy=true;grantRequests++;
        source.begin(permission,p.requested,nonce).whenComplete((reply,error)->time.execute(()-> {
            grantRequests--;
            if(version==generation && source==transport)controlBusy=false;
            if(error!=null){unknownReplies.add(nonce);p.retryAt=time.now()+250;setStatus("DELIVERY_INTERRUPTED");return;}
            if("GRANTED".equals(reply.status) && reply.grant!=null && reply.candidate!=null){
                boolean superseded=p.payload.revision>reply.candidate.payload.revision;
                queue.remove(p.key);if(!superseded)p.payload=reply.candidate.payload;Active attempt=new Active(p,reply.grant,source,permission,version);active=attempt;
                if(superseded){attempt.retry=true;finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);return;}
                if(version!=generation || source!=transport || lease==null || !lease.token.equals(permission.token) || lease.epoch!=permission.epoch
                        || !policy.active() || !Boolean.TRUE.equals(p.payload.fields().get("is_preview"))&&!policy.enabled(p.payload) || speaker.effective(policy.mode())!=reply.grant.mode || time.now()>=p.authority.announceUntil){finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);return;}
                WarningPassage.Relevance relevant=relevance(p.payload,time.now());
                if(relevant!=WarningPassage.Relevance.RELEVANT){attempt.retry=relevant==WarningPassage.Relevance.CONTEXT_UNVERIFIED;finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);return;}
                unsubmitted.remove(nonce);unknownReplies.remove(nonce);p.attempts++;
                boolean accepted=speaker.speak(p.payload,reply.grant,p.authority.announceUntil,new Callback(){
                    public void started(PlaybackGrant grant){time.execute(()->onStarted(attempt,grant));}
                    public void finished(PlaybackGrant grant,PlaybackGrant.Outcome outcome,boolean quiet){time.execute(()->{if(attempt.grant.sameIdentity(grant))finish(attempt,outcome,quiet);});}
                });
                attempt.accepted=accepted;
                if(!accepted && active==attempt && attempt.terminal==null)finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);
                else if(active==attempt)setStatus(attempt.started?"STARTED":"QUEUED");
            }else if(version==generation && source==transport){
                if("REVISION_CHANGED".equals(reply.status) && reply.candidate!=null){
                    if(reply.candidate.payload.revision>=p.payload.revision)p.payload=reply.candidate.payload;
                    if(reply.grant!=null&&reply.grant.granted&&!reply.grant.started){queue.remove(p.key);Active attempt=new Active(p,reply.grant,source,permission,version);active=attempt;attempt.retry=true;finish(attempt,PlaybackGrant.Outcome.NOT_STARTED,true);return;}
                    unsubmitted.remove(nonce);unknownReplies.remove(nonce);p.nonce=null;p.requested=null;
                }
                else if("ALREADY_HANDLED".equals(reply.status)){
                    queue.remove(p.key);remember(p);setStatus("ALREADY_HANDLED");
                    if(reply.grant!=null&&reply.grant.started){unknownOutput=true;resync(source);}
                    else {unsubmitted.remove(nonce);unknownReplies.remove(nonce);}
                }
                else if("EVENT_UNAVAILABLE".equals(reply.status)){
                    queue.remove(p.key);terminal(p,time.now()>=p.authority.announceUntil?PlaybackGrant.Outcome.EXPIRED:PlaybackGrant.Outcome.REJECTED);
                    if(unknownReplies.contains(nonce))resync(source);else unsubmitted.remove(nonce);
                }
                else {
                    p.retryAt=time.now()+250;setStatus(reply.status);
                    if(reply.status.equals("TIMEOUT")||reply.status.equals("STORAGE_FAILED"))unknownReplies.add(nonce);
                    else if(!unknownReplies.contains(nonce)){unsubmitted.remove(nonce);p.nonce=null;p.requested=null;}
                    if(reply.status.equals("AUDIO_UNCERTAIN")||reply.status.equals("NONCE_CONFLICT")||reply.status.equals("ATTEMPT_ACTIVE"))resync(source);
                }
                pump();
            }
        }));
    }
    private void onStarted(Active attempt,PlaybackGrant grant){
        if(active!=attempt || !attempt.grant.sameIdentity(grant) || attempt.started)return;
        attempt.started=true;observe(attempt.pending.authority,PlaybackGrant.Outcome.STARTED);
        // A cancellation request cannot erase a real start or authorize a replacement grant.
        attempt.source.outcome(grant,PlaybackGrant.Outcome.STARTED,false).whenComplete((code,error)->time.execute(()-> {
            if(active==attempt && (error!=null || !"OK".equals(code)))cancel(attempt,false);
        }));
        if(attempt.cancelled || attempt.generation!=generation || transport==null || lease==null || lease.epoch!=grant.ownerEpoch
                || time.now()>=attempt.pending.authority.announceUntil||relevance(attempt.pending.payload,time.now())!=WarningPassage.Relevance.RELEVANT){cancel(attempt,false);return;}
        setStatus("STARTED");
    }
    private void finish(Active attempt,PlaybackGrant.Outcome outcome,boolean quiet){
        if(active!=attempt || !PlaybackGrant.terminal(outcome) || attempt.terminal!=null && attempt.quiet)return;
        if(outcome==PlaybackGrant.Outcome.NOT_STARTED && attempt.started){outcome=PlaybackGrant.Outcome.UNCERTAIN;quiet=false;}
        attempt.terminal=outcome;attempt.quiet=quiet;attempt.retryAt=0;observe(attempt.pending.authority,outcome);setStatus(quiet?outcome.name():"AUDIO_UNCERTAIN");ack(attempt);
        if(!quiet&&previewResult!=null&&Boolean.TRUE.equals(attempt.pending.payload.fields().get("is_preview")))previewResult.complete("AUDIO_UNCERTAIN");
    }
    private void ack(Active attempt){
        if(active!=attempt || attempt.terminal==null || attempt.acknowledging || time.now()<attempt.retryAt)return;
        if(transport!=null && transport.identity().equals(attempt.source.identity()))attempt.source=transport;
        attempt.acknowledging=true;PlaybackGrant.Outcome sent=attempt.terminal;boolean quiet=attempt.quiet;
        attempt.source.outcome(attempt.grant,sent,quiet).whenComplete((code,error)->time.execute(()-> {
            attempt.acknowledging=false;if(active!=attempt)return;
            if(sent!=attempt.terminal || quiet!=attempt.quiet){ack(attempt);return;}
            if(error!=null || !("OK".equals(code) || !quiet && "AUDIO_UNCERTAIN".equals(code))){attempt.retryAt=time.now()+500;setStatus("AUDIO_UNCERTAIN");return;}
            if(!quiet){attempt.retryAt=Long.MAX_VALUE;return;}
            unsubmitted.remove(attempt.grant.attemptNonce);unknownReplies.remove(attempt.grant.attemptNonce);
            active=null;
            boolean example=Boolean.TRUE.equals(attempt.pending.payload.fields().get("is_preview"));
            if(example)endPreview(sent.name());
            boolean retry=!attempt.started && (attempt.retry || !attempt.cancelled&&sent==PlaybackGrant.Outcome.NOT_STARTED)
                    && (sent==PlaybackGrant.Outcome.NOT_STARTED || sent==PlaybackGrant.Outcome.CANCELLED)
                    && !example && attempt.pending.attempts<MAX_ATTEMPTS && attempt.generation==generation && transport!=null && time.now()<attempt.pending.authority.announceUntil;
            if(retry){attempt.pending.nonce=null;attempt.pending.retryAt=time.now()+250;queue.put(attempt.pending.key,attempt.pending);}
            else remember(attempt.pending);
            if(attempt.generation!=generation || transport==null || attempt.source!=transport)attempt.source.release(attempt.lease);
            pump();
        }));
    }
    private void cancel(Active attempt,boolean retry){if(active!=attempt)return;attempt.retry|=retry;if(attempt.cancelled)return;attempt.cancelled=true;speaker.cancel(attempt.grant);}
    private void resync(Transport source){if(source!=transport||time.now()<nextResync)return;nextResync=time.now()+1000;source.resync();}
    private void recordDecision(Pending p,PlaybackGrant.Outcome decision){
        if(transport==null || lease==null || controlBusy)return;
        Transport source=transport;long version=generation;controlBusy=true;
        source.decide(lease,p.payload,UUID.randomUUID().toString(),decision).whenComplete((reply,error)->time.execute(()-> {
            if(version!=generation || source!=transport)return;controlBusy=false;if(error!=null)setStatus("DELIVERY_INTERRUPTED");pump();
        }));
    }
    private WarningPassage.Relevance relevance(WarningEvent event,long now){
        if(Boolean.TRUE.equals(event.fields().get("is_preview"))||!event.relevance.equals("point_ahead"))return WarningPassage.Relevance.RELEVANT;
        return policy.relevance(event,now);
    }
    private void terminal(Pending p,PlaybackGrant.Outcome outcome){remember(p);observe(p.authority,outcome);}
    private void observe(WarningEvent event,PlaybackGrant.Outcome outcome){WarningDiagnostics.event(event,"SCHEDULER_"+outcome.name(),time.now());observer.outcome(event,outcome);}
    private void remember(Pending p){if(handled.size()<MAX_HANDLED || handled.containsKey(p.key))handled.put(p.key,p.authority.issuedAt+WarningJournal.RETENTION_MS);}
    private void setStatus(String value){if(!value.equals(status)){status=value;observer.changed(value);}}
    private void endPreview(String outcome){if(previewResult!=null)previewResult.complete(outcome);previewResult=null;previewRequested=false;}
    private static final class Pending {
        final WarningEvent authority;WarningEvent payload,requested;final String key;boolean replay;int attempts;String nonce;long retryAt;
        Pending(WarningEvent authority,WarningEvent payload,boolean replay){this.authority=authority;this.payload=payload;this.replay=replay;key=PlaybackGrant.key(authority);}
    }
    private static final class Active {
        final Pending pending;final PlaybackGrant grant;final WarningConnection.Lease lease;final long generation;
        Transport source;boolean accepted,started,cancelled,retry,quiet,acknowledging;PlaybackGrant.Outcome terminal;long retryAt;
        Active(Pending p,PlaybackGrant grant,Transport source,WarningConnection.Lease lease,long generation){pending=p;this.grant=grant;this.source=source;this.lease=lease;this.generation=generation;}
    }
    private static final class MainTime implements Time {
        final Handler handler=new Handler(Looper.getMainLooper());
        final ArrayBlockingQueue<Runnable> actions=new ArrayBlockingQueue<>(128);
        final AtomicBoolean scheduled=new AtomicBoolean();
        public long now(){return SystemClock.elapsedRealtime();}
        public void execute(Runnable task){
            if(Looper.myLooper()==handler.getLooper()){task.run();return;}
            if(!actions.offer(task))throw new RejectedExecutionException("WARNING_SCHEDULER_OVERFLOW");
            if(scheduled.compareAndSet(false,true))handler.post(this::drain);
        }
        void drain(){try{Runnable action;while((action=actions.poll())!=null)action.run();}finally{scheduled.set(false);if(!actions.isEmpty()&&scheduled.compareAndSet(false,true))handler.post(this::drain);}}
        public void after(Runnable task,long delay){handler.postDelayed(task,delay);}
    }
}
