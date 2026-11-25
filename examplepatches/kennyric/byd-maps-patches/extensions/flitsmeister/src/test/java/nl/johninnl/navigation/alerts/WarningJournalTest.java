package nl.johninnl.navigation.alerts;

import static org.junit.Assert.*;
import android.os.Bundle;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=32, manifest=Config.NONE)
public class WarningJournalTest {
    private static final String SESSION = "d8c98c2f-afb2-43bb-90e8-bb3711cbba48";
    private static final long NOW = 100000;

    private WarningEvent event(long sequence, String id, long revision, long index, String operation, long observed, String message) {
        Bundle b = new Bundle(); b.putInt("protocol_version", 1); b.putString("provider_session", SESSION);
        b.putLong("sequence", sequence); b.putString("warning_id", id); b.putLong("revision", revision);
        b.putLong("announcement_index", index); b.putString("operation", operation);
        b.putLong("observed_elapsed_ms", observed); b.putLong("issued_elapsed_ms", observed);
        if (!operation.equals("CLEAR")) {
            b.putString("phase", "notice"); b.putString("native_type", "Incident"); b.putString("native_subtype", "OBSTACLE");
            b.putString("category", "road_danger"); b.putInt("priority", 1); b.putString("message", message);
            b.putString("message_origin", "native_text"); b.putString("language_tag", "en");
            b.putString("relevance", "point"); b.putString("relationship", "ahead");
            b.putLong("announce_until_elapsed_ms", observed+10000); b.putLong("state_until_elapsed_ms", observed+30000);
        }
        return WarningCodec.decode(b, observed);
    }

    private WarningEvent camera(long sequence, String id, String operation) {
        Bundle b = WarningCodec.encode(event(sequence,id,sequence,0,operation,NOW,"Camera"));
        b.putString("native_type","CAMERA"); b.putString("category","display_only");
        b.putString("native_namespace","waze.insights.native_tile"); b.putInt("native_tile_kind",72);
        b.putString("position_clock_origin","native_tile"); b.putBoolean("native_point_target",true);
        if(!operation.equals("CLEAR")) {
            b.putDouble("latitude",52); b.putDouble("longitude",5);
            b.putLong("position_observed_elapsed_ms",NOW); b.putBoolean("position_estimated",false);
        }
        return WarningCodec.decode(b,NOW);
    }

    @Test public void nativeWarningDisplacesCameraTombstoneWithoutLosingSpeechOrCancellation() {
        WarningJournal journal = new WarningJournal(SESSION);
        long sequence=0;
        for(int i=0;i<32;i++) assertEquals(WarningJournal.Append.ACCEPTED,journal.append(camera(++sequence,"camera-"+i,"UPSERT"),NOW));
        for(int i=0;i<96;i++) assertEquals(WarningJournal.Append.ACCEPTED,journal.append(event(++sequence,"native-"+i,1,1,"ANNOUNCE",NOW,"Native"),NOW));
        assertEquals(WarningJournal.Append.ACCEPTED,journal.append(camera(++sequence,"camera-0","CLEAR"),NOW));
        long cursor=sequence;
        assertEquals(WarningJournal.Append.ACCEPTED,journal.append(event(++sequence,"new-native",1,1,"ANNOUNCE",NOW,"New native"),NOW));
        WarningJournal.Resume result=journal.resume(SESSION,cursor,NOW);
        assertTrue(result.resyncRequired); assertFalse(result.overflow);
        assertNotNull(journal.announcement("native-0",WarningEvent.Phase.NOTICE,1,NOW));
        assertNotNull(journal.announcement("new-native",WarningEvent.Phase.NOTICE,1,NOW));
        assertEquals(WarningJournal.Append.ACCEPTED,journal.append(event(++sequence,"native-0",2,1,"CLEAR",NOW,""),NOW));
        assertNull(journal.announcement("native-0",WarningEvent.Phase.NOTICE,1,NOW));
        assertNotNull(journal.announcement("native-1",WarningEvent.Phase.NOTICE,1,NOW));
    }

    @Test public void cameraChurnCannotOverflowOrEvictNativeAuthority() {
        WarningJournal journal=new WarningJournal(SESSION);
        long sequence=1;
        assertEquals(WarningJournal.Append.ACCEPTED,journal.append(event(sequence,"native",1,1,"ANNOUNCE",NOW,"Native"),NOW));
        for(int i=0;i<400;i++) {
            assertEquals(WarningJournal.Append.ACCEPTED,journal.append(camera(++sequence,"camera-"+i,"UPSERT"),NOW));
            assertEquals(WarningJournal.Append.ACCEPTED,journal.append(camera(++sequence,"camera-"+i,"CLEAR"),NOW));
        }
        WarningJournal.Resume result=journal.resume(SESSION,sequence-1,NOW);
        assertFalse(result.overflow); assertTrue(result.events.size()<=128); assertEquals(1,result.currentState.size());
        assertNotNull(journal.announcement("native",WarningEvent.Phase.NOTICE,1,NOW));
    }

