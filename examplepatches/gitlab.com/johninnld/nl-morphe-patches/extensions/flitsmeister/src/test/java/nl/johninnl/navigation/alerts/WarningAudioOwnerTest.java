package nl.johninnl.navigation.alerts;

import static org.junit.Assert.*;
import android.os.Bundle;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=32, manifest=Config.NONE)
public class WarningAudioOwnerTest {
    private static final long NOW=100000;
    private static final String BOOT="boot-count:7", SESSION=id(1);
    private static final Set<String> CAPS=new HashSet<>(Arrays.asList("native_text:v1","emergency:AMBULANCE:v1"));
    private static String id(int n) { return UUID.nameUUIDFromBytes(("warning-test-"+n).getBytes(StandardCharsets.UTF_8)).toString(); }
    private static final class MemoryStore implements PlaybackStore {
        PlaybackGrant value; int saves; boolean failLoad, failSave, failAfterSave;
        @Override public PlaybackGrant load() throws IOException { if(failLoad)throw new IOException("test load"); return value; }
        @Override public void save(PlaybackGrant record) throws IOException {
            saves++;
            if(failSave)throw new IOException("test before commit");
            value=record;
            if(failAfterSave)throw new IOException("test after commit");
        }
    }
    private WarningCapabilities profile(boolean complete) { return new WarningCapabilities(repeat("a",64),CAPS,complete); }
    private WarningAudioOwner.Client client(int uid,WarningCapabilities profile) {
        return new WarningAudioOwner.Client(uid,"app.test"+uid,id(uid),id(uid+100),CAPS,
                EnumSet.allOf(WarningAudioOwner.Mode.class),profile.digest);
    }
    private WarningEvent event(long sequence,String operation,long revision) {
        Bundle b=new Bundle();b.putInt("protocol_version",1);b.putString("provider_session",SESSION);
        b.putLong("sequence",sequence);b.putString("warning_id","secret-warning-at-52-5");b.putLong("revision",revision);
        b.putLong("announcement_index",1);b.putString("operation",operation);b.putLong("observed_elapsed_ms",NOW);b.putLong("issued_elapsed_ms",NOW);
        if(!operation.equals("CLEAR")) {
            b.putString("phase","notice");b.putString("native_type","EarlyWarningReport");b.putString("native_subtype","AMBULANCE");
            b.putString("category","emergency");b.putInt("priority",0);b.putString("message","Secret native warning behind you");
            b.putString("language_tag","en");b.putString("message_origin","native_text");b.putString("relevance","moving_emergency");b.putString("relationship","behind");
            b.putLong("announce_until_elapsed_ms",NOW+5000);b.putLong("state_until_elapsed_ms",NOW+30000);
        }
        return WarningCodec.decode(b,NOW);
    }
    private WarningJournal journal() { WarningJournal j=new WarningJournal(SESSION);j.append(event(1,"ANNOUNCE",1),NOW);return j; }
    private WarningAudioOwner owner(MemoryStore store,WarningJournal j,WarningCapabilities p) { return new WarningAudioOwner(BOOT,SESSION,j,store,p); }
    private WarningAudioOwner.GrantResult begin(WarningAudioOwner owner,WarningAudioOwner.Client c,WarningAudioOwner.Lease l,int nonce,long now) {
        return owner.begin(c.uid,c,l.token,l.epoch,"secret-warning-at-52-5",WarningEvent.Phase.NOTICE,1,1,id(nonce),now);
    }

