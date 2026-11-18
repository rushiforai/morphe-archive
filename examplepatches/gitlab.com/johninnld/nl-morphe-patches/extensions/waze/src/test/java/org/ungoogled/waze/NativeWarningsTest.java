package org.ungoogled.waze;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;
import android.os.Bundle;
import android.os.Looper;
import android.os.SystemClock;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import nl.johninnl.navigation.alerts.WarningCodec;
import nl.johninnl.navigation.alerts.WarningEvent;
import nl.johninnl.navigation.alerts.WarningJournal;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/** Product adapter tests: snapshots are state; only correlated native decisions authorize speech. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=32, manifest=Config.NONE)
public class NativeWarningsTest {
    private final List<Bundle> events=new ArrayList<>();
    @Before public void setup()throws Exception{NativeWarnings.resetForTest(RuntimeEnvironment.getApplication(),events::add);sourceActivity(null);}
    private void sourceActivity(android.app.Activity activity)throws Exception{
        java.lang.reflect.Field field=Customization.class.getDeclaredField("resumed");field.setAccessible(true);field.set(null,new java.lang.ref.WeakReference<>(activity));
        for(String name:new String[]{"resumedActivities","startedActivities"}){java.lang.reflect.Field visible=Customization.class.getDeclaredField(name);visible.setAccessible(true);java.util.Set<android.app.Activity> set=(java.util.Set<android.app.Activity>)visible.get(null);set.clear();if(activity!=null)set.add(activity);}
    }
    private List<Object> retirements()throws Exception{
        List<Object> out=new ArrayList<>();java.lang.reflect.Field field=NativeWarnings.class.getDeclaredField("testRetire");field.setAccessible(true);field.set(null,(java.util.function.Consumer<Object>)out::add);return out;
    }
    @After public void teardown()throws Exception{NativeWarnings.resetForTest(null,null);sourceActivity(null);}
    private Bundle last(){return events.get(events.size()-1);}
    private long announcements(){return events.stream().filter(e->"ANNOUNCE".equals(e.getString("operation"))).count();}
    private void repository(Descriptor...values){NativeWarnings.repository(new Repository(Arrays.asList(values)));}
    @Test public void nativeRangePointsSwitchAtNativeEntryWithoutChangingWarningAuthority(){
        long[] range={1,7,11,5000000,52000000,5100000,52100000,3};
        Segment s=new Segment("AVERAGE_SPEED_CAMERA","7-11");SegmentUpdate update=new SegmentUpdate(Collections.singletonList(s));
        NativeWarnings.segments(update,range);Bundle approach=last();String id=approach.getString("warning_id");
        assertEquals("start",nl.johninnl.navigation.alerts.WarningGeometry.zonePoint(decoded(approach)));
        assertEquals(Double.valueOf(52),decoded(approach).latitude);assertEquals("native_route_line",approach.getString("position_clock_origin"));
        assertEquals(50,approach.getInt("distance_m"));assertEquals("APPROACHING",approach.getString("native_segment_phase"));
        s.phase="WITHIN";NativeWarnings.segments(update,range);Bundle inside=last();
        assertEquals(id,inside.getString("warning_id"));assertEquals("end",nl.johninnl.navigation.alerts.WarningGeometry.zonePoint(decoded(inside)));
        assertEquals(Double.valueOf(52.1),decoded(inside).latitude);assertEquals(50,inside.getInt("distance_m"));
        assertEquals("remaining_in_segment",inside.getString("native_distance_kind"));assertEquals(0,announcements());
        NativeWarnings.segments(update,new long[]{2});
        assertFalse(last().containsKey("latitude"));assertNull(nl.johninnl.navigation.alerts.WarningGeometry.zonePoint(decoded(last())));
        assertEquals(id,last().getString("warning_id"));assertEquals(0,announcements());
    }
    @Test public void nativeRangeCorrelationRestoresOriginalDescriptorWhenTheSegmentDisappears(){
        Descriptor d=new Descriptor("42","CAMERA",0);repository(d);
        Segment s=new Segment("AVERAGE_SPEED_CAMERA","7-11");s.links=Collections.singletonList(new Link(42,"uuid-42","CAMERA"));
        NativeWarnings.segments(new SegmentUpdate(Collections.singletonList(s)),new long[]{1,7,11,5100000,52100000,5200000,52200000,3});
        assertTrue(last().getBoolean("native_segment_correlated"));assertEquals(Double.valueOf(52.1),decoded(last()).latitude);
        assertEquals("start",nl.johninnl.navigation.alerts.WarningGeometry.zonePoint(decoded(last())));
        NativeWarnings.segments(new SegmentUpdate(Collections.emptyList()),new long[]{2});
        assertFalse(last().getBoolean("native_segment_correlated"));assertFalse(last().containsKey("zone_point"));
        assertEquals(Double.valueOf(52),decoded(last()).latitude);assertEquals("point_ahead",last().getString("relevance"));
        assertEquals("native_repository",last().getString("position_clock_origin"));assertEquals(0,announcements());
    }
    @Test public void nativeTilePointsAreSilentAndClearOnRemoval(){
        NativeWarnings.tilePoints(new long[]{7,11,72,5000000,52000000});
        Bundle point=last();assertEquals("UPSERT",point.getString("operation"));
        assertEquals("display_only",point.getString("category"));assertEquals("DUMMY",point.getString("native_subtype"));
        assertEquals("native_tile",point.getString("position_clock_origin"));
        assertTrue(point.getBoolean("native_point_target"));assertFalse(point.getBoolean("position_estimated"));
        assertEquals(Double.valueOf(52),decoded(point).latitude);assertEquals(0,announcements());
        nl.johninnl.navigation.alerts.WarningView view=new nl.johninnl.navigation.alerts.WarningView();
        view.events(Collections.singletonList(decoded(point)));
        assertTrue(view.carEvents(SystemClock.elapsedRealtime(),e->true).isEmpty());
        assertEquals(1,view.mapFeatures(SystemClock.elapsedRealtime(),e->true).size());
        assertTrue(view.mapFeatures(SystemClock.elapsedRealtime(),e->false).isEmpty());
        NativeWarnings.tilePoints(new long[0]);
        assertEquals("CLEAR",last().getString("operation"));assertEquals(point.getString("warning_id"),last().getString("warning_id"));
        assertEquals(0,announcements());
    }
    @Test public void nativeTileReloadRetainsIdentityAndAdvancesRevision(){
        long[] point={7,-1,69,5000000,52000000};NativeWarnings.tilePoints(point);
        String id=last().getString("warning_id");long revision=last().getLong("revision");
        NativeWarnings.tilePoints(new long[0]);NativeWarnings.tilePoints(point);
        assertEquals(id,last().getString("warning_id"));assertTrue(last().getLong("revision")>revision);
        assertEquals(0,announcements());
    }
    private WarningEvent decoded(Bundle source){
        return decoded(source,1);
    }
    private WarningEvent decoded(Bundle source,long sequence){
        Bundle b=new Bundle(source);long now=SystemClock.elapsedRealtime();
        b.putInt("protocol_version",1);b.putString("provider_session","00000000-0000-0000-0000-000000000001");
        b.putLong("sequence",sequence);b.putLong("issued_elapsed_ms",now);
        if("ANNOUNCE".equals(b.getString("operation")))b.putLong("announce_until_elapsed_ms",now+5000);
        return WarningCodec.decode(b,now);
    }

    @Test public void repositoryIsStateAndNativeSoundRetainsSubtypeAndPresence(){
        Descriptor d=new Descriptor("1","CAMERA",8);d.info.validation.distance=0;d.info.validation.time=0;
        repository(d);assertEquals("UPSERT",last().getString("operation"));assertEquals(0,announcements());
        assertEquals(Integer.valueOf(0),decoded(last()).distanceMeters);assertEquals(0,last().getInt("native_time_to_alert_s"));
        assertFalse(last().containsKey("source_priority"));assertEquals(1,last().getInt("priority"));
        NativeWarnings.sound(d.id);WarningEvent event=decoded(last());
        assertEquals(WarningEvent.Operation.ANNOUNCE,event.operation);assertEquals("CAMERA_TYPE_ROAD_SAFETY_PHONE",event.nativeSubtype);
        assertEquals("native_sound_intent",last().getString("announcement_origin"));assertEquals("und",event.languageTag);
        assertEquals(Double.valueOf(52.0),event.latitude);assertEquals(Integer.valueOf(500),event.triggerMeters);
        assertEquals(1,event.announcementIndex);
        d.info.validation=null;repository(d);
        assertFalse(last().containsKey("distance_m"));assertFalse(last().getBoolean("native_valid"));
        long count=announcements();NativeWarnings.sound(d.id);assertEquals(count,announcements());
    }

    @Test public void nativeSubtypesKeepTheirOwnNamespace(){
        assertEquals("HAZARD_TYPE_EMERGENCY_VEHICLE",WazeWarningModels.subtype("HAZARD",28));
        assertEquals("UNKNOWN_13",WazeWarningModels.subtype("HAZARD",13));
        assertEquals("BAD_WEATHER_TYPE_FLOOD",WazeWarningModels.subtype("BAD_WEATHER",13));
        assertEquals("BLOCKED_LANE_TYPE_LEFT",WazeWarningModels.subtype("BLOCKED_LANE",1));
        assertEquals("UNKNOWN_4",WazeWarningModels.subtype("BLOCKED_LANE",4));
        Descriptor a=new Descriptor("speed","CAMERA",0),b=new Descriptor("red","CAMERA",1);
        repository(a,b);NativeWarnings.sound(a.id);NativeWarnings.sound(b.id);
        assertEquals(2,announcements());assertEquals("CAMERA_TYPE_SPEED",events.get(2).getString("native_subtype"));
        assertEquals("CAMERA_TYPE_REDLIGHT",last().getString("native_subtype"));
    }

    @Test public void artifactRoadsideSafetyAndCrashHistoryAreWarningsRatherThanPersonalContent(){
        for(String type:new String[]{"SOS","PERSONAL_SAFETY","GUARDIAN"}){
            Descriptor d=new Descriptor(type,type,type.equals("SOS")?4:1);repository(d);NativeWarnings.sound(d.id);
            assertEquals(type,decoded(last()).nativeType);assertEquals("ANNOUNCE",last().getString("operation"));
            assertFalse(last().containsKey("capture_exclusion"));assertFalse(last().getString("message").isEmpty());
        }
        assertEquals(3,announcements());
        Descriptor other=new Descriptor("unknown","DYNAMIC",999);repository(other);NativeWarnings.sound(other.id);
        assertEquals("other_native",last().getString("category"));assertEquals("UNKNOWN_999",last().getString("native_subtype"));assertEquals(2,last().getInt("priority"));
        Descriptor social=new Descriptor("social","CHITCHAT",0);repository(social);NativeWarnings.sound(social.id);
        assertEquals("display_only",last().getString("category"));assertEquals("",last().getString("message"));assertEquals(4,announcements());
    }

    @Test public void nativeCardPreemptionDoesNotAutomaticallyPromoteWeatherToUrgentSpeech(){
        Descriptor d=new Descriptor("weather","BAD_WEATHER",11);d.preemptive=true;repository(d);NativeWarnings.sound(d.id);
        assertTrue(last().getBoolean("source_preemptive"));assertEquals(17,last().getInt("source_priority"));assertEquals(1,last().getInt("priority"));
        assertEquals("waze_semantic_family_v1",last().getString("priority_origin"));
    }
    @Test public void familyStatusDoesNotInferAvailabilityOrRefreshObservationClocksFromAnEmptyFeed(){
        Bundle initial=NativeWarnings.familyStatus();assertEquals(6,initial.size());
        assertEquals("unobserved",initial.getBundle("alerters").getString("native_available"));assertFalse(initial.getBundle("alerters").containsKey("observed_elapsed_ms"));
        repository();Bundle empty=NativeWarnings.familyStatus().getBundle("alerters");assertEquals("no_current_state",empty.getString("native_available"));
        long observed=empty.getLong("observed_elapsed_ms");shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(5));
        assertEquals(observed,NativeWarnings.familyStatus().getBundle("alerters").getLong("observed_elapsed_ms"));
        assertEquals("unobserved",empty.getString("source_enabled"));assertEquals("unobserved",empty.getString("host_filtered"));
        assertEquals("binding_unproven",empty.getString("controller_state"));assertFalse(empty.getBoolean("supported_capture"));
    }

    @Test public void familyStatusSeparatesNativeStateDecisionsAndVisualOnlyContent(){
        Descriptor d=new Descriptor("family","CAMERA",0);repository(d);Bundle before=NativeWarnings.familyStatus().getBundle("alerters");
        assertEquals("state_present",before.getString("native_available"));assertEquals(1,before.getInt("current_state_count"));assertFalse(before.containsKey("decision_elapsed_ms"));
        NativeWarnings.sound(d.id);Bundle after=NativeWarnings.familyStatus().getBundle("alerters");assertTrue(after.containsKey("decision_elapsed_ms"));
        assertEquals("receiver_choices_v1",last().getString("managed_output_policy"));assertEquals("receiver_owned",last().getString("local_sound_policy"));
        NativeWarnings.notificationAdded(new Notification("FEATURE_CYCLISTS"));Bundle notifications=NativeWarnings.familyStatus().getBundle("notifications");
        assertEquals("visual_only",notifications.getString("output_policy"));assertEquals("none",notifications.getString("audio_control"));assertFalse(notifications.containsKey("decision_elapsed_ms"));
        after.putString("source_enabled","modified");assertEquals("unobserved",NativeWarnings.familyStatus().getBundle("alerters").getString("source_enabled"));
        assertTrue(nl.johninnl.navigation.alerts.WarningCodec.encodedSize(NativeWarnings.familyStatus())<8192);
        NativeWarnings.stopped();Bundle cleared=NativeWarnings.familyStatus();assertFalse(cleared.getBundle("alerters").containsKey("observed_elapsed_ms"));assertEquals(0,cleared.getBundle("alerters").getInt("current_state_count"));
    }
    @Test public void unsupportedNativeTextAfterStateExpiryCannotPoisonLaterCallbacksOrStatus(){
        Descriptor unsupported=new Descriptor("no-text","DYNAMIC",999);unsupported.info.title="";unsupported.info.description="";repository(unsupported);
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(31));NativeWarnings.sound(unsupported.id);
        assertEquals(0,announcements());assertEquals(0,NativeWarnings.familyStatus().getBundle("alerters").getInt("current_state_count"));
        Descriptor valid=new Descriptor("next-camera","CAMERA",0);repository(valid);NativeWarnings.sound(valid.id);
        assertEquals(1,announcements());assertEquals("CAMERA",decoded(last()).nativeType);assertEquals("ANNOUNCE",last().getString("operation"));
    }
    @Test public void aNativeZoneStateDoesNotTurnCrashHistoryIntoAverageSpeedEnforcement(){
        Descriptor d=new Descriptor("crash-history","GUARDIAN",1);d.zone=new Zone("InZone");repository(d);Controller c=new Controller(d.id,State.InZone);NativeWarnings.zoneSelected(c);
        assertEquals("road_feature",last().getString("category"));assertEquals("enter",last().getString("phase"));
        d.zone=new Zone("LeftZone");c.b=State.LeftZone;repository(d);NativeWarnings.zoneSelected(c);
        assertEquals("End of crash-history zone.",decoded(last()).message);assertEquals("road_feature",last().getString("category"));
        d=new Descriptor("camera-zone","CAMERA",0);d.zone=new Zone("InZone");repository(d);NativeWarnings.zoneSelected(new Controller(d.id,State.InZone));
        assertEquals("enforcement_zone",last().getString("category"));
    }

    @Test public void nativeSilenceAndInvalidityCancelPreviousAuthority(){
        Descriptor d=new Descriptor("2","HAZARD",3);repository(d);NativeWarnings.sound(d.id);
        assertEquals(1,announcements());d.info.silent="Familiar";repository(d);
        assertEquals("CLEAR",events.get(2).getString("operation"));
        assertEquals("A silently shown valid alert stays visible state","road_danger",last().getString("category"));
        assertTrue(last().getBoolean("native_visual_only"));assertEquals("UPSERT",last().getString("operation"));
        assertEquals("Familiar",last().getString("native_silent_activation"));NativeWarnings.sound(d.id);assertEquals(1,announcements());
        d.info.silent=null;d.info.validation.valid=false;repository(d);NativeWarnings.sound(d.id);assertEquals(1,announcements());
        d.info.validation.valid=true;repository(d);assertEquals(1,announcements());
        NativeWarnings.sound(d.id);assertEquals(2,announcements());assertEquals(2,last().getLong("announcement_index"));
    }

    @Test public void displayOnlyRefreshesRemainWithinTheJournalBound(){
        Descriptor[] values=new Descriptor[7];
        for(int i=0;i<values.length;i++){values[i]=new Descriptor("display-"+i,"POLICE",0);values[i].info.validation.valid=false;}
        for(int refresh=0;refresh<40;refresh++)repository(values);
        WarningJournal journal=new WarningJournal("00000000-0000-0000-0000-000000000001");long sequence=0;
        for(Bundle value:events)assertEquals("Repeated display-only refreshes must not exhaust retained clear records",
                WarningJournal.Append.ACCEPTED,journal.append(decoded(value,++sequence),SystemClock.elapsedRealtime()));
        WarningJournal.Resume view=journal.resume("00000000-0000-0000-0000-000000000001",0,SystemClock.elapsedRealtime());
        assertFalse(view.overflow);assertEquals(7,view.currentState.size());assertEquals(sequence,view.headSequence);
        assertTrue("Coalesced history still requires an explicit snapshot",view.resyncRequired);
        assertTrue(view.announcements.isEmpty());assertEquals(0,announcements());
        assertTrue(events.stream().allMatch(value->"UPSERT".equals(value.getString("operation"))));
    }

    @Test public void displayOnlyDemotionClearsAuthorityOnlyOnTransition(){
        Descriptor value=new Descriptor("demotion","POLICE",0);repository(value);NativeWarnings.sound(value.id);
        String id=last().getString("warning_id");long first=last().getLong("announcement_index");
        value.info.silent="Familiar";repository(value);repository(value);
        value.info.silent=null;value.info.validation.valid=false;repository(value);
        assertEquals("An already display-only update has no new authority to clear",1,
                events.stream().filter(event->"CLEAR".equals(event.getString("operation"))).count());
        value.info.validation.valid=true;repository(value);assertEquals(1,announcements());
        WarningJournal journal=new WarningJournal("00000000-0000-0000-0000-000000000001");long sequence=0;
        for(Bundle event:events)assertEquals(WarningJournal.Append.ACCEPTED,journal.append(decoded(event,++sequence),SystemClock.elapsedRealtime()));
        assertNull("A later valid snapshot must not resurrect the cleared native sound",
                journal.announcement(id,WarningEvent.Phase.NOTICE,first,SystemClock.elapsedRealtime()));
        NativeWarnings.sound(value.id);assertEquals(2,announcements());assertTrue(last().getLong("announcement_index")>first);
        assertEquals(WarningJournal.Append.ACCEPTED,journal.append(decoded(last(),++sequence),SystemClock.elapsedRealtime()));
        assertNotNull(journal.announcement(id,WarningEvent.Phase.NOTICE,last().getLong("announcement_index"),SystemClock.elapsedRealtime()));
    }

    @Test public void nativeRepeatsAfterDisplayExpiryUseANewerGlobalIndex(){
        Descriptor d=new Descriptor("3","POLICE",2);repository(d);NativeWarnings.sound(d.id);
        long first=last().getLong("announcement_index");
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(31));
        NativeWarnings.sound(d.id);assertEquals(2,announcements());assertTrue(last().getLong("announcement_index")>first);
        assertEquals(WarningEvent.Operation.ANNOUNCE,decoded(last()).operation);
        repository();assertEquals("CLEAR",last().getString("operation"));
        NativeWarnings.sound(d.id);assertEquals(2,announcements());
    }

    @Test public void sameIdNewTextRevisesButGeometryRefreshDoesNotReannounce(){
        Descriptor d=new Descriptor("4","HAZARD",23);repository(d);NativeWarnings.sound(d.id);
        long revision=last().getLong("revision");d.info.validation.distance=80;repository(d);
        assertEquals(revision,last().getLong("revision"));assertEquals(1,announcements());
        d.info.description="New native detail";repository(d);
        assertTrue(last().getLong("revision")>revision);assertEquals(1,announcements());
        NativeWarnings.sound(d.id);assertEquals(2,announcements());assertTrue(decoded(last()).message.contains("New native detail"));
    }

    @Test public void distinctNativePhaseControllersRetainOneEntryAndOneExitWithoutUiPresentation(){
        Descriptor d=new Descriptor("headless-zone","DANGER_ZONE",0);d.zone=new Zone("InZone");repository(d);
        Controller enter=new Controller(d.id,State.InZone);NativeWarnings.zoneSelected(enter);NativeWarnings.zoneSelected(enter);
        assertEquals(1,announcements());assertEquals("enter",last().getString("phase"));
        d.zone=new Zone("LeftZone");repository(d);Controller exit=new Controller(d.id,State.LeftZone);
        NativeWarnings.zoneSelected(exit);NativeWarnings.zoneExit(exit);assertEquals(2,announcements());assertEquals("exit",last().getString("phase"));
    }

    @Test public void nativeExitRetiresOnlyItsTrackedUiQueueIdentity()throws Exception{
        List<Object> removed=retirements();Descriptor d=new Descriptor("retire-zone","DANGER_ZONE",0);d.zone=new Zone("InZone");repository(d);
        NativeWarnings.zoneSelected(new Controller(d.id,State.InZone));shadowOf(Looper.getMainLooper()).idle();assertTrue(removed.isEmpty());
        d.zone=new Zone("LeftZone");repository(d);NativeWarnings.zoneSelected(new Controller(d.id,State.LeftZone));
        shadowOf(Looper.getMainLooper()).idle();assertEquals(Collections.singletonList(d.id),removed);assertEquals(2,announcements());
    }
    @Test public void removedNativeZoneIsRetiredButAnOrdinaryClearIsNot()throws Exception{
        List<Object> removed=retirements();Descriptor d=new Descriptor("gone-zone","DANGER_ZONE",0);d.zone=new Zone("InZone");repository(d);
        NativeWarnings.zoneSelected(new Controller(d.id,State.InZone));repository();shadowOf(Looper.getMainLooper()).idle();assertEquals(Collections.singletonList(d.id),removed);
        removed.clear();repository(new Descriptor("ordinary-clear","POLICE",0));repository();shadowOf(Looper.getMainLooper()).idle();assertTrue(removed.isEmpty());
    }
    @Test public void foregroundAndCarUiDeferExpiryCleanupUntilTheirLifecycleEnds()throws Exception{
        List<Object> removed=retirements();Descriptor d=new Descriptor("foreground-zone","DANGER_ZONE",0);d.zone=new Zone("InZone");repository(d);
        NativeWarnings.zoneSelected(new Controller(d.id,State.InZone));android.app.Activity activity=org.robolectric.Robolectric.buildActivity(android.app.Activity.class).setup().get();sourceActivity(activity);
        d.zone=new Zone("LeftZone");repository(d);Controller exit=new Controller(d.id,State.LeftZone);NativeWarnings.zoneSelected(exit);
        shadowOf(Looper.getMainLooper()).idle();assertTrue(removed.isEmpty());Object car=new Object();NativeWarnings.carUiStarted(car);sourceActivity(null);NativeWarnings.zoneSelected(exit);
        shadowOf(Looper.getMainLooper()).idle();assertTrue(removed.isEmpty());NativeWarnings.carUiStopped(car);shadowOf(Looper.getMainLooper()).idle();assertEquals(Collections.singletonList(d.id),removed);assertEquals(2,announcements());
    }
    @Test public void deferredOldExitCannotRemoveAReactivatedCurrentZone()throws Exception{
        List<Object> removed=retirements();Descriptor d=new Descriptor("reactivated-zone","DANGER_ZONE",0);d.zone=new Zone("InZone");repository(d);
        NativeWarnings.zoneSelected(new Controller(d.id,State.InZone));d.zone=new Zone("LeftZone");repository(d);NativeWarnings.zoneSelected(new Controller(d.id,State.LeftZone));
        d.zone=new Zone("InZone");repository(d);shadowOf(Looper.getMainLooper()).idle();assertTrue(removed.isEmpty());
    }

    @Test public void stillPresentInvalidOrSilentZoneDoesNotAuthorizeQueueRetirement()throws Exception{
        List<Object> removed=retirements();Descriptor d=new Descriptor("still-present","DANGER_ZONE",0);d.zone=new Zone("InZone");repository(d);NativeWarnings.zoneSelected(new Controller(d.id,State.InZone));
        d.info.validation.valid=false;repository(d);shadowOf(Looper.getMainLooper()).idle();assertTrue(removed.isEmpty());
        d.info.validation.valid=true;d.info.silent="Familiar";repository(d);shadowOf(Looper.getMainLooper()).idle();assertTrue(removed.isEmpty());
    }
    @Test public void uuidlessNativeSoundCorrelatesOnlyAnUnambiguousCurrentIdentity(){
        Descriptor d=new Descriptor("uuid-sound","CAMERA",0);repository(d);NativeWarnings.sound(new Id("uuid-sound",""));
        assertEquals(1,announcements());assertEquals(WazeWarningModels.identity(d.id),last().getString("warning_id"));
        Descriptor other=new Descriptor("uuid-sound","CAMERA",0);other.id.uuid="different-uuid";repository(d,other);long before=announcements();NativeWarnings.sound(new Id("uuid-sound",""));assertEquals(before,announcements());
    }
    @Test public void uuidlessDirectMatchCannotBypassMixedUuidAmbiguity(){
        Descriptor empty=new Descriptor("mixed-uuid","POLICE",0),full=new Descriptor("mixed-uuid","POLICE",0);empty.id.uuid="";repository(empty,full);
        NativeWarnings.sound(empty.id);assertEquals(0,announcements());
    }
    @Test public void aDifferentExplicitUuidCannotBorrowAnotherWarningIdentity(){
        Descriptor d=new Descriptor("uuid-mismatch","POLICE",0);repository(d);NativeWarnings.sound(new Id("uuid-mismatch","wrong-uuid"));assertEquals(0,announcements());
    }
    @Test public void uuidlessUiZoneSoundRemainsTheSameNativePhaseDecision(){
        Descriptor d=new Descriptor("uuid-zone","DANGER_ZONE",0);d.zone=new Zone("InZone");repository(d);Controller controller=new Controller(d.id,State.InZone);
        NativeWarnings.zoneSelected(controller);NativeWarnings.zonePresented(controller);NativeWarnings.sound(new Id("uuid-zone",""));assertEquals(1,announcements());
    }

    @Test public void snapshotSampledBeforeNativeStopCannotRepublishAfterRestart() {
        long[] points={1,2,72,5000000,52000000};
        long old=NativeWarnings.tileEpoch();NativeWarnings.tilePoints(points,old);
        NativeWarnings.engineStopped();int cleared=events.size();
        assertEquals("CLEAR",last().getString("operation"));
        NativeWarnings.tilePoints(points,old);assertEquals(cleared,events.size());
        NativeWarnings.tilePoints(points,NativeWarnings.tileEpoch());
        assertEquals("UPSERT",last().getString("operation"));assertEquals(cleared+1,events.size());
        assertEquals(0,announcements());
    }

    @Test public void stopRetainsDisplayOnlyTileClassificationOnClear() {
        NativeWarnings.tilePoints(new long[]{1,2,72,5000000,52000000});
        assertEquals("UPSERT",last().getString("operation"));
        NativeWarnings.stopped();
        Bundle clear=last();assertEquals("CLEAR",clear.getString("operation"));
        assertEquals("display_only",clear.getString("category"));
        assertEquals("waze.insights.native_tile",clear.getString("native_namespace"));
        assertTrue(nl.johninnl.navigation.alerts.WarningGeometry.nativeMapFeature(decoded(clear)));
        assertFalse(clear.containsKey("latitude"));assertFalse(clear.containsKey("position_estimated"));
        assertEquals(0,announcements());
    }

    @Test public void freshNativeRepeatDoesNotFreshenCachedMeasurementClocks(){
        Descriptor d=new Descriptor("measurement-age","CAMERA",0);repository(d);long observed=last().getLong("distance_observed_elapsed_ms");
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(31));NativeWarnings.sound(d.id);Bundle announcement=last();
        assertEquals("ANNOUNCE",announcement.getString("operation"));assertTrue(announcement.getLong("observed_elapsed_ms")>observed);
        assertEquals(observed,announcement.getLong("distance_observed_elapsed_ms"));assertEquals(observed,announcement.getLong("trigger_observed_elapsed_ms"));assertEquals(observed,announcement.getLong("position_observed_elapsed_ms"));assertEquals(observed,announcement.getLong("native_validation_observed_elapsed_ms"));
        assertEquals(Long.valueOf(observed),decoded(announcement).distanceObservedAt);assertEquals(1,announcements());
        repository(d);assertTrue(last().getLong("distance_observed_elapsed_ms")>observed);
    }
    @Test public void nativeZoneDecisionKeepsRepositoryMeasurementAge(){
        Descriptor d=new Descriptor("zone-measurement-age","DANGER_ZONE",0);d.zone=new Zone("InZone");repository(d);long observed=last().getLong("position_observed_elapsed_ms");
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(31));NativeWarnings.zoneSelected(new Controller(d.id,State.InZone));
        assertEquals("ANNOUNCE",last().getString("operation"));assertEquals(observed,last().getLong("position_observed_elapsed_ms"));assertEquals(observed,last().getLong("distance_observed_elapsed_ms"));assertTrue(decoded(last()).observedAt>observed);
    }

    @Test public void selectorAndRealUiZoneSoundAreOneDecisionInEitherOrder(){
        Descriptor d=new Descriptor("zone","DANGER_ZONE",0);d.zone=new Zone("InZone");repository(d);
        Controller c=new Controller(d.id,State.InZone);
        NativeWarnings.zoneSelected(c);NativeWarnings.zonePresented(c);NativeWarnings.sound(d.id);
        assertEquals(1,announcements());assertEquals("enter",last().getString("phase"));
        d.zone=new Zone("LeftZone");c.b=State.LeftZone;repository(d);
        NativeWarnings.zoneExit(c);NativeWarnings.zoneSelected(c);assertEquals(2,announcements());
        assertEquals("exit",last().getString("phase"));assertEquals(2,last().getInt("priority"));assertEquals("template",last().getString("message_origin"));
        assertEquals("End of danger zone.",decoded(last()).message);
        NativeWarnings.stopped();repository(d=new Descriptor("zone2","DANGER_ZONE",0));
        d.zone=new Zone("InZone");repository(d);c=new Controller(d.id,State.InZone);
        NativeWarnings.zonePresented(c);NativeWarnings.sound(d.id);NativeWarnings.zoneSelected(c);
        assertEquals(3,announcements());assertEquals("enter",last().getString("phase"));
    }

    private static java.util.Map<String,Bundle> zoneSegment(String key,String phase,int left){
        Bundle b=new Bundle();b.putString("native_type","AVERAGE_SPEED_CAMERA");b.putString("native_segment_phase",phase);
        b.putString("native_segment_key",key);b.putString("warning_id","waze/segment/"+key);b.putInt("distance_m",left);
        java.util.Map<String,Bundle> map=new java.util.LinkedHashMap<>();map.put("waze/segment/"+key,b);return map;
    }
    @Test public void consecutiveAverageSpeedSegmentsStayOneWarning(){
        assertEquals("waze/segment/a",NativeWarnings.chainZoneSegments(zoneSegment("a","WITHIN",900),1000).keySet().iterator().next());
        NativeWarnings.chainZoneSegments(zoneSegment("a","WITHIN",80),20_000);
        java.util.Map<String,Bundle> next=NativeWarnings.chainZoneSegments(zoneSegment("b","WITHIN",1500),21_000);
        assertEquals("waze/segment/a",next.keySet().iterator().next());
        assertEquals("waze/segment/b",next.values().iterator().next().getString("native_zone_chain_segment_id"));
        assertEquals("waze/segment/a",NativeWarnings.chainZoneSegments(zoneSegment("b","WITHIN",1400),22_000).keySet().iterator().next());
        NativeWarnings.chainZoneSegments(zoneSegment("b","WITHIN",100),40_000);
        // A control met 20 s later is a different control.
        assertEquals("waze/segment/c",NativeWarnings.chainZoneSegments(zoneSegment("c","WITHIN",800),60_000).keySet().iterator().next());
        // Approaching segments are never chained.
        // A direct hand-over (within 2 s) continues even when the last known distance was not near the end.
        assertEquals("waze/segment/c",NativeWarnings.chainZoneSegments(zoneSegment("d","WITHIN",800),61_000).keySet().iterator().next());
        // A segment 5 s later that measures a longer stretch than was left is a different control.
        assertEquals("waze/segment/f",NativeWarnings.chainZoneSegments(zoneSegment("f","WITHIN",2000),66_000).keySet().iterator().next());
        // One measured to the same end (remaining did not jump up) is the same control.
        assertEquals("waze/segment/f",NativeWarnings.chainZoneSegments(zoneSegment("g","WITHIN",1900),69_000).keySet().iterator().next());
        assertEquals("waze/segment/e",NativeWarnings.chainZoneSegments(zoneSegment("e","APPROACHING",300),62_000).keySet().iterator().next());
    }
    @Test public void segmentCorrelationAddsStateWithoutDuplicatingTheNativeWarning(){
        Descriptor d=new Descriptor("42","PERMANENT_HAZARD",0);repository(d);
        Segment segment=new Segment("SPEED_BUMP");segment.links=Collections.singletonList(new Link(42,"uuid-42","PERMANENT_HAZARD"));
        NativeWarnings.segments(new SegmentUpdate(Collections.singletonList(segment)));
        assertEquals(events.get(0).getString("warning_id"),last().getString("warning_id"));
        assertTrue(last().getBoolean("native_segment_correlated"));assertEquals("PERMANENT_HAZARD",last().getString("native_type"));
        assertEquals(0,announcements());
        NativeWarnings.sound(d.id);assertEquals(1,announcements());
        Segment other=new Segment("SCHOOL_ZONE");NativeWarnings.segments(new SegmentUpdate(Collections.singletonList(other)));
        assertTrue(last().getString("warning_id").startsWith("waze/segment/"));assertEquals("UPSERT",last().getString("operation"));decoded(last());
        NativeWarnings.segments(new SegmentUpdate(Collections.emptyList()));assertEquals("CLEAR",last().getString("operation"));
    }
    @Test public void descriptorAndSoundRefreshesRetainSegmentFactsWithoutRenewingTheirClock(){
        Descriptor d=new Descriptor("42","CAMERA",0);repository(d);Segment s=new Segment("AVERAGE_SPEED_CAMERA");s.links=Collections.singletonList(new Link(42,"uuid-42","CAMERA"));NativeWarnings.segments(new SegmentUpdate(Collections.singletonList(s)));
        long segmentAt=last().getLong("native_segment_observed_ms");String key=last().getString("native_segment_key");assertTrue(last().getBoolean("native_segment_correlated"));
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));d.info.validation.distance=80;repository(d);
        assertEquals("AVERAGE_SPEED_CAMERA",last().getString("native_segment_type"));assertEquals(key,last().getString("native_segment_key"));assertEquals(segmentAt,last().getLong("native_segment_observed_ms"));assertEquals(50,last().getInt("native_segment_distance_m"));assertEquals(0,announcements());
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));NativeWarnings.sound(d.id);
        assertEquals(1,announcements());assertTrue(last().getBoolean("native_segment_correlated"));assertEquals(segmentAt,last().getLong("native_segment_observed_ms"));
        NativeWarnings.segments(new SegmentUpdate(Collections.emptyList()));assertFalse(last().containsKey("native_segment_correlated"));repository(d);assertFalse(last().containsKey("native_segment_type"));
    }
    @Test public void invalidSegmentSnapshotCannotPartiallyEnrichStateOrClaimAnObservedFamily(){
        Descriptor d=new Descriptor("42","PERMANENT_HAZARD",0);repository(d);int count=events.size();
        Segment s=new Segment("SPEED_BUMP");s.links=Collections.singletonList(new Link(42,"uuid-42","PERMANENT_HAZARD"));
        NativeWarnings.segments(new SegmentUpdate(Arrays.asList(s,s)));assertEquals(count,events.size());
        assertFalse(NativeWarnings.familyStatus().getBundle("segments").containsKey("observed_elapsed_ms"));
        NativeWarnings.segments(new SegmentUpdate(Collections.singletonList(s)));
        assertTrue(last().getBoolean("native_segment_correlated"));assertEquals(1,NativeWarnings.familyStatus().getBundle("segments").getInt("current_state_count"));assertEquals(0,announcements());
    }
    @Test public void removingALinkedSegmentRetiresOnlyItsMetadataWithoutRearmingTheAlerter(){
        Descriptor d=new Descriptor("42","PERMANENT_HAZARD",0);repository(d);NativeWarnings.sound(d.id);long index=last().getLong("announcement_index"),observed=last().getLong("observed_elapsed_ms");String id=last().getString("warning_id");
        Segment s=new Segment("SPEED_BUMP");s.links=Collections.singletonList(new Link(42,"uuid-42","PERMANENT_HAZARD"));NativeWarnings.segments(new SegmentUpdate(Collections.singletonList(s)));assertTrue(last().getBoolean("native_segment_correlated"));
        NativeWarnings.segments(new SegmentUpdate(Collections.emptyList()));assertEquals(id,last().getString("warning_id"));assertEquals("UPSERT",last().getString("operation"));assertFalse(last().containsKey("native_segment_correlated"));assertFalse(last().containsKey("native_segment_distance_m"));
        assertEquals(index,last().getLong("announcement_index"));assertEquals(observed,last().getLong("observed_elapsed_ms"));assertEquals(1,announcements());assertEquals(0,NativeWarnings.familyStatus().getBundle("segments").getInt("current_state_count"));assertEquals(1,NativeWarnings.familyStatus().getBundle("alerters").getInt("current_state_count"));
    }

    @Test public void notificationAddIsVisualAndUnknownFeaturesDoNotExportPrivateText(){
        Notification n=new Notification("FEATURE_CYCLISTS");NativeWarnings.notificationAdded(n);
        assertEquals(0,announcements());assertEquals("UPSERT",last().getString("operation"));
        assertEquals("Bikes ahead",last().getString("native_car_title"));assertTrue(last().getBoolean("native_car_available"));
        assertTrue(last().containsKey("native_timeout_ms"));assertEquals(0,last().getLong("native_timeout_ms"));decoded(last());
        NativeWarnings.notificationRemoved(n.id);assertEquals("CLEAR",last().getString("operation"));decoded(last());
        n=new Notification("UnknownFeature");NativeWarnings.notificationAdded(n);
        assertEquals("",last().getString("message"));assertFalse(last().getBoolean("native_car_available"));
        assertFalse(last().containsKey("native_car_title_0"));assertEquals("UNKNOWN_NATIVE_NOTIFICATION",last().getString("capture_diagnostic"));
    }

    @Test public void osmCoLocatedKindsKeepDistinctIdentitiesAndSnapshotClearsThem(){
        long now=SystemClock.elapsedRealtime();
        assertTrue(NativeWarnings.osm("speedCameras",7,0,"Speed camera",52,4,40,500,now,true));String speed=last().getString("warning_id");
        assertTrue(NativeWarnings.osm("speedCameras",7,1,"Red-light camera",52,4,40,500,now,true));
        assertNotEquals(speed,last().getString("warning_id"));assertEquals(2,announcements());decoded(last());
        assertEquals("unresolved_without_directed_road_equivalence",last().getString("dedup_status"));
        NativeWarnings.osmSnapshot("speedCameras",Collections.emptyList());
        assertEquals(2,events.stream().filter(e->"CLEAR".equals(e.getString("operation"))).count());
    }

    @Test public void repositoryOverflowOrDuplicateIdsCannotPartiallyReplaceCurrentState(){
        Descriptor d=new Descriptor("retained","CAMERA",0);repository(d);int count=events.size();
        repository(new Descriptor("other","CAMERA",0),new Descriptor("other","CAMERA",1));
        assertEquals(count,events.size());NativeWarnings.sound(d.id);assertEquals(1,announcements());
        List<Descriptor> tooMany=new ArrayList<>();for(int i=0;i<129;i++)tooMany.add(new Descriptor("extra"+i,"CAMERA",0));
        NativeWarnings.repository(new Repository(tooMany));assertEquals(1,announcements());
        NativeWarnings.stopped();assertEquals("CLEAR",last().getString("operation"));assertEquals("waiting_for_engine",NativeWarnings.controllerState());
    }

    public static final class Id {
        final String unique;String uuid;Id(String id){this(id,"uuid-"+id);}Id(String id,String uuid){unique=id;this.uuid=uuid;}public String getProviderId(){return "native";}
        public String getUniqueId(){return unique;}public String getUuid(){return uuid;}
    }
    public static final class Validation {
        boolean valid=true;Integer distance=100,time=10;public boolean getIsValid(){return valid;}
        public boolean hasDistanceMeters(){return distance!=null;}public int getDistanceMeters(){return distance==null?0:distance;}
        public boolean hasTimeToAlertSec(){return time!=null;}public int getTimeToAlertSec(){return time==null?0:time;}
    }
    public static final class Position {public int getLatitude(){return 52000000;}public int getLongitude(){return 4000000;}}
    public static final class Info {
        String type,title="Native warning",description="Native detail",silent;int subtype;Validation validation=new Validation();
        Info(String type,int subtype){this.type=type;this.subtype=subtype;}
        public String getType(){return type;}public int getTypeValue(){return 1;}public String getTitle(){return title;}
        public String getDescription(){return description;}public boolean hasSubType(){return true;}public int getSubType(){return subtype;}
        public boolean hasSubtypeTrait(){return false;}public long getSubtypeTrait(){return 0;}
        public boolean hasValidationResult(){return validation!=null;}public Validation getValidationResult(){return validation;}
        public boolean hasSilentActivation(){return silent!=null;}public String getSilentActivation(){return silent;}
        public boolean getRequireDistanceInRange(){return true;}public boolean getIsApproachingWithValidation(){return true;}
        public boolean getCloseDistanceSameAlertsCappingEnabled(){return true;}public boolean hasPosition(){return true;}
        public Position getPosition(){return new Position();}
    }
    public static final class Descriptor {
        final Id id;final Info info;Zone zone;boolean preemptive;Descriptor(String id,String type,int subtype){this.id=new Id(id);info=new Info(type,subtype);}
        public boolean hasAlertId(){return true;}public Id getAlertId(){return id;}public boolean hasInfo(){return true;}public Info getInfo(){return info;}
        public boolean getAbortImmediatelyOnRemoval(){return true;}public int getTriggerDistanceMeters(){return 500;}
        public boolean hasInsightPriority(){return preemptive;}public Priority getInsightPriority(){return new Priority();}public boolean hasZoneAlertData(){return zone!=null;}public Zone getZoneAlertData(){return zone;}
    }
    public static final class Priority {public int getValue(){return 17;}public boolean getPreemptive(){return true;}}
    public static final class Repository {final List<Descriptor> descriptors;Repository(List<Descriptor> values){descriptors=values;}public List<Descriptor> getDescriptorsList(){return descriptors;}}
    public static final class Zone {final String state;Zone(String state){this.state=state;}public String getState(){return state;}public int getZonePercent(){return 0;}}
    public enum State {BeforeZone,InZone,LeftZone}
    public static final class Controller {private State b;final Id id;Controller(Id id,State state){this.id=id;b=state;}public Id a(){return id;}}
    public static final class Link {
        final long id;final String uuid,type;Link(long id,String uuid,String type){this.id=id;this.uuid=uuid;this.type=type;}
        public long getId(){return id;}public String getUuid(){return uuid;}public String getAlerterType(){return type;}
        public int getSubtype(){return 0;}public boolean getFamiliar(){return false;}
    }
    public static final class SegmentId {final String type,id;SegmentId(String type){this(type,"segment");}SegmentId(String type,String id){this.type=type;this.id=id;}public String getSegmentType(){return type;}public int getSegmentTypeValue(){return 0;}public String getSegmentId(){return id;}}
    public static final class Segment {
        final SegmentId id;String phase="APPROACHING";List<Link> links=Collections.emptyList();Segment(String type){id=new SegmentId(type);}Segment(String type,String nativeId){id=new SegmentId(type,nativeId);}
        public SegmentId getId(){return id;}public String getPositionRelativeToSegment(){return phase;}
        public int getRemainingDistanceMeters(){return 50;}public boolean hasRemainingDurationSeconds(){return false;}
        public boolean hasPriority(){return false;}public List<Link> getSourceAlertInfosList(){return links;}
    }
    public static final class SegmentUpdate {final List<Segment> info;SegmentUpdate(List<Segment> info){this.info=info;}public List<Segment> getInfoList(){return info;}}
    public static final class NotificationId {final String feature;NotificationId(String feature){this.feature=feature;}public String getFeature(){return feature;}public int getFeatureValue(){return 0;}public String getId(){return "notification";}}
    public static final class Notification {
        final NotificationId id;Notification(String feature){id=new NotificationId(feature);}public boolean hasId(){return true;}public NotificationId getId(){return id;}
        public String getTitle(){return "Cyclists";}public String getBody(){return "Take care";}public boolean hasPriority(){return false;}
        public boolean hasTimeoutMs(){return true;}public long getTimeoutMs(){return 0;}
        public List<String> getInCarTitleVariantsList(){return Arrays.asList("","Bikes ahead");}public List<String> getInCarBodyVariantsList(){return Collections.singletonList("Take care");}
    }
}
