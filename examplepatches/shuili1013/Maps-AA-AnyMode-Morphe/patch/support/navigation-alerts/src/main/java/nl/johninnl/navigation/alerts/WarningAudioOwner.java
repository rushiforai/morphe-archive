package nl.johninnl.navigation.alerts;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.EnumSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

/** Source-side coordination, not an audio implementation. Run on the dedicated source owner worker.
 * The Binder adapter must authenticate every call and build Client from its verified registration.
 */
public final class WarningAudioOwner {
    public static final long OWNER_LEASE_MS=6000, RENEW_INTERVAL_MS=2000;
    public static final int MAX_ATTEMPTS=128;
    public enum Mode { VOICE, TONE, SILENT }
    public enum Code { OK, UNOWNED, GRANTED, BUSY, COVERAGE_INCOMPLETE, SPEAKER_UNAVAILABLE,
        LEGACY_RECEIVER_ACTIVE, STALE_OWNER, STALE_CONSUMER, AUDIO_UNCERTAIN, STORAGE_FAILED,
        EVENT_UNAVAILABLE, REVISION_CHANGED, OUTPUT_MUTED, OUTPUT_CHANGED, ATTEMPT_ACTIVE, OUTPUT_ACTIVE,
        ALREADY_HANDLED, NONCE_CONFLICT, OVERFLOW, INVALID_OUTCOME, NOT_FOUND }

    public static final class Client {
        public final int uid;
        public final String packageName,registration,consumerNonce,profileDigest;
        public final Set<String> capabilities;
        public final Set<Mode> modes;
        public Client(int uid,String packageName,String registration,String consumerNonce,Set<String> capabilities,
                      Set<Mode> modes,String profileDigest) {
            if(uid<=0 || packageName==null || !packageName.matches("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+")
                    || !PlaybackGrant.uuid(registration) || !PlaybackGrant.uuid(consumerNonce)
                    || profileDigest==null || !profileDigest.matches("[0-9a-f]{64}") || modes==null || modes.isEmpty())
                throw new IllegalArgumentException("CLIENT_IDENTITY");
            this.uid=uid;this.packageName=packageName;this.registration=registration;this.consumerNonce=consumerNonce;
            this.capabilities=WarningCapabilities.copy(capabilities);this.modes=Collections.unmodifiableSet(EnumSet.copyOf(modes));
            this.profileDigest=profileDigest;
        }
    }
    public static final class Lease {
        public final int uid;
        public final String packageName,token;
        public final long epoch,until;
        public final Mode mode;
        public final boolean ready;
        private final Client client;
        private Lease(Client client,String token,long epoch,long until,Mode mode,boolean ready) {
            this.client=client;uid=client.uid;packageName=client.packageName;this.token=token;
            this.epoch=epoch;this.until=until;this.mode=mode;this.ready=ready;
        }
    }
    public static final class Claim {
        public final Code code;
        public final Lease lease;
        private Claim(Code code,Lease lease) { this.code=code;this.lease=lease; }
    }
    public static final class GrantResult {
        public final Code code;
        public final PlaybackGrant grant;
        public final WarningJournal.Announcement announcement;
        private GrantResult(Code code,PlaybackGrant grant,WarningJournal.Announcement announcement) {
            this.code=code;this.grant=grant;this.announcement=announcement;
        }
    }
    /** Server-internal view. The transport must redact another UID's tokens/nonces. */
    public static final class Snapshot {
        public final Code code;
        public final Lease owner;
        public final PlaybackGrant pending;
        public final boolean exclusive;
        private Snapshot(Code code,Lease owner,PlaybackGrant pending,boolean exclusive) {
            this.code=code;this.owner=owner;this.pending=pending;this.exclusive=exclusive;
        }
    }
    private static final class Attempt {
        PlaybackGrant grant;
        long retainUntil;
        Attempt(PlaybackGrant grant,long retainUntil) { this.grant=grant;this.retainUntil=retainUntil; }
    }