    @Test public void fullNativeJournalDropsOnlyNewDisplayFeatures() {
        WarningJournal journal=new WarningJournal(SESSION);
        for(int i=1;i<=128;i++) journal.append(event(i,"native-"+i,1,1,"ANNOUNCE",NOW,"Native"),NOW);
        assertEquals(WarningJournal.Append.ACCEPTED,journal.append(camera(129,"camera","UPSERT"),NOW));
        assertEquals(WarningJournal.Append.ACCEPTED,journal.append(camera(130,"camera","CLEAR"),NOW));
        assertFalse(journal.resume(SESSION,128,NOW).overflow);
        assertEquals(128,journal.resume(SESSION,130,NOW).currentState.size());
        assertNotNull(journal.announcement("native-1",WarningEvent.Phase.NOTICE,1,NOW));
    }

    @Test public void transportIdentityConflictsAndNativeRepeatsRemainDistinct() {
        WarningJournal journal = new WarningJournal(SESSION);
        WarningEvent first = event(1,"a",1,1,"ANNOUNCE",NOW,"Obstacle");
        assertEquals(WarningJournal.Append.ACCEPTED, journal.append(first,NOW));
        assertEquals(WarningJournal.Append.DUPLICATE, journal.append(first,NOW));
        assertEquals(WarningJournal.Append.CONFLICT, journal.append(event(1,"a",1,1,"ANNOUNCE",NOW,"Different"),NOW));
        assertEquals(WarningJournal.Append.CONFLICT, journal.append(event(2,"a",2,1,"ANNOUNCE",NOW,"Duplicate intent"),NOW));
        assertEquals(WarningJournal.Append.ACCEPTED, journal.append(event(2,"a",2,2,"ANNOUNCE",NOW,"Native repeat"),NOW));
        WarningJournal.Resume result = journal.resume(SESSION,0,NOW);
        assertFalse(result.resyncRequired); assertEquals(2,result.headSequence); assertEquals(2,result.announcements.size());
        assertEquals(2,result.announcements.get(1).authority.announcementIndex);
    }

    @Test public void clearCancelsSourceAuthorityWithoutInventingAnotherAnnouncement() {
        WarningJournal journal = new WarningJournal(SESSION);
        journal.append(event(1,"a",1,1,"ANNOUNCE",NOW,"Obstacle"),NOW);
        journal.append(event(2,"a",2,1,"CLEAR",NOW+1,""),NOW+1);
        WarningJournal.Resume result = journal.resume(SESSION,0,NOW+1);
        assertEquals(2,result.events.size()); assertTrue(result.currentState.isEmpty()); assertTrue(result.announcements.isEmpty());
        assertNull(journal.announcement("a",WarningEvent.Phase.NOTICE,1,NOW+1));
        assertEquals(WarningJournal.Append.STALE_REVISION, journal.append(event(3,"a",1,1,"UPSERT",NOW+1,"Old"),NOW+1));
    }

    @Test public void newUnsaidRevisionUsesOriginalAuthorityAndDeadline() {
        WarningJournal journal = new WarningJournal(SESSION);
        journal.append(event(1,"a",1,1,"ANNOUNCE",NOW,"Original"),NOW);
        journal.append(event(2,"a",2,1,"UPSERT",NOW+3000,"Updated native text"),NOW+3000);
        WarningJournal.Announcement candidate = journal.announcement("a",WarningEvent.Phase.NOTICE,1,NOW+3000);
        assertEquals(1,candidate.authority.sequence); assertEquals(NOW+10000,candidate.announceUntil);
        assertEquals("Updated native text",candidate.payload.message); assertEquals(2,candidate.payload.revision);
        WarningJournal.Resume result = journal.resume(SESSION,0,NOW+3000);
        assertEquals("Original",result.events.get(0).message); assertEquals(NOW,result.events.get(0).issuedAt);
        assertNull(journal.announcement("a",WarningEvent.Phase.NOTICE,1,NOW+10000));
        assertEquals(1,journal.resume(SESSION,2,NOW+10000).currentState.size());
    }

