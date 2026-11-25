package nl.johninnl.navigation.alerts;

import static org.junit.Assert.*;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** Lost replies retain real source-side grants; a transport timeout is not a playback result. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=32, manifest=Config.NONE)
public class WarningSchedulerRecoveryTest {
    WarningSchedulerTest fixture;
    RecordingSource transport;
    final List<Request> requests = new ArrayList<>();
    final List<Outcome> outcomes = new ArrayList<>();
    final List<String> order = new ArrayList<>();
    final Queue<Acknowledgement> heldAcknowledgements = new ArrayDeque<>();
    boolean holdAcknowledgements;

    @org.junit.After public void uniformOn(){UniformAlerts.enabled=true;}
    @Before public void setup() {
        UniformAlerts.enabled=false; // provider-text protocol checks
        fixture = new WarningSchedulerTest();
        fixture.source = fixture.new Source();
        transport = new RecordingSource(fixture.source);
        fixture.scheduler = newScheduler();
        fixture.scheduler.connected(transport, snapshot());
    }

    @Test public void lostPersistedGrantAndNewRevisionRetireUnsubmittedOutputBeforeFreshGrant() {
        WarningEvent authority = fixture.event("revised-road", 1, 1, WarningEvent.Operation.ANNOUNCE);
        PlaybackGrant original = loseGrant(authority, false);
        fixture.time.now += 50;
        WarningEvent revised = fixture.event("revised-road", 1, 2, WarningEvent.Operation.UPSERT);
        fixture.source.add(revised);
        fixture.scheduler.events(transport, Collections.singletonList(revised));
        assertEquals(0, fixture.speaker.calls);

        timeoutPersistedReply();
        driveUntilOutput();

        assertEquals("Only revised output may reach the native speaker", 1, fixture.speaker.calls);
        assertEquals(2, fixture.speaker.event.revision);
        assertEquals(revised.message, fixture.speaker.event.message);
        assertEquals(authority.announceUntil, fixture.speaker.deadline);
        assertNotEquals(original.attemptId, fixture.speaker.grant.attemptId);
        assertNotEquals(original.attemptNonce, fixture.speaker.grant.attemptNonce);
        assertImmutableRevisionPerNonce();
        assertRetiredBeforeFreshRequest(original, fixture.speaker.grant.attemptNonce);
        assertRealUnsubmittedLedger(original, fixture.speaker.grant);
    }

    @Test public void reconnectAcknowledgesLocallyKnownNeverSubmittedGrantBeforeReplay() {
        WarningEvent authority = fixture.event("reconnected-road", 1, 1, WarningEvent.Operation.ANNOUNCE);
        PlaybackGrant original = loseGrant(authority, true);
        transport.online = false;
        fixture.scheduler.disconnected();
        assertEquals(0, fixture.speaker.calls);
        assertTrue(original.sameIdentity(fixture.source.pending));

        // A new transport preserves the same actual source and live consumer nonce.
        RecordingSource reconnected = new RecordingSource(fixture.source);
        WarningConnection.Snapshot recovery = snapshot();
        assertEquals(PlaybackGrant.Outcome.GRANTED, recovery.dispositions.get(0).outcome);
        holdAcknowledgements = true;
        fixture.scheduler.connected(reconnected, recovery);
        fixture.scheduler.refresh();

        assertEquals(1, outcomes.size());
        assertEquals(PlaybackGrant.Outcome.NOT_STARTED, outcomes.get(0).value);
        assertTrue(outcomes.get(0).quiet);
        assertEquals("OK", outcomes.get(0).code);
        assertEquals(0, fixture.speaker.calls);
        assertNull("Real source retired the old grant, but its ACK reply is still held", fixture.source.pending);
        assertEquals(1, heldAcknowledgements.size());
        assertFalse("No replacement grant may precede the acknowledgement reply",
                requests.stream().anyMatch(request -> !request.nonce.equals(original.attemptNonce)));

        holdAcknowledgements = false;
        heldAcknowledgements.remove().deliver();
        driveUntilOutput();

        assertEquals(1, fixture.speaker.calls);
        assertEquals(authority.announceUntil, fixture.speaker.deadline);
        assertNotEquals(original.attemptId, fixture.speaker.grant.attemptId);
        assertRetiredBeforeFreshRequest(original, fixture.speaker.grant.attemptNonce);
        assertRealUnsubmittedLedger(original, fixture.speaker.grant);
    }

