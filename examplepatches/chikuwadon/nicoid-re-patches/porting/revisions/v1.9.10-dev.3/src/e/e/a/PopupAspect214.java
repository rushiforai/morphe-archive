package e.e.a;
import android.view.*;
import java.util.*;
public final class PopupAspect214 {
 private static final Map<Object,Float> RATIOS=new WeakHashMap<Object,Float>();
 public static float ratio(Object owner){try{int w=Playback214.number(owner,"i"),h=Playback214.number(owner,"g");if(w>0&&h>0)return (float)w/h;}catch(Exception e){}return 16f/9f;}
 public static int height(Object owner,int width){return Math.max(1,Math.round(width/ratio(owner)));}
 static void size(View v,int w,int h){if(v==null)return;ViewGroup.LayoutParams p=v.getLayoutParams();if(p!=null&&(p.width!=w||p.height!=h)){p.width=w;p.height=h;v.setLayoutParams(p);}}
 public static void changed(final Object owner){if(DirectBackground235.owns(owner))return;try{final View root=(View)Playback214.get(owner,"a");root.post(new Runnable(){public void run(){sync(owner);}});root.postDelayed(new Runnable(){public void run(){sync(owner);}},120);root.postDelayed(new Runnable(){public void run(){sync(owner);}},400);}catch(Exception e){}}
 public static void sync(Object owner){if(DirectBackground235.owns(owner))return;try{WindowManager.LayoutParams p=(WindowManager.LayoutParams)Playback214.get(owner,"U");float r=ratio(owner);Float old=RATIOS.put(owner,r);int width=p.width>0?p.width:((View)Playback214.get(owner,"e")).getWidth();if(old!=null&&Math.abs(old-r)>.001f)width=Math.round(width/old*r);width=Math.min(Math.max(1,width),Playback214.number(owner,"o"));PopupLayout236.request(owner,width,p.x,p.y);}catch(Exception e){android.util.Log.w("nicoid-popup","Aspect update failed",e);}}
}
