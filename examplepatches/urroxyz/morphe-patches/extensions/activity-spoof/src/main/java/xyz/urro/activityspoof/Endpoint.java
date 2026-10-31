package xyz.urro.activityspoof;
import android.app.Service;
import android.content.*;
import android.os.*;
/** Exported API endpoint; every transaction authenticates the real Binder caller. */
public final class Endpoint extends Service {
 private IBinder binder;
 public void onCreate(){super.onCreate();binder=Wire.server(this,(uid,request)->{
  String operation=request.getString("operation","");
  if(operation.equals("state"))return Transmitter.snapshot();
  if(operation.equals("hello")){
   ComponentName receiver=request.getParcelable("receiver");
   if(receiver==null||getPackageManager().getPackageUid(receiver.getPackageName(),0)!=uid)
    throw new SecurityException("Receiver does not belong to caller");
   Transmitter.hello(this,receiver);return Transmitter.snapshot();
  }
  if(operation.equals("claim")){ReceiverRuntime.init(this);ReceiverRuntime.claim(uid,request);return new Bundle();}
  if(operation.equals("subscriptions")){ReceiverRuntime.init(this);return ReceiverRuntime.capabilities();}
  throw new IllegalArgumentException("Unknown activity-spoof operation");
 });}
 public IBinder onBind(Intent intent){return binder;}
}
