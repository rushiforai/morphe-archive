package xyz.urro.activityspoof;
import android.Manifest;
import android.app.PendingIntent;
import android.content.*;
import android.content.pm.*;
import android.net.Uri;
import android.os.*;
import java.util.*;
import org.json.*;

/** Subscription registry and virtual activity state, independent of the host application's code. */
public final class ReceiverRuntime {
 private static Context app;
 private static final Handler main=new Handler(Looper.getMainLooper());
 private static final Map<String,Subscription> subscriptions=new LinkedHashMap<>();
 private static final Map<String,Claim> claims=new HashMap<>();
 private static final Map<String,Long> lastSequences=new LinkedHashMap<>();
 private static final Map<CallbackKey,Long> generations=new HashMap<>();
 private static long generation,order,dispatchCount,lastDispatch;
 private static Object lastRealSample;
 private static final Set<Integer> realActivities=new LinkedHashSet<>();
 private static final Map<ComponentName,ServiceConnection> probes=new HashMap<>();
 private ReceiverRuntime(){}
 public static synchronized void init(Context c){if(app==null){app=c.getApplicationContext();Trace.write(app,"receiver_init","protocol=1");recoverStored();}}
 static synchronized Context context(){if(app==null)throw new IllegalStateException("Activity receiver has not initialized");return app;}
 static boolean permitted(){return Build.VERSION.SDK_INT<29||context().checkSelfPermission(Manifest.permission.ACTIVITY_RECOGNITION)==PackageManager.PERMISSION_GRANTED;}
 private static final class CallbackKey {
  final PendingIntent callback;final boolean transition;
  CallbackKey(PendingIntent callback,boolean transition){this.callback=callback;this.transition=transition;}
  public int hashCode(){return callback.hashCode()*31+(transition?1:0);}
  public boolean equals(Object other){return other instanceof CallbackKey&&((CallbackKey)other).transition==transition&&((CallbackKey)other).callback.equals(callback);}
 }
 private static CallbackKey key(PendingIntent p,boolean transition){return new CallbackKey(p,transition);}
 static synchronized long pending(PendingIntent p,boolean transition){long next=++generation;generations.put(key(p,transition),next);return next;}
 static void complete(PendingIntent p,boolean transition,boolean remove,long token,long interval,int[] filters){
  main.post(()->{synchronized(ReceiverRuntime.class){
   if(!Objects.equals(generations.get(key(p,transition)),token))return;
   Subscription old=null;for(Subscription s:subscriptions.values())if(s.transition==transition&&s.callback.equals(p)){old=s;break;}
   if(old!=null){subscriptions.remove(old.id);old.recovery.cancel();}
   if(remove){persist();Trace.write(app,"unsubscribe","transition="+transition);hello();return;}
   if(p.getCreatorUid()!=android.os.Process.myUid()){Trace.write(app,"subscription_rejected","foreign_callback");return;}
   Subscription s=new Subscription(UUID.randomUUID().toString(),p,transition,interval,filters);
   subscriptions.put(s.id,s);persist();Trace.write(app,"subscribe","transition="+transition+" count="+subscriptions.size());
   Claim winner=winner();if(winner!=null)deliver(s,-1,winner.activity,winner.confidence);
   hello();
  }});
 }
 private static void persist(){
  try{
   JSONArray records=new JSONArray();
   for(Subscription s:subscriptions.values()){
    JSONObject factory=CallbackFactories.describe(s.callback);
    if(factory==null){Trace.write(app,"cold_recovery_unavailable","callback_factory_not_observed");continue;}
    JSONArray filters=new JSONArray();for(int value:s.filters)filters.put(value);
    records.put(new JSONObject().put("id",s.id).put("factory",factory).put("transition",s.transition).put("interval",s.interval).put("filters",filters));
   }
   app.getSharedPreferences("xyz.urro.activityspoof.registry",0).edit().putString("subscriptions",records.toString()).apply();
  }catch(Exception e){Trace.write(app,"registry_save_failed",e.getClass().getSimpleName());}
 }
 private static void recoverStored(){
  try{
   JSONArray records=new JSONArray(app.getSharedPreferences("xyz.urro.activityspoof.registry",0).getString("subscriptions","[]"));
   for(int i=0;i<records.length();i++){
    JSONObject r=records.getJSONObject(i);PendingIntent callback=CallbackFactories.reacquire(app,r.getJSONObject("factory"));
    if(callback==null||callback.getCreatorUid()!=android.os.Process.myUid())continue;
    JSONArray values=r.getJSONArray("filters");int[] filters=new int[values.length()];for(int j=0;j<filters.length;j++)filters[j]=values.getInt(j);
    Subscription s=new Subscription(r.getString("id"),callback,r.getBoolean("transition"),r.getLong("interval"),filters);
    subscriptions.put(s.id,s);Trace.write(app,"subscription_reacquired","transition="+s.transition);
   }
   if(!subscriptions.isEmpty())main.post(ReceiverRuntime::hello);
  }catch(Exception e){Trace.write(app,"registry_recovery_failed",e.getClass().getSimpleName());}
 }
 private static final class Subscription {
  final String id;final PendingIntent callback,recovery;final boolean transition;final long interval;final int[] filters;
  int virtual=-1;boolean entered;
  Subscription(String id,PendingIntent p,boolean transition,long interval,int[] filters){
   this.id=id;callback=p;this.transition=transition;this.interval=interval;this.filters=filters==null?new int[0]:filters.clone();
   Bundle saved=save();Intent intent=new Intent(app,RecoveryReceiver.class).setData(Uri.parse("activity-spoof://recovery/"+id)).putExtra("subscription",saved);
   recovery=PendingIntent.getBroadcast(app,0,intent,PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE);
  }
  Bundle save(){Bundle b=new Bundle();b.putString("id",id);b.putParcelable("callback",callback);b.putBoolean("transition",transition);b.putLong("interval",interval);b.putIntArray("filters",filters);return b;}
  boolean wants(int activity,int event){for(int i=0;i+1<filters.length;i+=2)if(filters[i]==activity&&filters[i+1]==event)return true;return false;}
 }
 static synchronized void restore(Bundle b){
  if(b==null)return;String id=b.getString("id");PendingIntent callback=b.getParcelable("callback");
  if(id==null||callback==null||subscriptions.containsKey(id)||callback.getCreatorUid()!=android.os.Process.myUid())return;
  Subscription s=new Subscription(id,callback,b.getBoolean("transition"),b.getLong("interval"),b.getIntArray("filters"));
  subscriptions.put(id,s);Trace.write(app,"subscription_restored","transition="+s.transition);Claim winner=winner();if(winner!=null)deliver(s,-1,winner.activity,winner.confidence);
 }
 static synchronized Bundle capabilities(){Bundle b=new Bundle();ArrayList<PendingIntent> tokens=new ArrayList<>();for(Subscription s:subscriptions.values())tokens.add(s.recovery);b.putParcelableArrayList("recovery",tokens);b.putInt("count",tokens.size());Claim winner=winner();b.putInt("effective_activity",winner==null?-1:winner.activity);b.putLong("dispatch_count",dispatchCount);b.putLong("last_dispatch_ms",lastDispatch);return b;}
 private static final class Claim {
  int activity,confidence;long sequence,priority;IBinder lifetime;IBinder.DeathRecipient death;
 }
 static void claim(int uid,Bundle b){
  final Bundle copy=new Bundle(b);main.post(()->accept(uid,copy));
 }
 private static synchronized void accept(int uid,Bundle b){
  String session=b.getString("session");IBinder lifetime=b.getBinder("lifetime");int type=b.getInt("activity",-1),confidence=b.getInt("confidence",-1);long sequence=b.getLong("sequence",-1);
  if(session==null||session.length()>80||lifetime==null||!Transmitter.valid(type)||confidence<0||confidence>100||sequence<0)return;
  String source=uid+":"+session;Claim old=claims.get(source);
  if(sequence<=lastSequences.getOrDefault(source,-1L)||!lifetime.isBinderAlive())return;
  lastSequences.put(source,sequence);if(lastSequences.size()>256)lastSequences.remove(lastSequences.keySet().iterator().next());
  Claim before=winner();int previous=before==null?-1:before.activity, previousConfidence=before==null?-1:before.confidence;
  if(!b.getBoolean("active")){
   if(old==null)return;claims.remove(source);old.lifetime.unlinkToDeath(old.death,0);
  }else{
   Claim next=old==null?new Claim():old;
   boolean changed=old==null||old.activity!=type||old.confidence!=confidence;
   next.activity=type;next.confidence=confidence;next.sequence=sequence;if(changed)next.priority=++order;
   if(old==null){next.lifetime=lifetime;next.death=()->main.post(()->gone(source));try{lifetime.linkToDeath(next.death,0);}catch(RemoteException e){return;}}
   claims.put(source,next);
  }
  Claim after=winner();int current=after==null?-1:after.activity;
  Trace.write(app,"claim","activity="+current+" sources="+claims.size()+" sequence="+sequence);
  if(previous!=current||before!=null&&after!=null&&previousConfidence!=after.confidence)
   for(Subscription s:new ArrayList<>(subscriptions.values()))deliver(s,previous,current,after==null?0:after.confidence);
 }
 private static synchronized void gone(String source){Claim before=winner();Claim removed=claims.remove(source);if(removed==null)return;Claim after=winner();int previous=before==null?-1:before.activity,current=after==null?-1:after.activity;Trace.write(app,"source_died","remaining="+claims.size());if(previous!=current)for(Subscription s:new ArrayList<>(subscriptions.values()))deliver(s,previous,current,after==null?0:after.confidence);}
 private static Claim winner(){Claim best=null;for(Claim c:claims.values())if(best==null||c.priority>best.priority)best=c;return best;}
 static synchronized void realTransitions(Object result){
  if(result==null)return;
  try{for(Object event:(List<?>)Sdk.call(result,"getTransitionEvents")){
   int type=((Number)Sdk.call(event,"getActivityType")).intValue();
   int direction=((Number)Sdk.call(event,"getTransitionType")).intValue();
   if(direction==0)realActivities.add(type);else realActivities.remove(type);
  }}catch(Exception e){Trace.write(app,"real_transition_cache_failed",e.getClass().getSimpleName());}
 }
 static synchronized boolean active(){return winner()!=null&&permitted();}
 static synchronized Object sampleOverride(Object genuine)throws Exception{
  if(genuine!=null)lastRealSample=genuine;Claim c=winner();return c==null||!permitted()||genuine==null?genuine:Sdk.sample(c.activity,c.confidence);
 }
 private static void deliver(Subscription s,int previous,int current,int confidence){
  if(!permitted()){Trace.write(app,"dispatch_suppressed","physical_activity_permission_missing");return;}
  try{
   Object result;
   if(s.transition){
    ArrayList<int[]> events=new ArrayList<>();
    if(s.entered&&s.virtual!=current&&s.wants(s.virtual,1))events.add(new int[]{s.virtual,1});
    if(!s.entered&&current>=0)for(int real:realActivities)if(real!=current&&s.wants(real,1))events.add(new int[]{real,1});
    if(current>=0&&s.virtual!=current&&s.wants(current,0))events.add(new int[]{current,0});
    if(current<0)for(int real:realActivities)if(s.wants(real,0))events.add(new int[]{real,0});
    s.entered=current>=0;s.virtual=current;
    if(events.isEmpty())return;
    result=Sdk.transitions(events);
   }else{if(current<0){if(lastRealSample==null)return;result=lastRealSample;}else result=Sdk.sample(current,confidence);s.virtual=current;}
   s.callback.send(app,0,Sdk.payload(result,s.transition));dispatchCount++;lastDispatch=SystemClock.elapsedRealtime();
   Trace.write(app,"callback_dispatched","transition="+s.transition+" activity="+current);
  }catch(PendingIntent.CanceledException e){subscriptions.remove(s.id);s.recovery.cancel();persist();Trace.write(app,"subscription_cancelled","transition="+s.transition);}
   catch(Exception e){Trace.write(app,"dispatch_failed",e.getClass().getSimpleName()+":"+e.getMessage());}
 }
 /** Registration notification is a short query; it doesn't keep an inactive transmitter alive. */
 private static void hello(){
  if(app==null)return;
  for(ResolveInfo r:app.getPackageManager().queryIntentServices(new Intent(Wire.TX),0)){
   ComponentName name=new ComponentName(r.serviceInfo.packageName,r.serviceInfo.name);
   if(probes.containsKey(name)||!Wire.trusted(app,name))continue;
   ServiceConnection connection=new ServiceConnection(){
    public void onServiceConnected(ComponentName n,IBinder binder){
     try{Bundle query=Wire.request("hello");query.putParcelable("receiver",new ComponentName(app,Endpoint.class));Bundle state=Wire.call(binder,query);if(state.getBoolean("active")){
      int uid=app.getPackageManager().getPackageUid(n.getPackageName(),0);claim(uid,state);
     }}catch(Exception e){Trace.write(app,"hello_failed",e.getClass().getSimpleName());}
     finally{close();}
    }
    void close(){try{app.unbindService(this);}catch(RuntimeException ignored){}probes.remove(name);}
    public void onServiceDisconnected(ComponentName n){close();}
    public void onNullBinding(ComponentName n){close();}
   };
   probes.put(name,connection);try{if(!app.bindService(new Intent().setComponent(name),connection,Context.BIND_AUTO_CREATE))probes.remove(name);}catch(RuntimeException e){probes.remove(name);}
  }
 }
}
