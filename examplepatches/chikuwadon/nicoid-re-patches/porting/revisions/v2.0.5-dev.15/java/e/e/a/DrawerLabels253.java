package e.e.a;
import android.app.Activity;
import android.os.SystemClock;
import android.preference.PreferenceManager;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/** Localize the legacy native drawer group header without replacing its menu. */
public final class DrawerLabels253 {
 private DrawerLabels253(){}
 private static final WeakHashMap<Activity,Watcher> WATCHERS=new WeakHashMap<>();
 /** Native drawer headers are rebound after the first open frame. */
 public static void install(Activity activity){
  if(activity==null||activity.isFinishing()||activity.isDestroyed())return;
  View root=activity.getWindow().getDecorView();
  if(root==null)return;
  Watcher watcher=WATCHERS.get(activity);
  if(watcher!=null&&watcher.root.get()==root){refresh(root);return;}
  if(watcher!=null)watcher.detach();
  watcher=new Watcher(root);
  WATCHERS.put(activity,watcher);
  watcher.attach();
  refresh(root);
 }
 private static final class Watcher implements ViewTreeObserver.OnPreDrawListener,
     ViewTreeObserver.OnGlobalLayoutListener,View.OnAttachStateChangeListener{
  final WeakReference<View> root;
  long checkedAt;
  Watcher(View view){root=new WeakReference<>(view);}
  void attach(){
   View v=root.get();if(v==null)return;
   ViewTreeObserver o=v.getViewTreeObserver();
   if(o.isAlive()){o.addOnGlobalLayoutListener(this);o.addOnPreDrawListener(this);}
   v.addOnAttachStateChangeListener(this);
  }
  void detach(){
   View v=root.get();if(v==null)return;
   ViewTreeObserver o=v.getViewTreeObserver();
   if(o.isAlive()){o.removeOnPreDrawListener(this);o.removeOnGlobalLayoutListener(this);}
   v.removeOnAttachStateChangeListener(this);
  }
  public void onGlobalLayout(){View v=root.get();if(v!=null)refresh(v);}
  public boolean onPreDraw(){
   long now=SystemClock.uptimeMillis();
   if(now-checkedAt>=80L){checkedAt=now;View v=root.get();if(v!=null)refresh(v);}
   return true;
  }
  public void onViewDetachedFromWindow(View v){detach();}
  public void onViewAttachedToWindow(View v){
   ViewTreeObserver o=v.getViewTreeObserver();
   if(o.isAlive()){o.addOnGlobalLayoutListener(this);o.addOnPreDrawListener(this);}
  }
 }

 public static void refresh(View root){
  if(root==null)return;
  String lang=PreferenceManager.getDefaultSharedPreferences(root.getContext())
     .getString("app_lang","0");
  UiStrings.selectLanguage(lang);
  int changed=update(root,PanelUi.tr(root.getContext(),"設定","Settings","設定"),0);
  if(changed>0)android.util.Log.i("nicoid-drawer","Localized native drawer section count="+changed);
 }
 private static int update(View view,String translated,int depth){
  if(view==null||depth>40||!view.isShown())return 0;
  int changed=0;
  if(view instanceof TextView){
   TextView t=(TextView)view;CharSequence old=t.getText();
   if(old!=null&&("Setting".equalsIgnoreCase(old.toString().trim())||
        "Settings".equalsIgnoreCase(old.toString().trim())||
        "設定".equals(old.toString().trim()))&&!translated.contentEquals(old)){
    t.setText(translated);
    changed++;
   }
  }
  if(view instanceof ViewGroup){
   ViewGroup g=(ViewGroup)view;
   for(int i=0;i<g.getChildCount();i++)changed+=update(g.getChildAt(i),translated,depth+1);
  }
  return changed;
 }
}
