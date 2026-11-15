package e.e.a;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Hand off fullscreen before launching the next video, not after it. */
public final class FullscreenHandoff210 {
 private static final String EXTRA="nicoid_fullscreen_handoff208";
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private static final WeakHashMap<Activity,Gate> GATES=new WeakHashMap<>();
 static final class Gate {
  final long started=SystemClock.uptimeMillis();
  boolean finished, decoded;
}
 private FullscreenHandoff210(){}

 public static void mark(Object fragment,Intent intent){
  if(intent==null)return;
  try{
   Activity a=activity(fragment);
   if(a==null)return;
   // Native queue state is authoritative. Intent flags may still be false
   // even when the currently displayed fragment is immersive fullscreen.
   boolean full=intent.getBooleanExtra("isFullScreen",false)
       ||intent.getBooleanExtra("isLandscape",false)
       ||flag(fragment,"B0")
       ||flag(fragment,"C0");
   Window window=a.getWindow();
   // The fullscreen player uses immersive landscape without always setting
   // FLAG_FULLSCREEN. Reading only the flag missed the real navigation path.
   full=full||(window.getAttributes().flags&WindowManager.LayoutParams.FLAG_FULLSCREEN)!=0
       ||a.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE;
   if(!full)return;
   intent.putExtra("isFullScreen",true).putExtra("isLandscape",true)
       .putExtra(EXTRA,true).addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION);
   android.util.Log.i("nicoid-fullscreen","Next-video fullscreen marked before launch");
   ModernDebug.record("fullscreen-next intent marked before launch");
  }catch(Exception e){android.util.Log.w("nicoid-fullscreen","Unable to mark next video",e);}
 }

 /** First decoded picture is the only normal path to expose an incoming fullscreen window. */
 public static void firstFrame(View root){
  if(root==null)return;
  Activity activity=activity(root.getContext());
  if(activity==null)return;
  Gate gate=GATES.get(activity);
  if(gate==null||gate.finished)return;
  gate.decoded=true;
  ModernDebug.record("fullscreen-next decoded-frame received");
  root.post(()->attempt(activity,gate,0));
 }

 private static Activity activity(Context context){
  while(context instanceof ContextWrapper){
   if(context instanceof Activity)return (Activity)context;
   Context base=((ContextWrapper)context).getBaseContext();
   if(base==context)break;
   context=base;
  }
  return context instanceof Activity?(Activity)context:null;
 }

 /** The legacy activity reads player_rotation on every new video and can
  * overwrite the landscape handoff with portrait for a frame. Suppress only
  * that intermediate request; honor user rotation settings in all other paths. */
 public static void applyNativeRotation(Activity activity,int requested){
  if(activity==null)return;
  Intent intent=activity.getIntent();
  boolean handoff=intent!=null&&intent.getBooleanExtra(EXTRA,false)
      &&!intent.getBooleanExtra("nicoid_continue_mini203",false);
  if(!handoff){
   activity.setRequestedOrientation(requested);
   return;
  }
  int current=activity.getRequestedOrientation();
  if(current!=ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE)
   activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
  ModernDebug.record("fullscreen-next ignored intermediate native orientation="
      +requested+" maintained landscape="+activity.getRequestedOrientation());
 }

 private static boolean flag(Object owner,String field){
  if(owner==null)return false;
  try{return Boolean.TRUE.equals(Playback214.get(owner,field));}
  catch(Exception ignored){return false;}
 }
 private static Activity activity(Object source){
  if(source instanceof Activity)return (Activity)source;
  if(source==null)return null;
  try{
   Object a=Playback214.get(source,"A1");
   if(a instanceof Activity)return (Activity)a;
  }catch(Exception ignored){}
  try{
   Object a=source.getClass().getMethod("getActivity").invoke(source);
   if(a instanceof Activity)return (Activity)a;
  }catch(Exception ignored){}
  return null;
 }

 // Called immediately after startActivity on each independent queue path.
 // Remove the old Activity transition instead of letting it briefly show its
 // portrait content while Android switches to the new fullscreen window.
 public static void afterLaunch(Object source,Intent intent){
  if(intent==null||!intent.getBooleanExtra(EXTRA,false))return;
  Activity previous=activity(source);
  if(previous==null)return;
  previous.overridePendingTransition(0,0);
  android.util.Log.i("nicoid-fullscreen","Fullscreen next-video launch uses no transition");
  ModernDebug.record("fullscreen-next Activity launched without transition");
 }

 public static void beforeContent(Activity a){
  if(a==null||a.getIntent()==null||!a.getIntent().getBooleanExtra(EXTRA,false)
      ||a.getIntent().getBooleanExtra("nicoid_continue_mini203",false))return;
  Window w=a.getWindow();
  w.setBackgroundDrawable(new ColorDrawable(Color.BLACK));
  w.addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
  // Set the target orientation once before native onCreate applies the
  // user's default rotation preference. The patched native call must not
  // momentarily rotate this Activity back to portrait.
  if(a.getRequestedOrientation()!=ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE)
   a.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
  WindowManager.LayoutParams attr=w.getAttributes();
  attr.windowAnimations=0;
  attr.alpha=0f;w.setAttributes(attr);
  Gate gate=new Gate();GATES.put(a,gate);
  ModernDebug.record("fullscreen-next early landscape window initialized");
  WeakReference<Activity> ref=new WeakReference<>(a);
  MAIN.postDelayed(()->{
   Activity activity=ref.get();
   if(activity!=null&&GATES.get(activity)==gate)reveal(activity,gate,"timeout");
  },5500);
 }

 public static void prepared(Object fragment,boolean popup){
  if(popup||fragment==null)return;
  try{
   Activity a=activity(fragment);
   if(a==null)return;
   Gate gate=GATES.get(a);
   if(gate!=null) a.getWindow().getDecorView().post(()->attempt(a,gate,0));
  }catch(Exception e){android.util.Log.w("nicoid-fullscreen","Prepare inspection failed",e);}
 }

 private static void attempt(Activity a,Gate gate,int count){
  if(GATES.get(a)!=gate||gate.finished)return;
  if(a.isFinishing()||a.isDestroyed()){GATES.remove(a);return;}
  View decor=a.getWindow().getDecorView();
  int id=a.getResources().getIdentifier("videoLayout","id",a.getPackageName());
  View video=id==0?null:decor.findViewById(id);
  boolean landscape=a.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE
       &&decor.getWidth()>decor.getHeight();
  boolean picture=video!=null&&video.isShown()&&video.getWidth()>0&&video.getHeight()>0;
  if(gate.decoded&&landscape&&picture){
   reveal(a,gate,"decoded-landscape-frame");
  } else if(count<150) {
   decor.postDelayed(()->attempt(a,gate,count+1),30);
  } else {
   ModernDebug.record("fullscreen-next first-frame gate awaits timeout decoded="+gate.decoded
       +" landscape="+landscape+" picture="+picture);
  }
 }

 private static void reveal(Activity a,Gate gate,String reason){
  if(GATES.get(a)!=gate||gate.finished)return;
  gate.finished=true;GATES.remove(a);
  WindowManager.LayoutParams p=a.getWindow().getAttributes();
  p.alpha=1f;a.getWindow().setAttributes(p);
  a.overridePendingTransition(0,0);
  android.util.Log.i("nicoid-fullscreen","Fullscreen first-frame reveal "+reason);
  ModernDebug.record("fullscreen-next reveal "+reason);
 }
}