    private final String boot,session;
    private final WarningJournal journal;
    private final PlaybackStore store;
    private final Map<String,Attempt> attempts=new LinkedHashMap<>();
    private WarningCapabilities profile;
    private Lease owner;
    private PlaybackGrant pending;
    private boolean pendingRevoked,consumerDead,storageFault,legacy;
    private long epoch,lastNow=-1;

    public WarningAudioOwner(String boot,String session,WarningJournal journal,PlaybackStore store,WarningCapabilities profile) {
        if(boot==null || !boot.matches("boot-count:[0-9]{1,10}") || !PlaybackGrant.uuid(session)
                || journal==null || store==null || profile==null)throw new IllegalArgumentException("OWNER_CONFIGURATION");
        this.boot=boot;this.session=session;this.journal=journal;this.store=store;this.profile=profile;
        try {
            PlaybackGrant restored=store.load();
            if(restored!=null) {
                if(!restored.bootIdentity.equals(boot)) store.save(null);
                else {
                    pending=restored;pendingRevoked=true;
                    attempts.put(restored.attemptNonce,new Attempt(restored,Long.MAX_VALUE));
                }
            }
        }catch(IOException error) { storageFault=true; }
    }

    public synchronized void requireCapabilities(WarningCapabilities value) {
        if(value==null)throw new IllegalArgumentException("CAPABILITIES_REQUIRED");profile=value;
    }
    public synchronized void legacyReceiverActive(boolean active) {
        if(active&&!legacy&&owner!=null){
            owner=new Lease(owner.client,owner.token,owner.epoch,owner.until,owner.mode,false);
            if(pending!=null)pendingRevoked=true;
        }
        legacy=active;
    }

    /** Transport redaction must also match the registration and process nonce, not UID alone. */
    synchronized boolean leaseBelongsTo(Lease lease,Client client) {
        return lease!=null && sameClient(lease.client,client);
    }

    public synchronized Claim claim(int uid,Client client,Mode mode,boolean ready,long now) {
        checkClient(uid,client);advance(now);
        Code blocked=blocked();if(blocked!=null)return new Claim(blocked,null);
        Code usable=usable(client,mode,ready);
        if(usable!=Code.OK) {
            if(usable==Code.SPEAKER_UNAVAILABLE && owner!=null && sameClient(owner.client,client) && !consumerDead)
                owner=new Lease(client,owner.token,owner.epoch,owner.until,mode,false);
            return new Claim(usable,null);
        }
        if(owner!=null && (!sameClient(owner.client,client) || consumerDead))return new Claim(Code.BUSY,owner);
        if(owner==null) {
            if(epoch==Long.MAX_VALUE)return new Claim(Code.OVERFLOW,null);
            owner=new Lease(client,UUID.randomUUID().toString(),++epoch,now+OWNER_LEASE_MS,mode,ready || mode==Mode.SILENT);
        }else owner=new Lease(client,owner.token,owner.epoch,now+OWNER_LEASE_MS,mode,ready || mode==Mode.SILENT);
        return new Claim(Code.OK,owner);
    }

    public synchronized Claim renew(int uid,Client client,String token,long epoch,Mode mode,boolean ready,long now) {
        checkClient(uid,client);advance(now);
        if(!owns(client,token,epoch))return new Claim(Code.STALE_OWNER,null);
        Code blocked=blocked();if(blocked!=null)return new Claim(blocked,null);
        Code usable=usable(client,mode,ready);
        if(usable!=Code.OK) {
            owner=new Lease(client,owner.token,owner.epoch,owner.until,mode,false);
            return new Claim(usable,owner); // An unavailable adapter does not keep extending its lease.
        }
        owner=new Lease(client,owner.token,owner.epoch,now+OWNER_LEASE_MS,mode,ready || mode==Mode.SILENT);
        return new Claim(Code.OK,owner);
    }

