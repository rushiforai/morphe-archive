package app.haiagaru.tests.imagepaging;

import android.app.*;
import android.content.*;
import android.os.*;
import android.view.*;
import java.lang.reflect.*;
import java.net.*;
import java.io.*;
import java.util.*;
import java.util.concurrent.*;

// Full-screen native viewers use loopback images. Optional embedded mode opens the public test thread.
public final class ImagePagingInstrumentation extends Instrumentation {
 final String VIEWER="jp.syoboi.a2chMate.activity.ImagesViewer2Activity";
 final String[] KEYS={"imagePagingGestures","imagePagingNext","imagePagingPrevious"};
 Activity viewer;
 boolean embedded;
 Method index;
 int checks; Bundle diag;
 Object get(Class<?> c,String n,Object o)throws Exception{Field f=c.getDeclaredField(n);f.setAccessible(true);return f.get(o);}
 <T>T main(Callable<T> c)throws Exception{FutureTask<T> task=new FutureTask<>(c);runOnMainSync(task);return task.get(15,TimeUnit.SECONDS);}
 void check(boolean valid,String message){if(!valid)throw new AssertionError(message);checks++;}
 @Override public void onCreate(Bundle b){super.onCreate(b);embedded=b!=null&&"true".equals(b.getString("embedded"));start();}
 @Override public void onStart(){Bundle b=new Bundle();diag=b;try{test(b);b.putString("result","PASS "+checks+" image viewer gesture checks");finish(Activity.RESULT_OK,b);}
 catch(Throwable t){b.putString("error",android.util.Log.getStackTraceString(t));finish(Activity.RESULT_CANCELED,b);}}
 void waitIndex(int expected,String label)throws Exception{
  Integer last=null;
  for(int i=0;i<22;i++){last=main(()->liveIndex());if(Objects.equals(last,expected)){checks++;return;}Thread.sleep(100);}
  throw new AssertionError(label+": index="+last+" expected="+expected);
 }
 Integer liveIndex()throws Exception {
  if(!embedded)return (Integer)index.invoke(null,viewer);
  Class<?> policy=getTargetContext().getClassLoader().loadClass("app.morphe.extension.chmate.NativeImagePaging");
  Map<?,?> refs=(Map<?,?>)get(policy,"CONTAINERS",null);
  for(Object entry:refs.values()){
   Object fragment=((java.lang.ref.WeakReference<?>)entry).get();
   if(fragment==null)continue;
   Object binding=get(fragment.getClass(),"d",fragment);
   if(binding==null)continue;
   Object pager=get(binding.getClass(),"m",binding);
   return (Integer)get(pager.getClass(),"b",pager);
  }
  return null;
 }
 void swipe(int dx,int dy)throws Exception{
  main(()->{
   View root=viewer.getWindow().getDecorView();
   float x=root.getWidth()*.46f,y=root.getHeight()*.48f;
   float dist=Math.min(root.getWidth(),root.getHeight())*.30f;
   long start=SystemClock.uptimeMillis();
   Class<?> policy=getTargetContext().getClassLoader().loadClass("app.morphe.extension.chmate.NativeImagePaging");
   Map<?,?> pagerRefs=(Map<?,?>)get(policy,"CONTAINERS",null);
   Map<?,?> swipes=(Map<?,?>)get(policy,"SWIPES",null);
   View pager=pagerRefs.keySet().isEmpty()?null:(View)pagerRefs.keySet().iterator().next();
   StringBuilder report=new StringBuilder("activityShown="+root.isShown()+" pager="+pagerRefs.size()+" pos="+x+"/"+y);
   if(pager!=null){
     android.graphics.Rect visible=new android.graphics.Rect();pager.getGlobalVisibleRect(visible);
     report.append(" pagerBounds="+visible);
     Object fragment=((java.lang.ref.WeakReference<?>)pagerRefs.get(pager)).get();
     Method count=policy.getDeclaredMethod("pageCount",Object.class);count.setAccessible(true);
     try{report.append(" count="+count.invoke(null,fragment));}catch(Exception e){report.append(" countError="+e);}
   }
   for(int i=0;i<=5;i++){
    MotionEvent event=MotionEvent.obtain(start,start+i*30,i==0?MotionEvent.ACTION_DOWN:i==5?MotionEvent.ACTION_UP:MotionEvent.ACTION_MOVE,
       x+dist*dx*i/5,y+dist*dy*i/5,0);
    event.setSource(android.view.InputDevice.SOURCE_TOUCHSCREEN);
    try{boolean handled=viewer.dispatchTouchEvent(event);report.append(" "+i+":"+handled+":"+swipes.size());}finally{event.recycle();}
   }
   diag.putString("touchDiag",report.toString());return null;
  });
 }
 void serve(ServerSocket server,byte[] image){
  while(!server.isClosed())try(Socket client=server.accept()){
    client.setSoTimeout(2000); BufferedReader in=new BufferedReader(new InputStreamReader(client.getInputStream())); String line;
    while((line=in.readLine())!=null&&!line.isEmpty()){}
    OutputStream out=client.getOutputStream();out.write(("HTTP/1.1 200 OK\r\nConnection: close\r\nContent-Type: image/png\r\nContent-Length: "+image.length+"\r\n\r\n").getBytes(java.nio.charset.StandardCharsets.US_ASCII));out.write(image);out.flush();
  }catch(IOException ignored){}
 }
 void test(Bundle b)throws Exception{
  Context app=getTargetContext();
  check(app.getPackageName().matches(".*\\.reporter(191|226|242)"),"isolated viewer only");
  Class<?> navigation=app.getClassLoader().loadClass("app.morphe.extension.chmate.MediaViewerNavigation");
  index=navigation.getDeclaredMethod("nativeIndex",Activity.class);index.setAccessible(true);
  android.graphics.Bitmap image=android.graphics.Bitmap.createBitmap(320,240,android.graphics.Bitmap.Config.ARGB_8888);
  image.eraseColor(0xff308ab1);ByteArrayOutputStream encoded=new ByteArrayOutputStream();image.compress(android.graphics.Bitmap.CompressFormat.PNG,100,encoded);image.recycle();
  byte[] data=encoded.toByteArray();
  SharedPreferences p=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);
  SharedPreferences nativePrefs=android.preference.PreferenceManager.getDefaultSharedPreferences(app);
  Map<String,Object> prior=new HashMap<>();for(String k:KEYS)prior.put(k,p.getAll().get(k));
  Object back=nativePrefs.getAll().get("gestureBack");
  for(String k:KEYS)p.edit().remove(k).commit();nativePrefs.edit().putInt("gestureBack",0).commit();
  try(ServerSocket server=new ServerSocket(0,10,InetAddress.getLoopbackAddress())){
   Thread thread=new Thread(()->serve(server,data));thread.setDaemon(true);thread.start();
   ArrayList<String> urls=new ArrayList<>();
   for(int i=0;i<3;i++)urls.add("http://127.0.0.1:"+server.getLocalPort()+"/"+i+".png");
   if(embedded){
    check(app.getPackageName().endsWith("242"),"embedded 242 only");
    Intent reader=new Intent(Intent.ACTION_VIEW,android.net.Uri.parse("https://jbbs.shitaraba.net/bbs/read.cgi/computer/45040/1793980818/"))
         .setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.ResListActivity").putExtra("forwardTabletHome",false)
         .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    viewer=startActivitySync(reader);
    main(()->{viewer.getClass().getMethod("b",ArrayList.class,int.class,android.graphics.Rect.class,ArrayList.class).invoke(viewer,urls,1,null,null);return null;});
   }else viewer=startActivitySync(new Intent().setClassName(app.getPackageName(),VIEWER).putStringArrayListExtra("links",urls)
         .putExtra("index",1).putExtra("forwardTabletHome",false).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
   main(()->{viewer.setShowWhenLocked(true);viewer.setTurnScreenOn(true);return null;});
   waitIndex(1,"initial native index");Thread.sleep(700);
   swipe(0,-1);waitIndex(2,"default upward advances");
   swipe(0,-1);Thread.sleep(350);waitIndex(2,"end does not wrap");
   swipe(0,1);waitIndex(1,"default downward reverses");
   swipe(-1,0);Thread.sleep(400);waitIndex(1,"default unassigned left does not page");
   p.edit().putInt(KEYS[1],4).putInt(KEYS[2],3).commit();
   swipe(1,0);waitIndex(2,"custom right advances");
   swipe(-1,0);waitIndex(1,"custom left reverses");
   p.edit().putInt(KEYS[1],0).commit();
   swipe(1,0);Thread.sleep(350);waitIndex(1,"unassigned next does not page");
   p.edit().putBoolean(KEYS[0],false).commit();
   Class<?> policy=app.getClassLoader().loadClass("app.morphe.extension.chmate.NativeImagePaging");
   Method enabled=policy.getDeclaredMethod("enabled",Context.class);enabled.setAccessible(true);
   check(!(Boolean)enabled.invoke(null,app),"standard mode disables custom directions");
   b.putString("viewer",embedded?"in-thread 242 overlay; reader Activity retained":"same native Activity throughout");
  }finally{
   if(viewer!=null)main(()->{viewer.finish();return null;});
   SharedPreferences.Editor e=p.edit();for(String k:KEYS){Object v=prior.get(k);if(v instanceof Integer)e.putInt(k,(Integer)v);else if(v instanceof Boolean)e.putBoolean(k,(Boolean)v);else e.remove(k);}e.commit();
   if(back instanceof Integer)nativePrefs.edit().putInt("gestureBack",(Integer)back).commit();else nativePrefs.edit().remove("gestureBack").commit();
  }
 }
}
