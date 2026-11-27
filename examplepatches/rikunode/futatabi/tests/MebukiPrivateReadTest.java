package dev.rikunode.futatabi.bridge;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;

public final class MebukiPrivateReadTest {
    private static String fixture,response;
    private static int checks,calls;
    private static boolean authenticated=true;
    private static int threadStatus=200;
    private static final String COOKIE="mock_session=synthetic-test-only";
    private static void check(boolean ok,String name){if(!ok)throw new AssertionError(name);checks++;}
    private static void rejected(String input)throws Exception{
        try{MebukiThreadData.convert(input);throw new AssertionError("accepted invalid fixture");}
        catch(IllegalArgumentException expected){checks++;}
    }
    private static void failure(String cookie,String expected)throws Exception{
        try{MebukiSession.readThread("fixture123",cookie);throw new AssertionError("accepted failure");}
        catch(MebukiSession.ReadFailure ex){check(expected.equals(ex.getMessage()),"failure "+expected);}
    }
    public static void main(String[] args)throws Exception{
        fixture=Files.readString(Path.of(args[0]),StandardCharsets.UTF_8);response=fixture;
        MebukiThreadData data=MebukiThreadData.convert(fixture);
        check(data.count==3,"count");
        check(data.html.contains("fixture &lt;script&gt;no execution&lt;/script&gt;"),"escaped body");
        check(data.html.contains("href='#post0'")&&data.html.contains("&gt;&gt;0"),"reply");
        check(data.html.indexOf("id='post0'")<data.html.indexOf("id='post1'"),"initial order");
        check(data.html.contains("<font color=\"#789922\">&gt;quote</font>"),"quote markup");
        check(!data.html.contains("never display this deleted content"),"deleted hidden");
        check(data.images.size()==1&&data.images.get(0).endsWith("/fixture.jpg"),"original filePath and spoiler exclusion");
        String nativeHtml=new String(data.nativeHtml("1234567890123",url->{
            check(url.endsWith("/fixture.jpg"),"native thread uses original mapping");
            return "1234567890124";
        }),java.nio.charset.Charset.forName("Shift_JIS"));
        check(nativeHtml.contains("/mebuki/src/1234567890124.jpg")&&nativeHtml.contains("/mebuki/thumb/1234567890124s.jpg"),"native original and inline paths");
        java.util.Map<String,Object> attachment=new java.util.HashMap<>();
        attachment.put("filePath",data.images.get(0));attachment.put("fileType","image/jpeg");attachment.put("createdAt","2026-11-25T15:00:00Z");
        for(String flag:new String[]{"spoiler","nsfw","gore","other"})attachment.put(flag,false);
        check(MebukiThreadData.thumbnail(attachment).endsWith("fixture_sm.webp"),"catalog stays small");
        attachment.put("spoiler",true);
        check(MebukiThreadData.original(attachment)==null&&MebukiThreadData.thumbnail(attachment)==null,"sensitive images stay hidden");
        check(!data.html.contains("storage.mebuki.moe"),"image URL not in document");
        check(!MebukiThreadData.safeImage("https://storage.mebuki.moe.evil.invalid/uploads/attachments/a.jpg"),"other host");
        check(!MebukiThreadData.safeImage("https://storage.mebuki.moe/uploads/attachments/../a.jpg"),"traversal");
        check(!MebukiThreadData.safeImage("https://storage.mebuki.moe/uploads/attachments/a.jpg?secret=x"),"query");
        rejected(fixture.replace("\"messageCount\":2","\"messageCount\":3"));
        rejected(fixture.replace("\"fixture-reply\"","\"fixture-op\""));
        rejected(fixture.replace("@1","@999"));
        rejected(fixture.replace("@1","@0"));
        rejected(fixture+"{}");
        rejected(fixture.replace("\"replyTo\":null","\"replyTo\":$0"));
        URL.setURLStreamHandlerFactory(protocol->"https".equals(protocol)?new URLStreamHandler(){
            @Override protected URLConnection openConnection(URL u){
                if(!"mebuki.moe".equals(u.getHost()))throw new AssertionError("unapproved host");
                return new HttpURLConnection(u){
                    public void connect(){}
                    public boolean usingProxy(){return false;}
                    public void disconnect(){}
                    public int getResponseCode(){
                        check(COOKIE.equals(getRequestProperty("Cookie")),"official cookie header");
                        check(!getInstanceFollowRedirects(),"redirect disabled");
                        calls++;
                        if("/api/auth/get-session".equals(u.getFile()))return 200;
                        check("/api/thread/fixture123/messages?initial=1".equals(u.getFile()),"initial route");
                        return threadStatus;
                    }
                    public InputStream getInputStream(){
                        String body="/api/auth/get-session".equals(u.getFile())?
                            authenticated?"{\"user\":{},\"session\":{}}":"null":response;
                        return new ByteArrayInputStream(body.getBytes(StandardCharsets.UTF_8));
                    }
                };
            }
        }:null);
        failure("","NOT_SAVED");check(calls==0,"no upstream without cookie");
        authenticated=false;failure(COOKIE,"ANONYMOUS");check(calls==1,"expired no thread fetch");
        authenticated=true;
        check(MebukiSession.readThread("fixture123",COOKIE).count==3,"authenticated mock read");
        threadStatus=403;failure(COOKIE,"HTTP 403");threadStatus=302;failure(COOKIE,"HTTP 302");
        threadStatus=200;response="<html>not thread data</html>";failure(COOKIE,"UNSUPPORTED_THREAD_FORMAT");
        android.content.Context context=new android.content.Context();
        context.getSharedPreferences(MebukiSession.STORE,0).edit().putString(MebukiSession.KEY,COOKIE).commit();
        context.getSharedPreferences("futatabi_mebuki_index",0).edit().putString("thread.1234567890123","fixture123").commit();
        MebukiAdapter adapter=new MebukiAdapter(context);
        int before=calls;
        BridgeServer.BridgeResponse publicRead=adapter.route("/mebuki/res/1234567890123.htm");
        String publicHtml=new String(publicRead.bytes,java.nio.charset.Charset.forName("Shift_JIS"));
        check(publicRead.status==200&&!publicHtml.contains("fixture <script>")&&publicHtml.contains("futatabi.invalid/mebuki/1234567890123"),"public notice only");
        check(calls==before,"public route never touches session");
        response=fixture;check(adapter.readPrivateThread(context,"1234567890123").count==3,"private adapter read");
        String newId=adapter.rememberPrivateThread(COOKIE,"newfixture123");
        check("newfixture123".equals(new MebukiAdapter(context).slugForThreadId(newId)),"confirmed navigation mapping shared across reader instance");
        check(!context.getSharedPreferences("futatabi_mebuki_index",0).contains("thread."+newId),"navigation mapping not persisted");
        context.getSharedPreferences(MebukiSession.STORE,0).edit().remove(MebukiSession.KEY).commit();
        check(new MebukiAdapter(context).slugForThreadId(newId)==null,"navigation map invalidated on logout");
        System.out.println("PASS "+checks+" assertions; synthetic session and thread data only");
    }
}