    public synchronized Code release(int uid,Client client,String token,long epoch,long now) {
        checkClient(uid,client);advance(now);
        if(!owns(client,token,epoch))return Code.STALE_OWNER;
        if(pending!=null || storageFault)return Code.OUTPUT_ACTIVE;
        owner=null;consumerDead=false;return Code.OK;
    }
    public synchronized void consumerDied(int uid,String registration,long now) {
        advance(now);
        if(owner!=null && owner.uid==uid && owner.client.registration.equals(registration)) {
            consumerDead=true;
            owner=new Lease(owner.client,owner.token,owner.epoch,owner.until,owner.mode,false);
            if(pending!=null)pendingRevoked=true;
        }
    }

    public synchronized GrantResult begin(int uid,Client client,String token,long epoch,String warningId,
                                         WarningEvent.Phase phase,long index,long revision,String nonce,long now) {
        return request(uid,client,token,epoch,warningId,phase,index,revision,nonce,null,now);
    }
    public synchronized GrantResult decide(int uid,Client client,String token,long epoch,String warningId,
                                          WarningEvent.Phase phase,long index,String nonce,PlaybackGrant.Outcome decision,long now) {
        if(!(decision==PlaybackGrant.Outcome.USER_MUTED || decision==PlaybackGrant.Outcome.USER_FILTERED
                || decision==PlaybackGrant.Outcome.EXPIRED || decision==PlaybackGrant.Outcome.REJECTED))
            return result(Code.INVALID_OUTCOME,null,null);
        return request(uid,client,token,epoch,warningId,phase,index,-1,nonce,decision,now);
    }

    private GrantResult request(int uid,Client client,String token,long epoch,String warningId,WarningEvent.Phase phase,
                                long index,long revision,String nonce,PlaybackGrant.Outcome decision,long now) {
        checkClient(uid,client);advance(now);
        if(!PlaybackGrant.uuid(nonce))throw new IllegalArgumentException("ATTEMPT_NONCE");
        Code blocked=blocked();if(blocked!=null)return result(blocked,null,null);
        if(!owns(client,token,epoch))return result(Code.STALE_OWNER,null,null);
        Code usable=usable(client,owner.mode,owner.ready);
        if(usable!=Code.OK)return result(usable,null,null);
        WarningJournal.Announcement candidate=journal.announcement(warningId,phase,index,now);
        if(candidate==null)return result(Code.EVENT_UNAVAILABLE,null,null);
        String eventKey=PlaybackGrant.key(candidate.authority);
        if(decision==null && owner.mode==Mode.SILENT)return result(Code.OUTPUT_MUTED,null,candidate);
        Attempt previous=attempts.get(nonce);
        if(previous!=null) {
            PlaybackGrant g=previous.grant;
            if(g.ownerUid!=uid || !g.consumerNonce.equals(client.consumerNonce) || !g.eventKey.equals(eventKey)
                    || (decision==null && g.revision!=revision))return result(Code.NONCE_CONFLICT,null,null);
            if(pending!=null && pending.sameIdentity(g)) {
                if(decision!=null)return result(Code.ATTEMPT_ACTIVE,null,candidate);
                if(g.mode!=owner.mode)return result(Code.OUTPUT_CHANGED,g,candidate);
                if(g.revision!=candidate.payload.revision)return result(Code.REVISION_CHANGED,g,candidate);
                return result(g.started?Code.ALREADY_HANDLED:Code.GRANTED,pending,candidate);
            }
            if(decision!=null && !g.granted && decision!=g.outcome)return result(Code.NONCE_CONFLICT,null,candidate);
            return result(Code.ALREADY_HANDLED,g,candidate);
        }
        for(Attempt attempt:attempts.values())if(attempt.grant.eventKey.equals(eventKey) && (attempt.grant.started || PlaybackGrant.suppressesReplay(attempt.grant.outcome)))
            return result(Code.ALREADY_HANDLED,attempt.grant,candidate);
        if(pending!=null && (decision==null || pending.eventKey.equals(eventKey)))return result(Code.ATTEMPT_ACTIVE,null,candidate);
        if(journal.resume(session,0,now).overflow || attempts.size()==MAX_ATTEMPTS)return result(Code.OVERFLOW,null,candidate);
        if(decision==null && candidate.payload.revision!=revision)return result(Code.REVISION_CHANGED,null,candidate);
        PlaybackGrant grant=new PlaybackGrant(boot,session,client.consumerNonce,owner.token,eventKey,UUID.randomUUID().toString(),
                nonce,uid,owner.epoch,candidate.payload.revision,owner.mode,decision==null?PlaybackGrant.Outcome.GRANTED:decision,decision==null,false);
        Attempt attempt=new Attempt(grant,candidate.authority.issuedAt+WarningJournal.RETENTION_MS);
        attempts.put(nonce,attempt);
        if(decision!=null)return result(Code.OK,grant,candidate);
        pending=grant;pendingRevoked=false;
        try { store.save(grant); }
        catch(IOException error) { storageFault=true;pendingRevoked=true;return result(Code.STORAGE_FAILED,null,candidate); }
        return result(Code.GRANTED,grant,candidate);
    }

