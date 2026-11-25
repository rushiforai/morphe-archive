package nl.johninnl.navigation.alerts;

import static org.junit.Assert.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.UUID;
import org.junit.Test;

public class AtomicPlaybackStoreTest {
    private String id(int n) { return UUID.nameUUIDFromBytes(("store-"+n).getBytes(StandardCharsets.UTF_8)).toString(); }
    private PlaybackGrant grant() {
        return new PlaybackGrant("boot-count:7",id(1),id(2),id(3),WarningCapabilities.sha256("secret native id at 52-5".getBytes(StandardCharsets.UTF_8)),
                id(4),id(5),10001,3,7,WarningAudioOwner.Mode.VOICE,PlaybackGrant.Outcome.GRANTED,true,false);
    }
    @Test public void onlyOpaqueGrantIdentityAndDispositionRoundTrip() throws Exception {
        PlaybackGrant value=grant().state(PlaybackGrant.Outcome.STARTED,true);
        byte[] bytes=AtomicPlaybackStore.encode(value);assertTrue(bytes.length<=4096);
        String data=new String(bytes,StandardCharsets.UTF_8);
        assertFalse(data.contains("secret"));assertFalse(data.contains("52-5"));assertFalse(data.contains("message"));
        PlaybackGrant decoded=AtomicPlaybackStore.decode(bytes);
        assertTrue(value.sameIdentity(decoded));assertEquals(PlaybackGrant.Outcome.STARTED,decoded.outcome);assertTrue(decoded.started);
        assertNull(AtomicPlaybackStore.decode(AtomicPlaybackStore.encode(null)));
    }
    @Test public void corruptionTruncationAndOversizeFailClosed() throws Exception {
        byte[] bytes=AtomicPlaybackStore.encode(grant());
        byte[] changed=bytes.clone();changed[20]^=1;reject(changed);
        reject(Arrays.copyOf(bytes,20));reject(new byte[4097]);
    }
    @Test public void terminalAndNonGrantedRecordsCannotBePersistedAsUncertainty() throws Exception {
        try { AtomicPlaybackStore.encode(grant().state(PlaybackGrant.Outcome.COMPLETED,true));fail("Terminal ledger retained"); }
        catch(IOException expected) { }
        PlaybackGrant value=grant();
        PlaybackGrant decision=new PlaybackGrant(value.bootIdentity,value.providerSession,value.consumerNonce,value.ownerToken,value.eventKey,
                value.attemptId,value.attemptNonce,value.ownerUid,value.ownerEpoch,value.revision,WarningAudioOwner.Mode.SILENT,
                PlaybackGrant.Outcome.USER_MUTED,false,false);
        try { AtomicPlaybackStore.encode(decision);fail("Non-grant ledger retained"); }catch(IOException expected) { }
    }
    private void reject(byte[] bytes) throws Exception {
        try { AtomicPlaybackStore.decode(bytes);fail("Invalid ledger accepted"); }catch(IOException expected) { }
    }
}