    @Test public void firstReadyOwnerIsExclusiveAndSilentNeedsNoVoiceEngine() {
        WarningCapabilities p=profile(true);MemoryStore store=new MemoryStore();WarningAudioOwner a=owner(store,journal(),p);
        WarningAudioOwner.Client c=client(10001,p),other=client(10002,p);
        assertEquals(WarningAudioOwner.Code.SPEAKER_UNAVAILABLE,a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,false,NOW).code);
        WarningAudioOwner.Claim claimed=a.claim(c.uid,c,WarningAudioOwner.Mode.SILENT,false,NOW);
        assertEquals(WarningAudioOwner.Code.OK,claimed.code);assertEquals(NOW+6000,claimed.lease.until);
        assertEquals(WarningAudioOwner.Code.BUSY,a.claim(other.uid,other,WarningAudioOwner.Mode.VOICE,true,NOW).code);
        assertEquals(WarningAudioOwner.Code.OUTPUT_MUTED,begin(a,c,claimed.lease,20,NOW).code);
        assertNull(store.value);assertEquals(0,store.saves);
    }

    @Test public void missingCoverageAndLegacyReceiversRefuseFullAudioClaims() {
        WarningCapabilities p=profile(false);MemoryStore store=new MemoryStore();WarningAudioOwner a=owner(store,journal(),p);WarningAudioOwner.Client c=client(10001,p);
        assertEquals(WarningAudioOwner.Code.COVERAGE_INCOMPLETE,a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).code);
        p=profile(true);a=owner(store,journal(),p);c=client(10001,p);a.legacyReceiverActive(true);
        assertEquals(WarningAudioOwner.Code.LEGACY_RECEIVER_ACTIVE,a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).code);
        a.legacyReceiverActive(false);WarningAudioOwner.Lease l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;
        WarningCapabilities changed=new WarningCapabilities(repeat("b",64),CAPS,true);a.requireCapabilities(changed);
        assertEquals(WarningAudioOwner.Code.COVERAGE_INCOMPLETE,begin(a,c,l,20,NOW).code);
    }

    @Test public void carScreenReceiverTakesTheSpeakerFromABackgroundOwnerOnlyBetweenAnnouncements() {
        WarningCapabilities p=profile(true);MemoryStore store=new MemoryStore();WarningAudioOwner a=owner(store,journal(),p);
        WarningAudioOwner.Client background=client(10001,p),car=client(10002,p),phone=client(10003,p);
        WarningAudioOwner.Lease first=a.claim(background.uid,background,WarningAudioOwner.Mode.VOICE,true,false,NOW).lease;
        assertFalse(first.projected);
        assertEquals("A background claimant never takes over",WarningAudioOwner.Code.BUSY,a.claim(phone.uid,phone,WarningAudioOwner.Mode.VOICE,true,false,NOW).code);
        // Mid-announcement the car screen waits for the grant to finish.
        PlaybackGrant grant=begin(a,background,first,20,NOW).grant;assertNotNull(grant);
        assertEquals(WarningAudioOwner.Code.BUSY,a.claim(car.uid,car,WarningAudioOwner.Mode.VOICE,true,true,NOW).code);
        assertEquals(WarningAudioOwner.Code.OK,a.outcome(background.uid,background.consumerNonce,grant,PlaybackGrant.Outcome.STARTED,false,NOW));
        assertEquals(WarningAudioOwner.Code.OK,a.outcome(background.uid,background.consumerNonce,grant,PlaybackGrant.Outcome.COMPLETED,true,NOW+100));
        WarningAudioOwner.Claim taken=a.claim(car.uid,car,WarningAudioOwner.Mode.VOICE,true,true,NOW+200);
        assertEquals(WarningAudioOwner.Code.OK,taken.code);assertTrue(taken.lease.projected);assertTrue(taken.lease.epoch>first.epoch);
        assertEquals("The previous owner is fenced",WarningAudioOwner.Code.STALE_OWNER,a.renew(background.uid,background,first.token,first.epoch,WarningAudioOwner.Mode.VOICE,true,false,NOW+200).code);
        assertEquals("Between car screens first-come stays",WarningAudioOwner.Code.BUSY,a.claim(background.uid,background,WarningAudioOwner.Mode.VOICE,true,true,NOW+200).code);
        // Leaving the car screen gives up the priority on the next renewal.
        WarningAudioOwner.Lease left=a.renew(car.uid,car,taken.lease.token,taken.lease.epoch,WarningAudioOwner.Mode.VOICE,true,false,NOW+300).lease;
        assertFalse(left.projected);
        assertEquals(WarningAudioOwner.Code.OK,a.claim(background.uid,background,WarningAudioOwner.Mode.VOICE,true,true,NOW+400).code);
    }

    @Test public void leaseExpiryWithoutGrantAllowsFailoverAndFencesOldEpoch() {
        WarningCapabilities p=profile(true);WarningAudioOwner a=owner(new MemoryStore(),journal(),p);WarningAudioOwner.Client c=client(10001,p),d=client(10002,p);
        WarningAudioOwner.Lease first=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;
        WarningAudioOwner.Lease second=a.claim(d.uid,d,WarningAudioOwner.Mode.VOICE,true,NOW+6000).lease;
        assertNotNull(second);assertTrue(second.epoch>first.epoch);
        assertEquals(WarningAudioOwner.Code.STALE_OWNER,a.renew(c.uid,c,first.token,first.epoch,WarningAudioOwner.Mode.VOICE,true,NOW+6000).code);
    }
    @Test public void newLegacyControlClientRevokesPendingOutputWithoutPretendingItStopped(){
        WarningCapabilities p=profile(true);MemoryStore store=new MemoryStore();WarningAudioOwner a=owner(store,journal(),p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease lease=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;PlaybackGrant grant=begin(a,c,lease,20,NOW).grant;
        a.legacyReceiverActive(true);assertFalse(a.snapshot(NOW).owner.ready);assertNotNull(store.value);
        assertEquals(WarningAudioOwner.Code.STALE_OWNER,a.outcome(c.uid,c.consumerNonce,grant,PlaybackGrant.Outcome.STARTED,false,NOW));
        assertEquals(WarningAudioOwner.Code.OK,a.outcome(c.uid,c.consumerNonce,grant,PlaybackGrant.Outcome.NOT_STARTED,true,NOW));assertNull(store.value);
        assertEquals(WarningAudioOwner.Code.LEGACY_RECEIVER_ACTIVE,a.renew(c.uid,c,lease.token,lease.epoch,WarningAudioOwner.Mode.VOICE,true,NOW).code);
    }

    @Test public void durableGrantPrecedesReplyAndSameNonceIsIdempotent() {
        WarningCapabilities p=profile(true);MemoryStore s=new MemoryStore();WarningAudioOwner a=owner(s,journal(),p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;
        WarningAudioOwner.GrantResult result=begin(a,c,l,20,NOW);
        assertEquals(WarningAudioOwner.Code.GRANTED,result.code);assertNotNull(s.value);assertEquals(result.grant.attemptId,s.value.attemptId);
        assertEquals(result.grant.attemptId,begin(a,c,l,20,NOW).grant.attemptId);assertEquals(1,s.saves);
        assertEquals(WarningAudioOwner.Code.ATTEMPT_ACTIVE,begin(a,c,l,21,NOW).code);
        assertEquals(WarningAudioOwner.Code.OUTPUT_ACTIVE,a.release(c.uid,c,l.token,l.epoch,NOW));
        assertFalse(result.grant.eventKey.contains("secret"));assertEquals(64,result.grant.eventKey.length());
    }

    @Test public void interruptedOrFailedOutputCannotBeRegrantedWhenTheStartCallbackWasLost(){
        for(PlaybackGrant.Outcome outcome:Arrays.asList(PlaybackGrant.Outcome.INTERRUPTED,PlaybackGrant.Outcome.FAILED)){
            WarningCapabilities p=profile(true);MemoryStore store=new MemoryStore();WarningAudioOwner a=owner(store,journal(),p);WarningAudioOwner.Client c=client(10001,p);
            WarningAudioOwner.Lease lease=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;PlaybackGrant grant=begin(a,c,lease,20,NOW).grant;
            assertEquals(WarningAudioOwner.Code.OK,a.outcome(c.uid,c.consumerNonce,grant,outcome,true,NOW));assertNull(store.value);
            assertEquals("A terminal stop is not proof that this grant never produced audio: "+outcome,WarningAudioOwner.Code.ALREADY_HANDLED,begin(a,c,lease,21,NOW).code);
        }
    }
    @Test public void cancelledStartedOutputCannotBeRegrantedEvenAfterQuiescence(){
        WarningCapabilities p=profile(true);MemoryStore store=new MemoryStore();WarningAudioOwner a=owner(store,journal(),p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease lease=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;PlaybackGrant grant=begin(a,c,lease,20,NOW).grant;
        assertEquals(WarningAudioOwner.Code.OK,a.outcome(c.uid,c.consumerNonce,grant,PlaybackGrant.Outcome.STARTED,false,NOW));
        assertEquals(WarningAudioOwner.Code.OK,a.outcome(c.uid,c.consumerNonce,grant,PlaybackGrant.Outcome.CANCELLED,true,NOW));
        assertEquals(WarningAudioOwner.Code.ALREADY_HANDLED,begin(a,c,lease,21,NOW).code);
    }
    @Test public void sourceClearAndExpiredAuthorityCannotObtainAGrant() {
        WarningCapabilities p=profile(true);MemoryStore s=new MemoryStore();WarningJournal j=journal();WarningAudioOwner a=owner(s,j,p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;
        j.append(event(2,"CLEAR",2),NOW);
        assertEquals(WarningAudioOwner.Code.EVENT_UNAVAILABLE,begin(a,c,l,20,NOW).code);assertEquals(0,s.saves);
        a=owner(s,journal(),p);l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;
        assertEquals(WarningAudioOwner.Code.EVENT_UNAVAILABLE,begin(a,c,l,20,NOW+5000).code);
    }

    @Test public void grantedOwnerDeathFencesFailoverUntilOldQuiescentCompletion() {
        WarningCapabilities p=profile(true);MemoryStore s=new MemoryStore();WarningAudioOwner a=owner(s,journal(),p);WarningAudioOwner.Client c=client(10001,p),d=client(10002,p);
        WarningAudioOwner.Lease l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;PlaybackGrant g=begin(a,c,l,20,NOW).grant;
        a.consumerDied(c.uid,c.registration,NOW);
        assertEquals(WarningAudioOwner.Code.AUDIO_UNCERTAIN,a.claim(d.uid,d,WarningAudioOwner.Mode.VOICE,true,NOW+6000).code);
        assertEquals(WarningAudioOwner.Code.STALE_OWNER,a.outcome(c.uid,c.consumerNonce,g,PlaybackGrant.Outcome.STARTED,false,NOW+6000));
        assertEquals(WarningAudioOwner.Code.OK,a.outcome(c.uid,c.consumerNonce,g,PlaybackGrant.Outcome.COMPLETED,true,NOW+6000));
        assertNull(s.value);assertEquals(WarningAudioOwner.Code.OK,a.claim(d.uid,d,WarningAudioOwner.Mode.VOICE,true,NOW+6000).code);
    }

    @Test public void notStartedRequiresPositiveSameConsumerEvidenceAndCannotFollowStarted() {
        WarningCapabilities p=profile(true);MemoryStore s=new MemoryStore();WarningAudioOwner a=owner(s,journal(),p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;PlaybackGrant g=begin(a,c,l,20,NOW).grant;
        assertEquals(WarningAudioOwner.Code.STALE_CONSUMER,a.outcome(c.uid,id(999),g,PlaybackGrant.Outcome.NOT_STARTED,true,NOW));
        assertEquals(WarningAudioOwner.Code.OK,a.outcome(c.uid,c.consumerNonce,g,PlaybackGrant.Outcome.NOT_STARTED,true,NOW));
        assertEquals(WarningAudioOwner.Code.ALREADY_HANDLED,begin(a,c,l,20,NOW).code);
        PlaybackGrant second=begin(a,c,l,21,NOW).grant;assertNotNull(second);assertNotEquals(g.attemptId,second.attemptId);
        assertEquals(WarningAudioOwner.Code.OK,a.outcome(c.uid,c.consumerNonce,second,PlaybackGrant.Outcome.STARTED,false,NOW));
        assertEquals(WarningAudioOwner.Code.INVALID_OUTCOME,a.outcome(c.uid,c.consumerNonce,second,PlaybackGrant.Outcome.NOT_STARTED,true,NOW));
        assertNotNull(s.value);
    }

    @Test public void providerRestartReloadsUncertaintyAndAcceptsOldTerminalButNotStarted() {
        WarningCapabilities p=profile(true);MemoryStore s=new MemoryStore();WarningAudioOwner first=owner(s,journal(),p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease l=first.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;PlaybackGrant g=begin(first,c,l,20,NOW).grant;
        WarningAudioOwner restarted=new WarningAudioOwner(BOOT,id(2),new WarningJournal(id(2)),s,p);
        assertEquals(WarningAudioOwner.Code.AUDIO_UNCERTAIN,restarted.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).code);
        assertEquals(WarningAudioOwner.Code.STALE_OWNER,restarted.outcome(c.uid,c.consumerNonce,g,PlaybackGrant.Outcome.STARTED,false,NOW));
        assertEquals(WarningAudioOwner.Code.OK,restarted.outcome(c.uid,c.consumerNonce,g,PlaybackGrant.Outcome.CANCELLED,true,NOW));
        assertEquals(WarningAudioOwner.Code.OK,restarted.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).code);
    }

    @Test public void storageAmbiguityAndFailedTerminalClearStayFenced() {
        WarningCapabilities p=profile(true);MemoryStore s=new MemoryStore();WarningAudioOwner a=owner(s,journal(),p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;s.failAfterSave=true;
        assertEquals(WarningAudioOwner.Code.STORAGE_FAILED,begin(a,c,l,20,NOW).code);assertNotNull(s.value);
        assertEquals(WarningAudioOwner.Code.STORAGE_FAILED,a.snapshot(NOW).code);
        s.failAfterSave=false;PlaybackGrant uncertain=a.snapshot(NOW).pending;
        s.failSave=true;assertEquals(WarningAudioOwner.Code.STORAGE_FAILED,a.outcome(c.uid,c.consumerNonce,uncertain,PlaybackGrant.Outcome.NOT_STARTED,true,NOW));
        assertNotNull(a.snapshot(NOW).pending);
        s.failSave=false;assertEquals(WarningAudioOwner.Code.OK,a.outcome(c.uid,c.consumerNonce,uncertain,PlaybackGrant.Outcome.NOT_STARTED,true,NOW));
        assertNull(s.value);assertNotNull(begin(a,c,l,21,NOW).grant);
    }

    @Test public void aNewBootClearsOldOutputButCorruptStorageNeverAutoRecovers() {
        WarningCapabilities p=profile(true);MemoryStore s=new MemoryStore();WarningAudioOwner a=owner(s,journal(),p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;begin(a,c,l,20,NOW);
        a=new WarningAudioOwner("boot-count:8",id(2),new WarningJournal(id(2)),s,p);assertNull(s.value);
        assertEquals(WarningAudioOwner.Code.OK,a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,0).code);
        s.failLoad=true;a=owner(s,journal(),p);
        assertEquals(WarningAudioOwner.Code.STORAGE_FAILED,a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).code);
        assertTrue(a.snapshot(NOW).exclusive);
        s.failLoad=false;assertEquals(WarningAudioOwner.Code.OK,a.resetAfterVerifiedParkedStop());
        assertEquals(WarningAudioOwner.Code.OK,a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).code);
    }
    @Test public void explicitParkedRecoveryNeverReplaysAnOldPossiblyPlayedAuthority(){
        WarningCapabilities p=profile(true);MemoryStore store=new MemoryStore();WarningAudioOwner a=owner(store,journal(),p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease lease=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;begin(a,c,lease,20,NOW);
        assertEquals(WarningAudioOwner.Code.OK,a.resetAfterVerifiedParkedStop());assertNull(store.value);
        lease=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;
        assertEquals(WarningAudioOwner.Code.EVENT_UNAVAILABLE,begin(a,c,lease,21,NOW).code);
    }

    @Test public void uncertainButQuiescentAllowsFutureWarningsWithoutReplayingThatEvent() {
        WarningCapabilities p=profile(true);MemoryStore s=new MemoryStore();WarningAudioOwner a=owner(s,journal(),p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;PlaybackGrant g=begin(a,c,l,20,NOW).grant;
        assertEquals(WarningAudioOwner.Code.AUDIO_UNCERTAIN,a.outcome(c.uid,c.consumerNonce,g,PlaybackGrant.Outcome.FAILED,false,NOW));
        assertEquals(WarningAudioOwner.Code.OK,a.outcome(c.uid,c.consumerNonce,g,PlaybackGrant.Outcome.UNCERTAIN,true,NOW));
        assertEquals(WarningAudioOwner.Code.ALREADY_HANDLED,begin(a,c,l,21,NOW).code);assertNull(s.value);
    }

    @Test public void authenticatedMuteDecisionsAreTerminalWithoutIssuingPlaybackGrants() {
        WarningCapabilities p=profile(true);MemoryStore s=new MemoryStore();WarningAudioOwner a=owner(s,journal(),p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;
        WarningAudioOwner.GrantResult decision=a.decide(c.uid,c,l.token,l.epoch,"secret-warning-at-52-5",WarningEvent.Phase.NOTICE,1,id(20),PlaybackGrant.Outcome.USER_FILTERED,NOW);
        assertEquals(WarningAudioOwner.Code.OK,decision.code);assertFalse(decision.grant.granted);assertEquals(0,s.saves);
        assertEquals(WarningAudioOwner.Code.ALREADY_HANDLED,begin(a,c,l,21,NOW).code);
        try { a.claim(10002,c,WarningAudioOwner.Mode.VOICE,true,NOW);fail("Forged UID"); } catch(SecurityException expected) { }
    }
    @Test public void deathImmediatelyRemovesReadinessAndRejectsNewStartedReports() {
        WarningCapabilities p=profile(true);MemoryStore s=new MemoryStore();WarningAudioOwner a=owner(s,journal(),p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;
        a.consumerDied(c.uid,c.registration,NOW);
        assertEquals(WarningAudioOwner.Code.SPEAKER_UNAVAILABLE,a.snapshot(NOW).code);assertFalse(a.snapshot(NOW).owner.ready);
        a=owner(new MemoryStore(),journal(),p);l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;
        PlaybackGrant g=begin(a,c,l,20,NOW).grant;a.consumerDied(c.uid,c.registration,NOW);
        assertEquals(WarningAudioOwner.Code.STALE_OWNER,a.outcome(c.uid,c.consumerNonce,g,PlaybackGrant.Outcome.STARTED,false,NOW+1));
        assertEquals(WarningAudioOwner.Code.AUDIO_UNCERTAIN,a.snapshot(NOW+1).code);
    }
    @Test public void revisedPayloadCannotBePairedWithAnOlderRetriedGrant() {
        WarningCapabilities p=profile(true);MemoryStore s=new MemoryStore();WarningJournal j=journal();WarningAudioOwner a=owner(s,j,p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;PlaybackGrant g=begin(a,c,l,20,NOW).grant;
        j.append(event(2,"UPSERT",2),NOW);
        WarningAudioOwner.GrantResult retry=begin(a,c,l,20,NOW);
        assertEquals(WarningAudioOwner.Code.REVISION_CHANGED,retry.code);assertEquals(2,retry.announcement.payload.revision);
        assertEquals(g.attemptId,a.snapshot(NOW).pending.attemptId);assertEquals(1,s.saves);
        assertEquals(WarningAudioOwner.Code.OK,a.outcome(c.uid,c.consumerNonce,g,PlaybackGrant.Outcome.NOT_STARTED,true,NOW));
        WarningAudioOwner.GrantResult updated=a.begin(c.uid,c,l.token,l.epoch,"secret-warning-at-52-5",WarningEvent.Phase.NOTICE,1,2,id(21),NOW);
        assertEquals(WarningAudioOwner.Code.GRANTED,updated.code);assertEquals(2,updated.grant.revision);assertEquals(updated.grant.revision,updated.announcement.payload.revision);
        a.outcome(c.uid,c.consumerNonce,updated.grant,PlaybackGrant.Outcome.STARTED,false,NOW);
        assertEquals(WarningAudioOwner.Code.ALREADY_HANDLED,a.begin(c.uid,c,l.token,l.epoch,"secret-warning-at-52-5",WarningEvent.Phase.NOTICE,1,2,id(21),NOW).code);
    }
    @Test public void retryCannotOverrideIntentionalMuteOrChangeItsGrantedOutputMode() {
        WarningCapabilities p=profile(true);MemoryStore s=new MemoryStore();WarningAudioOwner a=owner(s,journal(),p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;PlaybackGrant g=begin(a,c,l,20,NOW).grant;
        a.renew(c.uid,c,l.token,l.epoch,WarningAudioOwner.Mode.SILENT,false,NOW);
        assertEquals(WarningAudioOwner.Code.OUTPUT_MUTED,begin(a,c,l,20,NOW).code);assertNotNull(s.value);
        a.renew(c.uid,c,l.token,l.epoch,WarningAudioOwner.Mode.TONE,true,NOW);
        assertEquals("OUTPUT_CHANGED",begin(a,c,l,20,NOW).code.name());
        assertEquals(WarningAudioOwner.Code.ATTEMPT_ACTIVE,a.decide(c.uid,c,l.token,l.epoch,"secret-warning-at-52-5",WarningEvent.Phase.NOTICE,1,id(20),PlaybackGrant.Outcome.USER_FILTERED,NOW).code);
        assertEquals(WarningAudioOwner.Code.OK,a.outcome(c.uid,c.consumerNonce,g,PlaybackGrant.Outcome.NOT_STARTED,true,NOW));
    }
    @Test public void filteredOtherEventsCanBeAccountedForDuringActiveOutput() {
        WarningCapabilities p=profile(true);MemoryStore s=new MemoryStore();WarningJournal j=journal();WarningAudioOwner a=owner(s,j,p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;PlaybackGrant g=begin(a,c,l,20,NOW).grant;
        Bundle second=WarningCodec.encode(event(2,"ANNOUNCE",1));second.putString("warning_id","second-warning");j.append(WarningCodec.decode(second,NOW),NOW);
        WarningAudioOwner.GrantResult decision=a.decide(c.uid,c,l.token,l.epoch,"second-warning",WarningEvent.Phase.NOTICE,1,id(21),PlaybackGrant.Outcome.USER_FILTERED,NOW);
        assertEquals(WarningAudioOwner.Code.OK,decision.code);assertFalse(decision.grant.granted);assertEquals(g.attemptId,a.snapshot(NOW).pending.attemptId);assertEquals(1,s.saves);
    }
    @Test public void unavailableRepeatedClaimUpdatesReadinessWithoutExtendingItsLease() {
        WarningCapabilities p=profile(true);WarningAudioOwner a=owner(new MemoryStore(),journal(),p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;
        assertEquals(WarningAudioOwner.Code.SPEAKER_UNAVAILABLE,a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,false,NOW+1000).code);
        assertFalse(a.snapshot(NOW+1000).owner.ready);assertEquals(l.until,a.snapshot(NOW+1000).owner.until);
        assertEquals(WarningAudioOwner.Code.SPEAKER_UNAVAILABLE,begin(a,c,l,20,NOW+1000).code);
        WarningAudioOwner.Client partial=new WarningAudioOwner.Client(10002,"app.partial",id(40),id(41),java.util.Collections.singleton("native_text:v1"),EnumSet.allOf(WarningAudioOwner.Mode.class),p.digest);
        assertEquals(WarningAudioOwner.Code.COVERAGE_INCOMPLETE,a.claim(partial.uid,partial,WarningAudioOwner.Mode.VOICE,true,NOW+6000).code);
    }
    @Test public void dispositionCapacityFailsExplicitlyWithoutEvictingOldAttempts() {
        WarningCapabilities p=profile(true);MemoryStore s=new MemoryStore();WarningAudioOwner a=owner(s,journal(),p);WarningAudioOwner.Client c=client(10001,p);
        WarningAudioOwner.Lease l=a.claim(c.uid,c,WarningAudioOwner.Mode.VOICE,true,NOW).lease;
        for(int i=0;i<WarningAudioOwner.MAX_ATTEMPTS;i++) {
            PlaybackGrant g=begin(a,c,l,200+i,NOW).grant;assertNotNull(g);
            assertEquals(WarningAudioOwner.Code.OK,a.outcome(c.uid,c.consumerNonce,g,PlaybackGrant.Outcome.NOT_STARTED,true,NOW));
        }
        assertEquals(WarningAudioOwner.MAX_ATTEMPTS,a.dispositions(c.uid,c.consumerNonce,NOW).size());
        assertEquals(WarningAudioOwner.Code.OVERFLOW,begin(a,c,l,999,NOW).code);assertNull(s.value);
    }
    private static String repeat(String s,int count) { StringBuilder b=new StringBuilder();for(int i=0;i<count;i++)b.append(s);return b.toString(); }
}
