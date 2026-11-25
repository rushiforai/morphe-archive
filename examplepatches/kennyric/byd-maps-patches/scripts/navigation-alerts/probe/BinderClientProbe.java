package nl.johninnl.warningprobe;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Process;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import nl.johninnl.navigation.alerts.PlaybackGrant;
import nl.johninnl.navigation.alerts.WarningAudioOwner;
import nl.johninnl.navigation.alerts.WarningConnection;
import nl.johninnl.navigation.alerts.WarningEvent;
import nl.johninnl.navigation.alerts.WarningWire;
import org.json.JSONArray;
import org.json.JSONObject;

/** Real separate-UID Binder transport/grant probe. Deliberately creates no sound. */
public final class BinderClientProbe extends Instrumentation {
    private static final String SOURCE="nl.johninnl.warningprobe.binder.source";
    private Bundle arguments;
    @Override public void onCreate(Bundle args){super.onCreate(args);arguments=args==null?new Bundle():args;start();}
    @Override public void onStart(){
        Bundle output=new Bundle();WarningConnection connection=null;Context app=getTargetContext();
        BlockingQueue<IBinder> connected=new LinkedBlockingQueue<>();
        ServiceConnection binding=new ServiceConnection(){
            @Override public void onServiceConnected(ComponentName name,IBinder binder){connected.add(binder);}
            @Override public void onServiceDisconnected(ComponentName name){}
        };
        boolean bound=false;
        try{
            JSONObject report=new JSONObject();int sourceUid=app.getPackageManager().getApplicationInfo(SOURCE,0).uid;
            check(sourceUid!=Process.myUid(),"Separate source UID required");
            Intent intent=new Intent().setComponent(new ComponentName(SOURCE,"nl.johninnl.warningprobe.BinderSourceService"));
            bound=app.bindService(intent,binding,Context.BIND_AUTO_CREATE);check(bound,"Binding failed");
            IBinder remote=connected.poll(10,TimeUnit.SECONDS);check(remote!=null,"Binding timeout");
            check(!(remote instanceof Binder),"Local Binder would not prove transport");
            report.put("remote_binder_class",remote.getClass().getName());report.put("source_uid",sourceUid);report.put("client_uid",Process.myUid());
            report.put("client_pid",Process.myPid());report.put("android_sdk",android.os.Build.VERSION.SDK_INT);
            if(Boolean.TRUE.equals(arguments.get("unauthorized"))||"true".equals(arguments.get("unauthorized"))){
                boolean denied=false;try{raw(remote,WarningWire.REGISTER,registration(new Binder()));}catch(SecurityException expected){denied=true;}
                check(denied,"Unauthorized caller registered");report.put("unauthorized_registration_rejected",true);
            }else{
                check(WarningWire.DESCRIPTOR.equals(remote.getInterfaceDescriptor()),"Remote descriptor");report.put("remote_descriptor_discovered",true);
                AtomicInteger callbackUid=new AtomicInteger(-1);CountDownLatch verified=new CountDownLatch(1);
                Binder observed=new Binder(){
                    {attachInterface(null,WarningWire.CALLBACK);}
                    @Override protected boolean onTransact(int code,Parcel in,Parcel out,int flags){
                        check(Binder.getCallingUid()==sourceUid,"Observed callback UID mismatch");
                        if(code==IBinder.INTERFACE_TRANSACTION){out.writeString(WarningWire.CALLBACK);return true;}
                        in.enforceInterface(WarningWire.CALLBACK);in.readBundle(null);callbackUid.set(Binder.getCallingUid());
                        out.writeNoException();out.writeBundle(WarningWire.status("OK"));verified.countDown();return true;
                    }
                };
                check("VERIFYING".equals(raw(remote,WarningWire.REGISTER,registration(observed)).getString("status")),"Observed register");
                check(verified.await(5,TimeUnit.SECONDS),"Remote callback missing");check(callbackUid.get()==sourceUid,"Callback sender UID");report.put("observed_callback_uid",callbackUid.get());
                BlockingQueue<WarningEvent> delivered=new LinkedBlockingQueue<>();List<String> ordering=Collections.synchronizedList(new ArrayList<>());
                AtomicInteger snapshots=new AtomicInteger();BlockingQueue<String> failures=new LinkedBlockingQueue<>();
                connection=new WarningConnection(app,Collections.singleton("native_text"),EnumSet.allOf(WarningAudioOwner.Mode.class),new WarningConnection.Listener(){
                    @Override public void snapshot(WarningConnection.Snapshot value){
                        check(value.headSequence==0&&value.records.isEmpty(),"Expected bootstrap before synthetic event");
                        check(value.captureComplete,"Synthetic source completeness flag");snapshots.incrementAndGet();ordering.add("snapshot");
                    }
                    @Override public void events(List<WarningEvent> values){check(snapshots.get()>0,"Live before snapshot");ordering.add("events");delivered.addAll(values);}
                    @Override public void ownerRevoked(long epoch){failures.add("REVOKED:"+epoch);}
                    @Override public void disconnected(String reason){if(!reason.equals("CLOSED"))failures.add(reason);}
                });
                long opening=SystemClock.elapsedRealtime();check(connection.open(SOURCE,remote).get(10,TimeUnit.SECONDS),"Authenticated handshake failed");
                report.put("handshake_ms",SystemClock.elapsedRealtime()-opening);
                check(connection.ping().get(5,TimeUnit.SECONDS),"Authenticated connection ping failed");report.put("authenticated_ping",true);
                // The production callback must reject an actual call from this wrong UID.
                java.lang.reflect.Field callback=WarningConnection.class.getDeclaredField("callback");callback.setAccessible(true);
                boolean localRejected=false;try{rawDescriptor((IBinder)callback.get(connection));}catch(SecurityException expected){localRejected=true;}
                check(localRejected,"Wrong-UID callback descriptor accepted");report.put("wrong_uid_callback_rejected",true);
                WarningEvent event=delivered.poll(10,TimeUnit.SECONDS);check(event!=null,"Live synthetic event missing");
                check(event.sequence==1&&event.message.equals("TEST ONLY: synthetic Binder warning; no audio."),"Synthetic payload identity");
                report.put("delivery_age_ms",SystemClock.elapsedRealtime()-event.issuedAt);report.put("event_sequence",event.sequence);
                WarningConnection.Claim claim=connection.claim(WarningAudioOwner.Mode.VOICE,true).get(5,TimeUnit.SECONDS);
                check("OK".equals(claim.status)&&claim.lease!=null,"Claim: "+claim.status);report.put("claim_status",claim.status);
                WarningConnection.Attempt attempt=connection.begin(claim.lease,event,UUID.randomUUID().toString()).get(5,TimeUnit.SECONDS);
                check("GRANTED".equals(attempt.status)&&attempt.grant!=null,"Begin: "+attempt.status);report.put("begin_status",attempt.status);
                check(!attempt.grant.started&&attempt.grant.ownerUid==Process.myUid(),"Grant owner/start state");
                // No speaker was constructed or invoked: NOT_STARTED/quiescent is positively known.
                String outcome=connection.outcome(attempt.grant,PlaybackGrant.Outcome.NOT_STARTED,true).get(5,TimeUnit.SECONDS);
                check("OK".equals(outcome),"Outcome: "+outcome);report.put("not_started_status",outcome);
                String release=connection.release(claim.lease).get(5,TimeUnit.SECONDS);check("OK".equals(release),"Release: "+release);report.put("release_status",release);
                check(failures.isEmpty(),"Unexpected failure: "+failures);report.put("callback_order",new JSONArray(ordering));report.put("snapshot_before_live",true);
                report.put("speaker_readiness","simulated_true_no_speaker_created");report.put("audio_started",false);
            }
            report.put("probe_completed",true);report.put("acceptance_scope","Synthetic cross-process Binder authentication, delivery and grant bookkeeping only; no native FM capture, speaker or car acceptance");
            output.putString("binder_warning_result",report.toString());finish(Activity.RESULT_OK,output);
        }catch(Throwable error){output.putString("binder_warning_error",android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,output);}
        finally{if(connection!=null)connection.close();if(bound)app.unbindService(binding);}
    }
    private static Bundle registration(IBinder callback){
        Bundle q=new Bundle();q.putBinder("callback",callback);q.putString("consumer_nonce",UUID.randomUUID().toString());
        q.putStringArrayList("capabilities",new ArrayList<>(Collections.singleton("native_text")));q.putStringArrayList("output_modes",new ArrayList<>(Arrays.asList("VOICE","TONE","SILENT")));return q;
    }
    private static Bundle raw(IBinder binder,int code,Bundle value)throws Exception{
        Parcel in=Parcel.obtain(),out=Parcel.obtain();try{in.writeInterfaceToken(WarningWire.DESCRIPTOR);in.writeBundle(value);check(binder.transact(code,in,out,0),"Raw transact");out.readException();return out.readBundle(null);}finally{in.recycle();out.recycle();}
    }
    private static void rawDescriptor(IBinder binder)throws Exception{Parcel in=Parcel.obtain(),out=Parcel.obtain();try{binder.transact(IBinder.INTERFACE_TRANSACTION,in,out,0);out.readException();}finally{in.recycle();out.recycle();}}
    private static void check(boolean condition,String message){if(!condition)throw new IllegalStateException(message);}
}
