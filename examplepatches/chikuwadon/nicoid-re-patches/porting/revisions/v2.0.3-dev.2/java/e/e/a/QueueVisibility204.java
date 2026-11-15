package e.e.a;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.view.View;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Update native previous/next controls synchronously with playback preferences. */
public final class QueueVisibility204 {
 private static final WeakHashMap<View,Watch> WATCHES=new WeakHashMap<>();
 private QueueVisibility204(){}
 public static void attach(View root) {
  if(root==null||WATCHES.containsKey(root))return;
  Watch watcher=new Watch(root);
  WATCHES.put(root,watcher);
  root.addOnAttachStateChangeListener(watcher);
  if(root.isAttachedToWindow())watcher.onViewAttachedToWindow(root);
 }
 private static final class Watch implements SharedPreferences.OnSharedPreferenceChangeListener,
      View.OnAttachStateChangeListener {
  final WeakReference<View> reference;
  final SharedPreferences prefs;
  boolean registered;
  Boolean last;
  Watch(View root){
   reference=new WeakReference<>(root);
   prefs=PreferenceManager.getDefaultSharedPreferences(root.getContext());
  }
  @Override public void onSharedPreferenceChanged(SharedPreferences p,String key){
   if("continuous_play".equals(key)||"continuous_play_mode".equals(key))refresh();
  }
  @Override public void onViewAttachedToWindow(View v){
   if(!registered){prefs.registerOnSharedPreferenceChangeListener(this);registered=true;}
   refresh();
  }
  @Override public void onViewDetachedFromWindow(View v){
   if(registered){prefs.unregisterOnSharedPreferenceChangeListener(this);registered=false;}
   last=null;
  }
  void refresh(){
   View root=reference.get();
   if(root==null)return;
   if(!prefs.contains("continuous_play"))return;
   boolean enabled=prefs.getBoolean("continuous_play",false);
   if(last!=null&&last.booleanValue()==enabled)return;
   last=enabled;
   String pkg=root.getContext().getPackageName();
   for(String key:new String[]{"prevbutton","nextbutton"}){
    int id=root.getResources().getIdentifier(key,"id",pkg);
    View button=id==0?null:root.findViewById(id);
    if(button!=null)button.setVisibility(enabled?View.VISIBLE:View.GONE);
   }
  }
 }
}
