package e.e.a;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.SystemClock;
import android.view.View;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Suppress all overlapping native center playback/navigation glyphs during preparation. */
public final class PlayerStart207 {
 private static final WeakHashMap<View,Watch> ACTIVE=new WeakHashMap<>();
 private PlayerStart207(){}
 public static void install(View root){
  if(root==null||ACTIVE.containsKey(root))return;
  String[] names={"viewbutton","prevbutton","nextbutton"};
  View[] found=new View[names.length];
  for(int i=0;i<names.length;i++){
   int id=root.getResources().getIdentifier(names[i],"id",root.getContext().getPackageName());
   found[i]=id==0?null:root.findViewById(id);
  }
  if(found[0]==null)return;
  Watch watcher=new Watch(root,found);
  ACTIVE.put(root,watcher);watcher.start();
 }
 static Activity activity(Context c){
  for(int i=0;i<10&&c!=null;i++){
   if(c instanceof Activity)return (Activity)c;
   if(!(c instanceof ContextWrapper))break;
   Context next=((ContextWrapper)c).getBaseContext();
   if(next==c)break;c=next;
  }
  return null;
 }
 static final class Watch implements Runnable,View.OnAttachStateChangeListener {
  final WeakReference<View> root;
  final WeakReference<View>[] buttons;
  final boolean[] visible;
  final long started=SystemClock.uptimeMillis();
  Watch(View r,View[] views){
   root=new WeakReference<>(r);buttons=new WeakReference[views.length];
   visible=new boolean[views.length];
   for(int i=0;i<views.length;i++){
    buttons[i]=new WeakReference<>(views[i]);
    visible[i]=views[i]!=null&&views[i].getVisibility()==View.VISIBLE;
   }
  }
  void start(){
   View v=root.get();if(v==null)return;
   hide();v.addOnAttachStateChangeListener(this);v.post(this);
  }
  void hide(){
   for(int i=0;i<buttons.length;i++){
    View v=buttons[i].get();
    if(visible[i]&&v!=null&&v.getVisibility()==View.VISIBLE)
     v.setVisibility(View.INVISIBLE);
   }
  }
  void done(){
   View v=root.get();
   for(int i=0;i<buttons.length;i++){
    View b=buttons[i].get();
    if(b!=null&&visible[i]&&b.getVisibility()==View.INVISIBLE)b.setVisibility(View.VISIBLE);
   }
   if(v!=null){v.removeOnAttachStateChangeListener(this);ACTIVE.remove(v);}
  }
  @Override public void run(){
   View v=root.get();if(v==null)return;
   boolean ready=false;
   try{
    Activity a=activity(v.getContext());
    Object fragment=a==null?null:Review181.field(a,"v");
    Object player=fragment==null?null:Review181.field(fragment,"a0");
    if(player!=null){
     Object x=player.getClass().getMethod("getDuration").invoke(player);
     ready=x instanceof Number&&((Number)x).longValue()>0;
    }
   }catch(Exception ignored){}
   if(ready||SystemClock.uptimeMillis()-started>3500){done();return;}
   hide();v.postDelayed(this,65);
  }
  @Override public void onViewAttachedToWindow(View v){v.removeCallbacks(this);v.post(this);}
  @Override public void onViewDetachedFromWindow(View v){v.removeCallbacks(this);}
 }
}
