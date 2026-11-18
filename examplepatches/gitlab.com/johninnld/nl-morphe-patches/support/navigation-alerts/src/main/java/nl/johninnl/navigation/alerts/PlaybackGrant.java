package nl.johninnl.navigation.alerts;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;

/** Opaque output identity. No warning ID, instruction text, location or replayable prompt. */
public final class PlaybackGrant {
    public enum Outcome { GRANTED, RECEIVED, QUEUED, NOT_STARTED, STARTED, COMPLETED, INTERRUPTED,
        CANCELLED, USER_MUTED, USER_FILTERED, EXPIRED, REJECTED, FAILED, UNCERTAIN }
    public final String bootIdentity, providerSession, consumerNonce, ownerToken, eventKey, attemptId, attemptNonce;
    public final int ownerUid;
    public final long ownerEpoch, revision;
    public final WarningAudioOwner.Mode mode;
    public final Outcome outcome;
    public final boolean granted, started;

    PlaybackGrant(String boot, String session, String consumer, String token, String key, String attempt,
                  String nonce, int uid, long epoch, long revision, WarningAudioOwner.Mode mode,
                  Outcome outcome, boolean granted, boolean started) {
        if (boot == null || !boot.matches("boot-count:[0-9]{1,10}") || !uuid(session) || !uuid(consumer)
                || !uuid(token) || key == null || !key.matches("[0-9a-f]{64}") || !uuid(attempt) || !uuid(nonce)
                || uid <= 0 || epoch <= 0 || revision < 0 || mode == null || outcome == null
                || (granted && mode == WarningAudioOwner.Mode.SILENT)) throw new IllegalArgumentException("GRANT_IDENTITY");
        bootIdentity=boot;providerSession=session;consumerNonce=consumer;ownerToken=token;eventKey=key;
        attemptId=attempt;attemptNonce=nonce;ownerUid=uid;ownerEpoch=epoch;this.revision=revision;
        this.mode=mode;this.outcome=outcome;this.granted=granted;this.started=started;
    }
    PlaybackGrant state(Outcome state, boolean hasStarted) {
        return new PlaybackGrant(bootIdentity,providerSession,consumerNonce,ownerToken,eventKey,attemptId,
                attemptNonce,ownerUid,ownerEpoch,revision,mode,state,granted,hasStarted);
    }
    boolean sameIdentity(PlaybackGrant value) {
        return value != null && bootIdentity.equals(value.bootIdentity) && providerSession.equals(value.providerSession)
                && consumerNonce.equals(value.consumerNonce) && ownerToken.equals(value.ownerToken)
                && eventKey.equals(value.eventKey) && attemptId.equals(value.attemptId) && attemptNonce.equals(value.attemptNonce)
                && ownerUid==value.ownerUid && ownerEpoch==value.ownerEpoch && revision==value.revision
                && mode==value.mode && granted==value.granted;
    }
    static boolean uuid(String value) { return value != null && value.matches("[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"); }
    static String key(WarningEvent event) {
        try {
            ByteArrayOutputStream bytes=new ByteArrayOutputStream();DataOutputStream out=new DataOutputStream(bytes);
            out.writeUTF(event.providerSession);out.writeUTF(event.warningId);out.writeUTF(event.phase.name());out.writeLong(event.announcementIndex);
            return WarningCapabilities.sha256(bytes.toByteArray());
        } catch(IOException impossible) { throw new IllegalStateException(impossible); }
    }
    static boolean terminal(Outcome state) {
        return state==Outcome.NOT_STARTED || state==Outcome.COMPLETED || state==Outcome.INTERRUPTED || state==Outcome.CANCELLED
                || state==Outcome.USER_MUTED || state==Outcome.USER_FILTERED || state==Outcome.EXPIRED
                || state==Outcome.REJECTED || state==Outcome.FAILED || state==Outcome.UNCERTAIN;
    }
    static boolean suppressesReplay(Outcome state) {
        return state==Outcome.COMPLETED || state==Outcome.INTERRUPTED || state==Outcome.FAILED || state==Outcome.USER_MUTED || state==Outcome.USER_FILTERED
                || state==Outcome.EXPIRED || state==Outcome.REJECTED || state==Outcome.UNCERTAIN;
    }
}
