package nl.johninnl.startup.probe;
import android.app.*;
import android.content.*;
import android.os.*;
import android.util.Log;
import android.widget.TextView;
import nl.johninnl.navigation.startup.NavigationClient;
import nl.johninnl.navigation.startup.StartupProtocol;

/** Separate UID/signing key; never installed on a physical device by the validation script. */
public final class Probe extends Activity {
 private final Handler main=new Handler(Looper.getMainLooper());
 private String provider;private IBinder binder;private TextView text;private NavigationClient client;
 private final ServiceConnection connection=new ServiceConnection(){
  public void onServiceConnected(ComponentName n,IBinder b){binder=b;}
  public void onServiceDisconnected(ComponentName n){binder=null;}
 };
 @Override public void onCreate(Bundle state){super.onCreate(state);provider=getIntent().getStringExtra("provider");if(provider==null)provider="com.waze";
  text=new TextView(this);text.setTextSize(18);setContentView(text);
  if(!getIntent().getBooleanExtra("passive",false)){client=new NavigationClient(this);client.select(provider,getIntent().getBooleanExtra("navigation",false));}
  bindService(new Intent().setClassName(provider,StartupProtocol.controlClass(provider)),connection,BIND_AUTO_CREATE);main.post(tick);
 }
 private final Runnable tick=new Runnable(){public void run(){
  if(binder!=null)new Thread(()->{Parcel in=Parcel.obtain(),out=Parcel.obtain();String line;
   try{in.writeInterfaceToken(StartupProtocol.DESCRIPTOR);binder.transact(StartupProtocol.STATUS,in,out,0);out.readException();Bundle b=out.readBundle(PendingIntent.class.getClassLoader());
    line="HEALTH provider="+provider+" state="+b.getString("state")+" engine="+b.getString("engine_state")+" audio_muted="+b.getBoolean("audio_muted")+" caller_uid="+android.os.Process.myUid()+" client="+(client==null?"passive":client.state());
   }catch(Exception e){line="HEALTH_ERROR "+provider+" "+e;}
   finally{in.recycle();out.recycle();}
   final String message=line;Log.i("StartupProbe",message);main.post(()->text.setText(message));
  }).start();main.postDelayed(this,2000);
 }};
 @Override public void onDestroy(){main.removeCallbacksAndMessages(null);if(client!=null)client.close();try{unbindService(connection);}catch(Exception ignored){}super.onDestroy();}
 public static final class Health extends BroadcastReceiver {
  @Override public void onReceive(Context context,Intent intent){
   String provider=intent.getStringExtra("provider");if(StartupProtocol.controlClass(provider).isEmpty())return;
   PendingResult done=goAsync();Context app=context.getApplicationContext();
   ServiceConnection connection=new ServiceConnection(){
    public void onServiceDisconnected(ComponentName n){}
    public void onServiceConnected(ComponentName n,IBinder service){
     new Thread(()->{Parcel in=Parcel.obtain(),out=Parcel.obtain();
      try{in.writeInterfaceToken(StartupProtocol.DESCRIPTOR);service.transact(StartupProtocol.STATUS,in,out,0);out.readException();Bundle b=out.readBundle(PendingIntent.class.getClassLoader());Log.i("StartupProbe","PASSIVE_HEALTH provider="+provider+" state="+b.getString("state")+" engine="+b.getString("engine_state")+" audio_muted="+b.getBoolean("audio_muted"));}
      catch(Exception e){Log.i("StartupProbe","PASSIVE_ERROR "+provider+" "+e);}
      finally{in.recycle();out.recycle();app.unbindService(this);done.finish();}
     }).start();
    }
   };
   if(!app.bindService(new Intent().setClassName(provider,StartupProtocol.controlClass(provider)),connection,Context.BIND_AUTO_CREATE))done.finish();
  }
 }
}