    /** Quiescent is a positive adapter observation, never inferred from enqueue, death or timeout. */
    public synchronized Code outcome(int uid,String consumerNonce,PlaybackGrant identity,PlaybackGrant.Outcome outcome,
                                      boolean quiescent,long now) {
        advance(now);
        if(identity==null || outcome==null)return Code.INVALID_OUTCOME;
        Attempt attempt=attempts.get(identity.attemptNonce);
        if(attempt==null || !attempt.grant.sameIdentity(identity))return Code.NOT_FOUND;
        PlaybackGrant current=attempt.grant;
        if(current.ownerUid!=uid)throw new SecurityException("GRANT_UID");
        if(!current.consumerNonce.equals(consumerNonce))return Code.STALE_CONSUMER;
        if(pending==null || !pending.sameIdentity(current)) {
            return current.outcome==outcome && PlaybackGrant.terminal(outcome) ? Code.OK : Code.INVALID_OUTCOME;
        }
        if(outcome==PlaybackGrant.Outcome.RECEIVED || outcome==PlaybackGrant.Outcome.QUEUED)return Code.OK;
        if(outcome==PlaybackGrant.Outcome.GRANTED)return Code.INVALID_OUTCOME;
        if(outcome==PlaybackGrant.Outcome.STARTED) {
            if(pendingRevoked || owner==null || owner.epoch!=current.ownerEpoch || !owner.token.equals(current.ownerToken))return Code.STALE_OWNER;
            PlaybackGrant started=current.state(outcome,true);
            pending=started;attempt.grant=started;
            try { store.save(started);return Code.OK; }
            catch(IOException error) { storageFault=true;pendingRevoked=true;return Code.STORAGE_FAILED; }
        }
        if(outcome==PlaybackGrant.Outcome.NOT_STARTED && current.started)return Code.INVALID_OUTCOME;
        if(!PlaybackGrant.terminal(outcome))return Code.INVALID_OUTCOME;
        if(!quiescent) {
            PlaybackGrant uncertain=current.state(PlaybackGrant.Outcome.UNCERTAIN,current.started);
            pending=uncertain;attempt.grant=uncertain;pendingRevoked=true;
            try { store.save(uncertain);return Code.AUDIO_UNCERTAIN; }
            catch(IOException error) { storageFault=true;return Code.STORAGE_FAILED; }
        }
        try { store.save(null); }
        catch(IOException error) { storageFault=true;pendingRevoked=true;return Code.STORAGE_FAILED; }
        attempt.grant=current.state(outcome,current.started || outcome==PlaybackGrant.Outcome.COMPLETED);
        if(attempt.retainUntil==Long.MAX_VALUE)attempt.retainUntil=now+WarningJournal.RETENTION_MS;
        pending=null;pendingRevoked=false;storageFault=false;return Code.OK;
    }

