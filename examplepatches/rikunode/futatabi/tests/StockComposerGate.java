package dev.rikunode.futatabi.composertest;
import android.app.*;import android.content.*;import android.os.*;import android.graphics.*;import android.view.*;import android.view.accessibility.*;import java.io.*;import java.net.*;import java.nio.charset.StandardCharsets;import java.util.*;import org.json.*;
public final class StockComposerGate extends Instrumentation {
 static final String PKG="com.Nanasaki.ftutter.morphe",UUID="01900000-0000-7000-8000-000000000111",OP="01900000-0000-7000-8000-000000000112",POST="01900000-0000-7000-8000-000000000113",TOKEN="fixture-credential-beta20-only";
 volatile int a=0,b=0,pre=0;volatile String stage="",problem="";
 byte[] jpg;
 @Override public void onCreate(Bundle x){super.onCreate(x);start();}
 void check(boolean ok,String name){if(!ok){problem=name;throw new AssertionError(name);}}
 JSONObject post(String id,int seq,long no,String text)throws Exception{return new JSONObject().put("id",id).put("threadId",UUID).put("seq",seq).put("postSequenceNo",no).put("body",text).put("createdAt","2026-11-25T15:00:00Z");}
 String boardHtml(){return "<ul><li id='res1'><span class='resposted'>26/11/25 12:00:00</span><div class='resbody good1'>Fixture Animanch</div></li>"+(b>0?"<li id='res2'><span class='resposted'>26/11/25 12:01:00</span><div class='resbody good1'>"+ "beta20replyB"+"</div></li>":"")+"</ul>";}
 void setup()throws Exception{
 Bitmap bm=Bitmap.createBitmap(48,48,Bitmap.Config.ARGB_8888);bm.eraseColor(Color.GRAY);ByteArrayOutputStream im=new ByteArrayOutputStream();bm.compress(Bitmap.CompressFormat.JPEG,80,im);jpg=im.toByteArray();bm.recycle();
 URL.setURLStreamHandlerFactory(p->"https".equals(p)?new URLStreamHandler(){protected URLConnection openConnection(URL u)throws IOException{
 return new HttpURLConnection(u){
 ByteArrayOutputStream out=new ByteArrayOutputStream();byte[] result;int status=200;
 public void connect(){}public void disconnect(){}public boolean usingProxy(){return false;}
 public OutputStream getOutputStream(){return out;}
 void respond()throws Exception{
 if(result!=null)return;String h=u.getHost(),p=u.getFile(),str="";String sent=new String(out.toByteArray(),StandardCharsets.UTF_8);
 if(h.equals("storage.nijiurachan.net")||p.startsWith("/thumb_s/")){result=jpg;return;}
 if(h.equals("api.nijiurachan.net")){
 if(p.equals("/client-policy"))str="{\"boardKey\":\"aimg\"}";
 else if(p.startsWith("/catalog/aimg?")){JSONObject op=post(OP,0,100000001L,"Fixture Aimoge");op.put("attachment",new JSONObject().put("id",OP).put("originalUrl","https://storage.nijiurachan.net/f.jpg").put("thumbnailUrl","https://storage.nijiurachan.net/f.jpg"));str=new JSONObject().put("threads",new JSONArray().put(new JSONObject().put("id",UUID).put("opPost",op).put("replyCount",a))).toString();}
 else if(p.equals("/thread/"+UUID+"/public")){JSONArray ps=new JSONArray().put(post(OP,0,100000001L,"Fixture Aimoge"));if(a>0)ps.put(post(POST,1,100000002L,"beta20replyA"));str=new JSONObject().put("posts",ps).toString();}
 else if(p.equals("/altcha")){byte[] hash=java.security.MessageDigest.getInstance("SHA-256").digest("fixture-salt42".getBytes(StandardCharsets.UTF_8));StringBuilder hex=new StringBuilder();for(byte x:hash)hex.append(String.format("%02x",x));str=new JSONObject().put("algorithm","SHA-256").put("challenge",hex.toString()).put("salt","fixture-salt").put("signature",String.join("",Collections.nCopies(64,"a"))).put("maxnumber",100).toString();}
 else if(p.equals("/threads/"+UUID+"/posts")&&getRequestMethod().equals("POST")){JSONObject j=new JSONObject(sent);check(TOKEN.equals(getRequestProperty("x-aimg-token")),"fixture credential");check(j.getString("body").equals("beta20replyA")&&!j.getString("deleteKey").isEmpty(),"aimoge payload");check(new JSONObject(new String(android.util.Base64.decode(j.getString("altcha"),0),StandardCharsets.UTF_8)).getInt("number")==42,"proof");a++;status=201;str=new JSONObject().put("threadId",UUID).put("postId",POST).put("seq",1).put("status","public").toString();}
 else throw new IOException("unmocked Aimoge");
 }else if(h.equals("bbs.animanch.com")){
 if(p.equals("/"))str="<a href='/board/7666191/' class='card'><div class='card-body'>Fixture Animanch<p class='threadCount'>"+b+"</p></div></a>";
 else if(p.equals("/board/7666191/"))str=boardHtml();
 else if(p.equals("/inc/comment.php?preCheck")||p.equals("/inc/comment.php")){check(getRequestMethod().equals("POST")&&sent.contains("thread=7666191")&&sent.contains("text=beta20replyB"),"animanch payload");check("XMLHttpRequest".equals(getRequestProperty("X-Requested-With")),"animanch header");if(p.endsWith("preCheck")){pre++;str="{}";}else{check(pre==1,"precheck first");b++;str="{\"number\":\"2\",\"thread\":\"7666191\",\"jump\":\"https://bbs.animanch.com/board/7666191/#res2\"}";}}
 else throw new IOException("unmocked Animanch");
 }else throw new IOException("unmocked host");
 result=str.getBytes(StandardCharsets.UTF_8);
 }
 public int getResponseCode()throws IOException{try{respond();return status;}catch(Exception e){throw new IOException(e);}}
 public InputStream getInputStream()throws IOException{getResponseCode();return new ByteArrayInputStream(result);}
 public Map<String,List<String>> getHeaderFields(){return Collections.emptyMap();}
 };}}:null);
 }
 void editables(AccessibilityNodeInfo n,List<AccessibilityNodeInfo> out){if(n==null)return;if(n.isEditable())out.add(n);for(int i=0;i<n.getChildCount();i++)editables(n.getChild(i),out);}
 void dump(AccessibilityNodeInfo n,StringBuilder s){if(n==null)return;Rect r=new Rect();n.getBoundsInScreen(r);s.append(n.getClassName()).append("|").append(n.getText()).append("|").append(n.getContentDescription()).append("|").append(n.isEditable()).append("|").append(r).append("\n");for(int i=0;i<n.getChildCount();i++)dump(n.getChild(i),s);}
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

