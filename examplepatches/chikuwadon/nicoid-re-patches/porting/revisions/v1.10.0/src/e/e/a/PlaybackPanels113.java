package e.e.a;
import android.app.Activity;
import android.view.*;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
/** A visible Activity has one playback panel and one padding reservation. */
public final class PlaybackPanels113 {
 static final WeakHashMap<Activity,Entry> PANELS=new WeakHashMap<>();
 static final class Entry {
  final WeakReference<View> panel,body;final WeakReference<Object> owner;final int base,height;
  Entry(View p,View b,Object o,int h){panel=new WeakReference<>(p);body=new WeakReference<>(b);owner=new WeakReference<>(o);base=b==null?0:b.getPaddingBottom();height=h;}
  void remove(){View p=panel.get();if(p!=null&&p.getParent() instanceof ViewGroup)((ViewGroup)p.getParent()).removeView(p);View b=body.get();if(b!=null&&b.getPaddingBottom()==base+height)b.setPadding(b.getPaddingLeft(),b.getPaddingTop(),b.getPaddingRight(),base);}
 }
 static void claim(Activity a,View panel,View body,int height,Object owner){
  Entry old=PANELS.get(a);if(old!=null&&old.panel.get()==panel)return;PANELS.remove(a);if(old!=null){old.remove();Object o=old.owner.get();if(o!=owner){if(o instanceof DirectBackground235.State)((DirectBackground235.State)o).detach();else if(o instanceof MiniSession225.Session)((MiniSession225.Session)o).detach();}}
  PlaybackBar221.remove();
  ViewGroup content=a.findViewById(android.R.id.content);
  if(content!=null)for(int n=content.getChildCount()-1;n>=0;n--){View v=content.getChildAt(n);if(v!=panel&&"nicoid-retained-mini-player".equals(v.getTag()))content.removeViewAt(n);}
  Entry entry=new Entry(panel,body,owner,height);PANELS.put(a,entry);if(body!=null)body.setPadding(body.getPaddingLeft(),body.getPaddingTop(),body.getPaddingRight(),entry.base+height);
 }
 static void release(Activity a,View panel){if(a==null)return;Entry entry=PANELS.get(a);if(entry!=null&&entry.panel.get()==panel){PANELS.remove(a);entry.remove();}else if(panel!=null&&panel.getParent() instanceof ViewGroup)((ViewGroup)panel.getParent()).removeView(panel);}
}