    public synchronized Snapshot snapshot(long now) {
        advance(now);Code blocked=blocked();
        Code code=blocked!=null?blocked:owner==null?Code.UNOWNED:consumerDead?Code.SPEAKER_UNAVAILABLE:usable(owner.client,owner.mode,owner.ready);
        PlaybackGrant value=pendingRevoked && pending!=null?pending.state(PlaybackGrant.Outcome.UNCERTAIN,pending.started):pending;
        return new Snapshot(code,owner,value,owner!=null || pending!=null || storageFault);
    }
    public synchronized List<PlaybackGrant> dispositions(int uid,String consumerNonce,long now) {
        advance(now);List<PlaybackGrant> values=new ArrayList<>();
        for(Attempt attempt:attempts.values())if(attempt.grant.ownerUid==uid && attempt.grant.consumerNonce.equals(consumerNonce))
            values.add(pendingRevoked && pending!=null && pending.sameIdentity(attempt.grant)
                    ? attempt.grant.state(PlaybackGrant.Outcome.UNCERTAIN,attempt.grant.started):attempt.grant);
        return Collections.unmodifiableList(values);
    }

    /** Provider-internal parked UI only: the caller must have verified previous receivers stopped.
     * Never expose this as an arbitrary receiver-supplied reset flag in the Binder API.
     */
    public synchronized Code resetAfterVerifiedParkedStop() {
        try { store.save(null); }
        catch(IOException error) { storageFault=true;return Code.STORAGE_FAILED; }
        journal.revokeAnnouncements();pending=null;pendingRevoked=false;storageFault=false;owner=null;consumerDead=false;attempts.clear();return Code.OK;
    }

    private Code blocked() {
        if(storageFault)return Code.STORAGE_FAILED;
        if(pending!=null && (pendingRevoked || pending.outcome==PlaybackGrant.Outcome.UNCERTAIN))return Code.AUDIO_UNCERTAIN;
        return null;
    }
    private Code usable(Client client,Mode mode,boolean ready) {
        if(legacy)return Code.LEGACY_RECEIVER_ACTIVE;
        if(mode==null || !profile.complete || !profile.digest.equals(client.profileDigest)
                || !client.capabilities.containsAll(profile.required) || !client.modes.contains(mode))return Code.COVERAGE_INCOMPLETE;
        return ready || mode==Mode.SILENT?Code.OK:Code.SPEAKER_UNAVAILABLE;
    }
    private boolean owns(Client client,String token,long epoch) {
        return owner!=null && !consumerDead && sameClient(owner.client,client) && owner.token.equals(token) && owner.epoch==epoch;
    }
    private static boolean sameClient(Client first,Client second) {
        return first.uid==second.uid && first.registration.equals(second.registration) && first.consumerNonce.equals(second.consumerNonce);
    }
    private static void checkClient(int uid,Client client) {
        if(client==null || uid!=client.uid)throw new SecurityException("CLIENT_UID");
    }
    private void advance(long now) {
        if(now<0 || now<lastNow || now>Long.MAX_VALUE-WarningJournal.RETENTION_MS)throw new IllegalArgumentException("CLOCK");lastNow=now;
        if(owner!=null && now>=owner.until) { owner=null;consumerDead=false;if(pending!=null)pendingRevoked=true; }
        attempts.values().removeIf(attempt -> (pending==null || !pending.sameIdentity(attempt.grant)) && now>=attempt.retainUntil);
    }
    private static GrantResult result(Code code,PlaybackGrant grant,WarningJournal.Announcement announcement) { return new GrantResult(code,grant,announcement); }
}
