package e.e.a;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.widget.ListView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.Map;
import java.util.WeakHashMap;

/** Restore tab positions while concealing lazy paging movements. */
public final class SmoothTabRestore204 {
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private static final Map<ListView,Job> JOBS=new WeakHashMap<>();
 private SmoothTabRestore204(){}
 static Object field(Object value,String name)throws Exception{
  for(Class<?> c=value.getClass();c!=null;c=c.getSuperclass()){
   try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(value);}
   catch(NoSuchFieldException ignored){}
  }
  throw new NoSuchFieldException(name);
 }
 /** Original native Host.restoreScroll calls this without re-creating the Host. */
 public static void restore(Object host,Object fragment,Object tab){
  try{
   if(host==null||fragment==null||tab==null||field(host,"current")!=fragment)return;
   Object value=field(fragment,"b0");
   if(value instanceof ListView)restoreList((ListView)value,
     (Integer)field(tab,"position"),(Integer)field(tab,"top"));
  }catch(Exception e){android.util.Log.w("nicoid-tabs","Cannot restore saved tab",e);}
 }
 public static void restoreList(ListView list,int index,int top){
  if(list==null||index<0||(index==0&&top==0))return;
  if(Looper.myLooper()!=Looper.getMainLooper()){
   WeakReference<ListView> target=new WeakReference<>(list);
   MAIN.post(()->restoreList(target.get(),index,top));return;
  }
  Job existing=JOBS.get(list);
  if(existing!=null&&existing.index==index&&existing.top==top)return;
  if(existing!=null)existing.cancel();
  int firstTop=list.getChildCount()>0?list.getChildAt(0).getTop():0;
  if(!ScrollRestorePolicy204.needs(index,top,list.getFirstVisiblePosition(),
         firstTop,list.getChildCount()>0))return;
  Job job=new Job(list,index,top);
  JOBS.put(list,job);
  job.start();
 }
 public static boolean restoring(ListView list){return list!=null&&JOBS.containsKey(list);}
 private static final class Mask extends Drawable{
  private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
  private final int background,foreground;
  private final String message;
  Mask(Context c){
   background=UiDialogs.surface(c);
   foreground=ThemeChoice.isNight(c)?0xffbbbbbb:0xff555555;
   message=PanelUi.tr(c,"前回の位置を読み込み中","Restoring previous position","正在還原上次的位置");
  }
  public void draw(Canvas canvas){
   paint.setStyle(Paint.Style.FILL);paint.setColor(background);
   canvas.drawRect(getBounds(),paint);
   paint.setColor(foreground);paint.setTextAlign(Paint.Align.CENTER);
   paint.setTextSize(14f*canvas.getDensity()/160f);
   canvas.drawText(message,getBounds().exactCenterX(),getBounds().exactCenterY(),paint);
  }
  public void setAlpha(int a){paint.setAlpha(a);invalidateSelf();}
  public void setColorFilter(ColorFilter f){paint.setColorFilter(f);invalidateSelf();}
  public int getOpacity(){return PixelFormat.OPAQUE;}
 }
 private static final class Job implements Runnable{
  final WeakReference<ListView> target;
  final WeakReference<Drawable> previous;
  final Drawable mask;
  final int index,top;
  final long started=SystemClock.uptimeMillis();
  int attempts,lastSize=-1,checks;
  boolean everAttached,verifying;
  Job(ListView list,int index,int top){
   target=new WeakReference<>(list);previous=new WeakReference<>(list.getForeground());
   mask=new Mask(list.getContext());this.index=index;this.top=top;
  }
  void start(){
   ListView list=target.get();
   if(list!=null){list.setForeground(mask);run();}
  }
  void cancel(){
   MAIN.removeCallbacks(this);
   ListView list=target.get();
   if(list!=null){
    if(JOBS.get(list)==this)JOBS.remove(list);
    if(list.getForeground()==mask)list.setForeground(previous.get());
    list.invalidate();
   }
  }
  public void run(){
   ListView list=target.get();
   if(list==null||JOBS.get(list)!=this)return;
   boolean attached=list.isAttachedToWindow();
   if((everAttached&&!attached)||(attached&&!list.isShown())
       ||SystemClock.uptimeMillis()-started>12000L||++attempts>75){
    cancel();return;
   }
   everAttached|=attached;
   int count=list.getCount();
   if(attached&&list.getHeight()>0&&ScrollRestorePolicy204.loaded(count,index)){
    if(!verifying){verifying=true;list.setSelectionFromTop(index,top);}
    MAIN.postDelayed(()->{
     ListView current=target.get();
     if(current==null||JOBS.get(current)!=this)return;
     int actual=current.getFirstVisiblePosition();
     if(Math.abs(actual-index)<=1||++checks>3)cancel();
     else{verifying=false;MAIN.postDelayed(this,32);}
    },32);
    return;
   }
   int next=ScrollRestorePolicy204.next(count,index,lastSize);
   if(attached&&list.getHeight()>0&&next>=0){
    lastSize=count;list.setSelectionFromTop(next,0);
   }
   MAIN.postDelayed(this,attempts<15?110:210);
  }
 }
}