 String catalogId(String path)throws Exception{
 java.util.regex.Matcher m=java.util.regex.Pattern.compile("res/([0-9]{13})\\.htm").matcher(raw(path));check(m.find(),"catalog thread mapping");return m.group(1);
 }
 void compose(String text)throws Exception{
 tap(188,594);await("\u66f8\u304d\u8fbc\u3080",6000);
 List<AccessibilityNodeInfo> fields=new ArrayList<>();editables(getUiAutomation().getRootInActiveWindow(),fields);check(fields.size()==4,"stock form fields");
 Bundle arg=new Bundle();arg.putCharSequence(AccessibilityNodeInfo.ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE,text);check(fields.get(3).performAction(AccessibilityNodeInfo.ACTION_SET_TEXT,arg),"set body");
 Thread.sleep(500);press("\u66f8\u304d\u8fbc\u3080",6000);
 }
 @Override public void onStart(){
 Bundle r=new Bundle();android.content.SharedPreferences prefs=getTargetContext().getSharedPreferences("futatabi_extension_private",0);
 try{check(prefs.getString("credential","").isEmpty(),"no real credential");setup();prefs.edit().putString("credential",TOKEN).putLong("credential_expires",System.currentTimeMillis()+600000).commit();
 Intent i=new Intent().setClassName(PKG,PKG.replace(".morphe","")+".MainActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TASK);startActivitySync(i);Thread.sleep(1600);
 press("http://127.0.0.1:18765/aimoge/",7000);press("Fixture Aimoge",10000);await("Fixture Aimoge",8000);Thread.sleep(900);
 compose("beta20replyA");long aimDeadline=SystemClock.uptimeMillis()+15000;while(a==0&&SystemClock.uptimeMillis()<aimDeadline)Thread.sleep(250);check(a==1,"aimoge upstream once");Thread.sleep(2500);
 String aid=catalogId("/aimoge/");String ah=raw("/aimoge/res/"+aid+".htm");check(ah.contains("No.100000002")&&ah.contains("beta20replyA"),"aimoge official number and readback");r.putBoolean("aimogeReplyReadback",true);
 startActivitySync(i);Thread.sleep(1600);
 press("http://127.0.0.1:18765/animanch/",7000);press("Fixture Animanch",10000);await("Fixture Animanch",8000);Thread.sleep(900);
 compose("beta20replyB");long deadline=SystemClock.uptimeMillis()+15000;while(b==0&&SystemClock.uptimeMillis()<deadline)Thread.sleep(250);check(b==1&&pre==1,"animanch precheck and upstream once");Thread.sleep(2500);String bid=catalogId("/animanch/");String bh=raw("/animanch/res/"+bid+".htm");check(bh.contains("beta20replyB"),"animanch reply readback");r.putBoolean("animanchReplyReadback",true);
 r.putString("result","PASS both stock composer submissions, official mock contracts and bridge readback");
 }catch(Throwable e){r.putString("failure",e.toString());r.putString("problem",problem);}
 finally{if(TOKEN.equals(prefs.getString("credential","")))prefs.edit().remove("credential").remove("credential_expires").commit();r.putInt("aimoge",a);r.putInt("animanch",b);r.putInt("pre",pre);finish(r.containsKey("failure")?0:-1,r);}
 }
}
