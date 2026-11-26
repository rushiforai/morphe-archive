package dev.rikunode.futatabi.navtest;
import android.app.*;
import android.content.*;
import android.os.*;
import android.graphics.*;
import android.view.*;
import android.view.accessibility.AccessibilityNodeInfo;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.atomic.AtomicInteger;

public final class MebukiNavigationGate extends Instrumentation {
 static final String PKG="com.Nanasaki.ftutter.morphe";
 static final String STORE="futatabi_extension_private", KEY="mebuki_cookie_header";
 static final String COOKIE="mock_session=synthetic-beta19-only";
 static final String FIXTURE="{\"timestamp\":D\"2026-11-25T15:00:00.000Z\",\"messageCount\":2,\"messages\":[{\"id\":\"fixture-op\",\"createdAt\":@1,\"content\":\"fixture <script>no execution</script>\",\"replyTo\":null,\"deletedAt\":null,\"attachments\":[{\"fileType\":\"image/jpeg\",\"filePath\":\"https://storage.mebuki.moe/uploads/attachments/aa/bb/fixture.jpg\",\"createdAt\":@1,\"spoiler\":false,\"nsfw\":false,\"gore\":false,\"other\":false}]},{\"id\":\"fixture-reply\",\"createdAt\":D\"2026-11-25T15:01:00.000Z\",\"content\":\"reply fixture\\n>quote\",\"replyTo\":\"fixture-op\",\"deletedAt\":u,\"attachments\":[{\"fileType\":\"image/png\",\"filePath\":\"https://storage.mebuki.moe/uploads/attachments/aa/bb/hidden.png\",\"createdAt\":@1,\"spoiler\":true,\"nsfw\":false,\"gore\":false,\"other\":false}]},{\"id\":\"fixture-deleted\",\"createdAt\":@1,\"content\":\"never display this deleted content\",\"replyTo\":null,\"deletedAt\":@1,\"attachments\":[]}]}\n";
 static final String CATALOG="{\"threads\":[{\"slug\":\"fixture123\",\"name\":\"Fixture first\",\"messageCount\":2,\"imageUrl\":\"https://storage.mebuki.moe/uploads/attachments/aa/bb/fixture.jpg\"},{\"slug\":\"fixture456\",\"name\":\"Fixture second\",\"messageCount\":2,\"imageUrl\":\"https://storage.mebuki.moe/uploads/attachments/aa/bb/fixture2.jpg\"}]}";
 final AtomicInteger sessionReads=new AtomicInteger(),threadReads=new AtomicInteger();
 volatile String lastRoute="";
 byte[] jpg;
 @Override public void onCreate(Bundle b){super.onCreate(b);start();}
 void check(boolean b,String name){if(!b)throw new AssertionError(name);}
 void setupNetwork() throws Exception{
   Bitmap bmp=Bitmap.createBitmap(48,48,Bitmap.Config.ARGB_8888);bmp.eraseColor(Color.GRAY);
   ByteArrayOutputStream out=new ByteArrayOutputStream();bmp.compress(Bitmap.CompressFormat.JPEG,80,out);bmp.recycle();jpg=out.toByteArray();
   URL.setURLStreamHandlerFactory(protocol->"https".equals(protocol)?new URLStreamHandler(){
    @Override protected URLConnection openConnection(URL u)throws IOException{
     String host=u.getHost(),path=u.getFile();
     if(!"mebuki.moe".equals(host)&&!"storage.mebuki.moe".equals(host))throw new IOException("fixture denies non-Mebuki host");
     return new HttpURLConnection(u){
       public void connect(){} public boolean usingProxy(){return false;} public void disconnect(){}
       public int getResponseCode(){return 200;}
       public InputStream getInputStream()throws IOException{
         if("storage.mebuki.moe".equals(host))return new ByteArrayInputStream(jpg);
         String body;
         if("/api/trial/trending".equals(path))body=CATALOG;
         else if("/api/auth/get-session".equals(path)){
           check(COOKIE.equals(getRequestProperty("Cookie")),"unexpected session cookie");sessionReads.incrementAndGet();
           body="{\"user\":{},\"session\":{}}";
         }else if(path.matches("/api/thread/fixture(123|456)/messages\\?initial=1")){
           check(COOKIE.equals(getRequestProperty("Cookie")),"unexpected read cookie");threadReads.incrementAndGet();lastRoute=path;body=FIXTURE;
         }else throw new IOException("fixture denies other route");
         return new ByteArrayInputStream(body.getBytes(StandardCharsets.UTF_8));
       }
     };
    }
   }:null);
 }
 AccessibilityNodeInfo find(AccessibilityNodeInfo n,String text){
   if(n==null)return null;
   CharSequence t=n.getText(),c=n.getContentDescription();
   if((t!=null&&t.toString().contains(text))||(c!=null&&c.toString().contains(text)))return n;
   for(int i=0;i<n.getChildCount();i++){
      AccessibilityNodeInfo v=find(n.getChild(i),text);if(v!=null)return v;
   }return null;
 }
 AccessibilityNodeInfo await(String text,int ms)throws Exception{
   long end=SystemClock.uptimeMillis()+ms;
   do{AccessibilityNodeInfo n=find(getUiAutomation().getRootInActiveWindow(),text);if(n!=null)return n;Thread.sleep(250);}while(SystemClock.uptimeMillis()<end);
   throw new AssertionError("missing "+text);
 }
 void tap(float x,float y){
   long time=SystemClock.uptimeMillis();MotionEvent down=MotionEvent.obtain(time,time,MotionEvent.ACTION_DOWN,x,y,0);
   down.setSource(InputDevice.SOURCE_TOUCHSCREEN);getUiAutomation().injectInputEvent(down,true);down.recycle();
   MotionEvent up=MotionEvent.obtain(time,SystemClock.uptimeMillis(),MotionEvent.ACTION_UP,x,y,0);
   up.setSource(InputDevice.SOURCE_TOUCHSCREEN);getUiAutomation().injectInputEvent(up,true);up.recycle();
 }
 void press(String text,int ms)throws Exception{
   Rect bounds=new Rect();await(text,ms).getBoundsInScreen(bounds);check(bounds.width()>0&&bounds.height()>0,"bounds");tap(bounds.centerX(),bounds.centerY());
 }
 @Override public void onStart(){
   Bundle result=new Bundle();
   android.content.Context ctx=getTargetContext();
   android.content.SharedPreferences prefs=ctx.getSharedPreferences(STORE,0);
   try{
     check(prefs.getString(KEY,"").isEmpty(),"isolated test must not have real cookie");
     setupNetwork();
     Intent i=new Intent().setClassName(PKG,PKG.replace(".morphe","")+".MainActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TASK);
     Activity main=startActivitySync(i);Thread.sleep(1600);
     press("http://127.0.0.1:18765/mebuki/",7000);
     await("Fixture first",8000);
     check(prefs.edit().putString(KEY,COOKIE).commit(),"synthetic save");
     // Actual pointer to the stock catalog card; no link click.
     press("Fixture first",3000);
     await("\u8a8d\u8a3c\u6e08\u307f \u2022 3 \u6295\u7a3f",10000);
     check(threadReads.get()==1&&sessionReads.get()==1,"exact initial read");
     check("/api/thread/fixture123/messages?initial=1".equals(lastRoute),"selected slug");
     result.putBoolean("autoReader",true);
     result.putBoolean("correctSlug",true);
     // Closing the private reader returns to the stock notice; no automatic re-entry.
     press("\u623b\u308b",3000);await("futatabi.invalid/mebuki/",5000);Thread.sleep(500);
     check(threadReads.get()==1,"no duplicate launch");
     result.putBoolean("noRepeatOnClose",true);
     sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);
     await("Fixture first",5000);Thread.sleep(1000);
     result.putBoolean("repeatMainFocused",main.hasWindowFocus());
     result.putBoolean("repeatBeforeOpeningIsThread",ctx.getSharedPreferences("FlutterSharedPreferences",0).getString("flutter.opening","").contains("/mebuki/res/"));
     press("Fixture first",3000);Thread.sleep(1200);
     result.putBoolean("repeatAfterOpeningIsThread",ctx.getSharedPreferences("FlutterSharedPreferences",0).getString("flutter.opening","").contains("/mebuki/res/"));
     result.putBoolean("repeatNoticeVisible",find(getUiAutomation().getRootInActiveWindow(),"futatabi.invalid/mebuki/")!=null);
     result.putBoolean("repeatCatalogVisible",find(getUiAutomation().getRootInActiveWindow(),"Fixture first")!=null);
     await("\u8a8d\u8a3c\u6e08\u307f \u2022 3 \u6295\u7a3f",8000);
     check(threadReads.get()==2&&sessionReads.get()==2,"repeat selection");
     result.putBoolean("sameThreadReopen",true);
     // Close and choose different thread.
     press("\u623b\u308b",3000);await("futatabi.invalid/mebuki/",5000);
     sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);
     await("Fixture second",5000);Thread.sleep(700);press("Fixture second",3000);await("\u8a8d\u8a3c\u6e08\u307f \u2022 3 \u6295\u7a3f",8000);
     check(threadReads.get()==3&&"/api/thread/fixture456/messages?initial=1".equals(lastRoute),"different thread");
     result.putBoolean("differentThread",true);
     prefs.edit().remove(KEY).commit();
     result.putString("result","PASS synthetic catalogue, real selection, reader, no repeat, reopen, second slug");
     finish(-1,result);
   }catch(Throwable ex){
     if(COOKIE.equals(prefs.getString(KEY,"")))prefs.edit().remove(KEY).commit();
     result.putString("failure",ex.getClass().getSimpleName()+": "+ex.getMessage());
     result.putInt("sessionReads",sessionReads.get());result.putInt("threadReads",threadReads.get());finish(0,result);
   }
 }
}