    @Test public void pendingSnapshotWithoutLocalNoSubmissionProofRemainsBlocked() {
        WarningEvent authority = fixture.event("unknown-pending-road", 1, 1, WarningEvent.Operation.ANNOUNCE);
        fixture.source.add(authority);
        WarningConnection.Lease lease = fixture.source.claim(WarningAudioOwner.Mode.VOICE, true).join().lease;
        PlaybackGrant unknown = fixture.source.begin(lease, authority, UUID.randomUUID().toString()).join().grant;
        assertNotNull(unknown);
        assertTrue(unknown.sameIdentity(fixture.source.pending));

        // Even the same UID/process nonce is insufficient: this scheduler never submitted that request.
        fixture.scheduler = newScheduler();
        fixture.scheduler.connected(new RecordingSource(fixture.source), snapshot());
        for (int i = 0; i < 6; i++) {
            fixture.time.now += 251;
            fixture.scheduler.refresh();
        }

        assertEquals(0, fixture.speaker.calls);
        assertTrue("Unknown output must retain the real source ownership fence", unknown.sameIdentity(fixture.source.pending));
        for (Outcome outcome : outcomes) {
            assertFalse("An unknown grant has no positive quiescence proof", outcome.quiet);
            assertEquals(PlaybackGrant.Outcome.UNCERTAIN, outcome.value);
        }
        assertTrue(fixture.source.pending.outcome == PlaybackGrant.Outcome.GRANTED
                || fixture.source.pending.outcome == PlaybackGrant.Outcome.UNCERTAIN);
        assertTrue(fixture.source.owner.snapshot(fixture.time.now).exclusive);
        assertNoPlaybackClaims();
    }

    private WarningScheduler newScheduler() {
        return new WarningScheduler(fixture.time, fixture.policy, fixture.speaker, new WarningScheduler.Observer() {
            public void changed(String status) { }
            public void outcome(WarningEvent event, PlaybackGrant.Outcome value) { fixture.observed.add(value); }
        });
    }

    private PlaybackGrant loseGrant(WarningEvent authority, boolean timeoutImmediately) {
        fixture.source.delayBegin = true;
        fixture.source.add(authority);
        fixture.scheduler.events(transport, Collections.singletonList(authority));
        PlaybackGrant grant = fixture.source.pending;
        assertNotNull("WarningAudioOwner must really persist the grant before losing its reply", grant);
        assertEquals(PlaybackGrant.Outcome.GRANTED, grant.outcome);
        assertFalse(grant.started);
        assertTrue(grant.sameIdentity(fixture.source.delayedReply.grant));
        assertEquals(0, fixture.speaker.calls);
        if (timeoutImmediately) timeoutPersistedReply();
        return grant;
    }

    private void timeoutPersistedReply() {
        CompletableFuture<WarningConnection.Attempt> lost = fixture.source.beginReply;
        fixture.source.delayBegin = false;
        assertTrue(lost.complete(new WarningConnection.Attempt(WarningWire.status("TIMEOUT"), fixture.time.now)));
    }

    private void driveUntilOutput() {
        for (int i = 0; i < 12 && fixture.speaker.calls == 0; i++) {
            fixture.time.now += 251;
            fixture.scheduler.refresh();
        }
    }

    private WarningConnection.Snapshot snapshot() {
        WarningJournal.Resume resume = fixture.source.journal.resume(fixture.session, 0, fixture.time.now);
        List<WarningConnection.Candidate> candidates = new ArrayList<>();
        for (WarningJournal.Announcement announcement : resume.announcements)
            candidates.add(new WarningConnection.Candidate(announcement.authority, announcement.payload));
        return new WarningConnection.Snapshot(fixture.session, resume.headSequence, resume.resyncRequired, true,
                fixture.source.owner.snapshot(fixture.time.now).code.name(), resume.currentState, resume.events, candidates,
                fixture.source.owner.dispositions(10001, fixture.source.client.consumerNonce, fixture.time.now));
    }

    private void assertImmutableRevisionPerNonce() {
        Map<String, Long> revisions = new HashMap<>();
        for (Request request : requests) {
            Long previous = revisions.putIfAbsent(request.nonce, request.revision);
            if (previous != null) assertEquals("A retry must retain the immutable request attached to its nonce",
                    previous.longValue(), request.revision);
        }
    }