    @Test public void expiredSpeechMayRemainStateButCannotBecomeANewDanger() {
        WarningJournal journal = new WarningJournal(SESSION);
        journal.append(event(1,"a",1,1,"ANNOUNCE",NOW,"Obstacle"),NOW);
        WarningJournal.Resume result = journal.resume(SESSION,0,NOW+11000);
        assertEquals(1,result.currentState.size()); assertTrue(result.announcements.isEmpty());
        assertEquals(NOW,result.events.get(0).issuedAt); assertFalse(result.events.get(0).announcementValid(NOW+11000));
        result = journal.resume(SESSION,0,NOW+30000);
        assertTrue(result.resyncRequired); assertTrue(result.events.isEmpty()); assertTrue(result.currentState.isEmpty());
    }

    @Test public void coalescingIsExplicitResynchronizationAndPreservesAnnouncements() {
        WarningJournal journal = new WarningJournal(SESSION);
        journal.append(event(1,"a",1,0,"UPSERT",NOW,"State"),NOW);
        journal.append(event(2,"danger",1,1,"ANNOUNCE",NOW,"Urgent native event"),NOW);
        for(int i=3;i<=128;i++) journal.append(event(i,"a",i,0,"UPSERT",NOW,"Updated"),NOW);
        assertEquals(WarningJournal.Append.ACCEPTED, journal.append(event(129,"a",129,0,"UPSERT",NOW,"Latest"),NOW));
        WarningJournal.Resume result = journal.resume(SESSION,0,NOW);
        assertTrue(result.resyncRequired); assertFalse(result.overflow); assertTrue(result.events.size()<=128);
        assertEquals(129,result.headSequence); assertEquals(1,result.announcements.size()); assertEquals(2,result.announcements.get(0).authority.sequence);
        assertEquals(129,journal.resume(SESSION,128,NOW).events.get(0).sequence);
        assertFalse(journal.resume(SESSION,128,NOW).resyncRequired);
    }

    @Test public void overloadIsBoundedAndEvenAnUnretainedClearRemovesPlaybackAuthority() {
        WarningJournal journal = new WarningJournal(SESSION);
        for(int i=1;i<=128;i++) assertEquals(WarningJournal.Append.ACCEPTED,journal.append(event(i,"a",i,i,"ANNOUNCE",NOW,"Native repeat"),NOW));
        assertEquals(WarningJournal.Append.OVERFLOW,journal.append(event(129,"a",129,129,"ANNOUNCE",NOW,"Not retained"),NOW));
        assertEquals(WarningJournal.Append.OVERFLOW,journal.append(event(130,"a",130,129,"CLEAR",NOW,""),NOW));
        WarningJournal.Resume result = journal.resume(SESSION,128,NOW);
        assertTrue(result.resyncRequired); assertTrue(result.overflow); assertEquals(130,result.headSequence);
        assertTrue(result.announcements.isEmpty()); assertTrue(result.currentState.isEmpty()); assertTrue(result.events.size()<=128);
        assertNull(journal.announcement("a",WarningEvent.Phase.NOTICE,128,NOW));
    }

    @Test public void latestStateIsBoundedAndNoImplicitCursorOrSessionResetOccurs() {
        WarningJournal journal = new WarningJournal(SESSION);
        for(int i=1;i<=128;i++) journal.append(event(i,"id-"+i,1,0,"UPSERT",NOW,"State"),NOW);
        assertEquals(WarningJournal.Append.OVERFLOW,journal.append(event(129,"id-129",1,0,"UPSERT",NOW,"State"),NOW));
        assertEquals(128,journal.resume(SESSION,0,NOW).currentState.size());
        assertTrue(journal.resume("previous-process",9999,NOW).resyncRequired);
        try { journal.resume(SESSION,130,NOW); fail("Future cursor accepted"); }
        catch (IllegalArgumentException expected) { assertTrue(expected.getMessage().contains("CURSOR")); }
        try { journal.resume(SESSION,0,NOW-1); fail("Clock rollback accepted"); }
        catch (IllegalArgumentException expected) { assertTrue(expected.getMessage().contains("CLOCK")); }
    }

    @Test public void returnedCollectionsAreSnapshotsAndCannotMutateTheJournal() {
        WarningJournal journal = new WarningJournal(SESSION);
        journal.append(event(1,"a",1,0,"UPSERT",NOW,"State"),NOW);
        WarningJournal.Resume first = journal.resume(SESSION,0,NOW);
        journal.append(event(2,"a",2,0,"UPSERT",NOW,"New state"),NOW);
        assertEquals(1,first.events.size()); assertEquals("State",first.currentState.get(0).message);
        try { first.events.clear(); fail("Mutable journal output"); } catch(UnsupportedOperationException expected) { }
    }

