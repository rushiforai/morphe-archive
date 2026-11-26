package dev.rikunode.futatabi.bridge;

import android.content.Context;
import android.content.SharedPreferences;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import org.json.JSONObject;

/** No network: synthetic HTTP responses in a JVM; run with host Android shims. */
public final class MebukiRouteContractTest {
    private static final String ID="1234567890123", SLUG="fixture123";
    private static final String TEST_COOKIE="fixture_session=synthetic_only";
    private static final String BODY="route fixture";
    private static String fixture, after;
    private static int legacy, correct, accepted, checks;
    private static boolean fail405;
    private static void check(boolean value,String name){
        if(!value)throw new AssertionError(name);checks++;
    }
    public static void main(String[] args)throws Exception{
        fixture=Files.readString(Path.of(args[0]),StandardCharsets.UTF_8).trim();
        after=fixture.replace("\"messageCount\":2","\"messageCount\":3")
            .replace("2026-11-25T15:00:00.000Z","2026-11-25T15:05:00.000Z");
        int end=after.lastIndexOf("]}");
        after=after.substring(0,end)+",{\"id\":\"fixture-new\",\"createdAt\":D\"2026-11-25T15:04:00Z\",\"content\":\""+BODY+"\",\"replyTo\":null,\"isAuthor\":true,\"deletedAt\":null,\"attachments\":[]}"+after.substring(end);
        // All protocols are intercepted. No socket or real account is used.
        URL.setURLStreamHandlerFactory(protocol->new URLStreamHandler(){
            protected URLConnection openConnection(URL u){
                check("https".equals(protocol)&&"mebuki.moe".equals(u.getHost()),"expected synthetic host");
                return new HttpURLConnection(u){
                    final ByteArrayOutputStream sent=new ByteArrayOutputStream();
                    boolean recorded;
                    public void connect(){}
                    public void disconnect(){}
                    public boolean usingProxy(){return false;}
                    public OutputStream getOutputStream(){return sent;}
                    public int getResponseCode(){
                        String p=u.getFile();
                        check(TEST_COOKIE.equals(getRequestProperty("Cookie")),"synthetic session");
                        check(!getInstanceFollowRedirects(),"no redirect following");
                        if(p.equals("/api/auth/get-session")||p.equals("/api/thread/"+SLUG+"/messages?initial=1"))return 200;
                        check("POST".equals(getRequestMethod()),"POST");
                        if(p.equals("/t/"+SLUG+".data")){
                            if(!recorded){legacy++;recorded=true;}return 405;
                        }
                        check(p.equals("/app/t/"+SLUG+".data"),"canonical action, no extra query");
                        check(("https://mebuki.moe/app/t/"+SLUG).equals(getRequestProperty("Referer")),"canonical referer");
                        check("https://mebuki.moe".equals(getRequestProperty("Origin")),"origin");
                        check("*/*".equals(getRequestProperty("Accept")),"accept");
                        String form=sent.toString(StandardCharsets.UTF_8);
                        check(form.contains("name=\"content\"\r\n\r\n"+BODY+"\r\n"),"multipart content");
                        if(!recorded){correct++;recorded=true;if(!fail405)accepted++;}
                        return fail405?405:200;
                    }
                    public String getContentType(){return u.getFile().endsWith(".data")?"text/x-script; charset=utf-8":"application/json";}
                    public String getHeaderField(String key){return u.getFile().endsWith(".data")&&"X-Remix-Response".equals(key)?"yes":null;}
                    public InputStream getInputStream(){
                        String p=u.getFile(), value;
                        if(p.equals("/api/auth/get-session"))value="{\"user\":{},\"session\":{}}";
                        else if(p.startsWith("/api/thread/"))value=accepted>0?after:fixture;
                        else if(getResponseCode()==405)value="[{\"_1\":2},\"error\",[\"ErrorResponse\",3,4,5],\"fixture\",405,\"Method Not Allowed\"]\n";
                        else value="[{\"_1\":2},\"data\",{\"_3\":4},\"status\",\"success\"]\n";
                        return new ByteArrayInputStream(value.getBytes(StandardCharsets.UTF_8));
                    }
                    public InputStream getErrorStream(){return getInputStream();}
                };
            }
        });
        // Context and preferences are in-memory test shims.
        Context c=new Context();
        c.getSharedPreferences("futatabi_mebuki_index",0).edit().putString("thread."+ID,SLUG).commit();
        c.getSharedPreferences(MebukiSession.STORE,0).edit().putString(MebukiSession.KEY,TEST_COOKIE).commit();
        MebukiReplyClient client=new MebukiReplyClient(c,new MebukiAdapter(c));
        JSONObject request=new JSONObject().put("threadId",ID).put("content",BODY);
        boolean baseline=args.length>1&&args[1].equals("baseline");
        BridgeServer.BridgeResponse r=client.reply(request);
        SharedPreferences diag=c.getSharedPreferences("futatabi_mebuki_post_diagnostic",0);
        if(baseline){
            check(legacy==1&&correct==0&&accepted==0,"old route rejected once");
            check(r.status==202&&diag.getInt("http",0)==405&&!diag.getBoolean("confirmed",false),"old 405 diagnostic");
            System.out.println("PASS baseline old route: HTTP 405, zero accepted; "+checks+" assertions");
            return;
        }
        check(legacy==0&&correct==1&&accepted==1,"only canonical action accepted once");
        check(r.status==201&&new JSONObject(new String(r.bytes,StandardCharsets.UTF_8)).getString("thisno").equals("1234567890126"),"confirmed native number");
        check(diag.getBoolean("confirmed",false),"confirmation recorded");
        accepted=0;fail405=true;
        r=client.reply(request);
        check(r.status==405&&correct==2&&accepted==0&&legacy==0,"405 rejected without alternate route");
        check(diag.getInt("http",0)==405&&!diag.getBoolean("confirmed",false),"405 diagnostic");
        check(MebukiActionResponse.classify(204,null,true,"/app/t/"+SLUG,false,"",SLUG).eligible(),"canonical redirect");
        check(!MebukiActionResponse.classify(204,null,true,"/t/"+SLUG,false,"",SLUG).eligible(),"legacy redirect not accepted");
        System.out.println("PASS corrected route, exact acceptance/readback and explicit 405; "+checks+" assertions");
    }
}