    private void assertRetiredBeforeFreshRequest(PlaybackGrant original, String replacementNonce) {
        Outcome retired = outcomes.stream().filter(value -> value.grant.sameIdentity(original)).findFirst().orElse(null);
        assertNotNull("Known unsubmitted persisted grant needs a positive retirement", retired);
        assertEquals(PlaybackGrant.Outcome.NOT_STARTED, retired.value);
        assertTrue(retired.quiet);
        assertEquals("OK", retired.code);
        int retiredAt = order.indexOf("ack:" + original.attemptId);
        int replacementAt = order.indexOf("begin:" + replacementNonce);
        assertTrue(retiredAt >= 0 && replacementAt > retiredAt);
    }

    private void assertRealUnsubmittedLedger(PlaybackGrant original, PlaybackGrant replacement) {
        List<PlaybackGrant> ledger = fixture.source.owner.dispositions(10001, fixture.source.client.consumerNonce, fixture.time.now);
        PlaybackGrant retired = ledger.stream().filter(value -> value.sameIdentity(original)).findFirst().orElse(null);
        assertNotNull(retired);
        assertEquals(PlaybackGrant.Outcome.NOT_STARTED, retired.outcome);
        assertFalse(retired.started);
        assertTrue(replacement.sameIdentity(fixture.source.pending));
        assertEquals(PlaybackGrant.Outcome.GRANTED, fixture.source.pending.outcome);
        assertFalse(fixture.source.pending.started);
        assertNoPlaybackClaims();
    }

    private void assertNoPlaybackClaims() {
        assertFalse(fixture.observed.contains(PlaybackGrant.Outcome.STARTED));
        assertFalse(fixture.observed.contains(PlaybackGrant.Outcome.COMPLETED));
    }

    final class RecordingSource implements WarningScheduler.Transport {
        final WarningSchedulerTest.Source source;
        boolean online = true;
        RecordingSource(WarningSchedulerTest.Source source) { this.source = source; }
        public String identity() { return source.identity(); }
        public CompletableFuture<WarningConnection.Claim> claim(WarningAudioOwner.Mode mode, boolean ready) { return online ? source.claim(mode, ready) : unavailable(); }
        public CompletableFuture<WarningConnection.Claim> renew(WarningConnection.Lease lease, WarningAudioOwner.Mode mode, boolean ready) { return online ? source.renew(lease, mode, ready) : unavailable(); }
        public CompletableFuture<WarningConnection.Attempt> begin(WarningConnection.Lease lease, WarningEvent event, String nonce) {
            requests.add(new Request(nonce, event.revision)); order.add("begin:" + nonce);
            return online ? source.begin(lease, event, nonce) : unavailable();
        }
        public CompletableFuture<WarningConnection.Attempt> decide(WarningConnection.Lease lease, WarningEvent event, String nonce, PlaybackGrant.Outcome decision) { return online ? source.decide(lease, event, nonce, decision) : unavailable(); }
        public CompletableFuture<String> outcome(PlaybackGrant grant, PlaybackGrant.Outcome value, boolean quiet) {
            if (!online) return unavailable();
            CompletableFuture<String> reply = new CompletableFuture<>();
            Outcome recorded = new Outcome(grant, value, quiet); outcomes.add(recorded);
            source.outcome(grant, value, quiet).whenComplete((code, error) -> {
                recorded.code = code; order.add("ack:" + grant.attemptId);
                Acknowledgement ack = new Acknowledgement(reply, code, error);
                if (holdAcknowledgements) heldAcknowledgements.add(ack); else ack.deliver();
            });
            return reply;
        }
        public CompletableFuture<String> release(WarningConnection.Lease lease) { return online ? source.release(lease) : unavailable(); }
        private <T> CompletableFuture<T> unavailable() {
            CompletableFuture<T> failed = new CompletableFuture<>();
            failed.completeExceptionally(new java.io.IOException("Disconnected test transport"));
            return failed;
        }
    }

    static final class Request {
        final String nonce; final long revision;
        Request(String nonce, long revision) { this.nonce = nonce; this.revision = revision; }
    }
    static final class Outcome {
        final PlaybackGrant grant; final PlaybackGrant.Outcome value; final boolean quiet; String code;
        Outcome(PlaybackGrant grant, PlaybackGrant.Outcome value, boolean quiet) { this.grant = grant; this.value = value; this.quiet = quiet; }
    }
    static final class Acknowledgement {
        final CompletableFuture<String> reply; final String code; final Throwable error;
        Acknowledgement(CompletableFuture<String> reply, String code, Throwable error) { this.reply = reply; this.code = code; this.error = error; }
        void deliver() { if (error == null) reply.complete(code); else reply.completeExceptionally(error); }
    }
}
