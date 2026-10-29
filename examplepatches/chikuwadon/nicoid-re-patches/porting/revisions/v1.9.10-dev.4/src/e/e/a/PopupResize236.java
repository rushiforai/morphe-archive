package e.e.a;
import android.view.*;import android.content.*;import java.util.*;
/** Corner streams update the same width as pinch and control layout; drag stays native. */
public final class PopupResize236 {
 static final Map<Object,Drag> drags=new WeakHashMap<>();
 static final class Drag {float downX,downY,ratio;int x,y,width,height,outer;boolean left,top;}
 static int[] corner(Drag d,float dx,float dy,int sw,int sh,int min){float dh=d.top?-dy:dy;float dw=d.left?-dx:dx;float delta=(dw*d.ratio+dh)/(d.ratio*d.ratio+1);int h=Math.max(min,Math.round(d.height+delta));int maxW=d.left?d.x+d.width:sw-d.x;int maxH=(d.top?d.y+d.outer:sh-d.y)-(d.outer-d.height);h=Math.max(1,Math.min(h,Math.min(Math.round(maxW/d.ratio),maxH)));int w=Math.max(1,Math.round(h*d.ratio));return new int[]{w,h,d.left?d.x+d.width-w:d.x,d.top?d.y+d.height-h:d.y};}
 public static boolean touch(Object owner,View view,MotionEvent e){if(DirectBackground235.owns(owner))return true;int action=e.getActionMasked();Drag d=drags.get(owner);
  try{if(action==MotionEvent.ACTION_DOWN){drags.remove(owner);View root=(View)Playback214.get(owner,"a");WindowManager.LayoutParams p=(WindowManager.LayoutParams)Playback214.get(owner,"U");int[] pos=new int[2];root.getLocationOnScreen(pos);float x=e.getRawX()-pos[0],y=e.getRawY()-pos[1];float edge=PanelUi.dp(root.getContext(),30);if(!((x<edge||x>root.getWidth()-edge)&&(y<edge||y>root.getHeight()-edge)))return false;
    d=new Drag();d.downX=e.getRawX();d.downY=e.getRawY();d.ratio=PopupAspect214.ratio(owner);d.x=p.x;d.y=p.y;d.width=p.width>0?p.width:root.getWidth();d.height=PopupAspect214.height(owner,d.width);d.outer=p.height>0?p.height:root.getHeight();d.left=x<edge;d.top=y<edge;drags.put(owner,d);owner.getClass().getField("f0").setFloat(owner,0);return true;}
   if(d==null)return false;
   if(action==MotionEvent.ACTION_MOVE){int[] b=corner(d,e.getRawX()-d.downX,e.getRawY()-d.downY,Playback214.number(owner,"o"),Playback214.number(owner,"p")-Math.max(0,Playback214.number(owner,"l")),Math.max(1,Math.round((Float)Playback214.get(owner,"T"))));PopupLayout236.request(owner,b[0],b[2],b[3]);}
   if(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL){drags.remove(owner);save(owner);}
   return true;
  }catch(Exception ex){drags.remove(owner);android.util.Log.w("nicoid-popup","Corner resize failed",ex);return d!=null;}
 }
 public static void cancel(Object owner){drags.remove(owner);}
 public static void save(Object owner){try{WindowManager.LayoutParams p=(WindowManager.LayoutParams)Playback214.get(owner,"U");SharedPreferences prefs=(SharedPreferences)Playback214.get(owner,"Q");prefs.edit().putInt("pop_ivw",p.width).putInt("pop_poh",PopupAspect214.height(owner,p.width)).putInt("pop_pox",p.x).putInt("pop_poy",p.y).apply();android.util.Log.i("nicoid-popup","Popup bounds saved "+p.width+"x"+p.height+" at "+p.x+","+p.y);}catch(Exception e){android.util.Log.w("nicoid-popup","Cannot save popup bounds",e);}}
}