    @Test public void emissionOrderCannotExpireAClearBeforeTheEventItCancels() {
        WarningJournal journal = new WarningJournal(SESSION);
        journal.append(event(1,"a",1,1,"ANNOUNCE",NOW,"Obstacle"),NOW);
        assertEquals(WarningJournal.Append.OUT_OF_ORDER,
                journal.append(event(2,"a",2,1,"CLEAR",NOW-1,""),NOW));
        assertNotNull(journal.announcement("a",WarningEvent.Phase.NOTICE,1,NOW));
        assertEquals(WarningJournal.Append.ACCEPTED,
                journal.append(event(2,"a",2,1,"CLEAR",NOW,""),NOW));
        Bundle olderObservation = WarningCodec.encode(event(3,"b",1,0,"UPSERT",NOW-100,"Older native observation"));
        olderObservation.putLong("issued_elapsed_ms",NOW+1);
        assertEquals(WarningJournal.Append.ACCEPTED,journal.append(WarningCodec.decode(olderObservation,NOW+1),NOW+1));
    }

    @Test public void laterStateAndNewNativeAnnouncementsCannotResurrectClearedAuthorities() {
        WarningJournal journal = new WarningJournal(SESSION);
        journal.append(event(1,"a",1,1,"ANNOUNCE",NOW,"Old danger"),NOW);
        journal.append(event(2,"a",2,1,"CLEAR",NOW,""),NOW);
        journal.append(event(3,"a",3,1,"UPSERT",NOW,"Current display only"),NOW);
        assertNull(journal.announcement("a",WarningEvent.Phase.NOTICE,1,NOW));
        assertTrue(journal.resume(SESSION,0,NOW).announcements.isEmpty());
        journal.append(event(4,"a",4,2,"ANNOUNCE",NOW,"New native decision"),NOW);
        assertNull(journal.announcement("a",WarningEvent.Phase.NOTICE,1,NOW));
        List<WarningJournal.Announcement> candidates = journal.resume(SESSION,0,NOW).announcements;
        assertEquals(1,candidates.size()); assertEquals(2,candidates.get(0).authority.announcementIndex);
    }

    @Test public void expiredPayloadCannotEraseARevisionFloorWhileOlderAuthorityRemains() {
        WarningJournal journal = new WarningJournal(SESSION);
        journal.append(event(1,"a",1,1,"ANNOUNCE",NOW,"Original"),NOW);
        Bundle newer = WarningCodec.encode(event(2,"a",3,1,"UPSERT",NOW,"Newer revision"));
        newer.putLong("state_until_elapsed_ms",NOW+1);
        journal.append(WarningCodec.decode(newer,NOW),NOW);
        assertEquals(WarningJournal.Append.STALE_REVISION,
                journal.append(event(3,"a",2,1,"UPSERT",NOW+2,"Older revision"),NOW+2));
        assertEquals("Newer revision",journal.announcement("a",WarningEvent.Phase.NOTICE,1,NOW+2).payload.message);
        assertTrue(journal.resume(SESSION,0,NOW+2).currentState.isEmpty());
    }

    @Test public void overflowClearRemainsEffectiveAfterAnotherUnretainedStateUpdate() {
        WarningJournal journal = new WarningJournal(SESSION);
        for(int i=1;i<=128;i++) journal.append(event(i,"a",i,i,"ANNOUNCE",NOW,"Repeat"),NOW);
        assertEquals(WarningJournal.Append.OVERFLOW,journal.append(event(129,"a",129,128,"CLEAR",NOW,""),NOW));
        assertEquals(WarningJournal.Append.OVERFLOW,journal.append(event(130,"a",130,128,"UPSERT",NOW,"Display"),NOW));
        assertNull(journal.announcement("a",WarningEvent.Phase.NOTICE,128,NOW));
        assertTrue(journal.resume(SESSION,0,NOW).announcements.isEmpty());
    }

    @Test public void aLaterNativeRepeatDoesNotUndoAnOlderUnsaidPayloadRevision() {
        WarningJournal journal = new WarningJournal(SESSION);
        journal.append(event(1,"a",1,1,"ANNOUNCE",NOW,"Original"),NOW);
        journal.append(event(2,"a",2,1,"UPSERT",NOW,"Updated native instruction"),NOW);
        journal.append(event(3,"a",3,2,"ANNOUNCE",NOW,"New native repeat"),NOW);
        assertEquals("Updated native instruction",journal.announcement("a",WarningEvent.Phase.NOTICE,1,NOW).payload.message);
        assertEquals("New native repeat",journal.announcement("a",WarningEvent.Phase.NOTICE,2,NOW).payload.message);
    }
}
