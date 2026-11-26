package dev.rikunode.futatabi.nativetest;
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

public final class NativeGate extends Instrumentation {
 static final String PKG="com.Nanasaki.ftutter.morphe";
 static final String STORE="futatabi_extension_private", KEY="mebuki_cookie_header";
 static final String COOKIE="mock_session=synthetic-beta19-only";
 static final String FIXTURE="{\"timestamp\":D\"2026-11-25T15:00:00.000Z\",\"messageCount\":2,\"messages\":[{\"id\":\"fixture-op\",\"createdAt\":@1,\"content\":\"fixture <script>no execution</script>\",\"replyTo\":null,\"deletedAt\":null,\"attachments\":[{\"fileType\":\"image/jpeg\",\"filePath\":\"https://storage.mebuki.moe/uploads/attachments/aa/bb/fixture.jpg\",\"createdAt\":@1,\"spoiler\":false,\"nsfw\":false,\"gore\":false,\"other\":false}]},{\"id\":\"fixture-reply\",\"createdAt\":D\"2026-11-25T15:01:00.000Z\",\"content\":\"reply fixture\\n>quote\",\"replyTo\":\"fixture-op\",\"deletedAt\":u,\"attachments\":[{\"fileType\":\"image/png\",\"filePath\":\"https://storage.mebuki.moe/uploads/attachments/aa/bb/hidden.png\",\"createdAt\":@1,\"spoiler\":true,\"nsfw\":false,\"gore\":false,\"other\":false}]},{\"id\":\"fixture-deleted\",\"createdAt\":@1,\"content\":\"never display this deleted content\",\"replyTo\":null,\"deletedAt\":@1,\"attachments\":[]}]}\n";
 static final String CATALOG="{\"threads\":[{\"slug\":\"fixture123\",\"name\":\"Fixture first\",\"messageCount\":2,\"imageUrl\":\"https://storage.mebuki.moe/uploads/attachments/aa/bb/fixture.jpg\"},{\"slug\":\"fixture456\",\"name\":\"Fixture second\",\"messageCount\":2,\"imageUrl\":\"https://storage.mebuki.moe/uploads/attachments/aa/bb/fixture2.jpg\"}]}";
 final AtomicInteger sessionReads=new AtomicInteger(),threadReads=new AtomicInteger(),imageReads=new AtomicInteger();
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
         if("storage.mebuki.moe".equals(host)){imageReads.incrementAndGet();return new ByteArrayInputStream(jpg);}
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
 String raw(String path)throws Exception {
    try(Socket sock=new Socket("127.0.0.1",18765)){
        sock.setSoTimeout(12000);sock.getOutputStream().write(("GET "+path+" HTTP/1.1\r\nHost: 127.0.0.1:18765\r\nConnection: close\r\n\r\n").getBytes(StandardCharsets.US_ASCII));
        ByteArrayOutputStream b=new ByteArrayOutputStream();byte[] tmp=new byte[4096];int n;
        while((n=sock.getInputStream().read(tmp))!=-1)b.write(tmp,0,n);
        return new String(b.toByteArray(),java.nio.charset.Charset.forName("Shift_JIS"));
    }
 }
 String shellGet(String path)throws Exception{
    android.os.ParcelFileDescriptor[] fds=getUiAutomation().executeShellCommandRw("toybox nc -q 3 -W 5 -w 5 127.0.0.1 18765");
    try(OutputStream out=new android.os.ParcelFileDescriptor.AutoCloseOutputStream(fds[1])){
        out.write(("GET "+path+" HTTP/1.1\r\nHost: 127.0.0.1:18765\r\nConnection: close\r\n\r\n").getBytes(StandardCharsets.US_ASCII));out.flush();
    }
    try(InputStream in=new android.os.ParcelFileDescriptor.AutoCloseInputStream(fds[0])){
        ByteArrayOutputStream b=new ByteArrayOutputStream();byte[] tmp=new byte[4096];int n;
        while((n=in.read(tmp))!=-1)b.write(tmp,0,n);
        return new String(b.toByteArray(),java.nio.charset.Charset.forName("Shift_JIS"));
    }
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
     String catalog=raw("/mebuki/futaba.php?mode=cat");
     java.util.regex.Matcher m=java.util.regex.Pattern.compile("res/([0-9]{13})[.]htm").matcher(catalog);check(m.find(),"catalog ID");
     String path="/mebuki/res/"+m.group(1)+".htm";
     check(raw(path).contains("futatabi.invalid/mebuki/"),"no cookie notice");
     check(prefs.edit().putString(KEY,COOKIE).commit(),"synthetic save");
     String external=shellGet(path);
     result.putInt("externalBytes",external.length());result.putString("externalPrefix",external.substring(0,Math.min(80,external.length())));
     check(external.contains("HTTP/1.1 200")&&external.contains("futatabi.invalid/mebuki/")&&!external.contains("reply fixture"),"external notice");
     check(threadReads.get()==0,"external did not read");
     result.putBoolean("externalDenied",true);
     String own=raw(path);
     check(own.contains("reply fixture")&&!own.contains("never display this deleted content"),"in process body");
     check(own.contains("<font color=\"#789922\">&gt;No."),"native quote");
     result.putBoolean("socketAuth",true);
     java.util.regex.Matcher im=java.util.regex.Pattern.compile("/mebuki/thumb/([0-9]{13})s[.]jpg").matcher(own);
     check(im.find(),"private image URL");String thumb=im.group();
     check(shellGet(thumb).contains("HTTP/1.1 404"),"external image denied");
     check(raw(thumb).contains("Content-Type: image/jpeg"),"internal image");
     result.putBoolean("privateImage",true);
     press("Fixture first",3000);
     await("reply fixture",12000);
     check(main.hasWindowFocus(),"stock screen focused");
     check(find(getUiAutomation().getRootInActiveWindow(),"futatabi.invalid/mebuki/")==null,"no notice");
     check(threadReads.get()>=2,"actual Flutter thread request");
     check("/api/thread/fixture123/messages?initial=1".equals(lastRoute),"selected slug");
     result.putBoolean("nativeBody",true);
     result.putBoolean("correctSlug",true);
     android.graphics.Bitmap b=getUiAutomation().takeScreenshot();
     if(b!=null){ByteArrayOutputStream out=new ByteArrayOutputStream();b.compress(Bitmap.CompressFormat.PNG,100,out);
        result.putString("screenshot",android.util.Base64.encodeToString(out.toByteArray(),android.util.Base64.NO_WRAP));}
     result.putString("result","PASS synthetic auth, external denial, own socket, image and actual stock thread display");
     prefs.edit().remove(KEY).commit();finish(-1,result);
   }catch(Throwable ex){
     if(COOKIE.equals(prefs.getString(KEY,"")))prefs.edit().remove(KEY).commit();
     result.putString("failure",ex.getClass().getSimpleName()+": "+ex.getMessage());
     result.putInt("sessionReads",sessionReads.get());result.putInt("threadReads",threadReads.get());finish(0,result);
   }
 }
}
