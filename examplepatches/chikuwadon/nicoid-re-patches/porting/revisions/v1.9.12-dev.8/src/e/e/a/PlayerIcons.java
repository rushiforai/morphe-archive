package e.e.a;
import android.content.res.ColorStateList;
import android.graphics.*;
import android.graphics.drawable.*;
import android.util.TypedValue;
import android.view.*;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
/** Resolution-independent player symbols, with resource-driven state preserved. */
public final class PlayerIcons {
 private static final java.util.Map<View,Boolean> TABLET=new java.util.WeakHashMap<>();
 private static final java.util.Map<View,Runnable> WATCHERS=new java.util.WeakHashMap<>();
 private static final java.util.Map<View,Boolean> PLAYING=new java.util.WeakHashMap<>();
 public static void tablet(View root,boolean enabled){TABLET.put(root,enabled);normalCenter(root);}
 private static boolean supported(String n){return java.util.Arrays.asList("play","pause","prev","next","popup","repeaton","repeatoff","commenton","commentoff","commentpost","info","fullscreen","fullscreenoff","fullscreenon","exitfullscreen","close").contains(n);}
 public static void background(View v,int resource){String name="";try{name=v.getResources().getResourceEntryName(resource);}catch(Exception ignored){}if(!supported(name)){v.setBackgroundResource(resource);return;}apply(v,name);}
 public static Drawable gestureIcon(int target){return new Icon(target==1?"volume":"brightness",false);}
 public static Drawable miniIcon(Context context,String name){Icon icon=new Icon(name,false);icon.ink=ThemeChoice.accent(context);return icon;}
 public static void symbol(View v,String name){apply(v,name);}
 public static void playing(Object fragment,boolean playing){try{View root=(View)fragment.getClass().getField("x1").get(fragment);if(root==null){Object parent=fragment.getClass().getField("a").get(fragment);if(parent!=null)root=(View)parent.getClass().getField("x1").get(parent);}if(root==null)return;View button=find(root,"viewbutton");if(button!=null)apply(button,playing?"pause":"play");}catch(Exception e){android.util.Log.w("nicoid-player","Playback control state update failed",e);}}
 private static void apply(View v,String name){TypedValue a=new TypedValue();v.getContext().getTheme().resolveAttribute(0x7f03005e,a,true);int accent=a.resourceId==0?a.data:v.getResources().getColor(a.resourceId);Icon icon=new Icon(name,!(v.getParent() instanceof android.widget.RelativeLayout));icon.owner=new java.lang.ref.WeakReference<>(v);GradientDrawable mask=new GradientDrawable();mask.setColor(Color.WHITE);mask.setShape(GradientDrawable.OVAL);v.setBackgroundTintList(null);v.setBackground(new RippleDrawable(ColorStateList.valueOf((accent&0xffffff)|0x55000000),icon,mask));}
 public static void attach(View root){if(root==null)return;String pkg=root.getContext().getPackageName();String[][] icons={{"viewbutton","play"},{"prevbutton","prev"},{"nextbutton","next"},{"popupbutton","popup"},{"repeatbutton","repeaton"},{"commentbutton","commentoff"},{"fullscbutton","fullscreen"},{"commentpostbutton","commentpost"},{"infobutton","info"}};for(String[] entry:icons){View v=root.findViewById(root.getResources().getIdentifier(entry[0],"id",pkg));if(v!=null&&!(v.getBackground() instanceof RippleDrawable))apply(v,entry[1]);}if(!(root instanceof PopupPinchLayout)){View container=find(root,"viewctrllay");if(container!=null&&!"centered-play-control".equals(container.getTag())){container.setTag("centered-play-control");root.addOnLayoutChangeListener((v,l,t,r,b,ol,ot,or,ob)->normalCenter(root));}root.post(()->normalCenter(root));watchPlayback(root);}}
 /** Map values must not strongly retain their weak View keys, including while detached. */
 private static final class PlaybackWatcher implements Runnable,View.OnAttachStateChangeListener {
  final java.lang.ref.WeakReference<View> owner;
  PlaybackWatcher(View root){owner=new java.lang.ref.WeakReference<>(root);}
  public void run(){View root=owner.get();if(root==null||!root.isAttachedToWindow())return;try{Activity a=activity(root.getContext());Object fragment=a==null?null:Review181.field(a,"v");Object player=fragment==null?null:Review181.field(fragment,"a0");boolean playing=player!=null&&(Boolean)player.getClass().getMethod("isPlaying").invoke(player);View button=find(root,"viewbutton");if(button!=null&&!java.util.Objects.equals(PLAYING.get(button),playing)){PLAYING.put(button,playing);apply(button,playing?"pause":"play");}}catch(Exception ignored){}root.postDelayed(this,400);}
  public void onViewAttachedToWindow(View v){v.removeCallbacks(this);v.post(this);}
  public void onViewDetachedFromWindow(View v){v.removeCallbacks(this);View button=find(v,"viewbutton");if(button!=null)PLAYING.remove(button);}
 }
 private static void watchPlayback(View root){synchronized(WATCHERS){if(WATCHERS.containsKey(root))return;PlaybackWatcher poll=new PlaybackWatcher(root);WATCHERS.put(root,poll);root.addOnAttachStateChangeListener(poll);View control=find(root,"viewbutton");if(control!=null)control.setOnClickListener(v->{try{Activity owner=activity(root.getContext());Object f=owner==null?null:Review181.field(owner,"v");if(f==null)return;Object player=Review181.field(f,"a0");boolean ready=player!=null&&((Number)player.getClass().getMethod("getDuration").invoke(player)).longValue()>0;java.lang.reflect.Field cache=f.getClass().getField("L0");boolean previous=cache.getBoolean(f);try{if(ready)cache.setBoolean(f,false);f.getClass().getMethod("f0").invoke(f);}finally{cache.setBoolean(f,previous);}}catch(Exception e){android.util.Log.w("nicoid-player","Unable to toggle playback",e);}});if(root.isAttachedToWindow())root.post(poll);}}
 private static Activity activity(Context c){for(int depth=0;depth<8&&c instanceof ContextWrapper;depth++){if(c instanceof Activity)return (Activity)c;Context next=((ContextWrapper)c).getBaseContext();if(next==c)break;c=next;}return c instanceof Activity?(Activity)c:null;}
 private static View find(View root,String name){return root.findViewById(root.getResources().getIdentifier(name,"id",root.getContext().getPackageName()));}
 private static void normalCenter(View root){if(PlayerControlsDock.enabled(root.getContext()))return;View video=find(root,"videoLayout"),play=find(root,"viewbutton");if(video==null||play==null)return;float density=root.getResources().getDisplayMetrics().density;boolean full=root.getResources().getConfiguration().orientation==android.content.res.Configuration.ORIENTATION_LANDSCAPE||video.getHeight()>300*density;int side=Math.round((Boolean.TRUE.equals(TABLET.get(root))?88:(full?72:56))*density);ViewGroup.LayoutParams p=play.getLayoutParams();if(p.width!=side||p.height!=side){p.width=side;p.height=side;play.setLayoutParams(p);}center(root);}
 public static void center(View root){if(PlayerControlsDock.enabled(root.getContext()))return;View video=find(root,"videoLayout"),container=find(root,"viewctrllay");if(video==null||container==null||video.getHeight()==0||container.getHeight()==0)return;int[] target=new int[2],position=new int[2];video.getLocationOnScreen(target);container.getLocationOnScreen(position);float delta=target[1]+video.getHeight()/2f-position[1]-container.getHeight()/2f;if(Math.abs(delta)>.5f)container.setTranslationY(container.getTranslationY()+delta);}
 static boolean fullscreenIcon(View v){if(v==null||v.getResources().getConfiguration().orientation!=android.content.res.Configuration.ORIENTATION_LANDSCAPE)return false;Activity a=activity(v.getContext());if(a==null||!a.getClass().getName().equals("com.sauzask.nicoid.NicoidVideoActivity"))return false;for(ViewParent p=v.getParent();p instanceof View;p=p.getParent())if(p instanceof PopupPinchLayout)return false;return true;}
 static final class Icon extends Drawable {
  final String name;final boolean surface;final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);int alpha=255,ink=Color.WHITE;java.lang.ref.WeakReference<View> owner;
  Icon(String n,boolean s){name=n;surface=s;}
  View iconOwner(){if(owner!=null)return owner.get();Drawable.Callback callback=getCallback();for(int depth=0;depth<8&&callback!=null;depth++){if(callback instanceof View)return (View)callback;if(!(callback instanceof Drawable))break;Drawable.Callback next=((Drawable)callback).getCallback();if(next==callback)break;callback=next;}return null;}
  float glyphScale(){return fullscreenIcon(iconOwner())?.62f:.82f;}
  private void line(Canvas c,float... xy){Path p=new Path();p.moveTo(xy[0],xy[1]);for(int i=2;i<xy.length;i+=2)p.lineTo(xy[i],xy[i+1]);c.drawPath(p,paint);}
  public void draw(Canvas c){Rect b=getBounds();if(surface&&(name.equals("info")||name.equals("commentpost"))){paint.setColor(0x77000000);paint.setStyle(Paint.Style.FILL);float radius=Math.min(b.width(),b.height())*.16f;c.drawRoundRect(b.left,b.top,b.right,b.bottom,radius,radius,paint);}boolean central=name.equals("play")||name.equals("pause");float side=Math.min(b.width(),b.height())*glyphScale();int saved=c.save();c.translate(b.exactCenterX()-side/2,b.exactCenterY()-side/2);c.scale(side/24,side/24);paint.setColor(ink);paint.setAlpha(alpha);paint.setStrokeWidth(1.8f);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);paint.setStyle(Paint.Style.STROKE);
   switch(name){
    case "muted":case "mute":line(c,3,9,7,9,12,5,12,19,7,15,3,15,3,9);line(c,16,9,22,15);line(c,22,9,16,15);break;
    case "headphones":case "background":c.drawArc(4,3,20,21,180,180,false,paint);line(c,4,12,4,20,8,20,8,12,4,12);line(c,20,12,20,20,16,20,16,12,20,12);break;
    case "volume":line(c,3,9,7,9,12,5,12,19,7,15,3,15,3,9);c.drawArc(9,6,21,18,-55,110,false,paint);c.drawArc(12,9,18,15,-55,110,false,paint);break;
    case "brightness":c.drawCircle(12,12,4,paint);for(int i=0;i<8;i++){double angle=i*Math.PI/4;line(c,12+(float)Math.cos(angle)*7,12+(float)Math.sin(angle)*7,12+(float)Math.cos(angle)*10,12+(float)Math.sin(angle)*10);}break;
    case "play":Path p=new Path();p.moveTo(6,3);p.lineTo(20,12);p.lineTo(6,21);p.close();paint.setColor(0xaa000000);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(.75f);c.drawPath(p,paint);paint.setColor(ink);paint.setAlpha(alpha);paint.setStyle(Paint.Style.FILL);c.drawPath(p,paint);break;
    case "pause":paint.setColor(0xaa000000);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(.75f);c.drawRoundRect(6,3,10,21,1,1,paint);c.drawRoundRect(14,3,18,21,1,1,paint);paint.setColor(ink);paint.setAlpha(alpha);paint.setStyle(Paint.Style.FILL);c.drawRoundRect(6,3,10,21,1,1,paint);c.drawRoundRect(14,3,18,21,1,1,paint);break;
    case "prev":case "next":boolean next=name.equals("next");paint.setStyle(Paint.Style.FILL);Path skip=new Path();skip.moveTo(next?5:19,5);skip.lineTo(next?16:8,12);skip.lineTo(next?5:19,19);skip.close();c.drawPath(skip,paint);c.drawRoundRect(next?17:4,5,next?20:7,19,1,1,paint);break;
    case "popup":c.drawRoundRect(3,4,21,20,2,2,paint);paint.setStyle(Paint.Style.FILL);c.drawRoundRect(12,12,19,18,1,1,paint);break;
    case "repeaton":case "repeatoff":line(c,4,9,4,6,20,6,17,3);line(c,20,15,20,18,4,18,7,21);if(name.endsWith("off"))line(c,3,3,21,21);break;
    case "commenton":case "commentoff":line(c,4,4,20,4,20,17,11,17,6,21,6,17,4,17,4,4);if(name.endsWith("off"))line(c,3,2,22,21);else{line(c,8,9,16,9);line(c,8,13,14,13);}break;
    case "commentpost":line(c,4,5,20,5,20,16,11,16,6,21,6,16,4,16,4,5);line(c,8,10,16,10);line(c,12,7,12,13);break;
    case "close":line(c,4.5f,4.5f,19.5f,19.5f);line(c,19.5f,4.5f,4.5f,19.5f);break;
    case "info":c.drawCircle(12,12,9,paint);line(c,12,11,12,17);paint.setStyle(Paint.Style.FILL);c.drawCircle(12,7,1.1f,paint);break;
    default:line(c,9,3,3,3,3,9);line(c,15,3,21,3,21,9);line(c,3,15,3,21,9,21);line(c,21,15,21,21,15,21);break;
   }c.restoreToCount(saved);
  }
  public Drawable.ConstantState getConstantState(){final String n=name;final boolean s=surface;final int color=ink,value=alpha;return new Drawable.ConstantState(){public Drawable newDrawable(){Icon copy=new Icon(n,s);copy.ink=color;copy.alpha=value;copy.owner=owner;return copy;}public int getChangingConfigurations(){return 0;}};}
  public void setAlpha(int a){alpha=a;invalidateSelf();}public void setColorFilter(ColorFilter f){paint.setColorFilter(f);invalidateSelf();}public int getOpacity(){return PixelFormat.TRANSLUCENT;}
 }
}
