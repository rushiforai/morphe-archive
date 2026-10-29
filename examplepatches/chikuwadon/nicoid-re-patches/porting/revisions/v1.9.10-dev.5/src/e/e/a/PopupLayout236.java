package e.e.a;

import android.graphics.Color;
import android.view.*;
import android.widget.*;
import java.util.*;

/** One authoritative popup window width. Media and controls have separate heights. */
public final class PopupLayout236 {
 static final Map<PopupControls193,Runnable> pending=new WeakHashMap<>();
 public static void schedule(final PopupControls193 b){if(DirectBackground235.owns(b.owner)||pending.containsKey(b))return;Runnable r=()->{pending.remove(b);if(b.root.isAttachedToWindow())layout(b);};pending.put(b,r);b.root.postOnAnimation(r);}
 public static void cancel(PopupControls193 b){Runnable r=pending.remove(b);if(r!=null)b.root.removeCallbacks(r);}
 static boolean size(View v,int w,int h){if(v==null)return false;ViewGroup.LayoutParams p=v.getLayoutParams();if(p==null)return false;if(p.width==w&&p.height==h)return false;p.width=w;p.height=h;v.setLayoutParams(p);return true;}
 static void rect(View v,int w,int h,int top){if(v==null)return;ViewGroup.LayoutParams p=v.getLayoutParams();if(!(p instanceof RelativeLayout.LayoutParams)){size(v,w,h);return;}RelativeLayout.LayoutParams q=(RelativeLayout.LayoutParams)p;
  boolean change=q.width!=w||q.height!=h||q.topMargin!=top||q.bottomMargin!=0||q.leftMargin!=0||q.rightMargin!=0;
  for(int rule:new int[]{RelativeLayout.ABOVE,RelativeLayout.BELOW,RelativeLayout.ALIGN_PARENT_BOTTOM,RelativeLayout.CENTER_IN_PARENT,RelativeLayout.CENTER_VERTICAL})if(q.getRule(rule)!=0){q.removeRule(rule);change=true;}
  if(q.getRule(RelativeLayout.ALIGN_PARENT_TOP)==0){q.addRule(RelativeLayout.ALIGN_PARENT_TOP);change=true;}
  if(change){q.width=w;q.height=h;q.topMargin=top;q.bottomMargin=q.leftMargin=q.rightMargin=0;v.setLayoutParams(q);}if(v.getTranslationY()!=0)v.setTranslationY(0);
 }
 public static void layout(PopupControls193 b){if(b.updating||DirectBackground235.owns(b.owner))return;b.updating=true;
  try{WindowManager.LayoutParams p=(WindowManager.LayoutParams)Playback214.get(b.owner,"U");int width=p.width>0?p.width:b.root.getWidth();if(width<=0)return;int media=PopupAspect214.height(b.owner,width);boolean separate=PlayerVisibility192.enabled(b.root.getContext(),true);
   int count=Math.max(1,Revision196.popupCount(b.row));int button=Math.max(1,Math.min(PanelUi.dp(b.root.getContext(),32),width/count));size(b.row,-1,button);Revision196.popupInfoSize(b.row,button);b.row.setGravity(Gravity.RIGHT|Gravity.CENTER_VERTICAL);b.row.setBackgroundColor(0xaa000000);
   for(int i=0;i<b.row.getChildCount();i++){View child=b.row.getChildAt(i);if(child.getVisibility()!=View.GONE){int slot=child==b.buttons.get("speed")||child==b.buttons.get("quality")?Math.round(button*1.35f):button;size(child,slot,button);}}
   int controller=b.controller==null?0:Math.max(1,b.controller.getMeasuredHeight());if(controller<=1)controller=PanelUi.dp(b.root.getContext(),48);
   int top=separate?button:0,outer=media+(separate?button+controller:0);
   size(b.stage,width,outer);rect(b.video,-1,media,top);rect(b.comments,-1,media,top);
   // The VideoView's parent is a LinearLayout: fill its viewport, never replace its size from measured output.
   View player=(View)Playback214.get(b.owner,"e");size(player,-1,-1);
   rect(b.menu,-1,separate?button:media,0);b.menu.setPadding(0,0,0,0);b.menu.setBackgroundColor(separate?Color.BLACK:Color.TRANSPARENT);
   rect(b.controller,-1,controller,separate?top+media:Math.max(0,media-controller));if(b.controller!=null)b.controller.setBackgroundColor(separate?Color.BLACK:0xaa000000);
   int center=Math.min(PanelUi.dp(b.root.getContext(),56),Math.max(1,media/3));size(PopupControls193.find(b.root,"viewbutton"),center,center);for(String key:new String[]{"prevbutton","nextbutton"})size(PopupControls193.find(b.root,key),center,center);
   rect(b.center,-1,center,top+(media-center)/2);
   View progress=PopupControls193.find(b.root,"videopro");if(progress!=null){int h=progress.getMeasuredHeight();rect(progress,progress.getLayoutParams().width,progress.getLayoutParams().height,top+Math.max(0,(media-h)/2));}
   if(b.comments!=null&&(b.fittedWidth!=width||b.fittedHeight!=media)){b.fittedWidth=width;b.fittedHeight=media;b.fitComments(b.comments,width,media);}
   CommentGraph215.attachPopup(b.owner);
   boolean changed=p.width!=width||p.height!=outer;p.width=width;p.height=outer;
   int x=PopupDrag195.clamp(p.x,Playback214.number(b.owner,"o"),width),y=PopupDrag195.clamp(p.y,Playback214.number(b.owner,"p")-Math.max(0,Playback214.number(b.owner,"l")),outer);changed|=x!=p.x||y!=p.y;p.x=x;p.y=y;
   b.owner.getClass().getField("w0").setFloat(null,media);b.owner.getClass().getField("u0").setInt(null,x);b.owner.getClass().getField("v0").setInt(null,y);
   if(separate){b.menu.setVisibility(View.VISIBLE);if(b.controller!=null)b.controller.setVisibility(View.VISIBLE);}
   if(changed&&b.root.isAttachedToWindow())((WindowManager)Playback214.get(b.owner,"b")).updateViewLayout(b.root,p);
  }catch(Exception e){android.util.Log.w("nicoid-popup","Popup layout failed",e);}finally{b.updating=false;}
 }
 public static void request(Object owner,int width,int x,int y){if(DirectBackground235.owns(owner))return;try{WindowManager.LayoutParams p=(WindowManager.LayoutParams)Playback214.get(owner,"U");boolean changed=p.width!=width||p.x!=x||p.y!=y;p.width=width;p.x=x;p.y=y;View root=(View)Playback214.get(owner,"a");PopupControls193 binding=PopupControls193.binding(root);if(binding!=null)layout(binding);if(changed&&root.isAttachedToWindow())((WindowManager)Playback214.get(owner,"b")).updateViewLayout(root,p);}catch(Exception e){android.util.Log.w("nicoid-popup","Popup resize failed",e);}}
}
