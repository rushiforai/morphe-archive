package nl.johninnl.navigation.alerts;

import static org.junit.Assert.*;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.os.SystemClock;
import java.util.*;
import java.util.concurrent.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowProcess;

@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public class WarningConnectionTest {
    // Provider-text protocol checks; UniformAlertsTest covers the uniform behaviour.
    @org.junit.Before public void uniformOff(){UniformAlerts.enabled=false;}
    @org.junit.After public void uniformOn(){UniformAlerts.enabled=true;}
    WarningEndpoint source;WarningConnection client;
    @After public void close(){if(client!=null)client.close();if(source!=null)source.close();}
    @Test public void retiredSessionCallbacksCannotInvalidateReplacementWithSameStartupTicket() throws Exception {
        ShadowProcess.setUid(20000);Context context=RuntimeEnvironment.getApplication();
        PackageInfo info=new PackageInfo();info.packageName="nl.flitsmeister";info.applicationInfo=new ApplicationInfo();info.applicationInfo.packageName=info.packageName;info.applicationInfo.uid=20000;
        Shadows.shadowOf(context.getPackageManager()).installPackage(info);
        char[] hash=new char[64];Arrays.fill(hash,'a');
        WarningCapabilities caps=new WarningCapabilities(new String(hash),FlitsmeisterWarningTypes.required(),true);
        source=new WarningEndpoint(20000,u->u==20000?"app.consumer":null,caps,
                ()->new WarningEndpoint.Storage("boot-count:7",new PlaybackStore(){public PlaybackGrant load(){return null;}public void save(PlaybackGrant g){}},null),SystemClock::elapsedRealtime,()->20000);
        List<String> outcomes=new CopyOnWriteArrayList<>();
        try(WarningSession session=new WarningSession(context,new WarningConnection.Listener(){
            public void snapshot(WarningConnection.Snapshot value){outcomes.add("snapshot");}
            public void events(List<WarningEvent> values){outcomes.add("events");}
            public void ownerRevoked(long epoch){outcomes.add("revoked");}
            public void disconnected(String reason){outcomes.add("disconnected");}
        });WarningEndpoint replacement=new WarningEndpoint(20000,u->u==20000?"app.consumer":null,caps,
                ()->new WarningEndpoint.Storage("boot-count:7",new PlaybackStore(){public PlaybackGrant load(){return null;}public void save(PlaybackGrant g){}},null),SystemClock::elapsedRealtime,()->20000)) {
            Bundle status=new Bundle();status.putBinder("warning_api",source.binder());status.putIntArray("warning_protocols",new int[]{1});
            assertTrue(session.prepare("nl.flitsmeister",status,7));
            WarningConnection old=session.connection();
            java.lang.reflect.Field field=WarningConnection.class.getDeclaredField("listener");field.setAccessible(true);
            WarningConnection.Listener retired=(WarningConnection.Listener)field.get(old);
            status.putBinder("warning_api",replacement.binder());
            assertTrue(session.prepare("nl.flitsmeister",status,7));
            assertNotSame(old,session.connection());assertEquals("ready",session.state());assertTrue(session.captureComplete());
            assertEquals("Retirement cancels old output once",1,Collections.frequency(outcomes,"disconnected"));
            outcomes.clear();
            retired.disconnected("CLOSED");retired.ownerRevoked(99);retired.events(Collections.emptyList());
            retired.snapshot(new WarningConnection.Snapshot(old.providerSession(),0,false,false,"UNOWNED",Collections.emptyList(),Collections.emptyList(),Collections.emptyList(),Collections.emptyList()));
            assertTrue("Retired callbacks must not reach the replacement's scheduler or view",outcomes.isEmpty());
            assertEquals("ready",session.state());assertTrue(session.captureComplete());
            assertTrue(session.accepts(session.connection().providerSession()));
            session.disconnected(8);
            assertEquals(1,Collections.frequency(outcomes,"disconnected"));
            retired.disconnected("PROVIDER_DIED");
            assertEquals(1,Collections.frequency(outcomes,"disconnected"));assertEquals("off",session.state());
        }
    }
    @Test public void incompatibleStatusRetiresPreviouslyReadyWarningConnection() throws Exception {
        ShadowProcess.setUid(20000);Context context=RuntimeEnvironment.getApplication();
        PackageInfo info=new PackageInfo();info.packageName="nl.flitsmeister";info.applicationInfo=new ApplicationInfo();info.applicationInfo.packageName=info.packageName;info.applicationInfo.uid=20000;
        Shadows.shadowOf(context.getPackageManager()).installPackage(info);
        char[] hash=new char[64];Arrays.fill(hash,'a');
        source=new WarningEndpoint(20000,u->u==20000?"app.consumer":null,new WarningCapabilities(new String(hash),FlitsmeisterWarningTypes.required(),true),
                ()->new WarningEndpoint.Storage("boot-count:7",new PlaybackStore(){public PlaybackGrant load(){return null;}public void save(PlaybackGrant g){}},null),SystemClock::elapsedRealtime,()->20000);
        List<String> outcomes=new CopyOnWriteArrayList<>();
        try(WarningSession session=new WarningSession(context,new WarningConnection.Listener(){
            public void snapshot(WarningConnection.Snapshot value){}
            public void events(List<WarningEvent> values){}
            public void ownerRevoked(long epoch){}
            public void disconnected(String reason){outcomes.add(reason);}
        })) {
            Bundle status=new Bundle();status.putBinder("warning_api",source.binder());status.putIntArray("warning_protocols",new int[]{1});
            assertTrue(session.prepare("nl.flitsmeister",status,7));
            String oldSession=session.connection().providerSession();
            status.remove("warning_protocols");
            assertFalse(session.prepare("nl.flitsmeister",status,7));
            assertNull(session.connection());assertFalse(session.accepts(oldSession));assertFalse(session.captureComplete());
            assertEquals("incompatible",session.state());assertEquals(1,outcomes.size());
            status.remove("warning_api");status.putIntArray("warning_protocols",new int[]{1});
            assertFalse(session.prepare("nl.flitsmeister",status,7));assertEquals(1,outcomes.size());
        }
    }
    @Test public void wazeNegotiatesItsOwnProfileWithoutClaimingCompleteCapture() throws Exception {
        ShadowProcess.setUid(20000);Context context=RuntimeEnvironment.getApplication();
        PackageInfo info=new PackageInfo();info.packageName=WarningProviders.WAZE;info.applicationInfo=new ApplicationInfo();info.applicationInfo.packageName=info.packageName;info.applicationInfo.uid=20000;
        Shadows.shadowOf(context.getPackageManager()).installPackage(info);
        source=new WarningEndpoint(20000,u->u==20000?"app.consumer":null,new WarningCapabilities(WazeWarningTypes.MANIFEST_DIGEST,WazeWarningTypes.required(),false),
                ()->new WarningEndpoint.Storage("boot-count:7",new PlaybackStore(){public PlaybackGrant load(){return null;}public void save(PlaybackGrant g){}},null),SystemClock::elapsedRealtime,()->20000);
        try(WarningSession session=new WarningSession(context,new WarningConnection.Listener(){
            public void snapshot(WarningConnection.Snapshot value){}public void events(List<WarningEvent> values){}public void ownerRevoked(long epoch){}public void disconnected(String reason){}
        })) {
            Bundle status=new Bundle();status.putBinder("warning_api",source.binder());status.putIntArray("warning_protocols",new int[]{1});
            status.putString("warning_controller_state","unproved");status.putString("warning_source_route_state","not_active");
            Bundle families=new Bundle(),row=new Bundle();row.putBoolean("supported_capture",true);row.putString("controller_state","singleton_resolved");row.putString("native_available","unobserved");families.putBundle("alerters",row);status.putBundle("warning_families",families);
            assertTrue(session.prepare(WarningProviders.WAZE,status,7));assertTrue(session.advertisesEvents(WarningProviders.WAZE));assertFalse(session.captureComplete());
            assertEquals("unproved",session.controllerState());assertEquals("not_active",session.sourceRouteState());
            assertEquals("singleton_resolved",session.familyStatus().getBundle("alerters").getString("controller_state"));
            row.putString("controller_state","changed_after_delivery");assertEquals("singleton_resolved",session.familyStatus().getBundle("alerters").getString("controller_state"));
            Bundle copy=session.familyStatus();copy.getBundle("alerters").putString("controller_state","changed_by_reader");assertEquals("singleton_resolved",session.familyStatus().getBundle("alerters").getString("controller_state"));assertFalse(session.captureComplete());
            row.putDouble("unsupported_field",1.5);assertTrue(session.prepare(WarningProviders.WAZE,status,7));assertTrue(session.familyStatus().isEmpty());assertFalse(session.captureComplete());
            assertFalse(session.advertisesEvents(WarningProviders.FLITSMEISTER));
            session.disconnected(8);assertEquals("",session.controllerState());assertEquals("",session.sourceRouteState());assertTrue(session.familyStatus().isEmpty());
        }
    }
    @Test public void legacyWazeRemainsLegacyUntilItAdvertisesAnEventProtocol() throws Exception {
        Context context=RuntimeEnvironment.getApplication();
        try(WarningSession session=new WarningSession(context,new WarningConnection.Listener(){
            public void snapshot(WarningConnection.Snapshot value){}public void events(List<WarningEvent> values){}public void ownerRevoked(long epoch){}public void disconnected(String reason){}
        })) {
            Bundle status=new Bundle();assertTrue(session.prepare(WarningProviders.WAZE,status,1));assertEquals("legacy",session.state());assertFalse(session.advertisesEvents(WarningProviders.WAZE));
            status.putIntArray("warning_protocols",new int[]{2});assertFalse(session.prepare(WarningProviders.WAZE,status,1));assertTrue(session.advertisesEvents(WarningProviders.WAZE));
            status.remove("warning_protocols");assertTrue(session.prepare(WarningProviders.WAZE,status,1));assertTrue("A downgrade cannot silently resume duplicate legacy audio",session.advertisesEvents(WarningProviders.WAZE));
            session.resetEventNegotiation();assertFalse(session.advertisesEvents(WarningProviders.WAZE));
        }
    }
    @Test public void authenticatedHandshakeConsumesSnapshotBeforeLiveDelivery() throws Exception {
        ShadowProcess.setUid(20000);Context context=RuntimeEnvironment.getApplication();
        PackageInfo info=new PackageInfo();info.packageName="app.provider";info.applicationInfo=new ApplicationInfo();info.applicationInfo.packageName=info.packageName;info.applicationInfo.uid=20000;
        Shadows.shadowOf(context.getPackageManager()).installPackage(info);
        Set<String> caps=new HashSet<>(Collections.singleton("native_text"));char[] hash=new char[64];Arrays.fill(hash,'a');
        source=new WarningEndpoint(20000,u->u==20000?"app.consumer":null,new WarningCapabilities(new String(hash),caps,true),
                ()->new WarningEndpoint.Storage("boot-count:7",new PlaybackStore(){public PlaybackGrant load(){return null;}public void save(PlaybackGrant g){}},null),SystemClock::elapsedRealtime,()->20000);
        BlockingQueue<WarningConnection.Snapshot> snapshots=new LinkedBlockingQueue<>();BlockingQueue<List<WarningEvent>> deliveries=new LinkedBlockingQueue<>();
        client=new WarningConnection(context,caps,EnumSet.allOf(WarningAudioOwner.Mode.class),new WarningConnection.Listener(){
            public void snapshot(WarningConnection.Snapshot value){snapshots.add(value);}
            public void events(List<WarningEvent> values){deliveries.add(values);}
            public void ownerRevoked(long epoch){}
            public void disconnected(String reason){}
        });
        assertTrue(client.open("app.provider",source.binder()).get(4,TimeUnit.SECONDS));
        assertTrue(client.ping().get(3,TimeUnit.SECONDS));
        WarningConnection.Snapshot initial=snapshots.poll(1,TimeUnit.SECONDS);assertNotNull(initial);assertEquals(0,initial.headSequence);assertTrue(initial.state.isEmpty());
        Bundle e=new Bundle();e.putString("operation","ANNOUNCE");e.putString("warning_id","road-a");e.putLong("revision",1);e.putLong("announcement_index",1);e.putString("phase","notice");e.putString("native_type","Incident");e.putString("category","road_danger");e.putInt("priority",0);e.putString("message","Person on road");e.putString("language_tag","en");e.putString("message_origin","native_text");e.putString("relevance","notice");e.putString("relationship","unknown");e.putLong("observed_elapsed_ms",SystemClock.elapsedRealtime());
        assertTrue(source.emit(e));List<WarningEvent> pushed=deliveries.poll(3,TimeUnit.SECONDS);assertNotNull(pushed);assertEquals("Person on road",pushed.get(0).message);
        WarningConnection.Claim claim=client.claim(WarningAudioOwner.Mode.SILENT,false).get(3,TimeUnit.SECONDS);assertEquals("OK",claim.status);assertNotNull(claim.lease);
        WarningConnection.Attempt muted=client.decide(claim.lease,pushed.get(0),UUID.randomUUID().toString(),PlaybackGrant.Outcome.USER_MUTED).get(3,TimeUnit.SECONDS);
        assertEquals("OK",muted.status);assertEquals(PlaybackGrant.Outcome.USER_MUTED,muted.grant.outcome);
        WarningConnection.Claim voiced=client.claim(WarningAudioOwner.Mode.VOICE,true).get(3,TimeUnit.SECONDS);
        assertTrue(client.supportsPreview());
        WarningConnection.Candidate preview=client.preview(voiced.lease,"nl",UUID.randomUUID().toString()).get(3,TimeUnit.SECONDS);
        assertTrue(Boolean.TRUE.equals(preview.payload.fields().get("is_preview")));assertTrue(preview.payload.message.startsWith("Synthetisch voorbeeld"));
        List<WarningEvent> previewDelivery=deliveries.poll(3,TimeUnit.SECONDS);assertNotNull(previewDelivery);assertEquals(preview.authority.warningId,previewDelivery.get(0).warningId);
        e.putString("warning_id","road-b");e.putLong("observed_elapsed_ms",SystemClock.elapsedRealtime());assertTrue(source.emit(e));
        List<WarningEvent> second=deliveries.poll(3,TimeUnit.SECONDS);assertNotNull(second);
        WarningConnection.Attempt granted=client.begin(voiced.lease,second.get(0),UUID.randomUUID().toString()).get(3,TimeUnit.SECONDS);
        assertEquals("GRANTED",granted.status);
        client.retire();
        assertEquals("OK",client.outcome(granted.grant,PlaybackGrant.Outcome.NOT_STARTED,true).get(3,TimeUnit.SECONDS));
        assertEquals("OK",client.release(voiced.lease).get(3,TimeUnit.SECONDS));
    }
}
