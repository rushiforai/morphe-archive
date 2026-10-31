package xyz.urro.activityspoof;
import android.app.PendingIntent;
import android.content.*;
import android.content.pm.*;
import android.os.*;
import java.util.*;

/** Generic publisher. Its caller decides when an activity is asserted or withdrawn. */
public final class Transmitter {
 private static final Handler main=new Handler(Looper.getMainLooper());
 private static final Binder lifetime=new Binder();
 private static final String session=UUID.randomUUID().toString();
 private static final Map<ComponentName,Peer> peers=new HashMap<>();
 private static Context context;
 private static boolean active;
 private static int activity=4,confidence;
 private static long sequence;
 private Transmitter(){}
 public static void init(Context c){context=c.getApplicationContext();}
 public static void set(Context c,int type,int probability){
  if(!valid(type)||probability<0||probability>100)throw new IllegalArgumentException("Invalid activity or confidence");
  init(c);main.post(()->{
   if(active&&activity==type&&confidence==probability)return;
   synchronized(Transmitter.class){active=true;activity=type;confidence=probability;sequence++;}
   Trace.write(context,"assert","activity="+type+" sequence="+sequence);
   discover();for(Peer peer:new ArrayList<>(peers.values()))peer.send();
  });
 }
 public static void clear(Context c){init(c);main.post(()->{
  synchronized(Transmitter.class){if(!active)return;active=false;sequence++;}
  Trace.write(context,"withdraw","sequence="+sequence);
  for(Peer peer:new ArrayList<>(peers.values())){peer.send();peer.close();}peers.clear();
 });}
 public static boolean valid(int type){return type>=0&&type<=5||type==7||type==8;}
 public static synchronized Bundle snapshot(){
  Bundle b=Wire.request("claim");b.putBoolean("active",active);b.putInt("activity",activity);b.putInt("confidence",confidence);
  b.putString("session",session);b.putLong("sequence",sequence);b.putBinder("lifetime",lifetime);return b;
 }
 private static void discover(){
  for(ResolveInfo r:context.getPackageManager().queryIntentServices(new Intent(Wire.RX),0)){
   if(r.serviceInfo==null||(r.serviceInfo.applicationInfo.flags&ApplicationInfo.FLAG_STOPPED)!=0)continue;
   connect(new ComponentName(r.serviceInfo.packageName,r.serviceInfo.name));
  }
 }
 static void hello(Context c,ComponentName component){init(c);main.post(()->{if(active){connect(component);Peer p=peers.get(component);if(p!=null)p.send();}});}
 private static void connect(ComponentName component){
  if(peers.containsKey(component)||!Wire.trusted(context,component))return;
  Peer peer=new Peer(component);peers.put(component,peer);
  try{peer.bound=context.bindService(new Intent().setComponent(component),peer,Context.BIND_AUTO_CREATE);if(!peer.bound)peers.remove(component);}
  catch(RuntimeException e){peers.remove(component);Trace.write(context,"bind_failed",e.getClass().getSimpleName());}
 }
 private static final class Peer implements ServiceConnection {
  final ComponentName name;IBinder binder;boolean bound;
  ArrayList<PendingIntent> recovery=new ArrayList<>();
  Peer(ComponentName name){this.name=name;}
  public void onServiceConnected(ComponentName n,IBinder service){
   binder=service;
   // Recovery tokens contain the original subscription inside the owning app.
   for(PendingIntent p:recovery)try{p.send();}catch(PendingIntent.CanceledException ignored){}
   main.postDelayed(this::send,recovery.isEmpty()?0:100);
  }
  void send(){
   if(binder==null)return;
   try{
    Wire.call(binder,snapshot());
    ArrayList<PendingIntent> tokens=Wire.call(binder,Wire.request("subscriptions")).getParcelableArrayList("recovery");
    if(tokens!=null)recovery=tokens;
    Trace.write(context,"delivered","receivers="+peers.size()+" subscriptions="+recovery.size());
   }catch(RemoteException|RuntimeException e){Trace.write(context,"delivery_failed",e.getClass().getSimpleName());}
  }
  public void onServiceDisconnected(ComponentName n){binder=null;}
  public void onBindingDied(ComponentName n){binder=null;close();peers.remove(name);if(active)connect(name);}
  public void onNullBinding(ComponentName n){close();peers.remove(name);}
  void close(){binder=null;if(bound){try{context.unbindService(this);}catch(RuntimeException ignored){}bound=false;}}
 }
}
