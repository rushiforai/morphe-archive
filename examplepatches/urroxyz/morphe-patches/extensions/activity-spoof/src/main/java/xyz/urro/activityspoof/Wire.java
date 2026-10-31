package xyz.urro.activityspoof;

import android.content.*;
import android.content.pm.PackageManager;
import android.os.*;

/** One Binder transaction, with SDK-independent Bundle values on the wire. */
public final class Wire {
 public static final String RX="xyz.urro.activityspoof.RECEIVER", TX="xyz.urro.activityspoof.TRANSMITTER";
 public static final String DESCRIPTOR="xyz.urro.activityspoof.v1", SYNTHETIC="xyz.urro.activityspoof.synthetic";
 public static final String ENDPOINT="xyz.urro.activityspoof.Endpoint";
 public static final int VERSION=1;
 private Wire(){}
 public interface Handler { Bundle handle(int caller,Bundle request)throws Exception; }
 public static Binder server(Context c,Handler handler){return new Binder(){
  @Override protected boolean onTransact(int code,Parcel in,Parcel out,int flags)throws RemoteException{
   if(code==INTERFACE_TRANSACTION){out.writeString(DESCRIPTOR);return true;}
   if(code!=FIRST_CALL_TRANSACTION)return super.onTransact(code,in,out,flags);
   in.enforceInterface(DESCRIPTOR);
   try{
    int uid=Binder.getCallingUid();
    if(c.getPackageManager().checkSignatures(uid,android.os.Process.myUid())!=PackageManager.SIGNATURE_MATCH)
     throw new SecurityException("Activity spoof requires a matching signing certificate");
    Bundle request=in.readBundle(Wire.class.getClassLoader());
    if(request==null||request.getInt("version")!=VERSION)throw new IllegalArgumentException("Unsupported activity-spoof protocol");
    Bundle result=handler.handle(uid,request);out.writeNoException();out.writeBundle(result==null?new Bundle():result);
   }catch(Exception e){out.writeException(e instanceof RuntimeException?(RuntimeException)e:new IllegalStateException(e));}
   return true;
  }
 };}
 public static Bundle request(String operation){Bundle b=new Bundle();b.putInt("version",VERSION);b.putString("operation",operation);return b;}
 public static Bundle call(IBinder binder,Bundle request)throws RemoteException{
  Parcel in=Parcel.obtain(),out=Parcel.obtain();try{
   in.writeInterfaceToken(DESCRIPTOR);in.writeBundle(request);
   if(!binder.transact(IBinder.FIRST_CALL_TRANSACTION,in,out,0))throw new RemoteException("Unsupported activity-spoof endpoint");
   out.readException();Bundle b=out.readBundle(Wire.class.getClassLoader());return b==null?new Bundle():b;
  }finally{out.recycle();in.recycle();}
 }
 static boolean trusted(Context c,ComponentName name){
  try{return c.getPackageManager().checkSignatures(c.getPackageName(),name.getPackageName())==PackageManager.SIGNATURE_MATCH;}
  catch(RuntimeException e){return false;}
 }
}
