package nl.johninnl.navigation.alerts;

import static org.junit.Assert.*;
import android.os.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public class WarningEndpointTest {
    AtomicInteger uid=new AtomicInteger(10001);AtomicLong clock=new AtomicLong(100000);WarningEndpoint source;
    Set<String> caps=new HashSet<>(Collections.singleton("native_text"));
    @Before public void setup() {
        WarningCapabilities p=new WarningCapabilities(repeat('a',64),caps,true);
        source=new WarningEndpoint(20000,u->u>=10001&&u<=10006?"app.client"+u:null,p,
                ()->new WarningEndpoint.Storage("boot-count:7",new PlaybackStore(){PlaybackGrant value;public PlaybackGrant load(){return value;}public void save(PlaybackGrant g){value=g;}},null),clock::get,uid::get);
    }
    @After public void cleanup() { if(source!=null)source.close(); }
    @Test public void storageInitializationFencesLegacyOutputUntilTheDurableStateIsKnown()throws Exception{
        source.close();CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);
        source=new WarningEndpoint(20000,u->"app.client"+u,new WarningCapabilities(repeat('a',64),caps,true),()->{
            entered.countDown();try{if(!release.await(3,TimeUnit.SECONDS))throw new java.io.IOException("STORAGE_WAIT");}catch(InterruptedException error){Thread.currentThread().interrupt();throw new java.io.IOException("STORAGE_INTERRUPTED");}
            return new WarningEndpoint.Storage("boot-count:7",new PlaybackStore(){public PlaybackGrant load(){return null;}public void save(PlaybackGrant value){}},null);
        },clock::get,uid::get);
        try{
            assertTrue(entered.await(2,TimeUnit.SECONDS));assertTrue(source.exclusiveAudio());assertEquals("INITIALIZING",source.audioStatus());
        }finally{release.countDown();}
        confirmed(new Callback());
        assertFalse("Only an initialized empty ledger permits legacy delivery",source.exclusiveAudio());
        assertNotEquals("INITIALIZING",source.audioStatus());
    }
    Bundle call(int code,Bundle b) throws Exception {
        Parcel in=Parcel.obtain(),out=Parcel.obtain();try { in.writeInterfaceToken(WarningWire.DESCRIPTOR);in.writeBundle(b);source.binder().transact(code,in,out,0);out.readException();return out.readBundle(null); }finally{in.recycle();out.recycle();}
    }
    static final class Callback extends Binder {
        final BlockingQueue<Bundle> verifies=new LinkedBlockingQueue<>(),events=new LinkedBlockingQueue<>(),invalidations=new LinkedBlockingQueue<>(),revocations=new LinkedBlockingQueue<>();
        volatile CountDownLatch eventRelease;
        Callback(){attachInterface(null,WarningWire.CALLBACK);}
        @Override protected boolean onTransact(int code,Parcel in,Parcel out,int flags) {
            in.enforceInterface(WarningWire.CALLBACK);Bundle b=in.readBundle(null);Bundle response=WarningWire.status("OK");
            if(code==WarningWire.VERIFY)verifies.add(b);
            if(code==WarningWire.STATE_INVALIDATED)invalidations.add(b);
            if(code==WarningWire.OWNER_REVOKED)revocations.add(b);
            if(code==WarningWire.EVENTS){events.add(b);response.putLong("accepted_sequence",b.getLong("through_sequence"));
                if(eventRelease!=null)try{if(!eventRelease.await(5,TimeUnit.SECONDS))throw new IllegalStateException("Test callback was not released");}catch(InterruptedException error){Thread.currentThread().interrupt();throw new IllegalStateException(error);}
            }
            out.writeNoException();out.writeBundle(response);return true;
        }
    }
    Bundle register(Callback cb) throws Exception {
        Bundle b=new Bundle();b.putBinder("callback",cb);b.putString("consumer_nonce",UUID.randomUUID().toString());
        b.putStringArrayList("capabilities",new ArrayList<>(caps));b.putStringArrayList("output_modes",new ArrayList<>(Arrays.asList("VOICE","TONE","SILENT")));
        return call(WarningWire.REGISTER,b);
    }
    Bundle confirmed(Callback cb) throws Exception {
        Bundle r=register(cb);Bundle challenge=cb.verifies.poll(3,TimeUnit.SECONDS);assertNotNull(challenge);
        Bundle c=new Bundle();c.putString("registration_token",r.getString("registration_token"));c.putString("challenge",challenge.getString("challenge"));c.putBinder("callback",cb);
        assertEquals("OK",call(WarningWire.CONFIRM,c).getString("status"));
        Bundle q=new Bundle();q.putString("registration_token",r.getString("registration_token"));q.putString("provider_session",r.getString("provider_session"));q.putLong("after_sequence",0);
        Bundle view=call(WarningWire.RESUME,q);assertTrue(view.getBoolean("done"));q.putString("view_token",view.getString("view_token"));q.putLong("head_sequence",view.getLong("head_sequence"));
        assertEquals("OK",call(WarningWire.ACK,q).getString("status"));return r;
    }
    @Test public void everyTransactionChecksCallerUidAndTokenCannotReplaceAuthentication() throws Exception {
        Callback cb=new Callback();Bundle r=confirmed(cb);Bundle q=new Bundle();q.putString("registration_token",r.getString("registration_token"));
        uid.set(999);try{call(WarningWire.GET_STATE,q);fail("Unauthorized UID");}catch(SecurityException expected){}
        uid.set(10002);try{call(WarningWire.GET_STATE,q);fail("Stolen token");}catch(SecurityException expected){}
    }
    @Test public void callbackChallengeRequiresTheRegisteringUidAndMatchingBinder() throws Exception {
        Callback cb=new Callback();Bundle r=register(cb),challenge=cb.verifies.poll(3,TimeUnit.SECONDS);assertNotNull(challenge);
        Bundle c=new Bundle();c.putString("registration_token",r.getString("registration_token"));c.putString("challenge",challenge.getString("challenge"));c.putBinder("callback",cb);
        uid.set(10002);try{call(WarningWire.CONFIRM,c);fail("Foreign callback UID");}catch(SecurityException expected){}
        uid.set(10001);assertEquals("OK",call(WarningWire.CONFIRM,c).getString("status"));
    }
    @Test public void registrationCountIsBoundedAndSourceEventsAreDeliveredImmediately() throws Exception {
        Callback first=new Callback();confirmed(first);
        for(int i=2;i<=4;i++){uid.set(10000+i);confirmed(new Callback());}
        uid.set(10005);assertEquals("REGISTRATION_LIMIT",register(new Callback()).getString("status"));
        Bundle b=event();assertTrue(source.emit(b));Bundle pushed=first.events.poll(3,TimeUnit.SECONDS);assertNotNull(pushed);
        List<WarningEvent> events=WarningCodec.decodeBatch(pushed.getBundle("batch"),clock.get());assertEquals("Actual native text",events.get(0).message);
        assertEquals(1,events.get(0).sequence);assertEquals(100000,events.get(0).issuedAt);
    }
    @Test public void cameraCapacityAndChurnNeverFenceNativeDelivery() throws Exception {
        Bundle registration=confirmed(new Callback());
        Bundle request=new Bundle();request.putString("registration_token",registration.getString("registration_token"));
        for(int i=0;i<32;i++)emitAndCheckHealthy(camera("camera-"+i,"UPSERT"),request);
        for(int i=0;i<96;i++) {
            Bundle nativeEvent=event();nativeEvent.putString("warning_id","native-"+i);
            nativeEvent.putString("announcement_origin","uniform_alert");
            emitAndCheckHealthy(nativeEvent,request);
        }
        emitAndCheckHealthy(camera("camera-0","CLEAR"),request);
        Bundle incoming=event();incoming.putString("warning_id","native-new");incoming.putString("announcement_origin","uniform_alert");
        emitAndCheckHealthy(incoming,request);
        for(int i=0;i<150;i++) {
            emitAndCheckHealthy(camera("churn-"+i,"UPSERT"),request);
            emitAndCheckHealthy(camera("churn-"+i,"CLEAR"),request);
        }
        Bundle clear=new Bundle();clear.putString("operation","CLEAR");clear.putString("warning_id","native-0");
        clear.putLong("revision",2);clear.putLong("announcement_index",1);clear.putLong("observed_elapsed_ms",clock.get());
        emitAndCheckHealthy(clear,request);
    }
    private void emitAndCheckHealthy(Bundle event,Bundle request)throws Exception {
        assertTrue(source.emit(event));
        assertTrue("Display-only capacity must not fail native capture",call(WarningWire.PING,request).getBoolean("capture_complete"));
    }
    private Bundle camera(String id,String operation) {
        Bundle b=event();b.putString("warning_id",id);b.putString("operation",operation);b.putLong("announcement_index",0);
        b.putString("native_type","CAMERA");b.putString("category","display_only");
        b.putString("native_namespace","waze.insights.native_tile");b.putInt("native_tile_kind",72);
        b.putString("position_clock_origin","native_tile");b.putBoolean("native_point_target",true);
        return b;
    }

    @Test public void idleHealthPingPreservesAConfirmedRegistration() throws Exception {
        Bundle r=confirmed(new Callback());Bundle q=new Bundle();q.putString("registration_token",r.getString("registration_token"));
        clock.set(140000);assertEquals("OK",call(WarningWire.PING,q).getString("status"));
        clock.set(146000);Thread.sleep(1100);
        assertEquals("OK",call(WarningWire.GET_STATE,q).getString("status"));
    }
    @Test public void legacyControlClientsBlockAudioUntilTheirOwnSessionExpires() throws Exception {
        Callback callback=new Callback();Bundle r=confirmed(callback),q=new Bundle();q.putString("registration_token",r.getString("registration_token"));q.putString("mode","VOICE");q.putBoolean("ready",true);
        source.controlClient(10002,false);assertEquals("LEGACY_RECEIVER_ACTIVE",call(WarningWire.CLAIM_AUDIO,q).getString("status"));
        source.controlClient(10001,true);assertEquals("LEGACY_RECEIVER_ACTIVE",call(WarningWire.CLAIM_AUDIO,q).getString("status"));
        clock.set(142000);assertEquals("OK",call(WarningWire.PING,q).getString("status"));
        clock.set(145000);assertEquals("OK",call(WarningWire.CLAIM_AUDIO,q).getString("status"));
    }
    @Test public void expiredOwnerRevocationWaitsForAnInflightEventCallbackInsteadOfBeingLost() throws Exception {
        Callback callback=new Callback();Bundle registration=confirmed(callback);
        Bundle request=new Bundle();request.putString("registration_token",registration.getString("registration_token"));
        request.putString("mode","VOICE");request.putBoolean("ready",true);
        Bundle claimed=call(WarningWire.CLAIM_AUDIO,request);assertEquals("OK",claimed.getString("status"));
        long epoch=claimed.getBundle("lease").getLong("owner_epoch");
        callback.eventRelease=new CountDownLatch(1);
        assertTrue(source.emit(event()));assertNotNull(callback.events.poll(3,TimeUnit.SECONDS));
        Bundle owned=new Bundle(request);owned.putString("owner_token",claimed.getBundle("lease").getString("owner_token"));owned.putLong("owner_epoch",epoch);
        Bundle attempt=new Bundle(owned);attempt.putString("warning_id","a");attempt.putString("phase","notice");attempt.putLong("announcement_index",1);attempt.putLong("revision",1);attempt.putString("attempt_nonce",UUID.randomUUID().toString());
        try{
            assertEquals("GRANTED",call(WarningWire.BEGIN_ATTEMPT,attempt).getString("status"));
            clock.addAndGet(6000);
            assertEquals("STALE_OWNER",call(WarningWire.RENEW_AUDIO,owned).getString("status"));
        }finally{callback.eventRelease.countDown();}
        Bundle revoked=callback.revocations.poll(3,TimeUnit.SECONDS);
        assertNotNull("The old owner must receive its cancellation even when its callback was busy",revoked);
        assertEquals(epoch,revoked.getLong("owner_epoch"));
        assertEquals("AUDIO_UNCERTAIN",call(WarningWire.CLAIM_AUDIO,request).getString("status"));
    }
    @Test public void parkedRecoveryRefusesAReadyReceiverAndPreservesItsAuthority() throws Exception {
        source.close();
        source=localRecoverySource();
        Callback callback=new Callback();Bundle registration=confirmed(callback);
        Bundle request=new Bundle();request.putString("registration_token",registration.getString("registration_token"));
        request.putString("mode","VOICE");request.putBoolean("ready",true);
        Bundle claim=call(WarningWire.CLAIM_AUDIO,request);assertEquals("OK",claim.getString("status"));
        assertTrue(source.emit(event()));assertNotNull(callback.events.poll(3,TimeUnit.SECONDS));

        assertEquals("OUTPUT_ACTIVE",source.recoverAfterParkedStop().get(3,TimeUnit.SECONDS));
        Bundle state=call(WarningWire.GET_STATE,request);
        assertEquals(claim.getBundle("lease").getString("owner_token"),state.getBundle("lease").getString("owner_token"));
        request.putString("provider_session",registration.getString("provider_session"));request.putLong("after_sequence",0);
        Bundle snapshot=call(WarningWire.RESUME,request);
        assertTrue(snapshot.getParcelableArrayList("items").stream().anyMatch(item->"announcement".equals(((Bundle)item).getString("item_type"))));
    }
    @Test public void parkedRecoveryInvalidatesTheOldViewAndKeepsVisualStateWithoutPlaybackAuthority() throws Exception {
        source.close();
        source=localRecoverySource();
        Callback callback=new Callback();Bundle registration=confirmed(callback);
        callback.eventRelease=new CountDownLatch(1);
        assertTrue(source.emit(event()));assertNotNull(callback.events.poll(3,TimeUnit.SECONDS));
        Bundle request=new Bundle();request.putString("registration_token",registration.getString("registration_token"));
        request.putString("provider_session",registration.getString("provider_session"));request.putLong("after_sequence",0);
        Bundle oldView=call(WarningWire.RESUME,request);

        try{assertEquals("OK",source.recoverAfterParkedStop().get(3,TimeUnit.SECONDS));}
        finally{callback.eventRelease.countDown();}
        assertNotNull("Recovery must notify the receiver after its in-flight event callback finishes",callback.invalidations.poll(3,TimeUnit.SECONDS));
        Bundle oldAck=new Bundle(request);oldAck.putString("view_token",oldView.getString("view_token"));oldAck.putLong("head_sequence",oldView.getLong("head_sequence"));
        assertNotEquals("OK",call(WarningWire.ACK,oldAck).getString("status"));
        Bundle current=call(WarningWire.RESUME,request);assertEquals("OK",current.getString("status"));
        ArrayList<Bundle> items=current.getParcelableArrayList("items");
        assertTrue(items.stream().anyMatch(item->"state".equals(item.getString("item_type"))&&"Actual native text".equals(item.getBundle("event").getString("message"))));
        assertFalse(items.stream().anyMatch(item->"announcement".equals(item.getString("item_type"))));
    }
    @Test public void acknowledgedCaptureFaultDoesNotLoopSnapshotsOrUnfenceAudio() throws Exception {
        Callback callback=new Callback();Bundle registration=confirmed(callback);
        source.captureOverflow();
        assertNotNull(callback.invalidations.poll(3,TimeUnit.SECONDS));
        Bundle view=resume(registration);assertFalse(view.getBoolean("capture_complete"));
        acknowledge(registration,view);
        assertNull("An acknowledged fault must not invalidate the same snapshot again, including maintenance",
                callback.invalidations.poll(1200,TimeUnit.MILLISECONDS));
        Bundle claim=new Bundle();claim.putString("registration_token",registration.getString("registration_token"));
        claim.putString("mode","VOICE");claim.putBoolean("ready",true);
        assertEquals("OVERFLOW",call(WarningWire.CLAIM_AUDIO,claim).getString("status"));
        assertTrue("Valid later records must still reach the receiver",source.emit(event()));
        assertNotNull(callback.events.poll(3,TimeUnit.SECONDS));
        assertFalse(call(WarningWire.PING,claim).getBoolean("capture_complete"));
    }
    @Test public void aFaultAfterTheFrozenViewStillRequiresOneNewAcknowledgement() throws Exception {
        Callback callback=new Callback();Bundle registration=confirmed(callback);
        Bundle beforeFault=resume(registration);assertTrue(beforeFault.getBoolean("capture_complete"));
        source.captureOverflow();
        acknowledge(registration,beforeFault);
        assertNotNull("Acknowledging an older healthy view cannot consume a newer fault",
                callback.invalidations.poll(3,TimeUnit.SECONDS));
        Bundle current=resume(registration);assertFalse(current.getBoolean("capture_complete"));
        acknowledge(registration,current);
        assertNull(callback.invalidations.poll(1200,TimeUnit.MILLISECONDS));
    }
    private Bundle resume(Bundle registration)throws Exception{
        Bundle request=new Bundle();request.putString("registration_token",registration.getString("registration_token"));
        request.putString("provider_session",registration.getString("provider_session"));request.putLong("after_sequence",0);
        Bundle view=call(WarningWire.RESUME,request);assertEquals("OK",view.getString("status"));assertTrue(view.getBoolean("done"));return view;
    }
    private void acknowledge(Bundle registration,Bundle view)throws Exception{
        Bundle request=new Bundle();request.putString("registration_token",registration.getString("registration_token"));
        request.putString("view_token",view.getString("view_token"));request.putLong("head_sequence",view.getLong("head_sequence"));
        assertEquals("OK",call(WarningWire.ACK,request).getString("status"));
    }
    private WarningEndpoint localRecoverySource(){
        WarningCapabilities profile=new WarningCapabilities(repeat('a',64),caps,true);
        return new WarningEndpoint(android.os.Process.myUid(),u->u>=10001&&u<=10006?"app.client"+u:null,profile,
                ()->new WarningEndpoint.Storage("boot-count:7",new PlaybackStore(){PlaybackGrant value;public PlaybackGrant load(){return value;}public void save(PlaybackGrant grant){value=grant;}},null),clock::get,uid::get);
    }
    private Bundle event(){Bundle b=new Bundle();b.putString("operation","ANNOUNCE");b.putString("warning_id","a");b.putLong("revision",1);b.putLong("announcement_index",1);b.putString("phase","notice");b.putString("native_type","Incident");b.putString("category","road_danger");b.putInt("priority",0);b.putString("message","Actual native text");b.putString("language_tag","en");b.putString("message_origin","native_text");b.putString("relevance","notice");b.putString("relationship","unknown");b.putLong("observed_elapsed_ms",clock.get());return b;}
    private static String repeat(char c,int n){char[] a=new char[n];Arrays.fill(a,c);return new String(a);}
}
