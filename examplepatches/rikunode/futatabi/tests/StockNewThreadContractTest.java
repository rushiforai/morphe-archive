package dev.rikunode.futatabi.bridge;

import android.content.Context;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;

/** Synthetic upstreams only: exercise stock multipart, creation contracts and readback. */
public final class StockNewThreadContractTest {
    static final String THREAD="01900000-0000-7000-8000-000000000111", OP="01900000-0000-7000-8000-000000000112",
            ATT="01900000-0000-7000-8000-000000000114", TOKEN="fixture-only", BOARD="7666191", B="futatabi-test";
    static final Map<String,String> HEADERS=Map.of("host","127.0.0.1:18765","content-type","multipart/form-data; boundary="+B);
    static int aim,pre,anim,upload,reads,handoffs,sessionReads;
    static MebukiNewThreadDraft captured;
    static AnimanchNewThreadDraft animDraft;
    static int pickers;
    static boolean badRead,failUpload;
    static String expectedCategory="7";
    static int animFormGets;
    static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);}
    static void part(ByteArrayOutputStream out,String key,String val)throws Exception{
        out.write(("--"+B+"\r\nContent-Disposition: form-data; name=\""+key+"\"\r\n\r\n"+val+"\r\n").getBytes(StandardCharsets.UTF_8));
    }
    static byte[] form(String resto,String title,String email,boolean image)throws Exception{
        ByteArrayOutputStream out=new ByteArrayOutputStream();
        part(out,"mode","regist");part(out,"responsemode","ajax");part(out,"js","on");
        part(out,"com","fixture");part(out,"sub",title);part(out,"name","");part(out,"email",email);part(out,"pwd","fixture-key");
        if(resto!=null)part(out,"resto",resto);
        if(image)out.write(("--"+B+"\r\nContent-Disposition: form-data; name=\"upfile\"; filename=\"fixture.jpg\"\r\nContent-Type: image/jpeg\r\n\r\nabc\r\n").getBytes(StandardCharsets.UTF_8));
        out.write(("--"+B+"--\r\n").getBytes(StandardCharsets.UTF_8));
        return out.toByteArray();
    }
    static String result(StockReply s,String board,byte[] form){
        BridgeServer.BridgeResponse r=s.submit("/"+board+"/futaba.php?guid=on",HEADERS,form);
        check(r.status==200,"stock response HTTP");
        return new String(r.bytes,java.nio.charset.Charset.forName("Shift_JIS"));
    }
    static String draftResult(AnimanchNewThreadDraft draft,int id){
        return new String(draft.choose(id).bytes,java.nio.charset.Charset.forName("Shift_JIS"));
    }
    static final class Mock extends HttpURLConnection {
        ByteArrayOutputStream out=new ByteArrayOutputStream();
        Map<String,String> headers=new HashMap<>();
        String method="GET", response;int status;
        Mock(URL u){super(u);}
        public void connect(){}
        public void disconnect(){}
        public boolean usingProxy(){return false;}
        public void setRequestMethod(String s){method=s;}
        public void setRequestProperty(String k,String v){headers.put(k.toLowerCase(Locale.ROOT),v);}
        public OutputStream getOutputStream(){return out;}
        public Map<String,List<String>> getHeaderFields(){return url.getHost().equals("bbs.animanch.com")&&"GET".equals(method)?Map.of("Set-Cookie",List.of("PHPSESSID=fixture_only; Path=/; Secure")):Map.of();}
        void respond()throws Exception{
            if(response!=null)return;
            String p=url.getFile(), data=out.toString(StandardCharsets.UTF_8);
            status=200;
            if(url.getHost().equals("api.nijiurachan.net")){
                if(p.equals("/attachments/presign")){
                    check("POST".equals(method)&&TOKEN.equals(headers.get("x-aimg-token")),"presign credential");
                    response=new JSONObject().put("attachmentId",ATT).put("reused",true).toString();
                }else if(p.equals("/altcha")){
                    check("GET".equals(method),"challenge");
                    response=new JSONObject().put("algorithm","SHA-256").put("salt","fixture-salt").put("signature","a".repeat(64))
                        .put("challenge",AimogeWriteClient.sha256("fixture-salt42".getBytes(StandardCharsets.UTF_8))).put("maxnumber",100).toString();
                }else if(p.equals("/threads/aimg")){
                    JSONObject j=new JSONObject(data);
                    check("POST".equals(method)&&TOKEN.equals(headers.get("x-aimg-token")),"create credential");
                    check("title\nfixture".equals(j.getString("body"))&&"fixture-key".equals(j.getString("deleteKey"))&&ATT.equals(j.getString("attachmentId"))&&j.optBoolean("sage"),"create fields");
                    aim++;status=201;
                    response=new JSONObject().put("threadId",THREAD).put("postId",OP).put("seq",0).put("status","public").toString();
                }else if(p.equals("/thread/"+THREAD+"/public")){
                    reads++;response=new JSONObject().put("posts",new JSONArray().put(new JSONObject().put("id",badRead?ATT:OP).put("threadId",THREAD).put("seq",0).put("postSequenceNo",123L))).toString();
                }else throw new AssertionError("unmocked aimoge "+p);
            }else if(url.getHost().equals("bbs.animanch.com")){
                if(p.equals("/")&&"GET".equals(method)){animFormGets++;response="";}
                else if(p.equals("/inc/comment.php?preCheck")||p.equals("/inc/comment.php")){
                    check("POST".equals(method)&&"PHPSESSID=fixture_only".equals(headers.get("cookie")),"session");
                    check(data.contains("title=title")&&Arrays.asList(data.split("&")).contains("category="+expectedCategory)&&data.contains("text=fixture")&&data.contains("thread=")&&!data.contains("thread="+BOARD),"new form fields");
                    check(!data.contains("email="),"category only, not upstream email");
                    if(p.endsWith("preCheck")){pre++;response="{}";}
                    else{anim++;check(pre==anim,"precheck first");response="{\"number\":\"1\",\"thread\":\""+BOARD+"\",\"jump\":\"https://bbs.animanch.com/board/"+BOARD+"/\"}";}
                }else if(p.equals("/upload/")){
                    check("POST".equals(method)&&data.contains("name=\"upname\"\r\n\r\n1")&&data.contains("name=\"thread\"\r\n\r\n"+BOARD)&&data.contains("abc"),"upload fields");
                    upload++;status=failUpload?403:200;response="";
                }else if(p.equals("/board/"+BOARD+"/")){
                    reads++;response="<li id='res1'><img src='/fixture.jpg'></li>";
                }else throw new AssertionError("unmocked animanch "+p);
            }else if(url.getHost().equals("mebuki.moe")&&p.equals("/api/auth/get-session")){
                check("GET".equals(method),"Mebuki session read only");
                sessionReads++;
                String cookie=headers.get("cookie");
                if("fixture-old".equals(cookie)||"fixture-renewed".equals(cookie))
                    response="{\"user\":{\"id\":\"fixture-account\"},\"session\":{}}";
                else if("fixture-other".equals(cookie))
                    response="{\"user\":{\"id\":\"other-fixture\"},\"session\":{}}";
                else response="null";
            }else throw new AssertionError("unexpected network "+url);
        }
        public int getResponseCode()throws IOException{try{respond();return status;}catch(Exception ex){throw new IOException(ex);}}
        public InputStream getInputStream()throws IOException{getResponseCode();return new ByteArrayInputStream(response.getBytes(StandardCharsets.UTF_8));}
        public InputStream getErrorStream(){try{return getInputStream();}catch(IOException e){throw new AssertionError(e);}}
    }
    public static void main(String[] args)throws Exception{
        URL.setURLStreamHandlerFactory(protocol->new URLStreamHandler(){
            protected URLConnection openConnection(URL u){check("https".equals(protocol),"network protocol");return new Mock(u);}
        });
        Context c=new Context();
        AimogeAdapter a=new AimogeAdapter(c);
        AnimanchAdapter b=new AnimanchAdapter(c);
        ExtensionApi api=new ExtensionApi(c,a,b,null);
        StockReply stock=new StockReply(a,b,api,draft->{
            handoffs++; captured=draft;
            return "確認画面を開きます。未送信です。";
        },draft->{
            pickers++;animDraft=draft;
            return "カテゴリを選択してください。まだ送信していません。";
        });
        check(!result(stock,"aimoge",form(null,"title","sage",true)).contains("\"status\":\"ok\"")&&aim==0,"no login");
        c.getSharedPreferences("futatabi_extension_private",0).edit().putString("credential",TOKEN).putLong("credential_expires",System.currentTimeMillis()+600000).commit();
        check(!result(stock,"aimoge",form(null,"title","sage",false)).contains("\"status\":\"ok\"")&&aim==0,"required image");
        String ok=result(stock,"aimoge",form(null,"title","sage",true));
        String id=new JSONObject(ok).getString("thisno");
        check(id.matches("[1-9][0-9]{12}")&&THREAD.equals(a.stockThreadUuid(id))&&aim==1&&reads==1,"aimoge OP readback and mapped thread");
        badRead=true;
        check(!result(stock,"aimoge",form("0","title","sage",true)).contains("\"status\":\"ok\"")&&aim==2,"unmatched OP never reports success");
        // README contains the complete official form option list. Check every name and ID.
        int categoryCount=0;
        for(String line:java.nio.file.Files.readAllLines(java.nio.file.Path.of("README.md"),StandardCharsets.UTF_8)){
            java.util.regex.Matcher m=java.util.regex.Pattern.compile("^\\| ([0-9]+) \\| (.+?) \\| (単発スレ|通常スレ|実況・安価など) \\|$").matcher(line);
            if(!m.matches())continue;
            categoryCount++;
            int category=Integer.parseInt(m.group(1));
            check(m.group(2).equals(StockReplyRequest.animanchCategoryName(category)),"category name "+category);
            check(Arrays.stream(StockReplyRequest.animanchCategoryOrder()).anyMatch(n->n==category),"picker option "+category);
        }
        check(categoryCount==32,"all official category options");
        int[] order=StockReplyRequest.animanchCategoryOrder();
        check(order.length==32&&order[0]==7&&Arrays.stream(order).distinct().count()==32,"default first and no duplicate options");
        for(int invalid:new int[]{-1,0,5,34})check(StockReplyRequest.animanchCategoryName(invalid)==null,"invalid category "+invalid);
        for(String mail:new String[]{"8","sage","ブルーアーカイブ"}){
            String rejected=result(stock,"animanch",form(null,"title",mail,true));
            check(!rejected.contains("\"status\":\"ok\"")&&rejected.contains("メール欄を空欄"),"old mail entry rejected");
        }
        check(animFormGets==0&&pre==0&&anim==0&&upload==0&&pickers==0,"invalid mail never opens picker or contacts upstream");
        check(!result(stock,"animanch",form(null,"title","",false)).contains("\"status\":\"ok\"")&&pickers==0,"required image");
        check(!result(stock,"animanch",form("0","title","",true)).contains("\"status\":\"ok\"")&&pickers==1&&animFormGets==0,"opening picker does not send");
        check(!draftResult(animDraft,5).contains("\"status\":\"ok\"")&&animFormGets==0,"invalid selection does not send");
        ok=draftResult(animDraft,7);
        id=new JSONObject(ok).getString("thisno");
        check(id.matches("[1-9][0-9]{12}")&&BOARD.equals(b.stockThreadId(id))&&anim==1&&upload==1,"default sends and maps thread");
        check(!draftResult(animDraft,7).contains("\"status\":\"ok\"")&&anim==1,"double tap cannot send twice");
        expectedCategory="8";
        result(stock,"animanch",form(null,"title","",true));
        check(anim==1&&draftResult(animDraft,8).contains("\"status\":\"ok\"")&&anim==2&&upload==2,"selection reaches both POSTs");
        expectedCategory="33";
        result(stock,"animanch",form("0","title","",true));
        check(anim==2&&draftResult(animDraft,33).contains("\"status\":\"ok\"")&&anim==3&&upload==3,"another selection reaches both POSTs");
        result(stock,"animanch",form(null,"title","",true));
        animDraft.cancel();
        check(!draftResult(animDraft,7).contains("\"status\":\"ok\"")&&anim==3,"cancelled draft never sends");
        int beforeReply=animFormGets;
        String replyRejected=result(stock,"animanch",form(id,"","8",false));
        check(!replyRejected.contains("\"status\":\"ok\"")&&animFormGets==beforeReply&&anim==3,"reply email behavior unchanged");
        failUpload=true;
        expectedCategory="7";
        result(stock,"animanch",form(null,"title","",true));
        check(!draftResult(animDraft,7).contains("\"status\":\"ok\"")&&anim==4&&upload==4,"partial upload never reports success");
        check(!draftResult(animDraft,7).contains("\"status\":\"ok\"")&&anim==4,"failed draft cannot retry automatically");
        check(!result(stock,"mebuki",form(null,"title","",false)).contains("\"status\":\"ok\"")&&handoffs==0,"Mebuki missing image");
        check(!result(stock,"mebuki",form(null,"title","sage",true)).contains("\"status\":\"ok\"")&&handoffs==0,"Mebuki unsupported mail");
        check(!result(stock,"mebuki",form(null,"title","",true)).contains("\"status\":\"ok\"")&&handoffs==1,"Mebuki handoff is pending, not success");
        check("title".equals(captured.title)&&"fixture".equals(captured.body)&&"image/jpeg".equals(captured.mime)&&Arrays.equals(captured.image,new byte[]{97,98,99}),"Mebuki draft title/body/image");
        check(sessionReads==0,"draft handoff made no outbound request");
        check(MebukiSession.sameAccount("fixture-old","fixture-renewed"),"renewed same account");
        check(!MebukiSession.sameAccount("fixture-old","fixture-other"),"different account");
        check(!MebukiSession.sameAccount("fixture-expired","fixture-renewed"),"expired saved session");
        String fixture=java.nio.file.Files.readString(java.nio.file.Path.of("tests/mebuki-thread-fixture.turbo"));
        String own=fixture.replace("\"id\":\"fixture-op\"","\"id\":\"fixture-op\",\"isAuthor\":true");
        String op="fixture <script>no execution</script>";
        long timestamp=java.time.Instant.parse("2026-11-25T15:00:00Z").toEpochMilli();
        check(MebukiThreadData.convert(own).matchesNewThread(op,timestamp),"authored new OP readback");
        check(!MebukiThreadData.convert(fixture).matchesNewThread(op,timestamp),"not own OP");
        check(!MebukiThreadData.convert(own).matchesNewThread("different",timestamp),"body mismatch");
        check(!MebukiThreadData.convert(own).matchesNewThread(op,timestamp+1),"old thread");
        check(!MebukiThreadData.convert(own.replaceFirst("\\\"attachments\\\":\\[\\{.*?\\}\\]","\"attachments\":[]")).matchesNewThread(op,timestamp),"missing attachment");
        if(args.length==1)java.nio.file.Files.writeString(java.nio.file.Path.of(args[0]),new JSONObject()
                .put("ready",MebukiNewThreadDraft.readyScript()).put("begin",captured.beginScript("fixture-draft"))
                .put("chunk",MebukiNewThreadDraft.chunkScript("fixture-draft","YWJj"))
                .put("finish",captured.finishScript("fixture-draft")).toString());
        check(!result(stock,"aimoge",form("invalid","title","sage",true)).contains("\"status\":\"ok\"")&&aim==2,"invalid reply ID does not create");
        System.out.println("PASS stock new thread: Aimoge credential, fields, image, OP readback; Animanch 32 picker options, default, no send until selection, cancel/double-tap guard, invalid rejection, unchanged replies, precheck, image, readback, partial failure; Mebuki draft handoff without posting; malformed reply rejected. No live network.");
    }
}
